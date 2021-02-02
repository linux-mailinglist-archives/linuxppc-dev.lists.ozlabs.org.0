Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB7E30D07C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:52:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVjnG06PJzDqQw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:52:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M3wshu9W; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVMRb0kDWzDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 22:05:27 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id o16so14672988pgg.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Feb 2021 03:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fqt4DThxdKNuSOBjCZQBQQc5bLu6VHMom1GHVDUjPiM=;
 b=M3wshu9WFXWfg1u2zWH4MoOooVL5HvLFGznDmgd10bY1jLa0swW2qOHHlmejGgZXh6
 MCokFcCI8oAiuqy/5WEZznys9zmJlSxCiSsghopCOTgxmN0ZNzEWB87sMjNrStzUS1mp
 eYBiz7qaoI8T0URRpPzEw+7B1KGSjrigbZS3nVRZE0tVcAsdwxhKkn64BLL+OHYm7uev
 YKcywPeeOgoEYgfBHrO/iX7ks6Ca0xm/pqoVF5OQkn2QHtPXXEcr/FQnmZ2OZQG+WdIW
 FiLzawqcp+gpq5a4PpgzgVRqwkc6nMsMTt6AplOZ4E25dztGgRsujnLQLDdahqXrJ/b3
 6crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fqt4DThxdKNuSOBjCZQBQQc5bLu6VHMom1GHVDUjPiM=;
 b=YrDNooC7nDgMyBY8yyrnWCK/FXWx/t0mhzANCKA6ipFXl3aVVN+06gPl6IINglvwgy
 OK/Q5BHaGMcf1Mg+NW46ekIjrkwUBaSL4DE/1PeHGrn8kTyyxB/beao0kuFop21UeceE
 heQKQe0Mb3a/bxhsXet9Xfko4s1lPVgH6Ks0i7KPZthiSDbOlP+xuyHsX5fewOD9lRCk
 hKnaByFs0ygGGE0eZ8xI8cLXW3vHp0J36hfn8GQQZvG4U7709NyjKzhqfyOd6of3xnu6
 eMG7VWQk6h9pbk8JBgysX30LXefNaQUv7HIc6JRKZeEez2zTlGpdUkHXwnpyyJppkFkZ
 pIsw==
X-Gm-Message-State: AOAM533ewA5AMei+Ui4S59JHL7XjKpJovK2TGNfIsIuLNwt83Weoh0f5
 TuZ80FmFyv0zdkSgcI6ExX4=
X-Google-Smtp-Source: ABdhPJxhnGIeHb6UDmUQMJXJ/+PphBnJNTyr7MTD4n2tqqbe1fej56ZLHpSXYU0W7n4OzBsp04H+Iw==
X-Received: by 2002:a62:3301:0:b029:1d0:2621:372b with SMTP id
 z1-20020a6233010000b02901d02621372bmr200562pfz.67.1612263924060; 
 Tue, 02 Feb 2021 03:05:24 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-242-11-44.static.tpgi.com.au.
 [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id g19sm3188979pfk.113.2021.02.02.03.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 03:05:23 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v12 00/14] huge vmalloc mappings
Date: Tue,  2 Feb 2021 21:05:01 +1000
Message-Id: <20210202110515.3575274-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Should be getting close now. No doubt there will be a few more
things but I can do incremental fixes for small things if this gets
into -mm.

Thanks,
Nick

Since v11:
- ARM compile fix (patch 1)
- debug_vm_pgtable compile fix

Since v10:
- Fixed code style, most > 80 colums, tweak patch titles, etc [thanks Christoph]
- Made huge vmalloc code and data structure compile away if unselected
  [Christoph]
- Archs only have to provide arch_vmap_p?d_supported for levels they
  implement [Christoph]

Since v9:
- Fixed intermediate build breakage on x86-32 !PAE [thanks Ding]
- Fixed small page fallback case vm_struct double-free [thanks Ding]

Since v8:
- Fixed nommu compile.
- Added Kconfig option help text
- Added VM_NOHUGE which should help archs implement it [suggested by Rick]

Since v7:
- Rebase, added some acks, compile fix
- Removed "order=" from vmallocinfo, it's a bit confusing (nr_pages
  is in small page size for compatibility).
- Added arch_vmap_pmd_supported() test before starting to allocate
  the large page, rather than only testing it when doing the map, to
  avoid unsupported configs trying to allocate huge pages for no
  reason.

Since v6:
- Fixed a false positive warning introduced in patch 2, found by
  kbuild test robot.

Since v5:
- Split arch changes out better and make the constant folding work
- Avoid most of the 80 column wrap, fix a reference to lib/ioremap.c
- Fix compile error on some archs

Since v4:
- Fixed an off-by-page-order bug in v4
- Several minor cleanups.
- Added page order to /proc/vmallocinfo
- Added hugepage to alloc_large_system_hage output.
- Made an architecture config option, powerpc only for now.

Since v3:
- Fixed an off-by-one bug in a loop
- Fix !CONFIG_HAVE_ARCH_HUGE_VMAP build fail

Nicholas Piggin (14):
  ARM: mm: add missing pud_page define to 2-level page tables
  mm/vmalloc: fix HUGE_VMAP regression by enabling huge pages in
    vmalloc_to_page
  mm: apply_to_pte_range warn and fail if a large pte is encountered
  mm/vmalloc: rename vmap_*_range vmap_pages_*_range
  mm/ioremap: rename ioremap_*_range to vmap_*_range
  mm: HUGE_VMAP arch support cleanup
  powerpc: inline huge vmap supported functions
  arm64: inline huge vmap supported functions
  x86: inline huge vmap supported functions
  mm/vmalloc: provide fallback arch huge vmap support functions
  mm: Move vmap_range from mm/ioremap.c to mm/vmalloc.c
  mm/vmalloc: add vmap_range_noflush variant
  mm/vmalloc: Hugepage vmalloc mappings
  powerpc/64s/radix: Enable huge vmalloc mappings

 .../admin-guide/kernel-parameters.txt         |   2 +
 arch/Kconfig                                  |  11 +
 arch/arm/include/asm/pgtable-3level.h         |   2 -
 arch/arm/include/asm/pgtable.h                |   3 +
 arch/arm64/include/asm/vmalloc.h              |  24 +
 arch/arm64/mm/mmu.c                           |  26 -
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/include/asm/vmalloc.h            |  20 +
 arch/powerpc/kernel/module.c                  |  21 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  21 -
 arch/x86/include/asm/vmalloc.h                |  20 +
 arch/x86/mm/ioremap.c                         |  19 -
 arch/x86/mm/pgtable.c                         |  13 -
 include/linux/io.h                            |   9 -
 include/linux/vmalloc.h                       |  46 ++
 init/main.c                                   |   1 -
 mm/debug_vm_pgtable.c                         |   4 +-
 mm/ioremap.c                                  | 225 +-------
 mm/memory.c                                   |  66 ++-
 mm/page_alloc.c                               |   5 +-
 mm/vmalloc.c                                  | 484 +++++++++++++++---
 21 files changed, 619 insertions(+), 404 deletions(-)

-- 
2.23.0

