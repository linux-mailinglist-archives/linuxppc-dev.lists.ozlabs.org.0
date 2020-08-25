Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0030251BD1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 17:05:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbXNs11zdzDqWy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 01:05:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tQvGYTFu; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbXDH1CnhzDqP2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 00:58:06 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id m8so7564944pfh.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 07:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EV9ZwzCwV4Z9BNt841c3RBiIdIkv89NbNGG9BR4Vsvo=;
 b=tQvGYTFufQJ5ANwInffuD4W0HHbHhK3UMnx7AkOXZ23wS9FDnOwTjxSUnuDU8w4+6H
 WrzNpO/vv8kZIl9tBYikyi80TDvKRYoJRBF/EOhJ27PSG4SngR/Xuxnm4uoZDqEtmWBG
 w9Q0ZzZ9TN1p9oEP0v5cNP2EC/Qk6ju4EZSTPIhwUvYV4CJIzVxROxF6yxMWRxEcdjR3
 Wwb3UgbmDMVI5u10e62d1rDys9XDuhYY/OoRWEe7B70C4tjmS+HdaxNk2nUDyAKQCx1z
 59brznER2AMWT2lF91xyUfS5EzwwaTvRDntW33H3IP4yPpmtQ1udSgwIFm7gpknoBzQ6
 VDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EV9ZwzCwV4Z9BNt841c3RBiIdIkv89NbNGG9BR4Vsvo=;
 b=DhhOcJrw3FdjVP5yF5JYovVrN/IptSckAZzVu99joh23jkWsoinkAHrmrEVySlknMk
 7JG6LO8K0xu6m5+NOuNqRXJBH0l0I7v5jiMrZq6kLJYjmhEWBeLiCD/i8xg/jFWm/dSz
 K8WkWtTD+JK4oE6pt4mP9f3fOXijuQxbccHh7D2MBuD2QEim9cv5JY5NeG2H/JnV5ZTb
 uYgOnxSaBjtfDLDb75E9CvnUGQRhS8I8Y9/0vu/N+GEMA3nge9UUQGXchS71wK+POWaj
 XLAooqc74by5DO9E76Ru+BWEmB/fKRYjxvxhuTimacTdvL7jQzhyR65E8A7DBBQBYiaJ
 h7Rw==
X-Gm-Message-State: AOAM533/n9MQP18YHY8iH6Hi/v6/Y5qurUDtj8GLqtoIQ0G11KN307zd
 /tRo16ceS5K2935phvqvbjs=
X-Google-Smtp-Source: ABdhPJxnK3YNImOtYVgHd5D3Y/G4BRiEKbLrVsJXP4BBfTIN6Zbw6lEUoA6/orOoc47WqA6yXSiVLw==
X-Received: by 2002:a17:902:8bcc:: with SMTP id
 r12mr7892933plo.314.1598367483737; 
 Tue, 25 Aug 2020 07:58:03 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id e29sm15755956pfj.92.2020.08.25.07.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 07:58:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 00/12] huge vmalloc mappings
Date: Wed, 26 Aug 2020 00:57:41 +1000
Message-Id: <20200825145753.529284-1-npiggin@gmail.com>
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

I think it's ready to go into -mm if it gets acks for the arch
changes.

Thanks,
Nick

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
 mm/memory.c                                   |  60 ++-
 mm/page_alloc.c                               |   5 +-
 mm/vmalloc.c                                  | 443 +++++++++++++++---
 17 files changed, 515 insertions(+), 393 deletions(-)

-- 
2.23.0

