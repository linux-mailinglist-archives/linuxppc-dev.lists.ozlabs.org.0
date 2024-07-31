Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FA49428EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 10:12:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=kO/Pf8Gj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYlDw4lF5z3cnc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 18:12:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=kO/Pf8Gj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYlDC2CtPz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 18:11:22 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a7aa086b077so475462166b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722413476; x=1723018276; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/6o5eOKMgYVhFfCfAX4KZTyTvIb4CeiZ7EcRemTMKgE=;
        b=kO/Pf8GjnhCW/QvBkiUmiptawc+IUaqdT3wAG5G8FypiDKldr8jWBFrUGarmtP2oY+
         F/BVBhdPyh3haNQ02NBxx7uVqCeL+qasz7XZQhEkF6LK0CrvdOddc6r2mVHmoaMr/EbR
         8JyMk34hK+eZW3BID/N5W/6614JcZXZqLC8aDdapZVdyl3k+z+/49ZO5dN15ekehhxVt
         9k+P2Q3KwRN1tdeBjN5buJQ28LnyLlz9vbYVyvtwfOb+xKNgp8NX6VXTo8Ad2MC04xow
         8GC2U96pJJYuvz/rrAFCeRk0PTIxsR5qudCuHgf720jmNU22Vn+1eSqSFe/xcQdVecH7
         MbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722413476; x=1723018276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6o5eOKMgYVhFfCfAX4KZTyTvIb4CeiZ7EcRemTMKgE=;
        b=ffK2ffSopgQVpozVfg6WHgktF6GDmNetSp8wxmrRhnhbxrMHUGtYX/TuhhXKsEhCZ9
         5y1PMkzETeDN9bbaotFwFOP8H6YPT8SrmrgR0Jk7WYBYpiKnrZLUsQcsdTXr9cVM1ob3
         08Ic2C+Iz/uUXf9u42UtrZmx+9SNYhfAl20i2KmpciLpMuHWfQfcU9VyhH7iK+SmFguW
         vGzxQeyfntC/GRaaSf6EQPlC1MeDnF05WlAtWAseaMhybAXpWHN4lCM+jgD0bSawxQtj
         dLOkLEO7WZru6XtjhQATHmxDc20G5pnUWZ1YCNtMfVXvYoWwkEfEBdsg6AvAiJDQfkUj
         wTXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbzF6Pux9BiQ2deRyvJKPh8/MVdldTx2XIavUjetiXdU846PSRJvBd/EJ+bGZMS5qu+atOh2Or4QrT6o/U0nYVY9KHsyBEGcycx43lWA==
X-Gm-Message-State: AOJu0YwM8rboVN6P6hslk0aKJtJAeDzGgjGPRSzWYUZSaYkrfvUH7Yup
	T72tTowOpqlZi0In3OY5tRxq5pIMj9HG1kmQCsqs3pXgpEsfaoAvd5vWz/Goloo=
X-Google-Smtp-Source: AGHT+IF8KtMuBT/lx87J71F/lRrgIXThKYLKm0Q9zh/TR0QeaI4sQXL1DHSiINUT/9ZA+lMCzDpL5Q==
X-Received: by 2002:a17:907:1b26:b0:a7a:af5d:f312 with SMTP id a640c23a62f3a-a7d4011442emr913154866b.46.1722413475678;
        Wed, 31 Jul 2024 01:11:15 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad414e2sm738525466b.127.2024.07.31.01.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 01:11:15 -0700 (PDT)
Date: Wed, 31 Jul 2024 10:11:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v12 58/84] KVM: RISC-V: Use kvm_faultin_pfn() when
 mapping pfns into the guest
Message-ID: <20240731-a5f8928d385945f049e5f96e@orel>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-59-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726235234.228822-59-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 26, 2024 at 04:52:07PM GMT, Sean Christopherson wrote:
> Convert RISC-V to __kvm_faultin_pfn()+kvm_release_faultin_page(), which
> are new APIs to consolidate arch code and provide consistent behavior
> across all KVM architectures.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/riscv/kvm/mmu.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 806f68e70642..f73d6a79a78c 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -601,6 +601,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  	bool logging = (memslot->dirty_bitmap &&
>  			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
>  	unsigned long vma_pagesize, mmu_seq;
> +	struct page *page;
>  
>  	/* We need minimum second+third level pages */
>  	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
> @@ -631,7 +632,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  
>  	/*
>  	 * Read mmu_invalidate_seq so that KVM can detect if the results of
> -	 * vma_lookup() or gfn_to_pfn_prot() become stale priort to acquiring
> +	 * vma_lookup() or __kvm_faultin_pfn() become stale priort to acquiring
                                                            ^ while here
						could fix this typo

>  	 * kvm->mmu_lock.
>  	 *
>  	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
> @@ -647,7 +648,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		return -EFAULT;
>  	}
>  
> -	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writable);
> +	hfn = kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
>  	if (hfn == KVM_PFN_ERR_HWPOISON) {
>  		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
>  				vma_pageshift, current);
> @@ -681,11 +682,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		kvm_err("Failed to map in G-stage\n");
>  
>  out_unlock:
> -	if ((!ret || ret == -EEXIST) && writable)
> -		kvm_set_pfn_dirty(hfn);
> -	else
> -		kvm_release_pfn_clean(hfn);
> -
> +	kvm_release_faultin_page(kvm, page, ret && ret != -EEXIST, writable);
>  	spin_unlock(&kvm->mmu_lock);
>  	return ret;
>  }
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
