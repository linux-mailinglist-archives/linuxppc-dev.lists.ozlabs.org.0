Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CFC73BD61
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 19:07:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnkF50Znsz3cRj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 03:07:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnkCc3DCgz3bT2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 03:06:04 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4QnkCK2GKcz9sgW;
	Fri, 23 Jun 2023 19:05:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mi-znP3KRdZb; Fri, 23 Jun 2023 19:05:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4QnkCH4JZ2z9sgV;
	Fri, 23 Jun 2023 19:05:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8DA3B8B763;
	Fri, 23 Jun 2023 19:05:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id GZNX2Lzm-f99; Fri, 23 Jun 2023 19:05:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.71])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 334298B76C;
	Fri, 23 Jun 2023 19:05:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35NH5exM2645714
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 19:05:40 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35NH5cgh2645709;
	Fri, 23 Jun 2023 19:05:38 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v3 00/15] powerpc/objtool: uaccess validation for PPC32 (v3)
Date: Fri, 23 Jun 2023 19:05:11 +0200
Message-Id: <cover.1687539638.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687539921; l=3460; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=4v2a3/oO/g7ZFbmfTr33UaW+Rjy5tAi53mJem5kaFfQ=; b=S+qOs6UhSOAnEJpFYJEvv83FF68NuzAnX0y/Lj9mVTgjd/e5Id/sdeoJtCAAUDYXZ9ahrBe1X fOnW4Q0OaiZAu+wG2FVNmQQ73PAGlgrNQMGz3rZl092UH8084EXWJEd
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

This series adds UACCESS validation for PPC32. It includes half
a dozen of changes to objtool core.

It is almost mature, performs code analysis for all PPC32, only
missing marking of UACCESS enable/disable for book3s/32.

Most object files are correctly decoded, only a few
'unreachable instruction' warnings remain due to more complex
switch table cases:
- Loading of table address after the dynamic jump
- Nested switches

It allowed to detect some UACCESS mess in a few files. They've been
fixed through other patches.

Changes in v3:
- Rebased on top of a merge of powerpc tree and tip/objtool/core tree
- Simplified support for relative switch tables based on relocation type
- Taken comments from Peter

Christophe Leroy (15):
  powerpc/kuap: Avoid unnecessary reads of MD_AP
  powerpc/kuap: Avoid useless jump_label on empty function
  powerpc/kuap: Refactor static branch for disabling kuap
  powerpc/kuap: Make disabling KUAP at boottime impossible except on
    book3s/64
  powerpc/kuap: KUAP enabling/disabling functions must be
    __always_inline
  Revert "powerpc/bug: Provide better flexibility to
    WARN_ON/__WARN_FLAGS() with asm goto"
  objtool: Allow an architecture to disable objtool on ASM files
  objtool: Fix JUMP_ENTRY_SIZE for bi-arch like powerpc
  objtool: Add INSN_RETURN_CONDITIONAL
  objtool: Add support for relative switch tables
  objtool: Remove too strict constraint in jump table search
  objtool: Add support for more complex UACCESS control
  objtool: Prepare noreturns.h for more architectures
  powerpc/bug: Annotate reachable after warning trap
  powerpc: Implement UACCESS validation on PPC32

 arch/Kconfig                                  |  5 ++
 arch/powerpc/Kconfig                          |  2 +
 arch/powerpc/include/asm/book3s/32/kup.h      | 39 ++++-----
 arch/powerpc/include/asm/book3s/64/kup.h      | 36 ++++----
 arch/powerpc/include/asm/bug.h                | 77 ++++-------------
 arch/powerpc/include/asm/kup.h                | 66 ++++++++++-----
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  | 52 +++++-------
 arch/powerpc/include/asm/nohash/kup-booke.h   | 49 +++++------
 arch/powerpc/include/asm/uaccess.h            |  6 +-
 arch/powerpc/kernel/misc_32.S                 |  2 +-
 arch/powerpc/kernel/traps.c                   |  9 +-
 arch/powerpc/kexec/core_32.c                  |  4 +-
 arch/powerpc/mm/book3s32/kuap.c               | 18 ++--
 arch/powerpc/mm/init-common.c                 |  3 +
 arch/powerpc/mm/nohash/kup.c                  | 11 +--
 include/linux/objtool.h                       | 14 ++++
 scripts/Makefile.build                        |  4 +
 tools/objtool/arch/powerpc/decode.c           | 83 +++++++++++++++++--
 .../arch/powerpc/include/arch/noreturns.h     | 11 +++
 .../arch/powerpc/include/arch/special.h       |  2 +-
 tools/objtool/arch/powerpc/special.c          | 34 +++++++-
 .../objtool/arch/x86/include/arch/noreturns.h | 20 +++++
 tools/objtool/check.c                         | 59 ++++++++++---
 tools/objtool/include/objtool/arch.h          |  1 +
 tools/objtool/noreturns.h                     | 14 +---
 tools/objtool/special.c                       | 55 ++++++------
 26 files changed, 399 insertions(+), 277 deletions(-)
 create mode 100644 tools/objtool/arch/powerpc/include/arch/noreturns.h
 create mode 100644 tools/objtool/arch/x86/include/arch/noreturns.h

-- 
2.40.1

