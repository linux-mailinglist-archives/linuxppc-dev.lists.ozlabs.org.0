Return-Path: <linuxppc-dev+bounces-5313-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 461CEA12EA1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 23:50:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLn45CTYz3d0n;
	Thu, 16 Jan 2025 09:50:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736981432;
	cv=none; b=Armx/OSKhr62xuE8Nzlrl4qpgMInYJ77BjzxKUZMW7pyt8XyzJM6NuIOx1WmVerf4+MDp4W1LEq3/b8YDO3hKffKUhd7E/V8XTsIe/aQ23uVWUcot2sQ9HSzXuoHviSdUWstDk5mK1GEZMY/nF4l+NxB9yD4nogsZ2GiBmQuDjzlbMEipW+JiSwHwciND20iKEH1pXjXo06UcsVHTTcEBMLf0ajwfJHKZKU1FDDjIWLZ808JaRxqNweEqblMWzQdB43J0zIsxbeHYDBvFumOwbrjToILS4OOSvh716pEiFjzIjRN8opEF6e0fKLNIY8nOGeE6seITPCDqgH3kuigig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736981432; c=relaxed/relaxed;
	bh=u4KtFBmU7FzXTBbweuE0ef2rhpdlSt0hS+1m0QSwlHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UQRGyQo0C9cHHhPWU9tW+wsC2TR1MrmvqDB2oxUvv3FJ7EBEUF2g+IPsH7mkhCvQy5Ax1HoocjniaWf47vOPqg3ryWDuWO48pFRjzIZ3ulNBc+n9lygZme7mu5ZMfz8Kayty0rq98UeQIuuO+qj/ysvi07lvuDbSVMVtll5ToDZ2k5Hw1UkdvgRgqoi6xhaOc8HIVPIdGDlAGR/HGZ8RDHBtBEu8I9m01tYCVkR3SKu7pMa8W5NqDeo/PUMbvUwnMXjW+KFyi739QEoVqPqcsbqAxyv8Dfdn9XHnn4CY6zmtoDo3L8C/npGh2hXMqigI137yOo/s0FJWY/gu6ZGI4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYLn40NF0z2ynj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 09:50:31 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYLcB1Vvtz9sPd;
	Wed, 15 Jan 2025 23:42:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nae6Cb_QzfA6; Wed, 15 Jan 2025 23:42:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYLcB0PxDz9rvV;
	Wed, 15 Jan 2025 23:42:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F07258B77A;
	Wed, 15 Jan 2025 23:42:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id mofC_rqjJG3K; Wed, 15 Jan 2025 23:42:49 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 596DC8B774;
	Wed, 15 Jan 2025 23:42:47 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Julien Thierry <jthierry@redhat.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Raphael Gault <raphael.gault@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 00/15] powerpc/objtool: uaccess validation for PPC32 (v5)
Date: Wed, 15 Jan 2025 23:42:40 +0100
Message-ID: <cover.1736955567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736980963; l=4151; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=CdIISZBocgbe8t+SQ+txY3ClfKL67HiAPAf+YkEoSpw=; b=5SggZsFckY2DyHQzOMzxQqVglzO8I/aelkmx8rKM5fGhNlzq9k4g0j2SDTOETZcsT5WDZAfSS zsAdr0uT7R8DUY08Q+I3HiaA2onHdvy7hxA6jQ60SEujHnirdNdVDiX
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This series adds UACCESS validation for PPC32. It includes
a dozen of changes to objtool core.

It applies on top of series "Cleanup/Optimise KUAP (v3)"
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=363368&state=*

It is almost mature, performs code analysis for all PPC32.

In this version objtool switch table lookup has been enhanced to
handle nested switch tables.

Most object files are correctly decoded, only a few
'unreachable instruction' warnings remain due to more complex
fonctions which include back and forth jumps or branches. Two types
of switch tables are missed at the time being:
- When switch table address is temporarily saved in the stack before
being used.
- When there are backwards jumps in the path.

It allowed to detect some UACCESS mess in a few files. They've been
fixed through other patches.

Changes in v5:
- Rebased on top of https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git branch tip/objtool/core
- Use generic annotation infrastructure to annotate uaccess begin and end instructions

Changes in v4:
- Split series in two parts, the powerpc uaccess rework is submitted
separately, see https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=363368&state=*
- Support of UACCESS on all PPC32 including book3s/32 which was missing in v3.
- More elaborated switch tables lookup.
- Patches 2, 7, 8, 9, 10, 11 are new
- Patch 11 in series v3 is now removed.

Changes in v3:
- Rebased on top of a merge of powerpc tree and tip/objtool/core tree
- Simplified support for relative switch tables based on relocation type
- Taken comments from Peter


Christophe Leroy (15):
  objtool: Fix generic annotation infrastructure cross build
  objtool: Move back misplaced comment
  objtool: Allow an architecture to disable objtool on ASM files
  objtool: Fix JUMP_ENTRY_SIZE for bi-arch like powerpc
  objtool: Add INSN_RETURN_CONDITIONAL
  objtool: Add support for relative switch tables
  objtool: Merge mark_func_jump_tables() and add_func_jump_tables()
  objtool: Track general purpose register used for switch table base
  objtool: Find end of switch table directly
  objtool: When looking for switch tables also follow conditional and
    dynamic jumps
  objtool: .rodata.cst{2/4/8/16} are not switch tables
  objtool: Add support for more complex UACCESS control
  objtool: Prepare noreturns.h for more architectures
  powerpc/bug: Annotate reachable after warning trap
  powerpc: Implement UACCESS validation on PPC32

 arch/Kconfig                                  |   5 +
 arch/powerpc/Kconfig                          |   2 +
 arch/powerpc/include/asm/book3s/32/kup.h      |   2 +
 arch/powerpc/include/asm/bug.h                |  14 +-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  |   4 +-
 arch/powerpc/include/asm/nohash/kup-booke.h   |   4 +-
 arch/powerpc/kexec/core_32.c                  |   4 +-
 arch/powerpc/mm/nohash/kup.c                  |   2 +
 include/linux/objtool.h                       |   3 +
 include/linux/objtool_types.h                 |   2 +
 scripts/Makefile.lib                          |   4 +
 tools/include/linux/objtool_types.h           |   2 +
 tools/objtool/arch/powerpc/decode.c           | 150 +++++++++++++++++-
 .../arch/powerpc/include/arch/noreturns.h     |  11 ++
 .../arch/powerpc/include/arch/special.h       |  11 +-
 tools/objtool/arch/powerpc/special.c          |  40 ++++-
 .../objtool/arch/x86/include/arch/noreturns.h |  20 +++
 tools/objtool/arch/x86/special.c              |   8 +-
 tools/objtool/check.c                         | 129 ++++++++++-----
 tools/objtool/include/objtool/arch.h          |   1 +
 tools/objtool/include/objtool/check.h         |   6 +-
 tools/objtool/include/objtool/special.h       |   3 +-
 tools/objtool/noreturns.h                     |  14 +-
 tools/objtool/special.c                       |  55 ++++---
 24 files changed, 386 insertions(+), 110 deletions(-)
 create mode 100644 tools/objtool/arch/powerpc/include/arch/noreturns.h
 create mode 100644 tools/objtool/arch/x86/include/arch/noreturns.h

-- 
2.47.0


