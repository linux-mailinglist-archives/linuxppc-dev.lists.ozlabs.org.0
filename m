Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 418915322E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 08:13:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6kQL0QFnz2yp5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 16:12:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pV47uRyr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pV47uRyr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6kPb1673z2yMj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 16:12:18 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24O5vhLs004548
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 06:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=PXX8HPmJ5XvAKnbmTDYgtp7sDZrRnmDA6h4jEOXMe+o=;
 b=pV47uRyrJhAU9QAfM7IUurnbPq4ayWzteJ3har8x4kBFSYwFOFTzz86tCSD7P7GVPNSj
 MGzC/hqN2mBCkd1N5Ekam3UG65jc0MaDny+sFUUVhvC/61+kECNenId53RTR0Z6qWChO
 mptp1eGs1l+dHoeMnj+Te78vR+mM8Umha4xr3/QzI3V3Wszq6inHdW6J5gILb2qS5pxE
 jrmzIO+s0XAN5tQPeKAvIwQDZCQAwpUdZMZyWJ+tyLquBbHgRyWxOjrkd7BvvaJVbuQV
 thbSH1udCYy77pzr9nNyVtcLYl77nQ4+iijK0hqkrimfba07SJSYI0w31h49d362hsPC pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8sp588v4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 06:12:15 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24O5wKKW005371
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 06:12:15 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8sp588uf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 06:12:14 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24O67DSp030720;
 Tue, 24 May 2022 06:12:13 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3g6qq8v921-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 06:12:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24O6BLw726935668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 06:11:21 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4E615204F;
 Tue, 24 May 2022 06:12:09 +0000 (GMT)
Received: from [9.211.81.74] (unknown [9.211.81.74])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D2CF15204E;
 Tue, 24 May 2022 06:12:07 +0000 (GMT)
Message-ID: <1c95a54a-e96d-1b70-e9fb-6dbba9c7ce98@linux.ibm.com>
Date: Tue, 24 May 2022 11:42:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] powerpc/crash: save cpu register data in
 crash_smp_send_stop()
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20220506163933.391981-1-hbathini@linux.ibm.com>
 <1652171381.tcl5f5aq9f.astroid@bobo.none>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <1652171381.tcl5f5aq9f.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VGddk2yoQ2qdlekIt8ZwUk8Nco-s7BLc
X-Proofpoint-GUID: 88u3F2MfebY26ywI4Lwe9wLmHa7mIQPL
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-24_01,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205240035
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
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

Thanks for the review..

On 10/05/22 2:31 pm, Nicholas Piggin wrote:
> Excerpts from Hari Bathini's message of May 7, 2022 2:39 am:
>> Capture register data for secondary CPUs in crash_smp_send_stop()
>> instead of doing it much later in crash_kexec_prepare_cpus() function
>> with another set of NMI IPIs to secondary CPUs. This change avoids
>> unnecessarily tricky post processing of data to get the right
>> backtrace for these CPUs.
> 
> Is the tricky post processing done in crash tools?

Yeah. In tools like crash-utility that try to make sense of the
register data captured.


> Is it buggy in
> some situations or just fragile code you want to deprecate? Seems
> like a good goal either way


The post processing may need looking up the emergency stack and
eventually tracing back to the regular stack. No code in crash-utility
to handle it currently though. This meant no proper backtrace, with 
crash-utility, for only cases like "crash_kexec_post_notifiers". But
default cases will start having improper backtraces as well with
series [0] moving around crash_smp_send_stop().

> I assume the desire to stop secondaries ASAP is not just to get
> register data but also to limit the amount of damage they might
> cause to the crash process. Can they take interrupts or trigger
> the hard lockup watchdog, for example?

True. Intention is to stop secondaries ASAP and make dump capture
as smooth as possible...

>> -void crash_smp_send_stop(void)
>> -{
>> -	static bool stopped = false;
>> -
>> -	/*
>> -	 * In case of fadump, register data for all CPUs is captured by f/w
>> -	 * on ibm,os-term rtas call. Skip IPI callbacks to other CPUs before
>> -	 * this rtas call to avoid tricky post processing of those CPUs'
>> -	 * backtraces.
>> -	 */
>> -	if (should_fadump_crash())
>> -		return;
> 
> This is not actually code you changed, but I wonder if it's wrong,
> if fadump is enabled then panic runs without stopping secondaries?
> Doesn't seem quite right.

So far, haven't seen any problem. F/W seems to handle it alright
without having to stop the secondaries before the ibm,os-term call.
But I do agree that stopping secondaries before calling into rtas sounds
like the right thing to do, even if that meant processing more than one
stack to get the proper backtrace..

>> -
>> -	if (stopped)
>> -		return;
>> -
>> -	stopped = true;
>> -
>> -#ifdef CONFIG_NMI_IPI
>> -	smp_send_nmi_ipi(NMI_IPI_ALL_OTHERS, crash_stop_this_cpu, 1000000);
>> -#else
>> -	smp_call_function(crash_stop_this_cpu, NULL, 0);
>> -#endif /* CONFIG_NMI_IPI */
>> -}
> 
> Now if kexec is not configured do we lose our crash_smp_send_stop
> function, or is it only ever called if kexec is enabled?

crash_smp_send_stop() is proposed to be called for both kdump and
non-kdump cases as well with [1].

>> -
>>   #ifdef CONFIG_NMI_IPI
>>   static void nmi_stop_this_cpu(struct pt_regs *regs)
>>   {
>> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
>> index 22ceeeb705ab..f06dfe71caca 100644
>> --- a/arch/powerpc/kexec/crash.c
>> +++ b/arch/powerpc/kexec/crash.c
>> @@ -25,6 +25,7 @@
>>   #include <asm/setjmp.h>
>>   #include <asm/debug.h>
>>   #include <asm/interrupt.h>
>> +#include <asm/fadump.h>
>>   
>>   /*
>>    * The primary CPU waits a while for all secondary CPUs to enter. This is to
>> @@ -102,7 +103,7 @@ void crash_ipi_callback(struct pt_regs *regs)
>>   	/* NOTREACHED */
>>   }
>>   
>> -static void crash_kexec_prepare_cpus(int cpu)
>> +static void crash_kexec_prepare_cpus(void)
>>   {
>>   	unsigned int msecs;
>>   	volatile unsigned int ncpus = num_online_cpus() - 1;/* Excluding the panic cpu */
>> @@ -203,7 +204,7 @@ void crash_kexec_secondary(struct pt_regs *regs)
>>   
>>   #else	/* ! CONFIG_SMP */
>>   
>> -static void crash_kexec_prepare_cpus(int cpu)
>> +static void crash_kexec_prepare_cpus(void)
>>   {
>>   	/*
>>   	 * move the secondaries to us so that we can copy
>> @@ -249,6 +250,42 @@ static void __maybe_unused crash_kexec_wait_realmode(int cpu)
>>   static inline void crash_kexec_wait_realmode(int cpu) {}
>>   #endif	/* CONFIG_SMP && CONFIG_PPC64 */
>>   
>> +void crash_smp_send_stop(void)
>> +{
>> +	static int cpus_stopped;
>> +
>> +	/*
>> +	 * In case of fadump, register data for all CPUs is captured by f/w
>> +	 * on ibm,os-term rtas call. Skip IPI callbacks to other CPUs before
>> +	 * this rtas call to avoid tricky post processing of those CPUs'
>> +	 * backtraces.
>> +	 */
>> +	if (should_fadump_crash())
>> +		return;
>> +
>> +	if (cpus_stopped)
>> +		return;
>> +
>> +	cpus_stopped = 1;
>> +
>> +	/* Avoid hardlocking with irresponsive CPU holding logbuf_lock */
>> +	printk_deferred_enter();
>> +
>> +	/*
>> +	 * This function is only called after the system
>> +	 * has panicked or is otherwise in a critical state.
>> +	 * The minimum amount of code to allow a kexec'd kernel
>> +	 * to run successfully needs to happen here.
>> +	 *
>> +	 * In practice this means stopping other cpus in
>> +	 * an SMP system.
>> +	 * The kernel is broken so disable interrupts.
>> +	 */
>> +	hard_irq_disable();
>> +
>> +	crash_kexec_prepare_cpus();
> 
> This seems to move a bit of the kexec code around so this runs
> before notifiers in the panic path now. Maybe that's okay, I don't
> know this code too well, but how feasible would it be to have
> crash_stop_this_cpu() call crash_save_cpu()? And keeping the
> second IPI.

Yeah. With the series [0] being proposed, it makes sense to move
crash_save_cpu() call to crash_stop_this_cpu() itself.

> I do like the idea of removing the second IPI if possible, but
> that could be done later by moving the logic into crash_save_cpu()
> (it could just poll on a flag until the primary releases it to
> the next phase, rather than have the primary send another IPI).

Also, polling for flag in crash_stop_this_cpu()/crash_save_cpu()
and avoiding the second IPI sounds right. Will work on it.

Sorry about the delay in response. I lost track of this one.

Thanks
Hari

[0] 
https://lore.kernel.org/linuxppc-dev/20220427224924.592546-1-gpiccoli@igalia.com/
[1] 
https://lore.kernel.org/linuxppc-dev/20220427224924.592546-25-gpiccoli@igalia.com/
