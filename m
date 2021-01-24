Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C15301A8A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 09:25:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DNmKT4MJSzDqmq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 19:25:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Fs0JCb3p; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DNmGD2fGrzDqkB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 19:22:58 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id b5so6621409pjl.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 00:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vxwgyuW5XH28Q8/mj8v779VyclgJcF5KFu/DzCcjZnI=;
 b=Fs0JCb3pwKQ3Qw2tgKBDrI0dac88HUkrErNJBG0hmRLf5MyNBR21T+TPQXWbZhzXWR
 5CKgAqureRQX5U3msaUj+PUlSx+eroPq001obnVV7TfXWOm2oSyNkyE7wZM7J9Pv8Mta
 xDge4jkywbVh2WRt+ij2Wvj7yIwZDjn6BDaEtOt4/C2gHaR7aiHu96kIa1ZiMKOG6JX1
 Vdh6g9cgk2rsp+rAgX7ps8P3fUZTlODulpbF24noaVvODB7zOCWZr/S0xRJRBhHCPNRm
 j4Jo4Rxa5z8wzdHpC1OgyDz4e7JPp8DkXwn0yn6X7IPbVkLVco3Zbc8HUofZ34N5kcGN
 zLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vxwgyuW5XH28Q8/mj8v779VyclgJcF5KFu/DzCcjZnI=;
 b=OVYZVG1q7d9/Flh0HC9QR6VKCXcZfBShmeF54k5qK/VNrUpY0h8dUKLDMzsXTWqEpA
 dSN9oXddizFDWUd+oBqSAJA7m+/VEoP7p1S6K9rRMx2xYbeD4BuU70xTZnG+5MrDK17y
 zgCKHJGjYgB0uR4TCvft/uoDl7M5BbLthyDz5f13w4MBK4CoKmqLUbROSoqv9G0omXSK
 RPd5wY6DlEY22NjFp/fShSgFbdaWT8qYYmTeeVardcnNRXhx+X6PUAI5RMjMt3qp1GGl
 gTq/yKMVTq1uQPh005CJb9j4kUO9RqL3BGmhSQB3a7j4K5pZdP5KgvD1MSBnqqSBY173
 ETcA==
X-Gm-Message-State: AOAM531ZQvnlOonUKYCHPBoJcnFH3zINoQxCR0zlzYKi3RVbCvhu8Efy
 F3tHhTHl8FVOWJjMsASzX3eAR+a1yDs=
X-Google-Smtp-Source: ABdhPJwork++HKOseNPRq3Vls6uVbkN5KsPiEY5ah8ze3Qk+PSvpG3taYXPMNJK4g7gAUsggjvJOSg==
X-Received: by 2002:a17:90b:b0b:: with SMTP id
 bf11mr10064810pjb.122.1611476573791; 
 Sun, 24 Jan 2021 00:22:53 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id gb12sm11799757pjb.51.2021.01.24.00.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 00:22:53 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v10 00/12] huge vmalloc mappings
Date: Sun, 24 Jan 2021 18:22:18 +1000
Message-Id: <20210124082230.2118861-1-npiggin@gmail.com>
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
 Christoph Hellwig <hch@infradead.org>, Zefan Li <lizefan@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixed a couple of bugs that Ding noticed in review and testing.

Thanks,
Nick

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
 mm/vmalloc.c                                  | 455 +++++++++++++++---
 18 files changed, 563 insertions(+), 399 deletions(-)

-- 
2.23.0

