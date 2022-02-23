Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C314C0753
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 02:46:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3JmJ49G9z3cQP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 12:46:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=0C1XrPkb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20210112.gappssmtp.com
 header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=0C1XrPkb; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3JhK3gThz3bVt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 12:42:57 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id f8so18531284pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 17:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ZSgk6k6oq4+WDSHw90Jx1b5QV9HBUnYPMo9mSvEYOG4=;
 b=0C1XrPkbHJWA53JNO/RRaMBxOm1kH4oG/5vgQ8O96awDOwpUQD2knChQP+cv4XLG/N
 bUuukJTfkZG9+nTHYjxEKxC+8xEbmG1ZlHgyl0tOIZmH1VvAoUeTIh770+PWd/ak5Y4a
 KGRWZpky2qI+j5h4uWPIwpppuOrin1J/tuGl70/tZgwCnRlk22fSR/KS+wXxyQR+IMrR
 3Yqm3xVmEHYxeSOJWe4stOXMRTcpm7Np3EOdPz2y/qzAdhTOC6Pmkg9bxfB7eCW6qA4D
 IBliH0mB4Tmff921rxUrgMnuTPbQ7jtCq5EnZBZW9dFdW9dLuBPAhgFsmvDmegk/XESB
 +8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ZSgk6k6oq4+WDSHw90Jx1b5QV9HBUnYPMo9mSvEYOG4=;
 b=ZdqqfUz/xExJL6nod40KNVhOPNlt5FOirFmSL6XjBwwrHWVJNbEnpW7yct2VbI8pGh
 7gh+5EXl+JznXUBFfv85kZ5Zfo4R8yoruCtQFZW15LJwyqTmvD5FcqQDLfiW4UPSPFjl
 mJDqie8TGlvFWC44awnaJvVs+L9OHtAnIQgrWNgcOdlVweS2316Kgp3RNS6ZTug3elUY
 LROR0x8FxtxAEISIOEAmyap0aMoDlE2nGrCU+Sndc6gTDYAqzpx/spAXyDMJN1zlLd3y
 c8koYticeRiq4GWKUOtW1w3MeKhC9zK2/RFiEAZFEB3w77VEbEuy137TcQQt3yHbF0sE
 Fygw==
X-Gm-Message-State: AOAM531pn6cwUvVmGS5ojlZJvC2UbgJNIGnxVYsHAMsJSLqY6+97liA+
 PoNL+5BwN8814xbwQvvTQknH1Q==
X-Google-Smtp-Source: ABdhPJzf1D0IS7j617447m0n3eve7jzzXwIamodPS3ylD4MpH/oid7KEtseBoAM74CWr8g8sjGHsvg==
X-Received: by 2002:a05:6a00:189d:b0:4e1:dc82:eded with SMTP id
 x29-20020a056a00189d00b004e1dc82ededmr25541021pfh.27.1645580575708; 
 Tue, 22 Feb 2022 17:42:55 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id s10sm19332283pfu.186.2022.02.22.17.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 17:42:55 -0800 (PST)
Date: Tue, 22 Feb 2022 17:42:55 -0800 (PST)
X-Google-Original-Date: Tue, 22 Feb 2022 17:19:41 PST (-0800)
Subject: Re: [PATCH V5 18/21] riscv: compat: signal: Add rt_frame
 implementation
In-Reply-To: <20220201150545.1512822-19-guoren@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-baf0b4e6-5e77-46d5-a213-c40cf19c0c4c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 guoren@linux.alibaba.com, linux-parisc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>,
 drew@beagleboard.org, anup@brainfault.org, wangjunqiang@iscas.ac.cn,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, guoren@kernel.org, liush@allwinnertech.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, wefu@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 01 Feb 2022 07:05:42 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Implement compat_setup_rt_frame for sigcontext save & restore. The
> main process is the same with signal, but the rv32 pt_regs' size
> is different from rv64's, so we needs convert them.

It's kind of ugly to have two copies of essentially exactly the same 
code, just targeted at different structures.  The other ports have 
sufficiently different 32-bit and 64-bit ABIs that it makes sense there, 
but we should be able to share pretty much everything.  That said, all 
that would probably only ever benefit RISC-V so I'm not sure it'd be 
worth doing.

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Happy to see someone clean this up later, but it seems good enough for 
now.

Thanks!

> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  arch/riscv/kernel/Makefile        |   1 +
>  arch/riscv/kernel/compat_signal.c | 243 ++++++++++++++++++++++++++++++
>  arch/riscv/kernel/signal.c        |  13 +-
>  3 files changed, 256 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/kernel/compat_signal.c
>
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 88e79f481c21..a46f9807c59e 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -67,4 +67,5 @@ obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
>
>  obj-$(CONFIG_EFI)		+= efi.o
>  obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
> +obj-$(CONFIG_COMPAT)		+= compat_signal.o
>  obj-$(CONFIG_COMPAT)		+= compat_vdso/
> diff --git a/arch/riscv/kernel/compat_signal.c b/arch/riscv/kernel/compat_signal.c
> new file mode 100644
> index 000000000000..7041742ded08
> --- /dev/null
> +++ b/arch/riscv/kernel/compat_signal.c
> @@ -0,0 +1,243 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/compat.h>
> +#include <linux/signal.h>
> +#include <linux/uaccess.h>
> +#include <linux/syscalls.h>
> +#include <linux/tracehook.h>
> +#include <linux/linkage.h>
> +
> +#include <asm/ucontext.h>
> +#include <asm/vdso.h>
> +#include <asm/switch_to.h>
> +#include <asm/csr.h>
> +
> +#define COMPAT_DEBUG_SIG 0
> +
> +struct compat_sigcontext {
> +	struct compat_user_regs_struct sc_regs;
> +	union __riscv_fp_state sc_fpregs;
> +};
> +
> +struct compat_ucontext {
> +	compat_ulong_t		uc_flags;
> +	struct compat_ucontext	*uc_link;
> +	compat_stack_t		uc_stack;
> +	sigset_t		uc_sigmask;
> +	/* There's some padding here to allow sigset_t to be expanded in the
> +	 * future.  Though this is unlikely, other architectures put uc_sigmask
> +	 * at the end of this structure and explicitly state it can be
> +	 * expanded, so we didn't want to box ourselves in here. */
> +	__u8		  __unused[1024 / 8 - sizeof(sigset_t)];
> +	/* We can't put uc_sigmask at the end of this structure because we need
> +	 * to be able to expand sigcontext in the future.  For example, the
> +	 * vector ISA extension will almost certainly add ISA state.  We want
> +	 * to ensure all user-visible ISA state can be saved and restored via a
> +	 * ucontext, so we're putting this at the end in order to allow for
> +	 * infinite extensibility.  Since we know this will be extended and we
> +	 * assume sigset_t won't be extended an extreme amount, we're
> +	 * prioritizing this. */
> +	struct compat_sigcontext uc_mcontext;
> +};
> +
> +struct compat_rt_sigframe {
> +	struct compat_siginfo info;
> +	struct compat_ucontext uc;
> +};
> +
> +#ifdef CONFIG_FPU
> +static long compat_restore_fp_state(struct pt_regs *regs,
> +	union __riscv_fp_state __user *sc_fpregs)
> +{
> +	long err;
> +	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
> +	size_t i;
> +
> +	err = __copy_from_user(&current->thread.fstate, state, sizeof(*state));
> +	if (unlikely(err))
> +		return err;
> +
> +	fstate_restore(current, regs);
> +
> +	/* We support no other extension state at this time. */
> +	for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
> +		u32 value;
> +
> +		err = __get_user(value, &sc_fpregs->q.reserved[i]);
> +		if (unlikely(err))
> +			break;
> +		if (value != 0)
> +			return -EINVAL;
> +	}
> +
> +	return err;
> +}
> +
> +static long compat_save_fp_state(struct pt_regs *regs,
> +			  union __riscv_fp_state __user *sc_fpregs)
> +{
> +	long err;
> +	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
> +	size_t i;
> +
> +	fstate_save(current, regs);
> +	err = __copy_to_user(state, &current->thread.fstate, sizeof(*state));
> +	if (unlikely(err))
> +		return err;
> +
> +	/* We support no other extension state at this time. */
> +	for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
> +		err = __put_user(0, &sc_fpregs->q.reserved[i]);
> +		if (unlikely(err))
> +			break;
> +	}
> +
> +	return err;
> +}
> +#else
> +#define compat_save_fp_state(task, regs) (0)
> +#define compat_restore_fp_state(task, regs) (0)
> +#endif
> +
> +static long compat_restore_sigcontext(struct pt_regs *regs,
> +	struct compat_sigcontext __user *sc)
> +{
> +	long err;
> +	struct compat_user_regs_struct cregs;
> +
> +	/* sc_regs is structured the same as the start of pt_regs */
> +	err = __copy_from_user(&cregs, &sc->sc_regs, sizeof(sc->sc_regs));
> +
> +	cregs_to_regs(&cregs, regs);
> +
> +	/* Restore the floating-point state. */
> +	if (has_fpu())
> +		err |= compat_restore_fp_state(regs, &sc->sc_fpregs);
> +	return err;
> +}
> +
> +COMPAT_SYSCALL_DEFINE0(rt_sigreturn)
> +{
> +	struct pt_regs *regs = current_pt_regs();
> +	struct compat_rt_sigframe __user *frame;
> +	struct task_struct *task;
> +	sigset_t set;
> +
> +	/* Always make any pending restarted system calls return -EINTR */
> +	current->restart_block.fn = do_no_restart_syscall;
> +
> +	frame = (struct compat_rt_sigframe __user *)regs->sp;
> +
> +	if (!access_ok(frame, sizeof(*frame)))
> +		goto badframe;
> +
> +	if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
> +		goto badframe;
> +
> +	set_current_blocked(&set);
> +
> +	if (compat_restore_sigcontext(regs, &frame->uc.uc_mcontext))
> +		goto badframe;
> +
> +	if (compat_restore_altstack(&frame->uc.uc_stack))
> +		goto badframe;
> +
> +	return regs->a0;
> +
> +badframe:
> +	task = current;
> +	if (show_unhandled_signals) {
> +		pr_info_ratelimited(
> +			"%s[%d]: bad frame in %s: frame=%p pc=%p sp=%p\n",
> +			task->comm, task_pid_nr(task), __func__,
> +			frame, (void *)regs->epc, (void *)regs->sp);
> +	}
> +	force_sig(SIGSEGV);
> +	return 0;
> +}
> +
> +static long compat_setup_sigcontext(struct compat_rt_sigframe __user *frame,
> +	struct pt_regs *regs)
> +{
> +	struct compat_sigcontext __user *sc = &frame->uc.uc_mcontext;
> +	struct compat_user_regs_struct cregs;
> +	long err;
> +
> +	regs_to_cregs(&cregs, regs);
> +
> +	/* sc_regs is structured the same as the start of pt_regs */
> +	err = __copy_to_user(&sc->sc_regs, &cregs, sizeof(sc->sc_regs));
> +	/* Save the floating-point state. */
> +	if (has_fpu())
> +		err |= compat_save_fp_state(regs, &sc->sc_fpregs);
> +	return err;
> +}
> +
> +static inline void __user *compat_get_sigframe(struct ksignal *ksig,
> +	struct pt_regs *regs, size_t framesize)
> +{
> +	unsigned long sp;
> +	/* Default to using normal stack */
> +	sp = regs->sp;
> +
> +	/*
> +	 * If we are on the alternate signal stack and would overflow it, don't.
> +	 * Return an always-bogus address instead so we will die with SIGSEGV.
> +	 */
> +	if (on_sig_stack(sp) && !likely(on_sig_stack(sp - framesize)))
> +		return (void __user __force *)(-1UL);
> +
> +	/* This is the X/Open sanctioned signal stack switching. */
> +	sp = sigsp(sp, ksig) - framesize;
> +
> +	/* Align the stack frame. */
> +	sp &= ~0xfUL;
> +
> +	return (void __user *)sp;
> +}
> +
> +int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
> +	struct pt_regs *regs)
> +{
> +	struct compat_rt_sigframe __user *frame;
> +	long err = 0;
> +
> +	frame = compat_get_sigframe(ksig, regs, sizeof(*frame));
> +	if (!access_ok(frame, sizeof(*frame)))
> +		return -EFAULT;
> +
> +	err |= copy_siginfo_to_user32(&frame->info, &ksig->info);
> +
> +	/* Create the ucontext. */
> +	err |= __put_user(0, &frame->uc.uc_flags);
> +	err |= __put_user(NULL, &frame->uc.uc_link);
> +	err |= __compat_save_altstack(&frame->uc.uc_stack, regs->sp);
> +	err |= compat_setup_sigcontext(frame, regs);
> +	err |= __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
> +	if (err)
> +		return -EFAULT;
> +
> +	regs->ra = (unsigned long)COMPAT_VDSO_SYMBOL(
> +			current->mm->context.vdso, rt_sigreturn);
> +
> +	/*
> +	 * Set up registers for signal handler.
> +	 * Registers that we don't modify keep the value they had from
> +	 * user-space at the time we took the signal.
> +	 * We always pass siginfo and mcontext, regardless of SA_SIGINFO,
> +	 * since some things rely on this (e.g. glibc's debug/segfault.c).
> +	 */
> +	regs->epc = (unsigned long)ksig->ka.sa.sa_handler;
> +	regs->sp = (unsigned long)frame;
> +	regs->a0 = ksig->sig;                     /* a0: signal number */
> +	regs->a1 = (unsigned long)(&frame->info); /* a1: siginfo pointer */
> +	regs->a2 = (unsigned long)(&frame->uc);   /* a2: ucontext pointer */
> +
> +#if COMPAT_DEBUG_SIG
> +	pr_info("SIG deliver (%s:%d): sig=%d pc=%p ra=%p sp=%p\n",
> +		current->comm, task_pid_nr(current), ksig->sig,
> +		(void *)regs->epc, (void *)regs->ra, frame);
> +#endif
> +
> +	return 0;
> +}
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index c2d5ecbe5526..27d8f39228c4 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -6,6 +6,7 @@
>   * Copyright (C) 2012 Regents of the University of California
>   */
>
> +#include <linux/compat.h>
>  #include <linux/signal.h>
>  #include <linux/uaccess.h>
>  #include <linux/syscalls.h>
> @@ -229,6 +230,11 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
>  	return 0;
>  }
>
> +#ifdef CONFIG_COMPAT
> +extern int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
> +				 struct pt_regs *regs);
> +#endif
> +
>  static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
>  {
>  	sigset_t *oldset = sigmask_to_save();
> @@ -258,8 +264,13 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
>  		}
>  	}
>
> +#ifdef CONFIG_COMPAT
>  	/* Set up the stack frame */
> -	ret = setup_rt_frame(ksig, oldset, regs);
> +	if (is_compat_task())
> +		ret = compat_setup_rt_frame(ksig, oldset, regs);
> +	else
> +#endif
> +		ret = setup_rt_frame(ksig, oldset, regs);
>
>  	signal_setup_done(ret, ksig, 0);
>  }
