package HVL.Scheduler;

import java.util.ArrayDeque;
import java.util.List;
import java.util.Optional;
import java.util.Queue;

public class NSJFScheduler implements Scheduler {

    private Queue<Task> ready;
    private Task selected;

    NSJFScheduler() {
        this.ready = new ArrayDeque<>();
    }

    @Override
    public Optional<Integer> scheduled() {
        if(selected == null) return Optional.empty();
        return Optional.of(selected.getId());
    }

    @Override
    public List<Integer> ready() {
        return ready.stream().map(Task::getId).toList();
    }
  
    @Override
    public void addTask(Task task) {
        ready.add(task);
        List<Task> sortedList = ready.stream()
            .sorted((t1,t2) -> Integer.compare(t1.getSize(), t2.getSize()))
            .toList();
            
        ready.clear();
        ready.addAll(sortedList);
   }

    @Override
    public void schedule() {
        if(selected == null) {                
            selected = ready.poll();          
            if(selected == null) {            
                return;                       
            }                                 
            selected.start();                 
        } else {
            if (selected.isDone()) {
                selected = ready.poll();
            }
            if (selected != null) {
                selected.start();
            }
        }                                    
    }
}
