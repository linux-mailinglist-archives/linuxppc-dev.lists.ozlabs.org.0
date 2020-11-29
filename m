Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA902C76DC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 01:38:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ck8cK2BG7zDqDB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 11:38:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=grkjgTt9; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ck8Yv4HxKzF0Qh
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 11:36:35 +1100 (AEDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D72A208CA
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 00:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606610190;
 bh=mOXS/GH3UaFSuy+jtY/EBw5HQ/wdrNhDC08bkHMO8fA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=grkjgTt90qgkD7QxDR7tOEkcCif1VM3mCZDrJMoXgvteKpPgcjgBsB3iSk/R79M/X
 MnKmgVohjmSgVqj+R8YwybSQyt/uEXMVOzTpN2gybX6RHd1Ak/nZXaBALve+Y7BOEB
 IPKG9b72zuMFZeQfTHVVONUQKxYU4fn0TErUfPEo=
Received: by mail-wr1-f46.google.com with SMTP id z7so9978874wrn.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 16:36:30 -0800 (PST)
X-Gm-Message-State: AOAM531TMEqO9fRt5HiBuicA15283fsi63ZCoDbQSdKbAyGsqyzwNhHC
 pFKlSJVX58Id0jRrHDcxPTt7PiIn+ZuQbGg3vzFysw==
X-Google-Smtp-Source: ABdhPJw8X06KdtkQ9qbb12mAMYxaRda5IFDNz5ooMIoWy5ii8bD6jyRgnZB6e2s1MohEpOC4s4mq8S0jFjI2Y2DZhHo=
X-Received: by 2002:adf:f0c2:: with SMTP id x2mr19588466wro.184.1606610189036; 
 Sat, 28 Nov 2020 16:36:29 -0800 (PST)
MIME-Version: 1.0
References: <20201128160141.1003903-1-npiggin@gmail.com>
 <20201128160141.1003903-6-npiggin@gmail.com>
In-Reply-To: <20201128160141.1003903-6-npiggin@gmail.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Sat, 28 Nov 2020 16:36:18 -0800
X-Gmail-Original-Message-ID: <CALCETrWz3hqptsmTHAu1Qb=E8FPhYRVfcO1nhTVHwOpTNq6w1w@mail.gmail.com>
Message-ID: <CALCETrWz3hqptsmTHAu1Qb=E8FPhYRVfcO1nhTVHwOpTNq6w1w@mail.gmail.com>
Subject: Re: [PATCH 5/8] lazy tlb: allow lazy tlb mm switching to be
 configurable
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 28, 2020 at 8:02 AM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> NOMMU systems could easily go without this and save a bit of code
> and the refcount atomics, because their mm switch is a no-op. I
> haven't flipped them over because haven't audited all arch code to
> convert over to using the _lazy_tlb refcounting.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/Kconfig             | 11 +++++++
>  include/linux/sched/mm.h | 13 ++++++--
>  kernel/sched/core.c      | 68 +++++++++++++++++++++++++++++-----------
>  kernel/sched/sched.h     |  4 ++-
>  4 files changed, 75 insertions(+), 21 deletions(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 56b6ccc0e32d..596bf589d74b 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -430,6 +430,17 @@ config ARCH_WANT_IRQS_OFF_ACTIVATE_MM
>           irqs disabled over activate_mm. Architectures that do IPI based TLB
>           shootdowns should enable this.
>
> +# Should make this depend on MMU, because there is little use for lazy mm switching
> +# with NOMMU. Must audit NOMMU architecture code for lazy mm refcounting first.
> +config MMU_LAZY_TLB
> +       def_bool y
> +       help
> +         Enable "lazy TLB" mmu context switching for kernel threads.
> +
> +config MMU_LAZY_TLB_REFCOUNT
> +       def_bool y
> +       depends on MMU_LAZY_TLB
> +

This could use some documentation as to what "no" means.

>  config ARCH_HAVE_NMI_SAFE_CMPXCHG
>         bool
>
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index 7157c0f6fef8..bd0f27402d4b 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -51,12 +51,21 @@ static inline void mmdrop(struct mm_struct *mm)
>  /* Helpers for lazy TLB mm refcounting */
>  static inline void mmgrab_lazy_tlb(struct mm_struct *mm)
>  {
> -       mmgrab(mm);
> +       if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT))
> +               mmgrab(mm);
>  }
>
>  static inline void mmdrop_lazy_tlb(struct mm_struct *mm)
>  {
> -       mmdrop(mm);
> +       if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT)) {
> +               mmdrop(mm);
> +       } else {
> +               /*
> +                * mmdrop_lazy_tlb must provide a full memory barrier, see the
> +                * membarrier comment finish_task_switch.

"membarrier comment in finish_task_switch()", perhaps?

> +                */
> +               smp_mb();
> +       }
>  }
>
>  /**
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index e372b613d514..3b79c6cc3a37 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3579,7 +3579,7 @@ static struct rq *finish_task_switch(struct task_struct *prev)
>         __releases(rq->lock)
>  {
>         struct rq *rq = this_rq();
> -       struct mm_struct *mm = rq->prev_mm;
> +       struct mm_struct *mm = NULL;
>         long prev_state;
>
>         /*
> @@ -3598,7 +3598,10 @@ static struct rq *finish_task_switch(struct task_struct *prev)
>                       current->comm, current->pid, preempt_count()))
>                 preempt_count_set(FORK_PREEMPT_COUNT);
>
> -       rq->prev_mm = NULL;
> +#ifdef CONFIG_MMU_LAZY_TLB_REFCOUNT
> +       mm = rq->prev_lazy_mm;
> +       rq->prev_lazy_mm = NULL;
> +#endif
>
>         /*
>          * A task struct has one reference for the use as "current".
> @@ -3630,6 +3633,8 @@ static struct rq *finish_task_switch(struct task_struct *prev)
>          * rq->curr, before returning to userspace, for
>          * {PRIVATE,GLOBAL}_EXPEDITED. This is implicitly provided by
>          * mmdrop_lazy_tlb().
> +        *
> +        * This same issue applies to other places that mmdrop_lazy_tlb().
>          */
>         if (mm)
>                 mmdrop_lazy_tlb(mm);
> @@ -3719,22 +3724,10 @@ asmlinkage __visible void schedule_tail(struct task_struct *prev)
>         calculate_sigpending();
>  }
>
> -/*
> - * context_switch - switch to the new MM and the new thread's register state.
> - */
> -static __always_inline struct rq *
> -context_switch(struct rq *rq, struct task_struct *prev,
> -              struct task_struct *next, struct rq_flags *rf)
> +static __always_inline void
> +context_switch_mm(struct rq *rq, struct task_struct *prev,
> +              struct task_struct *next)
>  {
> -       prepare_task_switch(rq, prev, next);
> -
> -       /*
> -        * For paravirt, this is coupled with an exit in switch_to to
> -        * combine the page table reload and the switch backend into
> -        * one hypercall.
> -        */
> -       arch_start_context_switch(prev);
> -
>         /*
>          * kernel -> kernel   lazy + transfer active
>          *   user -> kernel   lazy + mmgrab_lazy_tlb() active
> @@ -3765,11 +3758,50 @@ context_switch(struct rq *rq, struct task_struct *prev,
>                 if (!prev->mm) {                        // from kernel
>                         exit_lazy_tlb(prev->active_mm, next);
>
> +#ifdef CONFIG_MMU_LAZY_TLB_REFCOUNT
>                         /* will mmdrop_lazy_tlb() in finish_task_switch(). */
> -                       rq->prev_mm = prev->active_mm;
> +                       rq->prev_lazy_mm = prev->active_mm;
>                         prev->active_mm = NULL;
> +#else
> +                       /* See membarrier comment in finish_task_switch(). */
> +                       smp_mb();
> +#endif
>                 }
>         }
> +}
> +

Comment here describing what this does, please.


> +static __always_inline void
> +context_switch_mm_nolazy(struct rq *rq, struct task_struct *prev,
> +              struct task_struct *next)
> +{
> +       if (!next->mm)
> +               next->active_mm = &init_mm;
> +       membarrier_switch_mm(rq, prev->active_mm, next->active_mm);
> +       switch_mm_irqs_off(prev->active_mm, next->active_mm, next);
> +       if (!prev->mm)
> +               prev->active_mm = NULL;
> +}
> +
> +/*
> + * context_switch - switch to the new MM and the new thread's register state.
> + */
> +static __always_inline struct rq *
> +context_switch(struct rq *rq, struct task_struct *prev,
> +              struct task_struct *next, struct rq_flags *rf)
> +{
> +       prepare_task_switch(rq, prev, next);
> +
> +       /*
> +        * For paravirt, this is coupled with an exit in switch_to to
> +        * combine the page table reload and the switch backend into
> +        * one hypercall.
> +        */
> +       arch_start_context_switch(prev);
> +
> +       if (IS_ENABLED(CONFIG_MMU_LAZY_TLB))
> +               context_switch_mm(rq, prev, next);
> +       else
> +               context_switch_mm_nolazy(rq, prev, next);
>
>         rq->clock_update_flags &= ~(RQCF_ACT_SKIP|RQCF_REQ_SKIP);
>
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index df80bfcea92e..3b72aec5a2f2 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -950,7 +950,9 @@ struct rq {
>         struct task_struct      *idle;
>         struct task_struct      *stop;
>         unsigned long           next_balance;
> -       struct mm_struct        *prev_mm;
> +#ifdef CONFIG_MMU_LAZY_TLB_REFCOUNT
> +       struct mm_struct        *prev_lazy_mm;
> +#endif
>
>         unsigned int            clock_update_flags;
>         u64                     clock;
> --
> 2.23.0
>
