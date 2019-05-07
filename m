Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7966116D11
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 23:20:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zCFf5yQhzDqHl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 07:20:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::341; helo=mail-ot1-x341.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="JB3/ofVK"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zCD72mjxzDq7h
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 07:19:34 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id v17so8310757otp.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 14:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3hK5kgswQ8wv2TZkCFoSuWyjsyMg02YpSTLcE/+WG/U=;
 b=JB3/ofVKMzM47vp5cpkgsnhZ8ZoLv1EVoO9+f31886li2wtHIqmVJSjWZgBJwXVWkQ
 BX8fXeuRngRf/Ks+w1ntTvElqYBed9sGLskf82OMafAfaVt9JAi0cGsgfLfsvJoqqDNr
 leYUf1Qr603j9SX7YPOMJQJ/cTCjxhAKYRdtUuxeKEq3ug1IPoCPnsVf+3r99jUb+zmR
 INxH8W2mrFhA3n0T4xrdVH8dH6T52i5DTkq3iyhP8i9MzOP7NEL5WL7OGtJR7yWG5TTZ
 DDa00gAnvg3r1yMN6dj4XSo/K//hjnmaEZqeXhVR8JHWgv3lVtO0ckrsHunC8Zyn08k4
 ovPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3hK5kgswQ8wv2TZkCFoSuWyjsyMg02YpSTLcE/+WG/U=;
 b=fK7zDD9XcwZF7rvVs6hfJE+08oamlUyKJT9DUVp1YbmlMPNLk10gakw0IS11r/Fuc4
 StZtATYjQLGFUTshE02wN5GLbXjTnmyrkcXaRX7RHE2GQQZTp0GO4Wzx0hA5TENWHvX2
 DLJ8ZRRseS5nXH6T9+qk59EMzRvmaBXON6F3EaTJmSb3HnmyKvF6pWJQEsA03AwyxTan
 ovEP1O21RynNBPtntmNFslexfLD16VkK0FGvZJzmR/EZbCsejbYSm99/DsINtq7EciEn
 erDrDCHJz3E2UTB718CYAp4oFsRK0B2al0beFw5Rp1U6vijEXNZ8jTDjyraCr0DI08MI
 i2KA==
X-Gm-Message-State: APjAAAWqurafaIbxSflq8Kekh/FV8O4Kdgz4XPFzVHc8pbFGxH1VWXSn
 y+JGcxGZ3k3l77Cf72fz4gICnBpETRfXwBM5kGxbig==
X-Google-Smtp-Source: APXvYqw7pnu1SJKRDXTAG+qXmcSugmMrCCEKA6B2yg/hWV1/XWlJZJvmUs9rNfdS4aafceF7Ulls7pnfgUmoZQnK/CQ=
X-Received: by 2002:a9d:222c:: with SMTP id o41mr23286782ota.353.1557263973069; 
 Tue, 07 May 2019 14:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190507183804.5512-1-david@redhat.com>
 <20190507183804.5512-6-david@redhat.com>
In-Reply-To: <20190507183804.5512-6-david@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 7 May 2019 14:19:22 -0700
Message-ID: <CAPcyv4ge1pSOopfHof4USn=7Skc-UV4Xhd_s=h+M9VXSp_p1XQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] mm/memory_hotplug: Drop MHP_MEMBLOCK_API
To: David Hildenbrand <david@redhat.com>
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
Cc: Oscar Salvador <osalvador@suse.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux-sh <linux-sh@vger.kernel.org>, Mathieu Malaterre <malat@debian.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Yang <richard.weiyang@gmail.com>, Linux MM <linux-mm@kvack.org>,
 Qian Cai <cai@lca.pw>, Arun KS <arunks@codeaurora.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 7, 2019 at 11:38 AM David Hildenbrand <david@redhat.com> wrote:
>
> No longer needed, the callers of arch_add_memory() can handle this
> manually.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Oscar Salvador <osalvador@suse.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Cc: Qian Cai <cai@lca.pw>
> Cc: Arun KS <arunks@codeaurora.org>
> Cc: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/memory_hotplug.h | 8 --------
>  mm/memory_hotplug.c            | 9 +++------
>  2 files changed, 3 insertions(+), 14 deletions(-)
>
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index 2d4de313926d..2f1f87e13baa 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -128,14 +128,6 @@ extern void arch_remove_memory(int nid, u64 start, u64 size,
>  extern void __remove_pages(struct zone *zone, unsigned long start_pfn,
>                            unsigned long nr_pages, struct vmem_altmap *altmap);
>
> -/*
> - * Do we want sysfs memblock files created. This will allow userspace to online
> - * and offline memory explicitly. Lack of this bit means that the caller has to
> - * call move_pfn_range_to_zone to finish the initialization.
> - */
> -
> -#define MHP_MEMBLOCK_API               (1<<0)
> -
>  /* reasonably generic interface to expand the physical pages */
>  extern int __add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
>                        struct mhp_restrictions *restrictions);
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index e1637c8a0723..107f72952347 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -250,7 +250,7 @@ void __init register_page_bootmem_info_node(struct pglist_data *pgdat)
>  #endif /* CONFIG_HAVE_BOOTMEM_INFO_NODE */
>
>  static int __meminit __add_section(int nid, unsigned long phys_start_pfn,
> -               struct vmem_altmap *altmap, bool want_memblock)
> +                                  struct vmem_altmap *altmap)
>  {
>         int ret;
>
> @@ -293,8 +293,7 @@ int __ref __add_pages(int nid, unsigned long phys_start_pfn,
>         }
>
>         for (i = start_sec; i <= end_sec; i++) {
> -               err = __add_section(nid, section_nr_to_pfn(i), altmap,
> -                               restrictions->flags & MHP_MEMBLOCK_API);
> +               err = __add_section(nid, section_nr_to_pfn(i), altmap);
>
>                 /*
>                  * EEXIST is finally dealt with by ioresource collision
> @@ -1066,9 +1065,7 @@ static int online_memory_block(struct memory_block *mem, void *arg)
>   */
>  int __ref add_memory_resource(int nid, struct resource *res)
>  {
> -       struct mhp_restrictions restrictions = {
> -               .flags = MHP_MEMBLOCK_API,
> -       };
> +       struct mhp_restrictions restrictions = {};

With mhp_restrictions.flags no longer needed, can we drop
mhp_restrictions and just go back to a plain @altmap argument?
