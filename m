Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE81C46E5AE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 10:37:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8ppS4MCWz30CK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 20:37:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b2ViHkJC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=b2ViHkJC; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8pnk3Xjrz300S
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 20:36:24 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so4338990pjq.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 01:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ANnqQo7YlVyJRVO2UBynpUD5QgJ1sL4B6Gna7gav4x0=;
 b=b2ViHkJCp5m2+2YQHTPTBDm3RXv4V9ziuzsBvMmlYIRLLAOHKjnI0TyaxmWM0mwzzE
 sTEowXvVIH/XHfcRygVyF9S8R03oieKXkXP5ZrR1GTIuxfMMkJCH4KHjcm/Cv4Mw8q/u
 Op5FnGErqqIGrcCx3n5EE/Yv9ta4UdDVjhZUSZqoDm9WA5EUH+2TehBUWdv/4vh2myyy
 casRoLbcXeK4OYu0zE04pKOKQk5SoMBTi/Fckg/qDnwjpvDErFnYp6eUxL4M7cNHZzAM
 PrMt9U5KCKplnJmehYc13wsAimamkDxvhE6PJAWFf4JnU7sPBWrStGm4CPeMcyoziKWp
 b99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ANnqQo7YlVyJRVO2UBynpUD5QgJ1sL4B6Gna7gav4x0=;
 b=kiyCU7i55Loi7q06C3dUX4dNvH5S4dS+DAIIhPttgYSevKT91NV8fGfEKCGr3AtMhl
 QH4m8yOplYk9/PVgv48ZCqWX973/0uqhl/dM5GCJ+HG0H/jQxtvZ3FgNL55SCS6A+G7a
 TbeVwhhuN1vrL44uuwYTO09smVK09tWPLChMQErwpofUtkMkhH+xiIpfpoWPKGlnqnQK
 27QxRNCnEQFiCscY9qEnqbk1Qq+P3hdvHAsbNa+9RsrXa0Ptf7pGOKqPqXZEhKTfNcVy
 xdEpLd7kgeLo6EgHAsTg1NyWFoSs/QshOlKVT0SVkODrzdVKRFZfHXbjzLe2Ezi9A96l
 MLyQ==
X-Gm-Message-State: AOAM533Cch77ArYcgFDeq6lxpOM/qzOohuoRca/B1mBfnycQYBdU2hz1
 gnCMyjM5SlkxKamtJA7PkLc=
X-Google-Smtp-Source: ABdhPJxAboP2NZuRVxFnuWAZ/4Plf9uJs6kjYeQI3ZWn5Gl+RspeZdtlIldC9e6K060mWaNM2FrOMA==
X-Received: by 2002:a17:90a:b88d:: with SMTP id
 o13mr14105935pjr.39.1639042581800; 
 Thu, 09 Dec 2021 01:36:21 -0800 (PST)
Received: from localhost (203-219-139-206.static.tpgi.com.au.
 [203.219.139.206])
 by smtp.gmail.com with ESMTPSA id g7sm6435078pfv.159.2021.12.09.01.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 01:36:21 -0800 (PST)
Date: Thu, 09 Dec 2021 19:36:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 03/10] powerpc/mm: Move vma_mmu_pagesize()
To: "alex@ghiti.fr" <alex@ghiti.fr>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
 <372d1488c35dca1c5af04f95d9b8548ea07ea603.1638976229.git.christophe.leroy@csgroup.eu>
In-Reply-To: <372d1488c35dca1c5af04f95d9b8548ea07ea603.1638976229.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1639042485.7qs1vmt7kw.astroid@bobo.none>
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of December 9, 2021 3:18 am:
> vma_mmu_pagesize() is only required for slices,
> otherwise there is a generic weak version doing the
> exact same thing.
>=20
> Move it to slice.c
>=20

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/hugetlbpage.c | 11 -----------
>  arch/powerpc/mm/slice.c       |  9 +++++++++
>  2 files changed, 9 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.=
c
> index ddead41e2194..0eec3b61bd13 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -565,17 +565,6 @@ unsigned long hugetlb_get_unmapped_area(struct file =
*file, unsigned long addr,
>  }
>  #endif
> =20
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
> diff --git a/arch/powerpc/mm/slice.c b/arch/powerpc/mm/slice.c
> index f42711f865f3..8a3ac062b71e 100644
> --- a/arch/powerpc/mm/slice.c
> +++ b/arch/powerpc/mm/slice.c
> @@ -759,4 +759,13 @@ int slice_is_hugepage_only_range(struct mm_struct *m=
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
>  #endif
> --=20
> 2.33.1
>=20
>=20
