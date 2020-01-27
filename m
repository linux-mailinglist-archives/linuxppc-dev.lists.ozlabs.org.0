Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5911614A9A8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2020 19:17:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 485ydZ1qHMzDqDN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 05:17:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 485yRX0JGLzDq5y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 05:08:39 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EDD53AAB8;
 Mon, 27 Jan 2020 18:08:34 +0000 (UTC)
Date: Mon, 27 Jan 2020 19:08:32 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: system call implement the bulk of the logic
 in C fix
Message-ID: <20200127180832.GX4113@kitsune.suse.cz>
References: <20200127141712.96738-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200127141712.96738-1-npiggin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 28, 2020 at 12:17:12AM +1000, Nicholas Piggin wrote:
> This incremental patch fixes several soft-mask debug and unsafe
> smp_processor_id messages due to tracing and false positives in
> "unreconciled" code.
> 
> It also fixes a bug with syscall tracing functions that set registers
> (e.g., PTRACE_SETREG) not setting GPRs properly.
> 
> There was a bug reported with the TM selftests, I haven't been able
> to reproduce that one.
> 
> I can squash this into the main patch and resend the series if it
> helps but the incremental helps to see the bug fixes.

There are some whitespace differences between this and the series I have
applied locally. What does it apply to?

Is there some revision of the patchset I missed?

Thanks

Michal
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/cputime.h | 39 +++++++++++++++++-------------
>  arch/powerpc/kernel/syscall_64.c   | 26 ++++++++++++++------
>  2 files changed, 41 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
> index c43614cffaac..6639a6847cc0 100644
> --- a/arch/powerpc/include/asm/cputime.h
> +++ b/arch/powerpc/include/asm/cputime.h
> @@ -44,6 +44,28 @@ static inline unsigned long cputime_to_usecs(const cputime_t ct)
>  #ifdef CONFIG_PPC64
>  #define get_accounting(tsk)	(&get_paca()->accounting)
>  static inline void arch_vtime_task_switch(struct task_struct *tsk) { }
> +
> +/*
> + * account_cpu_user_entry/exit runs "unreconciled", so can't trace,
> + * can't use use get_paca()
> + */
> +static notrace inline void account_cpu_user_entry(void)
> +{
> +	unsigned long tb = mftb();
> +	struct cpu_accounting_data *acct = &local_paca->accounting;
> +
> +	acct->utime += (tb - acct->starttime_user);
> +	acct->starttime = tb;
> +}
> +static notrace inline void account_cpu_user_exit(void)
> +{
> +	unsigned long tb = mftb();
> +	struct cpu_accounting_data *acct = &local_paca->accounting;
> +
> +	acct->stime += (tb - acct->starttime);
> +	acct->starttime_user = tb;
> +}
> +
>  #else
>  #define get_accounting(tsk)	(&task_thread_info(tsk)->accounting)
>  /*
> @@ -60,23 +82,6 @@ static inline void arch_vtime_task_switch(struct task_struct *prev)
>  }
>  #endif
>  
> -static inline void account_cpu_user_entry(void)
> -{
> -	unsigned long tb = mftb();
> -	struct cpu_accounting_data *acct = get_accounting(current);
> -
> -	acct->utime += (tb - acct->starttime_user);
> -	acct->starttime = tb;
> -}
> -static inline void account_cpu_user_exit(void)
> -{
> -	unsigned long tb = mftb();
> -	struct cpu_accounting_data *acct = get_accounting(current);
> -
> -	acct->stime += (tb - acct->starttime);
> -	acct->starttime_user = tb;
> -}
> -
>  #endif /* __KERNEL__ */
>  #else /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
>  static inline void account_cpu_user_entry(void)
> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
> index 529393a1ff1e..cfe458adde07 100644
> --- a/arch/powerpc/kernel/syscall_64.c
> +++ b/arch/powerpc/kernel/syscall_64.c
> @@ -19,7 +19,8 @@ extern void __noreturn tabort_syscall(void);
>  
>  typedef long (*syscall_fn)(long, long, long, long, long, long);
>  
> -long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
> +/* Has to run notrace because it is entered "unreconciled" */
> +notrace long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
>  			   unsigned long r0, struct pt_regs *regs)
>  {
>  	unsigned long ti_flags;
> @@ -36,7 +37,7 @@ long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
>  #ifdef CONFIG_PPC_SPLPAR
>  	if (IS_ENABLED(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) &&
>  	    firmware_has_feature(FW_FEATURE_SPLPAR)) {
> -		struct lppaca *lp = get_lppaca();
> +		struct lppaca *lp = local_paca->lppaca_ptr;
>  
>  		if (unlikely(local_paca->dtl_ridx != be64_to_cpu(lp->dtl_idx)))
>  			accumulate_stolen_time();
> @@ -71,13 +72,22 @@ long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
>  		 * We use the return value of do_syscall_trace_enter() as the
>  		 * syscall number. If the syscall was rejected for any reason
>  		 * do_syscall_trace_enter() returns an invalid syscall number
> -		 * and the test below against NR_syscalls will fail.
> +		 * and the test against NR_syscalls will fail and the return
> +		 * value to be used is in regs->gpr[3].
>  		 */
>  		r0 = do_syscall_trace_enter(regs);
> -	}
> -
> -	if (unlikely(r0 >= NR_syscalls))
> +		if (unlikely(r0 >= NR_syscalls))
> +			return regs->gpr[3];
> +		r3 = regs->gpr[3];
> +		r4 = regs->gpr[4];
> +		r5 = regs->gpr[5];
> +		r6 = regs->gpr[6];
> +		r7 = regs->gpr[7];
> +		r8 = regs->gpr[8];
> +
> +	} else if (unlikely(r0 >= NR_syscalls)) {
>  		return -ENOSYS;
> +	}
>  
>  	/* May be faster to do array_index_nospec? */
>  	barrier_nospec();
> @@ -139,8 +149,10 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>  		regs->gpr[3] = r3;
>  	}
>  
> -	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE))
> +	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
>  		do_syscall_trace_leave(regs);
> +		ret |= _TIF_RESTOREALL;
> +	}
>  
>  again:
>  	local_irq_disable();
> -- 
> 2.23.0
> 
