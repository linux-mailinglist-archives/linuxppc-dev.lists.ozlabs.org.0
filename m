Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 355022CFA15
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 08:00:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cp0nb6Z5PzDqjN
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 18:00:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J39tLhFd; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cp0kw1DqtzDqf4
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 17:57:40 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id hk16so4475208pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Dec 2020 22:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=074wL6ZBgABmXkOs/NT61EJN0HBh0dhkxvXZ++X/yaI=;
 b=J39tLhFdiM/eYZNAhg85XVZeU7vlVYLTE2YpuzmX6S36rV2NljZYLQse33dtlTfU+D
 P0A9XxiD/TRZFku3U3uZmRO+9sMfVlrPdOrUY0ub9mOfSoaFbGi7KBycRjIRZ1I1f7G3
 AOg0CwR2kDU4wX7GGBTPPl2qINMfeDZC+MT4uWns92NjqsKo/IZwtBmm7faHE4YvF91k
 XkzZVlYRiLabOUV2ZGcN1Y2QhSwfLCZwb3ldvzRkdexCD//G76XOV0MFbsjUrZ5g0ov+
 SorgGaftGRsp0BWTZImGOqW1L2K+kHrJOBP8qwt2V6kfphRegH2pVENoKPosU6WKDL5u
 S8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=074wL6ZBgABmXkOs/NT61EJN0HBh0dhkxvXZ++X/yaI=;
 b=nz+6j/GejjGSxSdQz9JgIJvLndv6IFnRAbfgzxsE7c9x+e7Fnur9Ws5Jlrc2e4hlUT
 A83bd7G/b2yUpLGE2o3s1lh/dCf6uVX1UsXLf2WPQnPeHPMKskPEpisI2AVeSG596REV
 IGrF5c0cKN80YgurSmvRe1cHIUwmz351huxWVS6ZikERU6bPw4Y0IaLr1qrSf7EBR+Gc
 cg9JHIaSt3e9jpihpJ0nL9fQoVFEzKbjGdVImnu7juntNN7KxsqBVJGoCZ9/YOExGjg/
 4bVN7ETu6/+6yQlD6x2LNRUXFXrc9wIOrffNFNBIKarzFTZ/yrZbOnwemK35r/6y3zsE
 qrXQ==
X-Gm-Message-State: AOAM532IVnjiIFVbrtW2w6/Mylra4ESOJKmH5sAAnJDPXQdfyFse6cgw
 y0Ie9BDQfx16NiKgOZXAqBQ=
X-Google-Smtp-Source: ABdhPJwD8LBysVSEMi9XYXVOROVfRZw/7sF9SVYYn1E01iFvQoYVyH6bH0o2iaHCD6/K8Gh1B/sbWQ==
X-Received: by 2002:a17:902:9b85:b029:da:1684:cc82 with SMTP id
 y5-20020a1709029b85b02900da1684cc82mr7368955plp.41.1607151456568; 
 Fri, 04 Dec 2020 22:57:36 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([1.129.145.238])
 by smtp.gmail.com with ESMTPSA id a14sm1110848pfl.141.2020.12.04.22.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 22:57:35 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v9 00/12] huge vmalloc mappings
Date: Sat,  5 Dec 2020 16:57:13 +1000
Message-Id: <20201205065725.1286370-1-npiggin@gmail.com>
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
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andrew,

A couple of things Rick noticed, he's working on huge module mappings
to help iTLB pressure and seems to think this series will be useful
infrastructure for his work.

I think it finally should be just about ready.

Thanks,
Nick

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
- Hopefully this time fix the arm64 vmap stack bug, thanks Jonathan
  Cameron for debugging the cause of this (hopefully).

Since v2:
- Rebased on vmalloc cleanups, split series into simpler pieces.
- Fixed several compile errors and warnings
- Keep the page array and accounting in small page units because
  struct vm_struct is an interface (this should fix x86 vmap stack debug
  assert). [Thanks Zefan]

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
 arch/Kconfig                                  |  10 +
 arch/arm64/include/asm/vmalloc.h              |  25 +
 arch/arm64/mm/mmu.c                           |  26 -
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/include/asm/vmalloc.h            |  21 +
 arch/powerpc/kernel/module.c                  |  13 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  21 -
 arch/x86/include/asm/vmalloc.h                |  23 +
 arch/x86/mm/ioremap.c                         |  19 -
 arch/x86/mm/pgtable.c                         |  13 -
 include/linux/io.h                            |   9 -
 include/linux/vmalloc.h                       |  27 ++
 init/main.c                                   |   1 -
 mm/ioremap.c                                  | 225 +--------
 mm/memory.c                                   |  66 ++-
 mm/page_alloc.c                               |   5 +-
 mm/vmalloc.c                                  | 454 +++++++++++++++---
 18 files changed, 564 insertions(+), 397 deletions(-)

-- 
2.23.0

