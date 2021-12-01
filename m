Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8972D4646CC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 06:43:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3p182xZbz3bXP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 16:43:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kDOLZHEW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kDOLZHEW; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3p0P6WRFz2yNT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 16:43:15 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 71so22411735pgb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 21:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=x0h7CBSqiRg5nLz099L4J/OLAxGA0MVHDsDDhQWf8jo=;
 b=kDOLZHEW6OOk8oHT3leTypK5OgDpsYL3HEJCWgeWLrpqT8eQqbbdV0GPT0Y8OXXrTl
 yhet9EQRNXUetju6kqUuD74WTXmNXkJkVc7eKbE3lPvX+icmcgmTzGHkobPzAyahjocw
 jT/IcYGS8+nGe8BD0hnXR6dvCm+rfICd/KeWM3J3527E5ePZAYox7qNnZwDJ8Y45sxl+
 TqWgjqz7aFVZYmsFaKW8KpGzvRim9dG93+gvcunFW8JKHZ1b1U07Tp93uLPl7Y5kXxOg
 /jqa7YTh7wWnpR/IpT4McCTTN7WVsrok0qLJbd9SwabOiouU6yD3OY9DB4MSu+GYT6dG
 Xedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=x0h7CBSqiRg5nLz099L4J/OLAxGA0MVHDsDDhQWf8jo=;
 b=b6qQl3zjk9FjDY+58npuBBZid2zNFF/MGJQy4ks6Pm0lluVmgDCl4mZ5ce1RUmLTCu
 RHiyMUzpAfYx9ushV/Rk6rwqmqyfJ31OxBQVPYCEyu5gcvB4ytkxwIzyfvMH7TNBA5LE
 iC9KA+ppLFMXyd5LWMO14ybplNjxTWR5/agGACss6tILWU48HmvVV7wxgDYABdkJAehg
 kMHypcCJMFY7k0grgdd7RAuOoX/76+KeB4OV8D6R6X2Or9uWSBQ/xHb96Pijz8yBeb4W
 LmPyDhuBTRaP90nZeh/22wMIjdwvovVwlq2N4G8uGqjkZeKvPjEUAdYt9i2ORrJGziQI
 0Tug==
X-Gm-Message-State: AOAM530UmAzv7FVCnHBxolm7NJC5+abo50r0mMY0mEJsc4lg98yTk+id
 QCwnAPwizkWrnkTzc+fEcl+px/NAtNA=
X-Google-Smtp-Source: ABdhPJyHBKJ7/kMwWTjTJMpvytFrMbjdz7YCj7z8rWZJKLdEOU8IWltURm9hCEAAE2jPSfHm5Ghrqg==
X-Received: by 2002:aa7:88d6:0:b0:49f:dd4b:ddbc with SMTP id
 k22-20020aa788d6000000b0049fdd4bddbcmr3786050pff.31.1638337392658; 
 Tue, 30 Nov 2021 21:43:12 -0800 (PST)
Received: from localhost (115-64-213-93.static.tpgi.com.au. [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id 67sm6113828pgd.0.2021.11.30.21.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 21:43:12 -0800 (PST)
Date: Wed, 01 Dec 2021 15:43:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 rebased 2/9] powerpc/mm: Move vma_mmu_pagesize() and
 hugetlb_get_unmapped_area() to slice.c
To: alex@ghiti.fr, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1637862579.git.christophe.leroy@csgroup.eu>
 <aa992a8fd2e1198d209afceb457b77f6b4d8755c.1637862579.git.christophe.leroy@csgroup.eu>
In-Reply-To: <aa992a8fd2e1198d209afceb457b77f6b4d8755c.1637862579.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1638336766.91gluy2ru8.astroid@bobo.none>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of November 26, 2021 3:52 am:
> vma_mmu_pagesize() is only required for slices,
> otherwise there is a generic weak version.

Fine.

> hugetlb_get_unmapped_area() is dedicated to slices.
> radix__hugetlb_get_unmapped_area() as well.

Hmm, that's interesting. It would be nice if we could just use the=20
generic code version for it but that will require some hacking.

This means my patch series changes behaviour (as in the FIXME) when=20
HASH=3Dn I think? I will have to fix that somehow.

Thanks,
Nick

>=20
> Move them to slice.c
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/book3s/64/hugetlb.h |  4 --
>  arch/powerpc/mm/book3s64/radix_hugetlbpage.c | 55 --------------
>  arch/powerpc/mm/book3s64/slice.c             | 76 ++++++++++++++++++++
>  arch/powerpc/mm/hugetlbpage.c                | 28 --------
>  4 files changed, 76 insertions(+), 87 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/hugetlb.h b/arch/powerpc/=
include/asm/book3s/64/hugetlb.h
> index 12e150e615b7..b37a28f62cf6 100644
> --- a/arch/powerpc/include/asm/book3s/64/hugetlb.h
> +++ b/arch/powerpc/include/asm/book3s/64/hugetlb.h
> @@ -8,10 +8,6 @@
>   */
>  void radix__flush_hugetlb_page(struct vm_area_struct *vma, unsigned long=
 vmaddr);
>  void radix__local_flush_hugetlb_page(struct vm_area_struct *vma, unsigne=
d long vmaddr);
> -extern unsigned long
> -radix__hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
> -				unsigned long len, unsigned long pgoff,
> -				unsigned long flags);
> =20
>  extern void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *v=
ma,
>  						unsigned long addr, pte_t *ptep,
> diff --git a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c b/arch/powerpc/=
mm/book3s64/radix_hugetlbpage.c
> index 23d3e08911d3..d2fb776febb4 100644
> --- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
> +++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
> @@ -41,61 +41,6 @@ void radix__flush_hugetlb_tlb_range(struct vm_area_str=
uct *vma, unsigned long st
>  		radix__flush_tlb_range_psize(vma->vm_mm, start, end, psize);
>  }
> =20
> -/*
> - * A vairant of hugetlb_get_unmapped_area doing topdown search
> - * FIXME!! should we do as x86 does or non hugetlb area does ?
> - * ie, use topdown or not based on mmap_is_legacy check ?
> - */
> -unsigned long
> -radix__hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
> -				unsigned long len, unsigned long pgoff,
> -				unsigned long flags)
> -{
> -	struct mm_struct *mm =3D current->mm;
> -	struct vm_area_struct *vma;
> -	struct hstate *h =3D hstate_file(file);
> -	int fixed =3D (flags & MAP_FIXED);
> -	unsigned long high_limit;
> -	struct vm_unmapped_area_info info;
> -
> -	high_limit =3D DEFAULT_MAP_WINDOW;
> -	if (addr >=3D high_limit || (fixed && (addr + len > high_limit)))
> -		high_limit =3D TASK_SIZE;
> -
> -	if (len & ~huge_page_mask(h))
> -		return -EINVAL;
> -	if (len > high_limit)
> -		return -ENOMEM;
> -
> -	if (fixed) {
> -		if (addr > high_limit - len)
> -			return -ENOMEM;
> -		if (prepare_hugepage_range(file, addr, len))
> -			return -EINVAL;
> -		return addr;
> -	}
> -
> -	if (addr) {
> -		addr =3D ALIGN(addr, huge_page_size(h));
> -		vma =3D find_vma(mm, addr);
> -		if (high_limit - len >=3D addr && addr >=3D mmap_min_addr &&
> -		    (!vma || addr + len <=3D vm_start_gap(vma)))
> -			return addr;
> -	}
> -	/*
> -	 * We are always doing an topdown search here. Slice code
> -	 * does that too.
> -	 */
> -	info.flags =3D VM_UNMAPPED_AREA_TOPDOWN;
> -	info.length =3D len;
> -	info.low_limit =3D max(PAGE_SIZE, mmap_min_addr);
> -	info.high_limit =3D mm->mmap_base + (high_limit - DEFAULT_MAP_WINDOW);
> -	info.align_mask =3D PAGE_MASK & ~huge_page_mask(h);
> -	info.align_offset =3D 0;
> -
> -	return vm_unmapped_area(&info);
> -}
> -
>  void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
>  					 unsigned long addr, pte_t *ptep,
>  					 pte_t old_pte, pte_t pte)
> diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/=
slice.c
> index c83be371c6e7..4c3e9601fdf6 100644
> --- a/arch/powerpc/mm/book3s64/slice.c
> +++ b/arch/powerpc/mm/book3s64/slice.c
> @@ -777,4 +777,80 @@ int slice_is_hugepage_only_range(struct mm_struct *m=
m, unsigned long addr,
> =20
>  	return !slice_check_range_fits(mm, maskp, addr, len);
>  }
> +
> +unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
> +{
> +	/* With radix we don't use slice, so derive it from vma*/
> +	if (radix_enabled())
> +		return vma_kernel_pagesize(vma);
> +
> +	return 1UL << mmu_psize_to_shift(get_slice_psize(vma->vm_mm, vma->vm_st=
art));
> +}
> +
> +/*
> + * A variant of hugetlb_get_unmapped_area() doing topdown search
> + * FIXME!! should we do as x86 does or non hugetlb area does ?
> + * ie, use topdown or not based on mmap_is_legacy check ?
> + */
> +static unsigned long
> +radix__hugetlb_get_unmapped_area(struct file *file, unsigned long addr, =
unsigned long len,
> +				 unsigned long pgoff, unsigned long flags)
> +{
> +	struct mm_struct *mm =3D current->mm;
> +	struct vm_area_struct *vma;
> +	struct hstate *h =3D hstate_file(file);
> +	int fixed =3D (flags & MAP_FIXED);
> +	unsigned long high_limit;
> +	struct vm_unmapped_area_info info;
> +
> +	high_limit =3D DEFAULT_MAP_WINDOW;
> +	if (addr >=3D high_limit || (fixed && (addr + len > high_limit)))
> +		high_limit =3D TASK_SIZE;
> +
> +	if (len & ~huge_page_mask(h))
> +		return -EINVAL;
> +	if (len > high_limit)
> +		return -ENOMEM;
> +
> +	if (fixed) {
> +		if (addr > high_limit - len)
> +			return -ENOMEM;
> +		if (prepare_hugepage_range(file, addr, len))
> +			return -EINVAL;
> +		return addr;
> +	}
> +
> +	if (addr) {
> +		addr =3D ALIGN(addr, huge_page_size(h));
> +		vma =3D find_vma(mm, addr);
> +		if (high_limit - len >=3D addr && addr >=3D mmap_min_addr &&
> +		    (!vma || addr + len <=3D vm_start_gap(vma)))
> +			return addr;
> +	}
> +	/*
> +	 * We are always doing an topdown search here. Slice code
> +	 * does that too.
> +	 */
> +	info.flags =3D VM_UNMAPPED_AREA_TOPDOWN;
> +	info.length =3D len;
> +	info.low_limit =3D max(PAGE_SIZE, mmap_min_addr);
> +	info.high_limit =3D mm->mmap_base + (high_limit - DEFAULT_MAP_WINDOW);
> +	info.align_mask =3D PAGE_MASK & ~huge_page_mask(h);
> +	info.align_offset =3D 0;
> +
> +	return vm_unmapped_area(&info);
> +}
> +
> +unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long=
 addr,
> +					unsigned long len, unsigned long pgoff,
> +					unsigned long flags)
> +{
> +	struct hstate *hstate =3D hstate_file(file);
> +	int mmu_psize =3D shift_to_mmu_psize(huge_page_shift(hstate));
> +
> +	if (radix_enabled())
> +		return radix__hugetlb_get_unmapped_area(file, addr, len, pgoff, flags)=
;
> +
> +	return slice_get_unmapped_area(addr, len, flags, mmu_psize, 1);
> +}
>  #endif
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.=
c
> index 82d8b368ca6d..eb9de09e49a3 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -542,34 +542,6 @@ struct page *follow_huge_pd(struct vm_area_struct *v=
ma,
>  	return page;
>  }
> =20
> -#ifdef CONFIG_PPC_MM_SLICES
> -unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long=
 addr,
> -					unsigned long len, unsigned long pgoff,
> -					unsigned long flags)
> -{
> -	struct hstate *hstate =3D hstate_file(file);
> -	int mmu_psize =3D shift_to_mmu_psize(huge_page_shift(hstate));
> -
> -#ifdef CONFIG_PPC_RADIX_MMU
> -	if (radix_enabled())
> -		return radix__hugetlb_get_unmapped_area(file, addr, len,
> -						       pgoff, flags);
> -#endif
> -	return slice_get_unmapped_area(addr, len, flags, mmu_psize, 1);
> -}
> -#endif
> -
> -unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
> -{
> -	/* With radix we don't use slice, so derive it from vma*/
> -	if (IS_ENABLED(CONFIG_PPC_MM_SLICES) && !radix_enabled()) {
> -		unsigned int psize =3D get_slice_psize(vma->vm_mm, vma->vm_start);
> -
> -		return 1UL << mmu_psize_to_shift(psize);
> -	}
> -	return vma_kernel_pagesize(vma);
> -}
> -
>  bool __init arch_hugetlb_valid_size(unsigned long size)
>  {
>  	int shift =3D __ffs(size);
> --=20
> 2.33.1
>=20
>=20
>=20
