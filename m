Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 55ED78D3311
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 11:31:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VF3F0D2n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq3qL4GJKz79MQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 19:24:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VF3F0D2n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=osalvador@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq3pZ11WXz3vYn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 19:23:30 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42120e3911eso12560615e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 02:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716974601; x=1717579401; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fhJ836irwNS/8JeOTE2TBDDML/9+Ts5hKkWKN+MrauU=;
        b=VF3F0D2nnKMpyka4Tcsg0m60mNApkcThkk7mrCU4OsEY+XXP9EH55KmYLVwgXGbuoo
         DGpcWYlCL7NyT7G3OnBgwafyllfjPox48e43Dp/02Wnp0r5ZSvi36jwmyqniROBVwZEo
         4xvbs0xVbYZzXBpeZVjrGUUdyConxxB6GYGjQrIP70Kn/mNORwe92Bj8EHp891kEZXsN
         9Yla/Zul16XmjLnkLR7aW+f/bVY5Szd7ERSOe9+pTdZ4jtj0/uyDoooC8vgiMKXuBZds
         mytI73k+08JwJj4PTUrbgompCrZ97/qLRzZX7x2jBQttEj2Tf0dWOmhNG+uWgARssNds
         K9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716974601; x=1717579401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhJ836irwNS/8JeOTE2TBDDML/9+Ts5hKkWKN+MrauU=;
        b=XelFbBW2aSIWSBWyl3BVE/Hvo35A85hx5ydy975o326F/8K6F7Wz4Lp19DjnoReYui
         gTi+bFUzmBee0ThLZwWl2kCj44UMv8te+7jlB1zIArOmvH3sAsI0RLLi9SldHjfc4PGY
         RUCY6xLq5C+I/xgobq5aThLq//Hm9+qmqchHmcfGc2lXMYNPSPI8XFdSsrGBnJ7D3iNW
         jHIO4PUBDJhVxILfGD4lYmpQTdAk0+gyhduWzejsz9fEB1LjH2ssYB5/MsRjAFRRmHTg
         5kKL7mLKh6Lo+9XZLZEDEiVzJDsR9KWVfRaUzYOLEyO87W0r12El3JW5+JulPNlx8Gn3
         HEaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdraNV7mU0ByqonsqpBzP3VKw9+uORPaLo29JIZCJnzdsh6B/MQrAlQCi6eG+TDMNv8aak788lexIGWmunuTD2mdD0sHDS/HU57NNa5Q==
X-Gm-Message-State: AOJu0YzLmzadnKPc1bdx7JIBfblvca3CiISm0r1zfukKxAx3N/bwwGJr
	gyOUXnhZq1wTWzp2cWSFlQmdwPnpCoJVkIbqdN8kqq2P5oHmMnUk0rskXWjiPXQ=
X-Google-Smtp-Source: AGHT+IFm78cnc3X0c1k2D4eGRsFsXjAbi0O/Q9Jcd6v24wtsbWarGavak3rEikXZrSA/XmfQUHqeuA==
X-Received: by 2002:a05:600c:3144:b0:41a:c592:64ff with SMTP id 5b1f17b1804b1-421089f9787mr136068615e9.35.1716974601075;
        Wed, 29 May 2024 02:23:21 -0700 (PDT)
Received: from localhost.localdomain (62.83.84.125.dyn.user.ono.com. [62.83.84.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421089708edsm173311555e9.16.2024.05.29.02.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 02:23:20 -0700 (PDT)
From: Oscar Salvador <osalvador@suse.com>
X-Google-Original-From: Oscar Salvador <osalvador@suse.de>
Date: Wed, 29 May 2024 11:23:18 +0200
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v4 14/16] powerpc/64s: Use contiguous PMD/PUD instead
 of HUGEPD
Message-ID: <Zlb0BugOwko4PrLm@localhost.localdomain>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
 <610be6003a6d215e9e9ca87d7f5402042da1e355.1716815901.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <610be6003a6d215e9e9ca87d7f5402042da1e355.1716815901.git.christophe.leroy@csgroup.eu>
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

On Mon, May 27, 2024 at 03:30:12PM +0200, Christophe Leroy wrote:
> On book3s/64, the only user of hugepd is hash in 4k mode.
> 
> All other setups (hash-64, radix-4, radix-64) use leaf PMD/PUD.
> 
> Rework hash-4k to use contiguous PMD and PUD instead.
> 
> In that setup there are only two huge page sizes: 16M and 16G.
> 
> 16M sits at PMD level and 16G at PUD level.


On 4k mode, PMD_SIZE is 2MB and PUD_SIZE is 256MB, right?

> +static inline unsigned long hash__pte_update(struct mm_struct *mm,
> +					 unsigned long addr,
> +					 pte_t *ptep, unsigned long clr,
> +					 unsigned long set,
> +					 int huge)
> +{
> +	unsigned long old;
> +
> +	old = hash__pte_update_one(ptep, clr, set);
> +
> +	if (IS_ENABLED(CONFIG_PPC_4K_PAGES) && huge) {
> +		unsigned int psize = get_slice_psize(mm, addr);
> +		int nb, i;
> +
> +		if (psize == MMU_PAGE_16M)
> +			nb = SZ_16M / PMD_SIZE;
> +		else if (psize == MMU_PAGE_16G)
> +			nb = SZ_16G / PUD_SIZE;
> +		else
> +			nb = 1;

On 4K, hugepages are either 16M or 16G. How can we end up in a situation
whwere the is pte is huge, but is is neither MMU_PAGE_16G nor MMU_PAGE_16M?

> diff --git a/arch/powerpc/mm/book3s64/hugetlbpage.c b/arch/powerpc/mm/book3s64/hugetlbpage.c
> index 5a2e512e96db..83c3361b358b 100644
> --- a/arch/powerpc/mm/book3s64/hugetlbpage.c
> +++ b/arch/powerpc/mm/book3s64/hugetlbpage.c
> @@ -53,6 +53,16 @@ int __hash_page_huge(unsigned long ea, unsigned long access, unsigned long vsid,
>  		/* If PTE permissions don't match, take page fault */
>  		if (unlikely(!check_pte_access(access, old_pte)))
>  			return 1;
> +		/*
> +		 * If hash-4k, hugepages use seeral contiguous PxD entries
'several'
> +		 * so bail out and let mm make the page young or dirty
> +		 */
> +		if (IS_ENABLED(CONFIG_PPC_4K_PAGES)) {
> +			if (!(old_pte & _PAGE_ACCESSED))
> +				return 1;
> +			if ((access & _PAGE_WRITE) && !(old_pte & _PAGE_DIRTY))
> +				return 1;

I have 0 clue about this code. What would happen if we do not bail out?


-- 
Oscar Salvador
SUSE Labs
