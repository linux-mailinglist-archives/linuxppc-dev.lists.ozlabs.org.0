Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B2981E468
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Dec 2023 02:35:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h682B12Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SzcmX2MGhz3cDT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Dec 2023 12:35:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h682B12Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.175; helo=out-175.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 442 seconds by postgrey-1.37 at boromir; Mon, 25 Dec 2023 17:37:35 AEDT
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sz7W31G60z2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Dec 2023 17:37:34 +1100 (AEDT)
Message-ID: <135b3189-f459-4b57-9861-bb8acb999d91@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1703485805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mXkiPRdEVvfi9LIMu0a4pQRnrGa3opN+NyWjT9LajSI=;
	b=h682B12QYqT/ZiBDMXBg7hxqm2zl3GqlcPYEpS6y3r1bGCN3rdgqF0yDtrO4pW4CUYWVXI
	sTJy5rRK3CQjhtBukguGXtqnO65rzWMecb3dF6Bh7A7RdO4oHUmUtz51k8Yklj7jcfBANa
	Xv5L0ZESaqeE7oGtj7aq7bWJxH5I2r4=
Date: Mon, 25 Dec 2023 14:29:53 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 03/13] mm: Provide generic pmd_thp_or_huge()
To: peterx@redhat.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20231219075538.414708-1-peterx@redhat.com>
 <20231219075538.414708-4-peterx@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20231219075538.414708-4-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 26 Dec 2023 12:35:13 +1100
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2023/12/19 15:55, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
>
> ARM defines pmd_thp_or_huge(), detecting either a THP or a huge PMD.  It
> can be a helpful helper if we want to merge more THP and hugetlb code
> paths.  Make it a generic default implementation, only exist when
> CONFIG_MMU.  Arch can overwrite it by defining its own version.
>
> For example, ARM's pgtable-2level.h defines it to always return false.
>
> Keep the macro declared with all config, it should be optimized to a false
> anyway if !THP && !HUGETLB.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   include/linux/pgtable.h | 4 ++++
>   mm/gup.c                | 3 +--
>   2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index af7639c3b0a3..6f2fa1977b8a 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1355,6 +1355,10 @@ static inline int pmd_write(pmd_t pmd)
>   #endif /* pmd_write */
>   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>   
> +#ifndef pmd_thp_or_huge

I think it may be the time to rename to pmd_thp_or_hugetlb,
the "huge" is really confusing. thp is not huge? Actually,
it is huge. It is better to make it more specific from now on, like
"hugetlb".

BTW, please cc me via the new email (muchun.song@linux.dev) next edition.

Thanks.

> +#define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
> +#endif
> +
>   #ifndef pud_write
>   static inline int pud_write(pud_t pud)
>   {
> diff --git a/mm/gup.c b/mm/gup.c
> index 0a5f0e91bfec..efc9847e58fb 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -3004,8 +3004,7 @@ static int gup_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr, unsigned lo
>   		if (!pmd_present(pmd))
>   			return 0;
>   
> -		if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
> -			     pmd_devmap(pmd))) {
> +		if (unlikely(pmd_thp_or_huge(pmd) || pmd_devmap(pmd))) {
>   			/* See gup_pte_range() */
>   			if (pmd_protnone(pmd))
>   				return 0;

