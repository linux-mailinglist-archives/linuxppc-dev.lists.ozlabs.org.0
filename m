Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC443C935E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 23:48:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQB302mdhz30Dr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 07:48:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UUnwQaua;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::134;
 helo=mail-il1-x134.google.com; envelope-from=pankaj.gupta.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UUnwQaua; dkim-atps=neutral
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQ8hn4HjPz2yyb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 06:47:52 +1000 (AEST)
Received: by mail-il1-x134.google.com with SMTP id h3so2909459ilc.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 13:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hvhFUaJpsKWtTEeD2+NVxurp5yWKuTzZW3b3jtSmo5Y=;
 b=UUnwQaua/H8rwEJ46wBGu21VE3YZ4bJWf1X9TiXDo9vh0gjpsjTI69qTz8pUIOeQmZ
 87sYgU7NQ2/IywPIyzuJgPagS9NB5ilUObP1yaPA/AaIMC2BENX2XW8OmvNHcjIZzcqQ
 lCJKYYFk7pgPjzvPFxoMU8RBALA3Hs5cTmm/buog1pLIyQXWBKa5ks+NtYkm7Xs9p1/4
 9bfr6Tuk3tiShJOZYSkFcJbqC1a6xfK4TJacBP5OeWgIBt7iJpXiEuB2Btyl4Pu/1mqs
 QL/3W25VvEP2vW3CnG/H9MMRVuhf6MAjCdkOTJ68fiKoyj5Vp4y4pfExBy7Ej62pduDV
 nCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hvhFUaJpsKWtTEeD2+NVxurp5yWKuTzZW3b3jtSmo5Y=;
 b=TkD4l1+SZKQdQ4zgf7eEFBd26vJrnJo4/hu0JdL3wD0QNsxVhEukxplwbyXfHjkf7v
 4RR9lFRrSMlU9Yc/q/lDQopLm2eDF184xAWcwYF8YTET/LPpdR5/WWFqNK/Th+5M2HP0
 kAgzm9HWpfB8iuFgNg5VWITYHVUauMXMjpGeAUdyE89oEvT2GqO8YacEwMznoJVB5SzP
 wexlWPztF0/hl5rXUCHJz6iwUfwNb6UilpSGUZVCqiaoTaDgvDEowN5fncjSJa7Ty5HG
 vAgH3QFsZYORmdeAF8SMYJ5eUyzMqMLhP3FH7iRFKvY7TCRQuC2RKnOGtomzvbP/7p8w
 ytwA==
X-Gm-Message-State: AOAM532eOtNAelLWU9idfnkjRIiU+Y21mTXXKxiCrRXBa7VrUil/X04r
 CRCTahPS2oAgkyaAR5tx3d9SxR/8hZmBBPc7v38=
X-Google-Smtp-Source: ABdhPJzWAUEodW2mYSrVgx/aVrQIoBL1nE+ROg1S3BgzAtNQwXY0vhRs5znC0NaRsIBHIP11yL7l0nkY7pQ1qsdr6E4=
X-Received: by 2002:a92:a005:: with SMTP id e5mr7715143ili.22.1626295669171;
 Wed, 14 Jul 2021 13:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210712124052.26491-1-david@redhat.com>
 <20210712124052.26491-3-david@redhat.com>
In-Reply-To: <20210712124052.26491-3-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 14 Jul 2021 22:47:38 +0200
Message-ID: <CAM9Jb+hj8uGc0N16Guui9kaA6W46QHzAET44Zt8C7kRdRAXMOA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] mm/memory_hotplug: remove nid parameter from
 arch_remove_memory()
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 15 Jul 2021 07:48:19 +1000
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
Cc: Michel Lespinasse <michel@lespinasse.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-s390@vger.kernel.org, Laurent Dufour <ldufour@linux.ibm.com>,
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-sh@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Len Brown <lenb@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Borislav Petkov <bp@alien8.de>,
 Sergei Trofimovich <slyfox@gentoo.org>, Andy Lutomirski <luto@kernel.org>,
 Jia He <justin.he@arm.com>, Dan Williams <dan.j.williams@intel.com>,
 virtualization@lists.linux-foundation.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pierre Morel <pmorel@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> The parameter is unused, let's remove it.
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> Cc: Sergei Trofimovich <slyfox@gentoo.org>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Michel Lespinasse <michel@lespinasse.org>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Cc: Joe Perches <joe@perches.com>
> Cc: Pierre Morel <pmorel@linux.ibm.com>
> Cc: Jia He <justin.he@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/arm64/mm/mmu.c            | 3 +--
>  arch/ia64/mm/init.c            | 3 +--
>  arch/powerpc/mm/mem.c          | 3 +--
>  arch/s390/mm/init.c            | 3 +--
>  arch/sh/mm/init.c              | 3 +--
>  arch/x86/mm/init_32.c          | 3 +--
>  arch/x86/mm/init_64.c          | 3 +--
>  include/linux/memory_hotplug.h | 3 +--
>  mm/memory_hotplug.c            | 4 ++--
>  mm/memremap.c                  | 5 +----
>  10 files changed, 11 insertions(+), 22 deletions(-)
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index d74586508448..af8ab553a268 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1506,8 +1506,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
>         return ret;
>  }
>
> -void arch_remove_memory(int nid, u64 start, u64 size,
> -                       struct vmem_altmap *altmap)
> +void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
>  {
>         unsigned long start_pfn = start >> PAGE_SHIFT;
>         unsigned long nr_pages = size >> PAGE_SHIFT;
> diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
> index 064a967a7b6e..5c6da8d83c1a 100644
> --- a/arch/ia64/mm/init.c
> +++ b/arch/ia64/mm/init.c
> @@ -484,8 +484,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
>         return ret;
>  }
>
> -void arch_remove_memory(int nid, u64 start, u64 size,
> -                       struct vmem_altmap *altmap)
> +void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
>  {
>         unsigned long start_pfn = start >> PAGE_SHIFT;
>         unsigned long nr_pages = size >> PAGE_SHIFT;
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index ad198b439222..c3c4e31462ec 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -119,8 +119,7 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
>         return rc;
>  }
>
> -void __ref arch_remove_memory(int nid, u64 start, u64 size,
> -                             struct vmem_altmap *altmap)
> +void __ref arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
>  {
>         unsigned long start_pfn = start >> PAGE_SHIFT;
>         unsigned long nr_pages = size >> PAGE_SHIFT;
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index 8ac710de1ab1..d85bd7f5d8dc 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -306,8 +306,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
>         return rc;
>  }
>
> -void arch_remove_memory(int nid, u64 start, u64 size,
> -                       struct vmem_altmap *altmap)
> +void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
>  {
>         unsigned long start_pfn = start >> PAGE_SHIFT;
>         unsigned long nr_pages = size >> PAGE_SHIFT;
> diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
> index ce26c7f8950a..506784702430 100644
> --- a/arch/sh/mm/init.c
> +++ b/arch/sh/mm/init.c
> @@ -414,8 +414,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
>         return ret;
>  }
>
> -void arch_remove_memory(int nid, u64 start, u64 size,
> -                       struct vmem_altmap *altmap)
> +void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
>  {
>         unsigned long start_pfn = PFN_DOWN(start);
>         unsigned long nr_pages = size >> PAGE_SHIFT;
> diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
> index 74b78840182d..bd90b8fe81e4 100644
> --- a/arch/x86/mm/init_32.c
> +++ b/arch/x86/mm/init_32.c
> @@ -801,8 +801,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
>         return __add_pages(nid, start_pfn, nr_pages, params);
>  }
>
> -void arch_remove_memory(int nid, u64 start, u64 size,
> -                       struct vmem_altmap *altmap)
> +void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
>  {
>         unsigned long start_pfn = start >> PAGE_SHIFT;
>         unsigned long nr_pages = size >> PAGE_SHIFT;
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index ddeaba947eb3..a6e11763763f 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -1255,8 +1255,7 @@ kernel_physical_mapping_remove(unsigned long start, unsigned long end)
>         remove_pagetable(start, end, true, NULL);
>  }
>
> -void __ref arch_remove_memory(int nid, u64 start, u64 size,
> -                             struct vmem_altmap *altmap)
> +void __ref arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
>  {
>         unsigned long start_pfn = start >> PAGE_SHIFT;
>         unsigned long nr_pages = size >> PAGE_SHIFT;
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index d01b504ce06f..010a192298b5 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -130,8 +130,7 @@ static inline bool movable_node_is_enabled(void)
>         return movable_node_enabled;
>  }
>
> -extern void arch_remove_memory(int nid, u64 start, u64 size,
> -                              struct vmem_altmap *altmap);
> +extern void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap);
>  extern void __remove_pages(unsigned long start_pfn, unsigned long nr_pages,
>                            struct vmem_altmap *altmap);
>
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 93b3abaf9828..f2a9af3af184 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1106,7 +1106,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>         /* create memory block devices after memory was added */
>         ret = create_memory_block_devices(start, size, mhp_altmap.alloc);
>         if (ret) {
> -               arch_remove_memory(nid, start, size, NULL);
> +               arch_remove_memory(start, size, NULL);
>                 goto error;
>         }
>
> @@ -1892,7 +1892,7 @@ static int __ref try_remove_memory(int nid, u64 start, u64 size)
>
>         mem_hotplug_begin();
>
> -       arch_remove_memory(nid, start, size, altmap);
> +       arch_remove_memory(start, size, altmap);
>
>         if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
>                 memblock_free(start, size);
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 15a074ffb8d7..ed593bf87109 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -140,14 +140,11 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
>  {
>         struct range *range = &pgmap->ranges[range_id];
>         struct page *first_page;
> -       int nid;
>
>         /* make sure to access a memmap that was actually initialized */
>         first_page = pfn_to_page(pfn_first(pgmap, range_id));
>
>         /* pages are dead and unused, undo the arch mapping */
> -       nid = page_to_nid(first_page);
> -
>         mem_hotplug_begin();
>         remove_pfn_range_from_zone(page_zone(first_page), PHYS_PFN(range->start),
>                                    PHYS_PFN(range_len(range)));
> @@ -155,7 +152,7 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
>                 __remove_pages(PHYS_PFN(range->start),
>                                PHYS_PFN(range_len(range)), NULL);
>         } else {
> -               arch_remove_memory(nid, range->start, range_len(range),
> +               arch_remove_memory(range->start, range_len(range),
>                                 pgmap_altmap(pgmap));
>                 kasan_remove_zero_shadow(__va(range->start), range_len(range));
>         }

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
