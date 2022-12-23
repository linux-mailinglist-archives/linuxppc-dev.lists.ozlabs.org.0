Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 350D66552CF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Dec 2022 17:28:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ndszr0ySYz3c7d
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Dec 2022 03:28:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n7lcCdiE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+a36cbb7ae26730e9169d+7061+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n7lcCdiE;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ndsyy0pftz3bY5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Dec 2022 03:27:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tvgYFs2FAZdH+/felJr+94xqrzl/poYnFOMsR5Dg6fA=; b=n7lcCdiEfcq8NCgXEDNF/0Z4ci
	tIOpRAdjDXVUvE+5DzvrJ/9KcCMujjvsihTERwfIZtXtW7cfaSsL8gKUqzMyoqVPAuofBgFa35SaB
	eQ1a1u6TOi/d/R7Vm5HFe4N9BX10usAzaGFrUU15vE/Rp65o4AsfVdY7lDi7fEDOqTAv29Gk+rfsP
	x0FQmjE4t+01NANuuhbsYP+Q46PaNZUvkjZbeCs5rLNn0M9gxprited5koJ9kFvTzc2h7pRCrgsrh
	rRT4+62twBnE/keGANDiY5jPmax6kiPnXxTrwnrL02TafuDXWZfPgmANs4Q8lAfIEfRfYyeh0pO/9
	m+4fvEuw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8kt4-009yDY-Rs; Fri, 23 Dec 2022 16:27:10 +0000
Date: Fri, 23 Dec 2022 08:27:10 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [RFC PATCH] mm: remove zap_page_range and change callers to use
 zap_vma_page_range
Message-ID: <Y6XW3hMtB7PrTSM5@infradead.org>
References: <20221216192012.13562-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216192012.13562-1-mike.kravetz@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Christian Brauner <brauner@kernel.org>, linux-s390@vger.kernel.org, Nadav Amit <nadav.amit@gmail.com>, Michal Hocko <mhocko@suse.com>, Will Deacon <will@kernel.org>, David Hildenbrand <david@redhat.com>, netdev@vger.kernel.org, Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Matthew Wilcox <willy@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-riscv@lists.infradead.org, Christian Borntraeger <borntraeger@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>  		unsigned long size = vma->vm_end - vma->vm_start;
>  
>  		if (vma_is_special_mapping(vma, vdso_info[VDSO_ABI_AA64].dm))
> -			zap_page_range(vma, vma->vm_start, size);
> +			zap_vma_page_range(vma, vma->vm_start, size);
>  #ifdef CONFIG_COMPAT_VDSO
>  		if (vma_is_special_mapping(vma, vdso_info[VDSO_ABI_AA32].dm))
> -			zap_page_range(vma, vma->vm_start, size);
> +			zap_vma_page_range(vma, vma->vm_start, size);
>  #endif

So for something called zap_vma_page_range I'd expect to just pass
the vma and zap all of it, which this and many other callers want
anyway.

> +++ b/arch/s390/mm/gmap.c
> @@ -722,7 +722,7 @@ void gmap_discard(struct gmap *gmap, unsigned long from, unsigned long to)
>  		if (is_vm_hugetlb_page(vma))
>  			continue;
>  		size = min(to - gaddr, PMD_SIZE - (gaddr & ~PMD_MASK));
> -		zap_page_range(vma, vmaddr, size);
> +		zap_vma_page_range(vma, vmaddr, size);

And then just call zap_page_range_single directly for those that
don't want to zap the entire vma.
