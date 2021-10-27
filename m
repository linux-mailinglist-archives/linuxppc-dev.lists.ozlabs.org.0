Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3977E43C4E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 10:16:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfM2l0tMDz3051
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 19:15:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MKMYT2z6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MKMYT2z6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfM1v61W2z2xF5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 19:15:15 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19R6NiM8010667; 
 Wed, 27 Oct 2021 08:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=REmhyH977aSmduvzyGxYccWFWjTuSZ1JicmOk/oQceU=;
 b=MKMYT2z6MlwPcZHvZSd5i+XWdYQXu3GGx1slmn2CRaDPz4Bzu3sRGEVhSrIpOdEsNin8
 ojkT0fdQ6Opkpq8JF8p9hg6Q/wj4++owaSjPDoEh16iO8Kg4HfJtWjqpkABK2jnUVCZr
 2z9hJmY5LRTy1Y2GW18mtiZ5oCkoHj5M+4SKDdk79G6HNVUXVvIi/5322hH0AXOoUSR6
 DejcbJTrdpw3wsjWVSFRQ1r5t6aoOp3sgSPMJ43Jt+CJhDo6amcZns/9Mm7QCFG7a34M
 iZjar7Ke5PF8WWt0SNkU2ss4ZYz+G2ClZcAbzP4SsSYttlbJvabJ0/Hp30rplXmppc9I 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3by1f8218e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 08:15:05 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19R7eHIs025849;
 Wed, 27 Oct 2021 08:15:05 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3by1f8216t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 08:15:05 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19R8BnFI009930;
 Wed, 27 Oct 2021 08:15:01 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3bx4edvsqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 08:15:00 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19R8Ew8S53477732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 08:14:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0972DAE056;
 Wed, 27 Oct 2021 08:14:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFE69AE045;
 Wed, 27 Oct 2021 08:14:57 +0000 (GMT)
Received: from pomme.local (unknown [9.145.77.240])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Oct 2021 08:14:57 +0000 (GMT)
Subject: Re: [PATCH 1/2] powerpc/watchdog: prevent printk and send IPI while
 holding the wd lock
To: Nicholas Piggin <npiggin@gmail.com>, benh@kernel.crashing.org,
 mpe@ellerman.id.au, paulus@samba.org
References: <20211026162740.16283-1-ldufour@linux.ibm.com>
 <20211026162740.16283-2-ldufour@linux.ibm.com>
 <1635303699.wgz87uxy4c.astroid@bobo.none>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <33e15005-d342-5270-9b9d-64750f8794a7@linux.ibm.com>
Date: Wed, 27 Oct 2021 10:14:57 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1635303699.wgz87uxy4c.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AcoByQLg3K9eWGmLBkq27NYptffJ_uUy
X-Proofpoint-ORIG-GUID: GoL5SOeyY_mqUWxSmD4LKnruQMbJag3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_02,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270048
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

Le 27/10/2021 à 05:29, Nicholas Piggin a écrit :
> Excerpts from Laurent Dufour's message of October 27, 2021 2:27 am:
>> When handling the Watchdog interrupt, long processing should not be done
>> while holding the __wd_smp_lock. This prevents the other CPUs to grab it
>> and to process Watchdog timer interrupts. Furhtermore, this could lead to
>> the following situation:
>>
>> CPU x detect lockup on CPU y and grab the __wd_smp_lock
>>        in watchdog_smp_panic()
>> CPU y caught the watchdog interrupt and try to grab the __wd_smp_lock
>>        in soft_nmi_interrupt()
>> CPU x wait for CPU y to catch the IPI for 1s in __smp_send_nmi_ipi()
> 
> CPU y should get the IPI here if it's a NMI IPI (which will be true for
>> = POWER9 64s).
> 
> That said, not all platforms support it and the console lock problem
> seems real, so okay.
> 
>> CPU x will timeout and so has spent 1s waiting while holding the
>>        __wd_smp_lock.
>>
>> A deadlock may also happen between the __wd_smp_lock and the console_owner
>> 'lock' this way:
>> CPU x grab the console_owner
>> CPU y grab the __wd_smp_lock
>> CPU x catch the watchdog timer interrupt and needs to grab __wd_smp_lock
>> CPU y wants to print something and wait for console_owner
>> -> deadlock
>>
>> Doing all the long processing without holding the _wd_smp_lock prevents
>> these situations.
> 
> The intention was to avoid logs getting garbled e.g., if multiple
> different CPUs fire at once.
> 
> I wonder if instead we could deal with that by protecting the IPI
> sending and printing stuff with a trylock, and if you don't get the
> trylock then just return, and you'll come back with the next timer
> interrupt.

That sounds a bit risky to me, especially on large system when system goes 
wrong, all the CPU may try lock here.
Furthermore, now operation done under the lock protection are quite fast, there 
is no more spinning like the delay loop done when sending an IPI.

Protecting the IPI sending is a nightmare, if the target CPU is later play with 
the lock we are taking during the IPI processing, furthermore, if the target CPU 
is not responding the sending CPU is waiting for 1s, which slows all the system 
due to the lock held.
Since I do a copy of the pending CPU mask and clear it under the lock 
protection, the IPI sending is safe while done without holding the lock.

Regarding the interleaved traces, I don't think this has to be managed down 
here, but rather in the printk/console path.

Cheers,
Laurent.

> 
> Thanks,
> Nick
> 
>>
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/watchdog.c | 31 +++++++++++++++++--------------
>>   1 file changed, 17 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
>> index f9ea0e5357f9..bc7411327066 100644
>> --- a/arch/powerpc/kernel/watchdog.c
>> +++ b/arch/powerpc/kernel/watchdog.c
>> @@ -149,6 +149,8 @@ static void set_cpu_stuck(int cpu, u64 tb)
>>   
>>   static void watchdog_smp_panic(int cpu, u64 tb)
>>   {
>> +	cpumask_t cpus_pending_copy;
>> +	u64 last_reset_tb_copy;
>>   	unsigned long flags;
>>   	int c;
>>   
>> @@ -161,29 +163,32 @@ static void watchdog_smp_panic(int cpu, u64 tb)
>>   	if (cpumask_weight(&wd_smp_cpus_pending) == 0)
>>   		goto out;
>>   
>> +	cpumask_copy(&cpus_pending_copy, &wd_smp_cpus_pending);
>> +	last_reset_tb_copy = wd_smp_last_reset_tb;
>> +
>> +	/* Take the stuck CPUs out of the watch group */
>> +	set_cpumask_stuck(&wd_smp_cpus_pending, tb);
>> +
>> +	wd_smp_unlock(&flags);
>> +
>>   	pr_emerg("CPU %d detected hard LOCKUP on other CPUs %*pbl\n",
>> -		 cpu, cpumask_pr_args(&wd_smp_cpus_pending));
>> +		 cpu, cpumask_pr_args(&cpus_pending_copy));
>>   	pr_emerg("CPU %d TB:%lld, last SMP heartbeat TB:%lld (%lldms ago)\n",
>> -		 cpu, tb, wd_smp_last_reset_tb,
>> -		 tb_to_ns(tb - wd_smp_last_reset_tb) / 1000000);
>> +		 cpu, tb, last_reset_tb_copy,
>> +		 tb_to_ns(tb - last_reset_tb_copy) / 1000000);
>>   
>>   	if (!sysctl_hardlockup_all_cpu_backtrace) {
>>   		/*
>>   		 * Try to trigger the stuck CPUs, unless we are going to
>>   		 * get a backtrace on all of them anyway.
>>   		 */
>> -		for_each_cpu(c, &wd_smp_cpus_pending) {
>> +		for_each_cpu(c, &cpus_pending_copy) {
>>   			if (c == cpu)
>>   				continue;
>>   			smp_send_nmi_ipi(c, wd_lockup_ipi, 1000000);
>>   		}
>>   	}
>>   
>> -	/* Take the stuck CPUs out of the watch group */
>> -	set_cpumask_stuck(&wd_smp_cpus_pending, tb);
>> -
>> -	wd_smp_unlock(&flags);
>> -
>>   	if (sysctl_hardlockup_all_cpu_backtrace)
>>   		trigger_allbutself_cpu_backtrace();
>>   
>> @@ -204,6 +209,8 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
>>   			unsigned long flags;
>>   
>>   			wd_smp_lock(&flags);
>> +			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
>> +			wd_smp_unlock(&flags);
>>   
>>   			pr_emerg("CPU %d became unstuck TB:%lld\n",
>>   				 cpu, tb);
>> @@ -212,9 +219,6 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
>>   				show_regs(regs);
>>   			else
>>   				dump_stack();
>> -
>> -			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
>> -			wd_smp_unlock(&flags);
>>   		}
>>   		return;
>>   	}
>> @@ -267,6 +271,7 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>>   			return 0;
>>   		}
>>   		set_cpu_stuck(cpu, tb);
>> +		wd_smp_unlock(&flags);
>>   
>>   		pr_emerg("CPU %d self-detected hard LOCKUP @ %pS\n",
>>   			 cpu, (void *)regs->nip);
>> @@ -277,8 +282,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>>   		print_irqtrace_events(current);
>>   		show_regs(regs);
>>   
>> -		wd_smp_unlock(&flags);
>> -
>>   		if (sysctl_hardlockup_all_cpu_backtrace)
>>   			trigger_allbutself_cpu_backtrace();
>>   
>> -- 
>> 2.33.1
>>
>>

