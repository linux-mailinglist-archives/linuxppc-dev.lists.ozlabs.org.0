Return-Path: <linuxppc-dev+bounces-12146-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAE1B560EC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 14:50:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPB3703gdz304h;
	Sat, 13 Sep 2025 22:50:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757767810;
	cv=none; b=WKoe4SeGhyeadNIiusyAe4TuFiMQzNcTQhrpO9xPkSFHozXcMjmkWLRLp4Eei3S+2jYlxpmSV6+I6mMi4MeawK7HOg+ZiG+pZAUrVsaUZi3Rl9vtPkP5kJsZ3afGI5o2qEjBmbrS/U+kkWD0dP5OL31x4+jTsIrE5Fki2/F2qtx4ILZC7pEPwIgMl5CC8aBQrh8tN+8Q05YzTLaDFJo3h67nbyyXF70uwTiCASHs2/parEmQ7frppjpkQl1f0XwdRnuJ+kjB7BheFU3AXApsBGZPHmJOBiVxTqmPbYt1Fvj8t+hkx2wDGQN1RBPzBtI2vfx7KqeBjts4PpgOu3flng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757767810; c=relaxed/relaxed;
	bh=lUnMy2/hy6eJQJuxG9ptdhNweSEdmu/RV13ng0iPrwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=cesPG5h1gNRRcY30gKV6zguaRpmHBvw0I9SOnmICxyQS/6XO2Gjje+U4qKD/XbaxRzCrley/02OhnwyJzATClFLMCzmT20GJ/Gb3H/RGDVZsBynxyzG8FL9ZtLgaIFJkSXpCViTBafa1OhM7mNtFTdTHIpbHKuGj6P8m7NUYMsyBgnnu6iY1Q3arRIeup5qCkXBDpFXZBzVYAKr9zEqGlaPsLhzFrUjhizHatF2WwXUI+cFr2guiRd/MzQl57kP6k0y8hIRJv2A3lj2z4reo8sCGgiCVtPRDQdRweM4u1CGnetzx53rkv+AtZ7ieMqMrowpYsEO9AgaUmcVmoKH2AA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a3hlDKiC; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a3hlDKiC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPB353cRYz2xnk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 22:50:09 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58D9ej2l017100;
	Sat, 13 Sep 2025 12:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lUnMy2
	/hy6eJQJuxG9ptdhNweSEdmu/RV13ng0iPrwc=; b=a3hlDKiCqIT5rBJuUeuFoP
	gQEe5+5UCLA0hJYdfdnK8Lampv9qcPX55BYLA+ZcGkl5ljmtEGTOIwvHrewJurHu
	BYWptXdOcab7S2MBMHKEb7euybGVC0e5v4N5WBe/qqDSuTF9+GN8sZo42zFTe4Y5
	8yqadr/c2Izef/Du+XcW4RYMdtFLA6AhoKTG5+yFdEpDPeqWBZE0MIhKBohDxQeV
	s8/ZJLTzlkvvb+lNvbfCAplWOt6yZD7BXHG/FytU1+MhLG9Bs6F/tD0Hhx3CoVUw
	PNSU55jPdV73Ubv7s7oqU4urOdjMPRngwk94/2xSXCIWJyGlLUtLv95CZ8YsV94w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49509xsc10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Sep 2025 12:49:27 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58DCnQfa028779;
	Sat, 13 Sep 2025 12:49:26 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49509xsc0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Sep 2025 12:49:26 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58D8EwWG020469;
	Sat, 13 Sep 2025 12:49:25 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 490yp1fjvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Sep 2025 12:49:24 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58DCnLJ731326614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 13 Sep 2025 12:49:21 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED83820043;
	Sat, 13 Sep 2025 12:49:20 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1B6720040;
	Sat, 13 Sep 2025 12:49:07 +0000 (GMT)
Received: from [9.61.95.215] (unknown [9.61.95.215])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 13 Sep 2025 12:49:07 +0000 (GMT)
Message-ID: <b347f6e2-26c0-486f-85c7-b2877b9f1189@linux.ibm.com>
Date: Sat, 13 Sep 2025 18:19:05 +0530
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
To: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
References: <20250908210235.137300-2-mchauras@linux.ibm.com>
 <20250908210235.137300-4-mchauras@linux.ibm.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
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
In-Reply-To: <20250908210235.137300-4-mchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyMCBTYWx0ZWRfX23dQGHU1VBsr
 F9KkwRTdE9kXLFS0tFPcW3/WlaetdWvIr5XZ3LV/nj8zehyDnHhQKlU3+GH6m2NFZKyHA3tiuan
 H+z2rr456Um0gnAWMZcB+zdPEqML408xPe4RPWtRNtQC4zadUbjR3mQRVVRwT0UtVBKGjpkf7/6
 BK7znF1ZRmiatj+z6FJpF2QnAed5EzgzMl7bdnHoS4giirqb3snlTDXtII8gji3zrjU4c4aaqlr
 +5ysOS+/BgaWHRK4BhjT+Vy3yhGxIb826fU0L1X7MXUCAs7UdSVLgi6Xp3UoWfVxL59K74oVbZ2
 6zoQLczNC3KnKPvB4deZ3G/Lq4nQF+UocC3fK+MpFTlq/lz3vlxdMcKEktZhzGnEpB0hNdhT/+S
 8hR5Px2d
X-Authority-Analysis: v=2.4 cv=OPYn3TaB c=1 sm=1 tr=0 ts=68c56857 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=6JEIxQDwY7sH1iLhUv8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: qlkYiZW_6uEtslP273yPjMEm1E9V0mP4
X-Proofpoint-ORIG-GUID: adhepOLzK7kXaf7SPQwIexJbatM0sQ2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-13_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 9/9/25 2:32 AM, Mukesh Kumar Chaurasiya wrote:
> Enabling build with generic entry/exit framework for powerpc
> architecture requires few necessary steps.
> 
> Introducing minor infrastructure updates to prepare for future generic
> framework handling:
> 
> - Add syscall_work field to struct thread_info for SYSCALL_WORK_* flags.
> - Provide arch_syscall_is_vdso_sigreturn() stub, returning false.
> - Add on_thread_stack() helper to test whether the current stack pointer
>    lies within the task’s kernel stack.
> 
> No functional change is intended with this patch.
> 
> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/entry-common.h | 11 +++++++++++
>   arch/powerpc/include/asm/stacktrace.h   |  8 ++++++++
>   arch/powerpc/include/asm/syscall.h      |  5 +++++
>   arch/powerpc/include/asm/thread_info.h  |  1 +
>   4 files changed, 25 insertions(+)
>   create mode 100644 arch/powerpc/include/asm/entry-common.h
> 
> diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> new file mode 100644
> index 0000000000000..3af16d821d07e
> --- /dev/null
> +++ b/arch/powerpc/include/asm/entry-common.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _ASM_PPC_ENTRY_COMMON_H
> +#define _ASM_PPC_ENTRY_COMMON_H
> +
> +#ifdef CONFIG_GENERIC_IRQ_ENTRY
> +
> +#include <asm/stacktrace.h>
> +
> +#endif /* CONFIG_GENERIC_IRQ_ENTRY */
> +#endif /* _ASM_PPC_ENTRY_COMMON_H */
> diff --git a/arch/powerpc/include/asm/stacktrace.h b/arch/powerpc/include/asm/stacktrace.h
> index 6149b53b3bc8e..3f0a242468813 100644
> --- a/arch/powerpc/include/asm/stacktrace.h
> +++ b/arch/powerpc/include/asm/stacktrace.h
> @@ -8,6 +8,14 @@
>   #ifndef _ASM_POWERPC_STACKTRACE_H
>   #define _ASM_POWERPC_STACKTRACE_H
>   
> +#include <linux/sched.h>

nit:

Is sched.h needed? I don't see any reference here.
It compiled for me without it.

> +
>   void show_user_instructions(struct pt_regs *regs);
>   
> +static inline bool on_thread_stack(void)
> +{
> +	return !(((unsigned long)(current->stack) ^ current_stack_pointer)
> +			& ~(THREAD_SIZE -1));
> +}
> +
>   #endif /* _ASM_POWERPC_STACKTRACE_H */
> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> index 4b3c52ed6e9d2..834fcc4f7b543 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -139,4 +139,9 @@ static inline int syscall_get_arch(struct task_struct *task)
>   	else
>   		return AUDIT_ARCH_PPC64;
>   }
> +
> +static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
> +{
> +	return false;
> +}
>   #endif	/* _ASM_SYSCALL_H */
> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> index 2785c7462ebf7..d0e87c9bae0b0 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -54,6 +54,7 @@
>   struct thread_info {
>   	int		preempt_count;		/* 0 => preemptable,
>   						   <0 => BUG */
> +	unsigned long	syscall_work;		/* SYSCALL_WORK_ flags */

Can this go after cpu ? it would be 8 byte aligned then. Since it is in 
fast path, might help.

>   #ifdef CONFIG_SMP
>   	unsigned int	cpu;
>   #endif


