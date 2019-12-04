Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC96112110
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 02:34:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SLx1103tzDqSn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 12:34:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d41;
 helo=mail-io1-xd41.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tmY+JAcw"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SLv2059DzDqRx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 12:32:29 +1100 (AEDT)
Received: by mail-io1-xd41.google.com with SMTP id x1so6135863iop.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2019 17:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TCwJ275CuH71t/vT7lbifqLC+KDIUiUzGT2lgvQtjG0=;
 b=tmY+JAcwPEF4llgL1Y1PDrM7d6jg4KaGWgGX7KggEas/6sOojo1m7P7DviKDJsqtDu
 DDuuarVW5uFuyfTe9nF1q5iiQrPOPitcOKwE9rS7KZ99hhhN54HOLRu1P4aO+LeJX3Xp
 UsbTlaODWCLDcnO5AsLKNXEr9/o2IZ43aRHgkjRNQ4nQMxyRxbCZt2nsIjY0vjfh1Ay2
 XZmwzA0ZbEuw5nIcOReWJjB+FQrHB6ME0JQnXHkD0RkJLnlLsDYzyXCjR+pbFR+K799t
 iN1wwAzFjfSsOaCnU8jM2nO94y5MJmP1YNieySOCBUoh2pMQsPigId39uwfnNty4SAMg
 eknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TCwJ275CuH71t/vT7lbifqLC+KDIUiUzGT2lgvQtjG0=;
 b=ImIm9x4GQzRoDIe9NeXHDTJHubbBounzvP6KSJP0u4dm3tU8NcG3oaEeP31sxZ7TFa
 dR0gnlsh/8Siyr9TImHxnGSCQg9S/l+Jk9OA6HCQF6JTAshYrpEaWZxh6UuYr8T37Wel
 Goe6Ka+g8wqkT9lMhYY3yNahQoSvq4bpFPasqZOMAiq0ACMbSL3QV1L+K7dMNwYWR+ZV
 HT7V8jeb6gISl8PWX3Uq+7oTb1vvQnWRm3m1odD2P4UbUpoZDkJifdfU6+IkgMrp+PGG
 heorqQAL99dvCfJbY+0hhrjUZ8k9LR/72L/Xz57D8bJXPRKjmqNjMqH/6xQOdx7Rihce
 kWzQ==
X-Gm-Message-State: APjAAAXV5b3GOtMlu2AMDNY+pynj7qY+FjEU/CZLqwH/0qhC+fSPSmzU
 SO6OTd/rdH0qaQ6ThJmdv+HEmavP5RhZ3iBoI5k=
X-Google-Smtp-Source: APXvYqwQs/htvlz9OSVsTnG++MaHshXW2UEZ3eXouJkAekAJeW/hSSpcOkBUl3JjdrlBwDC2WURadhiB9B4Ck0/vbow=
X-Received: by 2002:a6b:6b16:: with SMTP id g22mr380415ioc.192.1575423144840; 
 Tue, 03 Dec 2019 17:32:24 -0800 (PST)
MIME-Version: 1.0
References: <20191202030731.26714-1-jniethe5@gmail.com>
In-Reply-To: <20191202030731.26714-1-jniethe5@gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 4 Dec 2019 12:32:13 +1100
Message-ID: <CAOSf1CHT_cVGLkvCwWfYP4Y4K91shdLE5gN227Yhq+tgShYh8Q@mail.gmail.com>
Subject: Re: [PATCH] powerpc/mm: Remove kvm radix prefetch workaround for
 Power9 DD2.2
To: Jordan Niethe <jniethe5@gmail.com>
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
Cc: Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 2, 2019 at 2:08 PM Jordan Niethe <jniethe5@gmail.com> wrote:
>
> Commit a25bd72badfa ("powerpc/mm/radix: Workaround prefetch issue with
> KVM") introduced a number of workarounds as coming out of a guest with
> the mmu enabled would make the cpu would start running in hypervisor
> state with the PID value from the guest. The cpu will then start
> prefetching for the hypervisor with that PID value.
>
> In Power9 DD2.2 the cpu behaviour was modified to fix this. When
> accessing Quadrant 0 in hypervisor mode with LPID != 0 prefetching will
> not be performed. This means that we can get rid of the workarounds for
> Power9 DD2.2 and later revisions.
>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S  |  9 +++++++++
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 18 ++++++++++++------
>  arch/powerpc/mm/book3s64/radix_tlb.c     |  5 +++++
>  3 files changed, 26 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index faebcbb8c4db..6bbc5fbc7ea9 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -1793,6 +1793,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
>         tlbsync
>         ptesync
>
> +       /* We do not need this work around from POWER9 DD2.2 and onwards */
> +       mfspr   r3, SPRN_PVR
> +       srwi    r6, r3, 16
> +       cmpwi   cr0, r6, PVR_POWER9
> +       bne     cr0, 2f
> +       andi.   r3, r3, 0xfff
> +       cmpwi   cr0, r3, 0x202
> +       bge     cr0, 2f

This seems like the sort of thing we'd want to use a CPU_FTR_SECTION()
for. We probably want to have a CPU_FTR for this anyway so we're not
open-coding the PVR check all over the place.

> +
>         /* Radix: Handle the case where the guest used an illegal PID */
>         LOAD_REG_ADDR(r4, mmu_base_pid)
>         lwz     r3, VCPU_GUEST_PID(r9)
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 6ee17d09649c..1f280124994e 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -312,6 +312,7 @@ static void __init radix_init_pgtable(void)
>  {
>         unsigned long rts_field;
>         struct memblock_region *reg;
> +       unsigned int pvr;
>
>         /* We don't support slb for radix */
>         mmu_slb_size = 0;
> @@ -336,24 +337,29 @@ static void __init radix_init_pgtable(void)
>         }
>
>         /* Find out how many PID bits are supported */
> +       pvr = mfspr(SPRN_PVR);
>         if (cpu_has_feature(CPU_FTR_HVMODE)) {
>                 if (!mmu_pid_bits)
>                         mmu_pid_bits = 20;
>  #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>                 /*
> -                * When KVM is possible, we only use the top half of the
> -                * PID space to avoid collisions between host and guest PIDs
> -                * which can cause problems due to prefetch when exiting the
> -                * guest with AIL=3
> +                * Before Power9 DD2.2, when KVM is possible, we only use the
> +                * top half of the PID space to avoid collisions between host
> +                * and guest PIDs which can cause problems due to prefetch when
> +                * exiting the guest with AIL=3
>                  */
> -               mmu_base_pid = 1 << (mmu_pid_bits - 1);
> +               if (PVR_VER(pvr) == PVR_POWER9 && ((0xfff & pvr) < 0x202))
> +                       mmu_base_pid = 1;
> +               else
> +                       mmu_base_pid = 1 << (mmu_pid_bits - 1);
>  #else
>                 mmu_base_pid = 1;
>  #endif
>         } else {
>                 /* The guest uses the bottom half of the PID space */
>                 if (!mmu_pid_bits)
> -                       mmu_pid_bits = 19;
> +                       mmu_pid_bits = (PVR_VER(pvr) == PVR_POWER9 &&
> +                                       ((0xfff & pvr) < 0x202)) ? 19 : 20;
>                 mmu_base_pid = 1;
>         }
>
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index 67af871190c6..cc86d8a88b86 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -1217,10 +1217,15 @@ void radix__flush_tlb_all(void)
>  extern void radix_kvm_prefetch_workaround(struct mm_struct *mm)
>  {
>         unsigned long pid = mm->context.id;
> +       unsigned int pvr;
>
>         if (unlikely(pid == MMU_NO_CONTEXT))
>                 return;
>
> +       pvr = mfspr(SPRN_PVR);
> +       if (PVR_VER(pvr) != PVR_POWER9 || ((0xfff & pvr) >= 0x202))
> +               return;
> +
>         /*
>          * If this context hasn't run on that CPU before and KVM is
>          * around, there's a slim chance that the guest on another
> --
> 2.20.1
>
