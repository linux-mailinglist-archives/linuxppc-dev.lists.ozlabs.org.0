Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCE8B558
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 08:21:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sHjl3p5GzDqF0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 16:21:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sHh64B2DzDqCM
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 16:19:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 44sHh634b9z9s9N; Sun, 28 Apr 2019 16:19:50 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44sHh52s5Hz9s9G;
 Sun, 28 Apr 2019 16:19:49 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Diana Madalina Craciun <diana.craciun@nxp.com>,
 "stable\@vger.kernel.org" <stable@vger.kernel.org>,
 "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH stable v4.4 00/52] powerpc spectre backports for 4.4
In-Reply-To: <VI1PR0401MB2463F6397FDC281DFDFF61FBFF220@VI1PR0401MB2463.eurprd04.prod.outlook.com>
References: <20190421142037.21881-1-mpe@ellerman.id.au>
 <VI1PR0401MB2463F6397FDC281DFDFF61FBFF220@VI1PR0401MB2463.eurprd04.prod.outlook.com>
Date: Sun, 28 Apr 2019 16:20:00 +1000
Message-ID: <87lfzuabxr.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 "msuchanek@suse.de" <msuchanek@suse.de>,
 "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Diana Madalina Craciun <diana.craciun@nxp.com> writes:
> Hi Michael,
>
> There are some missing NXP Spectre v2 patches. I can send them
> separately if the series will be accepted. I have merged them, but I did
> not test them, I was sick today and incapable of doing that.

No worries, there's no rush :)

Sorry I missed them, I thought I had a list that included everything.
Which commits was it I missed?

I guess post them as a reply to this thread? That way whether the series
is merged by Greg or not, there's a record here of what the backports
look like.

cheers

> On 4/21/2019 5:21 PM, Michael Ellerman wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi Greg/Sasha,
>>
>> Please queue up these powerpc patches for 4.4 if you have no objections.
>>
>> cheers
>>
>>
>> Christophe Leroy (1):
>>   powerpc/fsl: Fix the flush of branch predictor.
>>
>> Diana Craciun (10):
>>   powerpc/64: Disable the speculation barrier from the command line
>>   powerpc/64: Make stf barrier PPC_BOOK3S_64 specific.
>>   powerpc/64: Make meltdown reporting Book3S 64 specific
>>   powerpc/fsl: Add barrier_nospec implementation for NXP PowerPC Book3E
>>   powerpc/fsl: Add infrastructure to fixup branch predictor flush
>>   powerpc/fsl: Add macro to flush the branch predictor
>>   powerpc/fsl: Fix spectre_v2 mitigations reporting
>>   powerpc/fsl: Add nospectre_v2 command line argument
>>   powerpc/fsl: Flush the branch predictor at each kernel entry (64bit)
>>   powerpc/fsl: Update Spectre v2 reporting
>>
>> Mauricio Faria de Oliveira (4):
>>   powerpc/rfi-flush: Differentiate enabled and patched flush types
>>   powerpc/pseries: Fix clearing of security feature flags
>>   powerpc: Move default security feature flags
>>   powerpc/pseries: Restore default security feature flags on setup
>>
>> Michael Ellerman (29):
>>   powerpc/xmon: Add RFI flush related fields to paca dump
>>   powerpc/pseries: Support firmware disable of RFI flush
>>   powerpc/powernv: Support firmware disable of RFI flush
>>   powerpc/rfi-flush: Move the logic to avoid a redo into the debugfs
>>     code
>>   powerpc/rfi-flush: Make it possible to call setup_rfi_flush() again
>>   powerpc/rfi-flush: Always enable fallback flush on pseries
>>   powerpc/pseries: Add new H_GET_CPU_CHARACTERISTICS flags
>>   powerpc/rfi-flush: Call setup_rfi_flush() after LPM migration
>>   powerpc: Add security feature flags for Spectre/Meltdown
>>   powerpc/pseries: Set or clear security feature flags
>>   powerpc/powernv: Set or clear security feature flags
>>   powerpc/64s: Move cpu_show_meltdown()
>>   powerpc/64s: Enhance the information in cpu_show_meltdown()
>>   powerpc/powernv: Use the security flags in pnv_setup_rfi_flush()
>>   powerpc/pseries: Use the security flags in pseries_setup_rfi_flush()
>>   powerpc/64s: Wire up cpu_show_spectre_v1()
>>   powerpc/64s: Wire up cpu_show_spectre_v2()
>>   powerpc/64s: Fix section mismatch warnings from setup_rfi_flush()
>>   powerpc/64: Use barrier_nospec in syscall entry
>>   powerpc: Use barrier_nospec in copy_from_user()
>>   powerpc64s: Show ori31 availability in spectre_v1 sysfs file not v2
>>   powerpc/64: Add CONFIG_PPC_BARRIER_NOSPEC
>>   powerpc/64: Call setup_barrier_nospec() from setup_arch()
>>   powerpc/asm: Add a patch_site macro & helpers for patching
>>     instructions
>>   powerpc/64s: Add new security feature flags for count cache flush
>>   powerpc/64s: Add support for software count cache flush
>>   powerpc/pseries: Query hypervisor for count cache flush settings
>>   powerpc/powernv: Query firmware for count cache flush settings
>>   powerpc/security: Fix spectre_v2 reporting
>>
>> Michael Neuling (1):
>>   powerpc: Avoid code patching freed init sections
>>
>> Michal Suchanek (5):
>>   powerpc/64s: Add barrier_nospec
>>   powerpc/64s: Add support for ori barrier_nospec patching
>>   powerpc/64s: Patch barrier_nospec in modules
>>   powerpc/64s: Enable barrier_nospec based on firmware settings
>>   powerpc/64s: Enhance the information in cpu_show_spectre_v1()
>>
>> Nicholas Piggin (2):
>>   powerpc/64s: Improve RFI L1-D cache flush fallback
>>   powerpc/64s: Add support for a store forwarding barrier at kernel
>>     entry/exit
>>
>>  arch/powerpc/Kconfig                         |   7 +-
>>  arch/powerpc/include/asm/asm-prototypes.h    |  21 +
>>  arch/powerpc/include/asm/barrier.h           |  21 +
>>  arch/powerpc/include/asm/code-patching-asm.h |  18 +
>>  arch/powerpc/include/asm/code-patching.h     |   2 +
>>  arch/powerpc/include/asm/exception-64s.h     |  35 ++
>>  arch/powerpc/include/asm/feature-fixups.h    |  40 ++
>>  arch/powerpc/include/asm/hvcall.h            |   5 +
>>  arch/powerpc/include/asm/paca.h              |   3 +-
>>  arch/powerpc/include/asm/ppc-opcode.h        |   1 +
>>  arch/powerpc/include/asm/ppc_asm.h           |  11 +
>>  arch/powerpc/include/asm/security_features.h |  92 ++++
>>  arch/powerpc/include/asm/setup.h             |  23 +-
>>  arch/powerpc/include/asm/uaccess.h           |  18 +-
>>  arch/powerpc/kernel/Makefile                 |   1 +
>>  arch/powerpc/kernel/asm-offsets.c            |   3 +-
>>  arch/powerpc/kernel/entry_64.S               |  69 +++
>>  arch/powerpc/kernel/exceptions-64e.S         |  27 +-
>>  arch/powerpc/kernel/exceptions-64s.S         |  98 +++--
>>  arch/powerpc/kernel/module.c                 |  10 +-
>>  arch/powerpc/kernel/security.c               | 433 +++++++++++++++++++
>>  arch/powerpc/kernel/setup_32.c               |   2 +
>>  arch/powerpc/kernel/setup_64.c               |  50 +--
>>  arch/powerpc/kernel/vmlinux.lds.S            |  33 +-
>>  arch/powerpc/lib/code-patching.c             |  29 ++
>>  arch/powerpc/lib/feature-fixups.c            | 218 +++++++++-
>>  arch/powerpc/mm/mem.c                        |   2 +
>>  arch/powerpc/mm/tlb_low_64e.S                |   7 +
>>  arch/powerpc/platforms/powernv/setup.c       |  99 +++--
>>  arch/powerpc/platforms/pseries/mobility.c    |   3 +
>>  arch/powerpc/platforms/pseries/pseries.h     |   2 +
>>  arch/powerpc/platforms/pseries/setup.c       |  88 +++-
>>  arch/powerpc/xmon/xmon.c                     |   2 +
>>  33 files changed, 1345 insertions(+), 128 deletions(-)
>>  create mode 100644 arch/powerpc/include/asm/asm-prototypes.h
>>  create mode 100644 arch/powerpc/include/asm/code-patching-asm.h
>>  create mode 100644 arch/powerpc/include/asm/security_features.h
>>  create mode 100644 arch/powerpc/kernel/security.c
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 58a1fa979655..01b6c00a7060 100644
>> - --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -136,7 +136,7 @@ config PPC
>>  	select GENERIC_SMP_IDLE_THREAD
>>  	select GENERIC_CMOS_UPDATE
>>  	select GENERIC_TIME_VSYSCALL_OLD
>> - -	select GENERIC_CPU_VULNERABILITIES	if PPC_BOOK3S_64
>> +	select GENERIC_CPU_VULNERABILITIES	if PPC_BARRIER_NOSPEC
>>  	select GENERIC_CLOCKEVENTS
>>  	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>> @@ -162,6 +162,11 @@ config PPC
>>  	select ARCH_HAS_DMA_SET_COHERENT_MASK
>>  	select HAVE_ARCH_SECCOMP_FILTER
>>  
>> +config PPC_BARRIER_NOSPEC
>> +    bool
>> +    default y
>> +    depends on PPC_BOOK3S_64 || PPC_FSL_BOOK3E
>> +
>>  config GENERIC_CSUM
>>  	def_bool CPU_LITTLE_ENDIAN
>>  
>> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
>> new file mode 100644
>> index 000000000000..8944c55591cf
>> - --- /dev/null
>> +++ b/arch/powerpc/include/asm/asm-prototypes.h
>> @@ -0,0 +1,21 @@
>> +#ifndef _ASM_POWERPC_ASM_PROTOTYPES_H
>> +#define _ASM_POWERPC_ASM_PROTOTYPES_H
>> +/*
>> + * This file is for prototypes of C functions that are only called
>> + * from asm, and any associated variables.
>> + *
>> + * Copyright 2016, Daniel Axtens, IBM Corporation.
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version 2
>> + * of the License, or (at your option) any later version.
>> + */
>> +
>> +/* Patch sites */
>> +extern s32 patch__call_flush_count_cache;
>> +extern s32 patch__flush_count_cache_return;
>> +
>> +extern long flush_count_cache;
>> +
>> +#endif /* _ASM_POWERPC_ASM_PROTOTYPES_H */
>> diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
>> index b9e16855a037..e7cb72cdb2ba 100644
>> - --- a/arch/powerpc/include/asm/barrier.h
>> +++ b/arch/powerpc/include/asm/barrier.h
>> @@ -92,4 +92,25 @@ do {									\
>>  #define smp_mb__after_atomic()      smp_mb()
>>  #define smp_mb__before_spinlock()   smp_mb()
>>  
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +#define NOSPEC_BARRIER_SLOT   nop
>> +#elif defined(CONFIG_PPC_FSL_BOOK3E)
>> +#define NOSPEC_BARRIER_SLOT   nop; nop
>> +#endif
>> +
>> +#ifdef CONFIG_PPC_BARRIER_NOSPEC
>> +/*
>> + * Prevent execution of subsequent instructions until preceding branches have
>> + * been fully resolved and are no longer executing speculatively.
>> + */
>> +#define barrier_nospec_asm NOSPEC_BARRIER_FIXUP_SECTION; NOSPEC_BARRIER_SLOT
>> +
>> +// This also acts as a compiler barrier due to the memory clobber.
>> +#define barrier_nospec() asm (stringify_in_c(barrier_nospec_asm) ::: "memory")
>> +
>> +#else /* !CONFIG_PPC_BARRIER_NOSPEC */
>> +#define barrier_nospec_asm
>> +#define barrier_nospec()
>> +#endif /* CONFIG_PPC_BARRIER_NOSPEC */
>> +
>>  #endif /* _ASM_POWERPC_BARRIER_H */
>> diff --git a/arch/powerpc/include/asm/code-patching-asm.h b/arch/powerpc/include/asm/code-patching-asm.h
>> new file mode 100644
>> index 000000000000..ed7b1448493a
>> - --- /dev/null
>> +++ b/arch/powerpc/include/asm/code-patching-asm.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright 2018, Michael Ellerman, IBM Corporation.
>> + */
>> +#ifndef _ASM_POWERPC_CODE_PATCHING_ASM_H
>> +#define _ASM_POWERPC_CODE_PATCHING_ASM_H
>> +
>> +/* Define a "site" that can be patched */
>> +.macro patch_site label name
>> +	.pushsection ".rodata"
>> +	.balign 4
>> +	.global \name
>> +\name:
>> +	.4byte	\label - .
>> +	.popsection
>> +.endm
>> +
>> +#endif /* _ASM_POWERPC_CODE_PATCHING_ASM_H */
>> diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
>> index 840a5509b3f1..a734b4b34d26 100644
>> - --- a/arch/powerpc/include/asm/code-patching.h
>> +++ b/arch/powerpc/include/asm/code-patching.h
>> @@ -28,6 +28,8 @@ unsigned int create_cond_branch(const unsigned int *addr,
>>  				unsigned long target, int flags);
>>  int patch_branch(unsigned int *addr, unsigned long target, int flags);
>>  int patch_instruction(unsigned int *addr, unsigned int instr);
>> +int patch_instruction_site(s32 *addr, unsigned int instr);
>> +int patch_branch_site(s32 *site, unsigned long target, int flags);
>>  
>>  int instr_is_relative_branch(unsigned int instr);
>>  int instr_is_branch_to_addr(const unsigned int *instr, unsigned long addr);
>> diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
>> index 9bddbec441b8..3ed536bec462 100644
>> - --- a/arch/powerpc/include/asm/exception-64s.h
>> +++ b/arch/powerpc/include/asm/exception-64s.h
>> @@ -50,6 +50,27 @@
>>  #define EX_PPR		88	/* SMT thread status register (priority) */
>>  #define EX_CTR		96
>>  
>> +#define STF_ENTRY_BARRIER_SLOT						\
>> +	STF_ENTRY_BARRIER_FIXUP_SECTION;				\
>> +	nop;								\
>> +	nop;								\
>> +	nop
>> +
>> +#define STF_EXIT_BARRIER_SLOT						\
>> +	STF_EXIT_BARRIER_FIXUP_SECTION;					\
>> +	nop;								\
>> +	nop;								\
>> +	nop;								\
>> +	nop;								\
>> +	nop;								\
>> +	nop
>> +
>> +/*
>> + * r10 must be free to use, r13 must be paca
>> + */
>> +#define INTERRUPT_TO_KERNEL						\
>> +	STF_ENTRY_BARRIER_SLOT
>> +
>>  /*
>>   * Macros for annotating the expected destination of (h)rfid
>>   *
>> @@ -66,16 +87,19 @@
>>  	rfid
>>  
>>  #define RFI_TO_USER							\
>> +	STF_EXIT_BARRIER_SLOT;						\
>>  	RFI_FLUSH_SLOT;							\
>>  	rfid;								\
>>  	b	rfi_flush_fallback
>>  
>>  #define RFI_TO_USER_OR_KERNEL						\
>> +	STF_EXIT_BARRIER_SLOT;						\
>>  	RFI_FLUSH_SLOT;							\
>>  	rfid;								\
>>  	b	rfi_flush_fallback
>>  
>>  #define RFI_TO_GUEST							\
>> +	STF_EXIT_BARRIER_SLOT;						\
>>  	RFI_FLUSH_SLOT;							\
>>  	rfid;								\
>>  	b	rfi_flush_fallback
>> @@ -84,21 +108,25 @@
>>  	hrfid
>>  
>>  #define HRFI_TO_USER							\
>> +	STF_EXIT_BARRIER_SLOT;						\
>>  	RFI_FLUSH_SLOT;							\
>>  	hrfid;								\
>>  	b	hrfi_flush_fallback
>>  
>>  #define HRFI_TO_USER_OR_KERNEL						\
>> +	STF_EXIT_BARRIER_SLOT;						\
>>  	RFI_FLUSH_SLOT;							\
>>  	hrfid;								\
>>  	b	hrfi_flush_fallback
>>  
>>  #define HRFI_TO_GUEST							\
>> +	STF_EXIT_BARRIER_SLOT;						\
>>  	RFI_FLUSH_SLOT;							\
>>  	hrfid;								\
>>  	b	hrfi_flush_fallback
>>  
>>  #define HRFI_TO_UNKNOWN							\
>> +	STF_EXIT_BARRIER_SLOT;						\
>>  	RFI_FLUSH_SLOT;							\
>>  	hrfid;								\
>>  	b	hrfi_flush_fallback
>> @@ -226,6 +254,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
>>  #define __EXCEPTION_PROLOG_1(area, extra, vec)				\
>>  	OPT_SAVE_REG_TO_PACA(area+EX_PPR, r9, CPU_FTR_HAS_PPR);		\
>>  	OPT_SAVE_REG_TO_PACA(area+EX_CFAR, r10, CPU_FTR_CFAR);		\
>> +	INTERRUPT_TO_KERNEL;						\
>>  	SAVE_CTR(r10, area);						\
>>  	mfcr	r9;							\
>>  	extra(vec);							\
>> @@ -512,6 +541,12 @@ label##_relon_hv:						\
>>  #define _MASKABLE_EXCEPTION_PSERIES(vec, label, h, extra)		\
>>  	__MASKABLE_EXCEPTION_PSERIES(vec, label, h, extra)
>>  
>> +#define MASKABLE_EXCEPTION_OOL(vec, label)				\
>> +	.globl label##_ool;						\
>> +label##_ool:								\
>> +	EXCEPTION_PROLOG_1(PACA_EXGEN, SOFTEN_TEST_PR, vec);		\
>> +	EXCEPTION_PROLOG_PSERIES_1(label##_common, EXC_STD);
>> +
>>  #define MASKABLE_EXCEPTION_PSERIES(loc, vec, label)			\
>>  	. = loc;							\
>>  	.globl label##_pSeries;						\
>> diff --git a/arch/powerpc/include/asm/feature-fixups.h b/arch/powerpc/include/asm/feature-fixups.h
>> index 7068bafbb2d6..145a37ab2d3e 100644
>> - --- a/arch/powerpc/include/asm/feature-fixups.h
>> +++ b/arch/powerpc/include/asm/feature-fixups.h
>> @@ -184,6 +184,22 @@ label##3:					       	\
>>  	FTR_ENTRY_OFFSET label##1b-label##3b;		\
>>  	.popsection;
>>  
>> +#define STF_ENTRY_BARRIER_FIXUP_SECTION			\
>> +953:							\
>> +	.pushsection __stf_entry_barrier_fixup,"a";	\
>> +	.align 2;					\
>> +954:							\
>> +	FTR_ENTRY_OFFSET 953b-954b;			\
>> +	.popsection;
>> +
>> +#define STF_EXIT_BARRIER_FIXUP_SECTION			\
>> +955:							\
>> +	.pushsection __stf_exit_barrier_fixup,"a";	\
>> +	.align 2;					\
>> +956:							\
>> +	FTR_ENTRY_OFFSET 955b-956b;			\
>> +	.popsection;
>> +
>>  #define RFI_FLUSH_FIXUP_SECTION				\
>>  951:							\
>>  	.pushsection __rfi_flush_fixup,"a";		\
>> @@ -192,10 +208,34 @@ label##3:					       	\
>>  	FTR_ENTRY_OFFSET 951b-952b;			\
>>  	.popsection;
>>  
>> +#define NOSPEC_BARRIER_FIXUP_SECTION			\
>> +953:							\
>> +	.pushsection __barrier_nospec_fixup,"a";	\
>> +	.align 2;					\
>> +954:							\
>> +	FTR_ENTRY_OFFSET 953b-954b;			\
>> +	.popsection;
>> +
>> +#define START_BTB_FLUSH_SECTION			\
>> +955:							\
>> +
>> +#define END_BTB_FLUSH_SECTION			\
>> +956:							\
>> +	.pushsection __btb_flush_fixup,"a";	\
>> +	.align 2;							\
>> +957:						\
>> +	FTR_ENTRY_OFFSET 955b-957b;			\
>> +	FTR_ENTRY_OFFSET 956b-957b;			\
>> +	.popsection;
>>  
>>  #ifndef __ASSEMBLY__
>>  
>> +extern long stf_barrier_fallback;
>> +extern long __start___stf_entry_barrier_fixup, __stop___stf_entry_barrier_fixup;
>> +extern long __start___stf_exit_barrier_fixup, __stop___stf_exit_barrier_fixup;
>>  extern long __start___rfi_flush_fixup, __stop___rfi_flush_fixup;
>> +extern long __start___barrier_nospec_fixup, __stop___barrier_nospec_fixup;
>> +extern long __start__btb_flush_fixup, __stop__btb_flush_fixup;
>>  
>>  #endif
>>  
>> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
>> index 449bbb87c257..b57db9d09db9 100644
>> - --- a/arch/powerpc/include/asm/hvcall.h
>> +++ b/arch/powerpc/include/asm/hvcall.h
>> @@ -292,10 +292,15 @@
>>  #define H_CPU_CHAR_L1D_FLUSH_ORI30	(1ull << 61) // IBM bit 2
>>  #define H_CPU_CHAR_L1D_FLUSH_TRIG2	(1ull << 60) // IBM bit 3
>>  #define H_CPU_CHAR_L1D_THREAD_PRIV	(1ull << 59) // IBM bit 4
>> +#define H_CPU_CHAR_BRANCH_HINTS_HONORED	(1ull << 58) // IBM bit 5
>> +#define H_CPU_CHAR_THREAD_RECONFIG_CTRL	(1ull << 57) // IBM bit 6
>> +#define H_CPU_CHAR_COUNT_CACHE_DISABLED	(1ull << 56) // IBM bit 7
>> +#define H_CPU_CHAR_BCCTR_FLUSH_ASSIST	(1ull << 54) // IBM bit 9
>>  
>>  #define H_CPU_BEHAV_FAVOUR_SECURITY	(1ull << 63) // IBM bit 0
>>  #define H_CPU_BEHAV_L1D_FLUSH_PR	(1ull << 62) // IBM bit 1
>>  #define H_CPU_BEHAV_BNDS_CHK_SPEC_BAR	(1ull << 61) // IBM bit 2
>> +#define H_CPU_BEHAV_FLUSH_COUNT_CACHE	(1ull << 58) // IBM bit 5
>>  
>>  #ifndef __ASSEMBLY__
>>  #include <linux/types.h>
>> diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
>> index 45e2aefece16..08e5df3395fa 100644
>> - --- a/arch/powerpc/include/asm/paca.h
>> +++ b/arch/powerpc/include/asm/paca.h
>> @@ -199,8 +199,7 @@ struct paca_struct {
>>  	 */
>>  	u64 exrfi[13] __aligned(0x80);
>>  	void *rfi_flush_fallback_area;
>> - -	u64 l1d_flush_congruence;
>> - -	u64 l1d_flush_sets;
>> +	u64 l1d_flush_size;
>>  #endif
>>  };
>>  
>> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
>> index 7ab04fc59e24..faf1bb045dee 100644
>> - --- a/arch/powerpc/include/asm/ppc-opcode.h
>> +++ b/arch/powerpc/include/asm/ppc-opcode.h
>> @@ -147,6 +147,7 @@
>>  #define PPC_INST_LWSYNC			0x7c2004ac
>>  #define PPC_INST_SYNC			0x7c0004ac
>>  #define PPC_INST_SYNC_MASK		0xfc0007fe
>> +#define PPC_INST_ISYNC			0x4c00012c
>>  #define PPC_INST_LXVD2X			0x7c000698
>>  #define PPC_INST_MCRXR			0x7c000400
>>  #define PPC_INST_MCRXR_MASK		0xfc0007fe
>> diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
>> index 160bb2311bbb..d219816b3e19 100644
>> - --- a/arch/powerpc/include/asm/ppc_asm.h
>> +++ b/arch/powerpc/include/asm/ppc_asm.h
>> @@ -821,4 +821,15 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,945)
>>  	.long 0x2400004c  /* rfid				*/
>>  #endif /* !CONFIG_PPC_BOOK3E */
>>  #endif /*  __ASSEMBLY__ */
>> +
>> +#ifdef CONFIG_PPC_FSL_BOOK3E
>> +#define BTB_FLUSH(reg)			\
>> +	lis reg,BUCSR_INIT@h;		\
>> +	ori reg,reg,BUCSR_INIT@l;	\
>> +	mtspr SPRN_BUCSR,reg;		\
>> +	isync;
>> +#else
>> +#define BTB_FLUSH(reg)
>> +#endif /* CONFIG_PPC_FSL_BOOK3E */
>> +
>>  #endif /* _ASM_POWERPC_PPC_ASM_H */
>> diff --git a/arch/powerpc/include/asm/security_features.h b/arch/powerpc/include/asm/security_features.h
>> new file mode 100644
>> index 000000000000..759597bf0fd8
>> - --- /dev/null
>> +++ b/arch/powerpc/include/asm/security_features.h
>> @@ -0,0 +1,92 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Security related feature bit definitions.
>> + *
>> + * Copyright 2018, Michael Ellerman, IBM Corporation.
>> + */
>> +
>> +#ifndef _ASM_POWERPC_SECURITY_FEATURES_H
>> +#define _ASM_POWERPC_SECURITY_FEATURES_H
>> +
>> +
>> +extern unsigned long powerpc_security_features;
>> +extern bool rfi_flush;
>> +
>> +/* These are bit flags */
>> +enum stf_barrier_type {
>> +	STF_BARRIER_NONE	= 0x1,
>> +	STF_BARRIER_FALLBACK	= 0x2,
>> +	STF_BARRIER_EIEIO	= 0x4,
>> +	STF_BARRIER_SYNC_ORI	= 0x8,
>> +};
>> +
>> +void setup_stf_barrier(void);
>> +void do_stf_barrier_fixups(enum stf_barrier_type types);
>> +void setup_count_cache_flush(void);
>> +
>> +static inline void security_ftr_set(unsigned long feature)
>> +{
>> +	powerpc_security_features |= feature;
>> +}
>> +
>> +static inline void security_ftr_clear(unsigned long feature)
>> +{
>> +	powerpc_security_features &= ~feature;
>> +}
>> +
>> +static inline bool security_ftr_enabled(unsigned long feature)
>> +{
>> +	return !!(powerpc_security_features & feature);
>> +}
>> +
>> +
>> +// Features indicating support for Spectre/Meltdown mitigations
>> +
>> +// The L1-D cache can be flushed with ori r30,r30,0
>> +#define SEC_FTR_L1D_FLUSH_ORI30		0x0000000000000001ull
>> +
>> +// The L1-D cache can be flushed with mtspr 882,r0 (aka SPRN_TRIG2)
>> +#define SEC_FTR_L1D_FLUSH_TRIG2		0x0000000000000002ull
>> +
>> +// ori r31,r31,0 acts as a speculation barrier
>> +#define SEC_FTR_SPEC_BAR_ORI31		0x0000000000000004ull
>> +
>> +// Speculation past bctr is disabled
>> +#define SEC_FTR_BCCTRL_SERIALISED	0x0000000000000008ull
>> +
>> +// Entries in L1-D are private to a SMT thread
>> +#define SEC_FTR_L1D_THREAD_PRIV		0x0000000000000010ull
>> +
>> +// Indirect branch prediction cache disabled
>> +#define SEC_FTR_COUNT_CACHE_DISABLED	0x0000000000000020ull
>> +
>> +// bcctr 2,0,0 triggers a hardware assisted count cache flush
>> +#define SEC_FTR_BCCTR_FLUSH_ASSIST	0x0000000000000800ull
>> +
>> +
>> +// Features indicating need for Spectre/Meltdown mitigations
>> +
>> +// The L1-D cache should be flushed on MSR[HV] 1->0 transition (hypervisor to guest)
>> +#define SEC_FTR_L1D_FLUSH_HV		0x0000000000000040ull
>> +
>> +// The L1-D cache should be flushed on MSR[PR] 0->1 transition (kernel to userspace)
>> +#define SEC_FTR_L1D_FLUSH_PR		0x0000000000000080ull
>> +
>> +// A speculation barrier should be used for bounds checks (Spectre variant 1)
>> +#define SEC_FTR_BNDS_CHK_SPEC_BAR	0x0000000000000100ull
>> +
>> +// Firmware configuration indicates user favours security over performance
>> +#define SEC_FTR_FAVOUR_SECURITY		0x0000000000000200ull
>> +
>> +// Software required to flush count cache on context switch
>> +#define SEC_FTR_FLUSH_COUNT_CACHE	0x0000000000000400ull
>> +
>> +
>> +// Features enabled by default
>> +#define SEC_FTR_DEFAULT \
>> +	(SEC_FTR_L1D_FLUSH_HV | \
>> +	 SEC_FTR_L1D_FLUSH_PR | \
>> +	 SEC_FTR_BNDS_CHK_SPEC_BAR | \
>> +	 SEC_FTR_FAVOUR_SECURITY)
>> +
>> +#endif /* _ASM_POWERPC_SECURITY_FEATURES_H */
>> diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
>> index 7916b56f2e60..d299479c770b 100644
>> - --- a/arch/powerpc/include/asm/setup.h
>> +++ b/arch/powerpc/include/asm/setup.h
>> @@ -8,6 +8,7 @@ extern void ppc_printk_progress(char *s, unsigned short hex);
>>  
>>  extern unsigned int rtas_data;
>>  extern unsigned long long memory_limit;
>> +extern bool init_mem_is_free;
>>  extern unsigned long klimit;
>>  extern void *zalloc_maybe_bootmem(size_t size, gfp_t mask);
>>  
>> @@ -36,8 +37,28 @@ enum l1d_flush_type {
>>  	L1D_FLUSH_MTTRIG	= 0x8,
>>  };
>>  
>> - -void __init setup_rfi_flush(enum l1d_flush_type, bool enable);
>> +void setup_rfi_flush(enum l1d_flush_type, bool enable);
>>  void do_rfi_flush_fixups(enum l1d_flush_type types);
>> +#ifdef CONFIG_PPC_BARRIER_NOSPEC
>> +void setup_barrier_nospec(void);
>> +#else
>> +static inline void setup_barrier_nospec(void) { };
>> +#endif
>> +void do_barrier_nospec_fixups(bool enable);
>> +extern bool barrier_nospec_enabled;
>> +
>> +#ifdef CONFIG_PPC_BARRIER_NOSPEC
>> +void do_barrier_nospec_fixups_range(bool enable, void *start, void *end);
>> +#else
>> +static inline void do_barrier_nospec_fixups_range(bool enable, void *start, void *end) { };
>> +#endif
>> +
>> +#ifdef CONFIG_PPC_FSL_BOOK3E
>> +void setup_spectre_v2(void);
>> +#else
>> +static inline void setup_spectre_v2(void) {};
>> +#endif
>> +void do_btb_flush_fixups(void);
>>  
>>  #endif /* !__ASSEMBLY__ */
>>  
>> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
>> index 05f1389228d2..e51ce5a0e221 100644
>> - --- a/arch/powerpc/include/asm/uaccess.h
>> +++ b/arch/powerpc/include/asm/uaccess.h
>> @@ -269,6 +269,7 @@ do {								\
>>  	__chk_user_ptr(ptr);					\
>>  	if (!is_kernel_addr((unsigned long)__gu_addr))		\
>>  		might_fault();					\
>> +	barrier_nospec();					\
>>  	__get_user_size(__gu_val, __gu_addr, (size), __gu_err);	\
>>  	(x) = (__typeof__(*(ptr)))__gu_val;			\
>>  	__gu_err;						\
>> @@ -283,6 +284,7 @@ do {								\
>>  	__chk_user_ptr(ptr);					\
>>  	if (!is_kernel_addr((unsigned long)__gu_addr))		\
>>  		might_fault();					\
>> +	barrier_nospec();					\
>>  	__get_user_size(__gu_val, __gu_addr, (size), __gu_err);	\
>>  	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
>>  	__gu_err;						\
>> @@ -295,8 +297,10 @@ do {								\
>>  	unsigned long  __gu_val = 0;					\
>>  	__typeof__(*(ptr)) __user *__gu_addr = (ptr);		\
>>  	might_fault();							\
>> - -	if (access_ok(VERIFY_READ, __gu_addr, (size)))			\
>> +	if (access_ok(VERIFY_READ, __gu_addr, (size))) {		\
>> +		barrier_nospec();					\
>>  		__get_user_size(__gu_val, __gu_addr, (size), __gu_err);	\
>> +	}								\
>>  	(x) = (__force __typeof__(*(ptr)))__gu_val;				\
>>  	__gu_err;							\
>>  })
>> @@ -307,6 +311,7 @@ do {								\
>>  	unsigned long __gu_val;					\
>>  	__typeof__(*(ptr)) __user *__gu_addr = (ptr);	\
>>  	__chk_user_ptr(ptr);					\
>> +	barrier_nospec();					\
>>  	__get_user_size(__gu_val, __gu_addr, (size), __gu_err);	\
>>  	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
>>  	__gu_err;						\
>> @@ -323,8 +328,10 @@ extern unsigned long __copy_tofrom_user(void __user *to,
>>  static inline unsigned long copy_from_user(void *to,
>>  		const void __user *from, unsigned long n)
>>  {
>> - -	if (likely(access_ok(VERIFY_READ, from, n)))
>> +	if (likely(access_ok(VERIFY_READ, from, n))) {
>> +		barrier_nospec();
>>  		return __copy_tofrom_user((__force void __user *)to, from, n);
>> +	}
>>  	memset(to, 0, n);
>>  	return n;
>>  }
>> @@ -359,21 +366,27 @@ static inline unsigned long __copy_from_user_inatomic(void *to,
>>  
>>  		switch (n) {
>>  		case 1:
>> +			barrier_nospec();
>>  			__get_user_size(*(u8 *)to, from, 1, ret);
>>  			break;
>>  		case 2:
>> +			barrier_nospec();
>>  			__get_user_size(*(u16 *)to, from, 2, ret);
>>  			break;
>>  		case 4:
>> +			barrier_nospec();
>>  			__get_user_size(*(u32 *)to, from, 4, ret);
>>  			break;
>>  		case 8:
>> +			barrier_nospec();
>>  			__get_user_size(*(u64 *)to, from, 8, ret);
>>  			break;
>>  		}
>>  		if (ret == 0)
>>  			return 0;
>>  	}
>> +
>> +	barrier_nospec();
>>  	return __copy_tofrom_user((__force void __user *)to, from, n);
>>  }
>>  
>> @@ -400,6 +413,7 @@ static inline unsigned long __copy_to_user_inatomic(void __user *to,
>>  		if (ret == 0)
>>  			return 0;
>>  	}
>> +
>>  	return __copy_tofrom_user(to, (__force const void __user *)from, n);
>>  }
>>  
>> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
>> index ba336930d448..22ed3c32fca8 100644
>> - --- a/arch/powerpc/kernel/Makefile
>> +++ b/arch/powerpc/kernel/Makefile
>> @@ -44,6 +44,7 @@ obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_power.o
>>  obj-$(CONFIG_PPC_BOOK3S_64)	+= mce.o mce_power.o
>>  obj64-$(CONFIG_RELOCATABLE)	+= reloc_64.o
>>  obj-$(CONFIG_PPC_BOOK3E_64)	+= exceptions-64e.o idle_book3e.o
>> +obj-$(CONFIG_PPC_BARRIER_NOSPEC) += security.o
>>  obj-$(CONFIG_PPC64)		+= vdso64/
>>  obj-$(CONFIG_ALTIVEC)		+= vecemu.o
>>  obj-$(CONFIG_PPC_970_NAP)	+= idle_power4.o
>> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
>> index d92705e3a0c1..de3c29c51503 100644
>> - --- a/arch/powerpc/kernel/asm-offsets.c
>> +++ b/arch/powerpc/kernel/asm-offsets.c
>> @@ -245,8 +245,7 @@ int main(void)
>>  	DEFINE(PACA_IN_MCE, offsetof(struct paca_struct, in_mce));
>>  	DEFINE(PACA_RFI_FLUSH_FALLBACK_AREA, offsetof(struct paca_struct, rfi_flush_fallback_area));
>>  	DEFINE(PACA_EXRFI, offsetof(struct paca_struct, exrfi));
>> - -	DEFINE(PACA_L1D_FLUSH_CONGRUENCE, offsetof(struct paca_struct, l1d_flush_congruence));
>> - -	DEFINE(PACA_L1D_FLUSH_SETS, offsetof(struct paca_struct, l1d_flush_sets));
>> +	DEFINE(PACA_L1D_FLUSH_SIZE, offsetof(struct paca_struct, l1d_flush_size));
>>  #endif
>>  	DEFINE(PACAHWCPUID, offsetof(struct paca_struct, hw_cpu_id));
>>  	DEFINE(PACAKEXECSTATE, offsetof(struct paca_struct, kexec_state));
>> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
>> index 59be96917369..6d36a4fb4acf 100644
>> - --- a/arch/powerpc/kernel/entry_64.S
>> +++ b/arch/powerpc/kernel/entry_64.S
>> @@ -25,6 +25,7 @@
>>  #include <asm/page.h>
>>  #include <asm/mmu.h>
>>  #include <asm/thread_info.h>
>> +#include <asm/code-patching-asm.h>
>>  #include <asm/ppc_asm.h>
>>  #include <asm/asm-offsets.h>
>>  #include <asm/cputable.h>
>> @@ -36,6 +37,7 @@
>>  #include <asm/hw_irq.h>
>>  #include <asm/context_tracking.h>
>>  #include <asm/tm.h>
>> +#include <asm/barrier.h>
>>  #ifdef CONFIG_PPC_BOOK3S
>>  #include <asm/exception-64s.h>
>>  #else
>> @@ -75,6 +77,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
>>  	std	r0,GPR0(r1)
>>  	std	r10,GPR1(r1)
>>  	beq	2f			/* if from kernel mode */
>> +#ifdef CONFIG_PPC_FSL_BOOK3E
>> +START_BTB_FLUSH_SECTION
>> +	BTB_FLUSH(r10)
>> +END_BTB_FLUSH_SECTION
>> +#endif
>>  	ACCOUNT_CPU_USER_ENTRY(r10, r11)
>>  2:	std	r2,GPR2(r1)
>>  	std	r3,GPR3(r1)
>> @@ -177,6 +184,15 @@ system_call:			/* label this so stack traces look sane */
>>  	clrldi	r8,r8,32
>>  15:
>>  	slwi	r0,r0,4
>> +
>> +	barrier_nospec_asm
>> +	/*
>> +	 * Prevent the load of the handler below (based on the user-passed
>> +	 * system call number) being speculatively executed until the test
>> +	 * against NR_syscalls and branch to .Lsyscall_enosys above has
>> +	 * committed.
>> +	 */
>> +
>>  	ldx	r12,r11,r0	/* Fetch system call handler [ptr] */
>>  	mtctr   r12
>>  	bctrl			/* Call handler */
>> @@ -440,6 +456,57 @@ _GLOBAL(ret_from_kernel_thread)
>>  	li	r3,0
>>  	b	.Lsyscall_exit
>>  
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +
>> +#define FLUSH_COUNT_CACHE	\
>> +1:	nop;			\
>> +	patch_site 1b, patch__call_flush_count_cache
>> +
>> +
>> +#define BCCTR_FLUSH	.long 0x4c400420
>> +
>> +.macro nops number
>> +	.rept \number
>> +	nop
>> +	.endr
>> +.endm
>> +
>> +.balign 32
>> +.global flush_count_cache
>> +flush_count_cache:
>> +	/* Save LR into r9 */
>> +	mflr	r9
>> +
>> +	.rept 64
>> +	bl	.+4
>> +	.endr
>> +	b	1f
>> +	nops	6
>> +
>> +	.balign 32
>> +	/* Restore LR */
>> +1:	mtlr	r9
>> +	li	r9,0x7fff
>> +	mtctr	r9
>> +
>> +	BCCTR_FLUSH
>> +
>> +2:	nop
>> +	patch_site 2b patch__flush_count_cache_return
>> +
>> +	nops	3
>> +
>> +	.rept 278
>> +	.balign 32
>> +	BCCTR_FLUSH
>> +	nops	7
>> +	.endr
>> +
>> +	blr
>> +#else
>> +#define FLUSH_COUNT_CACHE
>> +#endif /* CONFIG_PPC_BOOK3S_64 */
>> +
>>  /*
>>   * This routine switches between two different tasks.  The process
>>   * state of one is saved on its kernel stack.  Then the state
>> @@ -503,6 +570,8 @@ BEGIN_FTR_SECTION
>>  END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
>>  #endif
>>  
>> +	FLUSH_COUNT_CACHE
>> +
>>  #ifdef CONFIG_SMP
>>  	/* We need a sync somewhere here to make sure that if the
>>  	 * previous task gets rescheduled on another CPU, it sees all
>> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
>> index 5cc93f0b52ca..48ec841ea1bf 100644
>> - --- a/arch/powerpc/kernel/exceptions-64e.S
>> +++ b/arch/powerpc/kernel/exceptions-64e.S
>> @@ -295,7 +295,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
>>  	andi.	r10,r11,MSR_PR;		/* save stack pointer */	    \
>>  	beq	1f;			/* branch around if supervisor */   \
>>  	ld	r1,PACAKSAVE(r13);	/* get kernel stack coming from usr */\
>> - -1:	cmpdi	cr1,r1,0;		/* check if SP makes sense */	    \
>> +1:	type##_BTB_FLUSH		\
>> +	cmpdi	cr1,r1,0;		/* check if SP makes sense */	    \
>>  	bge-	cr1,exc_##n##_bad_stack;/* bad stack (TODO: out of line) */ \
>>  	mfspr	r10,SPRN_##type##_SRR0;	/* read SRR0 before touching stack */
>>  
>> @@ -327,6 +328,30 @@ END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
>>  #define SPRN_MC_SRR0	SPRN_MCSRR0
>>  #define SPRN_MC_SRR1	SPRN_MCSRR1
>>  
>> +#ifdef CONFIG_PPC_FSL_BOOK3E
>> +#define GEN_BTB_FLUSH			\
>> +	START_BTB_FLUSH_SECTION		\
>> +		beq 1f;			\
>> +		BTB_FLUSH(r10)			\
>> +		1:		\
>> +	END_BTB_FLUSH_SECTION
>> +
>> +#define CRIT_BTB_FLUSH			\
>> +	START_BTB_FLUSH_SECTION		\
>> +		BTB_FLUSH(r10)		\
>> +	END_BTB_FLUSH_SECTION
>> +
>> +#define DBG_BTB_FLUSH CRIT_BTB_FLUSH
>> +#define MC_BTB_FLUSH CRIT_BTB_FLUSH
>> +#define GDBELL_BTB_FLUSH GEN_BTB_FLUSH
>> +#else
>> +#define GEN_BTB_FLUSH
>> +#define CRIT_BTB_FLUSH
>> +#define DBG_BTB_FLUSH
>> +#define MC_BTB_FLUSH
>> +#define GDBELL_BTB_FLUSH
>> +#endif
>> +
>>  #define NORMAL_EXCEPTION_PROLOG(n, intnum, addition)			    \
>>  	EXCEPTION_PROLOG(n, intnum, GEN, addition##_GEN(n))
>>  
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
>> index 938a30fef031..10e7cec9553d 100644
>> - --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -36,6 +36,7 @@ BEGIN_FTR_SECTION						\
>>  END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)				\
>>  	mr	r9,r13 ;					\
>>  	GET_PACA(r13) ;						\
>> +	INTERRUPT_TO_KERNEL ;					\
>>  	mfspr	r11,SPRN_SRR0 ;					\
>>  0:
>>  
>> @@ -292,7 +293,9 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
>>  	. = 0x900
>>  	.globl decrementer_pSeries
>>  decrementer_pSeries:
>> - -	_MASKABLE_EXCEPTION_PSERIES(0x900, decrementer, EXC_STD, SOFTEN_TEST_PR)
>> +	SET_SCRATCH0(r13)
>> +	EXCEPTION_PROLOG_0(PACA_EXGEN)
>> +	b	decrementer_ool
>>  
>>  	STD_EXCEPTION_HV(0x980, 0x982, hdecrementer)
>>  
>> @@ -319,6 +322,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
>>  	OPT_GET_SPR(r9, SPRN_PPR, CPU_FTR_HAS_PPR);
>>  	HMT_MEDIUM;
>>  	std	r10,PACA_EXGEN+EX_R10(r13)
>> +	INTERRUPT_TO_KERNEL
>>  	OPT_SAVE_REG_TO_PACA(PACA_EXGEN+EX_PPR, r9, CPU_FTR_HAS_PPR);
>>  	mfcr	r9
>>  	KVMTEST(0xc00)
>> @@ -607,6 +611,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>>  
>>  	.align	7
>>  	/* moved from 0xe00 */
>> +	MASKABLE_EXCEPTION_OOL(0x900, decrementer)
>>  	STD_EXCEPTION_HV_OOL(0xe02, h_data_storage)
>>  	KVM_HANDLER_SKIP(PACA_EXGEN, EXC_HV, 0xe02)
>>  	STD_EXCEPTION_HV_OOL(0xe22, h_instr_storage)
>> @@ -1564,6 +1569,21 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
>>  	blr
>>  #endif
>>  
>> +	.balign 16
>> +	.globl stf_barrier_fallback
>> +stf_barrier_fallback:
>> +	std	r9,PACA_EXRFI+EX_R9(r13)
>> +	std	r10,PACA_EXRFI+EX_R10(r13)
>> +	sync
>> +	ld	r9,PACA_EXRFI+EX_R9(r13)
>> +	ld	r10,PACA_EXRFI+EX_R10(r13)
>> +	ori	31,31,0
>> +	.rept 14
>> +	b	1f
>> +1:
>> +	.endr
>> +	blr
>> +
>>  	.globl rfi_flush_fallback
>>  rfi_flush_fallback:
>>  	SET_SCRATCH0(r13);
>> @@ -1571,39 +1591,37 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
>>  	std	r9,PACA_EXRFI+EX_R9(r13)
>>  	std	r10,PACA_EXRFI+EX_R10(r13)
>>  	std	r11,PACA_EXRFI+EX_R11(r13)
>> - -	std	r12,PACA_EXRFI+EX_R12(r13)
>> - -	std	r8,PACA_EXRFI+EX_R13(r13)
>>  	mfctr	r9
>>  	ld	r10,PACA_RFI_FLUSH_FALLBACK_AREA(r13)
>> - -	ld	r11,PACA_L1D_FLUSH_SETS(r13)
>> - -	ld	r12,PACA_L1D_FLUSH_CONGRUENCE(r13)
>> - -	/*
>> - -	 * The load adresses are at staggered offsets within cachelines,
>> - -	 * which suits some pipelines better (on others it should not
>> - -	 * hurt).
>> - -	 */
>> - -	addi	r12,r12,8
>> +	ld	r11,PACA_L1D_FLUSH_SIZE(r13)
>> +	srdi	r11,r11,(7 + 3) /* 128 byte lines, unrolled 8x */
>>  	mtctr	r11
>>  	DCBT_STOP_ALL_STREAM_IDS(r11) /* Stop prefetch streams */
>>  
>>  	/* order ld/st prior to dcbt stop all streams with flushing */
>>  	sync
>> - -1:	li	r8,0
>> - -	.rept	8 /* 8-way set associative */
>> - -	ldx	r11,r10,r8
>> - -	add	r8,r8,r12
>> - -	xor	r11,r11,r11	// Ensure r11 is 0 even if fallback area is not
>> - -	add	r8,r8,r11	// Add 0, this creates a dependency on the ldx
>> - -	.endr
>> - -	addi	r10,r10,128 /* 128 byte cache line */
>> +
>> +	/*
>> +	 * The load adresses are at staggered offsets within cachelines,
>> +	 * which suits some pipelines better (on others it should not
>> +	 * hurt).
>> +	 */
>> +1:
>> +	ld	r11,(0x80 + 8)*0(r10)
>> +	ld	r11,(0x80 + 8)*1(r10)
>> +	ld	r11,(0x80 + 8)*2(r10)
>> +	ld	r11,(0x80 + 8)*3(r10)
>> +	ld	r11,(0x80 + 8)*4(r10)
>> +	ld	r11,(0x80 + 8)*5(r10)
>> +	ld	r11,(0x80 + 8)*6(r10)
>> +	ld	r11,(0x80 + 8)*7(r10)
>> +	addi	r10,r10,0x80*8
>>  	bdnz	1b
>>  
>>  	mtctr	r9
>>  	ld	r9,PACA_EXRFI+EX_R9(r13)
>>  	ld	r10,PACA_EXRFI+EX_R10(r13)
>>  	ld	r11,PACA_EXRFI+EX_R11(r13)
>> - -	ld	r12,PACA_EXRFI+EX_R12(r13)
>> - -	ld	r8,PACA_EXRFI+EX_R13(r13)
>>  	GET_SCRATCH0(r13);
>>  	rfid
>>  
>> @@ -1614,39 +1632,37 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
>>  	std	r9,PACA_EXRFI+EX_R9(r13)
>>  	std	r10,PACA_EXRFI+EX_R10(r13)
>>  	std	r11,PACA_EXRFI+EX_R11(r13)
>> - -	std	r12,PACA_EXRFI+EX_R12(r13)
>> - -	std	r8,PACA_EXRFI+EX_R13(r13)
>>  	mfctr	r9
>>  	ld	r10,PACA_RFI_FLUSH_FALLBACK_AREA(r13)
>> - -	ld	r11,PACA_L1D_FLUSH_SETS(r13)
>> - -	ld	r12,PACA_L1D_FLUSH_CONGRUENCE(r13)
>> - -	/*
>> - -	 * The load adresses are at staggered offsets within cachelines,
>> - -	 * which suits some pipelines better (on others it should not
>> - -	 * hurt).
>> - -	 */
>> - -	addi	r12,r12,8
>> +	ld	r11,PACA_L1D_FLUSH_SIZE(r13)
>> +	srdi	r11,r11,(7 + 3) /* 128 byte lines, unrolled 8x */
>>  	mtctr	r11
>>  	DCBT_STOP_ALL_STREAM_IDS(r11) /* Stop prefetch streams */
>>  
>>  	/* order ld/st prior to dcbt stop all streams with flushing */
>>  	sync
>> - -1:	li	r8,0
>> - -	.rept	8 /* 8-way set associative */
>> - -	ldx	r11,r10,r8
>> - -	add	r8,r8,r12
>> - -	xor	r11,r11,r11	// Ensure r11 is 0 even if fallback area is not
>> - -	add	r8,r8,r11	// Add 0, this creates a dependency on the ldx
>> - -	.endr
>> - -	addi	r10,r10,128 /* 128 byte cache line */
>> +
>> +	/*
>> +	 * The load adresses are at staggered offsets within cachelines,
>> +	 * which suits some pipelines better (on others it should not
>> +	 * hurt).
>> +	 */
>> +1:
>> +	ld	r11,(0x80 + 8)*0(r10)
>> +	ld	r11,(0x80 + 8)*1(r10)
>> +	ld	r11,(0x80 + 8)*2(r10)
>> +	ld	r11,(0x80 + 8)*3(r10)
>> +	ld	r11,(0x80 + 8)*4(r10)
>> +	ld	r11,(0x80 + 8)*5(r10)
>> +	ld	r11,(0x80 + 8)*6(r10)
>> +	ld	r11,(0x80 + 8)*7(r10)
>> +	addi	r10,r10,0x80*8
>>  	bdnz	1b
>>  
>>  	mtctr	r9
>>  	ld	r9,PACA_EXRFI+EX_R9(r13)
>>  	ld	r10,PACA_EXRFI+EX_R10(r13)
>>  	ld	r11,PACA_EXRFI+EX_R11(r13)
>> - -	ld	r12,PACA_EXRFI+EX_R12(r13)
>> - -	ld	r8,PACA_EXRFI+EX_R13(r13)
>>  	GET_SCRATCH0(r13);
>>  	hrfid
>>  
>> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
>> index 9547381b631a..ff009be97a42 100644
>> - --- a/arch/powerpc/kernel/module.c
>> +++ b/arch/powerpc/kernel/module.c
>> @@ -67,7 +67,15 @@ int module_finalize(const Elf_Ehdr *hdr,
>>  		do_feature_fixups(powerpc_firmware_features,
>>  				  (void *)sect->sh_addr,
>>  				  (void *)sect->sh_addr + sect->sh_size);
>> - -#endif
>> +#endif /* CONFIG_PPC64 */
>> +
>> +#ifdef CONFIG_PPC_BARRIER_NOSPEC
>> +	sect = find_section(hdr, sechdrs, "__spec_barrier_fixup");
>> +	if (sect != NULL)
>> +		do_barrier_nospec_fixups_range(barrier_nospec_enabled,
>> +				  (void *)sect->sh_addr,
>> +				  (void *)sect->sh_addr + sect->sh_size);
>> +#endif /* CONFIG_PPC_BARRIER_NOSPEC */
>>  
>>  	sect = find_section(hdr, sechdrs, "__lwsync_fixup");
>>  	if (sect != NULL)
>> diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
>> new file mode 100644
>> index 000000000000..58f0602a92b9
>> - --- /dev/null
>> +++ b/arch/powerpc/kernel/security.c
>> @@ -0,0 +1,433 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +//
>> +// Security related flags and so on.
>> +//
>> +// Copyright 2018, Michael Ellerman, IBM Corporation.
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/device.h>
>> +#include <linux/seq_buf.h>
>> +
>> +#include <asm/debug.h>
>> +#include <asm/asm-prototypes.h>
>> +#include <asm/code-patching.h>
>> +#include <asm/security_features.h>
>> +#include <asm/setup.h>
>> +
>> +
>> +unsigned long powerpc_security_features __read_mostly = SEC_FTR_DEFAULT;
>> +
>> +enum count_cache_flush_type {
>> +	COUNT_CACHE_FLUSH_NONE	= 0x1,
>> +	COUNT_CACHE_FLUSH_SW	= 0x2,
>> +	COUNT_CACHE_FLUSH_HW	= 0x4,
>> +};
>> +static enum count_cache_flush_type count_cache_flush_type = COUNT_CACHE_FLUSH_NONE;
>> +
>> +bool barrier_nospec_enabled;
>> +static bool no_nospec;
>> +static bool btb_flush_enabled;
>> +#ifdef CONFIG_PPC_FSL_BOOK3E
>> +static bool no_spectrev2;
>> +#endif
>> +
>> +static void enable_barrier_nospec(bool enable)
>> +{
>> +	barrier_nospec_enabled = enable;
>> +	do_barrier_nospec_fixups(enable);
>> +}
>> +
>> +void setup_barrier_nospec(void)
>> +{
>> +	bool enable;
>> +
>> +	/*
>> +	 * It would make sense to check SEC_FTR_SPEC_BAR_ORI31 below as well.
>> +	 * But there's a good reason not to. The two flags we check below are
>> +	 * both are enabled by default in the kernel, so if the hcall is not
>> +	 * functional they will be enabled.
>> +	 * On a system where the host firmware has been updated (so the ori
>> +	 * functions as a barrier), but on which the hypervisor (KVM/Qemu) has
>> +	 * not been updated, we would like to enable the barrier. Dropping the
>> +	 * check for SEC_FTR_SPEC_BAR_ORI31 achieves that. The only downside is
>> +	 * we potentially enable the barrier on systems where the host firmware
>> +	 * is not updated, but that's harmless as it's a no-op.
>> +	 */
>> +	enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) &&
>> +		 security_ftr_enabled(SEC_FTR_BNDS_CHK_SPEC_BAR);
>> +
>> +	if (!no_nospec)
>> +		enable_barrier_nospec(enable);
>> +}
>> +
>> +static int __init handle_nospectre_v1(char *p)
>> +{
>> +	no_nospec = true;
>> +
>> +	return 0;
>> +}
>> +early_param("nospectre_v1", handle_nospectre_v1);
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +static int barrier_nospec_set(void *data, u64 val)
>> +{
>> +	switch (val) {
>> +	case 0:
>> +	case 1:
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (!!val == !!barrier_nospec_enabled)
>> +		return 0;
>> +
>> +	enable_barrier_nospec(!!val);
>> +
>> +	return 0;
>> +}
>> +
>> +static int barrier_nospec_get(void *data, u64 *val)
>> +{
>> +	*val = barrier_nospec_enabled ? 1 : 0;
>> +	return 0;
>> +}
>> +
>> +DEFINE_SIMPLE_ATTRIBUTE(fops_barrier_nospec,
>> +			barrier_nospec_get, barrier_nospec_set, "%llu\n");
>> +
>> +static __init int barrier_nospec_debugfs_init(void)
>> +{
>> +	debugfs_create_file("barrier_nospec", 0600, powerpc_debugfs_root, NULL,
>> +			    &fops_barrier_nospec);
>> +	return 0;
>> +}
>> +device_initcall(barrier_nospec_debugfs_init);
>> +#endif /* CONFIG_DEBUG_FS */
>> +
>> +#ifdef CONFIG_PPC_FSL_BOOK3E
>> +static int __init handle_nospectre_v2(char *p)
>> +{
>> +	no_spectrev2 = true;
>> +
>> +	return 0;
>> +}
>> +early_param("nospectre_v2", handle_nospectre_v2);
>> +void setup_spectre_v2(void)
>> +{
>> +	if (no_spectrev2)
>> +		do_btb_flush_fixups();
>> +	else
>> +		btb_flush_enabled = true;
>> +}
>> +#endif /* CONFIG_PPC_FSL_BOOK3E */
>> +
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +ssize_t cpu_show_meltdown(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +	bool thread_priv;
>> +
>> +	thread_priv = security_ftr_enabled(SEC_FTR_L1D_THREAD_PRIV);
>> +
>> +	if (rfi_flush || thread_priv) {
>> +		struct seq_buf s;
>> +		seq_buf_init(&s, buf, PAGE_SIZE - 1);
>> +
>> +		seq_buf_printf(&s, "Mitigation: ");
>> +
>> +		if (rfi_flush)
>> +			seq_buf_printf(&s, "RFI Flush");
>> +
>> +		if (rfi_flush && thread_priv)
>> +			seq_buf_printf(&s, ", ");
>> +
>> +		if (thread_priv)
>> +			seq_buf_printf(&s, "L1D private per thread");
>> +
>> +		seq_buf_printf(&s, "\n");
>> +
>> +		return s.len;
>> +	}
>> +
>> +	if (!security_ftr_enabled(SEC_FTR_L1D_FLUSH_HV) &&
>> +	    !security_ftr_enabled(SEC_FTR_L1D_FLUSH_PR))
>> +		return sprintf(buf, "Not affected\n");
>> +
>> +	return sprintf(buf, "Vulnerable\n");
>> +}
>> +#endif
>> +
>> +ssize_t cpu_show_spectre_v1(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +	struct seq_buf s;
>> +
>> +	seq_buf_init(&s, buf, PAGE_SIZE - 1);
>> +
>> +	if (security_ftr_enabled(SEC_FTR_BNDS_CHK_SPEC_BAR)) {
>> +		if (barrier_nospec_enabled)
>> +			seq_buf_printf(&s, "Mitigation: __user pointer sanitization");
>> +		else
>> +			seq_buf_printf(&s, "Vulnerable");
>> +
>> +		if (security_ftr_enabled(SEC_FTR_SPEC_BAR_ORI31))
>> +			seq_buf_printf(&s, ", ori31 speculation barrier enabled");
>> +
>> +		seq_buf_printf(&s, "\n");
>> +	} else
>> +		seq_buf_printf(&s, "Not affected\n");
>> +
>> +	return s.len;
>> +}
>> +
>> +ssize_t cpu_show_spectre_v2(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +	struct seq_buf s;
>> +	bool bcs, ccd;
>> +
>> +	seq_buf_init(&s, buf, PAGE_SIZE - 1);
>> +
>> +	bcs = security_ftr_enabled(SEC_FTR_BCCTRL_SERIALISED);
>> +	ccd = security_ftr_enabled(SEC_FTR_COUNT_CACHE_DISABLED);
>> +
>> +	if (bcs || ccd) {
>> +		seq_buf_printf(&s, "Mitigation: ");
>> +
>> +		if (bcs)
>> +			seq_buf_printf(&s, "Indirect branch serialisation (kernel only)");
>> +
>> +		if (bcs && ccd)
>> +			seq_buf_printf(&s, ", ");
>> +
>> +		if (ccd)
>> +			seq_buf_printf(&s, "Indirect branch cache disabled");
>> +	} else if (count_cache_flush_type != COUNT_CACHE_FLUSH_NONE) {
>> +		seq_buf_printf(&s, "Mitigation: Software count cache flush");
>> +
>> +		if (count_cache_flush_type == COUNT_CACHE_FLUSH_HW)
>> +			seq_buf_printf(&s, " (hardware accelerated)");
>> +	} else if (btb_flush_enabled) {
>> +		seq_buf_printf(&s, "Mitigation: Branch predictor state flush");
>> +	} else {
>> +		seq_buf_printf(&s, "Vulnerable");
>> +	}
>> +
>> +	seq_buf_printf(&s, "\n");
>> +
>> +	return s.len;
>> +}
>> +
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +/*
>> + * Store-forwarding barrier support.
>> + */
>> +
>> +static enum stf_barrier_type stf_enabled_flush_types;
>> +static bool no_stf_barrier;
>> +bool stf_barrier;
>> +
>> +static int __init handle_no_stf_barrier(char *p)
>> +{
>> +	pr_info("stf-barrier: disabled on command line.");
>> +	no_stf_barrier = true;
>> +	return 0;
>> +}
>> +
>> +early_param("no_stf_barrier", handle_no_stf_barrier);
>> +
>> +/* This is the generic flag used by other architectures */
>> +static int __init handle_ssbd(char *p)
>> +{
>> +	if (!p || strncmp(p, "auto", 5) == 0 || strncmp(p, "on", 2) == 0 ) {
>> +		/* Until firmware tells us, we have the barrier with auto */
>> +		return 0;
>> +	} else if (strncmp(p, "off", 3) == 0) {
>> +		handle_no_stf_barrier(NULL);
>> +		return 0;
>> +	} else
>> +		return 1;
>> +
>> +	return 0;
>> +}
>> +early_param("spec_store_bypass_disable", handle_ssbd);
>> +
>> +/* This is the generic flag used by other architectures */
>> +static int __init handle_no_ssbd(char *p)
>> +{
>> +	handle_no_stf_barrier(NULL);
>> +	return 0;
>> +}
>> +early_param("nospec_store_bypass_disable", handle_no_ssbd);
>> +
>> +static void stf_barrier_enable(bool enable)
>> +{
>> +	if (enable)
>> +		do_stf_barrier_fixups(stf_enabled_flush_types);
>> +	else
>> +		do_stf_barrier_fixups(STF_BARRIER_NONE);
>> +
>> +	stf_barrier = enable;
>> +}
>> +
>> +void setup_stf_barrier(void)
>> +{
>> +	enum stf_barrier_type type;
>> +	bool enable, hv;
>> +
>> +	hv = cpu_has_feature(CPU_FTR_HVMODE);
>> +
>> +	/* Default to fallback in case fw-features are not available */
>> +	if (cpu_has_feature(CPU_FTR_ARCH_207S))
>> +		type = STF_BARRIER_SYNC_ORI;
>> +	else if (cpu_has_feature(CPU_FTR_ARCH_206))
>> +		type = STF_BARRIER_FALLBACK;
>> +	else
>> +		type = STF_BARRIER_NONE;
>> +
>> +	enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) &&
>> +		(security_ftr_enabled(SEC_FTR_L1D_FLUSH_PR) ||
>> +		 (security_ftr_enabled(SEC_FTR_L1D_FLUSH_HV) && hv));
>> +
>> +	if (type == STF_BARRIER_FALLBACK) {
>> +		pr_info("stf-barrier: fallback barrier available\n");
>> +	} else if (type == STF_BARRIER_SYNC_ORI) {
>> +		pr_info("stf-barrier: hwsync barrier available\n");
>> +	} else if (type == STF_BARRIER_EIEIO) {
>> +		pr_info("stf-barrier: eieio barrier available\n");
>> +	}
>> +
>> +	stf_enabled_flush_types = type;
>> +
>> +	if (!no_stf_barrier)
>> +		stf_barrier_enable(enable);
>> +}
>> +
>> +ssize_t cpu_show_spec_store_bypass(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +	if (stf_barrier && stf_enabled_flush_types != STF_BARRIER_NONE) {
>> +		const char *type;
>> +		switch (stf_enabled_flush_types) {
>> +		case STF_BARRIER_EIEIO:
>> +			type = "eieio";
>> +			break;
>> +		case STF_BARRIER_SYNC_ORI:
>> +			type = "hwsync";
>> +			break;
>> +		case STF_BARRIER_FALLBACK:
>> +			type = "fallback";
>> +			break;
>> +		default:
>> +			type = "unknown";
>> +		}
>> +		return sprintf(buf, "Mitigation: Kernel entry/exit barrier (%s)\n", type);
>> +	}
>> +
>> +	if (!security_ftr_enabled(SEC_FTR_L1D_FLUSH_HV) &&
>> +	    !security_ftr_enabled(SEC_FTR_L1D_FLUSH_PR))
>> +		return sprintf(buf, "Not affected\n");
>> +
>> +	return sprintf(buf, "Vulnerable\n");
>> +}
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +static int stf_barrier_set(void *data, u64 val)
>> +{
>> +	bool enable;
>> +
>> +	if (val == 1)
>> +		enable = true;
>> +	else if (val == 0)
>> +		enable = false;
>> +	else
>> +		return -EINVAL;
>> +
>> +	/* Only do anything if we're changing state */
>> +	if (enable != stf_barrier)
>> +		stf_barrier_enable(enable);
>> +
>> +	return 0;
>> +}
>> +
>> +static int stf_barrier_get(void *data, u64 *val)
>> +{
>> +	*val = stf_barrier ? 1 : 0;
>> +	return 0;
>> +}
>> +
>> +DEFINE_SIMPLE_ATTRIBUTE(fops_stf_barrier, stf_barrier_get, stf_barrier_set, "%llu\n");
>> +
>> +static __init int stf_barrier_debugfs_init(void)
>> +{
>> +	debugfs_create_file("stf_barrier", 0600, powerpc_debugfs_root, NULL, &fops_stf_barrier);
>> +	return 0;
>> +}
>> +device_initcall(stf_barrier_debugfs_init);
>> +#endif /* CONFIG_DEBUG_FS */
>> +
>> +static void toggle_count_cache_flush(bool enable)
>> +{
>> +	if (!enable || !security_ftr_enabled(SEC_FTR_FLUSH_COUNT_CACHE)) {
>> +		patch_instruction_site(&patch__call_flush_count_cache, PPC_INST_NOP);
>> +		count_cache_flush_type = COUNT_CACHE_FLUSH_NONE;
>> +		pr_info("count-cache-flush: software flush disabled.\n");
>> +		return;
>> +	}
>> +
>> +	patch_branch_site(&patch__call_flush_count_cache,
>> +			  (u64)&flush_count_cache, BRANCH_SET_LINK);
>> +
>> +	if (!security_ftr_enabled(SEC_FTR_BCCTR_FLUSH_ASSIST)) {
>> +		count_cache_flush_type = COUNT_CACHE_FLUSH_SW;
>> +		pr_info("count-cache-flush: full software flush sequence enabled.\n");
>> +		return;
>> +	}
>> +
>> +	patch_instruction_site(&patch__flush_count_cache_return, PPC_INST_BLR);
>> +	count_cache_flush_type = COUNT_CACHE_FLUSH_HW;
>> +	pr_info("count-cache-flush: hardware assisted flush sequence enabled\n");
>> +}
>> +
>> +void setup_count_cache_flush(void)
>> +{
>> +	toggle_count_cache_flush(true);
>> +}
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +static int count_cache_flush_set(void *data, u64 val)
>> +{
>> +	bool enable;
>> +
>> +	if (val == 1)
>> +		enable = true;
>> +	else if (val == 0)
>> +		enable = false;
>> +	else
>> +		return -EINVAL;
>> +
>> +	toggle_count_cache_flush(enable);
>> +
>> +	return 0;
>> +}
>> +
>> +static int count_cache_flush_get(void *data, u64 *val)
>> +{
>> +	if (count_cache_flush_type == COUNT_CACHE_FLUSH_NONE)
>> +		*val = 0;
>> +	else
>> +		*val = 1;
>> +
>> +	return 0;
>> +}
>> +
>> +DEFINE_SIMPLE_ATTRIBUTE(fops_count_cache_flush, count_cache_flush_get,
>> +			count_cache_flush_set, "%llu\n");
>> +
>> +static __init int count_cache_flush_debugfs_init(void)
>> +{
>> +	debugfs_create_file("count_cache_flush", 0600, powerpc_debugfs_root,
>> +			    NULL, &fops_count_cache_flush);
>> +	return 0;
>> +}
>> +device_initcall(count_cache_flush_debugfs_init);
>> +#endif /* CONFIG_DEBUG_FS */
>> +#endif /* CONFIG_PPC_BOOK3S_64 */
>> diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
>> index ad8c9db61237..5a9f035bcd6b 100644
>> - --- a/arch/powerpc/kernel/setup_32.c
>> +++ b/arch/powerpc/kernel/setup_32.c
>> @@ -322,6 +322,8 @@ void __init setup_arch(char **cmdline_p)
>>  		ppc_md.setup_arch();
>>  	if ( ppc_md.progress ) ppc_md.progress("arch: exit", 0x3eab);
>>  
>> +	setup_barrier_nospec();
>> +
>>  	paging_init();
>>  
>>  	/* Initialize the MMU context management stuff */
>> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
>> index 9eb469bed22b..6bb731ababc6 100644
>> - --- a/arch/powerpc/kernel/setup_64.c
>> +++ b/arch/powerpc/kernel/setup_64.c
>> @@ -736,6 +736,8 @@ void __init setup_arch(char **cmdline_p)
>>  	if (ppc_md.setup_arch)
>>  		ppc_md.setup_arch();
>>  
>> +	setup_barrier_nospec();
>> +
>>  	paging_init();
>>  
>>  	/* Initialize the MMU context management stuff */
>> @@ -873,9 +875,6 @@ static void do_nothing(void *unused)
>>  
>>  void rfi_flush_enable(bool enable)
>>  {
>> - -	if (rfi_flush == enable)
>> - -		return;
>> - -
>>  	if (enable) {
>>  		do_rfi_flush_fixups(enabled_flush_types);
>>  		on_each_cpu(do_nothing, NULL, 1);
>> @@ -885,11 +884,15 @@ void rfi_flush_enable(bool enable)
>>  	rfi_flush = enable;
>>  }
>>  
>> - -static void init_fallback_flush(void)
>> +static void __ref init_fallback_flush(void)
>>  {
>>  	u64 l1d_size, limit;
>>  	int cpu;
>>  
>> +	/* Only allocate the fallback flush area once (at boot time). */
>> +	if (l1d_flush_fallback_area)
>> +		return;
>> +
>>  	l1d_size = ppc64_caches.dsize;
>>  	limit = min(safe_stack_limit(), ppc64_rma_size);
>>  
>> @@ -902,34 +905,23 @@ static void init_fallback_flush(void)
>>  	memset(l1d_flush_fallback_area, 0, l1d_size * 2);
>>  
>>  	for_each_possible_cpu(cpu) {
>> - -		/*
>> - -		 * The fallback flush is currently coded for 8-way
>> - -		 * associativity. Different associativity is possible, but it
>> - -		 * will be treated as 8-way and may not evict the lines as
>> - -		 * effectively.
>> - -		 *
>> - -		 * 128 byte lines are mandatory.
>> - -		 */
>> - -		u64 c = l1d_size / 8;
>> - -
>>  		paca[cpu].rfi_flush_fallback_area = l1d_flush_fallback_area;
>> - -		paca[cpu].l1d_flush_congruence = c;
>> - -		paca[cpu].l1d_flush_sets = c / 128;
>> +		paca[cpu].l1d_flush_size = l1d_size;
>>  	}
>>  }
>>  
>> - -void __init setup_rfi_flush(enum l1d_flush_type types, bool enable)
>> +void setup_rfi_flush(enum l1d_flush_type types, bool enable)
>>  {
>>  	if (types & L1D_FLUSH_FALLBACK) {
>> - -		pr_info("rfi-flush: Using fallback displacement flush\n");
>> +		pr_info("rfi-flush: fallback displacement flush available\n");
>>  		init_fallback_flush();
>>  	}
>>  
>>  	if (types & L1D_FLUSH_ORI)
>> - -		pr_info("rfi-flush: Using ori type flush\n");
>> +		pr_info("rfi-flush: ori type flush available\n");
>>  
>>  	if (types & L1D_FLUSH_MTTRIG)
>> - -		pr_info("rfi-flush: Using mttrig type flush\n");
>> +		pr_info("rfi-flush: mttrig type flush available\n");
>>  
>>  	enabled_flush_types = types;
>>  
>> @@ -940,13 +932,19 @@ void __init setup_rfi_flush(enum l1d_flush_type types, bool enable)
>>  #ifdef CONFIG_DEBUG_FS
>>  static int rfi_flush_set(void *data, u64 val)
>>  {
>> +	bool enable;
>> +
>>  	if (val == 1)
>> - -		rfi_flush_enable(true);
>> +		enable = true;
>>  	else if (val == 0)
>> - -		rfi_flush_enable(false);
>> +		enable = false;
>>  	else
>>  		return -EINVAL;
>>  
>> +	/* Only do anything if we're changing state */
>> +	if (enable != rfi_flush)
>> +		rfi_flush_enable(enable);
>> +
>>  	return 0;
>>  }
>>  
>> @@ -965,12 +963,4 @@ static __init int rfi_flush_debugfs_init(void)
>>  }
>>  device_initcall(rfi_flush_debugfs_init);
>>  #endif
>> - -
>> - -ssize_t cpu_show_meltdown(struct device *dev, struct device_attribute *attr, char *buf)
>> - -{
>> - -	if (rfi_flush)
>> - -		return sprintf(buf, "Mitigation: RFI Flush\n");
>> - -
>> - -	return sprintf(buf, "Vulnerable\n");
>> - -}
>>  #endif /* CONFIG_PPC_BOOK3S_64 */
>> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
>> index 072a23a17350..876ac9d52afc 100644
>> - --- a/arch/powerpc/kernel/vmlinux.lds.S
>> +++ b/arch/powerpc/kernel/vmlinux.lds.S
>> @@ -73,14 +73,45 @@ SECTIONS
>>  	RODATA
>>  
>>  #ifdef CONFIG_PPC64
>> +	. = ALIGN(8);
>> +	__stf_entry_barrier_fixup : AT(ADDR(__stf_entry_barrier_fixup) - LOAD_OFFSET) {
>> +		__start___stf_entry_barrier_fixup = .;
>> +		*(__stf_entry_barrier_fixup)
>> +		__stop___stf_entry_barrier_fixup = .;
>> +	}
>> +
>> +	. = ALIGN(8);
>> +	__stf_exit_barrier_fixup : AT(ADDR(__stf_exit_barrier_fixup) - LOAD_OFFSET) {
>> +		__start___stf_exit_barrier_fixup = .;
>> +		*(__stf_exit_barrier_fixup)
>> +		__stop___stf_exit_barrier_fixup = .;
>> +	}
>> +
>>  	. = ALIGN(8);
>>  	__rfi_flush_fixup : AT(ADDR(__rfi_flush_fixup) - LOAD_OFFSET) {
>>  		__start___rfi_flush_fixup = .;
>>  		*(__rfi_flush_fixup)
>>  		__stop___rfi_flush_fixup = .;
>>  	}
>> - -#endif
>> +#endif /* CONFIG_PPC64 */
>>  
>> +#ifdef CONFIG_PPC_BARRIER_NOSPEC
>> +	. = ALIGN(8);
>> +	__spec_barrier_fixup : AT(ADDR(__spec_barrier_fixup) - LOAD_OFFSET) {
>> +		__start___barrier_nospec_fixup = .;
>> +		*(__barrier_nospec_fixup)
>> +		__stop___barrier_nospec_fixup = .;
>> +	}
>> +#endif /* CONFIG_PPC_BARRIER_NOSPEC */
>> +
>> +#ifdef CONFIG_PPC_FSL_BOOK3E
>> +	. = ALIGN(8);
>> +	__spec_btb_flush_fixup : AT(ADDR(__spec_btb_flush_fixup) - LOAD_OFFSET) {
>> +		__start__btb_flush_fixup = .;
>> +		*(__btb_flush_fixup)
>> +		__stop__btb_flush_fixup = .;
>> +	}
>> +#endif
>>  	EXCEPTION_TABLE(0)
>>  
>>  	NOTES :kernel :notes
>> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
>> index d5edbeb8eb82..570c06a00db6 100644
>> - --- a/arch/powerpc/lib/code-patching.c
>> +++ b/arch/powerpc/lib/code-patching.c
>> @@ -14,12 +14,25 @@
>>  #include <asm/page.h>
>>  #include <asm/code-patching.h>
>>  #include <asm/uaccess.h>
>> +#include <asm/setup.h>
>> +#include <asm/sections.h>
>>  
>>  
>> +static inline bool is_init(unsigned int *addr)
>> +{
>> +	return addr >= (unsigned int *)__init_begin && addr < (unsigned int *)__init_end;
>> +}
>> +
>>  int patch_instruction(unsigned int *addr, unsigned int instr)
>>  {
>>  	int err;
>>  
>> +	/* Make sure we aren't patching a freed init section */
>> +	if (init_mem_is_free && is_init(addr)) {
>> +		pr_debug("Skipping init section patching addr: 0x%px\n", addr);
>> +		return 0;
>> +	}
>> +
>>  	__put_user_size(instr, addr, 4, err);
>>  	if (err)
>>  		return err;
>> @@ -32,6 +45,22 @@ int patch_branch(unsigned int *addr, unsigned long target, int flags)
>>  	return patch_instruction(addr, create_branch(addr, target, flags));
>>  }
>>  
>> +int patch_branch_site(s32 *site, unsigned long target, int flags)
>> +{
>> +	unsigned int *addr;
>> +
>> +	addr = (unsigned int *)((unsigned long)site + *site);
>> +	return patch_instruction(addr, create_branch(addr, target, flags));
>> +}
>> +
>> +int patch_instruction_site(s32 *site, unsigned int instr)
>> +{
>> +	unsigned int *addr;
>> +
>> +	addr = (unsigned int *)((unsigned long)site + *site);
>> +	return patch_instruction(addr, instr);
>> +}
>> +
>>  unsigned int create_branch(const unsigned int *addr,
>>  			   unsigned long target, int flags)
>>  {
>> diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
>> index 3af014684872..7bdfc19a491d 100644
>> - --- a/arch/powerpc/lib/feature-fixups.c
>> +++ b/arch/powerpc/lib/feature-fixups.c
>> @@ -21,7 +21,7 @@
>>  #include <asm/page.h>
>>  #include <asm/sections.h>
>>  #include <asm/setup.h>
>> - -
>> +#include <asm/security_features.h>
>>  
>>  struct fixup_entry {
>>  	unsigned long	mask;
>> @@ -115,6 +115,120 @@ void do_feature_fixups(unsigned long value, void *fixup_start, void *fixup_end)
>>  }
>>  
>>  #ifdef CONFIG_PPC_BOOK3S_64
>> +void do_stf_entry_barrier_fixups(enum stf_barrier_type types)
>> +{
>> +	unsigned int instrs[3], *dest;
>> +	long *start, *end;
>> +	int i;
>> +
>> +	start = PTRRELOC(&__start___stf_entry_barrier_fixup),
>> +	end = PTRRELOC(&__stop___stf_entry_barrier_fixup);
>> +
>> +	instrs[0] = 0x60000000; /* nop */
>> +	instrs[1] = 0x60000000; /* nop */
>> +	instrs[2] = 0x60000000; /* nop */
>> +
>> +	i = 0;
>> +	if (types & STF_BARRIER_FALLBACK) {
>> +		instrs[i++] = 0x7d4802a6; /* mflr r10		*/
>> +		instrs[i++] = 0x60000000; /* branch patched below */
>> +		instrs[i++] = 0x7d4803a6; /* mtlr r10		*/
>> +	} else if (types & STF_BARRIER_EIEIO) {
>> +		instrs[i++] = 0x7e0006ac; /* eieio + bit 6 hint */
>> +	} else if (types & STF_BARRIER_SYNC_ORI) {
>> +		instrs[i++] = 0x7c0004ac; /* hwsync		*/
>> +		instrs[i++] = 0xe94d0000; /* ld r10,0(r13)	*/
>> +		instrs[i++] = 0x63ff0000; /* ori 31,31,0 speculation barrier */
>> +	}
>> +
>> +	for (i = 0; start < end; start++, i++) {
>> +		dest = (void *)start + *start;
>> +
>> +		pr_devel("patching dest %lx\n", (unsigned long)dest);
>> +
>> +		patch_instruction(dest, instrs[0]);
>> +
>> +		if (types & STF_BARRIER_FALLBACK)
>> +			patch_branch(dest + 1, (unsigned long)&stf_barrier_fallback,
>> +				     BRANCH_SET_LINK);
>> +		else
>> +			patch_instruction(dest + 1, instrs[1]);
>> +
>> +		patch_instruction(dest + 2, instrs[2]);
>> +	}
>> +
>> +	printk(KERN_DEBUG "stf-barrier: patched %d entry locations (%s barrier)\n", i,
>> +		(types == STF_BARRIER_NONE)                  ? "no" :
>> +		(types == STF_BARRIER_FALLBACK)              ? "fallback" :
>> +		(types == STF_BARRIER_EIEIO)                 ? "eieio" :
>> +		(types == (STF_BARRIER_SYNC_ORI))            ? "hwsync"
>> +		                                           : "unknown");
>> +}
>> +
>> +void do_stf_exit_barrier_fixups(enum stf_barrier_type types)
>> +{
>> +	unsigned int instrs[6], *dest;
>> +	long *start, *end;
>> +	int i;
>> +
>> +	start = PTRRELOC(&__start___stf_exit_barrier_fixup),
>> +	end = PTRRELOC(&__stop___stf_exit_barrier_fixup);
>> +
>> +	instrs[0] = 0x60000000; /* nop */
>> +	instrs[1] = 0x60000000; /* nop */
>> +	instrs[2] = 0x60000000; /* nop */
>> +	instrs[3] = 0x60000000; /* nop */
>> +	instrs[4] = 0x60000000; /* nop */
>> +	instrs[5] = 0x60000000; /* nop */
>> +
>> +	i = 0;
>> +	if (types & STF_BARRIER_FALLBACK || types & STF_BARRIER_SYNC_ORI) {
>> +		if (cpu_has_feature(CPU_FTR_HVMODE)) {
>> +			instrs[i++] = 0x7db14ba6; /* mtspr 0x131, r13 (HSPRG1) */
>> +			instrs[i++] = 0x7db04aa6; /* mfspr r13, 0x130 (HSPRG0) */
>> +		} else {
>> +			instrs[i++] = 0x7db243a6; /* mtsprg 2,r13	*/
>> +			instrs[i++] = 0x7db142a6; /* mfsprg r13,1    */
>> +	        }
>> +		instrs[i++] = 0x7c0004ac; /* hwsync		*/
>> +		instrs[i++] = 0xe9ad0000; /* ld r13,0(r13)	*/
>> +		instrs[i++] = 0x63ff0000; /* ori 31,31,0 speculation barrier */
>> +		if (cpu_has_feature(CPU_FTR_HVMODE)) {
>> +			instrs[i++] = 0x7db14aa6; /* mfspr r13, 0x131 (HSPRG1) */
>> +		} else {
>> +			instrs[i++] = 0x7db242a6; /* mfsprg r13,2 */
>> +		}
>> +	} else if (types & STF_BARRIER_EIEIO) {
>> +		instrs[i++] = 0x7e0006ac; /* eieio + bit 6 hint */
>> +	}
>> +
>> +	for (i = 0; start < end; start++, i++) {
>> +		dest = (void *)start + *start;
>> +
>> +		pr_devel("patching dest %lx\n", (unsigned long)dest);
>> +
>> +		patch_instruction(dest, instrs[0]);
>> +		patch_instruction(dest + 1, instrs[1]);
>> +		patch_instruction(dest + 2, instrs[2]);
>> +		patch_instruction(dest + 3, instrs[3]);
>> +		patch_instruction(dest + 4, instrs[4]);
>> +		patch_instruction(dest + 5, instrs[5]);
>> +	}
>> +	printk(KERN_DEBUG "stf-barrier: patched %d exit locations (%s barrier)\n", i,
>> +		(types == STF_BARRIER_NONE)                  ? "no" :
>> +		(types == STF_BARRIER_FALLBACK)              ? "fallback" :
>> +		(types == STF_BARRIER_EIEIO)                 ? "eieio" :
>> +		(types == (STF_BARRIER_SYNC_ORI))            ? "hwsync"
>> +		                                           : "unknown");
>> +}
>> +
>> +
>> +void do_stf_barrier_fixups(enum stf_barrier_type types)
>> +{
>> +	do_stf_entry_barrier_fixups(types);
>> +	do_stf_exit_barrier_fixups(types);
>> +}
>> +
>>  void do_rfi_flush_fixups(enum l1d_flush_type types)
>>  {
>>  	unsigned int instrs[3], *dest;
>> @@ -151,10 +265,110 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
>>  		patch_instruction(dest + 2, instrs[2]);
>>  	}
>>  
>> - -	printk(KERN_DEBUG "rfi-flush: patched %d locations\n", i);
>> +	printk(KERN_DEBUG "rfi-flush: patched %d locations (%s flush)\n", i,
>> +		(types == L1D_FLUSH_NONE)       ? "no" :
>> +		(types == L1D_FLUSH_FALLBACK)   ? "fallback displacement" :
>> +		(types &  L1D_FLUSH_ORI)        ? (types & L1D_FLUSH_MTTRIG)
>> +							? "ori+mttrig type"
>> +							: "ori type" :
>> +		(types &  L1D_FLUSH_MTTRIG)     ? "mttrig type"
>> +						: "unknown");
>> +}
>> +
>> +void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_end)
>> +{
>> +	unsigned int instr, *dest;
>> +	long *start, *end;
>> +	int i;
>> +
>> +	start = fixup_start;
>> +	end = fixup_end;
>> +
>> +	instr = 0x60000000; /* nop */
>> +
>> +	if (enable) {
>> +		pr_info("barrier-nospec: using ORI speculation barrier\n");
>> +		instr = 0x63ff0000; /* ori 31,31,0 speculation barrier */
>> +	}
>> +
>> +	for (i = 0; start < end; start++, i++) {
>> +		dest = (void *)start + *start;
>> +
>> +		pr_devel("patching dest %lx\n", (unsigned long)dest);
>> +		patch_instruction(dest, instr);
>> +	}
>> +
>> +	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
>>  }
>> +
>>  #endif /* CONFIG_PPC_BOOK3S_64 */
>>  
>> +#ifdef CONFIG_PPC_BARRIER_NOSPEC
>> +void do_barrier_nospec_fixups(bool enable)
>> +{
>> +	void *start, *end;
>> +
>> +	start = PTRRELOC(&__start___barrier_nospec_fixup),
>> +	end = PTRRELOC(&__stop___barrier_nospec_fixup);
>> +
>> +	do_barrier_nospec_fixups_range(enable, start, end);
>> +}
>> +#endif /* CONFIG_PPC_BARRIER_NOSPEC */
>> +
>> +#ifdef CONFIG_PPC_FSL_BOOK3E
>> +void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_end)
>> +{
>> +	unsigned int instr[2], *dest;
>> +	long *start, *end;
>> +	int i;
>> +
>> +	start = fixup_start;
>> +	end = fixup_end;
>> +
>> +	instr[0] = PPC_INST_NOP;
>> +	instr[1] = PPC_INST_NOP;
>> +
>> +	if (enable) {
>> +		pr_info("barrier-nospec: using isync; sync as speculation barrier\n");
>> +		instr[0] = PPC_INST_ISYNC;
>> +		instr[1] = PPC_INST_SYNC;
>> +	}
>> +
>> +	for (i = 0; start < end; start++, i++) {
>> +		dest = (void *)start + *start;
>> +
>> +		pr_devel("patching dest %lx\n", (unsigned long)dest);
>> +		patch_instruction(dest, instr[0]);
>> +		patch_instruction(dest + 1, instr[1]);
>> +	}
>> +
>> +	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
>> +}
>> +
>> +static void patch_btb_flush_section(long *curr)
>> +{
>> +	unsigned int *start, *end;
>> +
>> +	start = (void *)curr + *curr;
>> +	end = (void *)curr + *(curr + 1);
>> +	for (; start < end; start++) {
>> +		pr_devel("patching dest %lx\n", (unsigned long)start);
>> +		patch_instruction(start, PPC_INST_NOP);
>> +	}
>> +}
>> +
>> +void do_btb_flush_fixups(void)
>> +{
>> +	long *start, *end;
>> +
>> +	start = PTRRELOC(&__start__btb_flush_fixup);
>> +	end = PTRRELOC(&__stop__btb_flush_fixup);
>> +
>> +	for (; start < end; start += 2)
>> +		patch_btb_flush_section(start);
>> +}
>> +#endif /* CONFIG_PPC_FSL_BOOK3E */
>> +
>>  void do_lwsync_fixups(unsigned long value, void *fixup_start, void *fixup_end)
>>  {
>>  	long *start, *end;
>> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>> index 22d94c3e6fc4..1efe5ca5c3bc 100644
>> - --- a/arch/powerpc/mm/mem.c
>> +++ b/arch/powerpc/mm/mem.c
>> @@ -62,6 +62,7 @@
>>  #endif
>>  
>>  unsigned long long memory_limit;
>> +bool init_mem_is_free;
>>  
>>  #ifdef CONFIG_HIGHMEM
>>  pte_t *kmap_pte;
>> @@ -381,6 +382,7 @@ void __init mem_init(void)
>>  void free_initmem(void)
>>  {
>>  	ppc_md.progress = ppc_printk_progress;
>> +	init_mem_is_free = true;
>>  	free_initmem_default(POISON_FREE_INITMEM);
>>  }
>>  
>> diff --git a/arch/powerpc/mm/tlb_low_64e.S b/arch/powerpc/mm/tlb_low_64e.S
>> index 29d6987c37ba..5486d56da289 100644
>> - --- a/arch/powerpc/mm/tlb_low_64e.S
>> +++ b/arch/powerpc/mm/tlb_low_64e.S
>> @@ -69,6 +69,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
>>  	std	r15,EX_TLB_R15(r12)
>>  	std	r10,EX_TLB_CR(r12)
>>  #ifdef CONFIG_PPC_FSL_BOOK3E
>> +START_BTB_FLUSH_SECTION
>> +	mfspr r11, SPRN_SRR1
>> +	andi. r10,r11,MSR_PR
>> +	beq 1f
>> +	BTB_FLUSH(r10)
>> +1:
>> +END_BTB_FLUSH_SECTION
>>  	std	r7,EX_TLB_R7(r12)
>>  #endif
>>  	TLB_MISS_PROLOG_STATS
>> diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
>> index c57afc619b20..e14b52c7ebd8 100644
>> - --- a/arch/powerpc/platforms/powernv/setup.c
>> +++ b/arch/powerpc/platforms/powernv/setup.c
>> @@ -37,53 +37,99 @@
>>  #include <asm/smp.h>
>>  #include <asm/tm.h>
>>  #include <asm/setup.h>
>> +#include <asm/security_features.h>
>>  
>>  #include "powernv.h"
>>  
>> +
>> +static bool fw_feature_is(const char *state, const char *name,
>> +			  struct device_node *fw_features)
>> +{
>> +	struct device_node *np;
>> +	bool rc = false;
>> +
>> +	np = of_get_child_by_name(fw_features, name);
>> +	if (np) {
>> +		rc = of_property_read_bool(np, state);
>> +		of_node_put(np);
>> +	}
>> +
>> +	return rc;
>> +}
>> +
>> +static void init_fw_feat_flags(struct device_node *np)
>> +{
>> +	if (fw_feature_is("enabled", "inst-spec-barrier-ori31,31,0", np))
>> +		security_ftr_set(SEC_FTR_SPEC_BAR_ORI31);
>> +
>> +	if (fw_feature_is("enabled", "fw-bcctrl-serialized", np))
>> +		security_ftr_set(SEC_FTR_BCCTRL_SERIALISED);
>> +
>> +	if (fw_feature_is("enabled", "inst-l1d-flush-ori30,30,0", np))
>> +		security_ftr_set(SEC_FTR_L1D_FLUSH_ORI30);
>> +
>> +	if (fw_feature_is("enabled", "inst-l1d-flush-trig2", np))
>> +		security_ftr_set(SEC_FTR_L1D_FLUSH_TRIG2);
>> +
>> +	if (fw_feature_is("enabled", "fw-l1d-thread-split", np))
>> +		security_ftr_set(SEC_FTR_L1D_THREAD_PRIV);
>> +
>> +	if (fw_feature_is("enabled", "fw-count-cache-disabled", np))
>> +		security_ftr_set(SEC_FTR_COUNT_CACHE_DISABLED);
>> +
>> +	if (fw_feature_is("enabled", "fw-count-cache-flush-bcctr2,0,0", np))
>> +		security_ftr_set(SEC_FTR_BCCTR_FLUSH_ASSIST);
>> +
>> +	if (fw_feature_is("enabled", "needs-count-cache-flush-on-context-switch", np))
>> +		security_ftr_set(SEC_FTR_FLUSH_COUNT_CACHE);
>> +
>> +	/*
>> +	 * The features below are enabled by default, so we instead look to see
>> +	 * if firmware has *disabled* them, and clear them if so.
>> +	 */
>> +	if (fw_feature_is("disabled", "speculation-policy-favor-security", np))
>> +		security_ftr_clear(SEC_FTR_FAVOUR_SECURITY);
>> +
>> +	if (fw_feature_is("disabled", "needs-l1d-flush-msr-pr-0-to-1", np))
>> +		security_ftr_clear(SEC_FTR_L1D_FLUSH_PR);
>> +
>> +	if (fw_feature_is("disabled", "needs-l1d-flush-msr-hv-1-to-0", np))
>> +		security_ftr_clear(SEC_FTR_L1D_FLUSH_HV);
>> +
>> +	if (fw_feature_is("disabled", "needs-spec-barrier-for-bound-checks", np))
>> +		security_ftr_clear(SEC_FTR_BNDS_CHK_SPEC_BAR);
>> +}
>> +
>>  static void pnv_setup_rfi_flush(void)
>>  {
>>  	struct device_node *np, *fw_features;
>>  	enum l1d_flush_type type;
>> - -	int enable;
>> +	bool enable;
>>  
>>  	/* Default to fallback in case fw-features are not available */
>>  	type = L1D_FLUSH_FALLBACK;
>> - -	enable = 1;
>>  
>>  	np = of_find_node_by_name(NULL, "ibm,opal");
>>  	fw_features = of_get_child_by_name(np, "fw-features");
>>  	of_node_put(np);
>>  
>>  	if (fw_features) {
>> - -		np = of_get_child_by_name(fw_features, "inst-l1d-flush-trig2");
>> - -		if (np && of_property_read_bool(np, "enabled"))
>> - -			type = L1D_FLUSH_MTTRIG;
>> +		init_fw_feat_flags(fw_features);
>> +		of_node_put(fw_features);
>>  
>> - -		of_node_put(np);
>> +		if (security_ftr_enabled(SEC_FTR_L1D_FLUSH_TRIG2))
>> +			type = L1D_FLUSH_MTTRIG;
>>  
>> - -		np = of_get_child_by_name(fw_features, "inst-l1d-flush-ori30,30,0");
>> - -		if (np && of_property_read_bool(np, "enabled"))
>> +		if (security_ftr_enabled(SEC_FTR_L1D_FLUSH_ORI30))
>>  			type = L1D_FLUSH_ORI;
>> - -
>> - -		of_node_put(np);
>> - -
>> - -		/* Enable unless firmware says NOT to */
>> - -		enable = 2;
>> - -		np = of_get_child_by_name(fw_features, "needs-l1d-flush-msr-hv-1-to-0");
>> - -		if (np && of_property_read_bool(np, "disabled"))
>> - -			enable--;
>> - -
>> - -		of_node_put(np);
>> - -
>> - -		np = of_get_child_by_name(fw_features, "needs-l1d-flush-msr-pr-0-to-1");
>> - -		if (np && of_property_read_bool(np, "disabled"))
>> - -			enable--;
>> - -
>> - -		of_node_put(np);
>> - -		of_node_put(fw_features);
>>  	}
>>  
>> - -	setup_rfi_flush(type, enable > 0);
>> +	enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) && \
>> +		 (security_ftr_enabled(SEC_FTR_L1D_FLUSH_PR)   || \
>> +		  security_ftr_enabled(SEC_FTR_L1D_FLUSH_HV));
>> +
>> +	setup_rfi_flush(type, enable);
>> +	setup_count_cache_flush();
>>  }
>>  
>>  static void __init pnv_setup_arch(void)
>> @@ -91,6 +137,7 @@ static void __init pnv_setup_arch(void)
>>  	set_arch_panic_timeout(10, ARCH_PANIC_TIMEOUT);
>>  
>>  	pnv_setup_rfi_flush();
>> +	setup_stf_barrier();
>>  
>>  	/* Initialize SMP */
>>  	pnv_smp_init();
>> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
>> index 8dd0c8edefd6..c773396d0969 100644
>> - --- a/arch/powerpc/platforms/pseries/mobility.c
>> +++ b/arch/powerpc/platforms/pseries/mobility.c
>> @@ -314,6 +314,9 @@ void post_mobility_fixup(void)
>>  		printk(KERN_ERR "Post-mobility device tree update "
>>  			"failed: %d\n", rc);
>>  
>> +	/* Possibly switch to a new RFI flush type */
>> +	pseries_setup_rfi_flush();
>> +
>>  	return;
>>  }
>>  
>> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
>> index 8411c27293e4..e7d80797384d 100644
>> - --- a/arch/powerpc/platforms/pseries/pseries.h
>> +++ b/arch/powerpc/platforms/pseries/pseries.h
>> @@ -81,4 +81,6 @@ extern struct pci_controller_ops pseries_pci_controller_ops;
>>  
>>  unsigned long pseries_memory_block_size(void);
>>  
>> +void pseries_setup_rfi_flush(void);
>> +
>>  #endif /* _PSERIES_PSERIES_H */
>> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
>> index dd2545fc9947..9cc976ff7fec 100644
>> - --- a/arch/powerpc/platforms/pseries/setup.c
>> +++ b/arch/powerpc/platforms/pseries/setup.c
>> @@ -67,6 +67,7 @@
>>  #include <asm/eeh.h>
>>  #include <asm/reg.h>
>>  #include <asm/plpar_wrappers.h>
>> +#include <asm/security_features.h>
>>  
>>  #include "pseries.h"
>>  
>> @@ -499,37 +500,87 @@ static void __init find_and_init_phbs(void)
>>  	of_pci_check_probe_only();
>>  }
>>  
>> - -static void pseries_setup_rfi_flush(void)
>> +static void init_cpu_char_feature_flags(struct h_cpu_char_result *result)
>> +{
>> +	/*
>> +	 * The features below are disabled by default, so we instead look to see
>> +	 * if firmware has *enabled* them, and set them if so.
>> +	 */
>> +	if (result->character & H_CPU_CHAR_SPEC_BAR_ORI31)
>> +		security_ftr_set(SEC_FTR_SPEC_BAR_ORI31);
>> +
>> +	if (result->character & H_CPU_CHAR_BCCTRL_SERIALISED)
>> +		security_ftr_set(SEC_FTR_BCCTRL_SERIALISED);
>> +
>> +	if (result->character & H_CPU_CHAR_L1D_FLUSH_ORI30)
>> +		security_ftr_set(SEC_FTR_L1D_FLUSH_ORI30);
>> +
>> +	if (result->character & H_CPU_CHAR_L1D_FLUSH_TRIG2)
>> +		security_ftr_set(SEC_FTR_L1D_FLUSH_TRIG2);
>> +
>> +	if (result->character & H_CPU_CHAR_L1D_THREAD_PRIV)
>> +		security_ftr_set(SEC_FTR_L1D_THREAD_PRIV);
>> +
>> +	if (result->character & H_CPU_CHAR_COUNT_CACHE_DISABLED)
>> +		security_ftr_set(SEC_FTR_COUNT_CACHE_DISABLED);
>> +
>> +	if (result->character & H_CPU_CHAR_BCCTR_FLUSH_ASSIST)
>> +		security_ftr_set(SEC_FTR_BCCTR_FLUSH_ASSIST);
>> +
>> +	if (result->behaviour & H_CPU_BEHAV_FLUSH_COUNT_CACHE)
>> +		security_ftr_set(SEC_FTR_FLUSH_COUNT_CACHE);
>> +
>> +	/*
>> +	 * The features below are enabled by default, so we instead look to see
>> +	 * if firmware has *disabled* them, and clear them if so.
>> +	 */
>> +	if (!(result->behaviour & H_CPU_BEHAV_FAVOUR_SECURITY))
>> +		security_ftr_clear(SEC_FTR_FAVOUR_SECURITY);
>> +
>> +	if (!(result->behaviour & H_CPU_BEHAV_L1D_FLUSH_PR))
>> +		security_ftr_clear(SEC_FTR_L1D_FLUSH_PR);
>> +
>> +	if (!(result->behaviour & H_CPU_BEHAV_BNDS_CHK_SPEC_BAR))
>> +		security_ftr_clear(SEC_FTR_BNDS_CHK_SPEC_BAR);
>> +}
>> +
>> +void pseries_setup_rfi_flush(void)
>>  {
>>  	struct h_cpu_char_result result;
>>  	enum l1d_flush_type types;
>>  	bool enable;
>>  	long rc;
>>  
>> - -	/* Enable by default */
>> - -	enable = true;
>> +	/*
>> +	 * Set features to the defaults assumed by init_cpu_char_feature_flags()
>> +	 * so it can set/clear again any features that might have changed after
>> +	 * migration, and in case the hypercall fails and it is not even called.
>> +	 */
>> +	powerpc_security_features = SEC_FTR_DEFAULT;
>>  
>>  	rc = plpar_get_cpu_characteristics(&result);
>> - -	if (rc == H_SUCCESS) {
>> - -		types = L1D_FLUSH_NONE;
>> +	if (rc == H_SUCCESS)
>> +		init_cpu_char_feature_flags(&result);
>>  
>> - -		if (result.character & H_CPU_CHAR_L1D_FLUSH_TRIG2)
>> - -			types |= L1D_FLUSH_MTTRIG;
>> - -		if (result.character & H_CPU_CHAR_L1D_FLUSH_ORI30)
>> - -			types |= L1D_FLUSH_ORI;
>> +	/*
>> +	 * We're the guest so this doesn't apply to us, clear it to simplify
>> +	 * handling of it elsewhere.
>> +	 */
>> +	security_ftr_clear(SEC_FTR_L1D_FLUSH_HV);
>>  
>> - -		/* Use fallback if nothing set in hcall */
>> - -		if (types == L1D_FLUSH_NONE)
>> - -			types = L1D_FLUSH_FALLBACK;
>> +	types = L1D_FLUSH_FALLBACK;
>>  
>> - -		if (!(result.behaviour & H_CPU_BEHAV_L1D_FLUSH_PR))
>> - -			enable = false;
>> - -	} else {
>> - -		/* Default to fallback if case hcall is not available */
>> - -		types = L1D_FLUSH_FALLBACK;
>> - -	}
>> +	if (security_ftr_enabled(SEC_FTR_L1D_FLUSH_TRIG2))
>> +		types |= L1D_FLUSH_MTTRIG;
>> +
>> +	if (security_ftr_enabled(SEC_FTR_L1D_FLUSH_ORI30))
>> +		types |= L1D_FLUSH_ORI;
>> +
>> +	enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) && \
>> +		 security_ftr_enabled(SEC_FTR_L1D_FLUSH_PR);
>>  
>>  	setup_rfi_flush(types, enable);
>> +	setup_count_cache_flush();
>>  }
>>  
>>  static void __init pSeries_setup_arch(void)
>> @@ -549,6 +600,7 @@ static void __init pSeries_setup_arch(void)
>>  	fwnmi_init();
>>  
>>  	pseries_setup_rfi_flush();
>> +	setup_stf_barrier();
>>  
>>  	/* By default, only probe PCI (can be overridden by rtas_pci) */
>>  	pci_add_flags(PCI_PROBE_ONLY);
>> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
>> index 786bf01691c9..83619ebede93 100644
>> - --- a/arch/powerpc/xmon/xmon.c
>> +++ b/arch/powerpc/xmon/xmon.c
>> @@ -2144,6 +2144,8 @@ static void dump_one_paca(int cpu)
>>  	DUMP(p, slb_cache_ptr, "x");
>>  	for (i = 0; i < SLB_CACHE_ENTRIES; i++)
>>  		printf(" slb_cache[%d]:        = 0x%016lx\n", i, p->slb_cache[i]);
>> +
>> +	DUMP(p, rfi_flush_fallback_area, "px");
>>  #endif
>>  	DUMP(p, dscr_default, "llx");
>>  #ifdef CONFIG_PPC_BOOK3E
>> - -- 
>> 2.20.1
>>
>> -----BEGIN PGP SIGNATURE-----
>>
>> iQIcBAEBAgAGBQJcvHWhAAoJEFHr6jzI4aWA6nsP/0YskmAfLovcUmERQ7+bIjq6
>> IcS1T466dvy6MlqeBXU4x8pVgInWeHKEC9XJdkM1lOeib/SLW7Hbz4kgJeOGwFGY
>> lOTaexrxvsBqPm7f6GC0zbl9obEIIIIUs+TielFQANBgqm+q8Wio+XXPP9bpKeKY
>> agSpQ3nwL/PYixznbNmN/lP9py5p89LQ0IBcR7dDBGGWJtD/AXeZ9hslsZxPbPtI
>> nZJ0vdnjuoB2z+hCxfKWlYfLwH0VfoTpqP5x3ALCkvbBr67e8bf6EK8+trnvhyQ8
>> iLY4bp1pm2epAI0/3NfyEiDMsGjVJ6IFlkyhDkHJgJNu0BGcGOSX2GpyU3juviAK
>> c95FtBft/i8AwigOMCivg2mN5edYjsSiPoEItwT5KWqgByJsdr5i5mYVx8cUjMOz
>> iAxLZCdg+UHZYuCBCAO2ZI1G9bVXI1Pa3btMspiCOOOsYGjXGf0oFfKQ+7957hUO
>> ftYYJoGHlMHiHR1OPas6T3lk6YKF9uvfIDTE3OKw2obHbbRz3u82xoWMRGW503MN
>> 7WpkpAP7oZ9RgqIWFVhatWy5f+7GFL0akEi4o2tsZHhYlPau7YWo+nToTd87itwt
>> GBaWJipzge4s13VkhAE+jWFO35Fvwi8uNZ7UgpuKMBECEjkGbtzBTq2MjSF5G8wc
>> yPEod5jby/Iqb7DkGPVG
>> =6DnF
>> -----END PGP SIGNATURE-----
>>
