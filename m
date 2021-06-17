Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 555B43AAD19
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 09:09:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5CqH6p4Sz3btr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:09:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=FQtZTwK4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22c;
 helo=mail-oi1-x22c.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=FQtZTwK4; dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5Cpr3QXFz3c1M
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 17:09:24 +1000 (AEST)
Received: by mail-oi1-x22c.google.com with SMTP id u11so5473178oiv.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 00:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y899QIQlOQvFqET/XGorOZ+F3vK0QdxZBrZzg45qzIs=;
 b=FQtZTwK4cC4uXfrgpUfeUmm6Siw4e/WbKHpMQAsnI2GuJrbWnfKGVx55CrlKwNW3Yv
 id9W++OpGmqczrcKmov1LTEXRpsdyADCcXpBqkD3ebXNrue27Wv5udaUtl2dl2J7AQit
 2ZDLx7SobVYkJb2Bwi7poyskkgAhFTaR7gPp/EyyS7kgrsdZcS/qwY/6LfDvnh3iCN2V
 WwCHMNNX9KIRmVZ3KOoIMKnbAUnz92UztTDXuBlQJ2gQoGCeCIK4IFzAku3R+7L7K/l4
 m78ITtrlX333pwjx/YWYG2DdGtLJayvmEFV1IjtZ3EiO1Qem80PZN8VEq3YzlCZaW7KP
 bOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y899QIQlOQvFqET/XGorOZ+F3vK0QdxZBrZzg45qzIs=;
 b=dwER3/nl7YyocJD6MlQmugcx+KmDMcUEwrV+4EBnJcQbVDxVvi/VNL+XQc8MEuaHTD
 BSCm2z5VRGx0SYJaNUhbwPVobn0r+Hlp93QTcdpUxwl8KbOPPs3k3Fdbq51SxhNUZw/v
 +zg61KkLpPtI17PeQcCFSY4oxGGPekew2yMGJzf6VhRAYDIROeV6e0ndoUyWjSZzXMqg
 DTYRFNk4ZLX3aqpNSIV0SZiSGW6126x3POjzcA5ggGDreWYpGJvLpwL4WJLRXLUu8Ejk
 UQ22gHceV5OwhlawH7Ppu7aE75xHSvV4SGQoe9g3zDjtfPc06/pySTUpzGiaLPwEqdBM
 YePw==
X-Gm-Message-State: AOAM531jI/vy/RXyrxVYGNtXfrlq/tgWojxC+YyrvPeTH44KTQ2X+v12
 PjnOfItEG+0etDfMu5bvULbZqWVYwGYTG2XJ4ekduQ==
X-Google-Smtp-Source: ABdhPJztoH0C1/zvKob2TwWK9o3BZ++QjbgLwppAe2djLU6M4cBSQ1jJwElkp2Tz9gErUtDFo+xgFIsfw23ZT5VTMGA=
X-Received: by 2002:a05:6808:bd5:: with SMTP id
 o21mr2275661oik.172.1623913760824; 
 Thu, 17 Jun 2021 00:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210617063956.94061-1-dja@axtens.net>
 <20210617063956.94061-5-dja@axtens.net>
In-Reply-To: <20210617063956.94061-5-dja@axtens.net>
From: Marco Elver <elver@google.com>
Date: Thu, 17 Jun 2021 09:09:09 +0200
Message-ID: <CANpmjNOoeZqRnqpPGZqiro-ptaV=qKf5dnRYmVcZkRMPq7spig@mail.gmail.com>
Subject: Re: [PATCH v14 4/4] kasan: use MAX_PTRS_PER_* for early shadow tables
To: Daniel Axtens <dja@axtens.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: aneesh.kumar@linux.ibm.com, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Andrey Konovalov <andreyknvl@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Jun 2021 at 08:40, Daniel Axtens <dja@axtens.net> wrote:
>
> powerpc has a variable number of PTRS_PER_*, set at runtime based
> on the MMU that the kernel is booted under.
>
> This means the PTRS_PER_* are no longer constants, and therefore
> breaks the build. Switch to using MAX_PTRS_PER_*, which are constant.
>
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Suggested-by: Balbir Singh <bsingharora@gmail.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Balbir Singh <bsingharora@gmail.com>
> Signed-off-by: Daniel Axtens <dja@axtens.net>

Reviewed-by: Marco Elver <elver@google.com>


> ---
>  include/linux/kasan.h | 6 +++---
>  mm/kasan/init.c       | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 768d7d342757..5310e217bd74 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -41,9 +41,9 @@ struct kunit_kasan_expectation {
>  #endif
>
>  extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
> -extern pte_t kasan_early_shadow_pte[PTRS_PER_PTE + PTE_HWTABLE_PTRS];
> -extern pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD];
> -extern pud_t kasan_early_shadow_pud[PTRS_PER_PUD];
> +extern pte_t kasan_early_shadow_pte[MAX_PTRS_PER_PTE + PTE_HWTABLE_PTRS];
> +extern pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD];
> +extern pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD];
>  extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
>
>  int kasan_populate_early_shadow(const void *shadow_start,
> diff --git a/mm/kasan/init.c b/mm/kasan/init.c
> index 348f31d15a97..cc64ed6858c6 100644
> --- a/mm/kasan/init.c
> +++ b/mm/kasan/init.c
> @@ -41,7 +41,7 @@ static inline bool kasan_p4d_table(pgd_t pgd)
>  }
>  #endif
>  #if CONFIG_PGTABLE_LEVELS > 3
> -pud_t kasan_early_shadow_pud[PTRS_PER_PUD] __page_aligned_bss;
> +pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD] __page_aligned_bss;
>  static inline bool kasan_pud_table(p4d_t p4d)
>  {
>         return p4d_page(p4d) == virt_to_page(lm_alias(kasan_early_shadow_pud));
> @@ -53,7 +53,7 @@ static inline bool kasan_pud_table(p4d_t p4d)
>  }
>  #endif
>  #if CONFIG_PGTABLE_LEVELS > 2
> -pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD] __page_aligned_bss;
> +pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD] __page_aligned_bss;
>  static inline bool kasan_pmd_table(pud_t pud)
>  {
>         return pud_page(pud) == virt_to_page(lm_alias(kasan_early_shadow_pmd));
> @@ -64,7 +64,7 @@ static inline bool kasan_pmd_table(pud_t pud)
>         return false;
>  }
>  #endif
> -pte_t kasan_early_shadow_pte[PTRS_PER_PTE + PTE_HWTABLE_PTRS]
> +pte_t kasan_early_shadow_pte[MAX_PTRS_PER_PTE + PTE_HWTABLE_PTRS]
>         __page_aligned_bss;
>
>  static inline bool kasan_pte_table(pmd_t pmd)
> --
> 2.30.2
>
