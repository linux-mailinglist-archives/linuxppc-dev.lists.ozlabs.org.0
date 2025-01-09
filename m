Return-Path: <linuxppc-dev+bounces-4925-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93069A08061
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 20:01:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTYzB2Kfyz3bNm;
	Fri, 10 Jan 2025 06:01:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736449270;
	cv=none; b=hx0hbyWbxxjVxfO8JDz34uqC5jYY5b3mnEoO9sAwUq/uw/potaSoHzdMCPK+LsDm07BBjnBk8pESwVfTEWxcScB5uRvCjW0XHq28bypnX5qXj6KdDPkrTjnpv9QR0ByrTNQ75UJp53FfQjWtCKPj8Y0VKerLygqqSF4idEBdM6ybGkK1ZExZoMmzhnOMcn4epdgkUPCsjlq6rAs5lHEbKODFaFdBk7EWe9iJ+Zg7KNlacQEUNRgrUKi05KHvQbfoLl4rh+YL9PCEM5BQbtB04G1/fYjft099BhUt89STEggyphqpmxDeFu8vYXfQZVBdHOfjAHdVlfJQFpZVHzC7fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736449270; c=relaxed/relaxed;
	bh=+HfpA5fbP7TfH76TZ3Uj5yQZsZSY/yn7fUa0meeoBcw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XceDugFzkummWC/nI55iwHBI1UMj9WYgx+TJoXXlQiTpjx82fFBYfSaN22Pqq9BZGGUg/2i9fwTdASExiKMW/DZishbNvo76Y7OaibJ2tP2s22pFLpR9twOxqr0ylcbcdg9xhI8X3ut1s3AMIQEWI6u/rB7mZu2kZZ1up0OkwXhmSH6jNp8Brqw0GYErj6TV64zyUpP4oCiIrG0lwaFn/NQ9ZPyJXAudzN1XpwsUaAiAAcuv9nIRfxo3jRnxrf1BZGyC1CDZuCBz9TOxvhQx7I9AIaqpgpho6BlG5U5sBwuRnmAi4xUs+QT3dQv5mqxqrZ9RNsHQ1vSMlHEts9Q/tA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xKx2cjox; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=38hyazwykdg8frnawptbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xKx2cjox;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=38hyazwykdg8frnawptbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTYz92WC9z3c30
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 06:01:09 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2efa74481fdso2280323a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2025 11:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736449267; x=1737054067; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+HfpA5fbP7TfH76TZ3Uj5yQZsZSY/yn7fUa0meeoBcw=;
        b=xKx2cjoxaT7NUUCdU/AnapTaUxGHJcaTIMcw2vnVaqYF380v7GmgB6oUs63d+LHB+5
         /wKprj7/IYiNoR87ixEiRtkH9iznYtbuuigtIkrGskZz8LRY20UK5HCCg1jlsd6yb2Qo
         6f0gWG8LQlGcyZJKyIVxKU8MjGmWa8cHyeDdBMlb8RRXN88aD/DXavv0ZgQ1CaqBSNU2
         D3Vv6SgO6ecl9hMW77YlYlK6OoWwILpahevgT/V3wRRMAm8HKIhJOj3JT7BctDmTlXcH
         8I53SrQg4TVDbSkvd016fmr5pJ2xsh9hd/o8/bhkR9bfsvzPuWpC/qTFLPUkjE1OsETB
         LvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736449267; x=1737054067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HfpA5fbP7TfH76TZ3Uj5yQZsZSY/yn7fUa0meeoBcw=;
        b=s1eiDUSI/SvciZEcX/Tsl6s4pzxIpgog/0NS/kMS+EMAVFrSMROTjuMnEBP3YONpFD
         Ymr0RnVohKx40nVPSIPPB1d9OJszWCYzoWKxsKrcD2/NTyUR/p02ElW+ag1SUkEKLMm5
         TbJkuqaXvtUFj8rS6VIwAQcRWVs6pM+f1HWNJw3jmPRltQAUnd6ZJ/r2KXKDaLajmRmt
         ZFYEJ3XMspH0JxFdPQXz5I73ZdtndzE4lBQ4tMCl916ywvNECyXPoJFfd9pTNdvUcZJ9
         Muajrnqg60jyHwAVZ6l56yqM/gZwJ8kKJG0Gzo4Pj9C1P53bqDP0tIhAjRK4IyXMh8pK
         ki8A==
X-Forwarded-Encrypted: i=1; AJvYcCV2fmN2evd0Qa6Bx7XRG1QIxKWtzfwjuVY0AbipyPquolw527L9VDhKBU7l50AGK28KrnnGofDQfGaoEQo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwrASVJ6dh5i5IVKAcN2+QMHns6pnfKdy5RyxJ7elMB++Vtzy4/
	/JjY0AwkS82Cw7WQzLgr70Pyh5AwpIgIQ5Phgp3NymMo2Bl3Lv9og3ZQeMgby1n/h52h2CXObUi
	Bhw==
X-Google-Smtp-Source: AGHT+IEy+gndLs4E1tSPKEcp4HwCWd68h7GZr39HDdXY/jAdD+K43aJiHJRninKh3yqF1SWahOdjjhE3bz0=
X-Received: from pjbqb12.prod.google.com ([2002:a17:90b:280c:b0:2ef:9239:aab1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fc48:b0:2ef:e0bb:1ef2
 with SMTP id 98e67ed59e1d1-2f548ecc3a7mr10739900a91.19.1736449266829; Thu, 09
 Jan 2025 11:01:06 -0800 (PST)
Date: Thu, 9 Jan 2025 11:01:05 -0800
In-Reply-To: <20250109133817.314401-3-pbonzini@redhat.com>
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
References: <20250109133817.314401-1-pbonzini@redhat.com> <20250109133817.314401-3-pbonzini@redhat.com>
Message-ID: <Z4Ac8Xw4ELtHGAHo@google.com>
Subject: Re: [PATCH 2/5] KVM: e500: use shadow TLB entry as witness for writability
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, oliver.upton@linux.dev, 
	Will Deacon <will@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, linuxppc-dev@lists.ozlabs.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 09, 2025, Paolo Bonzini wrote:
> kvmppc_e500_ref_setup is returning whether the guest TLB entry is writable,
> which is than passed to kvm_release_faultin_page.  This makes little sense

s/than/then

> for two reasons: first, because the function sets up the private data for
> the page and the return value feels like it has been bolted on the side;
> second, because what really matters is whether the _shadow_ TLB entry is
> writable.  If it is not writable, the page can be released as non-dirty.
> Shift from using tlbe_is_writable(gtlbe) to doing the same check on
> the shadow TLB entry.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  arch/powerpc/kvm/e500_mmu_host.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
> index 732335444d68..06e23c625be0 100644
> --- a/arch/powerpc/kvm/e500_mmu_host.c
> +++ b/arch/powerpc/kvm/e500_mmu_host.c
> @@ -242,7 +242,7 @@ static inline int tlbe_is_writable(struct kvm_book3e_206_tlb_entry *tlbe)
>  	return tlbe->mas7_3 & (MAS3_SW|MAS3_UW);
>  }
>  
> -static inline bool kvmppc_e500_ref_setup(struct tlbe_ref *ref,
> +static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
>  					 struct kvm_book3e_206_tlb_entry *gtlbe,
>  					 kvm_pfn_t pfn, unsigned int wimg)
>  {
> @@ -251,8 +251,6 @@ static inline bool kvmppc_e500_ref_setup(struct tlbe_ref *ref,
>  
>  	/* Use guest supplied MAS2_G and MAS2_E */
>  	ref->flags |= (gtlbe->mas2 & MAS2_ATTRIB_MASK) | wimg;
> -
> -	return tlbe_is_writable(gtlbe);
>  }
>  
>  static inline void kvmppc_e500_ref_release(struct tlbe_ref *ref)
> @@ -493,10 +491,11 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
>  			goto out;
>  		}
>  	}
> -	writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
>  
> +	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
>  	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
>  				ref, gvaddr, stlbe);
> +	writable = tlbe_is_writable(stlbe);
>  
>  	/* Clear i-cache for new pages */
>  	kvmppc_mmu_flush_icache(pfn);
> -- 
> 2.47.1
> 

