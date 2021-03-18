Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E978634010F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 09:34:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1L1B6QpXz3bxV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 19:34:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SXs/Ib/p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SXs/Ib/p; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1L0l71yRz300T
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 19:34:14 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id v23so922326ple.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 01:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=0XbdwMWWufgj6NUQLxw9YImq1OekOBff1KvMfVrfHNo=;
 b=SXs/Ib/pMOk7phuZJcvHN4wVcGCtwINMVwn1wwU6lKL/PGVGrDQvSRTowU18z1OmQX
 lLoJN7Wvi2GBlHsf+OEKhy6xll+r8E0Nxk1dcQH7UhYp6/i+NTBFVxpFH+JZB8zgjUAR
 TSi0z6CH+xB3N13HkYr3YfagXfQYTgJSkyYuiu2CuffFC53k05aS/GXwtfgoBRKxHAgx
 +ltEWChcmK33tCIQLHD+T1hmECn7udx/KsGbgnvhXAmbt6DGFzTYbNdsXatmAnsMOiBO
 C2eLrCy2D+T37FYeQIqbgz8KLHDM4kajQg/lGjsi0x68NXtSNJakFBCOMICTAk8jmR8w
 fC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=0XbdwMWWufgj6NUQLxw9YImq1OekOBff1KvMfVrfHNo=;
 b=ftaVao5/bFdJt+fpqhvF8ROMMDKFPo01d2Ch/CI3l5LFdh0LuTaTKPQH6TAARPkCc3
 xBxFfVNoQibvKWuhZCQ2PcacgRXR+euw04wWFgrlmfwI2MfjsnXiR6QMPzOxQyyjtDzI
 BS4W3H1BdkognBiIU7+xgq/x2oJK+m/eX/jT5N+DevdQWpCZ56CkS7VZiufWEoIC5kUH
 4s1Qn79dXVuAD/tkQ9DUoJOIjSuEOFDaSN+COxzoVI6cNk6sCHkBUxqR2THxh57VFuqR
 vJcAZdEnQaLsD4auNkVodA1o2It8QJ7pTXpQl/IypeuK1f5Nrm5FZJi1OZKYKyod1Ucj
 RG1w==
X-Gm-Message-State: AOAM530emKnd2+sVGLt6fonB0IxczEZMfMkHDXVDKu5FRLnVmV5nQ20p
 1ElLly4yMqcneybJL5/XYXw=
X-Google-Smtp-Source: ABdhPJwfd5EflkG/PVmx84xxWArOhYCl9X6OHIHiIlDclMqFRHTsl6I4M/igQJjX6vhTp7rahNpyLw==
X-Received: by 2002:a17:90a:e556:: with SMTP id
 ei22mr3090811pjb.214.1616056450380; 
 Thu, 18 Mar 2021 01:34:10 -0700 (PDT)
Received: from localhost ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id h19sm1620635pfc.172.2021.03.18.01.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 01:34:09 -0700 (PDT)
Date: Thu, 18 Mar 2021 18:34:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 4/6] mm/mremap: Use mmu gather interface instead of
 flush_tlb_range
To: akpm@linux-foundation.org, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org
References: <20210315113824.270796-1-aneesh.kumar@linux.ibm.com>
 <20210315113824.270796-5-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210315113824.270796-5-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1616056158.oq9i3fvoxn.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: joel@joelfernandes.org, peterz@infradead.org, linuxppc-dev@lists.ozlabs.org,
 kaleshsingh@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Aneesh Kumar K.V's message of March 15, 2021 9:38 pm:
> Some architectures do have the concept of page walk cache and only mmu ga=
ther
> interface supports flushing them. A fast mremap that involves moving page
> table pages instead of copying pte entries should flush page walk cache s=
ince
> the old translation cache is no more valid. Hence switch to mm gather to =
flush
> TLB and mark tlb.freed_tables =3D 1. No page table pages need to be freed=
 here.
> With this the tlb flush is done outside page table lock (ptl).

I would maybe just get archs that implement it to provide a specific
flush_tlb+pwc_range for it, or else they get flush_tlb_range by default.

I think that would be simpler for now, at least in generic code.

There was some other talk of consolidating the TLB flush APIs, I jsut=20
don't know if it's the best way to go to use the page/page table=20
gathering and freeing API for it.

Thanks,
Nick

>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/mremap.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
>=20
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 574287f9bb39..fafa73b965d3 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -216,6 +216,7 @@ static bool move_normal_pmd(struct vm_area_struct *vm=
a, unsigned long old_addr,
>  {
>  	spinlock_t *old_ptl, *new_ptl;
>  	struct mm_struct *mm =3D vma->vm_mm;
> +	struct mmu_gather tlb;
>  	pmd_t pmd;
> =20
>  	/*
> @@ -244,11 +245,12 @@ static bool move_normal_pmd(struct vm_area_struct *=
vma, unsigned long old_addr,
>  	if (WARN_ON_ONCE(!pmd_none(*new_pmd)))
>  		return false;
> =20
> +	tlb_gather_mmu(&tlb, mm);
>  	/*
>  	 * We don't have to worry about the ordering of src and dst
>  	 * ptlocks because exclusive mmap_lock prevents deadlock.
>  	 */
> -	old_ptl =3D pmd_lock(vma->vm_mm, old_pmd);
> +	old_ptl =3D pmd_lock(mm, old_pmd);
>  	new_ptl =3D pmd_lockptr(mm, new_pmd);
>  	if (new_ptl !=3D old_ptl)
>  		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
> @@ -257,13 +259,23 @@ static bool move_normal_pmd(struct vm_area_struct *=
vma, unsigned long old_addr,
>  	pmd =3D *old_pmd;
>  	pmd_clear(old_pmd);
> =20
> +	/*
> +	 * Mark the range. We are not freeing page table pages nor
> +	 * regular pages. Hence we don't need to call tlb_remove_table()
> +	 * or tlb_remove_page().
> +	 */
> +	tlb_flush_pte_range(&tlb, old_addr, PMD_SIZE);
> +	tlb.freed_tables =3D 1;
>  	VM_BUG_ON(!pmd_none(*new_pmd));
>  	pmd_populate(mm, new_pmd, (pgtable_t)pmd_page_vaddr(pmd));
> =20
> -	flush_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
>  	if (new_ptl !=3D old_ptl)
>  		spin_unlock(new_ptl);
>  	spin_unlock(old_ptl);
> +	/*
> +	 * This will invalidate both the old TLB and page table walk caches.
> +	 */
> +	tlb_finish_mmu(&tlb);
> =20
>  	return true;
>  }
> @@ -282,6 +294,7 @@ static bool move_normal_pud(struct vm_area_struct *vm=
a, unsigned long old_addr,
>  {
>  	spinlock_t *old_ptl, *new_ptl;
>  	struct mm_struct *mm =3D vma->vm_mm;
> +	struct mmu_gather tlb;
>  	pud_t pud;
> =20
>  	/*
> @@ -291,11 +304,12 @@ static bool move_normal_pud(struct vm_area_struct *=
vma, unsigned long old_addr,
>  	if (WARN_ON_ONCE(!pud_none(*new_pud)))
>  		return false;
> =20
> +	tlb_gather_mmu(&tlb, mm);
>  	/*
>  	 * We don't have to worry about the ordering of src and dst
>  	 * ptlocks because exclusive mmap_lock prevents deadlock.
>  	 */
> -	old_ptl =3D pud_lock(vma->vm_mm, old_pud);
> +	old_ptl =3D pud_lock(mm, old_pud);
>  	new_ptl =3D pud_lockptr(mm, new_pud);
>  	if (new_ptl !=3D old_ptl)
>  		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
> @@ -304,14 +318,25 @@ static bool move_normal_pud(struct vm_area_struct *=
vma, unsigned long old_addr,
>  	pud =3D *old_pud;
>  	pud_clear(old_pud);
> =20
> +	/*
> +	 * Mark the range. We are not freeing page table pages nor
> +	 * regular pages. Hence we don't need to call tlb_remove_table()
> +	 * or tlb_remove_page().
> +	 */
> +	tlb_flush_pte_range(&tlb, old_addr, PUD_SIZE);
> +	tlb.freed_tables =3D 1;
>  	VM_BUG_ON(!pud_none(*new_pud));
> =20
>  	pud_populate(mm, new_pud, (pmd_t *)pud_page_vaddr(pud));
> -	flush_tlb_range(vma, old_addr, old_addr + PUD_SIZE);
> +
>  	if (new_ptl !=3D old_ptl)
>  		spin_unlock(new_ptl);
>  	spin_unlock(old_ptl);
> =20
> +	/*
> +	 * This will invalidate both the old TLB and page table walk caches.
> +	 */
> +	tlb_finish_mmu(&tlb);
>  	return true;
>  }
>  #else
> --=20
> 2.29.2
>=20
>=20
