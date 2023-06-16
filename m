Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C97F2733366
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 16:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjLt44l67z2y1b
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 00:20:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
X-Greylist: delayed 1912 seconds by postgrey-1.37 at boromir; Sat, 17 Jun 2023 00:20:12 AEST
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjLsT01Yjz2xqK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 00:20:11 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4QjL8Z2XWrz9s2J;
	Fri, 16 Jun 2023 15:48:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8giTzWa4F7S1; Fri, 16 Jun 2023 15:48:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4QjL8W0LS1z9s1G;
	Fri, 16 Jun 2023 15:48:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 051FC8B781;
	Fri, 16 Jun 2023 15:48:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id PXLWrfkVSk2n; Fri, 16 Jun 2023 15:48:10 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.18])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C14D18B764;
	Fri, 16 Jun 2023 15:48:10 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35GDm4i21175650
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 15:48:04 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35GDm0FV1175646;
	Fri, 16 Jun 2023 15:48:00 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>
Subject: [RFC PATCH v1 0/3] powerpc/objtool: First step towards uaccess validation (v1)
Date: Fri, 16 Jun 2023 15:47:49 +0200
Message-Id: <cover.1686922583.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686923268; l=3187; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=A1u6ADmaDLt4PC3Ez60heNCY/BgdxUOWGXdUy2kyQ/E=; b=wlVJoF5RAtYZPAopVtD/HPmHr2OSX6EeUqL0HkNxk+4vZlF7Q0yW/YlqO5szOXZ68pBWnOOIJ sqsI2hfURbjAk7qLMEOR+fSCrWe2b/Mx4q0i69MAhwKLjiFNggRi9I9
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

This RFC is a first step towards the validation of userspace accesses.

For the time being it targets only PPC32 and includes hacks directly in
core part of objtool.

It doesn't yet include handling of uaccess at all but is a first step
to support objtool validation.

Assembly files have been kept aside as they require a huge work before
being ready for objtool validation and are not directly relevant for
uaccess validation.

Please have a look and hold hand if I'm going in the wrong direction.

For the few hacks done directly in the core part of objtool don't
hesitate to suggest ways to make it more generic.

Christophe Leroy (3):
  Revert "powerpc/bug: Provide better flexibility to
    WARN_ON/__WARN_FLAGS() with asm goto"
  powerpc: Mark all .S files invalid for objtool
  powerpc: WIP draft support to objtool check

 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/boot/Makefile                    | 17 +++++
 arch/powerpc/crypto/Makefile                  | 13 ++++
 arch/powerpc/include/asm/book3s/64/kup.h      |  2 +-
 arch/powerpc/include/asm/bug.h                | 67 +++----------------
 arch/powerpc/include/asm/extable.h            | 14 ----
 arch/powerpc/include/asm/ppc_asm.h            | 11 ++-
 arch/powerpc/kernel/Makefile                  | 44 ++++++++++++
 arch/powerpc/kernel/misc_32.S                 |  2 +-
 arch/powerpc/kernel/trace/Makefile            |  4 ++
 arch/powerpc/kernel/traps.c                   |  9 +--
 arch/powerpc/kernel/vdso/Makefile             | 11 +++
 arch/powerpc/kexec/Makefile                   |  2 +
 arch/powerpc/kvm/Makefile                     | 13 ++++
 arch/powerpc/lib/Makefile                     | 25 +++++++
 arch/powerpc/mm/book3s32/Makefile             |  3 +
 arch/powerpc/mm/nohash/Makefile               |  3 +
 arch/powerpc/perf/Makefile                    |  2 +
 arch/powerpc/platforms/44x/Makefile           |  2 +
 arch/powerpc/platforms/52xx/Makefile          |  3 +
 arch/powerpc/platforms/83xx/Makefile          |  2 +
 arch/powerpc/platforms/cell/spufs/Makefile    |  3 +
 arch/powerpc/platforms/pasemi/Makefile        |  2 +
 arch/powerpc/platforms/powermac/Makefile      |  3 +
 arch/powerpc/platforms/powernv/Makefile       |  3 +
 arch/powerpc/platforms/ps3/Makefile           |  2 +
 arch/powerpc/platforms/pseries/Makefile       |  2 +
 arch/powerpc/purgatory/Makefile               |  3 +
 arch/powerpc/sysdev/Makefile                  |  3 +
 arch/powerpc/xmon/Makefile                    |  3 +
 scripts/Makefile.lib                          |  2 +-
 tools/objtool/arch/powerpc/decode.c           | 60 +++++++++++++++--
 .../arch/powerpc/include/arch/special.h       |  2 +-
 tools/objtool/arch/powerpc/special.c          | 44 +++++++++++-
 tools/objtool/check.c                         | 29 ++++----
 tools/objtool/include/objtool/elf.h           |  1 +
 tools/objtool/include/objtool/special.h       |  2 +-
 .../powerpc/primitives/asm/extable.h          |  1 -
 38 files changed, 311 insertions(+), 104 deletions(-)
 delete mode 120000 tools/testing/selftests/powerpc/primitives/asm/extable.h

-- 
2.40.1

