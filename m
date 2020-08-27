Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D2B2546B4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 16:23:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BclLr5HmFzDqdw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 00:23:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=jannh@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=e6F7i1e7; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BclC90nlRzDqdR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 00:16:13 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id w14so6631038ljj.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 07:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=US45omOiVls6z8M2uEdlSDLBnxMw0pLsZXx7H6iAa+E=;
 b=e6F7i1e7uCRbycdWn6MY+mc8EyXK0bF3SfRFHGipkwdUQ7k3vr2T03zttLLOiad2d2
 skRT64vhWrKyTHt5lgT9fHNkbO5DUsisLmNszsUGALJnncb1yDJoI+C6bu9oUbGlw6T+
 umSe8Hg8wBn95ZS7r6FQHoWV8ut13Co7zGXGAHZx5U/c1cCGgFHB5PqBcWVHZHdJ5QXT
 nBzcu4qG4GKGNNPZCeKpJ3UD1mBz4rGr1THv5yarvxgkNoFLIQFIJAcM/ME3Jhpnsz5X
 wgRXTKULn8plDLfBdv+wb2HuGRfvGTTRiREaS2rSqVxisjvwXNU4Ip+0ZH9ONnGizQp4
 xpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=US45omOiVls6z8M2uEdlSDLBnxMw0pLsZXx7H6iAa+E=;
 b=cNH8y0jstmagrJxXrI2pSPika8t+g9r17x6Q7XxHTFLb+rGjiX3JTQe4RdJJXME9U0
 VHyfV5BvWqgUmV0HDYYO/hLgGzie36eVK2Tk15D1pk4vKw4v0QdhQC03s9IBY7TGNb9P
 iDcV3fCYNKbgkZqTqso7SsfTBvQ4nnTmDlxgUitWKUoPkjsFTMKS/pFHmnn3aaTfzKCr
 ND45/YdGouCAjR5OakiP83gbHSuD3n8Iry3bZh3DY/ydZwJ6s9RfZ5b4b6Vq2Y/jRJMa
 U9lbiG/wFwiCN+AhcN5IkaAKl2cOIGyNMR3ghI15MD5V6IfbgHIYsfJltEEkUZjaYeO4
 M+RA==
X-Gm-Message-State: AOAM533ZgxB1GJpuiV889iz0raWLHLGyL2mZldLqPNC6fMMV+DpMManm
 tMg8OPhRJbTeUQ0xCOoOq7DeZOtHEoBCI9cqh7JwIg==
X-Google-Smtp-Source: ABdhPJwwzdS05p3Md8eBJAAbVD2Ab/UK7O9WHzCaXcEnh7sDm7yiIvYkYueu32foh4A/22ryhCL0Jnl3dJg9J7TWDx4=
X-Received: by 2002:a05:651c:543:: with SMTP id
 q3mr9581431ljp.145.1598537767712; 
 Thu, 27 Aug 2020 07:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200827052659.24922-1-cmr@codefail.de>
 <20200827052659.24922-5-cmr@codefail.de>
In-Reply-To: <20200827052659.24922-5-cmr@codefail.de>
From: Jann Horn <jannh@google.com>
Date: Thu, 27 Aug 2020 16:15:41 +0200
Message-ID: <CAG48ez1W7FcDPAnqQ7TpSnKy--vaQm_f5prsZXRxcybzGg0tpg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] powerpc: Introduce temporary mm
To: "Christopher M. Riedl" <cmr@codefail.de>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Kernel Hardening <kernel-hardening@lists.openwall.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 27, 2020 at 7:24 AM Christopher M. Riedl <cmr@codefail.de> wrote:
> x86 supports the notion of a temporary mm which restricts access to
> temporary PTEs to a single CPU. A temporary mm is useful for situations
> where a CPU needs to perform sensitive operations (such as patching a
> STRICT_KERNEL_RWX kernel) requiring temporary mappings without exposing
> said mappings to other CPUs. A side benefit is that other CPU TLBs do
> not need to be flushed when the temporary mm is torn down.
>
> Mappings in the temporary mm can be set in the userspace portion of the
> address-space.
[...]
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
[...]
> @@ -44,6 +45,70 @@ int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
>  }
>
>  #ifdef CONFIG_STRICT_KERNEL_RWX
> +
> +struct temp_mm {
> +       struct mm_struct *temp;
> +       struct mm_struct *prev;
> +       bool is_kernel_thread;
> +       struct arch_hw_breakpoint brk[HBP_NUM_MAX];
> +};
> +
> +static inline void init_temp_mm(struct temp_mm *temp_mm, struct mm_struct *mm)
> +{
> +       temp_mm->temp = mm;
> +       temp_mm->prev = NULL;
> +       temp_mm->is_kernel_thread = false;
> +       memset(&temp_mm->brk, 0, sizeof(temp_mm->brk));
> +}
> +
> +static inline void use_temporary_mm(struct temp_mm *temp_mm)
> +{
> +       lockdep_assert_irqs_disabled();
> +
> +       temp_mm->is_kernel_thread = current->mm == NULL;

(That's a somewhat misleading variable name - kernel threads can have
a non-NULL ->mm, too.)

> +       if (temp_mm->is_kernel_thread)
> +               temp_mm->prev = current->active_mm;
> +       else
> +               temp_mm->prev = current->mm;

Why the branch? Shouldn't current->active_mm work in both cases?


> +       /*
> +        * Hash requires a non-NULL current->mm to allocate a userspace address
> +        * when handling a page fault. Does not appear to hurt in Radix either.
> +        */
> +       current->mm = temp_mm->temp;

This looks dangerous to me. There are various places that attempt to
find all userspace tasks that use a given mm by iterating through all
tasks on the system and comparing each task's ->mm pointer to
current's. Things like current_is_single_threaded() as part of various
security checks, mm_update_next_owner(), zap_threads(), and so on. So
if this is reachable from userspace task context (which I think it
is?), I don't think we're allowed to switch out the ->mm pointer here.


> +       switch_mm_irqs_off(NULL, temp_mm->temp, current);

switch_mm_irqs_off() calls switch_mmu_context(), which in the nohash
implementation increments next->context.active and decrements
prev->context.active if prev is non-NULL, right? So this would
increase temp_mm->temp->context.active...

> +       if (ppc_breakpoint_available()) {
> +               struct arch_hw_breakpoint null_brk = {0};
> +               int i = 0;
> +
> +               for (; i < nr_wp_slots(); ++i) {
> +                       __get_breakpoint(i, &temp_mm->brk[i]);
> +                       if (temp_mm->brk[i].type != 0)
> +                               __set_breakpoint(i, &null_brk);
> +               }
> +       }
> +}
> +
> +static inline void unuse_temporary_mm(struct temp_mm *temp_mm)
> +{
> +       lockdep_assert_irqs_disabled();
> +
> +       if (temp_mm->is_kernel_thread)
> +               current->mm = NULL;
> +       else
> +               current->mm = temp_mm->prev;
> +       switch_mm_irqs_off(NULL, temp_mm->prev, current);

... whereas this would increase temp_mm->prev->context.active. As far
as I can tell, that'll mean that both the original mm and the patching
mm will have their .active counts permanently too high after
use_temporary_mm()+unuse_temporary_mm()?

> +       if (ppc_breakpoint_available()) {
> +               int i = 0;
> +
> +               for (; i < nr_wp_slots(); ++i)
> +                       if (temp_mm->brk[i].type != 0)
> +                               __set_breakpoint(i, &temp_mm->brk[i]);
> +       }
> +}
