Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6533AE1D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 05:19:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7ZWz6gBWz306w
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 13:19:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=NRC/fzCR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=NRC/fzCR; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7ZWX377vz2xb2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 13:19:18 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 pf4-20020a17090b1d84b029016f6699c3f2so4370120pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 20:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=TIejsIF9hmrt8dkbegPQKYcgq6Tdf3AVNugwUeH1ttQ=;
 b=NRC/fzCRfpjQp1qI+nqPJKAkvXcS+xHwPFERHYZ096qATPcMT29Sn7sNuLC9v0ur/D
 ZI91wtT5jN8Ft7utW/iL5llOGsIPylBKIJ4EfW9mYaDLnZxt9Smi4k+J4SzrVrVNcgOR
 1b0AqLX5XE4NmtXOMKPzeLHR8VxO+CH+5QLmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=TIejsIF9hmrt8dkbegPQKYcgq6Tdf3AVNugwUeH1ttQ=;
 b=XL7q1r9NgiaEklEe30+1IJCRkefoXlDUuNjOP5Oj8jgZug+P/noiSv/pA1SBZOl6p0
 LhYBlfmMKj/4ke7CvXJK3Knhfd2rN2AjLegw2ietN2R2JLmGbpApq79Y3pILVbDzK1gI
 QxjU3tL7bQpi8qQtTD7lRd9ZPGxEd7ca3hkZfkBo539v4DXEyEjEjV+Pc44772LpUwNt
 2xYeGTRzUBX20j0oBrhrf8eSuMixIuzSjWUREYKTRlYXai+KyNKMAolfqt0OphsC98+K
 1JNnZ5svGlP8pCBVWvuMbn9bmo4zcN5qpH9BvuV0K8pO2kjvGxL4Fdi3lACb32pWhPc9
 HQ4w==
X-Gm-Message-State: AOAM530IoqLCxD5WrwIidNF0ocKcX+Fw8Lk+deabE1km6UMZdnNw0Kh3
 MRc2uT8NVstqRtyL/KJR13q8bQ==
X-Google-Smtp-Source: ABdhPJyhMVprA7LNSX+dPSa0z07+LT8QCOJ/gQGGEou7StHIiEQ5Fr7dSCWiQH7XT6cutt/nrJjAMQ==
X-Received: by 2002:a17:90a:4491:: with SMTP id
 t17mr21732313pjg.30.1624245554543; 
 Sun, 20 Jun 2021 20:19:14 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id 18sm16957096pje.22.2021.06.20.20.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 20:19:14 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: "Christopher M. Riedl" <cmr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RESEND PATCH v4 08/11] powerpc: Initialize and use a temporary
 mm for patching
In-Reply-To: <20210506043452.9674-9-cmr@linux.ibm.com>
References: <20210506043452.9674-1-cmr@linux.ibm.com>
 <20210506043452.9674-9-cmr@linux.ibm.com>
Date: Mon, 21 Jun 2021 13:19:10 +1000
Message-ID: <87r1gvj45t.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Chris,

> +	/*
> +	 * Choose a randomized, page-aligned address from the range:
> +	 * [PAGE_SIZE, DEFAULT_MAP_WINDOW - PAGE_SIZE]
> +	 * The lower address bound is PAGE_SIZE to avoid the zero-page.
> +	 * The upper address bound is DEFAULT_MAP_WINDOW - PAGE_SIZE to stay
> +	 * under DEFAULT_MAP_WINDOW with the Book3s64 Hash MMU.
> +	 */
> +	patching_addr = PAGE_SIZE + ((get_random_long() & PAGE_MASK)
> +			% (DEFAULT_MAP_WINDOW - 2 * PAGE_SIZE));

I checked and poking_init() comes after the functions that init the RNG,
so this should be fine. The maths - while a bit fiddly to reason about -
does check out.

> +
> +	/*
> +	 * PTE allocation uses GFP_KERNEL which means we need to pre-allocate
> +	 * the PTE here. We cannot do the allocation during patching with IRQs
> +	 * disabled (ie. "atomic" context).
> +	 */
> +	ptep = get_locked_pte(patching_mm, patching_addr, &ptl);
> +	BUG_ON(!ptep);
> +	pte_unmap_unlock(ptep, ptl);
> +}
>  
>  #if IS_BUILTIN(CONFIG_LKDTM)
>  unsigned long read_cpu_patching_addr(unsigned int cpu)
>  {
> -	return (unsigned long)(per_cpu(text_poke_area, cpu))->addr;
> +	return patching_addr;
>  }
>  #endif
>  
> -static int text_area_cpu_up(unsigned int cpu)
> +struct patch_mapping {
> +	spinlock_t *ptl; /* for protecting pte table */
> +	pte_t *ptep;
> +	struct temp_mm temp_mm;
> +};
> +
> +#ifdef CONFIG_PPC_BOOK3S_64
> +
> +static inline int hash_prefault_mapping(pgprot_t pgprot)
>  {
> -	struct vm_struct *area;
> +	int err;
>  
> -	area = get_vm_area(PAGE_SIZE, VM_ALLOC);
> -	if (!area) {
> -		WARN_ONCE(1, "Failed to create text area for cpu %d\n",
> -			cpu);
> -		return -1;
> -	}
> -	this_cpu_write(text_poke_area, area);
> +	if (radix_enabled())
> +		return 0;
>  
> -	return 0;
> -}
> +	err = slb_allocate_user(patching_mm, patching_addr);
> +	if (err)
> +		pr_warn("map patch: failed to allocate slb entry\n");
>  

Here if slb_allocate_user() fails, you'll print a warning and then fall
through to the rest of the function. You do return err, but there's a
later call to hash_page_mm() that also sets err. Can slb_allocate_user()
fail while hash_page_mm() succeeds, and would that be a problem?

> -static int text_area_cpu_down(unsigned int cpu)
> -{
> -	free_vm_area(this_cpu_read(text_poke_area));
> -	return 0;
> +	err = hash_page_mm(patching_mm, patching_addr, pgprot_val(pgprot), 0,
> +			   HPTE_USE_KERNEL_KEY);
> +	if (err)
> +		pr_warn("map patch: failed to insert hashed page\n");
> +
> +	/* See comment in switch_slb() in mm/book3s64/slb.c */
> +	isync();
> +

The comment reads:

	/*
	 * Synchronize slbmte preloads with possible subsequent user memory
	 * address accesses by the kernel (user mode won't happen until
	 * rfid, which is safe).
	 */
         isync();

I have to say having read the description of isync I'm not 100% sure why
that's enough (don't we also need stores to complete?) but I'm happy to
take commit 5434ae74629a ("powerpc/64s/hash: Add a SLB preload cache")
on trust here!

I think it does make sense for you to have that barrier here: you are
potentially about to start poking at the memory mapped through that SLB
entry so you should make sure you're fully synchronised.

> +	return err;
>  }
>  

> +	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
> +	use_temporary_mm(&patch_mapping->temp_mm);
>  
> -	pmdp = pmd_offset(pudp, addr);
> -	if (unlikely(!pmdp))
> -		return -EINVAL;
> +	/*
> +	 * On Book3s64 with the Hash MMU we have to manually insert the SLB
> +	 * entry and HPTE to prevent taking faults on the patching_addr later.
> +	 */
> +	return(hash_prefault_mapping(pgprot));

hmm, `return hash_prefault_mapping(pgprot);` or
`return (hash_prefault_mapping((pgprot));` maybe?

Kind regards,
Daniel
