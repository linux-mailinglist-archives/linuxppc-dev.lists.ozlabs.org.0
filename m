Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A210B4B61D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 12:23:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TLdd6H2XzDqkV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 20:23:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IhsI/Eh9"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TLc012XdzDq5n
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 20:22:21 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id bi6so7011261plb.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=3jkwy9JzWkd1UukSfYYgvfZEKEYnDdPmRbkr9atVMxo=;
 b=IhsI/Eh9fnMEVCQcnT+HA2XuzMkxsOUF21cHOC/i7jD+KbRYuBGG51or0ii2/iAwbr
 0/pdl/ULJt5TNuMcesnlGAmM1ABbNy3+eYEyDkIFJkn9XTGC8jZqWle0iinxd5QnaJa4
 OhnoJF40xzsY3U5yxI+dOTMDO7FOwhN8wMwJAQy0nVvz/ZaRN+sHj0JJGDXkd3XMgZeH
 Fus7Iu2bzV5aI79y7v0Ujj7PlsCjh41HOKPlBmlWD+d7iUDAZXLLsbi6msCgJM0K5i3S
 7nAfjFTXfFJ+n6srpDmrs2mEmAT0+960WypgxiZOe9gL9X6+ajOmCBRi4ER/j8z1CTAV
 g0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=3jkwy9JzWkd1UukSfYYgvfZEKEYnDdPmRbkr9atVMxo=;
 b=USCLyuJ8Rp+0yPifk1iYDGE/1B7gQ9rTtyOaPAhEfgaCupJ6+0TG3nZ6IViSRlhIMd
 5UGWHaBDew7ibyHP3uj+8PDjjp33yazAh1MBqnd/kqZGo/pTPvtffjyzG4PuG/D5COoA
 dso4xzji5mUAnedKI5aBQjUMFVV9qRFcTTISEAj686nTmymfxbKDVMdXztfmCnUkRf6/
 Ym7KdVLhWFUejYpYfj64nJA25Wjto6U95iMAmPfWNiVTVktTXUwAVSPM45ZwILQpzMP6
 NRV1uI/WahDNSBQjNFMWAmOIaXbWofF4WkH4FVFK+hao7ZI7Y7wvS2EVFK4iTkWBewUQ
 I57w==
X-Gm-Message-State: APjAAAV2HUrH2IxigoHvQTlu1pbyCUYDWumrEL/rQ1ddd6ovUCMrCb4o
 wFwZYWqJsDybm5gr5B7/ro0=
X-Google-Smtp-Source: APXvYqzuSUgB1WWzEsCQbJUSXAzdTWxJkhgqpm3xAzI+HpfIxZ2e6B+3HlBKOEBo1PkFMCXAd6G2Og==
X-Received: by 2002:a17:902:124:: with SMTP id
 33mr58503680plb.145.1560939738586; 
 Wed, 19 Jun 2019 03:22:18 -0700 (PDT)
Received: from localhost (193-116-92-108.tpgi.com.au. [193.116.92.108])
 by smtp.gmail.com with ESMTPSA id p7sm33213537pfp.131.2019.06.19.03.22.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 03:22:18 -0700 (PDT)
Date: Wed, 19 Jun 2019 20:17:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v0] powerpc: Fix BUG_ON during memory unplug on radix
To: Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20190619074545.11761-1-bharata@linux.ibm.com>
In-Reply-To: <20190619074545.11761-1-bharata@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1560939185.n3y8722qvc.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: aneesh.kumar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bharata B Rao's on June 19, 2019 5:45 pm:
> We hit the following BUG_ON when memory hotplugged before reboot
> is unplugged after reboot:
>=20
> kernel BUG at arch/powerpc/mm/pgtable-frag.c:113!
>=20
>  remove_pagetable+0x594/0x6a0
>  (unreliable)
>  remove_pagetable+0x94/0x6a0
>  vmemmap_free+0x394/0x410
>  sparse_remove_one_section+0x26c/0x2e8
>  __remove_pages+0x428/0x540
>  arch_remove_memory+0xd0/0x170
>  __remove_memory+0xd4/0x1a0
>  dlpar_remove_lmb+0xbc/0x110
>  dlpar_memory+0xa80/0xd20
>  handle_dlpar_errorlog+0xa8/0x160
>  pseries_hp_work_fn+0x2c/0x60
>  process_one_work+0x46c/0x860
>  worker_thread+0x364/0x5e0
>  kthread+0x1b0/0x1c0
>  ret_from_kernel_thread+0x5c/0x68
>=20
> This occurs because, during reboot-after-hotplug, the hotplugged
> memory range gets initialized as regular memory and page
> tables are setup using memblock allocator. This means that we
> wouldn't have initialized the PMD or PTE fragment count for
> those PMD or PTE pages.
>=20
> Fixing this includes 3 aspects:
>=20
> - Walk the init_mm page tables from mem_init() and initialize
>   the PMD and PTE fragment counts appropriately.
> - When we do early allocation of PMD (and PGD as well) pages,
>   allocate in page size PAGE_SIZE granularity so that we are
>   sure that the complete page is available for us to set the
>   fragment count which is part of struct page.
> - When PMD or PTE page is freed, check if it comes from memblock
>   allocator and free it appropriately.
>=20
> Reported-by: Srikanth Aithal <sraithal@linux.vnet.ibm.com>
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/radix.h |  1 +
>  arch/powerpc/include/asm/sparsemem.h       |  1 +
>  arch/powerpc/mm/book3s64/pgtable.c         | 12 +++-
>  arch/powerpc/mm/book3s64/radix_pgtable.c   | 67 +++++++++++++++++++++-
>  arch/powerpc/mm/mem.c                      |  5 ++
>  arch/powerpc/mm/pgtable-frag.c             |  5 +-
>  6 files changed, 87 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/in=
clude/asm/book3s/64/radix.h
> index 574eca33f893..4320f2790e8d 100644
> --- a/arch/powerpc/include/asm/book3s/64/radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> @@ -285,6 +285,7 @@ static inline unsigned long radix__get_tree_size(void=
)
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  int radix__create_section_mapping(unsigned long start, unsigned long end=
, int nid);
>  int radix__remove_section_mapping(unsigned long start, unsigned long end=
);
> +void radix__fixup_pgtable_fragments(void);
>  #endif /* CONFIG_MEMORY_HOTPLUG */
>  #endif /* __ASSEMBLY__ */
>  #endif
> diff --git a/arch/powerpc/include/asm/sparsemem.h b/arch/powerpc/include/=
asm/sparsemem.h
> index 3192d454a733..e662f9232d35 100644
> --- a/arch/powerpc/include/asm/sparsemem.h
> +++ b/arch/powerpc/include/asm/sparsemem.h
> @@ -15,6 +15,7 @@
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  extern int create_section_mapping(unsigned long start, unsigned long end=
, int nid);
>  extern int remove_section_mapping(unsigned long start, unsigned long end=
);
> +void fixup_pgtable_fragments(void);
> =20
>  #ifdef CONFIG_PPC_BOOK3S_64
>  extern int resize_hpt_for_hotplug(unsigned long new_mem_size);
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s6=
4/pgtable.c
> index 01bc9663360d..7efe9cc16b39 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -186,6 +186,13 @@ int __meminit remove_section_mapping(unsigned long s=
tart, unsigned long end)
> =20
>  	return hash__remove_section_mapping(start, end);
>  }
> +
> +void fixup_pgtable_fragments(void)
> +{
> +	if (radix_enabled())
> +		radix__fixup_pgtable_fragments();
> +}
> +
>  #endif /* CONFIG_MEMORY_HOTPLUG */
> =20
>  void __init mmu_partition_table_init(void)
> @@ -320,7 +327,10 @@ void pmd_fragment_free(unsigned long *pmd)
>  	BUG_ON(atomic_read(&page->pt_frag_refcount) <=3D 0);
>  	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
>  		pgtable_pmd_page_dtor(page);
> -		__free_page(page);
> +		if (PageReserved(page))
> +			free_reserved_page(page);

Hmm. Rather than adding this special case here, I wonder if you can
just go along in your fixup walk and convert all these pages to
non-reserved pages?

ClearPageReserved ; init_page_count ; adjust_managed_page_count ;=20
should do the trick, right?


> +		else
> +			__free_page(page);

Thanks,
Nick
=
