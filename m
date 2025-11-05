Return-Path: <linuxppc-dev+bounces-13778-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A9CC33DD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 04:42:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1WN82dsZz30Qk;
	Wed,  5 Nov 2025 14:42:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762314120;
	cv=none; b=X7YD/Rqs3z+77jAs9lrwwaLEDn7C+29VHuq0AlXWEDImVtH9ekgZErk1IJLWnPUTEdno6LEs3Ha0FHPQiBcSGPSVyv4dAeeySI8pRxWxaAqPMhr2R/yDf5wSUlKNs+prSCBctk7M4Jjak3kv6xjWe6+KUrv+0HZoMCPfrMyJcDd315iAQmJvgUL3M2p6FgevERCS+XV45rCWQlw6FMO3S6SEkTseKoOfxmGlvu+1Hlign4v2hUO+p9pe7X2lWLem+9Ejf1jPQ62acm/w5TivKSSbZ8h8KnFl5LR3PGg0+63glBbtumGKbn7lllfdzcWC9b+dS4L6IJIeSf4KJLITOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762314120; c=relaxed/relaxed;
	bh=9PpcYW9rXkka09Jy11m9xJQRt/n8jdZMdqOTeKYVeZk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=HRKDsbAqww97keqSpa1G4MUZXWBIDTwd/BOR4lKm3gW2pMBWPYGT2ZZyYy1CHSUTmhMaOo1qRY8VGUznbv8aGt9i/tUFsy1B51InPbLpIgNmNauE9t9cMXaDBzv5fZ8tU8PgUii6AJ8yavAfQY2en0FweCILA6Xpt1Y1VC+YrE4ZHUqVpPmS6B30w3w303yLoohZKHC66f5/ijY0ALP+IIKi7RueUPG/W22N8upUvK80aNR4JHJUZL1eE1lVHsNNuYOXpK3QViFE8j9uasphB7u5gO6EsMk8NAlgrnnxYcY3ZtRBQM6AOvEvyXEOXo/GW/ueaYsbYMT2BYCOwszAyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S8he94LA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S8he94LA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1WN73X8pz306d
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 14:41:58 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2952048eb88so68096605ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Nov 2025 19:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762314117; x=1762918917; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9PpcYW9rXkka09Jy11m9xJQRt/n8jdZMdqOTeKYVeZk=;
        b=S8he94LA2WM67XUFmlI9vIhC4Ojr9AjX5srOE+M5jA3XHD5uXS+ZeSzXnEHwhG8PMf
         nQCJc1+WZhf4K9S4x8HDzMm7y3XSPea1Jx6YRSz7FfabwRhtHjnAUb2LGwnZxFKapi3s
         gn30zwLf1kegMB+DZa8c5QKTZ3PLYYVrxtyTgm3IVmhhKceAGKLMGv02oP8ciId2ApFh
         /xsTdb3J+vyj1ZI1j1Y+PX9qOJEeIEaUv+IWF1FBpBn57uSFYQNeWdDPEVDpho3PPAw2
         HvwvYWyK9bzkP49RhoPrezFyooNkZbJOG/G8ejKPOXA0d6WtBkGsgUuLeAV3Q3zFHkLE
         wM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762314117; x=1762918917;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9PpcYW9rXkka09Jy11m9xJQRt/n8jdZMdqOTeKYVeZk=;
        b=ZHf88dwJt/G8FgmbLYgoqeV/lSQcfOEFYAbb+ZfnKINe/I6T1YACsOwUvFc+qXY94h
         v1yXBZ863sE7zzVUW4xXYa65dCE4oFvWsS+9Cnl6KQh9aTvdHn9apVx+djUWVIfx1cyw
         xXdcKPtNFWTRKtjQNyPREj4p9QjavqWCcEH6Bf5XZz0zXhVApUVyPCJI8RnFWMClW49i
         tGSj9784sA38XNYPDOA5LSYSru56IUSITvXsCTRYwIlCrbfkBF1jEQY2gYx647k48IFk
         Qz7N/SqY6otLcPCSdsUEFujihzXHOXxABwwCJPIse9Lrr+OS9kGdoUlTwtoQAySStdUD
         ILLw==
X-Forwarded-Encrypted: i=1; AJvYcCUarRmQ3MVp+X4+SHSNpynviSjJdOalUjEbvrFPzy4vZTeO7IszkB45O1CkwnOWhfMy1p9Ew0Eor26pKhU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzQbt2AJm9MTmmi5r5H6nELS9Dtd6Oy9M5N+qFiFSSEKd1Ezl5b
	A6Gww/Gpyi6eP0ymkmkYf3JiasNx4pA68mzsr8O2Ww/o3Uxh8uJ439wm
X-Gm-Gg: ASbGnctI4TaYAdY7mSVa3pB2LHbbgTk7mz1P4//Fdu7YmJKlcKOrSgw8yrraDmNK4rG
	/xMg9l/jaoWR8YPaxVwC8+jHD20VDkWke8N/7aI5rlWKzKovyc5q0kYeKKs3CBdapzZlgwtQVwW
	kWWqzsxHLXv3Pxa3xjSSsT72l4F85rayG91P1tIwfmlqi1QoYv4BcvMUwTekUwamMqfpS5wPGoc
	ivbjZ5yVJH/1r8PYLw/xj5gIgL2lriTgMvLmBJ0iHRjZXLIg+gnirZgiMcnBLUG1SzDFWjFyCzn
	7LECTGrfVl6+AnJPUdoBm/R7nABQIWwHJCxO/AyIAIoIjMPYzK93AeR+SjDcCooXdPowTDfKx1h
	muboXp6W4zdEqePSnaYpH8ujM9eU3BcHLOnEt0jeSQLYstquZL7Z74s4dawIfmawvCZWLBA==
X-Google-Smtp-Source: AGHT+IHU+u4c4m70sp/Km2qphWV2GETQaiqBJlBLQ9oH8KuDbSRxjLHzXNgoB+GOOUcEEs7QOw2HMQ==
X-Received: by 2002:a17:903:944:b0:295:7f1d:b02d with SMTP id d9443c01a7336-2962ad3340fmr26429125ad.22.1762314116721;
        Tue, 04 Nov 2025 19:41:56 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a61418sm43663725ad.96.2025.11.04.19.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 19:41:56 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 03/12] powerpc/mm: implement arch_flush_lazy_mmu_mode()
In-Reply-To: <20251029100909.3381140-4-kevin.brodsky@arm.com>
Date: Wed, 05 Nov 2025 08:45:06 +0530
Message-ID: <87pl9x41c5.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-4-kevin.brodsky@arm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> Upcoming changes to the lazy_mmu API will cause
> arch_flush_lazy_mmu_mode() to be called when leaving a nested
> lazy_mmu section.
>
> Move the relevant logic from arch_leave_lazy_mmu_mode() to
> arch_flush_lazy_mmu_mode() and have the former call the latter.
>
> Note: the additional this_cpu_ptr() on the
> arch_leave_lazy_mmu_mode() path will be removed in a subsequent
> patch.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> index 146287d9580f..7704dbe8e88d 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> @@ -41,6 +41,16 @@ static inline void arch_enter_lazy_mmu_mode(void)
>  	batch->active = 1;
>  }
>  
> +static inline void arch_flush_lazy_mmu_mode(void)
> +{
> +	struct ppc64_tlb_batch *batch;
> +
> +	batch = this_cpu_ptr(&ppc64_tlb_batch);
> +
> +	if (batch->index)
> +		__flush_tlb_pending(batch);
> +}
> +

This looks a bit scary since arch_flush_lazy_mmu_mode() is getting
called from several of the places in later patches(). 

Although I think arch_flush_lazy_mmu_mode() will only always be called
in nested lazy mmu case right?

Do you think we can add a VM_BUG_ON(radix_enabled()); in above to make
sure the above never gets called in radix_enabled() case. 

I am still going over the patch series, but while reviewing this I
wanted to take your opinion.

Ohh wait.. There is no way of knowing the return value from
arch_enter_lazy_mmu_mode().. I think you might need a similar check to
return from arch_flush_lazy_mmu_mode() too, if radix_enabled() is true.


-ritesh


>  static inline void arch_leave_lazy_mmu_mode(void)
>  {
>  	struct ppc64_tlb_batch *batch;
> @@ -49,14 +59,11 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  		return;
>  	batch = this_cpu_ptr(&ppc64_tlb_batch);
>  
> -	if (batch->index)
> -		__flush_tlb_pending(batch);
> +	arch_flush_lazy_mmu_mode();
>  	batch->active = 0;
>  	preempt_enable();
>  }
>  
> -#define arch_flush_lazy_mmu_mode()      do {} while (0)
> -
>  extern void hash__tlbiel_all(unsigned int action);
>  
>  extern void flush_hash_page(unsigned long vpn, real_pte_t pte, int psize,
> -- 
> 2.47.0

