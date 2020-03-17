Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDDF187EA3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 11:49:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hVL62MF4zDqfJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 21:49:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=emVIIeWl; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hVJV5MsMzDqNv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 21:48:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48hVJQ1HStz9v9FD;
 Tue, 17 Mar 2020 11:48:22 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=emVIIeWl; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id HJvjTYux4trp; Tue, 17 Mar 2020 11:48:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48hVJP6k7nz9v9Dv;
 Tue, 17 Mar 2020 11:48:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584442101; bh=wLdjv3dVY0RXsHL3a5X6PrKv3uQSB4fvS8ryPLQU0ZE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=emVIIeWlficGn6I1qT7B8GjLh/33KCDgCbn7757pX1msComrs9eTY+dAcBi+kGti8
 6c011tbl3H6Rp0Lr8i4XEikOGw83HGbZVIu+ptP+phCneSmsv02fpTOCGeorgIBBfG
 wtLjesVln1UqCJnGxzQp9y42kXHua0iyyG7VsA14=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CF32C8B787;
 Tue, 17 Mar 2020 11:48:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HxQiT3sW3VxQ; Tue, 17 Mar 2020 11:48:22 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B19818B785;
 Tue, 17 Mar 2020 11:48:14 +0100 (CET)
Subject: Re: [PATCH 10/15] powerpc/watchpoint: Use loop for
 thread_struct->ptrace_bps
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 mikey@neuling.org
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <20200309085806.155823-11-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0eeeac90-b5e3-722b-2d2c-bb95c81d851a@c-s.fr>
Date: Tue, 17 Mar 2020 11:48:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309085806.155823-11-ravi.bangoria@linux.ibm.com>
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
Cc: apopple@linux.ibm.com, peterz@infradead.org, fweisbec@gmail.com,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/03/2020 à 09:58, Ravi Bangoria a écrit :
> ptrace_bps is already an array of size HBP_NUM_MAX. But we use
> hardcoded index 0 while fetching/updating it. Convert such code
> to loop over array.
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/kernel/hw_breakpoint.c |  7 +++++--
>   arch/powerpc/kernel/process.c       |  6 +++++-
>   arch/powerpc/kernel/ptrace.c        | 28 +++++++++++++++++++++-------
>   3 files changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index f4d48f87dcb8..b27aca623267 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -419,10 +419,13 @@ NOKPROBE_SYMBOL(hw_breakpoint_exceptions_notify);
>    */
>   void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
>   {
> +	int i;
>   	struct thread_struct *t = &tsk->thread;
>   
> -	unregister_hw_breakpoint(t->ptrace_bps[0]);
> -	t->ptrace_bps[0] = NULL;
> +	for (i = 0; i < nr_wp_slots(); i++) {
> +		unregister_hw_breakpoint(t->ptrace_bps[i]);
> +		t->ptrace_bps[i] = NULL;
> +	}
>   }
>   
>   void hw_breakpoint_pmu_read(struct perf_event *bp)
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 42ff62ef749c..b9ab740fcacf 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1628,6 +1628,9 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
>   	void (*f)(void);
>   	unsigned long sp = (unsigned long)task_stack_page(p) + THREAD_SIZE;
>   	struct thread_info *ti = task_thread_info(p);
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +	int i;
> +#endif

Could we avoid all those #ifdefs ?

I think if we make p->thread.ptrace_bps[] exist all the time, with a 
size of 0 when CONFIG_HAVE_HW_BREAKPOINT is not set, then we can drop a 
lot of #ifdefs.

>   
>   	klp_init_thread_info(p);
>   
> @@ -1687,7 +1690,8 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
>   	p->thread.ksp_limit = (unsigned long)end_of_stack(p);
>   #endif
>   #ifdef CONFIG_HAVE_HW_BREAKPOINT
> -	p->thread.ptrace_bps[0] = NULL;
> +	for (i = 0; i < nr_wp_slots(); i++)
> +		p->thread.ptrace_bps[i] = NULL;
>   #endif
>   
>   	p->thread.fp_save_area = NULL;
> diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
> index f6d7955fc61e..e2651f86d56f 100644
> --- a/arch/powerpc/kernel/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace.c

You'll have to rebase all this on the series 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=161356 
which is about to go into powerpc-next

> @@ -2829,6 +2829,19 @@ static int set_dac_range(struct task_struct *child,
>   }
>   #endif /* CONFIG_PPC_ADV_DEBUG_DAC_RANGE */
>   
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +static int empty_ptrace_bp(struct thread_struct *thread)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr_wp_slots(); i++) {
> +		if (!thread->ptrace_bps[i])
> +			return i;
> +	}
> +	return -1;
> +}
> +#endif

What does this function do exactly ? I seems to do more than what its 
name suggests.

> +
>   #ifndef CONFIG_PPC_ADV_DEBUG_REGS
>   static int empty_hw_brk(struct thread_struct *thread)
>   {
> @@ -2915,8 +2928,9 @@ static long ppc_set_hwdebug(struct task_struct *child,
>   		len = 1;
>   	else
>   		return -EINVAL;
> -	bp = thread->ptrace_bps[0];
> -	if (bp)
> +
> +	i = empty_ptrace_bp(thread);
> +	if (i < 0)
>   		return -ENOSPC;
>   
>   	/* Create a new breakpoint request if one doesn't exist already */
> @@ -2925,14 +2939,14 @@ static long ppc_set_hwdebug(struct task_struct *child,
>   	attr.bp_len = len;
>   	arch_bp_generic_fields(brk.type, &attr.bp_type);
>   
> -	thread->ptrace_bps[0] = bp = register_user_hw_breakpoint(&attr,
> +	thread->ptrace_bps[i] = bp = register_user_hw_breakpoint(&attr,
>   					       ptrace_triggered, NULL, child);
>   	if (IS_ERR(bp)) {
> -		thread->ptrace_bps[0] = NULL;
> +		thread->ptrace_bps[i] = NULL;
>   		return PTR_ERR(bp);
>   	}
>   
> -	return 1;
> +	return i + 1;
>   #endif /* CONFIG_HAVE_HW_BREAKPOINT */
>   
>   	if (bp_info->addr_mode != PPC_BREAKPOINT_MODE_EXACT)
> @@ -2979,10 +2993,10 @@ static long ppc_del_hwdebug(struct task_struct *child, long data)
>   		return -EINVAL;
>   
>   #ifdef CONFIG_HAVE_HW_BREAKPOINT
> -	bp = thread->ptrace_bps[0];
> +	bp = thread->ptrace_bps[data - 1];

Is data checked somewhere to ensure it is not out of boundaries ? Or are 
we sure it is always within ?

>   	if (bp) {
>   		unregister_hw_breakpoint(bp);
> -		thread->ptrace_bps[0] = NULL;
> +		thread->ptrace_bps[data - 1] = NULL;
>   	} else
>   		ret = -ENOENT;
>   	return ret;
> 


Christophe
