Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB8F36DD68
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 18:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVl0g3pQlz2yxj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 02:47:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVkzc2Q5qz2yqC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 02:46:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FVkzS05MQz9tcb;
 Wed, 28 Apr 2021 18:46:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0mBuk7O_7kHk; Wed, 28 Apr 2021 18:46:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FVkzR6Cxgz9tcY;
 Wed, 28 Apr 2021 18:46:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 720158B839;
 Wed, 28 Apr 2021 18:46:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ikFClZJogkW5; Wed, 28 Apr 2021 18:46:11 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EDB278B831;
 Wed, 28 Apr 2021 18:46:10 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B90C16428C; Wed, 28 Apr 2021 16:46:10 +0000 (UTC)
Message-Id: <cover.1619628001.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 0/4] Implement huge VMAP and VMALLOC on powerpc 8xx
To: Andrew Morton <akpm@linux-foundation.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>
Date: Wed, 28 Apr 2021 16:46:10 +0000 (UTC)
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
 linux-mm@kvack.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is a first tentative to implement huge VMAP and VMALLOC
on powerpc 8xx. This series applies on Linux next.
For the time being the 8xx specificities are plugged directly into
generic mm functions. I have no real idea on how to make it a nice
beautiful generic implementation for the time being, hence this RFC
in order to get suggestions.

powerpc 8xx has 4 page sizes:
- 4k
- 16k
- 512k
- 8M

At the time being, vmalloc and vmap only support huge pages which are
leaf at PMD level.

Here the PMD level is 4M, it doesn't correspond to any supported
page size.

For the time being, implement use of 16k and 512k pages which is done
at PTE level.

Support of 8M pages will be implemented later, it requires use of
hugepd tables.

Christophe Leroy (4):
  mm/ioremap: Fix iomap_max_page_shift
  mm/hugetlb: Change parameters of arch_make_huge_pte()
  mm/pgtable: Add stubs for {pmd/pub}_{set/clear}_huge
  mm/vmalloc: Add support for huge pages on VMAP and VMALLOC for powerpc
    8xx

 arch/arm64/include/asm/hugetlb.h              |  3 +-
 arch/arm64/mm/hugetlbpage.c                   |  5 +-
 arch/powerpc/Kconfig                          |  3 +-
 .../include/asm/nohash/32/hugetlb-8xx.h       |  5 +-
 arch/sparc/include/asm/pgtable_64.h           |  3 +-
 arch/sparc/mm/hugetlbpage.c                   |  6 +-
 include/linux/hugetlb.h                       |  4 +-
 include/linux/pgtable.h                       | 26 ++++++-
 mm/hugetlb.c                                  |  6 +-
 mm/ioremap.c                                  |  6 +-
 mm/migrate.c                                  |  4 +-
 mm/vmalloc.c                                  | 74 ++++++++++++++++---
 12 files changed, 111 insertions(+), 34 deletions(-)

-- 
2.25.0

