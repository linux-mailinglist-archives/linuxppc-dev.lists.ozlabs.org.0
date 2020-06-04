Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E18281EE8E1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 18:51:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dBd21Nk1zDqg8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 02:51:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=bpAs4zNr; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dBYS4SxtzDqnZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 02:48:28 +1000 (AEST)
Received: from kernel.org (unknown [87.71.78.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 785802072E;
 Thu,  4 Jun 2020 16:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591289305;
 bh=Oz7w8Vy9BhqBNcFPLUtkFBwlNSjLFu/N//zwBWU6z1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bpAs4zNrGftDH+mfIB6aH7FBHvii0eyFF4eGfjNke4KBrTczckrLCgkHoW5LOpXab
 zMovWEZ1cKUI1IRRf1GxOef/x+71d/03HlotOfi7JHLcWxCSSw/A7XESVjnbIVd0DK
 VihEcbNVmahz/dpMfM+c4PiM52AoOgpr7v341OcA=
Date: Thu, 4 Jun 2020 19:48:14 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] mm: Fix pud_alloc_track()
Message-ID: <20200604164814.GA7600@kernel.org>
References: <20200604074446.23944-1-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604074446.23944-1-joro@8bytes.org>
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
Cc: linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 jroedel@suse.de, linux-mm@kvack.org, peterz@infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>, linux-next@vger.kernel.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 manvanth@linux.vnet.ibm.com, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 04, 2020 at 09:44:46AM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The pud_alloc_track() needs to do different checks based on whether
> __ARCH_HAS_5LEVEL_HACK is defined, like it already does in
> pud_alloc(). Otherwise it causes boot failures on PowerPC.
> 
> Provide the correct implementations for both possible settings of
> __ARCH_HAS_5LEVEL_HACK to fix the boot problems.

There is a patch in mmotm [1] that completely removes
__ARCH_HAS_5LEVEL_HACK which is a part of the series [2] that updates
p4d folding accross architectures. This should fix boot on PowerPC and
the addition of pXd_alloc_track() for __ARCH_HAS_5LEVEL_HACK wouldn't be
necessary.


[1] https://github.com/hnaz/linux-mm/commit/cfae68792af3731ac902ea6ba5ed8df5a0f6bd2f
[2] https://lore.kernel.org/kvmarm/20200414153455.21744-1-rppt@kernel.org/

> Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
> Tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
> Tested-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> Fixes: d8626138009b ("mm: add functions to track page directory modifications")
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  include/asm-generic/5level-fixup.h |  5 +++++
>  include/linux/mm.h                 | 26 +++++++++++++-------------
>  2 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/include/asm-generic/5level-fixup.h b/include/asm-generic/5level-fixup.h
> index 58046ddc08d0..afbab31fbd7e 100644
> --- a/include/asm-generic/5level-fixup.h
> +++ b/include/asm-generic/5level-fixup.h
> @@ -17,6 +17,11 @@
>  	((unlikely(pgd_none(*(p4d))) && __pud_alloc(mm, p4d, address)) ? \
>  		NULL : pud_offset(p4d, address))
>  
> +#define pud_alloc_track(mm, p4d, address, mask)					\
> +	((unlikely(pgd_none(*(p4d))) &&						\
> +	  (__pud_alloc(mm, p4d, address) || ({*(mask)|=PGTBL_P4D_MODIFIED;0;})))?	\
> +	  NULL : pud_offset(p4d, address))
> +
>  #define p4d_alloc(mm, pgd, address)		(pgd)
>  #define p4d_alloc_track(mm, pgd, address, mask)	(pgd)
>  #define p4d_offset(pgd, start)			(pgd)
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 66e0977f970a..ad3b31c5bcc3 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2088,35 +2088,35 @@ static inline pud_t *pud_alloc(struct mm_struct *mm, p4d_t *p4d,
>  		NULL : pud_offset(p4d, address);
>  }
>  
> -static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
> +static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
>  				     unsigned long address,
>  				     pgtbl_mod_mask *mod_mask)
> -
>  {
> -	if (unlikely(pgd_none(*pgd))) {
> -		if (__p4d_alloc(mm, pgd, address))
> +	if (unlikely(p4d_none(*p4d))) {
> +		if (__pud_alloc(mm, p4d, address))
>  			return NULL;
> -		*mod_mask |= PGTBL_PGD_MODIFIED;
> +		*mod_mask |= PGTBL_P4D_MODIFIED;
>  	}
>  
> -	return p4d_offset(pgd, address);
> +	return pud_offset(p4d, address);
>  }
>  
> -#endif /* !__ARCH_HAS_5LEVEL_HACK */
> -
> -static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
> +static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
>  				     unsigned long address,
>  				     pgtbl_mod_mask *mod_mask)
> +
>  {
> -	if (unlikely(p4d_none(*p4d))) {
> -		if (__pud_alloc(mm, p4d, address))
> +	if (unlikely(pgd_none(*pgd))) {
> +		if (__p4d_alloc(mm, pgd, address))
>  			return NULL;
> -		*mod_mask |= PGTBL_P4D_MODIFIED;
> +		*mod_mask |= PGTBL_PGD_MODIFIED;
>  	}
>  
> -	return pud_offset(p4d, address);
> +	return p4d_offset(pgd, address);
>  }
>  
> +#endif /* !__ARCH_HAS_5LEVEL_HACK */
> +
>  static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
>  {
>  	return (unlikely(pud_none(*pud)) && __pmd_alloc(mm, pud, address))?
> -- 
> 2.26.2
> 

-- 
Sincerely yours,
Mike.
