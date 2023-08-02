Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCA776DAE4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 00:45:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=c6UTu50E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGRrj5Knvz3c7s
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 08:45:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=c6UTu50E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3utzkzaykdgmtfbokdhpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGRqp3Bjkz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 08:44:37 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-563ab574cb5so201405a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Aug 2023 15:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691016274; x=1691621074;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xMuR5EiinHFoNrMaaPJwbYiKuZcp1klr2wXsm/Nte/E=;
        b=c6UTu50EZKn5y0gAF3wjm25qcQfqapqE1Vo3sJC2wM4S4HmvbaZAynRqldlmf8pDWU
         BgAyh0sDqGRLSW8FC67Z1WxaahxEuuE1BmtmxJ7QhFeRGRxen1NPU1Rc97gO/7CXtcIj
         IUuFQPaqiaGsc2B8s1htZ1dOTqCUzwxpQtrbE4wlzd1/CUGSDgHBbc/Rbwyq8GRsynGK
         huoKIVHd3th86h9P6u6gyMUPegT67HL0kGH5afaykWjZn5w3Rxz1hHQouXPwBu5f5GHH
         J7bRAhjFMlcl9yd/Lt9jiaWe7GDaG3WIjw/N2WeFU+oOLAomLvoIwTjL1zpw8qb2ecj0
         YfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691016274; x=1691621074;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMuR5EiinHFoNrMaaPJwbYiKuZcp1klr2wXsm/Nte/E=;
        b=Zl6y7KKG2bMjr4Hsy548bYcdqUIWt8xueCdGj+Kq5eKRy1GJw8Fj+LWz/qOyV75oyi
         pMKuIkwLao5YbYcV00EUY2ZUTI6HIorBqOgw5/xioRyutju3eBXZMsv4g8PcyuI+qoMa
         KO7fwwIWMbhWdcg9kI5M3b0nk2r/JvvGCmhWkMZmHLrJkhQ5qNUmvj/j/Oy5DsTfY2Ou
         PPMuXIt4lfCzj8X8Gsr4r5dJ4E1Ci6Z2TPCu1tUbHu/VXgExzt3tYbgDXogBFqxBfkg5
         U6+XqSdsQLKhqZ+oH+3YQWUfdcDbvjYWAVDCpjjrmk8WthicBuVfPOmNAoWyKJXpWYP+
         CXiA==
X-Gm-Message-State: ABy/qLbuxATwX3O7Hf0hqvakndrautV2p4P/9EACrw5cl4g70IvYWH5N
	0PYiqFjSOpuEWNI61bD3ZMSr+vpmq2Y=
X-Google-Smtp-Source: APBJJlGjna/BNEZIOqnpmIKb0vhY4kEqii1Zq8G5DClZNdG/CKfPd9E2Bwh3hwwA2v3lEo6gD2nUj0zAlWw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:1d1:b0:1ac:3f51:fa64 with SMTP id
 e17-20020a17090301d100b001ac3f51fa64mr99044plh.13.1691016274443; Wed, 02 Aug
 2023 15:44:34 -0700 (PDT)
Date: Wed, 2 Aug 2023 15:44:32 -0700
In-Reply-To: <20230608032425.59796-4-npiggin@gmail.com>
Mime-Version: 1.0
References: <20230608032425.59796-1-npiggin@gmail.com> <20230608032425.59796-4-npiggin@gmail.com>
Message-ID: <ZMrcUKBldWBCQ9R2@google.com>
Subject: Re: [PATCH v3 3/6] KVM: PPC: selftests: add support for powerpc
From: Sean Christopherson <seanjc@google.com>
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 08, 2023, Nicholas Piggin wrote:
> diff --git a/tools/testing/selftests/kvm/lib/powerpc/ucall.c b/tools/testing/selftests/kvm/lib/powerpc/ucall.c
> new file mode 100644
> index 000000000000..ce0ddde45fef
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/lib/powerpc/ucall.c
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ucall support. A ucall is a "hypercall to host userspace".
> + */
> +#include "kvm_util.h"
> +#include "hcall.h"
> +
> +void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
> +{
> +}
> +
> +void ucall_arch_do_ucall(vm_vaddr_t uc)
> +{
> +	hcall2(H_UCALL, UCALL_R4_UCALL, (uintptr_t)(uc));
> +}

FYI, the ucall stuff will silently conflict with treewide (where KVM selftests is
the treechanges that I've queued[*].  It probably makes sense for the initial PPC
support to go through the KVM tree anyways, so I'd be more than happy to grab this
series via kvm-x86/selftests if you're willing to do the code changes (should be
minor, knock wood).  Alternatively, the immutable tag I'm planning on creating
could be merged into the PPC tree, but that seems like overkill.

Either way, please Cc me on the next version (assuming there is a next version),
if only so that I can give you an early heads up if/when the next treewide change
alongs ;-)

[*] https://lore.kernel.org/all/169101267140.1755771.17089576255751273053.b4-ty@google.com
