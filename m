Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A293A9591
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 11:08:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4fVq6Hspz3byn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 19:08:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=lrYME9Lw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=lrYME9Lw; dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4fVN3Xbzz2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 19:08:10 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so1827226otl.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 02:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9xuYq+64b5WvG58VNmoINL8JRqUZnuNk7CS6Gt/jkYU=;
 b=lrYME9Lw0bw5jobMrw7bAtz5zFCN5SIDCWMMy0Oc0iZ4OQM2eXD+jUDkK8nxuts6FA
 AhN/U0QDTrC0uUDtjo1hykQLrvJkugVmxGdE72uPfu38L59Vca6oh8jJDg379Nm1VdPR
 BzRHVGfCTzwQOlq/xhXSpQZnXcZudbpjg5IaGbYAvlAHcTdf2ih3PJfBvYEgRNK84Y2H
 I/DxrlyGKIeYhJzsGfXq7badWjr+bCqgO65DdKZr2ECnoKxf1dwN8m/0M9CO1nbAQWFn
 /YKrA4l8MnlqJCjqDpx5yYF5+t1yzzfOu4Q0KLNh8EbBwjwhE3pVEW40Zj98ScS7lun2
 ozsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9xuYq+64b5WvG58VNmoINL8JRqUZnuNk7CS6Gt/jkYU=;
 b=Gwqih3rQPYLh91SDjc84L1BZRWQ9/siXNBRuudpn7OutsiLsLuybfH6q4KT9jGmRqD
 1gJDUWnCBwI5GQacU1rqsdEJss4Kumk/N5iqBNDrjWZm46jHn3xQMGh4RdCex5zVBRHe
 UZYIQjw/35InojjrpwKQdJGqNaFGN3TZsw9kDs9xTsNM4zMkJ2IhBy0Ek1poZLdvNzU8
 SUk7Wl9XfNQQYWjZHIjUWrQz5MHqD/ww8Z1LPdfvy6H1khTuCjugwwH20JYT9EKlVItb
 F9Vq9JV8S4r1P4PJKj5pOxaL8vNBwAYRJICHAcfwSCkQqByAjKmG3YwmvVfdysXjLdcH
 EyWQ==
X-Gm-Message-State: AOAM530rgUsFyuCeSyxZYMv36+7jYmyn8aSpFwzIGu9TDGqA4ARu1FSY
 lCM3gKQSTXyClHyLym95qEwQYaEHjds0rS/TT3ZaHw==
X-Google-Smtp-Source: ABdhPJyDEOnGc9wAnOoqktHhJZmmNWHzwtwqb4yeXvjQLG8ilX6jnwU0HCYru7+LM5x6jxSUH5lcOFoSo2gOnUPfKv0=
X-Received: by 2002:a05:6830:1bcb:: with SMTP id
 v11mr3239145ota.251.1623834487248; 
 Wed, 16 Jun 2021 02:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210616080244.51236-1-dja@axtens.net>
 <20210616080244.51236-4-dja@axtens.net>
In-Reply-To: <20210616080244.51236-4-dja@axtens.net>
From: Marco Elver <elver@google.com>
Date: Wed, 16 Jun 2021 11:07:55 +0200
Message-ID: <CANpmjNN2-nkqaQ8J3nU5QJ4KGkX2mwiNTeTCNPGQYdbb1v2OaA@mail.gmail.com>
Subject: Re: [PATCH v13 3/3] kasan: define and use MAX_PTRS_PER_* for early
 shadow tables
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

On Wed, 16 Jun 2021 at 10:03, Daniel Axtens <dja@axtens.net> wrote:
[...]
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 768d7d342757..fd65f477ac92 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -40,10 +40,22 @@ struct kunit_kasan_expectation {
>  #define PTE_HWTABLE_PTRS 0
>  #endif
>
> +#ifndef MAX_PTRS_PER_PTE
> +#define MAX_PTRS_PER_PTE PTRS_PER_PTE
> +#endif
> +
> +#ifndef MAX_PTRS_PER_PMD
> +#define MAX_PTRS_PER_PMD PTRS_PER_PMD
> +#endif
> +
> +#ifndef MAX_PTRS_PER_PUD
> +#define MAX_PTRS_PER_PUD PTRS_PER_PUD
> +#endif

This is introducing new global constants in a <linux/..> header. It
feels like this should be in <linux/pgtable.h> together with a
comment. Because <linux/kasan.h> is actually included in
<linux/slab.h>, most of the kernel will get these new definitions.
That in itself is fine, but it feels wrong that the KASAN header
introduces these.

Thoughts?

Sorry for only realizing this now.

Thanks,
-- Marco

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
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20210616080244.51236-4-dja%40axtens.net.
