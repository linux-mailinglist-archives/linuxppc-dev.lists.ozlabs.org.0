Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0196E74579A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 10:48:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvfjN6f5qz3c39
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 18:48:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qvfhv3XdJz301b
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 18:48:28 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Qvfhm13rMz9sFZ;
	Mon,  3 Jul 2023 10:48:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s56jr0HLz2no; Mon,  3 Jul 2023 10:48:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Qvfhm0Pbjz9sFY;
	Mon,  3 Jul 2023 10:48:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0A39E8B77D;
	Mon,  3 Jul 2023 10:48:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id HLKDBUvwH8fT; Mon,  3 Jul 2023 10:48:23 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DE2578B768;
	Mon,  3 Jul 2023 10:48:23 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 3638mKST1103930
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 3 Jul 2023 10:48:20 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 3638mJ431103885;
	Mon, 3 Jul 2023 10:48:19 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 0/9] Cleanup/Optimise KUAP (v2)
Date: Mon,  3 Jul 2023 10:48:04 +0200
Message-ID: <cover.1688373335.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688374083; l=2180; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=jg5CxylxOUWVvMQGhNpE+P9dYek5xUoJPjrrm3aS3JY=; b=EFpCpAJxEPCz144zmiYqdlRm+JxPY0RjpQCxCkHb5loXXVFecipiCwyhQxWEqUGGvJmSjNXVo YMc0iAnYFwhDJ92sjVU5G6K9DmzF6pnHUMuDajlX8iESLe+8PqEKOKB
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

This series is cleaning up a bit KUAP in preparation of using objtool
to validate UACCESS.

There are two main changes in this series:

1/ Simplification of KUAP on book3s/32

2/ Using ASM features on 32 bits and booke as suggested by Nic.

Those changes will be required for objtool UACCESS validation, but
even before they are worth it, especially the simplification on 32s.

Christophe Leroy (9):
  powerpc/kuap: Avoid unnecessary reads of MD_AP
  powerpc/kuap: Avoid useless jump_label on empty function
  powerpc/kuap: Fold kuep_is_disabled() into its only user
  powerpc/features: Add capability to update mmu features later
  powerpc/kuap: MMU_FTR_BOOK3S_KUAP becomes MMU_FTR_KUAP
  powerpc/kuap: Use MMU_FTR_KUAP on all and refactor disabling kuap
  powerpc/kuap: Simplify KUAP lock/unlock on BOOK3S/32
  powerpc/kuap: KUAP enabling/disabling functions must be
    __always_inline
  powerpc/kuap: Use ASM feature fixups instead of static branches

 arch/powerpc/include/asm/book3s/32/kup.h      | 131 +++++++-----------
 .../powerpc/include/asm/book3s/64/hash-pkey.h |   2 +-
 arch/powerpc/include/asm/book3s/64/kup.h      |  54 +++-----
 arch/powerpc/include/asm/bug.h                |   1 +
 arch/powerpc/include/asm/feature-fixups.h     |   1 +
 arch/powerpc/include/asm/kup.h                |  91 +++++-------
 arch/powerpc/include/asm/mmu.h                |   4 +-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  |  62 ++++-----
 arch/powerpc/include/asm/nohash/kup-booke.h   |  68 ++++-----
 arch/powerpc/include/asm/uaccess.h            |   6 +-
 arch/powerpc/kernel/cputable.c                |   4 +
 arch/powerpc/kernel/syscall.c                 |   2 +-
 arch/powerpc/kernel/traps.c                   |   2 +-
 arch/powerpc/lib/feature-fixups.c             |  31 ++++-
 arch/powerpc/mm/book3s32/kuap.c               |  20 +--
 arch/powerpc/mm/book3s32/mmu_context.c        |   2 +-
 arch/powerpc/mm/book3s64/pkeys.c              |   2 +-
 arch/powerpc/mm/init_32.c                     |   2 +
 arch/powerpc/mm/nohash/kup.c                  |   8 +-
 19 files changed, 220 insertions(+), 273 deletions(-)

-- 
2.41.0

