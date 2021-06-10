Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5E73A36CF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 00:04:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1J0R4GS3z30L4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 08:04:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=JWg+zYR6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=hughd@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=JWg+zYR6; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1Hzw6v6Lz2xvF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 08:03:39 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id
 j11-20020a9d738b0000b02903ea3c02ded8so1226363otk.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 15:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=GY9RAZaI7ITlgwpiw8jjLqwP+elTG/6PQPnKMU2YGT8=;
 b=JWg+zYR6Uu6/BlfR25Ll9JTZID7RwKEIoaAKZIXkczUhdx/t+kjUPVavuMf1NASHjZ
 yB4tCMFkt+sd9fM34FvYxmrvDF6LHXjggIrp8ji9Ex/xy/Ngt6I5laf7d4SVYuNh3oFg
 ltFFHvUnltxQwuyyKu0JqFOVVsH6J0F+yItBbc6lymYGNKtMhgcr9RVzEAmbg+iKq4Y0
 ykWcwkx5Om82C/QN/isLdmYf0AKdb62pQYTXYxgENm6FdETYB+JEapEu3gnlkKn6xVxm
 kRZG6UiTenR28rO0AOsTK88oL+xO1Q7jdIx+uZ1wcx9O+QXBJo43G01FfAJMO/eNttzA
 ER8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=GY9RAZaI7ITlgwpiw8jjLqwP+elTG/6PQPnKMU2YGT8=;
 b=SOxVzueRv4ZSiOuu1tggREYQJrUJzy40LQ8PHHQzlaBZAGOO/yt6kDmg22hLRoOHv+
 H7flVtbZNNXKJMiZEzspN/Y/s4rAEz5c6jrd/MNPBK55qaW1IaieOmAWoYPax/LVjvlB
 n27ddeEDMegaIgyYYaJWWHxpf+Qg9P2S/K7iTRBYAXBaxWAAZ5/WtvBCfI9CP0dBcLl3
 k5y95XPn7N03I8Dg7VWChiLe/iq94VV9gtNXuIgU265tpZBG2c845tZfGqCPieD7iKdP
 KX7SXYjFUTEFvj7gZDUg24199keg0UykTcqLASGbYmeGEYmJdR84l7ounKPMstPGCd2c
 RmjA==
X-Gm-Message-State: AOAM5337JsMSvR7qtMZ1G1woIbGDjlNSgtEv11TZxjAye/xj6BTK04t2
 qq5/2/HHXkxqksBKv3elV5cEbQ==
X-Google-Smtp-Source: ABdhPJycY5pLLmjSi9RZPmxUk3udabhupGfM83uyJIsWYn7btK6P9qlXRM+sAxdfP5zZf/1yI2uqwg==
X-Received: by 2002:a05:6830:1396:: with SMTP id
 d22mr406237otq.55.1623362615705; 
 Thu, 10 Jun 2021 15:03:35 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id i4sm827138oth.38.2021.06.10.15.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 15:03:35 -0700 (PDT)
Date: Thu, 10 Jun 2021 15:03:30 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH 3/6] mm/mremap: Convert huge PUD move to separate
 helper
In-Reply-To: <20210610083549.386085-4-aneesh.kumar@linux.ibm.com>
Message-ID: <33ccb884-74b2-7847-a6d2-3dbcf59f4b5@google.com>
References: <20210610083549.386085-1-aneesh.kumar@linux.ibm.com>
 <20210610083549.386085-4-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, npiggin@gmail.com,
 linux-mm@kvack.org, kaleshsingh@google.com, joel@joelfernandes.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 10 Jun 2021, Aneesh Kumar K.V wrote:

> With TRANSPARENT_HUGEPAGE_PUD enabled the kernel can find huge PUD entries.
> Add a helper to move huge PUD entries on mremap().
> 
> This will be used by a later patch to optimize mremap of PUD_SIZE aligned
> level 4 PTE mapped address
> 
> This also make sure we support mremap on huge PUD entries even with
> CONFIG_HAVE_MOVE_PUD disabled.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/mremap.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 73 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 47c255b60150..92ab7d24a587 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -324,10 +324,62 @@ static inline bool move_normal_pud(struct vm_area_struct *vma,
>  }
>  #endif
>  
> +
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE_PUD

Should that say
#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
?

(I'm a PUD-THP-sceptic, but if it's just for DAX then probably okay.)

> +static bool move_huge_pud(struct vm_area_struct *vma, unsigned long old_addr,
> +			  unsigned long new_addr, pud_t *old_pud, pud_t *new_pud)
> +{
> +	spinlock_t *old_ptl, *new_ptl;
> +	struct mm_struct *mm = vma->vm_mm;
> +	pud_t pud;
> +
> +	/*
> +	 * The destination pud shouldn't be established, free_pgtables()
> +	 * should have released it.
> +	 */
> +	if (WARN_ON_ONCE(!pud_none(*new_pud)))
> +		return false;
> +
> +	/*
> +	 * We don't have to worry about the ordering of src and dst
> +	 * ptlocks because exclusive mmap_lock prevents deadlock.
> +	 */
> +	old_ptl = pud_lock(vma->vm_mm, old_pud);
> +	new_ptl = pud_lockptr(mm, new_pud);
> +	if (new_ptl != old_ptl)
> +		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
> +
> +	/* Clear the pud */
> +	pud = *old_pud;
> +	pud_clear(old_pud);
> +
> +	VM_BUG_ON(!pud_none(*new_pud));
> +
> +	/* Set the new pud */
> +	/* mark soft_ditry when we add pud level soft dirty support */
> +	set_pud_at(mm, new_addr, new_pud, pud);
> +	flush_pud_tlb_range(vma, old_addr, old_addr + HPAGE_PUD_SIZE);
> +	if (new_ptl != old_ptl)
> +		spin_unlock(new_ptl);
> +	spin_unlock(old_ptl);
> +
> +	return true;
> +}
> +#else
> +static bool move_huge_pud(struct vm_area_struct *vma, unsigned long old_addr,
> +			  unsigned long new_addr, pud_t *old_pud, pud_t *new_pud)
> +{
> +	WARN_ON_ONCE(1);
> +	return false;
> +
> +}
> +#endif
> +
>  enum pgt_entry {
>  	NORMAL_PMD,
>  	HPAGE_PMD,
>  	NORMAL_PUD,
> +	HPAGE_PUD,
>  };
>  
>  /*
> @@ -347,6 +399,7 @@ static __always_inline unsigned long get_extent(enum pgt_entry entry,
>  		mask = PMD_MASK;
>  		size = PMD_SIZE;
>  		break;
> +	case HPAGE_PUD:
>  	case NORMAL_PUD:
>  		mask = PUD_MASK;
>  		size = PUD_SIZE;
> @@ -395,6 +448,11 @@ static bool move_pgt_entry(enum pgt_entry entry, struct vm_area_struct *vma,
>  			move_huge_pmd(vma, old_addr, new_addr, old_entry,
>  				      new_entry);
>  		break;
> +	case HPAGE_PUD:
> +		moved = move_huge_pud(vma, old_addr, new_addr, old_entry,
> +				      new_entry);
> +		break;
> +
>  	default:
>  		WARN_ON_ONCE(1);
>  		break;
> @@ -414,6 +472,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
>  	unsigned long extent, old_end;
>  	struct mmu_notifier_range range;
>  	pmd_t *old_pmd, *new_pmd;
> +	pud_t *old_pud, *new_pud;
>  
>  	old_end = old_addr + len;
>  	flush_cache_range(vma, old_addr, old_end);
> @@ -429,15 +488,22 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
>  		 * PUD level if possible.
>  		 */
>  		extent = get_extent(NORMAL_PUD, old_addr, old_end, new_addr);
> -		if (IS_ENABLED(CONFIG_HAVE_MOVE_PUD) && extent == PUD_SIZE) {
> -			pud_t *old_pud, *new_pud;
>  
> -			old_pud = get_old_pud(vma->vm_mm, old_addr);
> -			if (!old_pud)
> +		old_pud = get_old_pud(vma->vm_mm, old_addr);
> +		if (!old_pud)
> +			continue;
> +		new_pud = alloc_new_pud(vma->vm_mm, vma, new_addr);
> +		if (!new_pud)
> +			break;
> +		if (pud_trans_huge(*old_pud) || pud_devmap(*old_pud)) {
> +			if (extent == HPAGE_PUD_SIZE) {
> +				move_pgt_entry(HPAGE_PUD, vma, old_addr, new_addr,
> +					       old_pud, new_pud, need_rmap_locks);
> +				/* We ignore and continue on error? */
>  				continue;
> -			new_pud = alloc_new_pud(vma->vm_mm, vma, new_addr);
> -			if (!new_pud)
> -				break;
> +			}
> +		} else if (IS_ENABLED(CONFIG_HAVE_MOVE_PUD) && extent == PUD_SIZE) {
> +
>  			if (move_pgt_entry(NORMAL_PUD, vma, old_addr, new_addr,
>  					   old_pud, new_pud, need_rmap_locks))
>  				continue;
> -- 
> 2.31.1
> 
> 
> 
