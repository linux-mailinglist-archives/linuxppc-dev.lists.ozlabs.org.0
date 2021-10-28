Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEEC43E567
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 17:46:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg90X6Ppbz3bZj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 02:46:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AvXDxxE8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AvXDxxE8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg8zj4tdKz2yL7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 02:46:08 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SFIHvH014887; 
 Thu, 28 Oct 2021 15:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Uv5PmT5W2EISBvu6fLxF9SM5HT2edUDp43FJS0nWPKk=;
 b=AvXDxxE8tJF03Ey4AqGfFUYNay3Y+BGvqnc2rcw9bpywWHu/dOCQ3Aq5KPYTD/x1nVb5
 UfcNnuz0VwV9s5fw6Pi0uGSDWns7qOCaiHb65hepTUXVpcqyECZGUdCFSjYTvXI0KUfO
 udpuMg3aOI+Ybr0PYZOW4MzF/IZdYWKcZGcyZ8OJUpidZZ+NAKpgqH9waYGGJgKxD8+c
 LMGBg8dTJrM5DTN0SRzkw37SylHLDY+MaIQ8kPRY0AIS1owDcAE2zz+llSoSk4PaYBgt
 r6FcwgEdsTN1y4k8zNLVmLOILbm5q902yB0RNv9dp+uXpztbSLfiBaoFlOy6l6oOOsEJ lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3byxckgjq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 15:46:01 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19SFLLAw028224;
 Thu, 28 Oct 2021 15:45:59 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3byxckgjp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 15:45:59 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19SFXYJE016846;
 Thu, 28 Oct 2021 15:45:57 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3bx4f817n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 15:45:57 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19SFjrCq38273322
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 15:45:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EA88A405B;
 Thu, 28 Oct 2021 15:45:53 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BECA2A4068;
 Thu, 28 Oct 2021 15:45:52 +0000 (GMT)
Received: from pomme.local (unknown [9.145.2.240])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Oct 2021 15:45:52 +0000 (GMT)
Subject: Re: [PATCH 1/2] powerpc/watchdog: prevent printk and send IPI while
 holding the wd lock
To: Nicholas Piggin <npiggin@gmail.com>, benh@kernel.crashing.org,
 mpe@ellerman.id.au, paulus@samba.org
References: <20211026162740.16283-1-ldufour@linux.ibm.com>
 <20211026162740.16283-2-ldufour@linux.ibm.com>
 <1635303699.wgz87uxy4c.astroid@bobo.none>
 <1635327848.ktks46hzts.astroid@bobo.none>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <1d3aabfc-d293-6589-4cb6-1a199e96706a@linux.ibm.com>
Date: Thu, 28 Oct 2021 17:45:52 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1635327848.ktks46hzts.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l5tk9ca0DizRutHw5xUmuHlM-OqHMBrz
X-Proofpoint-ORIG-GUID: wjMRnxKI0iHbzOJh1HRVkrNmIsoUqCRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_04,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280087
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 27/10/2021 à 11:49, Nicholas Piggin a écrit :
> Excerpts from Nicholas Piggin's message of October 27, 2021 1:29 pm:
>> Excerpts from Laurent Dufour's message of October 27, 2021 2:27 am:
>>> When handling the Watchdog interrupt, long processing should not be done
>>> while holding the __wd_smp_lock. This prevents the other CPUs to grab it
>>> and to process Watchdog timer interrupts. Furhtermore, this could lead to
>>> the following situation:
>>>
>>> CPU x detect lockup on CPU y and grab the __wd_smp_lock
>>>        in watchdog_smp_panic()
>>> CPU y caught the watchdog interrupt and try to grab the __wd_smp_lock
>>>        in soft_nmi_interrupt()
>>> CPU x wait for CPU y to catch the IPI for 1s in __smp_send_nmi_ipi()
>>
>> CPU y should get the IPI here if it's a NMI IPI (which will be true for
>>> = POWER9 64s).
>>
>> That said, not all platforms support it and the console lock problem
>> seems real, so okay.
>>
>>> CPU x will timeout and so has spent 1s waiting while holding the
>>>        __wd_smp_lock.
>>>
>>> A deadlock may also happen between the __wd_smp_lock and the console_owner
>>> 'lock' this way:
>>> CPU x grab the console_owner
>>> CPU y grab the __wd_smp_lock
>>> CPU x catch the watchdog timer interrupt and needs to grab __wd_smp_lock
>>> CPU y wants to print something and wait for console_owner
>>> -> deadlock
>>>
>>> Doing all the long processing without holding the _wd_smp_lock prevents
>>> these situations.
>>
>> The intention was to avoid logs getting garbled e.g., if multiple
>> different CPUs fire at once.
>>
>> I wonder if instead we could deal with that by protecting the IPI
>> sending and printing stuff with a trylock, and if you don't get the
>> trylock then just return, and you'll come back with the next timer
>> interrupt.
> 
> Something like this (untested) should basically hold off concurrency on
> watchdog panics. It does not serialize output from IPI targets but it
> should prevent multiple CPUs trying to send IPIs at once, without
> holding the lock.

Got it, I'll work this way, despite the minor comments below.

> 
> ---
> 
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index 2ffeb3f8b5a7..3a0db577da56 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -85,6 +85,7 @@ static DEFINE_PER_CPU(u64, wd_timer_tb);
>   
>   /* SMP checker bits */
>   static unsigned long __wd_smp_lock;
> +static unsigned long __wd_printing;
>   static cpumask_t wd_smp_cpus_pending;
>   static cpumask_t wd_smp_cpus_stuck;
>   static u64 wd_smp_last_reset_tb;
> @@ -131,10 +132,10 @@ static void wd_lockup_ipi(struct pt_regs *regs)
>   	/* Do not panic from here because that can recurse into NMI IPI layer */
>   }
>   
> -static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
> +static void set_cpu_stuck(int cpu, u64 tb)
>   {
> -	cpumask_or(&wd_smp_cpus_stuck, &wd_smp_cpus_stuck, cpumask);
> -	cpumask_andnot(&wd_smp_cpus_pending, &wd_smp_cpus_pending, cpumask);
> +	cpumask_set_cpu(cpu, &wd_smp_cpus_stuck);
> +	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
>   	if (cpumask_empty(&wd_smp_cpus_pending)) {
>   		wd_smp_last_reset_tb = tb;
>   		cpumask_andnot(&wd_smp_cpus_pending,
> @@ -142,10 +143,6 @@ static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
>   				&wd_smp_cpus_stuck);
>   	}
>   }
> -static void set_cpu_stuck(int cpu, u64 tb)
> -{
> -	set_cpumask_stuck(cpumask_of(cpu), tb);
> -}
>   
>   static void watchdog_smp_panic(int cpu, u64 tb)
>   {
> @@ -160,6 +157,10 @@ static void watchdog_smp_panic(int cpu, u64 tb)
>   		goto out;
>   	if (cpumask_weight(&wd_smp_cpus_pending) == 0)
>   		goto out;
> +	if (__wd_printing)
> +		goto out;
> +	__wd_printing = 1;
> +	wd_smp_unlock(&flags);
>   
>   	pr_emerg("CPU %d detected hard LOCKUP on other CPUs %*pbl\n",
>   		 cpu, cpumask_pr_args(&wd_smp_cpus_pending));
> @@ -172,24 +173,31 @@ static void watchdog_smp_panic(int cpu, u64 tb)
>   		 * Try to trigger the stuck CPUs, unless we are going to
>   		 * get a backtrace on all of them anyway.
>   		 */
> -		for_each_cpu(c, &wd_smp_cpus_pending) {
> +		for_each_online_cpu(c) {
>   			if (c == cpu)
>   				continue;
> +			if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending))
> +				continue;
> +			wd_smp_lock(&flags);
> +			if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending)) {
> +				wd_smp_unlock(&flags);
> +				continue;
> +			}
> +			/* Take the stuck CPU out of the watch group */
> +			set_cpu_stuck(cpu, tb);
> +			wd_smp_unlock(&flags);
> +
>   			smp_send_nmi_ipi(c, wd_lockup_ipi, 1000000);
>   		}
>   	}
>   
> -	/* Take the stuck CPUs out of the watch group */
> -	set_cpumask_stuck(&wd_smp_cpus_pending, tb);
> -
> -	wd_smp_unlock(&flags);
> -
>   	if (sysctl_hardlockup_all_cpu_backtrace)
>   		trigger_allbutself_cpu_backtrace();
>   
>   	if (hardlockup_panic)
>   		nmi_panic(NULL, "Hard LOCKUP");
>   
> +	__wd_printing = 0;

I think WRITE_ONCE() is required here, to prevent any compiler trick.
Also, I think it might be safer (I don't have clear example in mind, just a bad 
feeling) to do so before the check of hardlockup_panic and the call to panic.

>   	return;
>   
>   out:
> @@ -204,8 +212,6 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
>   		if (unlikely(cpumask_test_cpu(cpu, &wd_smp_cpus_stuck))) {
>   			struct pt_regs *regs = get_irq_regs();
>   
> -			wd_smp_lock(&flags);
> -
>   			pr_emerg("CPU %d became unstuck TB:%lld\n",
>   				 cpu, tb);
>   			print_irqtrace_events(current);
> @@ -214,6 +220,7 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
>   			else
>   				dump_stack();
>   
> +			wd_smp_lock(&flags);
>   			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
>   			wd_smp_unlock(&flags);
>   		}
> @@ -263,8 +270,16 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>   			wd_smp_unlock(&flags);
>   			return 0;
>   		}
> +		if (__wd_printing) {
> +			wd_smp_unlock(&flags);
> +			return 0;

Here the CPU is not flagged as stuck and nothing is printed. We have to wait for 
the next soft_nmi_interrupt() to happen for this CPU to detect itself stuck and 
provide the backstack. Depending on the number of CPU and the stress on the 
system, this CPU may net see __wd_printing=0 when entering soft_nmi_interrupt() 
until a long period of time.
I think we should introduce a per CPU counter, when that counter reach a limit 
(let's say 10), the CPU is not taking care of __wd_printing and continue it's 
processing.

> +		} > +		__wd_printing = 1;
> +
>   		set_cpu_stuck(cpu, tb);
>   
> +		wd_smp_unlock(&flags);
> +
>   		pr_emerg("CPU %d self-detected hard LOCKUP @ %pS\n",
>   			 cpu, (void *)regs->nip);
>   		pr_emerg("CPU %d TB:%lld, last heartbeat TB:%lld (%lldms ago)\n",
> @@ -274,13 +289,13 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>   		print_irqtrace_events(current);
>   		show_regs(regs);
>   
> -		wd_smp_unlock(&flags);
> -
>   		if (sysctl_hardlockup_all_cpu_backtrace)
>   			trigger_allbutself_cpu_backtrace();
>   
>   		if (hardlockup_panic)
>   			nmi_panic(regs, "Hard LOCKUP");
> +
> +		__wd_printing = 0;

I think WRITE_ONCE() is required here, to prevent any compiler trick.

>   	}
>   	if (wd_panic_timeout_tb < 0x7fffffff)
>   		mtspr(SPRN_DEC, wd_panic_timeout_tb);
> 

