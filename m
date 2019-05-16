Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C572420A15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 16:48:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454Z6W0GH0zDqfB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 00:48:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454Z5529VszDqcK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 00:47:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 454Z542nCVz9s7h;
 Fri, 17 May 2019 00:47:04 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 paulus@samba.org
Subject: Re: [RFC PATCH 3/3] powerpc/mm/hugetlb: Don't enable HugeTLB if we
 don't have a page table cache
In-Reply-To: <20190514145041.7836-3-aneesh.kumar@linux.ibm.com>
References: <20190514145041.7836-1-aneesh.kumar@linux.ibm.com>
 <20190514145041.7836-3-aneesh.kumar@linux.ibm.com>
Date: Fri, 17 May 2019 00:47:00 +1000
Message-ID: <87imuaihi3.fsf@concordia.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> This makes sure we don't enable HugeTLB if the cache is not configured.
> I am still not sure about this. IMHO hugetlb support should be a hardware
> support derivative and any cache allocation failure should be handled as I did
> in the earlier patch. But then if we were not able to create hugetlb page table
> cache, we can as well declare hugetlb support disabled thereby avoiding calling
> into allocation routines.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/hugetlbpage.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index ee16a3fb788a..4bf8bc659cc7 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -602,6 +602,7 @@ __setup("hugepagesz=", hugepage_setup_sz);
>  static int __init hugetlbpage_init(void)
>  {
>  	int psize;
> +	bool configured = false;

Where's my reverse Christmas tree! :)

>  	if (hugetlb_disabled) {
>  		pr_info("HugeTLB support is disabled!\n");
> @@ -651,10 +652,16 @@ static int __init hugetlbpage_init(void)
>  			pgtable_cache_add(pdshift - shift);
>  		else if (IS_ENABLED(CONFIG_PPC_FSL_BOOK3E) || IS_ENABLED(CONFIG_PPC_8xx))
>  			pgtable_cache_add(PTE_T_ORDER);
> +
> +		if (!configured)
> +			configured = true;

I'd just not worry about the if.

>  	}
>  
> -	if (IS_ENABLED(CONFIG_HUGETLB_PAGE_SIZE_VARIABLE))
> -		hugetlbpage_init_default();
> +	if (configured) {
> +		if (IS_ENABLED(CONFIG_HUGETLB_PAGE_SIZE_VARIABLE))
> +			hugetlbpage_init_default();
> +	} else
> +		pr_info("Disabling HugeTLB");

We're not actually doing anything to disable it in the
CONFIG_HUGETLB_PAGE_SIZE_VARIABLE=n case, but I guess the print is still
correct because we didn't enable a size in the for loop above?

Can we make it a bit more explicit? Maybe like:

  "Disabling HugeTLB, no usable page sizes found."

??

cheers
