Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C648D74F433
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:00:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0lv75LSZz3cHR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:00:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0ltX6btkz3c2n
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 01:59:30 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4R0ltP67GTz9sFF;
	Tue, 11 Jul 2023 17:59:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2rhQ6e6KCcfX; Tue, 11 Jul 2023 17:59:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4R0ltP5RbGz9sFB;
	Tue, 11 Jul 2023 17:59:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B473F8B77E;
	Tue, 11 Jul 2023 17:59:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 1TmYi9Rvc3T6; Tue, 11 Jul 2023 17:59:25 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.184])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A5A08B779;
	Tue, 11 Jul 2023 17:59:25 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 36BFxOF33695831
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 17:59:24 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 36BFxMpn3695820;
	Tue, 11 Jul 2023 17:59:22 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v3 0/9] Cleanup/Optimise KUAP (v3)
Date: Tue, 11 Jul 2023 17:59:12 +0200
Message-ID: <cover.1689091022.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689091151; l=2312; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=adFnaIZiJTeO6Cz2UZ7Q2Z0r73HSP64qXDq2uOoJDHg=; b=cJIwd0NwhGM51zL42j746sWOQgqcbuDCTQiEwCnaLwWrWXmLyT7thaJeWWl3TxvIN5P7kXb3Q rmWY9ebNuuSALHY6muQGk4xHeZgWct7If21U4uyKEWOy4jYxWkbvhKG
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

Changes in v3:
- Rearranged book3s/32 simplification in order to ease objtool UACCESS
check implementation (patches 7 and 9)

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

 arch/powerpc/include/asm/book3s/32/kup.h      | 123 ++++++++----------
 .../powerpc/include/asm/book3s/64/hash-pkey.h |   2 +-
 arch/powerpc/include/asm/book3s/64/kup.h      |  54 ++++----
 arch/powerpc/include/asm/bug.h                |   1 +
 arch/powerpc/include/asm/feature-fixups.h     |   1 +
 arch/powerpc/include/asm/kup.h                |  91 +++++--------
 arch/powerpc/include/asm/mmu.h                |   4 +-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  |  62 +++++----
 arch/powerpc/include/asm/nohash/kup-booke.h   |  68 +++++-----
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
 19 files changed, 222 insertions(+), 263 deletions(-)

-- 
2.41.0

