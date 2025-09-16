Return-Path: <linuxppc-dev+bounces-12268-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 387BDB58CC4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 06:21:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQpd5033Mz2yrF;
	Tue, 16 Sep 2025 14:21:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757996409;
	cv=none; b=i7NzHTsN2QLLFtHmR/gQJHWadedeJcPEG323g3gfNt51LBQ0K9Zb6baGkv9zhyXFLyXCP7OI9gSJh/bOMlCCZgvmo12Ksq+hy2hU+4OW5nOImKTxIjGlnKk9QCONWl+PRdeHwl81HNpwF3aNKZWo1bv50X1fmc6HwTtCbrYgDdXT3OHByB7rwyrMzG4T/Cij6rJCN5WGI36p7Cpaohm7XmA0GJaiJDbwz5nuZCLLidQT/sakOWja9eLJeSEzKyHI8h2bHrsrlcKtdMdLDgY1D0YLunrZR2g5ZJyyrNGanlv4EeooKt0C1xtG8BvumkvL7HSvK1mE1oC2EbiIMLQ6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757996409; c=relaxed/relaxed;
	bh=IMYX6+/wntLjFi3USIzJdtXyuVTz2+S4Fd2MtaqIWMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYZ9jHeCBbuNIF24m9na51m89UrzS6vea5qvhA++cde5YC+QRZ1aQNIYJ3JJTUOUU54v4gABjyM0cAn+Ac0ORjihpv0JNJfRQ3XAAmWjSNSt/9qlTEF7Oo5CrlIldDFWANBd28r1BneG43KQ742bboEaOJSM2XQxaRs8mAiEpa4Dy7/dgMftw4gHRbWnhMnorYro9TzxTIY4pI9HX/LS6Ro/0o7pVbgUPzZLPDtiDPeQ+q19mlcCc6+VZOCco0EbiQnOidVxqG1EDsPnvWkcRc2Af/AYVtB7ojBKY6AngFtXvlNFB8B2u3Kkhpc4CNPoZ0sL74Gc0rAZNE8OmdB6jA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TYXEiQSi; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TYXEiQSi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQpbD33pZz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 14:20:08 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FH2QuI018825;
	Tue, 16 Sep 2025 04:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=IMYX6+
	/wntLjFi3USIzJdtXyuVTz2+S4Fd2MtaqIWMg=; b=TYXEiQSiRJmu5WpTmxhaQ9
	AKkx5EUg0fTDuOaTEHpYuO1M1VXrrLHJfvR2TxTp6n1aMRaxL6MzeJYxotK9YQ/9
	CVlVpgh92PvpeP2MGL6UiRAowMejH5u1mJurZqM1fh9/phqzT8e7CwDc3Pmzc2KC
	7lzbzPjvA3lodeRF/EGId8EgKaWZ1FnxVqgS5JErZkuAfVhui8gUMqEfcSyQbGY8
	/sS9r6d4vT8HCL05UAi3LuKMxMq0p5VAZCGV/ZpymHaSPArBWtC/Rf53VNSreak5
	HRt7a6Kc+ubNdfIZnKOD2k0rm+K1Ez8j1qNU+bKbSrVchImGy3gycKZuP4BgllFA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496gat54sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:19:46 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58G4HWLU024900;
	Tue, 16 Sep 2025 04:19:45 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496gat54se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:19:45 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58G2AnxZ029536;
	Tue, 16 Sep 2025 04:19:44 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kb0t5q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:19:44 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58G4Je4A51183924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Sep 2025 04:19:40 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC3E720040;
	Tue, 16 Sep 2025 04:19:39 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46C1920049;
	Tue, 16 Sep 2025 04:19:32 +0000 (GMT)
Received: from [9.39.20.171] (unknown [9.39.20.171])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 Sep 2025 04:19:32 +0000 (GMT)
Message-ID: <2129847d-8058-424e-89b1-5d072b281ce3@linux.ibm.com>
Date: Tue, 16 Sep 2025 09:49:31 +0530
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
Subject: Re: [RFC V2 3/8] powerpc: introduce arch_enter_from_user_mode
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
 <20250908210235.137300-5-mchauras@linux.ibm.com>
 <188f79ef-6ad4-4144-b73b-9e1090f4fc95@linux.ibm.com>
Content-Language: en-US, en-IN, en-GB
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
In-Reply-To: <188f79ef-6ad4-4144-b73b-9e1090f4fc95@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=BKWzrEQG c=1 sm=1 tr=0 ts=68c8e562 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=S892im0M2olbNhx55RsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Dby_u1cUep2zOakaY6LBdvUsnq6ffJx3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfX2rpdrMZCdB2v
 DArpuFXmyiEbjR+BXx6sfK9bNjQDO2zSm1u8ukai7yAkIisWOcRIFn0SKCgazNnshDZ1iBUrvQJ
 Sw+ti8b9mg3n2ICxpEMC1j7tGGjIQ7xFYRwukQqvIk6yl/Z1Nl+nvbGsnfgfqmPjHnv/oM0x6OJ
 01iiKCr2pXTKveErvJC/ZE/ELS9auylW09ChrU3HIE+e7zZlryhJzZtI2hBmAHhAft2Clt5kosO
 gDPomokiuTZzM6pv8ESWswJW3mgW0wnmFeFStMzxjIsEjRbL+1KHnO7OswISIZikhgxJ8AhQrxG
 Kw83fXK5uDqe7gauNnJxf+YDd97XQj9YlLBU2Oz49+MT/Z/olgzokAxJ+mcnPQMxPFlFrRnGqWB
 4/4QJFBc
X-Proofpoint-ORIG-GUID: 7nzj9B2-PAMJBT1O8w32L4ndZvImg3DU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 9/14/25 2:32 PM, Shrikanth Hegde wrote:
>
>
> On 9/9/25 2:32 AM, Mukesh Kumar Chaurasiya wrote:
>> - Implement the hook arch_enter_from_user_mode for syscall entry.
>
> nit: for generic syscall infra.
Cool, will change this.
>
>> - Move booke_load_dbcr0 from interrupt.c to interrupt.h
>>
>> No functional change intended.
>>
>> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/entry-common.h | 96 +++++++++++++++++++++++++
>>   arch/powerpc/include/asm/interrupt.h    | 23 ++++++
>>   arch/powerpc/kernel/interrupt.c         | 22 ------
>>   3 files changed, 119 insertions(+), 22 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/entry-common.h 
>> b/arch/powerpc/include/asm/entry-common.h
>> index 3af16d821d07e..49607292bf5a5 100644
>> --- a/arch/powerpc/include/asm/entry-common.h
>> +++ b/arch/powerpc/include/asm/entry-common.h
>> @@ -5,7 +5,103 @@
>>     #ifdef CONFIG_GENERIC_IRQ_ENTRY
>>   +#include <asm/cputime.h>
>> +#include <asm/interrupt.h>
>>   #include <asm/stacktrace.h>
>> +#include <asm/tm.h>
>> +
>> +static __always_inline void arch_enter_from_user_mode(struct pt_regs 
>> *regs)
>> +{
>> +    if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>> +        BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
>> +
>> +    BUG_ON(regs_is_unrecoverable(regs));
>> +    BUG_ON(!user_mode(regs));
>> +    BUG_ON(regs_irqs_disabled(regs));
>> +
>> +#ifdef CONFIG_PPC_PKEY
>> +    if (mmu_has_feature(MMU_FTR_PKEY)) {
>> +        unsigned long amr, iamr;
>> +        bool flush_needed = false;
>> +        /*
>> +         * When entering from userspace we mostly have the AMR/IAMR
>> +         * different from kernel default values. Hence don't compare.
>> +         */
>> +        amr = mfspr(SPRN_AMR);
>> +        iamr = mfspr(SPRN_IAMR);
>> +        regs->amr  = amr;
>> +        regs->iamr = iamr;
>> +        if (mmu_has_feature(MMU_FTR_KUAP)) {
>> +            mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
>> +            flush_needed = true;
>> +        }
>> +        if (mmu_has_feature(MMU_FTR_BOOK3S_KUEP)) {
>> +            mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
>> +            flush_needed = true;
>> +        }
>> +        if (flush_needed)
>> +            isync();
>> +    } else
>> +#endif
>> +        kuap_assert_locked();
>> +
>> +    booke_restore_dbcr0();
>> +
>> +    account_cpu_user_entry();
>> +
>> +    account_stolen_time();
>> +
>> +    /*
>> +     * This is not required for the syscall exit path, but makes the
>> +     * stack frame look nicer. If this was initialised in the first 
>> stack
>> +     * frame, or if the unwinder was taught the first stack frame 
>> always
>> +     * returns to user with IRQS_ENABLED, this store could be avoided!
>> +     */
>> +    irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
>> +
>> +    /*
>> +     * If system call is called with TM active, set _TIF_RESTOREALL to
>> +     * prevent RFSCV being used to return to userspace, because POWER9
>> +     * TM implementation has problems with this instruction 
>> returning to
>> +     * transactional state. Final register values are not relevant 
>> because
>> +     * the transaction will be aborted upon return anyway. Or in the 
>> case
>> +     * of unsupported_scv SIGILL fault, the return state does not much
>> +     * matter because it's an edge case.
>> +     */
>> +    if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
>> +            unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
>> +        set_bits(_TIF_RESTOREALL, &current_thread_info()->flags);
>> +
>> +    /*
>> +     * If the system call was made with a transaction active, doom 
>> it and
>> +     * return without performing the system call. Unless it was an
>> +     * unsupported scv vector, in which case it's treated like an 
>> illegal
>> +     * instruction.
>> +     */
>> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>> +    if (unlikely(MSR_TM_TRANSACTIONAL(regs->msr)) &&
>> +        !trap_is_unsupported_scv(regs)) {
>> +        /* Enable TM in the kernel, and disable EE (for scv) */
>> +        hard_irq_disable();
>> +        mtmsr(mfmsr() | MSR_TM);
>> +
>> +        /* tabort, this dooms the transaction, nothing else */
>> +        asm volatile(".long 0x7c00071d | ((%0) << 16)"
>> +                :: "r"(TM_CAUSE_SYSCALL|TM_CAUSE_PERSISTENT));
>> +
>> +        /*
>> +         * Userspace will never see the return value. Execution will
>> +         * resume after the tbegin. of the aborted transaction with the
>> +         * checkpointed register state. A context switch could occur
>> +         * or signal delivered to the process before resuming the
>> +         * doomed transaction context, but that should all be handled
>> +         * as expected.
>> +         */
>> +        return;
>> +    }
>> +#endif // CONFIG_PPC_TRANSACTIONAL_MEM
>
> nit: Better to follow standard comment practices.
>         /* CONFIG_PPC_TRANSACTIONAL_MEM */
>
Sure.
>> +}
>> +#define arch_enter_from_user_mode arch_enter_from_user_mode
>>     #endif /* CONFIG_GENERIC_IRQ_ENTRY */
>>   #endif /* _ASM_PPC_ENTRY_COMMON_H */
>> diff --git a/arch/powerpc/include/asm/interrupt.h 
>> b/arch/powerpc/include/asm/interrupt.h
>> index 56bc8113b8cde..6edf064a0fea2 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -138,6 +138,29 @@ static inline void nap_adjust_return(struct 
>> pt_regs *regs)
>>   #endif
>>   }
>>   +static inline void booke_load_dbcr0(void)
>> +{
>> +#ifdef CONFIG_PPC_ADV_DEBUG_REGS
>> +       unsigned long dbcr0 = current->thread.debug.dbcr0;
>> +
>> +       if (likely(!(dbcr0 & DBCR0_IDM)))
>> +               return;
>> +
>> +       /*
>> +        * Check to see if the dbcr0 register is set up to debug.
>> +        * Use the internal debug mode bit to do this.
>> +        */
>> +       mtmsr(mfmsr() & ~MSR_DE);
>> +       if (IS_ENABLED(CONFIG_PPC32)) {
>> +               isync();
>> +               global_dbcr0[smp_processor_id()] = mfspr(SPRN_DBCR0);
>> +       }
>> +       mtspr(SPRN_DBCR0, dbcr0);
>> +       mtspr(SPRN_DBSR, -1);
>> +#endif
>> +}
>> +
>
> Please run checkpatch.pl --strict on the series and fix the simple
> ones such as need to using tabs, spaces and alignments, extra lines etc.
>
Sure, will fix these.

Thanks,

Mukesh

>> +
>>   static inline void booke_restore_dbcr0(void)
>>   {
>>   #ifdef CONFIG_PPC_ADV_DEBUG_REGS
>> diff --git a/arch/powerpc/kernel/interrupt.c 
>> b/arch/powerpc/kernel/interrupt.c
>> index 0d8fd47049a19..2a09ac5dabd62 100644
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -78,28 +78,6 @@ static notrace __always_inline bool 
>> prep_irq_for_enabled_exit(bool restartable)
>>       return true;
>>   }
>>   -static notrace void booke_load_dbcr0(void)
>> -{
>> -#ifdef CONFIG_PPC_ADV_DEBUG_REGS
>> -    unsigned long dbcr0 = current->thread.debug.dbcr0;
>> -
>> -    if (likely(!(dbcr0 & DBCR0_IDM)))
>> -        return;
>> -
>> -    /*
>> -     * Check to see if the dbcr0 register is set up to debug.
>> -     * Use the internal debug mode bit to do this.
>> -     */
>> -    mtmsr(mfmsr() & ~MSR_DE);
>> -    if (IS_ENABLED(CONFIG_PPC32)) {
>> -        isync();
>> -        global_dbcr0[smp_processor_id()] = mfspr(SPRN_DBCR0);
>> -    }
>> -    mtspr(SPRN_DBCR0, dbcr0);
>> -    mtspr(SPRN_DBSR, -1);
>> -#endif
>> -}
>> -
>>   static notrace void check_return_regs_valid(struct pt_regs *regs)
>>   {
>>   #ifdef CONFIG_PPC_BOOK3S_64
>

