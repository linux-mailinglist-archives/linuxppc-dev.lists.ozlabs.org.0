Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 933DE355EAA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 00:17:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFMN04319z3brm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 08:17:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=mvista-com.20150623.gappssmtp.com header.i=@mvista-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=jVp4LQa5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mvista.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=cminyard@mvista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mvista-com.20150623.gappssmtp.com
 header.i=@mvista-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=jVp4LQa5; dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF9Cd5c9Lz30Dk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 00:39:35 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id
 y19-20020a0568301d93b02901b9f88a238eso14815637oti.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Apr 2021 07:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=A9/oUrZcom6uNGfq8uQSMfL5RjzorysUyhxrrEpOhZQ=;
 b=jVp4LQa5fpfONGeRhMPma1uxlOJ6CXJvy93wnlaGkszijzRZX4GP31qLbOdrFUx9d8
 SN7/z6WwtNVmZgiGOxPPOtCgT1NQH7g3NP6K1uj/d+Cj5DiyhAg9llwoIeBQaQAM7mfK
 7gxshk0yzmOS3ig6OVdDC/A0+bDYmd1+7IYazjMD55ELbrWFzOc5U+f9Ua47SqJiE2ic
 qy3L2qasrr7N5nB6l3tEqmiBFqvfSJc5WoMKGegkuJ45Nl1JSVvxDDJMGiq0a+L0JLgE
 OWxYGV+4WSfrvV+iZ2O7gIN/tkpU4+EMOq2QHye+MWXNdq8mFdSi+zrXV9NFYQtQkQo1
 1iDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=A9/oUrZcom6uNGfq8uQSMfL5RjzorysUyhxrrEpOhZQ=;
 b=VyjRIB97J1oQ1iUwTKqYFNBZLNGCmL7QwA600Ltcw7Fbc7oyXxfDv25FFJ12p+vNt4
 xZ7Z6juddDnF87vSOAB5S1P+U1c+XJXiNSzmeTn8KG8oXgpRJip++NtIG5u70OliHyAC
 cjprlypnmucNGdIUOm9TLDOdyITVB4kdtcBkHqYXQYLfs7d93oymHVMirPNM/jmcBpE3
 +D8Q4E0LvvylhAqCX5bRy2E+Uudsq361ToDG6rIlx2cYa3manFw3c4DF1Lv37hKyJYW1
 BfLgPOtKfptzomC7blKicqxrpyBwfd3C0SHCpBNvVb2cuTfZ3wKxC5SJdAcVknCs03Qg
 vBAQ==
X-Gm-Message-State: AOAM532o/DZyMANWsDUJIVHw+PCIGzDHjTxtdaPMpZxjQxqDQSRwGs4s
 adHqIK+qVMiN9ET/k1/7aezJrQ==
X-Google-Smtp-Source: ABdhPJy8JWc4jZaZX01KbZFfD0qHlJIfjC5GLBU9ob9QnsmfPtoyA8gGMABB2kkmRAhm7/K2AJZ2Dg==
X-Received: by 2002:a05:6830:15d2:: with SMTP id
 j18mr27564004otr.75.1617719972291; 
 Tue, 06 Apr 2021 07:39:32 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:f584:ff80:e7e9:e850])
 by smtp.gmail.com with ESMTPSA id a6sm3567669oiw.44.2021.04.06.07.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 07:39:32 -0700 (PDT)
Date: Tue, 6 Apr 2021 09:39:29 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] kernel.h: Split out panic and oops helpers
Message-ID: <20210406143929.GN7167@minyard.net>
References: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Wed, 07 Apr 2021 08:17:11 +1000
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
Reply-To: cminyard@mvista.com
Cc: linux-hyperv@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arch@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Corey Minyard <minyard@acm.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Iurii Zaikin <yzaikin@google.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Joerg Roedel <jroedel@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Josh Triplett <josh@joshtriplett.org>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>, rcu@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, openipmi-developer@lists.sourceforge.net,
 Michael Kelley <mikelley@microsoft.com>, Vlastimil Babka <vbabka@suse.cz>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Eric Biederman <ebiederm@xmission.com>,
 linux-fsdevel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 06, 2021 at 04:31:58PM +0300, Andy Shevchenko wrote:
> kernel.h is being used as a dump for all kinds of stuff for a long time.
> Here is the attempt to start cleaning it up by splitting out panic and
> oops helpers.
> 
> At the same time convert users in header and lib folder to use new header.
> Though for time being include new header back to kernel.h to avoid twisted
> indirected includes for existing users.

For the IPMI portion:

Acked-by: Corey Minyard <cminyard@mvista.com>

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/powerpc/kernel/setup-common.c   |  1 +
>  arch/x86/include/asm/desc.h          |  1 +
>  arch/x86/kernel/cpu/mshyperv.c       |  1 +
>  arch/x86/kernel/setup.c              |  1 +
>  drivers/char/ipmi/ipmi_msghandler.c  |  1 +
>  drivers/remoteproc/remoteproc_core.c |  1 +
>  include/asm-generic/bug.h            |  3 +-
>  include/linux/kernel.h               | 84 +-----------------------
>  include/linux/panic.h                | 98 ++++++++++++++++++++++++++++
>  include/linux/panic_notifier.h       | 12 ++++
>  kernel/hung_task.c                   |  1 +
>  kernel/kexec_core.c                  |  1 +
>  kernel/panic.c                       |  1 +
>  kernel/rcu/tree.c                    |  2 +
>  kernel/sysctl.c                      |  1 +
>  kernel/trace/trace.c                 |  1 +
>  16 files changed, 126 insertions(+), 84 deletions(-)
>  create mode 100644 include/linux/panic.h
>  create mode 100644 include/linux/panic_notifier.h
> 
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 74a98fff2c2f..046fe21b5c3b 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -9,6 +9,7 @@
>  #undef DEBUG
>  
>  #include <linux/export.h>
> +#include <linux/panic_notifier.h>
>  #include <linux/string.h>
>  #include <linux/sched.h>
>  #include <linux/init.h>
> diff --git a/arch/x86/include/asm/desc.h b/arch/x86/include/asm/desc.h
> index 476082a83d1c..ceb12683b6d1 100644
> --- a/arch/x86/include/asm/desc.h
> +++ b/arch/x86/include/asm/desc.h
> @@ -9,6 +9,7 @@
>  #include <asm/irq_vectors.h>
>  #include <asm/cpu_entry_area.h>
>  
> +#include <linux/debug_locks.h>
>  #include <linux/smp.h>
>  #include <linux/percpu.h>
>  
> diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
> index 22f13343b5da..9e5c6f2b044d 100644
> --- a/arch/x86/kernel/cpu/mshyperv.c
> +++ b/arch/x86/kernel/cpu/mshyperv.c
> @@ -17,6 +17,7 @@
>  #include <linux/irq.h>
>  #include <linux/kexec.h>
>  #include <linux/i8253.h>
> +#include <linux/panic_notifier.h>
>  #include <linux/random.h>
>  #include <asm/processor.h>
>  #include <asm/hypervisor.h>
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 59e5e0903b0c..570699eecf90 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -14,6 +14,7 @@
>  #include <linux/initrd.h>
>  #include <linux/iscsi_ibft.h>
>  #include <linux/memblock.h>
> +#include <linux/panic_notifier.h>
>  #include <linux/pci.h>
>  #include <linux/root_dev.h>
>  #include <linux/hugetlb.h>
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index 8a0e97b33cae..e96cb5c4f97a 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -16,6 +16,7 @@
>  
>  #include <linux/module.h>
>  #include <linux/errno.h>
> +#include <linux/panic_notifier.h>
>  #include <linux/poll.h>
>  #include <linux/sched.h>
>  #include <linux/seq_file.h>
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 626a6b90fba2..76dd8e2b1e7e 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -20,6 +20,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/device.h>
> +#include <linux/panic_notifier.h>
>  #include <linux/slab.h>
>  #include <linux/mutex.h>
>  #include <linux/dma-map-ops.h>
> diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
> index 76a10e0dca9f..719410b93f99 100644
> --- a/include/asm-generic/bug.h
> +++ b/include/asm-generic/bug.h
> @@ -17,7 +17,8 @@
>  #endif
>  
>  #ifndef __ASSEMBLY__
> -#include <linux/kernel.h>
> +#include <linux/panic.h>
> +#include <linux/printk.h>
>  
>  #ifdef CONFIG_BUG
>  
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index 09035ac67d4b..6c5a05ac1ecb 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -14,6 +14,7 @@
>  #include <linux/math.h>
>  #include <linux/minmax.h>
>  #include <linux/typecheck.h>
> +#include <linux/panic.h>
>  #include <linux/printk.h>
>  #include <linux/build_bug.h>
>  #include <linux/static_call_types.h>
> @@ -70,7 +71,6 @@
>  #define lower_32_bits(n) ((u32)((n) & 0xffffffff))
>  
>  struct completion;
> -struct pt_regs;
>  struct user;
>  
>  #ifdef CONFIG_PREEMPT_VOLUNTARY
> @@ -175,14 +175,6 @@ void __might_fault(const char *file, int line);
>  static inline void might_fault(void) { }
>  #endif
>  
> -extern struct atomic_notifier_head panic_notifier_list;
> -extern long (*panic_blink)(int state);
> -__printf(1, 2)
> -void panic(const char *fmt, ...) __noreturn __cold;
> -void nmi_panic(struct pt_regs *regs, const char *msg);
> -extern void oops_enter(void);
> -extern void oops_exit(void);
> -extern bool oops_may_print(void);
>  void do_exit(long error_code) __noreturn;
>  void complete_and_exit(struct completion *, long) __noreturn;
>  
> @@ -368,52 +360,8 @@ extern int __kernel_text_address(unsigned long addr);
>  extern int kernel_text_address(unsigned long addr);
>  extern int func_ptr_is_kernel_text(void *ptr);
>  
> -#ifdef CONFIG_SMP
> -extern unsigned int sysctl_oops_all_cpu_backtrace;
> -#else
> -#define sysctl_oops_all_cpu_backtrace 0
> -#endif /* CONFIG_SMP */
> -
>  extern void bust_spinlocks(int yes);
> -extern int panic_timeout;
> -extern unsigned long panic_print;
> -extern int panic_on_oops;
> -extern int panic_on_unrecovered_nmi;
> -extern int panic_on_io_nmi;
> -extern int panic_on_warn;
> -extern unsigned long panic_on_taint;
> -extern bool panic_on_taint_nousertaint;
> -extern int sysctl_panic_on_rcu_stall;
> -extern int sysctl_max_rcu_stall_to_panic;
> -extern int sysctl_panic_on_stackoverflow;
> -
> -extern bool crash_kexec_post_notifiers;
>  
> -/*
> - * panic_cpu is used for synchronizing panic() and crash_kexec() execution. It
> - * holds a CPU number which is executing panic() currently. A value of
> - * PANIC_CPU_INVALID means no CPU has entered panic() or crash_kexec().
> - */
> -extern atomic_t panic_cpu;
> -#define PANIC_CPU_INVALID	-1
> -
> -/*
> - * Only to be used by arch init code. If the user over-wrote the default
> - * CONFIG_PANIC_TIMEOUT, honor it.
> - */
> -static inline void set_arch_panic_timeout(int timeout, int arch_default_timeout)
> -{
> -	if (panic_timeout == arch_default_timeout)
> -		panic_timeout = timeout;
> -}
> -extern const char *print_tainted(void);
> -enum lockdep_ok {
> -	LOCKDEP_STILL_OK,
> -	LOCKDEP_NOW_UNRELIABLE
> -};
> -extern void add_taint(unsigned flag, enum lockdep_ok);
> -extern int test_taint(unsigned flag);
> -extern unsigned long get_taint(void);
>  extern int root_mountflags;
>  
>  extern bool early_boot_irqs_disabled;
> @@ -432,36 +380,6 @@ extern enum system_states {
>  	SYSTEM_SUSPEND,
>  } system_state;
>  
> -/* This cannot be an enum because some may be used in assembly source. */
> -#define TAINT_PROPRIETARY_MODULE	0
> -#define TAINT_FORCED_MODULE		1
> -#define TAINT_CPU_OUT_OF_SPEC		2
> -#define TAINT_FORCED_RMMOD		3
> -#define TAINT_MACHINE_CHECK		4
> -#define TAINT_BAD_PAGE			5
> -#define TAINT_USER			6
> -#define TAINT_DIE			7
> -#define TAINT_OVERRIDDEN_ACPI_TABLE	8
> -#define TAINT_WARN			9
> -#define TAINT_CRAP			10
> -#define TAINT_FIRMWARE_WORKAROUND	11
> -#define TAINT_OOT_MODULE		12
> -#define TAINT_UNSIGNED_MODULE		13
> -#define TAINT_SOFTLOCKUP		14
> -#define TAINT_LIVEPATCH			15
> -#define TAINT_AUX			16
> -#define TAINT_RANDSTRUCT		17
> -#define TAINT_FLAGS_COUNT		18
> -#define TAINT_FLAGS_MAX			((1UL << TAINT_FLAGS_COUNT) - 1)
> -
> -struct taint_flag {
> -	char c_true;	/* character printed when tainted */
> -	char c_false;	/* character printed when not tainted */
> -	bool module;	/* also show as a per-module taint flag */
> -};
> -
> -extern const struct taint_flag taint_flags[TAINT_FLAGS_COUNT];
> -
>  extern const char hex_asc[];
>  #define hex_asc_lo(x)	hex_asc[((x) & 0x0f)]
>  #define hex_asc_hi(x)	hex_asc[((x) & 0xf0) >> 4]
> diff --git a/include/linux/panic.h b/include/linux/panic.h
> new file mode 100644
> index 000000000000..f5844908a089
> --- /dev/null
> +++ b/include/linux/panic.h
> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_PANIC_H
> +#define _LINUX_PANIC_H
> +
> +#include <linux/compiler_attributes.h>
> +#include <linux/types.h>
> +
> +struct pt_regs;
> +
> +extern long (*panic_blink)(int state);
> +__printf(1, 2)
> +void panic(const char *fmt, ...) __noreturn __cold;
> +void nmi_panic(struct pt_regs *regs, const char *msg);
> +extern void oops_enter(void);
> +extern void oops_exit(void);
> +extern bool oops_may_print(void);
> +
> +#ifdef CONFIG_SMP
> +extern unsigned int sysctl_oops_all_cpu_backtrace;
> +#else
> +#define sysctl_oops_all_cpu_backtrace 0
> +#endif /* CONFIG_SMP */
> +
> +extern int panic_timeout;
> +extern unsigned long panic_print;
> +extern int panic_on_oops;
> +extern int panic_on_unrecovered_nmi;
> +extern int panic_on_io_nmi;
> +extern int panic_on_warn;
> +
> +extern unsigned long panic_on_taint;
> +extern bool panic_on_taint_nousertaint;
> +
> +extern int sysctl_panic_on_rcu_stall;
> +extern int sysctl_max_rcu_stall_to_panic;
> +extern int sysctl_panic_on_stackoverflow;
> +
> +extern bool crash_kexec_post_notifiers;
> +
> +/*
> + * panic_cpu is used for synchronizing panic() and crash_kexec() execution. It
> + * holds a CPU number which is executing panic() currently. A value of
> + * PANIC_CPU_INVALID means no CPU has entered panic() or crash_kexec().
> + */
> +extern atomic_t panic_cpu;
> +#define PANIC_CPU_INVALID	-1
> +
> +/*
> + * Only to be used by arch init code. If the user over-wrote the default
> + * CONFIG_PANIC_TIMEOUT, honor it.
> + */
> +static inline void set_arch_panic_timeout(int timeout, int arch_default_timeout)
> +{
> +	if (panic_timeout == arch_default_timeout)
> +		panic_timeout = timeout;
> +}
> +
> +/* This cannot be an enum because some may be used in assembly source. */
> +#define TAINT_PROPRIETARY_MODULE	0
> +#define TAINT_FORCED_MODULE		1
> +#define TAINT_CPU_OUT_OF_SPEC		2
> +#define TAINT_FORCED_RMMOD		3
> +#define TAINT_MACHINE_CHECK		4
> +#define TAINT_BAD_PAGE			5
> +#define TAINT_USER			6
> +#define TAINT_DIE			7
> +#define TAINT_OVERRIDDEN_ACPI_TABLE	8
> +#define TAINT_WARN			9
> +#define TAINT_CRAP			10
> +#define TAINT_FIRMWARE_WORKAROUND	11
> +#define TAINT_OOT_MODULE		12
> +#define TAINT_UNSIGNED_MODULE		13
> +#define TAINT_SOFTLOCKUP		14
> +#define TAINT_LIVEPATCH			15
> +#define TAINT_AUX			16
> +#define TAINT_RANDSTRUCT		17
> +#define TAINT_FLAGS_COUNT		18
> +#define TAINT_FLAGS_MAX			((1UL << TAINT_FLAGS_COUNT) - 1)
> +
> +struct taint_flag {
> +	char c_true;	/* character printed when tainted */
> +	char c_false;	/* character printed when not tainted */
> +	bool module;	/* also show as a per-module taint flag */
> +};
> +
> +extern const struct taint_flag taint_flags[TAINT_FLAGS_COUNT];
> +
> +enum lockdep_ok {
> +	LOCKDEP_STILL_OK,
> +	LOCKDEP_NOW_UNRELIABLE,
> +};
> +
> +extern const char *print_tainted(void);
> +extern void add_taint(unsigned flag, enum lockdep_ok);
> +extern int test_taint(unsigned flag);
> +extern unsigned long get_taint(void);
> +
> +#endif	/* _LINUX_PANIC_H */
> diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
> new file mode 100644
> index 000000000000..41e32483d7a7
> --- /dev/null
> +++ b/include/linux/panic_notifier.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_PANIC_NOTIFIERS_H
> +#define _LINUX_PANIC_NOTIFIERS_H
> +
> +#include <linux/notifier.h>
> +#include <linux/types.h>
> +
> +extern struct atomic_notifier_head panic_notifier_list;
> +
> +extern bool crash_kexec_post_notifiers;
> +
> +#endif	/* _LINUX_PANIC_NOTIFIERS_H */
> diff --git a/kernel/hung_task.c b/kernel/hung_task.c
> index bb2e3e15c84c..2871076e4d29 100644
> --- a/kernel/hung_task.c
> +++ b/kernel/hung_task.c
> @@ -15,6 +15,7 @@
>  #include <linux/kthread.h>
>  #include <linux/lockdep.h>
>  #include <linux/export.h>
> +#include <linux/panic_notifier.h>
>  #include <linux/sysctl.h>
>  #include <linux/suspend.h>
>  #include <linux/utsname.h>
> diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
> index f099baee3578..4b34a9aa32bc 100644
> --- a/kernel/kexec_core.c
> +++ b/kernel/kexec_core.c
> @@ -26,6 +26,7 @@
>  #include <linux/suspend.h>
>  #include <linux/device.h>
>  #include <linux/freezer.h>
> +#include <linux/panic_notifier.h>
>  #include <linux/pm.h>
>  #include <linux/cpu.h>
>  #include <linux/uaccess.h>
> diff --git a/kernel/panic.c b/kernel/panic.c
> index 332736a72a58..edad89660a2b 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -23,6 +23,7 @@
>  #include <linux/reboot.h>
>  #include <linux/delay.h>
>  #include <linux/kexec.h>
> +#include <linux/panic_notifier.h>
>  #include <linux/sched.h>
>  #include <linux/sysrq.h>
>  #include <linux/init.h>
> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index ce5b4cd6bd18..a58c9c86fa13 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -32,6 +32,8 @@
>  #include <linux/export.h>
>  #include <linux/completion.h>
>  #include <linux/moduleparam.h>
> +#include <linux/panic.h>
> +#include <linux/panic_notifier.h>
>  #include <linux/percpu.h>
>  #include <linux/notifier.h>
>  #include <linux/cpu.h>
> diff --git a/kernel/sysctl.c b/kernel/sysctl.c
> index 3601786ddaeb..e5cf9c4ef5e1 100644
> --- a/kernel/sysctl.c
> +++ b/kernel/sysctl.c
> @@ -27,6 +27,7 @@
>  #include <linux/sysctl.h>
>  #include <linux/bitmap.h>
>  #include <linux/signal.h>
> +#include <linux/panic.h>
>  #include <linux/printk.h>
>  #include <linux/proc_fs.h>
>  #include <linux/security.h>
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 507a30bf26e4..9612a1d8fa13 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -39,6 +39,7 @@
>  #include <linux/slab.h>
>  #include <linux/ctype.h>
>  #include <linux/init.h>
> +#include <linux/panic_notifier.h>
>  #include <linux/poll.h>
>  #include <linux/nmi.h>
>  #include <linux/fs.h>
> -- 
> 2.30.2
> 
