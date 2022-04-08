Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF524F8F99
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 09:26:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZVDW6ST4z3cH9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 17:26:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZVCJ31lQz3bmP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 17:25:32 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KZVC65qQyz9sSd;
 Fri,  8 Apr 2022 09:25:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48HuQbzOigg3; Fri,  8 Apr 2022 09:25:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KZVC41YvQz9sSf;
 Fri,  8 Apr 2022 09:25:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1718A8B79C;
 Fri,  8 Apr 2022 09:25:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pnH8sFJh-bTC; Fri,  8 Apr 2022 09:25:19 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.13])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A64348B798;
 Fri,  8 Apr 2022 09:25:19 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2387PBd7637055
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 8 Apr 2022 09:25:11 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2387PAoN637053;
 Fri, 8 Apr 2022 09:25:10 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v9 0/4] mm: Enable conversion of powerpc to default topdown
 mmap layout
Date: Fri,  8 Apr 2022 09:24:58 +0200
Message-Id: <cover.1649401201.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1649402686; l=3749; s=20211009;
 h=from:subject:message-id; bh=mbaN0Ay/dxvG6sk8Y2S8aeUg8HVugbWpxoBP9ZgeYPY=;
 b=mBQu3vjXEDLkH/Up0d17Vu6+vefUbydIx+LkIDPw6BCnb/nCnGzkhoklm8laUOnJB9FI85g6f7JF
 4k9v7gAcBP4Rh88gOkldx5FKs/3T645i9jh3IFRQ7Vse0jPsI2dS
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rebased on top of Linux 5.18-rc1

This is the mm part of the series that converts powerpc to default
topdown mmap layout, for merge into v5.18

powerpc requires its own arch_get_unmapped_area() only when
slices are needed, which is only for book3s/64. First part of
the series moves slices into book3s/64 specific directories
and cleans up other subarchitectures.

The actual convertion of powerpc to default topdown mmap layout will
then be resent in a follow-up series for application on v5.19

First patch modifies the core mm to allow powerpc to still provide its
own arch_randomize_brk()

Second patch modifies core mm to give len and flags to
arch_get_mmap_end() as powerpc needs it. 

Third patch modifies core mm to allow powerpc to use generic versions
of get_unmapped_area functions for Radix while still providing its own
implementation for Hash, the selection between Radix and Hash being
done at runtime.

Fourth patch is a complement/fix of f6795053dac8 ("mm: mmap: Allow for
"high" userspace addresses") for hugetlb. It adds support for "high"
userspace addresses that are optionally supported on the system and
have to be requested via a hint mechanism ("high" addr parameter to mmap).

Previous version of the series is available at
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?state=*&series=289718

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Changes in v9:
- Sending mm patches and powerpc patches separately with the objective
of mm patches going into kernel v5.18 and powerpc patches folling up
into kernel v5.19

Changes in v8:
- Moved patch "sizes.h: Add SZ_1T macro" up from which is already in linux-next but not in Linus tree yet.
- Rebased on today's powerpc/next

Changes in v7:
- Taken into account comments from Catalin (patches 3 and 4)

Changes in v6:
- New patch (patch 4) to take arch_get_mmap_base() and arch_get_mmap_end() into account in generic hugetlb_get_unmapped_area()
- Get back arch_randomize_brk() simplification as it relies on default topdown mmap layout.
- Fixed precedence between || and && in powerpc's arch_get_mmap_end() (patch 9)

Changes in v5:
- Added patch 3
- Added arch_get_mmap_base() and arch_get_mmap_end() to patch 7 to better match original powerpc behaviour
- Switched patched 10 and 11 and performed full randomisation in patch 10 just before switching to default implementation, as suggested by Nic.

Changes in v4:
- Move arch_randomize_brk() simplification out of this series
- Add a change to core mm to enable using generic implementation
while providing arch specific one at the same time.
- Reworked radix get_unmapped_area to use generic implementation
- Rebase on top of Nic's series v6

Changes in v3:
- Fixed missing <linux/elf-randomize.h> in last patch
- Added a patch to move SZ_1T out of drivers/pci/controller/pci-xgene.c

Changes in v2:
- Moved patch 4 before patch 2
- Make generic arch_randomize_brk() __weak
- Added patch 9

Christophe Leroy (4):
  mm: Allow arch specific arch_randomize_brk() with
    CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
  mm, hugetlbfs: Allow an arch to always use generic versions of
    get_unmapped_area functions
  mm: Add len and flags parameters to arch_get_mmap_end()
  mm, hugetlbfs: Allow for "high" userspace addresses

 arch/arm64/include/asm/processor.h |  4 +--
 fs/hugetlbfs/inode.c               | 26 ++++++++++++------
 include/linux/hugetlb.h            |  5 ++++
 include/linux/sched/mm.h           | 17 ++++++++++++
 mm/mmap.c                          | 43 ++++++++++++++++++------------
 mm/util.c                          |  2 +-
 6 files changed, 69 insertions(+), 28 deletions(-)

-- 
2.35.1

