Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B61743FC0F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 14:10:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hgh8V0vwzz3c9V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 23:10:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SvZfeDpd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SvZfeDpd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hgh7k33yQz2yRX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 23:09:53 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19TAN19a030866
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 12:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4rhLYIQm1qjQi/xho3RVYnzt3dh0lbqFZ87IpaUCr0g=;
 b=SvZfeDpdmT5dEImPnLg8HZCWofOzTnU+JdzwE3SoCHGgHEAdosIndATbXuG2OSCZwYOm
 Kbx6o4TsR7toYgbNB8xX2dmpblzs/xEEdJxtrsAAzfVAUDEu4I7/SpdAC0WW/pu6iz7s
 qpxDYfdMmjVV/R2+7BeLKOZWOXdEuqAyvAfLmMlSuoaZTTrkSMhvstB1e1Bvxh5kCPZV
 DB2UEXHr329iCH9xjFDIrk7271eLYri4Ntp8AFTP3fTv3Ohk2xru9fGrSnw0b+ei8qqj
 VsDcJBgPXrJ6zDkxZCpVxyEyPoU5d8g3x6NZZdZMTu41SOtwfLGlQSlGFAItuIm9G3av EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c0f5et090-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 12:09:48 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19TBi7Li011625
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 12:09:48 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c0f5et08h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Oct 2021 12:09:48 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19TC964w009077;
 Fri, 29 Oct 2021 12:09:46 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3bx4f22ra2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Oct 2021 12:09:46 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 19TC3WKt59900256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 12:03:32 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2354C42049;
 Fri, 29 Oct 2021 12:09:44 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00D1742041;
 Fri, 29 Oct 2021 12:09:44 +0000 (GMT)
Received: from pomme.local (unknown [9.145.154.66])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Oct 2021 12:09:43 +0000 (GMT)
Subject: Re: [PATCH 2/2] powerpc/watchdog: Avoid holding wd_smp_lock over
 printk and smp_send_nmi_ipi
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211029083908.87931-1-npiggin@gmail.com>
 <20211029083908.87931-2-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <ee3c5caa-472b-45e9-aa5b-51f56438675b@linux.ibm.com>
Date: Fri, 29 Oct 2021 14:09:43 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211029083908.87931-2-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iBUgmzjZmTmTzW8Xns95PQ5scPdN09qt
X-Proofpoint-ORIG-GUID: W5lg6lvhqcesGoO3HyIsUTx966aVHYYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-29_02,2021-10-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110290071
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 29/10/2021 à 10:39, Nicholas Piggin a écrit :
> There is a deadlock with the console_owner lock and the wd_smp_lock:
> 
> CPU x takes the console_owner lock
> CPU y takes a watchdog timer interrupt and takes __wd_smp_lock
> CPU x takes a watchdog timer interrupt and spins on __wd_smp_lock
> CPU y detects a deadlock, tries to print something and spins on console_owner
> -> deadlock
> 
> Change the watchdog locking scheme so wd_smp_lock protects the watchdog
> internal data, but "reporting" (printing, issuing NMI IPIs, taking any
> action outside of watchdog) uses a non-waiting exclusion. If a CPU detects
> a problem but can not take the reporting lock, it just returns because
> something else is already reporting. It will try again at some point.
> 
> Typically hard lockup watchdog report usefulness is not impacted due to
> failure to spewing a large enough amount of data in as short a time as
> possible, but by messages getting garbled.
> 
> Laurent debugged this and found the deadlock, and this patch is based on
> his general approach to avoid expensive operations while holding the lock.
> With the addition of the reporting exclusion.
> 
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> [np: rework to add reporting exclusion update changelog]
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kernel/watchdog.c | 76 ++++++++++++++++++++++++++--------
>   1 file changed, 59 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index 4bb7c8e371a2..69a475aa0f44 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -85,10 +85,32 @@ static DEFINE_PER_CPU(u64, wd_timer_tb);
>   
>   /* SMP checker bits */
>   static unsigned long __wd_smp_lock;
> +static unsigned long __wd_reporting;
>   static cpumask_t wd_smp_cpus_pending;
>   static cpumask_t wd_smp_cpus_stuck;
>   static u64 wd_smp_last_reset_tb;
>   
> +/*
> + * Try to take the exclusive watchdog action / NMI IPI / printing lock.
> + * wd_smp_lock must be held. If this fails, we should return and wait
> + * for the watchdog to kick in again (or another CPU to trigger it).
> + */
> +static bool wd_try_report(void)
> +{
> +	if (__wd_reporting)
> +		return false;
> +	__wd_reporting = 1;
> +	return true;
> +}
> +
> +/* End printing after successful wd_try_report. wd_smp_lock not required. */
> +static void wd_end_reporting(void)
> +{
> +	smp_mb(); /* End printing "critical section" */
> +	WARN_ON_ONCE(__wd_reporting == 0);
> +	WRITE_ONCE(__wd_reporting, 0);
> +}
> +
>   static inline void wd_smp_lock(unsigned long *flags)
>   {
>   	/*
> @@ -131,10 +153,10 @@ static void wd_lockup_ipi(struct pt_regs *regs)
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
> @@ -142,10 +164,6 @@ static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
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
> @@ -160,6 +178,9 @@ static void watchdog_smp_panic(int cpu, u64 tb)
>   		goto out;
>   	if (cpumask_weight(&wd_smp_cpus_pending) == 0)
>   		goto out;
> +	if (!wd_try_report())
> +		goto out;
> +	wd_smp_unlock(&flags);
>   
>   	pr_emerg("CPU %d detected hard LOCKUP on other CPUs %*pbl\n",
>   		 cpu, cpumask_pr_args(&wd_smp_cpus_pending));
> @@ -172,24 +193,32 @@ static void watchdog_smp_panic(int cpu, u64 tb)
>   		 * Try to trigger the stuck CPUs, unless we are going to
>   		 * get a backtrace on all of them anyway.
>   		 */
> -		for_each_cpu(c, &wd_smp_cpus_pending) {
> +		for_each_online_cpu(c) {
>   			if (c == cpu)
>   				continue;
> +			if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending))
                                               ^ c
cpu is the reporting CPU, c is the target here.

> +				continue;
> +			wd_smp_lock(&flags);
> +			if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending)) {
                                               ^ again c
> +				wd_smp_unlock(&flags);
> +				continue;
> +			}
> +			/* Take the stuck CPU out of the watch group */
> +			set_cpu_stuck(cpu, tb);
                                       ^ c
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
> +	wd_end_reporting();
> +
>   	return;
>   
>   out:
> @@ -203,8 +232,6 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
>   			struct pt_regs *regs = get_irq_regs();
>   			unsigned long flags;
>   
> -			wd_smp_lock(&flags);
> -
>   			pr_emerg("CPU %d became unstuck TB:%lld\n",
>   				 cpu, tb);
>   			print_irqtrace_events(current);
> @@ -213,6 +240,7 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
>   			else
>   				dump_stack();
>   
> +			wd_smp_lock(&flags);
>   			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
>   			wd_smp_unlock(&flags);
>   		} else {
> @@ -291,8 +319,17 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>   			wd_smp_unlock(&flags);
>   			return 0;
>   		}
> +		if (!wd_try_report()) {
> +			wd_smp_unlock(&flags);
> +			/* Couldn't report, try again in 100ms */
> +			mtspr(SPRN_DEC, 100 * tb_ticks_per_usec * 1000);
> +			return 0;
> +		}
> +
>   		set_cpu_stuck(cpu, tb);
>   
> +		wd_smp_unlock(&flags);
> +
>   		pr_emerg("CPU %d self-detected hard LOCKUP @ %pS\n",
>   			 cpu, (void *)regs->nip);
>   		pr_emerg("CPU %d TB:%lld, last heartbeat TB:%lld (%lldms ago)\n",
> @@ -302,14 +339,19 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
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
> +		wd_end_reporting();
>   	}
> +	/*
> +	 * We are okay to change DEC in soft_nmi_interrupt because the masked
> +	 * handler has marked a DEC as pending, so the timer interrupt will be
> +	 * replayed as soon as local irqs are enabled again.
> +	 */
>   	if (wd_panic_timeout_tb < 0x7fffffff)
>   		mtspr(SPRN_DEC, wd_panic_timeout_tb);
>   
> 

