Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A76B2872EDB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 07:24:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pRd4hIXl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqMpy2y5jz3vcb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 17:24:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pRd4hIXl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqMpD14ljz3cgg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 17:24:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9EFCE60DDB;
	Wed,  6 Mar 2024 06:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDBFC433F1;
	Wed,  6 Mar 2024 06:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709706241;
	bh=RjcUrgFFbqLCRk4mp6+71yebhvFupXWUxXPN5bFeYEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pRd4hIXllVAPYIPtLMMzSPf8ff00qQuCW3SfaXOqUD0RmE00JMLNSCefhf3qCvS9v
	 iXMTwezrqdF2Tw+jmSQKGpvH1i9g7BiXu4hyp4wP3wQw6YXLVNaLlJFM+uDQrLxfyy
	 T1N4heGZOJDB27E6vlPsuikUAkdiVw9moQBOtLTrMdFi81r0nhUnKBTY8qG7s7wliY
	 LNkxN5O7d3nRQmYKmioxKmovfm6U0oHWVkiC7hmL932YDpmqBag/ql4uC2HZMGO41l
	 mmdIfdeSfKu1GzqJ3iHFseO7h9d3L5EOC9eRpw9xyGk0RkcXaJW1hfE5iGA+BtdoXg
	 i4VKBk+Je/NYw==
Date: Wed, 6 Mar 2024 08:23:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: peterx@redhat.com
Subject: Re: [PATCH v3 03/10] mm/x86: Replace p4d_large() with p4d_leaf()
Message-ID: <ZegLy9z7cdROGL3D@kernel.org>
References: <20240305043750.93762-1-peterx@redhat.com>
 <20240305043750.93762-4-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305043750.93762-4-peterx@redhat.com>
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
Cc: Muchun Song <muchun.song@linux.dev>, Yang Shi <shy828301@gmail.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 05, 2024 at 12:37:43PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> p4d_large() is always defined as p4d_leaf().  Merge their usages.  Chose
> p4d_leaf() because p4d_leaf() is a global API, while p4d_large() is not.
> 
> Only x86 has p4d_leaf() defined as of now.  So it also means after this
> patch we removed all p4d_large() usages.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/x86/mm/fault.c          | 4 ++--
>  arch/x86/mm/init_64.c        | 2 +-
>  arch/x86/mm/pat/set_memory.c | 4 ++--
>  arch/x86/mm/pti.c            | 2 +-
>  arch/x86/power/hibernate.c   | 2 +-
>  arch/x86/xen/mmu_pv.c        | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> index 679b09cfe241..8b69ce3f4115 100644
> --- a/arch/x86/mm/fault.c
> +++ b/arch/x86/mm/fault.c
> @@ -368,7 +368,7 @@ static void dump_pagetable(unsigned long address)
>  		goto bad;
>  
>  	pr_cont("P4D %lx ", p4d_val(*p4d));
> -	if (!p4d_present(*p4d) || p4d_large(*p4d))
> +	if (!p4d_present(*p4d) || p4d_leaf(*p4d))
>  		goto out;
>  
>  	pud = pud_offset(p4d, address);
> @@ -1039,7 +1039,7 @@ spurious_kernel_fault(unsigned long error_code, unsigned long address)
>  	if (!p4d_present(*p4d))
>  		return 0;
>  
> -	if (p4d_large(*p4d))
> +	if (p4d_leaf(*p4d))
>  		return spurious_kernel_fault_check(error_code, (pte_t *) p4d);
>  
>  	pud = pud_offset(p4d, address);
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index ebdbcae48011..d691e7992a9a 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -1197,7 +1197,7 @@ remove_p4d_table(p4d_t *p4d_start, unsigned long addr, unsigned long end,
>  		if (!p4d_present(*p4d))
>  			continue;
>  
> -		BUILD_BUG_ON(p4d_large(*p4d));
> +		BUILD_BUG_ON(p4d_leaf(*p4d));
>  
>  		pud_base = pud_offset(p4d, 0);
>  		remove_pud_table(pud_base, addr, next, altmap, direct);
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index e9b448d1b1b7..5359a9c88099 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -676,7 +676,7 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
>  		return NULL;
>  
>  	*level = PG_LEVEL_512G;
> -	if (p4d_large(*p4d) || !p4d_present(*p4d))
> +	if (p4d_leaf(*p4d) || !p4d_present(*p4d))
>  		return (pte_t *)p4d;
>  
>  	pud = pud_offset(p4d, address);
> @@ -739,7 +739,7 @@ pmd_t *lookup_pmd_address(unsigned long address)
>  		return NULL;
>  
>  	p4d = p4d_offset(pgd, address);
> -	if (p4d_none(*p4d) || p4d_large(*p4d) || !p4d_present(*p4d))
> +	if (p4d_none(*p4d) || p4d_leaf(*p4d) || !p4d_present(*p4d))
>  		return NULL;
>  
>  	pud = pud_offset(p4d, address);
> diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
> index 669ba1c345b3..dc0a81f5f60e 100644
> --- a/arch/x86/mm/pti.c
> +++ b/arch/x86/mm/pti.c
> @@ -206,7 +206,7 @@ static pmd_t *pti_user_pagetable_walk_pmd(unsigned long address)
>  	if (!p4d)
>  		return NULL;
>  
> -	BUILD_BUG_ON(p4d_large(*p4d) != 0);
> +	BUILD_BUG_ON(p4d_leaf(*p4d) != 0);
>  	if (p4d_none(*p4d)) {
>  		unsigned long new_pud_page = __get_free_page(gfp);
>  		if (WARN_ON_ONCE(!new_pud_page))
> diff --git a/arch/x86/power/hibernate.c b/arch/x86/power/hibernate.c
> index 6f955eb1e163..28153789f873 100644
> --- a/arch/x86/power/hibernate.c
> +++ b/arch/x86/power/hibernate.c
> @@ -165,7 +165,7 @@ int relocate_restore_code(void)
>  	pgd = (pgd_t *)__va(read_cr3_pa()) +
>  		pgd_index(relocated_restore_code);
>  	p4d = p4d_offset(pgd, relocated_restore_code);
> -	if (p4d_large(*p4d)) {
> +	if (p4d_leaf(*p4d)) {
>  		set_p4d(p4d, __p4d(p4d_val(*p4d) & ~_PAGE_NX));
>  		goto out;
>  	}
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index e21974f2cf2d..12a43a4abebf 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -1104,7 +1104,7 @@ static void __init xen_cleanmfnmap_p4d(p4d_t *p4d, bool unpin)
>  	pud_t *pud_tbl;
>  	int i;
>  
> -	if (p4d_large(*p4d)) {
> +	if (p4d_leaf(*p4d)) {
>  		pa = p4d_val(*p4d) & PHYSICAL_PAGE_MASK;
>  		xen_free_ro_pages(pa, P4D_SIZE);
>  		return;
> -- 
> 2.44.0
> 
> 

-- 
Sincerely yours,
Mike.
