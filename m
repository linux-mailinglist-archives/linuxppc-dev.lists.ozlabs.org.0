Return-Path: <linuxppc-dev+bounces-3627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 898739DF6F5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Dec 2024 20:30:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1cST2MVJz2xbP;
	Mon,  2 Dec 2024 06:30:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733081401;
	cv=none; b=mBxXD8RZBt0j+c7Ayir+2LVIvQJNGBqajF48LNgJfii5BswOhz6/aITD7HupVi8q+6tzXsRi+eCJyynSH5bsAzKan6GQAxfIerYOOpoKRlHVIoQYiFiVHgDwVrXCfaWiNGNkYtMQk2t2AvdjByOUPhWN6aI8nQX/ihNzKew4AvPtzq/8ImKxFsuExZWTMpqrPAvC7Wo2zRcBVd9UeKdST46gmJEHVRE7vbbWcQTNztxU859V8vbDld7y0nXU9U2yk5c1GpszBdvLwMspU5tGOApgoG1OiFcUbijTKRnVUePDRHXriIRgyyLuPCF3FEY6VLqixbHAGClsfgJ+0rseiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733081401; c=relaxed/relaxed;
	bh=ug+81G43dnISkLbg6jEKkZvZdG9HXhHvZWd8Vu0ocs4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VQUvZCcgyGOAZH2Da3TDMuUbLHbDwbNF8o5jLCk+UzyVgCEiEkTb8SPmZ9sNo1c3KS91oM9BDaUdN6J4Ek+eQjOSeoKupdWzfTRdBOwPwoFvGd0Vkph95vE6Hc2q4lNImwneIW74loD5qAq5F9XRPFcmjRPRNva86SIfwk8W4AgeQT91E18dtcTpPt9VEPqC9jnwa7CbUw/Ry8bigIiqZs3jtHz5skeL3V7LEsPJ4A3ZZ+3rxVDENElRs3+A9VqheTv1wa09r7nqHTihrMwOfcXQNkG62rBTI5LBhWn2RfmOKkR1Hdlzf0P7HESleG9tuSRfLAkwOWwzVzN9RlV5TA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DaOMPotv; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DaOMPotv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1cSQ6c09z2xPf
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 06:29:57 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B1CGRp7016242;
	Sun, 1 Dec 2024 19:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ug+81G
	43dnISkLbg6jEKkZvZdG9HXhHvZWd8Vu0ocs4=; b=DaOMPotvFKqZ/GsIRTG5FO
	X0jqt8wz61bidbOHsnNmOKSqIx35DoKWbmCaIw7KEzo54SOGpvueTEOfwGellFeF
	H0ChGly2R7lTv0KjE+kUxG7pq4GZ+Zgdyh2KQydKv01Q5EHM+YdwhdgKcmtVkTYl
	iiaw7WK5TOEq6/AlibyvvDRYqV64xpewTKWprKi55bhO2pGrNWXWIvJfwRHbpxwD
	/MkoDsPrtj0d6Id/1aS64OaJ4UFQlwqXD8l7lx8z21nZvklM8Uy1CGMm8nb0EBew
	dFQNGbuyiOKhoZkIMHRZG4QAoOJijpLUAPaDsg8LlA7rp46lHvKwQYeXRVY8rMpA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 437s4hncnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Dec 2024 19:29:35 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B1JTYBD023361;
	Sun, 1 Dec 2024 19:29:34 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 437s4hncn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Dec 2024 19:29:34 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B1HGxaE012745;
	Sun, 1 Dec 2024 19:29:04 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 438d1s155g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Dec 2024 19:29:04 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B1JT2O712517764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 1 Dec 2024 19:29:02 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF04720043;
	Sun,  1 Dec 2024 19:29:02 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A011B20040;
	Sun,  1 Dec 2024 19:29:00 +0000 (GMT)
Received: from [9.124.210.71] (unknown [9.124.210.71])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  1 Dec 2024 19:29:00 +0000 (GMT)
Message-ID: <abbab9de-bafd-4f40-a52e-07c8f8acc128@linux.ibm.com>
Date: Mon, 2 Dec 2024 00:58:59 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc: Add preempt lazy support
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Luming Yu <luming.yu@shingroup.cn>
Cc: npiggin@gmail.com, maddy@linux.ibm.com, bigeasy@linutronix.de,
        ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org,
        mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
        Thomas Gleixner <tglx@linutronix.de>
References: <20241116192306.88217-1-sshegde@linux.ibm.com>
 <20241116192306.88217-2-sshegde@linux.ibm.com>
 <97991c77-4d9c-4e33-a076-2dd79cd454fb@csgroup.eu>
Content-Language: en-US
In-Reply-To: <97991c77-4d9c-4e33-a076-2dd79cd454fb@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k8rGB5owLKhPA880f-OdP_o_t15JPstq
X-Proofpoint-ORIG-GUID: IiYabAzEM1BEcOD8QjnftRKkUs4pQu-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412010168
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 11/26/24 16:23, Christophe Leroy wrote:
> 
> 
> Le 16/11/2024 à 20:23, Shrikanth Hegde a écrit :
>> Define preempt lazy bit for Powerpc. Use bit 9 which is free and within
>> 16 bit range of NEED_RESCHED, so compiler can issue single andi.
>>
>> Since Powerpc doesn't use the generic entry/exit, add lazy check at exit
>> to user. CONFIG_PREEMPTION is defined for lazy/full/rt so use it for
>> return to kernel.
> 
> FWIW, there is work in progress on using generic entry/exit for powerpc, 
> if you can help testing it that can help, see https:// 
> patchwork.ozlabs.org/project/linuxppc-dev/patch/ 
> F0AE0A4571CE3126+20241111031934.1579-2-luming.yu@shingroup.cn/
>

I gave that series a try. After a lot of manual patching on tip tree and 
removal of multiple definition of regs_irqs_disabled, i was able to 
compile and boot.

I am skimming through the series, but as far as i understand from the 
comments, it needs to be redesigned. I probably get it why. I will go 
through it in more detail to figure out how to do it better. I believe 
the changes have to stem from interrupt_64.S

As far as the bits of this patch with that patch concerned, it is with 
NEED_RESCHED bits. There atleast couple of major issues in that patch 
series that are wrong.

1. It only tries to move exit to user to generic. exit to kernel is not. 
there is generic irqentry_exit that handles it for generic code. powerpc 
exit to kernel still there.

2. Even for exit to user, it ends up calling exit_to_user_mode_loop 
twice for the same syscall. that seems wrong. once in 
interrupt_exit_user_prepare_main and once through 
syscall_exit_to_user_mode in syscall_exit_prepare.


> Christophe
> 

So I guess, when we do eventually if move, this checks would be removed 
at that point along with rest of the code.

> 
>>
>> Ran a few benchmarks and db workload on Power10. Performance is close to
>> preempt=none/voluntary.
>> Since Powerpc systems can have large core count and large memory,
>> preempt lazy is going to be helpful in avoiding soft lockup issues.
>>
>> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> Reviewed-by: Ankur Arora <ankur.a.arora@oracle.com>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   arch/powerpc/Kconfig                   | 1 +
>>   arch/powerpc/include/asm/thread_info.h | 9 ++++++---
>>   arch/powerpc/kernel/interrupt.c        | 4 ++--
>>   3 files changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 8094a01974cc..2f625aecf94b 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -145,6 +145,7 @@ config PPC
>>       select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>>       select ARCH_HAS_PHYS_TO_DMA
>>       select ARCH_HAS_PMEM_API
>> +    select ARCH_HAS_PREEMPT_LAZY
>>       select ARCH_HAS_PTE_DEVMAP        if PPC_BOOK3S_64
>>       select ARCH_HAS_PTE_SPECIAL
>>       select ARCH_HAS_SCALED_CPUTIME        if 
>> VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
>> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/ 
>> include/asm/thread_info.h
>> index 6ebca2996f18..2785c7462ebf 100644
>> --- a/arch/powerpc/include/asm/thread_info.h
>> +++ b/arch/powerpc/include/asm/thread_info.h
>> @@ -103,6 +103,7 @@ void arch_setup_new_exec(void);
>>   #define TIF_PATCH_PENDING    6    /* pending live patching update */
>>   #define TIF_SYSCALL_AUDIT    7    /* syscall auditing active */
>>   #define TIF_SINGLESTEP        8    /* singlestepping active */
>> +#define TIF_NEED_RESCHED_LAZY    9       /* Scheduler driven lazy 
>> preemption */
>>   #define TIF_SECCOMP        10    /* secure computing */
>>   #define TIF_RESTOREALL        11    /* Restore all regs (implies 
>> NOERROR) */
>>   #define TIF_NOERROR        12    /* Force successful syscall return */
>> @@ -122,6 +123,7 @@ void arch_setup_new_exec(void);
>>   #define _TIF_SYSCALL_TRACE    (1<<TIF_SYSCALL_TRACE)
>>   #define _TIF_SIGPENDING        (1<<TIF_SIGPENDING)
>>   #define _TIF_NEED_RESCHED    (1<<TIF_NEED_RESCHED)
>> +#define _TIF_NEED_RESCHED_LAZY    (1<<TIF_NEED_RESCHED_LAZY)
>>   #define _TIF_NOTIFY_SIGNAL    (1<<TIF_NOTIFY_SIGNAL)
>>   #define _TIF_POLLING_NRFLAG    (1<<TIF_POLLING_NRFLAG)
>>   #define _TIF_32BIT        (1<<TIF_32BIT)
>> @@ -142,9 +144,10 @@ void arch_setup_new_exec(void);
>>                    _TIF_SYSCALL_EMU)
>>   #define _TIF_USER_WORK_MASK    (_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
>> -                 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
>> -                 _TIF_RESTORE_TM | _TIF_PATCH_PENDING | \
>> -                 _TIF_NOTIFY_SIGNAL)
>> +                 _TIF_NEED_RESCHED_LAZY | _TIF_NOTIFY_RESUME | \
>> +                 _TIF_UPROBE | _TIF_RESTORE_TM | \
>> +                 _TIF_PATCH_PENDING | _TIF_NOTIFY_SIGNAL)
>> +
>>   #define _TIF_PERSYSCALL_MASK    (_TIF_RESTOREALL|_TIF_NOERROR)
>>   /* Bits in local_flags */
>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/ 
>> interrupt.c
>> index af62ec974b97..8f4acc55407b 100644
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -185,7 +185,7 @@ interrupt_exit_user_prepare_main(unsigned long 
>> ret, struct pt_regs *regs)
>>       ti_flags = read_thread_flags();
>>       while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & 
>> ~_TIF_RESTORE_TM))) {
>>           local_irq_enable();
>> -        if (ti_flags & _TIF_NEED_RESCHED) {



>> +        if (ti_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
>>               schedule();
>>           } else {
>>               /*
>> @@ -396,7 +396,7 @@ notrace unsigned long 
>> interrupt_exit_kernel_prepare(struct pt_regs *regs)
>>           /* Returning to a kernel context with local irqs enabled. */
>>           WARN_ON_ONCE(!(regs->msr & MSR_EE));
>>   again:
>> -        if (IS_ENABLED(CONFIG_PREEMPT)) {
>> +        if (IS_ENABLED(CONFIG_PREEMPTION)) {
>>               /* Return to preemptible kernel context */
>>               if (unlikely(read_thread_flags() & _TIF_NEED_RESCHED)) {
>>                   if (preempt_count() == 0)


