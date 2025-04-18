Return-Path: <linuxppc-dev+bounces-7800-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FE5A93C7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 20:03:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfN0r0Zlgz3c4y;
	Sat, 19 Apr 2025 04:03:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744999404;
	cv=none; b=f0kgf4NdVtUUKcKf2Zs4DR9FIundLIBM6jJ6FBdJPuunJkg3Cx0db30zGmxWYW/cPcF+QH6SUkWa53Jax6wOOPXANDZrtdsAbzJbKL2MOojnRBxUwhqsuikNwo29wU+9KuYnR0l5JKKvrHIl7qKeCV4TeyxS119UlHrEvkB/Igw/rKZnXwH+HLqhh5Pzbd5CFAUGZ27xS6NMdfErYdhlB34p3mEYSrQ8RIpIALaY0Eow3vxEGXf9MorAmZGPgBJXgN3D3eiPdtjntvH/cnQekHRsbk3DTBPnjXGvHuwgcbv+Brdrw7xUm5gKOgb0/40ICXt70KJckDTiNsN2VGi12w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744999404; c=relaxed/relaxed;
	bh=rqJHg5UYMXwn+mNlrL5oxyZCVbhJU0UNvh0766Pzt3w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nFnaoI6+hsO0ka/4mFO2yn/0lqmYd+l5Xg7FrhHx6EJtEdmfWK6gXnrymU/at3GF/cDI8ptboqGnY5n8Z9e3d3qIBZ/qsuKqxk10k2UtTKaOtAqPoG88v3jU+g0/D/qRnUkvf6YycVzJXpHqmL52Odo//rJnzHJr8o8YP1ZqPojKvq+GYniHM51SziVBCH5ZVbhLSvRr6ALjlCjL0QAsnI/drpD0gFePk7WSN1xr0O+O4a54eoAec2ReztgrZkLbSY180yWiIwFdeMeGtTVSu0FGK269WmaxClhokM8Hk/LG62dtsA3ggwaNwSnz8urWV2D6ju0lmLJKLwQWBSJ+7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xPmtDd+p; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=355mcaaykdgaqc8lhaemmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xPmtDd+p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=355mcaaykdgaqc8lhaemmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfN0p30gpz3byZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 04:03:21 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-30870e7e4fcso1464366a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 11:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744999400; x=1745604200; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rqJHg5UYMXwn+mNlrL5oxyZCVbhJU0UNvh0766Pzt3w=;
        b=xPmtDd+p9cuXqigMC3hCSdeq5CSM5owVcC47m74/AcHp2IMKVM4ChrIIoWYjRdRHFk
         Bvxgd473amUP0ZPIV5pjhPU9Akb02oh5e9vYVBTM6niosMSQiWTAqgWHMPqNs5MClTWv
         BbNkNYZBFxKItUvZDpXZhdX7xqnAu51+snlk4qHxOvlkyKndMVglvZYxqNYMdr/nSlBs
         BjAcxsPZGxRxcK3RE6qTkXUZfhVw5cOamMINmBnfgFBWEiMkm3nb2NH1Ys6Cx4YvHu1U
         Cc6juJFbIHyHIbJwnw1QSQNFUsB2AGTdrSsAKmx9mkbi4N1YkMXMK2X2ylNLwBW/kKKH
         9egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744999400; x=1745604200;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqJHg5UYMXwn+mNlrL5oxyZCVbhJU0UNvh0766Pzt3w=;
        b=ih9QibqRGu99vkoQjxudebFXB4RJHXjfpmiuZUbq9EOLadUE6KXkZMcssQdNR38Hxn
         bgS3uB7jrW/20QXnniHGo2NufAamoL5C+K+Pxj6VVnMRdU2VNzTGhDblV2ul6Z10foXG
         +sw4cImUnp42ucGlz3FOzX6/GW7PHxq71GuRyTLhShQBqqSm518Chmz+P9X3Zfal8fdh
         S3iH08VNp0V0dbDkcK3N2xeSTzi9UNYfQrlYWp6zzR085g/UKzpvFXG+j0z1CIw/B2/H
         +LxA7MKFuijiALSSghYZLwqKIfmZpQVz4uEHVMmiVgYUepjDUOgTD0DhrPFIbsEC23C5
         utfw==
X-Forwarded-Encrypted: i=1; AJvYcCWgbHN23mOgm+xEbZC1WSs7fE418btsoHw0efeITQJQWb1OS6MycdLpSF4rQqHZmcNujUli6OkqWXW3oio=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxFcjSCcBFFLkYN+VQPw7C7hc08bMFCMn6l+ZnljbUBBlVyld1J
	LPs0B1Ya+qCY1ChG1uvVSNZZp3XyolqvRiR7/JKhWhyxRRGzdHU/KeyXlamWixdaRYDL7sdX8l+
	f2g==
X-Google-Smtp-Source: AGHT+IFCmvZ0T+9eNap/pJTWsl4JOWWblp3uZelMKEtnIjAjt7ekoYrCZmpLXyNDhFs3e4WXHrwgxFD2ZsI=
X-Received: from pjbsn15.prod.google.com ([2002:a17:90b:2e8f:b0:2fa:b84:b308])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e18f:b0:2ee:c30f:33c9
 with SMTP id 98e67ed59e1d1-3087c36106amr5592365a91.14.1744999399596; Fri, 18
 Apr 2025 11:03:19 -0700 (PDT)
Date: Fri, 18 Apr 2025 11:03:18 -0700
In-Reply-To: <20250418171609.231588-1-pbonzini@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20250418171609.231588-1-pbonzini@redhat.com>
Message-ID: <aAKT5mLHVV7rz830@google.com>
Subject: Re: [PATCH] KVM: arm64, x86: make kvm_arch_has_irq_bypass() inline
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 18, 2025, Paolo Bonzini wrote:
> kvm_arch_has_irq_bypass() is a small function and even though it does
> not appear in any *really* hot paths, it's also not entirely rare.
> Make it inline---it also works out nicely in preparation for using it in
> kvm-intel.ko and kvm-amd.ko, since the function is not currently exported.
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  arch/arm64/include/asm/kvm_host.h   | 5 +++++
>  arch/arm64/kvm/arm.c                | 5 -----
>  arch/powerpc/include/asm/kvm_host.h | 2 ++
>  arch/x86/include/asm/kvm_host.h     | 6 ++++++
>  arch/x86/kvm/x86.c                  | 5 -----
>  include/linux/kvm_host.h            | 1 -
>  6 files changed, 13 insertions(+), 11 deletions(-)

...

> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 2d139c807577..6f761b77b813 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -907,4 +907,6 @@ static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
>  static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
>  static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>  
> +bool kvm_arch_has_irq_bypass(void);

...

> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 291d49b9bf05..82f044e4b3f5 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2383,7 +2383,6 @@ struct kvm_vcpu *kvm_get_running_vcpu(void);
>  struct kvm_vcpu * __percpu *kvm_get_running_vcpus(void);
>  
>  #if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
> -bool kvm_arch_has_irq_bypass(void);

Moving the declaration to PPC is unnecessary, and IMO undesirable.  It's perfectly
legal to have a non-static declaration follow a "static inline", and asm/kvm_host.h
is included by linux/kvm_host.h, i.e. the per-arch "static inline" is guaranteed
to be processed first.

And KVM already have multiple instances of this, e.g. kvm_arch_vcpu_blocking().
If only for consistency, I vote to keep the common declaration.

>  int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *,
>  			   struct irq_bypass_producer *);
>  void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *,
> -- 
> 2.43.5
> 

