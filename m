Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 914B25B2E6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 04:19:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cWJw01SMzDqVD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 12:19:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HOkM7uUB"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cWHF3b2vzDqQF
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 12:17:44 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 81so5726389pfy.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 19:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=VBA2GtoG6Dte3kaikORSGJ3wczAlTPnz7XIiNbM/Zdc=;
 b=HOkM7uUBvlOhEIPY9n1kkHhVD/PwkjY2d6lyJmFk6r0TegwQpFBapaDIRFZdm6i4ZW
 Cgl6/ObphiITWGYnf+HKOyJhjX23NyLe2vBQaHw1zaqrZrY0T6Pr49m7x8HOocbC9kif
 cGj70/GYgBuT8HKFYm370lGD7YTjDTo0OgTfx66tJO/rasH87KFMc9ZTdX0wgEaXw94b
 dLp8P8rEk1jKMG0JWR8R/bqibg6lF1jlOo1gDrEvyhMRm+hJu1/Tvf84ElvpkCniYAdp
 iTEkZSFAIctnruCZ4zLcCqUbYVTdwcOxgS0+GU75ooofIKSUmseIYw8iKC7gp9Q3nD1N
 L5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=VBA2GtoG6Dte3kaikORSGJ3wczAlTPnz7XIiNbM/Zdc=;
 b=hY6AdlhHInth0pUN3sat4EgWygE/K6dOhHTDQll6Os/rPwJea39DhR95DUKXOHzRhP
 R/rVQdAhV90BX4vFJqYzVFfQlg5NvhMV4RhrBP3eb9QHp0qT665Ilpm8HB/c9IrvMuR+
 KhFzsGrL/OG+CX883O425QMZ0fpFSRoce93zMKZO3AIiNW5CzPfNsVjVFDu0NUMICy9K
 cLEU35Oly9k31ZtBfSLVknwKa8UtID6hTs0MoNDno3YibGdmd4M0CJ2D/fRv6OSbZPW6
 m67Z9KAZw0OT7koK6nEGz8zlf6nU8X7lv2MU1LtnoFT2XjFQKmPcd8iXJVP1SU14BNBD
 diqg==
X-Gm-Message-State: APjAAAXE/Y32l0A6GbyVgJLAqin4pbEbAlYkcGV3K2rfXlZv8SZ1y1wX
 LClvXNW7jPmWaYfzKwporcc=
X-Google-Smtp-Source: APXvYqz57mclmnTH2o4zEbMrswuqvMS7qDMILfhIV0H4o9E7hACWc+VkzF9NqFMZMhygXSDqO+TUnw==
X-Received: by 2002:a63:4d05:: with SMTP id a5mr20546203pgb.19.1561947461418; 
 Sun, 30 Jun 2019 19:17:41 -0700 (PDT)
Received: from localhost ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id w132sm9743907pfd.78.2019.06.30.19.17.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 30 Jun 2019 19:17:40 -0700 (PDT)
Date: Mon, 01 Jul 2019 12:17:26 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/mm/radix: Use the right page size for vmemmap
 mapping
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au,
 paulus@samba.org
References: <20190629073829.13095-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190629073829.13095-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1561947331.l5nlocglj3.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh Kumar K.V's on June 29, 2019 5:38 pm:
> Also on hash with 4K PAGE_SIZE make sure we use 4K page size for
> vmemmap.

Can you add a line in the changelog to describe the radix problem
you fixed?

Also I would say the also could be a separate patch?

Thanks,
Nick

>=20
> Fixes: 2bfd65e45e87 ("powerpc/mm/radix: Add radix callbacks for early ini=
t routines")
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/hash_utils.c    |  4 +---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 16 +++++++---------
>  2 files changed, 8 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book=
3s64/hash_utils.c
> index 49f8c8940bd9..54013bbc60aa 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -686,10 +686,8 @@ static void __init htab_init_page_sizes(void)
>  	if (mmu_psize_defs[MMU_PAGE_16M].shift &&
>  	    memblock_phys_mem_size() >=3D 0x40000000)
>  		mmu_vmemmap_psize =3D MMU_PAGE_16M;
> -	else if (mmu_psize_defs[MMU_PAGE_64K].shift)
> -		mmu_vmemmap_psize =3D MMU_PAGE_64K;
>  	else
> -		mmu_vmemmap_psize =3D MMU_PAGE_4K;
> +		mmu_vmemmap_psize =3D mmu_virtual_psize;
>  #endif /* CONFIG_SPARSEMEM_VMEMMAP */
> =20
>  	printk(KERN_DEBUG "Page orders: linear mapping =3D %d, "
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/b=
ook3s64/radix_pgtable.c
> index 60d97fab4de2..03d804a0dc8c 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -529,14 +529,6 @@ void __init radix__early_init_devtree(void)
>  	mmu_psize_defs[MMU_PAGE_64K].shift =3D 16;
>  	mmu_psize_defs[MMU_PAGE_64K].ap =3D 0x5;
>  found:
> -#ifdef CONFIG_SPARSEMEM_VMEMMAP
> -	if (mmu_psize_defs[MMU_PAGE_2M].shift) {
> -		/*
> -		 * map vmemmap using 2M if available
> -		 */
> -		mmu_vmemmap_psize =3D MMU_PAGE_2M;
> -	}
> -#endif /* CONFIG_SPARSEMEM_VMEMMAP */
>  	return;
>  }
> =20
> @@ -601,7 +593,13 @@ void __init radix__early_init_mmu(void)
> =20
>  #ifdef CONFIG_SPARSEMEM_VMEMMAP
>  	/* vmemmap mapping */
> -	mmu_vmemmap_psize =3D mmu_virtual_psize;
> +	if (mmu_psize_defs[MMU_PAGE_2M].shift) {
> +		/*
> +		 * map vmemmap using 2M if available
> +		 */
> +		mmu_vmemmap_psize =3D MMU_PAGE_2M;
> +	} else
> +		mmu_vmemmap_psize =3D mmu_virtual_psize;
>  #endif
>  	/*
>  	 * initialize page table size
> --=20
> 2.21.0
>=20
>=20
=
