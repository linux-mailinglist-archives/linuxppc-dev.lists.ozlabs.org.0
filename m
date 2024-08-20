Return-Path: <linuxppc-dev+bounces-233-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2211A958D2D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 19:24:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpGYC3Y9Fz2y8k;
	Wed, 21 Aug 2024 03:24:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpGYC19bJz2xPL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 03:24:28 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WpGY54F2Sz9sSK;
	Tue, 20 Aug 2024 19:24:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EhOvV_YNy5du; Tue, 20 Aug 2024 19:24:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WpGY537Y7z9sSH;
	Tue, 20 Aug 2024 19:24:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 555D48B779;
	Tue, 20 Aug 2024 19:24:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Fciq5aS0IFe3; Tue, 20 Aug 2024 19:24:25 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.72])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E39AA8B763;
	Tue, 20 Aug 2024 19:24:24 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: CASAUBON Jean Michel <jean-michel.casaubon@cs-soprasteria.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/14] Reduce alignment constraint on STRICT_KERNEL_RWX and speed-up TLB misses on 8xx and 603
Date: Tue, 20 Aug 2024 19:23:44 +0200
Message-ID: <cover.1724173828.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724174647; l=2698; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=gTta4f3jaT+jWY0auhaD//hXnmuziWuUHy3TgHHYXUg=; b=xC7dWx5C6HJGMCqgWXUtATxKUvFEOaQv/VtHA77ieLJUgUz1UbvI+S472+R14TnuWw/CpSgUk CVzgx3Kru4mBjSNVMlkQDPWVSh7zDDp/LhgkOUbPAF6POyiffaQveR0
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

This series does mainly two things:
- Remove the 8M alignment constraint on STRICT_KERNEL_RWX on 8xx to
avoid wasting memory.
- Speed-up TLB misses by duplicating kernel PGD entries into each
task's PGDIRs to avoid the address comparison in TLB miss handler.

On 8xx, the address comparison takes a significant part of CPU cycles
as it requires saving/restoring CR, and because a taken branch
requires 2 cycles.
On 603 it is less significant because CR is saved automatically and
has to be restored anyway but it is still worth it.

For ITLB misses:
- Kernel PGD entries are setup for once during init, before creation
of new PGDIRs.
- Module PGD entries are setup also at init by preallocating page
tables for a very few number of pages

For DTLB misses:
- Some handling is added in 8xx DATA TLB error interrupt and in
603 DATA read and store TLB miss interrupts to copy missing PGD
entries into child.

The cost of that additional handling on error paths is worth the gain
on hot TLB miss pathes.

Because 8xx and 603 don't use leaf kernel pages at PGD level, there is
no need to care about PGD entries cleanup, page tables are never freed.

Christophe Leroy (14):
  powerpc/8xx: Fix initial memory mapping
  powerpc/8xx: Fix kernel vs user address comparison
  powerpc/8xx: Copy kernel PGD entries into all PGDIRs
  Revert "powerpc/8xx: Always pin kernel text TLB"
  powerpc/8xx: Allow setting DATA alignment even with STRICT_KERNEL_RWX
  powerpc/8xx: Reduce default size of module/execmem area
  powerpc/8xx: Preallocate execmem page tables
  powerpc/8xx: Inconditionally use task PGDIR in ITLB misses
  powerpc/8xx: Inconditionally use task PGDIR in DTLB misses
  powerpc/32s: Reduce default size of module/execmem area
  powerpc/603: Copy kernel PGD entries into all PGDIRs and preallocate
    execmem page tables
  powerpc/603: Switch r0 and r3 in TLB miss handlers
  powerpc/603: Inconditionally use task PGDIR in ITLB misses
  powerpc/603: Inconditionally use task PGDIR in DTLB misses

 arch/powerpc/Kconfig                         |  31 +++-
 arch/powerpc/include/asm/book3s/32/pgtable.h |   3 +-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h |   3 +-
 arch/powerpc/include/asm/nohash/pgalloc.h    |   8 +-
 arch/powerpc/kernel/head_8xx.S               |  78 +++++-----
 arch/powerpc/kernel/head_book3s_32.S         | 144 +++++++++----------
 arch/powerpc/mm/book3s32/mmu.c               |   2 +
 arch/powerpc/mm/mem.c                        |  14 ++
 arch/powerpc/mm/nohash/8xx.c                 |   9 +-
 arch/powerpc/platforms/8xx/Kconfig           |   7 +
 10 files changed, 173 insertions(+), 126 deletions(-)

-- 
2.44.0


