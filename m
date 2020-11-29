Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 611BB2C76DD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 01:41:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ck8gb2FcwzF10l
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 11:41:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=a0taiRYT; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ck8cT5TdQzDrK2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 11:38:49 +1100 (AEDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F7B22087C
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 00:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606610326;
 bh=lWw5TMojtbxaKw7VvjVfQ7hiJVxsrMbwUI8CIDgcSZY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=a0taiRYTV5hE9MJz5yrB/E4wLTcpu6J4VhuvST+LEVmSTVkna4nUBPRDjdWVBTVMJ
 fuTCF7fuMt1843shzrtQziGt1E6DLo44ThR0PCOZcAPf5A0Sg0lmg8AcXiordCw4sf
 uiPYBlSLwsDESf2UJUzrOy9iNR4XYHvtnQJKiDYs=
Received: by mail-wm1-f45.google.com with SMTP id w24so12637409wmi.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 16:38:46 -0800 (PST)
X-Gm-Message-State: AOAM530K0ctz6u4B7pR9WxuD+duFDx+4tafGJ8yLKKFlOKzonLua50o/
 Xh0R6yY8g9v0YXxWnBBvrdGXBU6WRzlV9GFBiAYzGA==
X-Google-Smtp-Source: ABdhPJwLyYJ+CcbT9yQXWivpvUJZnHSwXyqV4grvoj5mlZ4cyzQ891rccLTwbv5dzdTuLdNLgiIWQRFmH9pj5WLHwsU=
X-Received: by 2002:a7b:cb41:: with SMTP id v1mr4301883wmj.36.1606610325224;
 Sat, 28 Nov 2020 16:38:45 -0800 (PST)
MIME-Version: 1.0
References: <20201128160141.1003903-1-npiggin@gmail.com>
 <20201128160141.1003903-2-npiggin@gmail.com>
In-Reply-To: <20201128160141.1003903-2-npiggin@gmail.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Sat, 28 Nov 2020 16:38:33 -0800
X-Gmail-Original-Message-ID: <CALCETrVbFm7gZ7G_5DWa6UGYtCzZTQvC_CPRVDZ0Lb-tiMnjSg@mail.gmail.com>
Message-ID: <CALCETrVbFm7gZ7G_5DWa6UGYtCzZTQvC_CPRVDZ0Lb-tiMnjSg@mail.gmail.com>
Subject: Re: [PATCH 1/8] lazy tlb: introduce exit_lazy_tlb
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

On Sat, Nov 28, 2020 at 8:01 AM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> This is called at points where a lazy mm is switched away or made not
> lazy (by its owner switching back).
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/arm/mach-rpc/ecard.c            |  1 +
>  arch/powerpc/mm/book3s64/radix_tlb.c |  1 +
>  fs/exec.c                            |  6 ++++--
>  include/asm-generic/mmu_context.h    | 21 +++++++++++++++++++++
>  kernel/kthread.c                     |  1 +
>  kernel/sched/core.c                  |  2 ++
>  6 files changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-rpc/ecard.c b/arch/arm/mach-rpc/ecard.c
> index 827b50f1c73e..43eb1bfba466 100644
> --- a/arch/arm/mach-rpc/ecard.c
> +++ b/arch/arm/mach-rpc/ecard.c
> @@ -253,6 +253,7 @@ static int ecard_init_mm(void)
>         current->mm = mm;
>         current->active_mm = mm;
>         activate_mm(active_mm, mm);
> +       exit_lazy_tlb(active_mm, current);
>         mmdrop(active_mm);
>         ecard_init_pgtables(mm);
>         return 0;
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index b487b489d4b6..ac3fec03926a 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -661,6 +661,7 @@ static void do_exit_flush_lazy_tlb(void *arg)
>                 mmgrab(&init_mm);
>                 current->active_mm = &init_mm;
>                 switch_mm_irqs_off(mm, &init_mm, current);
> +               exit_lazy_tlb(mm, current);
>                 mmdrop(mm);
>         }
>
> diff --git a/fs/exec.c b/fs/exec.c
> index 547a2390baf5..4b4dea1bb7ba 100644
> --- a/fs/exec.c
> +++ b/fs/exec.c
> @@ -1017,6 +1017,8 @@ static int exec_mmap(struct mm_struct *mm)
>         if (!IS_ENABLED(CONFIG_ARCH_WANT_IRQS_OFF_ACTIVATE_MM))
>                 local_irq_enable();
>         activate_mm(active_mm, mm);
> +       if (!old_mm)
> +               exit_lazy_tlb(active_mm, tsk);
>         if (IS_ENABLED(CONFIG_ARCH_WANT_IRQS_OFF_ACTIVATE_MM))
>                 local_irq_enable();
>         tsk->mm->vmacache_seqnum = 0;
> @@ -1028,9 +1030,9 @@ static int exec_mmap(struct mm_struct *mm)
>                 setmax_mm_hiwater_rss(&tsk->signal->maxrss, old_mm);
>                 mm_update_next_owner(old_mm);
>                 mmput(old_mm);
> -               return 0;
> +       } else {
> +               mmdrop(active_mm);
>         }
> -       mmdrop(active_mm);

This looks like an unrelated change.

>         return 0;
>  }
>
> diff --git a/include/asm-generic/mmu_context.h b/include/asm-generic/mmu_context.h
> index 91727065bacb..4626d0020e65 100644
> --- a/include/asm-generic/mmu_context.h
> +++ b/include/asm-generic/mmu_context.h
> @@ -24,6 +24,27 @@ static inline void enter_lazy_tlb(struct mm_struct *mm,
>  }
>  #endif
>
> +/*
> + * exit_lazy_tlb - Called after switching away from a lazy TLB mode mm.
> + *
> + * mm:  the lazy mm context that was switched
> + * tsk: the task that was switched to (with a non-lazy mm)
> + *
> + * mm may equal tsk->mm.
> + * mm and tsk->mm will not be NULL.
> + *
> + * Note this is not symmetrical to enter_lazy_tlb, this is not
> + * called when tasks switch into the lazy mm, it's called after the
> + * lazy mm becomes non-lazy (either switched to a different mm or the
> + * owner of the mm returns).
> + */
> +#ifndef exit_lazy_tlb
> +static inline void exit_lazy_tlb(struct mm_struct *mm,

Maybe name this parameter prev_lazy_mm?
