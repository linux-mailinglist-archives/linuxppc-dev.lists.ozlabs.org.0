Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFDF46E5F0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 10:50:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8q6M6ZcHz3cCr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 20:50:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hSPPIGtT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hSPPIGtT; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8q5k3fprz2xWr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 20:50:16 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id iq11so4025689pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 01:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=dflFa57KzKY7miq+oyqL8dKoeanSyMiQ37rQN5fCdoo=;
 b=hSPPIGtTqBk+SmIs7bjQkgAd5gyMcHBS3ZjLqd+5UqIjZ17nfbytSiaBWT8xWtdKxi
 6y5NybwuBgMxW03+gjYkLqtgAjWrl6CPBoMeE3YkLBvk59H1XlB+NAhh7ymmfCFTmT5G
 VYYQgAn+eV3uoQUzoDZ65L62QhWGznavzTEhpPr/K2H8FbWfMlV3cijHGTUteCzCFmXO
 Ta+ZnlYSBlpp4c4BL4oARIkInvSme3Z4IoifXmF/knJdxvFJJWYUG6C0L+k/TLFQH++q
 Ki7++aPkAX5x4uAT2XFfODKECO0xvS6IwICKeCe3FvH8wzNjbKORxujyV48thLG3F51V
 4AZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=dflFa57KzKY7miq+oyqL8dKoeanSyMiQ37rQN5fCdoo=;
 b=Oc8D4HQdOgPtt29GQKcmaEIt7GCEr6HTPSO+EaPo7pfWnf44PE/npLhXy6/5l/SShP
 5cZiNbQwQhuWNG7FkVE4C4UfcMs5TpnVeO0hn7YeQqfL+H6VX6+H8L5PWOPMK4sjixQ3
 mwEQAjTKKCmP5+/tbx8zlr9lIQX2ROvwdzgS8PFk9WCtHLRiXLk+fHPaDc9+gvx/aUDm
 EqdJ30M4kZCekiANcveQex/q11x1e1PoO6mhS1ox2oJbJk2xE+khO63oLj2QbD+ymjSV
 a7QUVkx1803i9uMsMAsQo0Mlu4dQpHBI0c09zgrmrotJZ/9Uf/4jflVgWmoZoddkiWVA
 stKA==
X-Gm-Message-State: AOAM530RvEIXLbfj5Iry5aCQDtMFskwBC/03uDAJKEtUPGaxXb0y+afx
 S3v/ivOBATbh2A5Q7UVIghU=
X-Google-Smtp-Source: ABdhPJyY2fdAACtiJPICzx8niudtj7D9tiYJtKmUUH+J5Ymcu4yJcVh8uUq3Z3w9yYkhJiN/99VgAA==
X-Received: by 2002:a17:903:185:b0:141:f5f3:dae with SMTP id
 z5-20020a170903018500b00141f5f30daemr66362344plg.56.1639043413657; 
 Thu, 09 Dec 2021 01:50:13 -0800 (PST)
Received: from localhost (203-219-139-206.static.tpgi.com.au.
 [203.219.139.206])
 by smtp.gmail.com with ESMTPSA id f15sm7099488pfe.171.2021.12.09.01.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 01:50:13 -0800 (PST)
Date: Thu, 09 Dec 2021 19:50:07 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 06/10] powerpc/mm: Use generic_get_unmapped_area() and
 call it from arch_get_unmapped_area()
To: "alex@ghiti.fr" <alex@ghiti.fr>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
 <8f54a8d097c402d808147b2044365ebfda2862dd.1638976229.git.christophe.leroy@csgroup.eu>
In-Reply-To: <8f54a8d097c402d808147b2044365ebfda2862dd.1638976229.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1639042828.6q5z2bujam.astroid@bobo.none>
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
> Use the generic version of arch_get_unmapped_area() which
> is now available at all time instead of its copy
> radix__arch_get_unmapped_area()
>=20
> Instead of setting mm->get_unmapped_area() to either
> arch_get_unmapped_area() or generic_get_unmapped_area(),
> always set it to arch_get_unmapped_area() and call
> generic_get_unmapped_area() from there when radix is enabled.
>=20
> Do the same with radix__arch_get_unmapped_area_topdown()
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/mmap.c | 127 ++---------------------------------------
>  1 file changed, 6 insertions(+), 121 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/mmap.c b/arch/powerpc/mm/mmap.c
> index 9b0d6e395bc0..46781d0103d1 100644
> --- a/arch/powerpc/mm/mmap.c
> +++ b/arch/powerpc/mm/mmap.c
> @@ -81,115 +81,15 @@ static inline unsigned long mmap_base(unsigned long =
rnd,
>  }
> =20
>  #ifdef HAVE_ARCH_UNMAPPED_AREA
> -#ifdef CONFIG_PPC_RADIX_MMU
> -/*
> - * Same function as generic code used only for radix, because we don't n=
eed to overload
> - * the generic one. But we will have to duplicate, because hash select
> - * HAVE_ARCH_UNMAPPED_AREA
> - */
> -static unsigned long
> -radix__arch_get_unmapped_area(struct file *filp, unsigned long addr,
> -			     unsigned long len, unsigned long pgoff,
> -			     unsigned long flags)
> -{
> -	struct mm_struct *mm =3D current->mm;
> -	struct vm_area_struct *vma;
> -	int fixed =3D (flags & MAP_FIXED);
> -	unsigned long high_limit;
> -	struct vm_unmapped_area_info info;
> -
> -	high_limit =3D DEFAULT_MAP_WINDOW;
> -	if (addr >=3D high_limit || (fixed && (addr + len > high_limit)))
> -		high_limit =3D TASK_SIZE;

Does 64s radix need to define arch_get_mmap_end() to do the above now?

Otherwise great to consolidate this with core code, nice patch.

Thanks,
Nick

