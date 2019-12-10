Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BE81183CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 10:39:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XFQ84pBdzDqXJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 20:39:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=bsingharora@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UBiVzNjP"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XFLr4dtnzDqWP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 20:36:36 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id c19so19001305lji.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 01:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=gXjxkm88DEjZBFBOVgYS/nXq7WpsnAwIahBe1LGrB6M=;
 b=UBiVzNjP9aLMEiA7IC7YrACjXTaPDc9hQMibmR6mvQ2w5h2mcCTC9EkN995AN07C3h
 dbarlfB4UYV1kmfgjxkEetgiW/0lmCFZPD1RV2yf7SMmHbmt5kWl3v8fKQ2C/Tom/sZc
 1A5J74odxics4FORavwIVtIBailZYZvoG6ESd6ppFoWRQ/b6ORBJ5uCeCcEYX6Qdmc5x
 x/g7FCVHEhjHGf7+XfjwozXLtrf0kaajg/vIYnqw9H71l4SuFOrtDO/lztKSviCuXmNj
 2OR9+EoTAXh63GHszKYj1+zJxtYsT8ForpsjXGRBO4gxper4nFuzQ3A5G53npQ/hCq+g
 H1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gXjxkm88DEjZBFBOVgYS/nXq7WpsnAwIahBe1LGrB6M=;
 b=B0TvdE/gh8X4F0SAZ6xPUdEjIuBBv9a0nBwoZYxmY9Z1KaAITBCw3Q9eUEUyQT9Fn4
 G9sxc9WcBx9cvKmbfS2k7tzOcEKn3/U+BwElIhUfdnqAJNHYVtLOlyAjuz9jXGLYn2NU
 BXbntBLGt4Rz5WXuGJAAtSU7Kdk46043eTheX3SW9A6Kdg1cyRP5agYT1oM624tR6IU6
 RrqjEeEnnzSe6xUreZYTdURqbb9JVR5zROLph5LXObxZgYlw9xpRE+hJIS++kIKxXflf
 zE3C6NPHJTBako52SefLIeWSB99ekYmMxH9naNKeTgeIpyC0C0zAP1zvp0PnNWuP16Kv
 OhMA==
X-Gm-Message-State: APjAAAVOY8psGJDUo/MIC/zfATr3Khc1vr60x3vJx62r86mg3lUmPpki
 uEQ5JB7oUmZ2x1oLaiBmQ3I=
X-Google-Smtp-Source: APXvYqzgHWnb8WU25vCn8dceHQNUvqh7F9YCfgdEcTPnY24QYOgLeeWBuTndcT1N2jJAkfd3EaJ+zA==
X-Received: by 2002:a2e:9015:: with SMTP id h21mr3537646ljg.69.1575970592330; 
 Tue, 10 Dec 2019 01:36:32 -0800 (PST)
Received: from [192.168.68.106] ([193.119.54.228])
 by smtp.gmail.com with ESMTPSA id m21sm1186222lfh.53.2019.12.10.01.36.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Dec 2019 01:36:31 -0800 (PST)
Subject: Re: [PATCH v2 2/4] kasan: use MAX_PTRS_PER_* for early shadow
To: Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kasan-dev@googlegroups.com, christophe.leroy@c-s.fr,
 aneesh.kumar@linux.ibm.com
References: <20191210044714.27265-1-dja@axtens.net>
 <20191210044714.27265-3-dja@axtens.net>
From: Balbir Singh <bsingharora@gmail.com>
Message-ID: <a31459ee-2019-2f7b-0dc1-235374579508@gmail.com>
Date: Tue, 10 Dec 2019 20:36:24 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191210044714.27265-3-dja@axtens.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/12/19 3:47 pm, Daniel Axtens wrote:
> This helps with powerpc support, and should have no effect on
> anything else.
> 
> Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Daniel Axtens <dja@axtens.net>

If you follow the recommendations by Christophe and I, you don't need this patch

Balbir Singh.

> ---
>  include/linux/kasan.h | 6 +++---
>  mm/kasan/init.c       | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index e18fe54969e9..d2f2a4ffcb12 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -15,9 +15,9 @@ struct task_struct;
>  #include <asm/pgtable.h>
>  
>  extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
> -extern pte_t kasan_early_shadow_pte[PTRS_PER_PTE];
> -extern pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD];
> -extern pud_t kasan_early_shadow_pud[PTRS_PER_PUD];
> +extern pte_t kasan_early_shadow_pte[MAX_PTRS_PER_PTE];
> +extern pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD];
> +extern pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD];
>  extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
>  
>  int kasan_populate_early_shadow(const void *shadow_start,
> diff --git a/mm/kasan/init.c b/mm/kasan/init.c
> index ce45c491ebcd..8b54a96d3b3e 100644
> --- a/mm/kasan/init.c
> +++ b/mm/kasan/init.c
> @@ -46,7 +46,7 @@ static inline bool kasan_p4d_table(pgd_t pgd)
>  }
>  #endif
>  #if CONFIG_PGTABLE_LEVELS > 3
> -pud_t kasan_early_shadow_pud[PTRS_PER_PUD] __page_aligned_bss;
> +pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD] __page_aligned_bss;
>  static inline bool kasan_pud_table(p4d_t p4d)
>  {
>  	return p4d_page(p4d) == virt_to_page(lm_alias(kasan_early_shadow_pud));
> @@ -58,7 +58,7 @@ static inline bool kasan_pud_table(p4d_t p4d)
>  }
>  #endif
>  #if CONFIG_PGTABLE_LEVELS > 2
> -pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD] __page_aligned_bss;
> +pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD] __page_aligned_bss;
>  static inline bool kasan_pmd_table(pud_t pud)
>  {
>  	return pud_page(pud) == virt_to_page(lm_alias(kasan_early_shadow_pmd));
> @@ -69,7 +69,7 @@ static inline bool kasan_pmd_table(pud_t pud)
>  	return false;
>  }
>  #endif
> -pte_t kasan_early_shadow_pte[PTRS_PER_PTE] __page_aligned_bss;
> +pte_t kasan_early_shadow_pte[MAX_PTRS_PER_PTE] __page_aligned_bss;
>  
>  static inline bool kasan_pte_table(pmd_t pmd)
>  {
> 
