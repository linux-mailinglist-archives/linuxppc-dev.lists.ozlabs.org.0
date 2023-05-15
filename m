Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 730EA702CFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 14:43:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKfF72GK3z3fCq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 22:43:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=danny.cz (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=<UNKNOWN>)
Received: from redcrew.org (redcrew.org [37.157.195.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKfDZ3XtPz3bZv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 22:43:24 +1000 (AEST)
Received: from server.danny.cz (85-71-161-19.rce.o2.cz [85.71.161.19])
	by redcrew.org (Postfix) with ESMTP id 118331B3C;
	Mon, 15 May 2023 14:43:19 +0200 (CEST)
Received: from talos.danny.cz (unknown [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
	by server.danny.cz (Postfix) with SMTP id 41E9711AAAB;
	Mon, 15 May 2023 14:43:19 +0200 (CEST)
Date: Mon, 15 May 2023 14:43:19 +0200
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s/radix: Fix soft dirty tracking
Message-Id: <20230515144319.06c3dc2522798c86de4f93de@danny.cz>
In-Reply-To: <20230511114224.977423-1-mpe@ellerman.id.au>
References: <20230511114224.977423-1-mpe@ellerman.id.au>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; powerpc64le-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 May 2023 21:42:24 +1000
Michael Ellerman <mpe@ellerman.id.au> wrote:

> It was reported that soft dirty tracking doesn't work when using the
> Radix MMU.
> 
> The tracking is supposed to work by clearing the soft dirty bit for a
> mapping and then write protecting the PTE. If/when the page is written
> to, a page fault occurs and the soft dirty bit is added back via
> pte_mkdirty(). For example in wp_page_reuse():
> 
> 	entry = maybe_mkwrite(pte_mkdirty(entry), vma);
> 	if (ptep_set_access_flags(vma, vmf->address, vmf->pte, entry, 1))
> 		update_mmu_cache(vma, vmf->address, vmf->pte);
> 
> Unfortunately on radix _PAGE_SOFTDIRTY is being dropped by
> radix__ptep_set_access_flags(), called from ptep_set_access_flags(),
> meaning the soft dirty bit is not set even though the page has been
> written to.
> 
> Fix it by adding _PAGE_SOFTDIRTY to the set of bits that are able to be
> changed in radix__ptep_set_access_flags().

and it looks good, thanks

Tested-by: Dan Horák <dan@danny.cz>


		Dan

 
> Fixes: b0b5e9b13047 ("powerpc/mm/radix: Add radix pte #defines")
> Cc: stable@vger.kernel.org # v4.7+
> Reported-by: Dan Horák <dan@danny.cz>
> Link: https://lore.kernel.org/r/20230511095558.56663a50f86bdc4cd97700b7@danny.cz
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 26245aaf12b8..2297aa764ecd 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -1040,8 +1040,8 @@ void radix__ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
>  				  pte_t entry, unsigned long address, int psize)
>  {
>  	struct mm_struct *mm = vma->vm_mm;
> -	unsigned long set = pte_val(entry) & (_PAGE_DIRTY | _PAGE_ACCESSED |
> -					      _PAGE_RW | _PAGE_EXEC);
> +	unsigned long set = pte_val(entry) & (_PAGE_DIRTY | _PAGE_SOFT_DIRTY |
> +					      _PAGE_ACCESSED | _PAGE_RW | _PAGE_EXEC);
>  
>  	unsigned long change = pte_val(entry) ^ pte_val(*ptep);
>  	/*
> -- 
> 2.40.1
> 
