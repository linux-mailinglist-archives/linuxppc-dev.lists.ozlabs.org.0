Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A56432FAB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 09:36:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYQYB3ykzz3fYw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 18:36:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYQQm1S5nz3dYJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 18:31:12 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HYQPW3Dgvz9sT0;
 Tue, 19 Oct 2021 09:30:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5w0IrhxZNhBf; Tue, 19 Oct 2021 09:30:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HYQP76d17z9sT3;
 Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D70368B77E;
 Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YxnDUtWjjwXy; Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.71])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2870E8B77C;
 Tue, 19 Oct 2021 09:29:46 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19J7TZnT3188398
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 09:29:35 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19J7TXHb3188397;
 Tue, 19 Oct 2021 09:29:33 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 00/22] powerpc: Add KUAP support for BOOKE and 40x
Date: Tue, 19 Oct 2021 09:29:11 +0200
Message-Id: <cover.1634627931.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634628570; l=6022; s=20211009;
 h=from:subject:message-id; bh=FxLr5qP3+M12eejtnEEtEJ11Nmzbp7f9vDf00Wy620Y=;
 b=qXq1amhEJBu0m2Ts4FWx8WkvncGD9iN7ee1zwcMRCAcCuqM9sVa5krdhIAvqcbTPAltmTgJFiowX
 o9pAVT5iCeNm7HWpnYrWlZT1zP4Gw/GwyWA1+SH2vwE3HMpNnJv0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On booke/40x we don't have segments like book3s/32.
On booke/40x we don't have access protection groups like 8xx.

Use the PID register to provide user access protection.
Kernel address space can be accessed with any PID.
User address space has to be accessed with the PID of the user.
User PID is always not null.

Everytime the kernel is entered, set PID register to 0 and
restore PID register when returning to user.

Everytime kernel needs to access user data, PID is restored
for the access.

In TLB miss handlers, check the PID and bail out to data storage
exception when PID is 0 and accessed address is in user space.

Note that also forbids execution of user text by kernel except
when user access is unlocked. But this shouldn't be a problem
as the kernel is not supposed to ever run user text.

This series has:
- First five patches remove the complexity due to too much configurability of KUEP (ref https://github.com/linuxppc/issues/issues/379)
- Two following patches have already been submitted and are not directly related to KUAP but would conflict otherwise
- Patch 8 removes 'nosmep' kernel parameter.
- Following patches aim at refactoring the KUAP interface to reduce redundant platform specific code.
- Then comes patches 14 and 15 that add generic support frame for booke type processors
- Followed by the assembly modification for each of the 4 booke family types 
- Last patch removes CONFIG_PPC_HAVE_KUAP and CONFIG_PPC_HAVE_KUEP now that all powerpc platforms have KUAP and KUEP.

Changes in v3:
- Added the first five patches plus patch 8 to reduce the configurability of KUEP
- Patch 4 also adds missing KUEP support to book3e in 32 bits PTE mode.
- Modified 6 and 7 to also remove configurability of KUEP
- Patch 19 links KUEP to KUAP
- Last patch now removes both CONFIG_PPC_HAVE_KUAP and CONFIG_PPC_HAVE_KUEP

Changes in v2:
- Rebased on top of today's merge (trivial conflict with d93f9e23744b ("powerpc/32s: Fix kuap_kernel_restore()"))
- Fix missing check in bad_kuap_fault() which led to KUAP fault on platforms where KUAP was disabled (CI g5_defconfig)
- New patch to fix PPC_KUAP_DEBUG dependency

Christophe Leroy (22):
  Revert "powerpc: Inline setup_kup()"
  powerpc/8xx: Activate KUEP at all time
  powerpc/44x: Activate KUEP at all time
  powerpc/book3e: Activate KUEP at all time
  powerpc/32s: Remove capability to disable KUEP at boottime
  powerpc/32s: Do kuep_lock() and kuep_unlock() in assembly
  powerpc/32s: Save content of sr0 to avoid 'mfsr'
  powerpc/kuep: Remove 'nosmep' boot time parameter except for book3s/64
  powerpc/kuap: Add a generic intermediate layer
  powerpc/kuap: Check KUAP activation in generic functions
  powerpc/kuap: Remove __kuap_assert_locked()
  powerpc/kuap: Add kuap_lock()
  powerpc/nohash: Move setup_kuap out of 8xx.c
  powerpc/config: Add CONFIG_BOOKE_OR_40x
  powerpc/kuap: Prepare for supporting KUAP on BOOK3E/64
  powerpc/kuap: Make PPC_KUAP_DEBUG depend on PPC_KUAP only
  powerpc: Add KUAP support for BOOKE and 40x
  powerpc/kuap: Wire-up KUAP on 44x
  powerpc/kuap: Wire-up KUAP on 40x
  powerpc/kuap: Wire-up KUAP on 85xx in 32 bits mode.
  powerpc/kuap: Wire-up KUAP on book3e/64
  powerpc: Remove CONFIG_PPC_HAVE_KUAP and CONFIG_PPC_HAVE_KUEP

 .../admin-guide/kernel-parameters.txt         |   2 +-
 arch/powerpc/include/asm/book3s/32/kup.h      | 108 ++++------------
 arch/powerpc/include/asm/book3s/32/mmu-hash.h |  82 +++++++++++-
 arch/powerpc/include/asm/book3s/64/kup.h      |  56 ++++----
 arch/powerpc/include/asm/hw_irq.h             |   8 +-
 arch/powerpc/include/asm/interrupt.h          |  13 +-
 arch/powerpc/include/asm/irq.h                |   2 +-
 arch/powerpc/include/asm/kup.h                | 122 ++++++++++++++----
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  |  50 ++-----
 arch/powerpc/include/asm/nohash/32/mmu-44x.h  |   1 -
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h  |   6 +-
 arch/powerpc/include/asm/nohash/kup-booke.h   | 110 ++++++++++++++++
 arch/powerpc/include/asm/processor.h          |  12 ++
 arch/powerpc/include/asm/ptrace.h             |   2 +-
 arch/powerpc/include/asm/reg.h                |   4 +-
 arch/powerpc/kernel/asm-offsets.c             |   3 +-
 arch/powerpc/kernel/entry_32.S                |  31 ++++-
 arch/powerpc/kernel/head_32.h                 |   6 +
 arch/powerpc/kernel/head_40x.S                |   8 ++
 arch/powerpc/kernel/head_44x.S                |  26 ++--
 arch/powerpc/kernel/head_book3s_32.S          |   4 +
 arch/powerpc/kernel/head_fsl_booke.S          |  13 ++
 arch/powerpc/kernel/interrupt.c               |   3 +-
 arch/powerpc/kernel/irq.c                     |   2 +-
 arch/powerpc/kernel/kgdb.c                    |   4 +-
 arch/powerpc/kernel/process.c                 |   9 +-
 arch/powerpc/kernel/setup.h                   |   2 +-
 arch/powerpc/kernel/setup_32.c                |   2 +-
 arch/powerpc/kernel/time.c                    |   2 +-
 arch/powerpc/mm/book3s32/Makefile             |   1 -
 arch/powerpc/mm/book3s32/kuap.c               |   5 +-
 arch/powerpc/mm/book3s32/kuep.c               |  20 ---
 arch/powerpc/mm/book3s32/mmu_context.c        |  15 +--
 arch/powerpc/mm/init-common.c                 |  21 +++
 arch/powerpc/mm/mmu_context.c                 |   9 ++
 arch/powerpc/mm/nohash/44x.c                  |  16 ---
 arch/powerpc/mm/nohash/8xx.c                  |  33 -----
 arch/powerpc/mm/nohash/Makefile               |   2 +-
 arch/powerpc/mm/nohash/kup.c                  |  33 +++++
 arch/powerpc/mm/nohash/mmu_context.c          |   6 +-
 arch/powerpc/mm/nohash/tlb_low_64e.S          |  40 +++++-
 arch/powerpc/platforms/Kconfig.cputype        |  30 ++---
 42 files changed, 606 insertions(+), 318 deletions(-)
 create mode 100644 arch/powerpc/include/asm/nohash/kup-booke.h
 delete mode 100644 arch/powerpc/mm/book3s32/kuep.c
 create mode 100644 arch/powerpc/mm/nohash/kup.c

-- 
2.31.1

