Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EE571947E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 09:40:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWyjd6FZBz3f0k
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 17:40:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.174; helo=mail-yb1-f174.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWyj53DwBz30QQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 17:40:24 +1000 (AEST)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so2796915276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 00:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685605222; x=1688197222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Vy5gwXbACIYw+FA/+yi3OHDGD1kIURAtfeea/c7peI=;
        b=P9tAyHkIbF0oa5RnrWe4U5qsIP3UEnP2Yxq9dEh+kQZ2mbaq+YmnAHY1WSDs0Va7kC
         XH9ZXwFK4avWo9UaHuL9ZhRGbdmWuiLRmhnlmZ/y1zJk0H1uW3L8yq3Pg+M6tsh+EW9Y
         TQtkvd+1n7+wJ5aVtDmyTfecKA2al98DlpSZlo20adFWeEIGGHfhEwkpK+2CunyC+evY
         3L5vbNg9bfaPZFGmhmeE0OHac5l7R7ObgLj6lOEx0J/GeNXUoJzOg4gkDcYCy+V9vjM9
         wq2cUfxY8rUN/8eLLjLem4hpy0arvtBg2Pxy8jciTr3jon3YYWTI4cTPMqZNv3iqZCHN
         klBg==
X-Gm-Message-State: AC+VfDwtHWOm81NRLKaLg+FTQeRdqE7yjVOdgnZdLhU/HKx3Fk6JgldA
	hGMetqKH2qIIvGQDp675XCzwL679oLWVPw==
X-Google-Smtp-Source: ACHHUZ5hFvr31Qq95vn4LMCDSzlMZdpSICH2xUWAAW1FpZGs9YIXex9kog5DApnlHEkI11BjnSDqcQ==
X-Received: by 2002:a0d:db4f:0:b0:565:85b0:c128 with SMTP id d76-20020a0ddb4f000000b0056585b0c128mr1248119ywe.6.1685605222200;
        Thu, 01 Jun 2023 00:40:22 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id z5-20020a818905000000b00545a08184bbsm6028099ywf.75.2023.06.01.00.40.21
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 00:40:21 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-ba8cd61ee2dso2770655276.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 00:40:21 -0700 (PDT)
X-Received: by 2002:a81:a041:0:b0:565:9f61:c771 with SMTP id
 x62-20020a81a041000000b005659f61c771mr1176431ywg.9.1685605221248; Thu, 01 Jun
 2023 00:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com> <20230531213032.25338-26-vishal.moola@gmail.com>
In-Reply-To: <20230531213032.25338-26-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Jun 2023 09:40:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCe=VsTJYNA_-k=JipeAGKzgBFjZ8i+XRK7U1DBei=7A@mail.gmail.com>
Message-ID: <CAMuHMdWCe=VsTJYNA_-k=JipeAGKzgBFjZ8i+XRK7U1DBei=7A@mail.gmail.com>
Subject: Re: [PATCH v3 25/34] m68k: Convert various functions to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vishal,

On Wed, May 31, 2023 at 11:32=E2=80=AFPM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> As part of the conversions to replace pgtable constructor/destructors wit=
h
> ptdesc equivalents, convert various page table functions to use ptdescs.
>
> Some of the functions use the *get*page*() helper functions. Convert
> these to use pagetable_alloc() and ptdesc_address() instead to help
> standardize page tables further.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Thanks for your patch!

> --- a/arch/m68k/include/asm/mcf_pgalloc.h
> +++ b/arch/m68k/include/asm/mcf_pgalloc.h
> @@ -7,20 +7,19 @@
>
>  extern inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
>  {
> -       free_page((unsigned long) pte);
> +       pagetable_free(virt_to_ptdesc(pte));
>  }
>
>  extern const char bad_pmd_string[];
>
>  extern inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
>  {
> -       unsigned long page =3D __get_free_page(GFP_DMA);
> +       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_DMA | __GFP_ZERO, 0=
);
>
> -       if (!page)
> +       if (!ptdesc)
>                 return NULL;
>
> -       memset((void *)page, 0, PAGE_SIZE);
> -       return (pte_t *) (page);
> +       return (pte_t *) (ptdesc_address(ptdesc));

No need to cast "void *" when returning a different pointer type.

>  }
>
>  extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long address)
> @@ -35,36 +34,36 @@ extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, uns=
igned long address)
>  static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pgta=
ble,
>                                   unsigned long address)
>  {
> -       struct page *page =3D virt_to_page(pgtable);
> +       struct ptdesc *ptdesc =3D virt_to_ptdesc(pgtable);
>
> -       pgtable_pte_page_dtor(page);
> -       __free_page(page);
> +       pagetable_pte_dtor(ptdesc);
> +       pagetable_free(ptdesc);
>  }
>
>  static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
>  {
> -       struct page *page =3D alloc_pages(GFP_DMA, 0);
> +       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_DMA, 0);
>         pte_t *pte;
>
> -       if (!page)
> +       if (!ptdesc)
>                 return NULL;
> -       if (!pgtable_pte_page_ctor(page)) {
> -               __free_page(page);
> +       if (!pagetable_pte_ctor(ptdesc)) {
> +               pagetable_free(ptdesc);
>                 return NULL;
>         }
>
> -       pte =3D page_address(page);
> -       clear_page(pte);
> +       pte =3D ptdesc_address(ptdesc);
> +       pagetable_clear(pte);
>
>         return pte;
>  }
>
>  static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
>  {
> -       struct page *page =3D virt_to_page(pgtable);
> +       struct ptdesc *ptdesc =3D virt_to_ptdesc(ptdesc);

virt_to_ptdesc(pgtable)

(You can build this using m5475evb_defconfig)

>
> -       pgtable_pte_page_dtor(page);
> -       __free_page(page);
> +       pagetable_pte_dtor(ptdesc);
> +       pagetable_free(ptdesc);
>  }
>
>  /*
> @@ -75,16 +74,18 @@ static inline void pte_free(struct mm_struct *mm, pgt=
able_t pgtable)
>
>  static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
>  {
> -       free_page((unsigned long) pgd);
> +       pagetable_free(virt_to_ptdesc(pgd));
>  }
>
>  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
>         pgd_t *new_pgd;
> +       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_DMA | GFP_NOWARN, 0=
);
>
> -       new_pgd =3D (pgd_t *)__get_free_page(GFP_DMA | __GFP_NOWARN);
> -       if (!new_pgd)
> +       if (!ptdesc)
>                 return NULL;
> +       new_pgd =3D (pgd_t *) ptdesc_address(ptdesc);

No need to cast "void *" when assigning to a different pointer type.

> +
>         memcpy(new_pgd, swapper_pg_dir, PTRS_PER_PGD * sizeof(pgd_t));
>         memset(new_pgd, 0, PAGE_OFFSET >> PGDIR_SHIFT);
>         return new_pgd;

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
