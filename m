Return-Path: <linuxppc-dev+bounces-12269-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61572B58CC6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 06:22:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQpdS23jmz30MY;
	Tue, 16 Sep 2025 14:22:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757996243;
	cv=none; b=d3pC6I1db+UNe33NT/utsrTaojg2HJWi5KgBEHdc7bcljwVSmLBI6QeiwJQJcTWmcA5R9GBCvYAriE51jBYVtnqIX1W6LE3cIgW+MDqC1jF42HE4sBGkR4VqVFZ4t8hWfAZBkQME62FBbzXCWgyXRxjOSiuS/eRJyc3v6wkr6KpafSvK8M3TBmeyjEdEclCZI9tkj2xCddd5O3mD+XEXCWcL8Qv0s1O6103khCDrCth1O7O/+u1QMwh5UaI3fdytu5hQYy1JEivThwv234eqNLC7lwqaO8owZA6tJbDfMtHzFZ9j7F/5ip7anhHmTOdYxBLdIeHr2dFSYGuIRRTomg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757996243; c=relaxed/relaxed;
	bh=9R5+TokOITBvk98cbHYOySPfX7rkCd9IraMNRjs/Hnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jpIuKs0A+dBufVfs+KRFWS9t9/pc0RooLPL5fVuweuNjecvC6JkOBzgGDIzQuunKAxT6FFmMf1z9lBBGMTYQg1OUP9sNiSVVFBnjLU/s5lVGDg5rI5TFutTRiiuTr5TTYYIXfdkhmIqEUimnrOA3y9YjjXhjcg6C2lCnUd/vsRPxVmQLsd3TbB34W2qnRjaoBaA5/j/vPNdOqCOEoqLtjxpZBSZC7ZnV1BFAv1GoqZuWXFX5J6rb9/rsghjE8fA3QTvmll/jydDHVuAL40qUqRNSxt2PlQb+RoYt+A5PVJij7MNG5vJfrgWv++HuOo6ObHVh6fv+k3ozpw2UGSyYgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d8ZxXs9j; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d8ZxXs9j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQpX242FMz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 14:17:21 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G2XSfQ011670;
	Tue, 16 Sep 2025 04:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9R5+To
	kOITBvk98cbHYOySPfX7rkCd9IraMNRjs/Hnc=; b=d8ZxXs9jKbdl5QcL/fC50U
	s5951UV8osjrcElglEBV02OoAl25K22AIVYWPLzhBNo/Dsqx8wdEkiBfj4M6yged
	oILODGfEwJpOoNf4L0U/TsIacebOE9sT8lP9G/Rw+Aj5cumxy+6tcZ4nFEUBU5S8
	OIUlawo2CXsC4/vJEv7I8wXl2J4oqMXyvHGSPnuU91jp0IR1lQDhazeRHnNFl0oF
	pMOmFeyCWSUumX+OTBrvIHPnivBH4p3s0GFL8sjLrR8RtML4Au6dtyLBkfqEUJik
	BTmwBGEMEyLLqM+PVjqMvicfr9YFnIkf0jFExtYe34rDLswfeScdYrnBeOM4GfqQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494y1x623r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:16:40 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58G4FI7q013692;
	Tue, 16 Sep 2025 04:16:39 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494y1x623k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:16:39 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58G2Anx4029536;
	Tue, 16 Sep 2025 04:16:38 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kb0t5er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:16:38 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58G4GWK952822426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Sep 2025 04:16:34 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5C1F20049;
	Tue, 16 Sep 2025 04:16:32 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08C0120040;
	Tue, 16 Sep 2025 04:16:25 +0000 (GMT)
Received: from [9.39.20.171] (unknown [9.39.20.171])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 Sep 2025 04:16:24 +0000 (GMT)
Message-ID: <e7012ea8-5294-492c-94f8-fd2a81789d2f@linux.ibm.com>
Date: Tue, 16 Sep 2025 09:46:23 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 2/8] powerpc: Prepare to build with generic entry/exit
 framework
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
        Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, deller@gmx.de, ldv@strace.io,
        macro@orcam.me.uk, charlie@rivosinc.com, akpm@linux-foundation.org,
        bigeasy@linutronix.de, ankur.a.arora@oracle.com, naveen@kernel.org,
        thomas.weissschuh@linutronix.de, Jason@zx2c4.com, peterz@infradead.org,
        tglx@linutronix.de, namcao@linutronix.de, kan.liang@linux.intel.com,
        mingo@kernel.org, oliver.upton@linux.dev, mark.barnett@arm.com,
        atrajeev@linux.vnet.ibm.com, rppt@kernel.org, coltonlewis@google.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250908210235.137300-2-mchauras@linux.ibm.com>
 <20250908210235.137300-4-mchauras@linux.ibm.com>
 <b347f6e2-26c0-486f-85c7-b2877b9f1189@linux.ibm.com>
Content-Language: en-US, en-IN, en-GB
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
In-Reply-To: <b347f6e2-26c0-486f-85c7-b2877b9f1189@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxMCBTYWx0ZWRfX8zGfLGZZaVCs
 Ur6RHP57sRhbX6SRiIFMJuD5MS54YotMWbziabZZpQmRMTPebxwdwGkDNl07t0Lo0C9pmFiPRd8
 WY+OhCxFtNFyqvmIFUSZuKnhSdVUoxwAE5cQueVTAvJg+TlACeiT5GvHYsmDltYiHEi9K9pd8D7
 LfEDofnP8bntN+0XFDIoOiQ12RHv+us/L45vKMXm3kznltuG3O21uzd+kryFD9gV/ieXryVuk8S
 0x1tgYRUWDb2Tl2hR2v2XYQJR2wTSjO7bm5cWL4RT04DL5TbGLd/wnZMXtSV5z/3sJf4v8OjCOk
 hZU2Sgo6RurUh03ITpjXuMzoO0uEdqMDrocZZFqWfCkihEafhD0esM5Fsaz9mF5MRWnzoxhxfnV
 mwC/0fQZ
X-Proofpoint-ORIG-GUID: CJ4ASULAV-QyM4uKPef7CDai_Ue0Ho2E
X-Authority-Analysis: v=2.4 cv=euPfzppX c=1 sm=1 tr=0 ts=68c8e4a8 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=X8V0eRijArG8qoLdyYQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: UJuQzbxE05GCXaYyMTlrunX6fbGYPRZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 9/13/25 6:19 PM, Shrikanth Hegde wrote:
>
>
> On 9/9/25 2:32 AM, Mukesh Kumar Chaurasiya wrote:
>> Enabling build with generic entry/exit framework for powerpc
>> architecture requires few necessary steps.
>>
>> Introducing minor infrastructure updates to prepare for future generic
>> framework handling:
>>
>> - Add syscall_work field to struct thread_info for SYSCALL_WORK_* flags.
>> - Provide arch_syscall_is_vdso_sigreturn() stub, returning false.
>> - Add on_thread_stack() helper to test whether the current stack pointer
>>    lies within the task’s kernel stack.
>>
>> No functional change is intended with this patch.
>>
>> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/entry-common.h | 11 +++++++++++
>>   arch/powerpc/include/asm/stacktrace.h   |  8 ++++++++
>>   arch/powerpc/include/asm/syscall.h      |  5 +++++
>>   arch/powerpc/include/asm/thread_info.h  |  1 +
>>   4 files changed, 25 insertions(+)
>>   create mode 100644 arch/powerpc/include/asm/entry-common.h
>>
>> diff --git a/arch/powerpc/include/asm/entry-common.h 
>> b/arch/powerpc/include/asm/entry-common.h
>> new file mode 100644
>> index 0000000000000..3af16d821d07e
>> --- /dev/null
>> +++ b/arch/powerpc/include/asm/entry-common.h
>> @@ -0,0 +1,11 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef _ASM_PPC_ENTRY_COMMON_H
>> +#define _ASM_PPC_ENTRY_COMMON_H
>> +
>> +#ifdef CONFIG_GENERIC_IRQ_ENTRY
>> +
>> +#include <asm/stacktrace.h>
>> +
>> +#endif /* CONFIG_GENERIC_IRQ_ENTRY */
>> +#endif /* _ASM_PPC_ENTRY_COMMON_H */
>> diff --git a/arch/powerpc/include/asm/stacktrace.h 
>> b/arch/powerpc/include/asm/stacktrace.h
>> index 6149b53b3bc8e..3f0a242468813 100644
>> --- a/arch/powerpc/include/asm/stacktrace.h
>> +++ b/arch/powerpc/include/asm/stacktrace.h
>> @@ -8,6 +8,14 @@
>>   #ifndef _ASM_POWERPC_STACKTRACE_H
>>   #define _ASM_POWERPC_STACKTRACE_H
>>   +#include <linux/sched.h>
>
> nit:
>
> Is sched.h needed? I don't see any reference here.
> It compiled for me without it.
>
Will remove this in next revision.
>> +
>>   void show_user_instructions(struct pt_regs *regs);
>>   +static inline bool on_thread_stack(void)
>> +{
>> +    return !(((unsigned long)(current->stack) ^ current_stack_pointer)
>> +            & ~(THREAD_SIZE -1));
>> +}
>> +
>>   #endif /* _ASM_POWERPC_STACKTRACE_H */
>> diff --git a/arch/powerpc/include/asm/syscall.h 
>> b/arch/powerpc/include/asm/syscall.h
>> index 4b3c52ed6e9d2..834fcc4f7b543 100644
>> --- a/arch/powerpc/include/asm/syscall.h
>> +++ b/arch/powerpc/include/asm/syscall.h
>> @@ -139,4 +139,9 @@ static inline int syscall_get_arch(struct 
>> task_struct *task)
>>       else
>>           return AUDIT_ARCH_PPC64;
>>   }
>> +
>> +static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
>> +{
>> +    return false;
>> +}
>>   #endif    /* _ASM_SYSCALL_H */
>> diff --git a/arch/powerpc/include/asm/thread_info.h 
>> b/arch/powerpc/include/asm/thread_info.h
>> index 2785c7462ebf7..d0e87c9bae0b0 100644
>> --- a/arch/powerpc/include/asm/thread_info.h
>> +++ b/arch/powerpc/include/asm/thread_info.h
>> @@ -54,6 +54,7 @@
>>   struct thread_info {
>>       int        preempt_count;        /* 0 => preemptable,
>>                              <0 => BUG */
>> +    unsigned long    syscall_work;        /* SYSCALL_WORK_ flags */
>
> Can this go after cpu ? it would be 8 byte aligned then. Since it is 
> in fast path, might help.
>
Oh yeah, will move this in next revision.

Thanks,

Mukesh

>>   #ifdef CONFIG_SMP
>>       unsigned int    cpu;
>>   #endif
>

