Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 241E679AAF4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 21:04:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rkx3M05Jtz3cRX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 05:04:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rkx2M1SFpz2ysC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 05:03:39 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Rkx291PXKz9vSS;
	Mon, 11 Sep 2023 21:03:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nw_bHQy6cjNy; Mon, 11 Sep 2023 21:03:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Rkx2742kJz9vQn;
	Mon, 11 Sep 2023 21:03:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 839748B7AA;
	Mon, 11 Sep 2023 21:03:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 1Aha5oiT8Wcj; Mon, 11 Sep 2023 21:03:27 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.38])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EB0518B77E;
	Mon, 11 Sep 2023 21:03:26 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38BJ3HXC3544184
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 21:03:17 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38BJ3F803544183;
	Mon, 11 Sep 2023 21:03:15 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 00/19] cleanup/refactor pgtable.h
Date: Mon, 11 Sep 2023 21:03:06 +0200
Message-ID: <cover.1694443576.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694458986; l=2457; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=cMC5CM0Co62UlKRzr9IgsouT1QS7HSdNBF4JZ/jKI4U=; b=SZjIrvl7eXBvcatDJaQ5T8kRxMzlWITwENi0XyNE+pEo+41yNIN71CSHevU1v9C6ynGI0BOzX tRTKTHrvPyQCapPPeW5D3wzxomwYfD4JGttFWaLC8hrkJaLI2PquNcY
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is a cleanup of pgtable.h for nohash mainly

Main purpose is to refactor a lot of common code between
nohash/32 and nohash/64.

This series is a prerequisite for following series that will
rework PAGE flags and implement execute-only protection.

Christophe Leroy (19):
  powerpc/8xx: Fix pte_access_permitted() for PAGE_NONE
  powerpc/64e: Fix wrong test in __ptep_test_and_clear_young()
  powerpc/40x: Remove stale PTE_ATOMIC_UPDATES macro
  powerpc: Remove pte_ERROR()
  powerpc: Deduplicate prototypes of ptep_set_access_flags() and
    phys_mem_access_prot()
  powerpc: Refactor update_mmu_cache_range()
  powerpc: Untangle fixmap.h and pgtable.h and mmu.h
  powerpc/nohash: Remove {pte/pmd}_protnone()
  powerpc/nohash: Refactor declaration of {map/unmap}_kernel_page()
  powerpc/nohash: Move 8xx version of pte_update() into pte-8xx.h
  powerpc/nohash: Replace #ifdef CONFIG_44x by IS_ENABLED(CONFIG_44x) in
    pgtable.h
  powerpc/nohash: Refactor pte_update()
  powerpc/nohash: Refactor checking of no-change in pte_update()
  powerpc/nohash: Deduplicate _PAGE_CHG_MASK
  powerpc/nohash: Deduplicate pte helpers
  powerpc/nohash: Refactor ptep_test_and_clear_young()
  powerpc/nohash: Deduplicate ptep_set_wrprotect() and
    ptep_get_and_clear()
  powerpc/nohash: Refactor pte_clear()
  powerpc/nohash: Refactor __ptep_set_access_flags()

 arch/powerpc/include/asm/book3s/32/pgtable.h |  12 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h |   3 +-
 arch/powerpc/include/asm/book3s/pgtable.h    |  33 ---
 arch/powerpc/include/asm/fixmap.h            |  16 +-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h |   1 -
 arch/powerpc/include/asm/nohash/32/pgtable.h | 201 +------------------
 arch/powerpc/include/asm/nohash/32/pte-40x.h |   3 -
 arch/powerpc/include/asm/nohash/32/pte-8xx.h |  64 ++++++
 arch/powerpc/include/asm/nohash/64/pgtable.h | 118 +----------
 arch/powerpc/include/asm/nohash/pgtable.h    | 182 +++++++++++++----
 arch/powerpc/include/asm/pgtable.h           |  32 +++
 arch/powerpc/mm/init_32.c                    |   1 +
 arch/powerpc/mm/mem.c                        |   1 +
 arch/powerpc/mm/nohash/8xx.c                 |   2 +
 arch/powerpc/mm/nohash/book3e_pgtable.c      |   2 +-
 arch/powerpc/mm/nohash/e500_hugetlbpage.c    |   3 +-
 arch/powerpc/platforms/8xx/cpm1.c            |   1 +
 17 files changed, 268 insertions(+), 407 deletions(-)

-- 
2.41.0

