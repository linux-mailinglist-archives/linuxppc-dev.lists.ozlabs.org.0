Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 208E8A229F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 19:43:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46K91s2qKmzDrpm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 03:43:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="AqoXS8ih"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46K8zM16GHzDrh7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 03:41:00 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46K8zC2qTyz9vBLv;
 Thu, 29 Aug 2019 19:40:55 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=AqoXS8ih; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lr4j0t6S-BAw; Thu, 29 Aug 2019 19:40:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46K8zC1NlSz9vBLt;
 Thu, 29 Aug 2019 19:40:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567100455; bh=G1cKrIpvDdOaMbhgFSVnyPJvPtIPAoaDARluVHVPBec=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AqoXS8ihJEzrDP/XO3yOowQXrRYw6NYD+CGpMVQ33NoTsEZqyWBTv2krrS+pKKWO1
 3ItqSWg+4FRlZmF4wp6NHv5HyEvZSpxOJZon0nSm5zz38Yf+jYviq6o4ngboeBnkg0
 eCjOOUGQY6LDPmGyQttsMnsha6Eaa9M8IbYwqCTU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E70AA8B8CF;
 Thu, 29 Aug 2019 19:40:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oTlHII4GT2F5; Thu, 29 Aug 2019 19:40:56 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 98BF88B8C1;
 Thu, 29 Aug 2019 19:40:55 +0200 (CEST)
Subject: Re: [PATCH v4 3/4] powerpc/64: make buildable without CONFIG_COMPAT
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
References: <cover.1567072270.git.msuchanek@suse.de>
 <a829dfabed8285161fcdff166d58c7e8f0f6d402.1567072270.git.msuchanek@suse.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <45bdadce-5b44-c941-14f7-240b0be41a7b@c-s.fr>
Date: Thu, 29 Aug 2019 19:40:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a829dfabed8285161fcdff166d58c7e8f0f6d402.1567072270.git.msuchanek@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Nicolai Stange <nstange@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Allison Randal <allison@lohutok.net>, Firoz Khan <firoz.khan@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Christian Brauner <christian@brauner.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/08/2019 à 12:23, Michal Suchanek a écrit :
> There are numerous references to 32bit functions in generic and 64bit
> code so ifdef them out.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
> v2:
> - fix 32bit ifdef condition in signal.c
> - simplify the compat ifdef condition in vdso.c - 64bit is redundant
> - simplify the compat ifdef condition in callchain.c - 64bit is redundant
> v3:
> - use IS_ENABLED and maybe_unused where possible
> - do not ifdef declarations
> - clean up Makefile
> v4:
> - further makefile cleanup
> - simplify is_32bit_task conditions
> - avoid ifdef in condition by using return
> ---
>   arch/powerpc/include/asm/thread_info.h |  4 ++--
>   arch/powerpc/kernel/Makefile           |  7 +++----
>   arch/powerpc/kernel/entry_64.S         |  2 ++
>   arch/powerpc/kernel/signal.c           |  3 +--
>   arch/powerpc/kernel/syscall_64.c       |  6 ++----
>   arch/powerpc/kernel/vdso.c             |  5 ++---
>   arch/powerpc/perf/callchain.c          | 14 ++++++++++----
>   7 files changed, 22 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> index 8e1d0195ac36..c128d8a48ea3 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -144,10 +144,10 @@ static inline bool test_thread_local_flags(unsigned int flags)
>   	return (ti->local_flags & flags) != 0;
>   }
>   
> -#ifdef CONFIG_PPC64
> +#ifdef CONFIG_COMPAT
>   #define is_32bit_task()	(test_thread_flag(TIF_32BIT))
>   #else
> -#define is_32bit_task()	(1)
> +#define is_32bit_task()	(IS_ENABLED(CONFIG_PPC32))
>   #endif
>   
>   #if defined(CONFIG_PPC64)
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 1d646a94d96c..9d8772e863b9 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -44,16 +44,15 @@ CFLAGS_btext.o += -DDISABLE_BRANCH_PROFILING
>   endif
>   
>   obj-y				:= cputable.o ptrace.o syscalls.o \
> -				   irq.o align.o signal_32.o pmc.o vdso.o \
> +				   irq.o align.o signal_$(BITS).o pmc.o vdso.o \
>   				   process.o systbl.o idle.o \
>   				   signal.o sysfs.o cacheinfo.o time.o \
>   				   prom.o traps.o setup-common.o \
>   				   udbg.o misc.o io.o misc_$(BITS).o \
>   				   of_platform.o prom_parse.o
> -obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
> -				   signal_64.o ptrace32.o \
> -				   paca.o nvram_64.o firmware.o \
> +obj-$(CONFIG_PPC64)		+= setup_64.o paca.o nvram_64.o firmware.o \
>   				   syscall_64.o
> +obj-$(CONFIG_COMPAT)		+= sys_ppc32.o ptrace32.o signal_32.o
>   obj-$(CONFIG_VDSO32)		+= vdso32/
>   obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
>   obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
> index 2ec825a85f5b..a2dbf216f607 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -51,8 +51,10 @@
>   SYS_CALL_TABLE:
>   	.tc sys_call_table[TC],sys_call_table
>   
> +#ifdef CONFIG_COMPAT
>   COMPAT_SYS_CALL_TABLE:
>   	.tc compat_sys_call_table[TC],compat_sys_call_table
> +#endif
>   
>   /* This value is used to mark exception frames on the stack. */
>   exception_marker:
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> index 60436432399f..61678cb0e6a1 100644
> --- a/arch/powerpc/kernel/signal.c
> +++ b/arch/powerpc/kernel/signal.c
> @@ -247,7 +247,6 @@ static void do_signal(struct task_struct *tsk)
>   	sigset_t *oldset = sigmask_to_save();
>   	struct ksignal ksig = { .sig = 0 };
>   	int ret;
> -	int is32 = is_32bit_task();
>   
>   	BUG_ON(tsk != current);
>   
> @@ -277,7 +276,7 @@ static void do_signal(struct task_struct *tsk)
>   
>   	rseq_signal_deliver(&ksig, tsk->thread.regs);
>   
> -	if (is32) {
> +	if (is_32bit_task()) {
>           	if (ksig.ka.sa.sa_flags & SA_SIGINFO)
>   			ret = handle_rt_signal32(&ksig, oldset, tsk);
>   		else
> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
> index 98ed970796d5..0d5cbbe54cf1 100644
> --- a/arch/powerpc/kernel/syscall_64.c
> +++ b/arch/powerpc/kernel/syscall_64.c
> @@ -38,7 +38,6 @@ typedef long (*syscall_fn)(long, long, long, long, long, long);
>   
>   long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs)
>   {
> -	unsigned long ti_flags;
>   	syscall_fn f;
>   
>   	BUG_ON(!(regs->msr & MSR_PR));
> @@ -83,8 +82,7 @@ long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
>   	 */
>   	regs->softe = IRQS_ENABLED;
>   
> -	ti_flags = current_thread_info()->flags;
> -	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
> +	if (unlikely(current_thread_info()->flags & _TIF_SYSCALL_DOTRACE)) {
>   		/*
>   		 * We use the return value of do_syscall_trace_enter() as the
>   		 * syscall number. If the syscall was rejected for any reason
> @@ -100,7 +98,7 @@ long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
>   	/* May be faster to do array_index_nospec? */
>   	barrier_nospec();
>   
> -	if (unlikely(ti_flags & _TIF_32BIT)) {
> +	if (unlikely(is_32bit_task())) {
>   		f = (void *)compat_sys_call_table[r0];
>   
>   		r3 &= 0x00000000ffffffffULL;
> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
> index d60598113a9f..6d4a077f74d6 100644
> --- a/arch/powerpc/kernel/vdso.c
> +++ b/arch/powerpc/kernel/vdso.c
> @@ -667,9 +667,7 @@ static void __init vdso_setup_syscall_map(void)
>   {
>   	unsigned int i;
>   	extern unsigned long *sys_call_table;
> -#ifdef CONFIG_PPC64
>   	extern unsigned long *compat_sys_call_table;
> -#endif
>   	extern unsigned long sys_ni_syscall;
>   
>   
> @@ -678,7 +676,8 @@ static void __init vdso_setup_syscall_map(void)
>   		if (sys_call_table[i] != sys_ni_syscall)
>   			vdso_data->syscall_map_64[i >> 5] |=
>   				0x80000000UL >> (i & 0x1f);
> -		if (compat_sys_call_table[i] != sys_ni_syscall)
> +		if (IS_ENABLED(CONFIG_COMPAT) &&
> +		    compat_sys_call_table[i] != sys_ni_syscall)
>   			vdso_data->syscall_map_32[i >> 5] |=
>   				0x80000000UL >> (i & 0x1f);
>   #else /* CONFIG_PPC64 */
> diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
> index c84bbd4298a0..aef8c750d242 100644
> --- a/arch/powerpc/perf/callchain.c
> +++ b/arch/powerpc/perf/callchain.c
> @@ -15,7 +15,7 @@
>   #include <asm/sigcontext.h>
>   #include <asm/ucontext.h>
>   #include <asm/vdso.h>
> -#ifdef CONFIG_PPC64
> +#ifdef CONFIG_COMPAT

Is this ifdef needed at all ? Is it a problem to include it all the time ?

>   #include "../kernel/ppc32.h"
>   #endif
>   #include <asm/pte-walk.h>
> @@ -165,6 +165,7 @@ static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
>   	return read_user_stack_slow(ptr, ret, 8);
>   }
>   
> +__maybe_unused

I don't like that too much. I see this function is almost identical 
between PPC64 and PPC32. It should be possible to have only one, using 
IS_ENABLED(CONFIG_PPC64) inside it to call read_user_stack_slow().
An define a dummy read_user_stack_slow() for PPC32 as already done for 
perf_callchain_user_64().

>   static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
>   {
>   	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> @@ -341,6 +342,7 @@ static inline int valid_user_sp(unsigned long sp, int is_64)
>   
>   #endif /* CONFIG_PPC64 */
>   
> +#if defined(CONFIG_PPC32) || defined(CONFIG_COMPAT)
>   /*
>    * Layout for non-RT signal frames
>    */
> @@ -482,12 +484,16 @@ static void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
>   		sp = next_sp;
>   	}
>   }
> +#endif /* 32bit */
>   
>   void
>   perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
>   {
> -	if (current_is_64bit())
> -		perf_callchain_user_64(entry, regs);
> -	else
> +#if defined(CONFIG_PPC32) || defined(CONFIG_COMPAT)
> +	if (!current_is_64bit()) {
>   		perf_callchain_user_32(entry, regs);
> +		return;
> +	}
> +#endif
> +	perf_callchain_user_64(entry, regs);
>   }
> 

Instead of that it could just be:

	if (current_is_64bit())
		perf_callchain_user_64(entry, regs);
	else
		perf_callchain_user_32(entry, regs);


By adding a dummy perf_callchain_user_32() when needed as already done 
for perf_callchain_user_64()
And by making sure current_is_64bit() returns IS_ENABLED(CONFIG_PPC64) 
when CONFIG_COMPAT is not set, on the same principle as you did for 
is_32bit_task()

And maybe you could think about spliting callchain.c out in a 
callchain_32.c and a callchain_64.c that gets selected by the Makefiles 
based on the same principle as you did for ptrace_32.c etc...

Christophe
