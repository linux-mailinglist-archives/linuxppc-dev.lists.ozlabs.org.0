Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B2FB5B5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 07:55:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Y8MQ1md0zF4Qs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 15:54:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Y8Hx0T1rzF4L5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 15:51:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="NaC6eGGn"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Y8Ht6yBgz9sPK;
 Wed, 18 Sep 2019 15:51:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568785916;
 bh=QAFbzdw2vnSZDQUXwV7YNxQAM2aphYQykkvqG9wUYLM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NaC6eGGnbleVGw4GycFoqaW3sdLe0yR9FbdH2m9+8pE8xu8c4Ikt1FU0Uq6UxsqHH
 tMmVJJCxbjmojxHCOEttD8WhBBBKHRB0+RmB+N0HEeSS8Sdjd6m1jpzk3123nVxpJ5
 iBH/r5PVb5wzDf+CIVccbU+YsGRePUix7o9Ne+k/91e5AT03J8GEw7cKqhZ/0XLZin
 5uwy1C+hgCFUOhloXyyD0q+Kq36GoETfIprzA3Uc4NkdY8QF2J7pJlpXcLgx5tR8Jl
 8Kl7XDlcAL68uS1knOKAahi6dvOGK/kZFdjzk9jsinUjJsH7Dq7Sn8XLJM5ZflU7ay
 7sso523PH8EsA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v2 1/8] powerpc/32: Add VDSO version of getcpu
In-Reply-To: <27d699092118ee8d21741c08a6ff7e4c65effdf2.1566491310.git.christophe.leroy@c-s.fr>
References: <cover.1566491310.git.christophe.leroy@c-s.fr>
 <27d699092118ee8d21741c08a6ff7e4c65effdf2.1566491310.git.christophe.leroy@c-s.fr>
Date: Wed, 18 Sep 2019 15:51:54 +1000
Message-ID: <87h85aw3r9.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

Sorry I'm late replying to this.

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Commit 18ad51dd342a ("powerpc: Add VDSO version of getcpu") added
> getcpu() for PPC64 only, by making use of a user readable general
> purpose SPR.
>
> PPC32 doesn't have any such SPR, a full system call can still be
> avoided by implementing a fast system call which reads the CPU id
> in the task struct and returns immediately without going back in
> virtual mode.
>
> Before the patch, vdsotest reported:
> getcpu: syscall: 1572 nsec/call
> getcpu:    libc: 1787 nsec/call
> getcpu:    vdso: not tested
>
> Now, vdsotest reports:
> getcpu: syscall: 1582 nsec/call
> getcpu:    libc: 667 nsec/call
> getcpu:    vdso: 368 nsec/call
>
> For non SMP, just return CPU id 0 from the VDSO directly.
>
> PPC32 doesn't support CONFIG_NUMA so NUMA node is always 0.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>
> ---
> v2: fixed build error in getcpu.S
> ---
>  arch/powerpc/include/asm/vdso.h         |  2 ++
>  arch/powerpc/kernel/head_32.h           | 13 +++++++++++++
>  arch/powerpc/kernel/head_booke.h        | 11 +++++++++++
>  arch/powerpc/kernel/vdso32/Makefile     |  4 +---
>  arch/powerpc/kernel/vdso32/getcpu.S     |  7 +++++++
>  arch/powerpc/kernel/vdso32/vdso32.lds.S |  2 --
>  6 files changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/vdso.h b/arch/powerpc/include/asm/vdso.h
> index b5e1f8f8a05c..adb54782df5f 100644
> --- a/arch/powerpc/include/asm/vdso.h
> +++ b/arch/powerpc/include/asm/vdso.h
> @@ -16,6 +16,8 @@
>  /* Define if 64 bits VDSO has procedure descriptors */
>  #undef VDS64_HAS_DESCRIPTORS
>  
> +#define NR_MAGIC_FAST_VDSO_SYSCALL	0x789a

We are still in the middle of the years long process of removing the
"magic" syscall on 64-bit:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/kernel/exceptions-64s.S?commit=4d856f72c10ecb060868ed10ff1b1453943fc6c8#n1578
 

Can we not add another one on 32-bit?

Is it really such a fast path that it's worth putting a wart in the
syscall entry like that?

Is there some other method? On s390 they have a per-cpu VDSO page, that
would be a nice option. How we do that would be specific to a particular
MMU, and maybe not even possible with some MMUs. So maybe that's not
feasible.

If you do want to add a fastpath syscall then please just add it as a
regular syscall number, that way it's at least a bit less of a wart.
It's still not visible via tracing/ptrace etc. which is a pain but at
least the number is not "magical" too.

cheers


>  /* Offsets relative to thread->vdso_base */
> diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
> index 4a692553651f..a2e38b59785a 100644
> --- a/arch/powerpc/kernel/head_32.h
> +++ b/arch/powerpc/kernel/head_32.h
> @@ -3,6 +3,8 @@
>  #define __HEAD_32_H__
>  
>  #include <asm/ptrace.h>	/* for STACK_FRAME_REGS_MARKER */
> +#include <asm/vdso.h>
> +#include <asm/asm-offsets.h>
>  
>  /*
>   * MSR_KERNEL is > 0x8000 on 4xx/Book-E since it include MSR_CE.
> @@ -74,7 +76,13 @@
>  .endm
>  
>  .macro SYSCALL_ENTRY trapno
> +#ifdef CONFIG_SMP
> +	cmplwi	cr0, r0, NR_MAGIC_FAST_VDSO_SYSCALL
> +#endif
>  	mfspr	r12,SPRN_SPRG_THREAD
> +#ifdef CONFIG_SMP
> +	beq-	1f
> +#endif
>  	mfcr	r10
>  	lwz	r11,TASK_STACK-THREAD(r12)
>  	mflr	r9
> @@ -152,6 +160,11 @@
>  	mtspr	SPRN_SRR0,r11
>  	SYNC
>  	RFI				/* jump to handler, enable MMU */
> +#ifdef CONFIG_SMP
> +1:
> +	lwz	r5, TASK_CPU - THREAD(r12)
> +	RFI
> +#endif
>  .endm
>  
>  /*
> diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
> index 2ae635df9026..c534e87cac84 100644
> --- a/arch/powerpc/kernel/head_booke.h
> +++ b/arch/powerpc/kernel/head_booke.h
> @@ -3,6 +3,8 @@
>  #define __HEAD_BOOKE_H__
>  
>  #include <asm/ptrace.h>	/* for STACK_FRAME_REGS_MARKER */
> +#include <asm/vdso.h>
> +#include <asm/asm-offsets.h>
>  #include <asm/kvm_asm.h>
>  #include <asm/kvm_booke_hv_asm.h>
>  
> @@ -104,6 +106,10 @@ FTR_SECTION_ELSE
>  #ifdef CONFIG_KVM_BOOKE_HV
>  ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
>  #endif
> +#ifdef CONFIG_SMP
> +	cmplwi	cr0, r0, NR_MAGIC_FAST_VDSO_SYSCALL
> +	beq-	1f
> +#endif
>  	BOOKE_CLEAR_BTB(r11)
>  	lwz	r11, TASK_STACK - THREAD(r10)
>  	rlwinm	r12,r12,0,4,2	/* Clear SO bit in CR */
> @@ -176,6 +182,11 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
>  	mtspr	SPRN_SRR0,r11
>  	SYNC
>  	RFI				/* jump to handler, enable MMU */
> +#ifdef CONFIG_SMP
> +1:
> +	lwz	r5, TASK_CPU - THREAD(r10)
> +	RFI
> +#endif
>  .endm
>  
>  /* To handle the additional exception priority levels on 40x and Book-E
> diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
> index 06f54d947057..e147bbdc12cd 100644
> --- a/arch/powerpc/kernel/vdso32/Makefile
> +++ b/arch/powerpc/kernel/vdso32/Makefile
> @@ -2,9 +2,7 @@
>  
>  # List of files in the vdso, has to be asm only for now
>  
> -obj-vdso32-$(CONFIG_PPC64) = getcpu.o
> -obj-vdso32 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o \
> -		$(obj-vdso32-y)
> +obj-vdso32 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o getcpu.o
>  
>  # Build rules
>  
> diff --git a/arch/powerpc/kernel/vdso32/getcpu.S b/arch/powerpc/kernel/vdso32/getcpu.S
> index 63e914539e1a..bde226ad904d 100644
> --- a/arch/powerpc/kernel/vdso32/getcpu.S
> +++ b/arch/powerpc/kernel/vdso32/getcpu.S
> @@ -17,7 +17,14 @@
>   */
>  V_FUNCTION_BEGIN(__kernel_getcpu)
>    .cfi_startproc
> +#if defined(CONFIG_PPC64)
>  	mfspr	r5,SPRN_SPRG_VDSO_READ
> +#elif defined(CONFIG_SMP)
> +	li	r0, NR_MAGIC_FAST_VDSO_SYSCALL
> +	sc	/* returns cpuid in r5, clobbers cr0 and r10-r13 */
> +#else
> +	li	r5, 0
> +#endif
>  	cmpwi	cr0,r3,0
>  	cmpwi	cr1,r4,0
>  	clrlwi  r6,r5,16
> diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
> index 099a6db14e67..663880671e20 100644
> --- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
> +++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
> @@ -152,9 +152,7 @@ VERSION
>  		__kernel_sync_dicache_p5;
>  		__kernel_sigtramp32;
>  		__kernel_sigtramp_rt32;
> -#ifdef CONFIG_PPC64
>  		__kernel_getcpu;
> -#endif
>  		__kernel_time;
>  
>  	local: *;
> -- 
> 2.13.3
