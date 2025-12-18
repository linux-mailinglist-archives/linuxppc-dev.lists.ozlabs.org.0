Return-Path: <linuxppc-dev+bounces-14881-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B20E2CCD04F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 18:50:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXJ9g0mvqz2xrM;
	Fri, 19 Dec 2025 04:50:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766080246;
	cv=none; b=RgJoorS+4hjcvsbFCzo/gBLOErnjjIX0NQcsyTFdEpNNnZTRMTDjCMMzgjHh1vkR/SjtCjWxHAv7qfQ78UBxI4bWHLVvmxwwu16nxvc++duS6Vp6xDQzx5NnMxXSOmPrWsKch+iNA/6u94tqQ2qwAkomdER0Jq2OlGzAatW0UChzbWTLX0EYdYIDGziJGQP1ScHyMVB/+wLiXBZ/64Y53VSy6FofsclKfzRq7wcphTdv2UDDNGJM+v/q2uzF3ey2XYyEpMcPdLM7MqMGnWXO0/iSGYBXQpKwExr7o7Jg5Bu7KoMGlAtp/559ewJoGLwmlGNTGLeBysWmJOrmzRt4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766080246; c=relaxed/relaxed;
	bh=xEGX9NCRxVFvkAo1SyCOWmoT8Y8UVkLNsscKPRE6j7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XdBaw7eAotcqQl182a1SSl2bVyISHW+JOi+H2PXagx8aJiCl6kelamRpffsxipRnaTSm05qwn7B0v9i/kKaP7cZzLK41OzxIjiynWVQnVx3A18dEog8T2lbRnXsstPAzw/QwylvqKtL7IA+xJ6TFKAWk7xAfMj/cI61jBtTfVvcKZMM1zthbkVV1GF8JIvMM6Sl0LmkuaXZVMXeuprVKAGbPQnJatbeijoKQPoTIPzBjqc4+6kc+8f0natsiLBae9Fg/v6JzgqhYMjp7JjlN/nyq5SKj5w3FbmgQxG0KBJr77WQ1zcddILi9flmMRU5+6JiMVR0RsfR/C16mnulnYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; dkim=pass (2048-bit key; unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=dYnQAE0s; dkim-atps=neutral; spf=pass (client-ip=209.85.208.42; helo=mail-ed1-f42.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org) smtp.mailfrom=soleen.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=dYnQAE0s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=209.85.208.42; helo=mail-ed1-f42.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXJ9d0YPZz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 04:50:44 +1100 (AEDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64981b544a1so1229360a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 09:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766080180; x=1766684980; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEGX9NCRxVFvkAo1SyCOWmoT8Y8UVkLNsscKPRE6j7c=;
        b=dYnQAE0sAmoFUrTOCbu5ujl2S8ONz+7OwHhVKMmAXHdSUw/H7HY3qruHxsww6YjMR4
         I/tFGZS0HIheBwW1JDbhRkVMIIG8EZZ3l1J8sHiCMrj7CUb7wEGEfeyhSt6Dul7nq8Xv
         SvXr5Vijow9B9+cw0NQ9Vo8VGHrDY0oMWhveoSLrbcc40xR7hy5LqU6qZeUQbZKBa5X1
         1WldAwqjn7AioLSuQM4M0X7xebsn8UC/0O9wlWmifIhlfUuDDzhdfiPvleFwrUS9sVAm
         DPiawtRBHiyN77/i/aYCxNrvKDQUlNPOJGE6Cb55C10t6SUkCD2SoRRzzAOsa+d6j9rp
         +2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080180; x=1766684980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xEGX9NCRxVFvkAo1SyCOWmoT8Y8UVkLNsscKPRE6j7c=;
        b=AtkSbA1nVMLE+sChHD/pmeyOEJ9fnJNGOkwWY4coyOIjisYlN3uSvyP9bfxeaUT5VW
         +ctJkuaxXTPnGtQhJcDRlECaGxXL5HxExMX7XWlQqblHk66STaaF5uKuDWphTKwE9A6O
         PuyW21a+Rf8ripttQ79A3sHDGk7a/9fBlfE3Iv+NY4HRBXt5TAJHRNf9RppAZ1h3hhKi
         isoh3wPxXcUVuMqgxbCjI9jnlTm/0/Neo/DzvkoJ8MZ6VR5gCZ3jCf25JOkaV6Ly12Gf
         lX3ACPr6ZQ4Mx9YJfmO+5wwK4h/E8M88KZkeZ5jYoSw+H5/LoV+Mk2L9R5yHhjBqLOo8
         dNLg==
X-Forwarded-Encrypted: i=1; AJvYcCW7txpLb0R6XO3HB7DGj8/d9jOzGQRvRMh59mkTVpd//Qtk/87mbKtk8xcClDoVf0mlW+E6fdOa8g71gSE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzi+WogychuYFu0keRPdFnqbyzABHHXaUAk/b+Vj3piDoj6hJUs
	3Oq9M2rsAUVb3KCULv9063gilZlI6T3UpbinbReVy6u0GItEVUFfCWKLLTZEkG0QFpaRZ2/722K
	cQLSv0bKSHnhaVaCfOBSA1ijB7jlLjg4T0AV3bHPIuA==
X-Gm-Gg: AY/fxX6FXknxTikhUyJ2Usw1lb7maRD9BaExMULS6f0GMwN2i6jFPgvhiFrUeELY6lw
	1UN1NRu0wwF9kqFJ+cUttNUCvxrqpGNskeIoDIgVbI6PNdh0qH05CcfpMGtgGTmfQrwm2tFGVY+
	+ex6gs1LTzFSxfcFBxxA0gvRohfCaJmjIg3ehbisLFBwvEYr7kvX40BVC6qA0s5PZGMOv1SNRkD
	HQVFUoTXml3yCbFfokwHIqYY/WcHUgw8+YwRTJDrkrtEu6M3nxFyVa3lUcwXSGihHvcEKjdyy4W
	HMFtrjtZ9olYoXiQQUytKF+d
X-Google-Smtp-Source: AGHT+IGj1ZcHTui7KBWUYP4FXCtel/5ayalcHtcXFNH9hEXSeqZ0F+Z3lWPo8TWqbx8PXpNtXrjwPKCaynSUAFZ631g=
X-Received: by 2002:a05:6402:1e92:b0:649:8b6f:99c5 with SMTP id
 4fb4d7f45d1cf-64b8eb7194amr231643a12.15.1766080179958; Thu, 18 Dec 2025
 09:49:39 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
 <20251219-pgtable_check_v18rebase-v18-1-755bc151a50b@linux.ibm.com>
In-Reply-To: <20251219-pgtable_check_v18rebase-v18-1-755bc151a50b@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 18 Dec 2025 12:49:03 -0500
X-Gm-Features: AQt7F2r7kiXa3gHIKUaDejuDxi7v3d-8CVx2-W_EwfFsV1tLHpl2uarz70Sl-ZA
Message-ID: <CA+CK2bA-3p1iy9ryaQSthV0MhpxzuMVK91F1YF45qw90PUtG3g@mail.gmail.com>
Subject: Re: [PATCH v18 01/12] arm64/mm: Add addr parameter to __set_ptes_anysz()
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>, 
	Christophe Leroy <chleroy@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org, 
	Nicholas Miehlbradt <nicholas@linux.ibm.com>, Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, 
	Andrew Donnellan <andrew+kernel@donnellan.id.au>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Dec 18, 2025 at 12:10=E2=80=AFPM Andrew Donnellan <ajd@linux.ibm.co=
m> wrote:
>
> To provide support for page table check on powerpc, we need to reinstate =
the
> address parameter in several functions, including
> page_table_check_{ptes,pmds,puds}_set().
>
> In preparation for this, add the addr parameter to arm64's __set_ptes_any=
sz()
> and change its callsites accordingly.
>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

> ---
> v15: new patch
> v16: rebase
> ---
>  arch/arm64/include/asm/pgtable.h | 19 ++++++++-----------
>  arch/arm64/mm/hugetlbpage.c      | 10 +++++-----
>  2 files changed, 13 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pg=
table.h
> index 445e18e92221c98eef717888aeac71d1d6b1da06..52f3ea07427cef399e68bea0d=
bab39d03ea83060 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -673,8 +673,8 @@ static inline pgprot_t pud_pgprot(pud_t pud)
>         return __pgprot(pud_val(pfn_pud(pfn, __pgprot(0))) ^ pud_val(pud)=
);
>  }
>
> -static inline void __set_ptes_anysz(struct mm_struct *mm, pte_t *ptep,
> -                                   pte_t pte, unsigned int nr,
> +static inline void __set_ptes_anysz(struct mm_struct *mm, unsigned long =
addr,
> +                                   pte_t *ptep, pte_t pte, unsigned int =
nr,
>                                     unsigned long pgsize)
>  {
>         unsigned long stride =3D pgsize >> PAGE_SHIFT;
> @@ -709,26 +709,23 @@ static inline void __set_ptes_anysz(struct mm_struc=
t *mm, pte_t *ptep,
>         __set_pte_complete(pte);
>  }
>
> -static inline void __set_ptes(struct mm_struct *mm,
> -                             unsigned long __always_unused addr,
> +static inline void __set_ptes(struct mm_struct *mm, unsigned long addr,
>                               pte_t *ptep, pte_t pte, unsigned int nr)
>  {
> -       __set_ptes_anysz(mm, ptep, pte, nr, PAGE_SIZE);
> +       __set_ptes_anysz(mm, addr, ptep, pte, nr, PAGE_SIZE);
>  }
>
> -static inline void __set_pmds(struct mm_struct *mm,
> -                             unsigned long __always_unused addr,
> +static inline void __set_pmds(struct mm_struct *mm, unsigned long addr,
>                               pmd_t *pmdp, pmd_t pmd, unsigned int nr)
>  {
> -       __set_ptes_anysz(mm, (pte_t *)pmdp, pmd_pte(pmd), nr, PMD_SIZE);
> +       __set_ptes_anysz(mm, addr, (pte_t *)pmdp, pmd_pte(pmd), nr, PMD_S=
IZE);
>  }
>  #define set_pmd_at(mm, addr, pmdp, pmd) __set_pmds(mm, addr, pmdp, pmd, =
1)
>
> -static inline void __set_puds(struct mm_struct *mm,
> -                             unsigned long __always_unused addr,
> +static inline void __set_puds(struct mm_struct *mm, unsigned long addr,
>                               pud_t *pudp, pud_t pud, unsigned int nr)
>  {
> -       __set_ptes_anysz(mm, (pte_t *)pudp, pud_pte(pud), nr, PUD_SIZE);
> +       __set_ptes_anysz(mm, addr, (pte_t *)pudp, pud_pte(pud), nr, PUD_S=
IZE);
>  }
>  #define set_pud_at(mm, addr, pudp, pud) __set_puds(mm, addr, pudp, pud, =
1)
>
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 1d90a7e753336d86314fee0f753e8779d6a6bc12..1003b502075208d4252c27ffd=
acb1aaf4928639b 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -225,8 +225,8 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned l=
ong addr,
>         ncontig =3D num_contig_ptes(sz, &pgsize);
>
>         if (!pte_present(pte)) {
> -               for (i =3D 0; i < ncontig; i++, ptep++)
> -                       __set_ptes_anysz(mm, ptep, pte, 1, pgsize);
> +               for (i =3D 0; i < ncontig; i++, ptep++, addr +=3D pgsize)
> +                       __set_ptes_anysz(mm, addr, ptep, pte, 1, pgsize);
>                 return;
>         }
>
> @@ -234,7 +234,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned l=
ong addr,
>         if (pte_cont(pte) && pte_valid(__ptep_get(ptep)))
>                 clear_flush(mm, addr, ptep, pgsize, ncontig);
>
> -       __set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
> +       __set_ptes_anysz(mm, addr, ptep, pte, ncontig, pgsize);
>  }
>
>  pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
> @@ -449,7 +449,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct =
*vma,
>         if (pte_young(orig_pte))
>                 pte =3D pte_mkyoung(pte);
>
> -       __set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
> +       __set_ptes_anysz(mm, addr, ptep, pte, ncontig, pgsize);
>         return 1;
>  }
>
> @@ -473,7 +473,7 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
>         pte =3D get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
>         pte =3D pte_wrprotect(pte);
>
> -       __set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
> +       __set_ptes_anysz(mm, addr, ptep, pte, ncontig, pgsize);
>  }
>
>  pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>
> --
> 2.52.0
>
>

