Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B22015B5947
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 13:27:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR48B2QvBz3c4h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 21:27:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B3c6dKwF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B3c6dKwF;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR47X5Kpqz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 21:27:02 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id i19so4704666pgi.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 04:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=WYLKBeBVmdnDf053iH1UpxLZ3tkpNAQN/zDGrLpaY6Q=;
        b=B3c6dKwFmjtlB2u7blP2vmeNrTwlrmzv/H/B20eAtt9yXwz5tE0lRRakFYM+iuMiMw
         NFncwZSBoGwnONiHqgw3h0J3WzLO3xdo1SSfnUUIuhAbK5mckc25r7hyO98Gp2pM9xej
         Jwnio9ek/fBF+Q4mDn8bPVdlNdAqRAnqk3CJE8SJVmeB0oJwsk9phlJo5pwn7Hlc2pJa
         Xh4lNF8euD5T8RtxSwI5cnp8b4NR/9W+sqnVThayuKYVxP9tErYPDMH2rOyWYqQVrGx3
         iaU87pW4mS+cljTEqRU+aUMBTERCYf3V5DZhUmo2VEop9DXpPpSF0uADQA8NqiCkmjHD
         utsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=WYLKBeBVmdnDf053iH1UpxLZ3tkpNAQN/zDGrLpaY6Q=;
        b=zWYUtA4MrRUKMsUYR/7d/VHp7AxwJOFTrdUmx2uPIi6wzA5aZmANLIhxJ2vIls7YHK
         uDh8vEzL+fzLzarpF6Tv6q56qhB6myuQQDRUt0Gmea+wceRGIwVxkxqRdOXUJkSz0U2I
         s7YZQnZ3a0jcP1Wlzmj8jccb2iH41GJt7SJK5sZcRM9/bNYBGhQwt1fZnXu+YkBeoBTc
         7s5K80gd+uVF83L1u28Vg/hxsHvq3lEVLyAwlb6xFxbHimBdsXbhRnhD7wl7PSL1uIyl
         nCX/ALBs7aqNfv/mfsDtSh+gUQ3ygyHU0u2UYNezxfEZ8rrce828pIQ6trXEXM4v7eGQ
         Go5g==
X-Gm-Message-State: ACgBeo2gakjeK0F6FUsH02xP8+YZ8WbL/fbhoZQimbACJUg8klG5iTot
	TO/LvNejzTVtTXYT1lZXBQ75+hBrOSA=
X-Google-Smtp-Source: AA6agR55vURa8JRy1jGSIbEEOstq/YTBkWz4iM5CFKHn/J1ciGcoQqS6h+oVqeFf5lWXkD1NKsmn9Q==
X-Received: by 2002:a63:fd41:0:b0:438:7670:589a with SMTP id m1-20020a63fd41000000b004387670589amr15270914pgj.148.1662982020543;
        Mon, 12 Sep 2022 04:27:00 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id x21-20020aa78f15000000b00540f3ac5fb8sm5250979pfr.69.2022.09.12.04.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 04:27:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 21:26:55 +1000
Message-Id: <CMUDXBHOZSQO.1XF6NGPKQUCGN@bobo>
Subject: Re: [PATCH v4 13/20] powerpc: Provide syscall wrapper
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-14-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-14-rmclure@linux.ibm.com>
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

On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
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

I didn't look closely at the syscall wrapper macro gunk but it
generally looks pretty fine, not much change to actual code which
is good...

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
> ---
>  arch/powerpc/Kconfig                       |  1 +
>  arch/powerpc/include/asm/interrupt.h       |  3 +-
>  arch/powerpc/include/asm/syscall.h         |  4 +
>  arch/powerpc/include/asm/syscall_wrapper.h | 84 ++++++++++++++++++++
>  arch/powerpc/include/asm/syscalls.h        | 25 +++++-
>  arch/powerpc/kernel/entry_32.S             |  6 +-
>  arch/powerpc/kernel/interrupt_64.S         | 16 ++--
>  arch/powerpc/kernel/syscall.c              | 31 +++-----
>  arch/powerpc/kernel/systbl.c               |  2 +
>  arch/powerpc/kernel/vdso.c                 |  2 +
>  10 files changed, 142 insertions(+), 32 deletions(-)
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
> index 8069dbc4b8d1..3f9cad81585c 100644
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
> +long system_call_exception(unsigned long r0, struct pt_regs *regs);

Can you change the calling convention to be regs then r0 so regs matches
the argument position in the syscall?

Then we perhaps should look at storing the registers to pt_regs using
the same r3 as base register to save the values in the asm too. That
way it's friendlier to possible static load hit store predictors. Not
for your series but just a possible later idea.

Thanks,
Nick


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
> index e979b7593d2b..14af648ee82c 100644
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
>  #ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
> @@ -24,7 +30,6 @@ struct rtas_args;
>   */
> =20
>  long sys_rtas(struct rtas_args __user *uargs);
> -long sys_ni_syscall(void);
> =20
>  #ifdef CONFIG_PPC64
>  long sys_ppc64_personality(unsigned long personality);
> @@ -93,6 +98,24 @@ long compat_sys_ppc_sync_file_range2(int fd, unsigned =
int flags,
>  				     unsigned int nbytes2);
>  #endif /* CONFIG_COMPAT */
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
>  #endif /* CONFIG_ARCH_HAS_SYSCALL_WRAPPER */
> =20
>  #endif /* __KERNEL__ */
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_3=
2.S
> index 44dfce9a60c5..8d6e02ef5dc0 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -122,9 +122,9 @@ transfer_to_syscall:
>  	SAVE_NVGPRS(r1)
>  	kuep_lock
> =20
> -	/* Calling convention has r9 =3D orig r0, r10 =3D regs */
> -	addi	r10,r1,STACK_FRAME_OVERHEAD
> -	mr	r9,r0
> +	/* Calling convention has r3 =3D orig r0, r4 =3D regs */
> +	addi	r4,r1,STACK_FRAME_OVERHEAD
> +	mr	r3,r0
>  	bl	system_call_exception
> =20
>  ret_from_syscall:
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/int=
errupt_64.S
> index 71d2d9497283..0178aeba3820 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -92,9 +92,9 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
>  	std	r11,_TRAP(r1)
>  	std	r12,_CCR(r1)
>  	std	r3,ORIG_GPR3(r1)
> -	addi	r10,r1,STACK_FRAME_OVERHEAD
> +	addi	r4,r1,STACK_FRAME_OVERHEAD
>  	ld	r11,exception_marker@toc(r2)
> -	std	r11,-16(r10)		/* "regshere" marker */
> +	std	r11,-16(r4)		/* "regshere" marker */
> =20
>  BEGIN_FTR_SECTION
>  	HMT_MEDIUM
> @@ -109,8 +109,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	 * but this is the best we can do.
>  	 */
> =20
> -	/* Calling convention has r9 =3D orig r0, r10 =3D regs */
> -	mr	r9,r0
> +	/* Calling convention has r3 =3D orig r0, r4 =3D regs */
> +	mr	r3,r0
>  	bl	system_call_exception
> =20
>  .Lsyscall_vectored_\name\()_exit:
> @@ -277,9 +277,9 @@ END_BTB_FLUSH_SECTION
>  	std	r11,_TRAP(r1)
>  	std	r12,_CCR(r1)
>  	std	r3,ORIG_GPR3(r1)
> -	addi	r10,r1,STACK_FRAME_OVERHEAD
> +	addi	r4,r1,STACK_FRAME_OVERHEAD
>  	ld	r11,exception_marker@toc(r2)
> -	std	r11,-16(r10)		/* "regshere" marker */
> +	std	r11,-16(r4)		/* "regshere" marker */
> =20
>  #ifdef CONFIG_PPC_BOOK3S
>  	li	r11,1
> @@ -300,8 +300,8 @@ END_BTB_FLUSH_SECTION
>  	wrteei	1
>  #endif
> =20
> -	/* Calling convention has r9 =3D orig r0, r10 =3D regs */
> -	mr	r9,r0
> +	/* Calling convention has r3 =3D orig r0, r4 =3D regs */
> +	mr	r3,r0
>  	bl	system_call_exception
> =20
>  .Lsyscall_exit:
> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.=
c
> index 64102a64fd84..bda5221b420e 100644
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
> +notrace long system_call_exception(unsigned long r0, struct pt_regs *reg=
s)
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
> index b88a9c2a1f50..cb05e302ea58 100644
> --- a/arch/powerpc/kernel/systbl.c
> +++ b/arch/powerpc/kernel/systbl.c
> @@ -15,8 +15,10 @@
>  #include <asm/unistd.h>
>  #include <asm/syscalls.h>
> =20
> +#undef __SYSCALL_WITH_COMPAT
>  #define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr, entry)
> =20
> +#undef __SYSCALL
>  #ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
>  #define __SYSCALL(nr, entry) [nr] =3D __powerpc_##entry,
>  #define __powerpc_sys_ni_syscall	sys_ni_syscall
> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
> index 080c9e7de0c0..88d83162eaf1 100644
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

