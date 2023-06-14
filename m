Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D78527303B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 17:22:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EVqVK3+c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh8Lm5R4Hz3c4C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 01:22:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EVqVK3+c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh8KB2s64z3c6H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 01:21:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66B1D63A8D;
	Wed, 14 Jun 2023 15:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A344C433C8;
	Wed, 14 Jun 2023 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686756091;
	bh=il/HQfNL/uVoI8Ww57mtbKzYiPMAc1DKtiQkMGOtIfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVqVK3+cHzzM3I6jLTXFddZxbFNGPyRkmUP04L3rXdQHtkhROZjeS4xs716iEeHdI
	 3NTDNl7d+xttJku6jL5Vp2AtMEzW22vWDWbwjll2V8vVRNY23vhOyS7i+LK0LxbXdw
	 FLa/cSLNMXXmsxuzrxQhCn+drunkS9V+mQxgMLtHYqy48lWC0KA1CxMftayd+ywuMN
	 LLMWJKOOtCwfpjAWz8cODynASF/ygJUUKBwEscMZxGpjyvRIOPidi0xPpAYKGa2gya
	 /E5L+RC/PloG4xdfJOfUmDMA7VZBXAl85QlMPjo/CmXi01rcsEFX+MuFeeezAt7qfD
	 tIubuOBxrNFBw==
Date: Wed, 14 Jun 2023 18:20:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH v4 32/34] sparc: Convert pgtable_pte_page_{ctor, dtor}()
 to ptdesc equivalents
Message-ID: <20230614152053.GE52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-33-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-33-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 12, 2023 at 02:04:21PM -0700, Vishal Moola (Oracle) wrote:
> Part of the conversions to replace pgtable pte constructor/destructors with
> ptdesc equivalents.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/sparc/mm/srmmu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
> index 13f027afc875..8393faa3e596 100644
> --- a/arch/sparc/mm/srmmu.c
> +++ b/arch/sparc/mm/srmmu.c
> @@ -355,7 +355,8 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
>  		return NULL;
>  	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
>  	spin_lock(&mm->page_table_lock);
> -	if (page_ref_inc_return(page) == 2 && !pgtable_pte_page_ctor(page)) {
> +	if (page_ref_inc_return(page) == 2 &&
> +			!pagetable_pte_ctor(page_ptdesc(page))) {
>  		page_ref_dec(page);
>  		ptep = NULL;
>  	}
> @@ -371,7 +372,7 @@ void pte_free(struct mm_struct *mm, pgtable_t ptep)
>  	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
>  	spin_lock(&mm->page_table_lock);
>  	if (page_ref_dec_return(page) == 1)
> -		pgtable_pte_page_dtor(page);
> +		pagetable_pte_dtor(page_ptdesc(page));
>  	spin_unlock(&mm->page_table_lock);
>  
>  	srmmu_free_nocache(ptep, SRMMU_PTE_TABLE_SIZE);
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.
