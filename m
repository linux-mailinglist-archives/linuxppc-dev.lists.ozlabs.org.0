Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEED19F439
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 22:39:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46J11k48W4zDqtt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 06:39:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46J0zW2FCnzDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 06:37:10 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 46620AB9D;
 Tue, 27 Aug 2019 20:37:07 +0000 (UTC)
Date: Tue, 27 Aug 2019 22:36:37 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/4] powerpc/64: make buildable without CONFIG_COMPAT
Message-ID: <20190827223623.3244ec9b@naga>
In-Reply-To: <7af66fde886e850fe137d91dfb60cf5869cbe41f.1566936688.git.msuchanek@suse.de>
References: <cover.1566936688.git.msuchanek@suse.de>
 <7af66fde886e850fe137d91dfb60cf5869cbe41f.1566936688.git.msuchanek@suse.de>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: David Hildenbrand <david@redhat.com>, "Dmitry V. Levin" <ldv@altlinux.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Firoz Khan <firoz.khan@linaro.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 27 Aug 2019 22:21:08 +0200
Michal Suchanek <msuchanek@suse.de> wrote:

> There are numerous references to 32bit functions in generic and 64bit
> code so ifdef them out.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  arch/powerpc/include/asm/syscall.h |  2 ++
>  arch/powerpc/kernel/Makefile       | 15 ++++++++++++---
>  arch/powerpc/kernel/entry_64.S     |  2 ++
>  arch/powerpc/kernel/signal.c       |  5 +++--
>  arch/powerpc/kernel/syscall_64.c   |  5 +++--
>  arch/powerpc/kernel/vdso.c         |  4 +++-
>  arch/powerpc/perf/callchain.c      | 14 ++++++++++----
>  7 files changed, 35 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> index 38d62acfdce7..3ed3b75541a1 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -16,7 +16,9 @@
>  
>  /* ftrace syscalls requires exporting the sys_call_table */
>  extern const unsigned long sys_call_table[];
> +#ifdef CONFIG_COMPAT
>  extern const unsigned long compat_sys_call_table[];
> +#endif
>  
>  static inline int syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
>  {
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 1d646a94d96c..b0db365b83d8 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -44,16 +44,25 @@ CFLAGS_btext.o += -DDISABLE_BRANCH_PROFILING
>  endif
>  
>  obj-y				:= cputable.o ptrace.o syscalls.o \
> -				   irq.o align.o signal_32.o pmc.o vdso.o \
> +				   irq.o align.o pmc.o vdso.o \
>  				   process.o systbl.o idle.o \
>  				   signal.o sysfs.o cacheinfo.o time.o \
>  				   prom.o traps.o setup-common.o \
>  				   udbg.o misc.o io.o misc_$(BITS).o \
>  				   of_platform.o prom_parse.o
> -obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
> -				   signal_64.o ptrace32.o \
> +ifndef CONFIG_PPC64
> +obj-y				+= signal_32.o
> +else
> +ifdef CONFIG_COMPAT
> +obj-y				+= signal_32.o
> +endif
> +endif
> +obj-$(CONFIG_PPC64)		+= setup_64.o signal_64.o \
>  				   paca.o nvram_64.o firmware.o \
>  				   syscall_64.o
> +ifdef CONFIG_COMPAT
> +obj-$(CONFIG_PPC64)		+= sys_ppc32.o ptrace32.o
> +endif
>  obj-$(CONFIG_VDSO32)		+= vdso32/
>  obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
>  obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
> index 2ec825a85f5b..a2dbf216f607 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -51,8 +51,10 @@
>  SYS_CALL_TABLE:
>  	.tc sys_call_table[TC],sys_call_table
>  
> +#ifdef CONFIG_COMPAT
>  COMPAT_SYS_CALL_TABLE:
>  	.tc compat_sys_call_table[TC],compat_sys_call_table
> +#endif
>  
>  /* This value is used to mark exception frames on the stack. */
>  exception_marker:
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> index 60436432399f..71f4f1794f86 100644
> --- a/arch/powerpc/kernel/signal.c
> +++ b/arch/powerpc/kernel/signal.c
> @@ -277,14 +277,15 @@ static void do_signal(struct task_struct *tsk)
>  
>  	rseq_signal_deliver(&ksig, tsk->thread.regs);
>  
> +#ifdef CONFIG_COMPAT
This is common code so it needs 
#if !defined(CONFIG_PPC64) || defined(CONFIG_COMPAT)
>  	if (is32) {
>          	if (ksig.ka.sa.sa_flags & SA_SIGINFO)
>  			ret = handle_rt_signal32(&ksig, oldset, tsk);
>  		else
>  			ret = handle_signal32(&ksig, oldset, tsk);
> -	} else {
> +	} else
> +#endif /* CONFIG_COMPAT */
>  		ret = handle_rt_signal64(&ksig, oldset, tsk);
> -	}
>  
>  	tsk->thread.regs->trap = 0;
>  	signal_setup_done(ret, &ksig, test_thread_flag(TIF_SINGLESTEP));
> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
> index 98ed970796d5..3f48262b512d 100644
> --- a/arch/powerpc/kernel/syscall_64.c
> +++ b/arch/powerpc/kernel/syscall_64.c
> @@ -100,6 +100,7 @@ long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
>  	/* May be faster to do array_index_nospec? */
>  	barrier_nospec();
>  
> +#ifdef CONFIG_COMPAT
>  	if (unlikely(ti_flags & _TIF_32BIT)) {
>  		f = (void *)compat_sys_call_table[r0];
>  
> @@ -110,9 +111,9 @@ long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
>  		r7 &= 0x00000000ffffffffULL;
>  		r8 &= 0x00000000ffffffffULL;
>  
> -	} else {
> +	} else
> +#endif /* CONFIG_COMPAT */
>  		f = (void *)sys_call_table[r0];
> -	}
>  
>  	return f(r3, r4, r5, r6, r7, r8);
>  }
> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
> index d60598113a9f..2ab9327e44c4 100644
> --- a/arch/powerpc/kernel/vdso.c
> +++ b/arch/powerpc/kernel/vdso.c
> @@ -667,7 +667,7 @@ static void __init vdso_setup_syscall_map(void)
>  {
>  	unsigned int i;
>  	extern unsigned long *sys_call_table;
> -#ifdef CONFIG_PPC64
> +#if defined(CONFIG_PPC64) && defined(CONFIG_COMPAT)
>  	extern unsigned long *compat_sys_call_table;
>  #endif
>  	extern unsigned long sys_ni_syscall;
> @@ -678,9 +678,11 @@ static void __init vdso_setup_syscall_map(void)
>  		if (sys_call_table[i] != sys_ni_syscall)
>  			vdso_data->syscall_map_64[i >> 5] |=
>  				0x80000000UL >> (i & 0x1f);
> +#ifdef CONFIG_COMPAT
>  		if (compat_sys_call_table[i] != sys_ni_syscall)
>  			vdso_data->syscall_map_32[i >> 5] |=
>  				0x80000000UL >> (i & 0x1f);
> +#endif /* CONFIG_COMPAT */
>  #else /* CONFIG_PPC64 */
>  		if (sys_call_table[i] != sys_ni_syscall)
>  			vdso_data->syscall_map_32[i >> 5] |=
> diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
> index c84bbd4298a0..0a4565820d6c 100644
> --- a/arch/powerpc/perf/callchain.c
> +++ b/arch/powerpc/perf/callchain.c
> @@ -15,7 +15,7 @@
>  #include <asm/sigcontext.h>
>  #include <asm/ucontext.h>
>  #include <asm/vdso.h>
> -#ifdef CONFIG_PPC64
> +#if defined(CONFIG_PPC64) && defined(CONFIG_COMPAT)
>  #include "../kernel/ppc32.h"
>  #endif
>  #include <asm/pte-walk.h>
> @@ -165,6 +165,7 @@ static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
>  	return read_user_stack_slow(ptr, ret, 8);
>  }
>  
> +#ifdef CONFIG_COMPAT
>  static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
>  {
>  	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> @@ -180,6 +181,7 @@ static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
>  
>  	return read_user_stack_slow(ptr, ret, 4);
>  }
> +#endif
>  
>  static inline int valid_user_sp(unsigned long sp, int is_64)
>  {
> @@ -341,6 +343,7 @@ static inline int valid_user_sp(unsigned long sp, int is_64)
>  
>  #endif /* CONFIG_PPC64 */
>  
> +#if !defined(CONFIG_PPC64) || defined(CONFIG_COMPAT)
>  /*
>   * Layout for non-RT signal frames
>   */
> @@ -482,12 +485,15 @@ static void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
>  		sp = next_sp;
>  	}
>  }
> +#endif /* 32bit */
>  
>  void
>  perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
>  {
> -	if (current_is_64bit())
> -		perf_callchain_user_64(entry, regs);
> -	else
> +#if !defined(CONFIG_PPC64) || defined(CONFIG_COMPAT)
> +	if (!current_is_64bit())
>  		perf_callchain_user_32(entry, regs);
> +	else
> +#endif
> +		perf_callchain_user_64(entry, regs);
>  }

