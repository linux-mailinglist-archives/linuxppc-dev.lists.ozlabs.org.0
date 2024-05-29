Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id D958B8D325F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 10:56:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NtBfSV6F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq33y4dVsz79qj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 18:50:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NtBfSV6F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=osalvador@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq33C4wrzz79Jd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 18:49:26 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-420180b58c5so15633435e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 01:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716972563; x=1717577363; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8FqWscTuoS7Z7zXndqslsCK2s/b+E7GOJQ0fFCGFa0k=;
        b=NtBfSV6FYxd6o1pI1/WqyNR4qQSXR3LG9p3Aftl5dWrBBu4X/hOc8T9rZmqjjvbLhq
         AyOy+WjLmgMeAObIZJ5B07QJmg+nokfMBKNSoRZCMWDzKqrSUyoCDH088ZumHh7M1Dxt
         Bh6SD5WdpnlnCWrwZ2KVnmJQO+uwbapfPGREWSkBTv1jgYjHghIy0BSTCUO1zQfIwJyW
         iSTxAsrvCUfOfR+I/F1CXkYGz4ZgCPw2NSmeql/01vvSazV9MiulOVNyAzxi92AWaLxe
         gzc0Mmw7h7hw/ENLOWcsQ3bm6FDJ8bpG60qQK60subiYcG6HMjYuNDUYFe64JoGx33X0
         vwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716972563; x=1717577363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FqWscTuoS7Z7zXndqslsCK2s/b+E7GOJQ0fFCGFa0k=;
        b=ONGOHBsvpuGDBM+ixev3V0vt6TgTafu9a7jPUsdtcJZL7UBWavzSLmn2UbiWGL9+Wj
         /tT0pEdGV3JjW1uyMZzfCuVObqJ2y2EvaVO2/+nrrur71rpPbvcNMBDP/SrE6q0Ubyk3
         i4QMDh3tuVKJ8kYFjzALudAXrDjEWmgJG/nC7Obk6Mz8bpmSgZuOy1Yzguq7ZBxLuqnX
         pK9NmsMudVD2Q8sVIxZoVOhVcvDyTntXnuknuORGSmv9MHe08n/rdjwvSkOcrS/sf62S
         68nAjN9/AY6j4Wyfo0mxIpOWVtaCkAeUhlAZupTWxgIkumEJrpJUUtHvlO1xKxW5M9Pu
         mr6A==
X-Forwarded-Encrypted: i=1; AJvYcCXWUgHCxy4/YXOutCMDbuokh3dVNtO8XZnL36oE/Ga4hTQPodsAx++y8B7NNOJWIFd5+U0v0415u8MvkS4RxPZBFA8xvwVMexFhjnN8EA==
X-Gm-Message-State: AOJu0Yync8SaI1buEXbBsyFbLON4NBBchN6vpvNs6QNDk1ZyheXZ2zBC
	n47S8ghgmndMSmNuv+tO1Oj8rIm8r6IXgLq2O7I91LRRyCP0d1kEzWaHR7uz70s=
X-Google-Smtp-Source: AGHT+IFirCm930ok6c0waccClyLojOOhDizCBj1LVv0U/qJp1ipt5v04MsZ7oUfrdlcX266KE3FIUw==
X-Received: by 2002:a05:600c:224e:b0:420:fb99:ed02 with SMTP id 5b1f17b1804b1-421089b2283mr134252545e9.6.1716972563537;
        Wed, 29 May 2024 01:49:23 -0700 (PDT)
Received: from localhost.localdomain (62.83.84.125.dyn.user.ono.com. [62.83.84.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee806esm204152935e9.3.2024.05.29.01.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 01:49:23 -0700 (PDT)
From: Oscar Salvador <osalvador@suse.com>
X-Google-Original-From: Oscar Salvador <osalvador@suse.de>
Date: Wed, 29 May 2024 10:49:21 +0200
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v4 13/16] powerpc/e500: Use contiguous PMD instead of
 hugepd
Message-ID: <ZlbsEb_T2eQYO-g4@localhost.localdomain>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
 <56cf925576285e2b97550f4f7317183d98d596c5.1716815901.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56cf925576285e2b97550f4f7317183d98d596c5.1716815901.git.christophe.leroy@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2024 at 03:30:11PM +0200, Christophe Leroy wrote:
> e500 supports many page sizes among which the following size are
> implemented in the kernel at the time being: 4M, 16M, 64M, 256M, 1G.
> 
> On e500, TLB miss for hugepages is exclusively handled by SW even
> on e6500 which has HW assistance for 4k pages, so there are no
> constraints like on the 8xx.
> 
> On e500/32, all are at PGD/PMD level and can be handled as
> cont-PMD.
> 
> On e500/64, smaller ones are on PMD while bigger ones are on PUD.
> Again, they can easily be handled as cont-PMD and cont-PUD instead
> of hugepd.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

...

> diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
> index 90d6a0943b35..f7421d1a1693 100644
> --- a/arch/powerpc/include/asm/nohash/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/pgtable.h
> @@ -52,11 +52,36 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
>  {
>  	pte_basic_t old = pte_val(*p);
>  	pte_basic_t new = (old & ~(pte_basic_t)clr) | set;
> +	unsigned long sz;
> +	unsigned long pdsize;
> +	int i;
>  
>  	if (new == old)
>  		return old;
>  
> -	*p = __pte(new);
> +#ifdef CONFIG_PPC_E500
> +	if (huge)
> +		sz = 1UL << (((old & _PAGE_HSIZE_MSK) >> _PAGE_HSIZE_SHIFT) + 20);
> +	else

I think this will not compile when CONFIG_PPC_85xx && !CONFIG_PTE_64BIT.

You have declared _PAGE_HSIZE_MSK and _PAGE_HSIZE_SHIFT in
arch/powerpc/include/asm/nohash/hugetlb-e500.h.

But hugetlb-e500.h is only included if CONFIG_PPC_85xx && CONFIG_PTE_64BIT
(see arch/powerpc/include/asm/nohash/32/pgtable.h).



> +#endif
> +		sz = PAGE_SIZE;
> +
> +	if (!huge || sz < PMD_SIZE)
> +		pdsize = PAGE_SIZE;
> +	else if (sz < PUD_SIZE)
> +		pdsize = PMD_SIZE;
> +	else if (sz < P4D_SIZE)
> +		pdsize = PUD_SIZE;
> +	else if (sz < PGDIR_SIZE)
> +		pdsize = P4D_SIZE;
> +	else
> +		pdsize = PGDIR_SIZE;
> +
> +	for (i = 0; i < sz / pdsize; i++, p++) {
> +		*p = __pte(new);
> +		if (new)
> +			new += (unsigned long long)(pdsize / PAGE_SIZE) << PTE_RPN_SHIFT;

I guess 'new' can be 0 if pte_update() is called on behave of clearing the pte?

> +static inline unsigned long pmd_leaf_size(pmd_t pmd)
> +{
> +	return 1UL << (((pmd_val(pmd) & _PAGE_HSIZE_MSK) >> _PAGE_HSIZE_SHIFT) + 20);

Can we have the '20' somewhere defined with a comment on top explaining
what is so it is not a magic number?
Otherwise people might come look at this and wonder why 20.

> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -331,6 +331,37 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
>  		__set_huge_pte_at(pmdp, ptep, pte_val(pte));
>  	}
>  }
> +#elif defined(CONFIG_PPC_E500)
> +void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
> +		     pte_t pte, unsigned long sz)
> +{
> +	unsigned long pdsize;
> +	int i;
> +
> +	pte = set_pte_filter(pte, addr);
> +
> +	/*
> +	 * Make sure hardware valid bit is not set. We don't do
> +	 * tlb flush for this update.
> +	 */
> +	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
> +
> +	if (sz < PMD_SIZE)
> +		pdsize = PAGE_SIZE;
> +	else if (sz < PUD_SIZE)
> +		pdsize = PMD_SIZE;
> +	else if (sz < P4D_SIZE)
> +		pdsize = PUD_SIZE;
> +	else if (sz < PGDIR_SIZE)
> +		pdsize = P4D_SIZE;
> +	else
> +		pdsize = PGDIR_SIZE;
> +
> +	for (i = 0; i < sz / pdsize; i++, ptep++, addr += pdsize) {
> +		__set_pte_at(mm, addr, ptep, pte, 0);
> +		pte = __pte(pte_val(pte) + ((unsigned long long)pdsize / PAGE_SIZE << PFN_PTE_SHIFT));

You can use pte_advance_pfn() here? Just give have

 nr = (unsigned long long)pdsize / PAGE_SIZE << PFN_PTE_SHIFT)
 pte_advance_pfn(pte, nr)

Which 'sz's can we have here? You mentioned that e500 support:

4M, 16M, 64M, 256M, 1G.

which of these ones can be huge?


-- 
Oscar Salvador
SUSE Labs
