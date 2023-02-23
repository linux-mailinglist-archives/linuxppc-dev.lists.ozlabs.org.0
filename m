Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B887E6A0EDD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 18:44:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN0lD4b4zz3cff
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 04:44:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GnEFv8ZY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3xkx3ywykdbudzv84x19916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GnEFv8ZY;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN0kK2Dtsz2xJ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 04:43:36 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id k17-20020a170902d59100b0019abcf45d75so5150785plh.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 09:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uEW2x7lvcZVgNquM9X5miuc098m/bUXcKiqyROdfsvA=;
        b=GnEFv8ZYEKJq2FLsbqFXmOIsxOoE4EVShbkz1ukBp++CxWl81cjyx0bklp6nXH3I70
         1Dn7JrVCVuKLElNcGdQ1U6YXznFPEHlKh91jnsTXumsHU8puSiTvyoKnzjCVZbQPKnWS
         QXdxzapoB+4T797LXxDe2I0aHK2NBTy6Rw4ivHdiib/6jaI04ABl+Dtf1ReAAkKNrGSl
         8NHnqSqy6ru6z4leh6bzy1EQMm6tgE5IBBFzAYn+bp+FpfKImc6YedR1CZMkmMlPEp36
         c2HXP4yjSNThuM60YRVKyVgt+SlF71LlRuX35DyTXLuiC4Od9uaQKbklKgKjNGtAO3hZ
         O4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uEW2x7lvcZVgNquM9X5miuc098m/bUXcKiqyROdfsvA=;
        b=USUAIR5PAJZcprL7JvW2of6ZCdIwBhn46IGOrp6jhNjTjFh1TxesxtCqEvqs3oiMkX
         PEUDuy80RH3DlEVJqs7O1AYF7mQyHV8u4P4biYHXEd+jqVMzV49FqS7YtJGa5LucmZSy
         Ca7qH7LMBeM8Z/aAlpspkguX73LFW3ZFmViAhrJ6e7SNEPTI5blx1ESm0EPi4x2zAg8U
         ibB19w0/c+/BTvX/guzs4a6j7qCnXvxfv3F0oFNDqXo6bbveqzgD+nnXPo9PG88fLSW+
         x7hVwa41jqOvGv2k46H/XCEEnKiv9YGZn1Q1pMUyFkXfIGohge1yTL/zQCYTL2OW9Aab
         Ffuw==
X-Gm-Message-State: AO0yUKX8XMbictSGWOitwsnRhGB77bO6igmg246rIV7zt7ALB0Pu3V/7
	sc61LbpNPs+LFZXEE5xtnorsYA/XjwY=
X-Google-Smtp-Source: AK7set83+Pnlpt5peCqIhQBtdMvaXZZfXzsbtxsBRoLRt6jnUdFR+O/gyNEyxZMgKJ7oNYHyvpri8MhadHU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:6944:0:b0:4fd:2170:b2da with SMTP id
 w4-20020a656944000000b004fd2170b2damr1506614pgq.0.1677174212817; Thu, 23 Feb
 2023 09:43:32 -0800 (PST)
Date: Thu, 23 Feb 2023 09:43:31 -0800
In-Reply-To: <20230217041230.2417228-6-yuzhao@google.com>
Mime-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-6-yuzhao@google.com>
Message-ID: <Y/elw7CTvVWt0Js6@google.com>
Subject: Re: [PATCH mm-unstable v1 5/5] mm: multi-gen LRU: use mmu_notifier_test_clear_young()
From: Sean Christopherson <seanjc@google.com>
To: Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-mm@google.com, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 16, 2023, Yu Zhao wrote:
> An existing selftest can quickly demonstrate the effectiveness of this
> patch. On a generic workstation equipped with 128 CPUs and 256GB DRAM:

Not my area of maintenance, but a non-existent changelog (for all intents and
purposes) for a change of this size and complexity is not acceptable.

>   $ sudo max_guest_memory_test -c 64 -m 250 -s 250
> 
>   MGLRU      run2
>   ---------------
>   Before    ~600s
>   After      ~50s
>   Off       ~250s
> 
>   kswapd (MGLRU before)
>     100.00%  balance_pgdat
>       100.00%  shrink_node
>         100.00%  shrink_one
>           99.97%  try_to_shrink_lruvec
>             99.06%  evict_folios
>               97.41%  shrink_folio_list
>                 31.33%  folio_referenced
>                   31.06%  rmap_walk_file
>                     30.89%  folio_referenced_one
>                       20.83%  __mmu_notifier_clear_flush_young
>                         20.54%  kvm_mmu_notifier_clear_flush_young
>   =>                      19.34%  _raw_write_lock
> 
>   kswapd (MGLRU after)
>     100.00%  balance_pgdat
>       100.00%  shrink_node
>         100.00%  shrink_one
>           99.97%  try_to_shrink_lruvec
>             99.51%  evict_folios
>               71.70%  shrink_folio_list
>                 7.08%  folio_referenced
>                   6.78%  rmap_walk_file
>                     6.72%  folio_referenced_one
>                       5.60%  lru_gen_look_around
>   =>                    1.53%  __mmu_notifier_test_clear_young

Do you happen to know how much of the improvement is due to batching, and how
much is due to using a walkless walk?

> @@ -5699,6 +5797,9 @@ static ssize_t show_enabled(struct kobject *kobj, struct kobj_attribute *attr, c
>  	if (arch_has_hw_nonleaf_pmd_young() && get_cap(LRU_GEN_NONLEAF_YOUNG))
>  		caps |= BIT(LRU_GEN_NONLEAF_YOUNG);
>  
> +	if (kvm_arch_has_test_clear_young() && get_cap(LRU_GEN_SPTE_WALK))
> +		caps |= BIT(LRU_GEN_SPTE_WALK);

As alluded to in patch 1, unless batching the walks even if KVM does _not_ support
a lockless walk is somehow _worse_ than using the existing mmu_notifier_clear_flush_young(),
I think batching the calls should be conditional only on LRU_GEN_SPTE_WALK.  Or
if we want to avoid batching when there are no mmu_notifier listeners, probe
mmu_notifiers.  But don't call into KVM directly.
