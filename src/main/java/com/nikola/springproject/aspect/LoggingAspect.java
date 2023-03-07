package com.nikola.springproject.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {
    @Pointcut("execution(* com.nikola.springproject.dao.*.*(..))")
    private void forDaoPackage(){

    }

    @Pointcut("execution(* com.nikola.springproject.entity.*.get*(..))")
    private void forGetterEntity(){

    }

    @Before("forDaoPackage()")
    private void forDaoPackage_forGetterEntity(){
        System.out.println("====> Executing before");
    }

}
