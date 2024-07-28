Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADEB93E528
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jul 2024 14:48:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DKSOfRoy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WX1WC12Snz3cY0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jul 2024 22:48:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DKSOfRoy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WX1VX1zjJz304l
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2024 22:47:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1520FCE01FE;
	Sun, 28 Jul 2024 12:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1214EC116B1;
	Sun, 28 Jul 2024 12:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722170862;
	bh=7DAw1bh/7KLG2aowoCQ2qKx/EFyJdeQ1d+TtPaE81w4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKSOfRoyAcagm/ZCjuUtmZe1LP1/m3qOMpkt+Ja038rI7l8A3gAIiS9vTlhyRlcph
	 q9W3Gs/md02my2rqjor8RoVRuhKeRng2CLjeuQpPwElHl4VIJ1PE8mhHy3nlfCsgPo
	 diba//3nG7207nq7Hoz29mmSrKFjel41IEd1K+OUbqJ9ji9TOMZcPpMQo+WMhANpud
	 6Q847BLXlRgpdKyKpfoIprH/01r3UrVLIMjJqRG5P1sgBD0Z0nzmDaGOzqSAcDzpJq
	 76zEEQv9n49HVtrhliR31CW/giJaLvR0UAqUXFsYST53aU5H48QgjliObfxaz9+zTj
	 RELQP2y7z3fMw==
Date: Sun, 28 Jul 2024 15:47:19 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/3] mm/hugetlb: enforce that PMD PT sharing has split
 PMD PT locks
Message-ID: <ZqY918UEsmkbIGOn@kernel.org>
References: <20240726150728.3159964-1-david@redhat.com>
 <20240726150728.3159964-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726150728.3159964-3-david@redhat.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, xen-devel@lists.xenproject.org, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>, Christian Brauner <brauner@kernel.org>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 26, 2024 at 05:07:27PM +0200, David Hildenbrand wrote:
> Sharing page tables between processes but falling back to per-MM page
> table locks cannot possibly work.
> 
> So, let's make sure that we do have split PMD locks by adding a new
> Kconfig option and letting that depend on CONFIG_SPLIT_PMD_PTLOCKS.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  fs/Kconfig              | 4 ++++
>  include/linux/hugetlb.h | 5 ++---
>  mm/hugetlb.c            | 8 ++++----
>  3 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/Kconfig b/fs/Kconfig
> index a46b0cbc4d8f6..0e4efec1d92e6 100644
> --- a/fs/Kconfig
> +++ b/fs/Kconfig
> @@ -288,6 +288,10 @@ config HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>  	depends on ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
>  	depends on SPARSEMEM_VMEMMAP
>  
> +config HUGETLB_PMD_PAGE_TABLE_SHARING
> +	def_bool HUGETLB_PAGE
> +	depends on ARCH_WANT_HUGE_PMD_SHARE && SPLIT_PMD_PTLOCKS
> +
>  config ARCH_HAS_GIGANTIC_PAGE
>  	bool
>  
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index da800e56fe590..4d2f3224ff027 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -1243,7 +1243,7 @@ static inline __init void hugetlb_cma_reserve(int order)
>  }
>  #endif
>  
> -#ifdef CONFIG_ARCH_WANT_HUGE_PMD_SHARE
> +#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
>  static inline bool hugetlb_pmd_shared(pte_t *pte)
>  {
>  	return page_count(virt_to_page(pte)) > 1;
> @@ -1279,8 +1279,7 @@ bool __vma_private_lock(struct vm_area_struct *vma);
>  static inline pte_t *
>  hugetlb_walk(struct vm_area_struct *vma, unsigned long addr, unsigned long sz)
>  {
> -#if defined(CONFIG_HUGETLB_PAGE) && \
> -	defined(CONFIG_ARCH_WANT_HUGE_PMD_SHARE) && defined(CONFIG_LOCKDEP)
> +#if defined(CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING) && defined(CONFIG_LOCKDEP)
>  	struct hugetlb_vma_lock *vma_lock = vma->vm_private_data;
>  
>  	/*
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 0858a18272073..c4d94e122c41f 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -7211,7 +7211,7 @@ long hugetlb_unreserve_pages(struct inode *inode, long start, long end,
>  	return 0;
>  }
>  
> -#ifdef CONFIG_ARCH_WANT_HUGE_PMD_SHARE
> +#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
>  static unsigned long page_table_shareable(struct vm_area_struct *svma,
>  				struct vm_area_struct *vma,
>  				unsigned long addr, pgoff_t idx)
> @@ -7373,7 +7373,7 @@ int huge_pmd_unshare(struct mm_struct *mm, struct vm_area_struct *vma,
>  	return 1;
>  }
>  
> -#else /* !CONFIG_ARCH_WANT_HUGE_PMD_SHARE */
> +#else /* !CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING */
>  
>  pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
>  		      unsigned long addr, pud_t *pud)
> @@ -7396,7 +7396,7 @@ bool want_pmd_share(struct vm_area_struct *vma, unsigned long addr)
>  {
>  	return false;
>  }
> -#endif /* CONFIG_ARCH_WANT_HUGE_PMD_SHARE */
> +#endif /* CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING */
>  
>  #ifdef CONFIG_ARCH_WANT_GENERAL_HUGETLB
>  pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
> @@ -7494,7 +7494,7 @@ unsigned long hugetlb_mask_last_page(struct hstate *h)
>  /* See description above.  Architectures can provide their own version. */
>  __weak unsigned long hugetlb_mask_last_page(struct hstate *h)
>  {
> -#ifdef CONFIG_ARCH_WANT_HUGE_PMD_SHARE
> +#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
>  	if (huge_page_size(h) == PMD_SIZE)
>  		return PUD_SIZE - PMD_SIZE;
>  #endif
> -- 
> 2.45.2
> 
> 

-- 
Sincerely yours,
Mike.
