Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C832C6FC3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 16:28:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjwPc06FmzDrVL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 02:28:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r3NsuPL7; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjwLt4ZYtzDrQ8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 02:26:13 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id o4so4408401pgj.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 07:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GHPYzM4jRC5rTtI6jITOYY+6mqWQDFCFmyVj9lbViqM=;
 b=r3NsuPL716Gbgc91UvbQ7Phv454iWIU3Ws+yRn1NF8ztZyJQEC12d/w6ht7/hkUIB2
 GQ7zk+ZsmiUP5fj1Y+CNw5ilGJdKf4uR1xAysGjstUx2EwVyBaj6ky+/iCCcGC0qaSsg
 59lI7fxzzbMkqSVze/gFz01BoXbyZF1+wGQGjIzJk6gTPmzDzS20twqYprzF16NuikVx
 Y/vMpPW187nLpKZmVnGk2UdsdFIN81xJkOTSUMC3UHpC1rmRNPfRfsv9f9hq2pLTO0of
 tJBpJn8dn4aff5mwgKy4I/VDRXC6xdx0Q+4BBGlWQ3Xj4xlZ36ycPUhKIrWGWIsJCQ58
 c74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GHPYzM4jRC5rTtI6jITOYY+6mqWQDFCFmyVj9lbViqM=;
 b=pq7KzUG14CukJC351WxvrwmroJ5ZE5eaDDcqRcYG8ZM3WXDyvNLAYEtgmsouIIL+E2
 tlDO360aMGE5D6WFvh99y7f6TSXmFKxKfnnrVIu3zbDi+CrhQ4Jok/ps20TuOE4gp4iF
 U67ztg4Aoouw7I+Ci6S/hLyuSODi763gllx2G0RqrnYO+3rxGD5Lcv1EXkG5Fk91XrfQ
 TaoBzxaflpuzbdKkLgUv0j36C4lwawvAssbgstpNup1MBwa5R+paOKGNLrOD2l/JmH57
 llkNnV1gTNxt33GwAkLDAXIRHN3q606yc9GClaa1wECEw5RwMaT5+r1SmHUt+V/o7Nmk
 6uJg==
X-Gm-Message-State: AOAM531cNuxZuROiP3h5eLcOBfLHDN58y27Bm+SG3ZlEJTMfH8nR2BOi
 19VX3/V6jrPICpa/40a28ks=
X-Google-Smtp-Source: ABdhPJzATmCEtGS9aoj2vYvtmzZ2I4PDKHAI5rV7JzJixtHGXrGtJ2A5RqcQYH/fOjEekJVYwlteoQ==
X-Received: by 2002:aa7:8f09:0:b029:18c:4cc6:891d with SMTP id
 x9-20020aa78f090000b029018c4cc6891dmr11676493pfr.46.1606577169501; 
 Sat, 28 Nov 2020 07:26:09 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id d22sm15500173pjw.11.2020.11.28.07.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 07:26:08 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 00/12] huge vmalloc mappings
Date: Sun, 29 Nov 2020 01:25:47 +1000
Message-Id: <20201128152559.999540-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andrew,

Please consider this for -mm.

Thanks,
Nick

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
- Hopefully this time fix the arm64 vmap stack bug, thanks Jonathan
  Cameron for debugging the cause of this (hopefully).

Since v2:
- Rebased on vmalloc cleanups, split series into simpler pieces.
- Fixed several compile errors and warnings
- Keep the page array and accounting in small page units because
  struct vm_struct is an interface (this should fix x86 vmap stack debug
  assert). [Thanks Zefan]
*** BLURB HERE ***

Nicholas Piggin (12):
  mm/vmalloc: fix vmalloc_to_page for huge vmap mappings
  mm: apply_to_pte_range warn and fail if a large pte is encountered
  mm/vmalloc: rename vmap_*_range vmap_pages_*_range
  mm/ioremap: rename ioremap_*_range to vmap_*_range
  mm: HUGE_VMAP arch support cleanup
  powerpc: inline huge vmap supported functions
  arm64: inline huge vmap supported functions
  x86: inline huge vmap supported functions
  mm: Move vmap_range from mm/ioremap.c to mm/vmalloc.c
  mm/vmalloc: add vmap_range_noflush variant
  mm/vmalloc: Hugepage vmalloc mappings
  powerpc/64s/radix: Enable huge vmalloc mappings

 .../admin-guide/kernel-parameters.txt         |   2 +
 arch/Kconfig                                  |   4 +
 arch/arm64/include/asm/vmalloc.h              |  25 +
 arch/arm64/mm/mmu.c                           |  26 -
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/include/asm/vmalloc.h            |  21 +
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  21 -
 arch/x86/include/asm/vmalloc.h                |  23 +
 arch/x86/mm/ioremap.c                         |  19 -
 arch/x86/mm/pgtable.c                         |  13 -
 include/linux/io.h                            |   9 -
 include/linux/vmalloc.h                       |  10 +
 init/main.c                                   |   1 -
 mm/ioremap.c                                  | 225 +--------
 mm/memory.c                                   |  66 ++-
 mm/page_alloc.c                               |   5 +-
 mm/vmalloc.c                                  | 453 +++++++++++++++---
 17 files changed, 529 insertions(+), 395 deletions(-)

-- 
2.23.0

