Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB155BD9C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 04:00:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWlBH23qsz3bd4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 12:00:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Km49DRCN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Km49DRCN;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWl9d0ZQsz30R7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 12:00:03 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id s206so1097230pgs.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 19:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=iOQF9YbGgshGXvlR24CWa0H59Q+f12e7mUZ1SG/Sobw=;
        b=Km49DRCNIAvFm8q+iorr28PjIk/Pq6AzelvMqdo50ZUmu1vLHK9xys3zaBKveQf2QH
         l/RkREiHgBZ1RHXaob8yEY0BXmE8FECyEaTVN+CKmiBnAjNZgyKWR5I8dLStDB+yRgyR
         9OLDaDHynceLQgTyauIDZFfeloofuFMgGShlla+u9SMhvajz8MF6soJTeTbZgrOQ4VA1
         Ct7Kl3ifvNEErwxbfjpojTxCdhr8Gomz4rnbPunPGamqTNFAvXcr8DoP2/XOhj5oSBe7
         1Vew23pN8vNSvVz4zHedvKrG6EwJ67QYD9+1M0RXHV8cLj7eVR1dwKSof1cs/XpRijX4
         5Okw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=iOQF9YbGgshGXvlR24CWa0H59Q+f12e7mUZ1SG/Sobw=;
        b=P7BnmF5Wno1ihRs9/iF9rqV5pCddHJWsPU3psNyfjSG1HVSkw+cX1quW6MjTHuIn3/
         1/79xz1jyss6q4xf88Y40OMOANKnuuC8rRBJZMpQYgs1e2B8apzSFXMi+OdDCuQEj1AP
         Zfv+OxMtMo+ckie/X4jO4o5uQhQNzW5/yisyUfKe9+9TVc3nGYSocPKT9SVus4f+zrKy
         fnZLEphuE7EX12PoxwmybEEFgIA1gzvguoScWhb4bcMbK2iLdiQYsCQ2UBwEDKBH+ZKw
         hsROHgu7YAWWmJcWjCHFae4AN8QaE1GjfvhemRRbiFuBx0VLntUtUP2VD+bKEr2TCq63
         t4Zg==
X-Gm-Message-State: ACrzQf3Sn9V0YNNSaIB8rqAVCAvU29eSfrhbgLMpBWLgsvNkmTXOrKPd
	1cfvaeeX4WHWOAbqzxC2ke8=
X-Google-Smtp-Source: AMsMyM6x6go1cA5Fi1eq3OBW7YFbzU4Tj9Ala/rMlY5iPN6v7xAQS5FcGv1+Ali3G0uUSqEe4cicWg==
X-Received: by 2002:a63:3110:0:b0:438:e26c:167f with SMTP id x16-20020a633110000000b00438e26c167fmr18559560pgx.134.1663639200381;
        Mon, 19 Sep 2022 19:00:00 -0700 (PDT)
Received: from localhost (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id j20-20020a17090ae61400b002030d596ff7sm130966pjy.37.2022.09.19.18.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 18:59:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 11:59:55 +1000
Message-Id: <CN0UVJJI9V56.Z4K9YRD4OKEM@bobo>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 19/23] powerpc: Provide syscall wrapper
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.11.0
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-20-rmclure@linux.ibm.com>
In-Reply-To: <20220916053300.786330-20-rmclure@linux.ibm.com>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Sep 16, 2022 at 3:32 PM AEST, Rohan McLure wrote:
> Implement syscall wrapper as per s390, x86, arm64. When enabled
> cause handlers to accept parameters from a stack frame rather than
> from user scratch register state. This allows for user registers to be
> safely cleared in order to reduce caller influence on speculation
> within syscall routine. The wrapper is a macro that emits syscall
> handler symbols that call into the target handler, obtaining its
> parameters from a struct pt_regs on the stack.
>
> As registers are already saved to the stack prior to calling
> system_call_exception, it appears that this function is executed more
> efficiently with the new stack-pointer convention than with parameters
> passed by registers, avoiding the allocation of a stack frame for this
> method. On a 32-bit system, we see >20% performance increases on the
> null_syscall microbenchmark, and on a Power 8 the performance gains
> amortise the cost of clearing and restoring registers which is
> implemented at the end of this series, seeing final result of ~5.6%
> performance improvement on null_syscall.
>
> Syscalls are wrapped in this fashion on all platforms except for the
> Cell processor as this commit does not provide SPU support. This can be
> quickly fixed in a successive patch, but requires spu_sys_callback to
> allocate a pt_regs structure to satisfy the wrapped calling convention.
>
> Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Generate prototypes for symbols produced by the wrapper.
> V2 -> V3: Rebased to remove conflict with 1547db7d1f44
> ("powerpc: Move system_call_exception() to syscall.c"). Also remove copy
> from gpr3 save slot on stackframe to orig_r3's slot. Fix whitespace with
> preprocessor defines in system_call_exception.
> V4 -> V5: Move systbl.c syscall wrapper support to this patch. Swap
> calling convention for system_call_exception to be (&regs, r0)
> ---
>  arch/powerpc/Kconfig                       |  1 +
>  arch/powerpc/include/asm/interrupt.h       |  3 +-
>  arch/powerpc/include/asm/syscall.h         |  4 +
>  arch/powerpc/include/asm/syscall_wrapper.h | 84 ++++++++++++++++++++
>  arch/powerpc/include/asm/syscalls.h        | 30 ++++++-
>  arch/powerpc/kernel/entry_32.S             |  6 +-
>  arch/powerpc/kernel/interrupt_64.S         | 28 +++++--
>  arch/powerpc/kernel/syscall.c              | 31 +++-----

Ah, this is where it went :)

I wouldn't normally mind except the previous patch might break the
build because it uses the same name, will it?

This *could* be two patches, one to change system_call_exception API,
the next to add the wrapper.

>  arch/powerpc/kernel/systbl.c               |  8 ++
>  arch/powerpc/kernel/vdso.c                 |  2 +
>  10 files changed, 164 insertions(+), 33 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 4c466acdc70d..ef6c83e79c9b 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -137,6 +137,7 @@ config PPC
>  	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC_BOOK3S || PPC_8xx || 40x) && =
!HIBERNATION
>  	select ARCH_HAS_STRICT_KERNEL_RWX	if FSL_BOOKE && !HIBERNATION && !RAND=
OMIZE_BASE
>  	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX
> +	select ARCH_HAS_SYSCALL_WRAPPER		if !SPU_BASE
>  	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UACCESS_FLUSHCACHE
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/=
asm/interrupt.h
> index 8069dbc4b8d1..48eec9cd1429 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -665,8 +665,7 @@ static inline void interrupt_cond_local_irq_enable(st=
ruct pt_regs *regs)
>  		local_irq_enable();
>  }
> =20
> -long system_call_exception(long r3, long r4, long r5, long r6, long r7, =
long r8,
> -			   unsigned long r0, struct pt_regs *regs);
> +long system_call_exception(struct pt_regs *regs, unsigned long r0);
>  notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_r=
egs *regs, long scv);
>  notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs);
>  notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs=
);
> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/as=
m/syscall.h
> index d2a8dfd5de33..3dd36c5e334a 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -14,8 +14,12 @@
>  #include <linux/sched.h>
>  #include <linux/thread_info.h>
> =20
> +#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
> +typedef long (*syscall_fn)(const struct pt_regs *);
> +#else
>  typedef long (*syscall_fn)(unsigned long, unsigned long, unsigned long,
>  			   unsigned long, unsigned long, unsigned long);
> +#endif
> =20
>  /* ftrace syscalls requires exporting the sys_call_table */
>  extern const syscall_fn sys_call_table[];
> diff --git a/arch/powerpc/include/asm/syscall_wrapper.h b/arch/powerpc/in=
clude/asm/syscall_wrapper.h
> new file mode 100644
> index 000000000000..91bcfa40f740
> --- /dev/null
> +++ b/arch/powerpc/include/asm/syscall_wrapper.h
> @@ -0,0 +1,84 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * syscall_wrapper.h - powerpc specific wrappers to syscall definitions
> + *
> + * Based on arch/{x86,arm64}/include/asm/syscall_wrapper.h
> + */
> +
> +#ifndef __ASM_SYSCALL_WRAPPER_H
> +#define __ASM_SYSCALL_WRAPPER_H
> +
> +struct pt_regs;
> +
> +#define SC_POWERPC_REGS_TO_ARGS(x, ...)				\
> +	__MAP(x,__SC_ARGS					\
> +	      ,,regs->gpr[3],,regs->gpr[4],,regs->gpr[5]	\
> +	      ,,regs->gpr[6],,regs->gpr[7],,regs->gpr[8])
> +
> +#ifdef CONFIG_COMPAT
> +
> +#define COMPAT_SYSCALL_DEFINEx(x, name, ...)						\
> +	long __powerpc_compat_sys##name(const struct pt_regs *regs);			\
> +	ALLOW_ERROR_INJECTION(__powerpc_compat_sys##name, ERRNO);			\
> +	static long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
> +	static inline long __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)=
);	\
> +	long __powerpc_compat_sys##name(const struct pt_regs *regs)			\
> +	{										\
> +		return __se_compat_sys##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__));	=
\
> +	}										\
> +	static long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		\
> +	{										\
> +		return __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_ARGS__));	\
> +	}										\
> +	static inline long __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)=
)
> +
> +#define COMPAT_SYSCALL_DEFINE0(sname)						\
> +	long __powerpc_compat_sys_##sname(const struct pt_regs *__unused);	\
> +	ALLOW_ERROR_INJECTION(__powerpc_compat_sys_##sname, ERRNO);		\
> +	long __powerpc_compat_sys_##sname(const struct pt_regs *__unused)
> +
> +#define COND_SYSCALL_COMPAT(name)						\
> +	long __powerpc_compat_sys_##name(const struct pt_regs *regs);		\
> +	long __weak __powerpc_compat_sys_##name(const struct pt_regs *regs)	\
> +	{									\
> +		return sys_ni_syscall();					\
> +	}
> +#define COMPAT_SYS_NI(name) \
> +	SYSCALL_ALIAS(__powerpc_compat_sys_##name, sys_ni_posix_timers);
> +
> +#endif /* CONFIG_COMPAT */
> +
> +#define __SYSCALL_DEFINEx(x, name, ...)						\
> +	long __powerpc_sys##name(const struct pt_regs *regs);			\
> +	ALLOW_ERROR_INJECTION(__powerpc_sys##name, ERRNO);			\
> +	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
> +	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
> +	long __powerpc_sys##name(const struct pt_regs *regs)			\
> +	{									\
> +		return __se_sys##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__));	\
> +	}									\
> +	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		\
> +	{									\
> +		long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));	\
> +		__MAP(x,__SC_TEST,__VA_ARGS__);					\
> +		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));		\
> +		return ret;							\
> +	}									\
> +	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
> +
> +#define SYSCALL_DEFINE0(sname)							\
> +	SYSCALL_METADATA(_##sname, 0);						\
> +	long __powerpc_sys_##sname(const struct pt_regs *__unused);		\
> +	ALLOW_ERROR_INJECTION(__powerpc_sys_##sname, ERRNO);			\
> +	long __powerpc_sys_##sname(const struct pt_regs *__unused)
> +
> +#define COND_SYSCALL(name)							\
> +	long __powerpc_sys_##name(const struct pt_regs *regs);			\
> +	long __weak __powerpc_sys_##name(const struct pt_regs *regs)		\
> +	{									\
> +		return sys_ni_syscall();					\
> +	}
> +
> +#define SYS_NI(name) SYSCALL_ALIAS(__powerpc_sys_##name, sys_ni_posix_ti=
mers);
> +
> +#endif /* __ASM_SYSCALL_WRAPPER_H */
> diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/a=
sm/syscalls.h
> index cc87168d6ecb..1ecdf6c071f6 100644
> --- a/arch/powerpc/include/asm/syscalls.h
> +++ b/arch/powerpc/include/asm/syscalls.h
> @@ -15,6 +15,12 @@
>  #include <asm/unistd.h>
>  #include <asm/ucontext.h>
> =20
> +#ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
> +long sys_ni_syscall(void);
> +#else
> +long sys_ni_syscall(const struct pt_regs *regs);
> +#endif
> +
>  struct rtas_args;
> =20
>  /*
> @@ -29,12 +35,12 @@ struct rtas_args;
>  #define merge_64(high, low) ((u64)high << 32) | low
>  #endif
> =20
> -long sys_ni_syscall(void);
> -
>  /*
>   * PowerPC architecture-specific syscalls
>   */
> =20
> +#ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
> +
>  long sys_rtas(struct rtas_args __user *uargs);
> =20
>  #ifdef CONFIG_PPC64
> @@ -114,5 +120,25 @@ long sys_ppc_fadvise64_64(int fd, int advice,
>  			  u32 len_high, u32 len_low);
>  #endif
> =20
> +#else
> +
> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
> +#define __SYSCALL(nr, entry) \
> +	long __powerpc_##entry(const struct pt_regs *regs);
> +
> +#ifdef CONFIG_PPC64
> +#include <asm/syscall_table_64.h>
> +#else
> +#include <asm/syscall_table_32.h>
> +#endif /* CONFIG_PPC64 */
> +
> +#ifdef CONFIG_COMPAT
> +#undef __SYSCALL_WITH_COMPAT
> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
> +#include <asm/syscall_table_32.h>
> +#endif /* CONFIG_COMPAT */
> +
> +#endif /* CONFIG_ARCH_HAS_SYSCALL_WRAPPER */
> +
>  #endif /* __KERNEL__ */
>  #endif /* __ASM_POWERPC_SYSCALLS_H */
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_3=
2.S
> index e4b694cebc44..96782aa72083 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -122,9 +122,9 @@ transfer_to_syscall:
>  	SAVE_NVGPRS(r1)
>  	kuep_lock
> =20
> -	/* Calling convention has r9 =3D orig r0, r10 =3D regs */
> -	addi	r10,r1,STACK_FRAME_OVERHEAD
> -	mr	r9,r0
> +	/* Calling convention has r3 =3D regs, r4 =3D orig r0 */
> +	addi	r3,r1,STACK_FRAME_OVERHEAD
> +	mr	r4,r0
>  	bl	system_call_exception
> =20
>  ret_from_syscall:
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/int=
errupt_64.S
> index 7d92a7a54727..16a1b44088e7 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -87,9 +87,11 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
>  	std	r11,_TRAP(r1)
>  	std	r12,_CCR(r1)
>  	std	r3,ORIG_GPR3(r1)
> -	addi	r10,r1,STACK_FRAME_OVERHEAD
> +	/* Calling convention has r3 =3D regs, r4 =3D orig r0 */
> +	addi	r3,r1,STACK_FRAME_OVERHEAD
> +	mr	r4,r0
>  	ld	r11,exception_marker@toc(r2)
> -	std	r11,-16(r10)		/* "regshere" marker */
> +	std	r11,-16(r3)		/* "regshere" marker */
> =20
>  BEGIN_FTR_SECTION
>  	HMT_MEDIUM

I think the asm adjustments look okay. Should get a Christophe ack for
the 32-bit at least though :)

> @@ -104,8 +106,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	 * but this is the best we can do.
>  	 */
> =20
> -	/* Calling convention has r9 =3D orig r0, r10 =3D regs */
> -	mr	r9,r0
> +	/*
> +	 * Zero user registers to prevent influencing speculative execution
> +	 * state of kernel code.
> +	 */
> +	ZEROIZE_GPRS(5, 12)
> +	ZEROIZE_NVGPRS()
>  	bl	system_call_exception
> =20
>  .Lsyscall_vectored_\name\()_exit:

Did this and the below hunk belong in a later patch?

> @@ -260,9 +266,11 @@ END_BTB_FLUSH_SECTION
>  	std	r11,_TRAP(r1)
>  	std	r12,_CCR(r1)
>  	std	r3,ORIG_GPR3(r1)
> -	addi	r10,r1,STACK_FRAME_OVERHEAD
> +	/* Calling convention has r3 =3D regs, r4 =3D orig r0 */
> +	addi	r3,r1,STACK_FRAME_OVERHEAD
> +	mr	r4,r0
>  	ld	r11,exception_marker@toc(r2)
> -	std	r11,-16(r10)		/* "regshere" marker */
> +	std	r11,-16(r3)		/* "regshere" marker */
> =20
>  #ifdef CONFIG_PPC_BOOK3S
>  	li	r11,1
> @@ -283,8 +291,12 @@ END_BTB_FLUSH_SECTION
>  	wrteei	1
>  #endif
> =20
> -	/* Calling convention has r9 =3D orig r0, r10 =3D regs */
> -	mr	r9,r0
> +	/*
> +	 * Zero user registers to prevent influencing speculative execution
> +	 * state of kernel code.
> +	 */
> +	ZEROIZE_GPRS(5, 12)
> +	ZEROIZE_NVGPRS()
>  	bl	system_call_exception
> =20
>  .Lsyscall_exit:
> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.=
c
> index 64102a64fd84..2f4dd7f0d819 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -12,12 +12,8 @@
>  #include <asm/unistd.h>
> =20
> =20
> -typedef long (*syscall_fn)(long, long, long, long, long, long);
> -
>  /* Has to run notrace because it is entered not completely "reconciled" =
*/
> -notrace long system_call_exception(long r3, long r4, long r5,
> -				   long r6, long r7, long r8,
> -				   unsigned long r0, struct pt_regs *regs)
> +notrace long system_call_exception(struct pt_regs *regs, unsigned long r=
0)
>  {
>  	long ret;
>  	syscall_fn f;
> @@ -138,12 +134,6 @@ notrace long system_call_exception(long r3, long r4,=
 long r5,
>  		r0 =3D do_syscall_trace_enter(regs);
>  		if (unlikely(r0 >=3D NR_syscalls))
>  			return regs->gpr[3];
> -		r3 =3D regs->gpr[3];
> -		r4 =3D regs->gpr[4];
> -		r5 =3D regs->gpr[5];
> -		r6 =3D regs->gpr[6];
> -		r7 =3D regs->gpr[7];
> -		r8 =3D regs->gpr[8];
> =20
>  	} else if (unlikely(r0 >=3D NR_syscalls)) {
>  		if (unlikely(trap_is_unsupported_scv(regs))) {
> @@ -160,18 +150,23 @@ notrace long system_call_exception(long r3, long r4=
, long r5,
>  	if (unlikely(is_compat_task())) {
>  		f =3D (void *)compat_sys_call_table[r0];
> =20
> -		r3 &=3D 0x00000000ffffffffULL;
> -		r4 &=3D 0x00000000ffffffffULL;
> -		r5 &=3D 0x00000000ffffffffULL;
> -		r6 &=3D 0x00000000ffffffffULL;
> -		r7 &=3D 0x00000000ffffffffULL;
> -		r8 &=3D 0x00000000ffffffffULL;
> +		regs->gpr[3] &=3D 0x00000000ffffffffULL;
> +		regs->gpr[4] &=3D 0x00000000ffffffffULL;
> +		regs->gpr[5] &=3D 0x00000000ffffffffULL;
> +		regs->gpr[6] &=3D 0x00000000ffffffffULL;
> +		regs->gpr[7] &=3D 0x00000000ffffffffULL;
> +		regs->gpr[8] &=3D 0x00000000ffffffffULL;

This (possibly) changes regs->gpr values on the interrupt stack frame.

I suppose that's going to be okay.  Aside from debugging and tracing
stuff, could it cause slight differences to how signals are delivered?

Why do we actually do this anyway? Could we get rid of it (or relegate
it to !WRAPPER case)?

Thanks,
Nick

> =20
>  	} else {
>  		f =3D (void *)sys_call_table[r0];
>  	}
> =20
> -	ret =3D f(r3, r4, r5, r6, r7, r8);
> +#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
> +	ret =3D f(regs);
> +#else
> +	ret =3D f(regs->gpr[3], regs->gpr[4], regs->gpr[5],
> +		regs->gpr[6], regs->gpr[7], regs->gpr[8]);
> +#endif
> =20
>  	/*
>  	 * Ultimately, this value will get limited by KSTACK_OFFSET_MAX(),
> diff --git a/arch/powerpc/kernel/systbl.c b/arch/powerpc/kernel/systbl.c
> index e5d419822b4e..cb05e302ea58 100644
> --- a/arch/powerpc/kernel/systbl.c
> +++ b/arch/powerpc/kernel/systbl.c
> @@ -15,8 +15,16 @@
>  #include <asm/unistd.h>
>  #include <asm/syscalls.h>
> =20
> +#undef __SYSCALL_WITH_COMPAT
>  #define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr, entry)
> +
> +#undef __SYSCALL
> +#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
> +#define __SYSCALL(nr, entry) [nr] =3D __powerpc_##entry,
> +#define __powerpc_sys_ni_syscall	sys_ni_syscall
> +#else
>  #define __SYSCALL(nr, entry) [nr] =3D (void *) entry,
> +#endif
> =20
>  const syscall_fn sys_call_table[] =3D {
>  #ifdef CONFIG_PPC64
> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
> index fcca06d200d3..e1f36fd61db3 100644
> --- a/arch/powerpc/kernel/vdso.c
> +++ b/arch/powerpc/kernel/vdso.c
> @@ -39,6 +39,8 @@
>  extern char vdso32_start, vdso32_end;
>  extern char vdso64_start, vdso64_end;
> =20
> +long sys_ni_syscall(void);
> +
>  /*
>   * The vdso data page (aka. systemcfg for old ppc64 fans) is here.
>   * Once the early boot kernel code no longer needs to muck around
> --=20
> 2.34.1

