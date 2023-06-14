Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F9C73030E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 17:11:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u1QQyNDB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh8543SPYz3c51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 01:11:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u1QQyNDB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh84C2WWLz2xKS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 01:10:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8A3FB63E86;
	Wed, 14 Jun 2023 15:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FDFC433C9;
	Wed, 14 Jun 2023 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686755416;
	bh=eEAbU7oQr9nMdD1HLeHjNBK19Ki+7NwrWH3cOyfSAFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1QQyNDBdtCEWKCdwkI61E6ULyFIgzYYylF24CXModGq8eNzM+Z8HRxJ8NnKbPEF5
	 UNrt/K6ZH5RXrryPuSNoWGiuCh9vnPW8YLLGFCdMmvIvsn7goY4XYWaNAnF4AlaV9N
	 mfMLdsrym6F2G1al1nf4xNlH9qHN5OFMys6dbDrcrpZ1VYnPTPQnPkmwVp166H2/JK
	 U32Jf//4jTFsBKhLdt7fUkuWV7s3JXIXH4B66LpDynvbrZHamU0t4g4xIlyNwqP+5M
	 W4uLOM28xHt+KNxT29B1NyZJ2yMGSa3xxMl7M4zbMQTq/+ShWbaHrgSWCQ911pmwU9
	 nPWmBNYhBTiFw==
Date: Wed, 14 Jun 2023 18:09:37 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH v4 24/34] loongarch: Convert various functions to use
 ptdescs
Message-ID: <20230614150937.GW52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-25-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-25-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 12, 2023 at 02:04:13PM -0700, Vishal Moola (Oracle) wrote:
> As part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents, convert various page table functions to use ptdescs.
> 
> Some of the functions use the *get*page*() helper functions. Convert
> these to use pagetable_alloc() and ptdesc_address() instead to help
> standardize page tables further.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/loongarch/include/asm/pgalloc.h | 27 +++++++++++++++------------
>  arch/loongarch/mm/pgtable.c          |  7 ++++---
>  2 files changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
> index af1d1e4a6965..70bb3bdd201e 100644
> --- a/arch/loongarch/include/asm/pgalloc.h
> +++ b/arch/loongarch/include/asm/pgalloc.h
> @@ -45,9 +45,9 @@ extern void pagetable_init(void);
>  extern pgd_t *pgd_alloc(struct mm_struct *mm);
>  
>  #define __pte_free_tlb(tlb, pte, address)			\
> -do {							\
> -	pgtable_pte_page_dtor(pte);			\
> -	tlb_remove_page((tlb), pte);			\
> +do {								\
> +	pagetable_pte_dtor(page_ptdesc(pte));			\
> +	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
>  } while (0)
>  
>  #ifndef __PAGETABLE_PMD_FOLDED
> @@ -55,18 +55,18 @@ do {							\
>  static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  {
>  	pmd_t *pmd;
> -	struct page *pg;
> +	struct ptdesc *ptdesc;
>  
> -	pg = alloc_page(GFP_KERNEL_ACCOUNT);
> -	if (!pg)
> +	ptdesc = pagetable_alloc(GFP_KERNEL_ACCOUNT, 0);
> +	if (!ptdesc)
>  		return NULL;
>  
> -	if (!pgtable_pmd_page_ctor(pg)) {
> -		__free_page(pg);
> +	if (!pagetable_pmd_ctor(ptdesc)) {
> +		pagetable_free(ptdesc);
>  		return NULL;
>  	}
>  
> -	pmd = (pmd_t *)page_address(pg);
> +	pmd = ptdesc_address(ptdesc);
>  	pmd_init(pmd);
>  	return pmd;
>  }
> @@ -80,10 +80,13 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
>  {
>  	pud_t *pud;
> +	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
>  
> -	pud = (pud_t *) __get_free_page(GFP_KERNEL);
> -	if (pud)
> -		pud_init(pud);
> +	if (!ptdesc)
> +		return NULL;
> +	pud = ptdesc_address(ptdesc);
> +
> +	pud_init(pud);
>  	return pud;
>  }
>  
> diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
> index 36a6dc0148ae..cdba10ffc0df 100644
> --- a/arch/loongarch/mm/pgtable.c
> +++ b/arch/loongarch/mm/pgtable.c
> @@ -11,10 +11,11 @@
>  
>  pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
> -	pgd_t *ret, *init;
> +	pgd_t *init, *ret = NULL;
> +	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
>  
> -	ret = (pgd_t *) __get_free_page(GFP_KERNEL);
> -	if (ret) {
> +	if (ptdesc) {
> +		ret = (pgd_t *)ptdesc_address(ptdesc);
>  		init = pgd_offset(&init_mm, 0UL);
>  		pgd_init(ret);
>  		memcpy(ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.
