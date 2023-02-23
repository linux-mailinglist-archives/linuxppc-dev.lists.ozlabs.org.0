Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C506A0ECA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 18:35:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN0YH6qj5z3ccw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 04:35:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fvEBJKNT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3vqp3ywykdas3plyunrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fvEBJKNT;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN0XM5TJWz30hl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 04:34:57 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-536a4eba107so155296797b3.19
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 09:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4HvtD+IMg3vyDXGpZcS0GeFnM8gx7HgAcp0Q62lmtW4=;
        b=fvEBJKNTVgASaDjc9Q0VXXTAIHEeqbLAf/33eHK5qtIch5pppRvvtww/N2ViF2gpdq
         VCAiByWM0l/uNFtxN6iV9hK9EY1uZL/NFtqzu8+sHL4tj8XGIV3zT+VWHXk8cqOcs76m
         313IP1Iu0V/gvoPT+akxf2tRfrtOogk7Aohae/b/Aowp4hWjO+AiMIwooblfNsZUhyiu
         U4MrCMNErtTs5EP+Mg3bg1pBjkaTPY96RUHhEDGrAVECxaGcvdLPa0vW0CY9T5AOps78
         5vvq/sVqQVqjMo9ETUdGV8sO5IdO/RVjAtFU/I637xYFOPP6pd7vWPL3FWBwSWirJEqB
         rtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4HvtD+IMg3vyDXGpZcS0GeFnM8gx7HgAcp0Q62lmtW4=;
        b=r/1lMhnWKienQvYxv8dQ4bWfzS1RlJ0aogUjIKkp3z3G+QI6tCXIHo2OmrmkzKoyFn
         DcbQ27RhNkvFS2MfPQQ+UXc+tjxyZRV6W9AlDUSqgf4w9QxDYYXRRoNCnwXqf81gic/Y
         5lJRuWsFqCjkekcJUnEzcxpBP/9KUA72gVBkkgEb1XRz01itj0QDqm/BzkuBpvWH3S0H
         WCBZs88qLv3cRjQFzDot15i7h4jEKtQ3oR5fKiRvUBCDuQFkywlAK3X/2zyOUrLois59
         OJ5g6sHSbJQhpEoL7G7Vm6raWs1iolwAIWSZ7Fwm2m/t0ByMO4/axMDEDGPdBzK3GwDC
         /CLQ==
X-Gm-Message-State: AO0yUKXh+TpiqERLj30+Nh9dkEjZuqqJPilQCQuKh2P1b40lXfCowGpT
	xt8HiyhjQ/Ldn52AVu0hMz7e8609URU=
X-Google-Smtp-Source: AK7set9qM18OCmCtNF4MtwIz5dX/Eaw8z+NF94C05s0wfxF7vpTFz86wUpljUQl+IzVT57C5nxDYcFR2baU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:524e:0:b0:534:7482:b73 with SMTP id
 g75-20020a81524e000000b0053474820b73mr788300ywb.153.1677173694654; Thu, 23
 Feb 2023 09:34:54 -0800 (PST)
Date: Thu, 23 Feb 2023 09:34:52 -0800
In-Reply-To: <20230217041230.2417228-2-yuzhao@google.com>
Mime-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-2-yuzhao@google.com>
Message-ID: <Y/ejvISuDQyOvrG8@google.com>
Subject: Re: [PATCH mm-unstable v1 1/5] mm/kvm: add mmu_notifier_test_clear_young()
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
> +static bool kvm_mmu_notifier_test_clear_young(struct mmu_notifier *mn, struct mm_struct *mm,
> +					      unsigned long start, unsigned long end,
> +					      unsigned long *bitmap)
> +{
> +	if (kvm_arch_has_test_clear_young())
> +		return kvm_test_clear_young(mmu_notifier_to_kvm(mn), start, end, bitmap);
> +
> +	return false;
> +}
> +
>  static int kvm_mmu_notifier_test_young(struct mmu_notifier *mn,
>  				       struct mm_struct *mm,
>  				       unsigned long address)
> @@ -903,6 +960,7 @@ static const struct mmu_notifier_ops kvm_mmu_notifier_ops = {
>  	.clear_flush_young	= kvm_mmu_notifier_clear_flush_young,
>  	.clear_young		= kvm_mmu_notifier_clear_young,
>  	.test_young		= kvm_mmu_notifier_test_young,
> +	.test_clear_young	= kvm_mmu_notifier_test_clear_young,

I am strongly opposed to adding yet another "young" mmu_notifier hook for this.
I would much rather we extend (and rename) mmu_notifier_clear_young() to take the
bitmap as an optional parameter, and then have KVM hide the details of whether or
not it supports lockless processing of the range/bitmap.

I also think for KVM x86 in particular, this series should first convert to a
lockless walk for aging ranges, and then add the batching.  It might also make
sense to land x86 first and then follow-up with ARM and PPC.  I haven't looked at
the ARM or PPC patches in too much depth, but on the x86 side of things KVM already
has the pieces in place to support a fully lockless walk, i.e. the x86 specific
changes aren't all that contentious, the only thing we need to figure out is what
to do about nested VMs.
