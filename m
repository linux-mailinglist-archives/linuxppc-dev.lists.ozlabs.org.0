Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D26673CF89
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jun 2023 10:52:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qpl8n3rlWz3btj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jun 2023 18:52:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.173; helo=mail-yw1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qpl8B20wSz2xq5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jun 2023 18:51:37 +1000 (AEST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-56fff21c2ebso23288277b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jun 2023 01:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687683093; x=1690275093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/Aydrd9oAz9wF8VtbGA6a+XUUai3n6kkWsRZbAgo9o=;
        b=OTJiWMLZwnYapM+1dCoZ3uhNVhJWm3rsxY7LSTNqPZhxVJj+SI/+bsqqIAWRBiZSZl
         S3jc+fd3nvqa7trQGQWTwSCfHho7BoXoPuzoBzmEYSfVaUTCwVPUHTaHCueZqMe1HHM8
         cixEJyV/d3PoQvKiBwb+DNX+SZugZ85iM0fTg/3xwUFJmebF8oKrlpcjjN87kEUUtRXx
         pJuhTzlvRRuEaYrjauhyTTFLZCuSvQmoJdhiCym6dBXqQQz8HZuY91cRXov/5SQImvKP
         A3O9YEkKMpNOUZKYjSuS9NYv3kpK5e42ekquKbcgtwv48Vershe8MGaywayPF5KtU3PP
         eQSQ==
X-Gm-Message-State: AC+VfDz7vr8XinX8Bta0BAfT3xrf6ruSiYZfw8HJ3UlL9tC5hmJey8uM
	muXmv9ywjbINdNYgMZMV2Pw9NyTCCdYmWw==
X-Google-Smtp-Source: ACHHUZ5TUri7wBnLhphkf0LLEFAUkQhnkxA49xZ+J7RhClke55qNRSy6cny/TJzDMuMYOg1BfrjKcA==
X-Received: by 2002:a0d:f2c7:0:b0:570:2831:3ccd with SMTP id b190-20020a0df2c7000000b0057028313ccdmr26101195ywf.47.1687683092943;
        Sun, 25 Jun 2023 01:51:32 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm731171ywd.33.2023.06.25.01.51.30
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 01:51:31 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-bd6d9d7da35so2325346276.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jun 2023 01:51:30 -0700 (PDT)
X-Received: by 2002:a25:cc02:0:b0:c13:f86d:3324 with SMTP id
 l2-20020a25cc02000000b00c13f86d3324mr3724376ybf.14.1687683090555; Sun, 25 Jun
 2023 01:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230622205745.79707-1-vishal.moola@gmail.com> <20230622205745.79707-25-vishal.moola@gmail.com>
In-Reply-To: <20230622205745.79707-25-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 25 Jun 2023 10:51:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2ZM1oJ7=Br6nezLpxjDQo_07N3T-adOupDm0Jntp=Qg@mail.gmail.com>
Message-ID: <CAMuHMdU2ZM1oJ7=Br6nezLpxjDQo_07N3T-adOupDm0Jntp=Qg@mail.gmail.com>
Subject: Re: [PATCH v5 24/33] m68k: Convert various functions to use ptdescs
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Mike Rapoport <rppt@kernel.org>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vishal,

On Thu, Jun 22, 2023 at 10:58=E2=80=AFPM Vishal Moola (Oracle)
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

>  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
>         pgd_t *new_pgd;
> +       struct ptdesc *ptdesc =3D pagetable_alloc((GFP_DMA | GFP_NOWARN) =
&

0-day already told you for v3 that GFP_NOWARN does not exist.
Please try cross-compiling your changes:
https://mirrors.edge.kernel.org/pub/tools/crosstool/

> +                       ~__GFP_HIGHMEM, 0);
>
> -       new_pgd =3D (pgd_t *)__get_free_page(GFP_DMA | __GFP_NOWARN);
> -       if (!new_pgd)
> +       if (!ptdesc)
>                 return NULL;
> +       new_pgd =3D ptdesc_address(ptdesc);
> +
>         memcpy(new_pgd, swapper_pg_dir, PTRS_PER_PGD * sizeof(pgd_t));
>         memset(new_pgd, 0, PAGE_OFFSET >> PGDIR_SHIFT);
>         return new_pgd;

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
