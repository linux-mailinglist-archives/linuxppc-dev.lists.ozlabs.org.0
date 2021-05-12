Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DCE37B53F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 07:01:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fg2gq1BH9z3bTv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 15:01:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fg2gS5RHYz2yXk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 15:01:04 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fg2gH0m2Rz9sdy;
 Wed, 12 May 2021 07:00:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XsPm6W350ZRE; Wed, 12 May 2021 07:00:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fg2gG6sQxz9sdw;
 Wed, 12 May 2021 07:00:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 79F568B7D6;
 Wed, 12 May 2021 07:00:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xwiuG9ynOkOh; Wed, 12 May 2021 07:00:58 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 015118B769;
 Wed, 12 May 2021 07:00:57 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id AE30264164; Wed, 12 May 2021 05:00:57 +0000 (UTC)
Message-Id: <cover.1620795204.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 0/5] Implement huge VMAP and VMALLOC on powerpc 8xx
To: Andrew Morton <akpm@linux-foundation.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>
Date: Wed, 12 May 2021 05:00:57 +0000 (UTC)
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

This series implements huge VMAP and VMALLOC on powerpc 8xx.

Powerpc 8xx has 4 page sizes:
- 4k
- 16k
- 512k
- 8M

At the time being, vmalloc and vmap only support huge pages which are
leaf at PMD level.

Here the PMD level is 4M, it doesn't correspond to any supported
page size.

For now, implement use of 16k and 512k pages which is done
at PTE level.

Support of 8M pages will be implemented later, it requires use of
hugepd tables.

To allow this, the architecture provides two functions:
- arch_vmap_pte_range_map_size() which tells vmap_pte_range() what
page size to use. A stub returning PAGE_SIZE is provided when the
architecture doesn't provide this function.
- arch_vmap_pte_supported_shift() which tells __vmalloc_node_range()
what page shift to use for a given area size. A stub returning
PAGE_SHIFT is provided when the architecture doesn't provide this
function.

The main change in v2 compared to the RFC is that powerpc 8xx
specificities are not plugged anymore directly inside vmalloc code.

Christophe Leroy (5):
  mm/hugetlb: Change parameters of arch_make_huge_pte()
  mm/pgtable: Add stubs for {pmd/pub}_{set/clear}_huge
  mm/vmalloc: Enable mapping of huge pages at pte level in vmap
  mm/vmalloc: Enable mapping of huge pages at pte level in vmalloc
  powerpc/8xx: Add support for huge pages on VMAP and VMALLOC

 arch/arm64/include/asm/hugetlb.h              |  3 +-
 arch/arm64/mm/hugetlbpage.c                   |  5 +--
 arch/powerpc/Kconfig                          |  2 +-
 .../include/asm/nohash/32/hugetlb-8xx.h       |  5 +--
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h  | 43 +++++++++++++++++++
 arch/sparc/include/asm/pgtable_64.h           |  3 +-
 arch/sparc/mm/hugetlbpage.c                   |  6 +--
 include/linux/hugetlb.h                       |  4 +-
 include/linux/pgtable.h                       | 26 ++++++++++-
 include/linux/vmalloc.h                       | 15 +++++++
 mm/hugetlb.c                                  |  6 ++-
 mm/migrate.c                                  |  4 +-
 mm/vmalloc.c                                  | 34 +++++++++++----
 13 files changed, 126 insertions(+), 30 deletions(-)

-- 
2.25.0

