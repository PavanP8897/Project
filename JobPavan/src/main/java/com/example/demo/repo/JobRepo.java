package com.example.demo.repo;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.example.demo.model.JobPost;

@Repository
public class JobRepo {
    private List<JobPost> jobs;

    public JobRepo() {
        jobs = new ArrayList<>();
        jobs.add(new JobPost(1, "Frontend Developer", "Experience in building responsive web applications using React", 3, List.of("HTML", "CSS", "JavaScript", "React")));
        jobs.add(new JobPost(2, "Data Scientist", "Strong background in machine learning and data analysis", 4, List.of("Python", "Machine Learning", "Data Analysis")));
        jobs.add(new JobPost(3, "Network Engineer", "Design and implement computer networks for efficient data communication", 5, List.of("Networking", "Cisco", "Routing", "Switching")));
        jobs.add(new JobPost(4, "Mobile App Developer", "Experience in mobile app development for iOS and Android", 3, List.of("iOS Development", "Android Development", "Mobile App")));
    }

    // Method to return all JobPosts
    public List<JobPost> returnAllJobPosts() {
        return jobs;
    }

    // Method to save a job post object into the list
    public void addJobPost(JobPost job) {
        jobs.add(job);
    }
}
