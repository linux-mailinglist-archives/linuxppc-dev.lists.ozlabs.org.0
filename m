Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 249EB423E2A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 14:50:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPZ7R0DZzz3ck0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 23:50:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPZ4z4vkMz3bhx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 23:48:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HPZ4S1Lq0z9sWf;
 Wed,  6 Oct 2021 14:48:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ZjR2niAwt46; Wed,  6 Oct 2021 14:48:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HPZ4M3rtYz9sVq;
 Wed,  6 Oct 2021 14:48:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 68E9C8B780;
 Wed,  6 Oct 2021 14:48:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HBM5SOJ6ZR9L; Wed,  6 Oct 2021 14:48:03 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.229])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E48F8B77E;
 Wed,  6 Oct 2021 14:48:02 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 196Clppk579416
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 6 Oct 2021 14:47:52 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 196ChpkJ579280;
 Wed, 6 Oct 2021 14:43:51 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 00/15] powerpc: Add KUAP support for BOOKE and 40x
Date: Wed,  6 Oct 2021 14:43:33 +0200
Message-Id: <cover.1633523837.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
- Two first patches have already been submitted and are not directly related to KUAP but would conflict otherwise
- Following patches aim at refactoring the KUAP interface to reduce redundant platform specific code.
- Then comes patches 9 and 10 that add generic support frame for booke type processors
- Followed by the assembly modification for each of the 4 booke family types 

Christophe Leroy (15):
  powerpc/32s: Do kuep_lock() and kuep_unlock() in assembly
  powerpc/32s: Save content of sr0 to avoid 'mfsr'
  powerpc/kuap: Add a generic intermediate layer
  powerpc/kuap: Check KUAP activation in generic functions
  powerpc/kuap: Remove __kuap_assert_locked()
  powerpc/kuap: Add kuap_lock()
  powerpc/nohash: Move setup_kuap out of 8xx.c
  powerpc/config: Add CONFIG_BOOKE_OR_40x
  powerpc/kuap: Prepare for supporting KUAP on BOOK3E/64
  powerpc: Add KUAP support for BOOKE and 40x
  powerpc/kuap: Wire-up KUAP on 44x
  powerpc/kuap: Wire-up KUAP on 40x
  powerpc/kuap: Wire-up KUAP on 85xx in 32 bits mode.
  powerpc/kuap: Wire-up KUAP on book3e/64
  powerpc: Remove CONFIG_PPC_HAVE_KUAP

 arch/powerpc/include/asm/book3s/32/kup.h      | 103 ++++------------
 arch/powerpc/include/asm/book3s/32/mmu-hash.h |  78 +++++++++++-
 arch/powerpc/include/asm/book3s/64/kup.h      |  56 ++++-----
 arch/powerpc/include/asm/hw_irq.h             |   8 +-
 arch/powerpc/include/asm/interrupt.h          |  13 +-
 arch/powerpc/include/asm/irq.h                |   2 +-
 arch/powerpc/include/asm/kup.h                | 114 +++++++++++++++---
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  |  50 ++------
 arch/powerpc/include/asm/nohash/kup-booke.h   | 110 +++++++++++++++++
 arch/powerpc/include/asm/processor.h          |   4 +
 arch/powerpc/include/asm/ptrace.h             |   2 +-
 arch/powerpc/include/asm/reg.h                |   4 +-
 arch/powerpc/kernel/asm-offsets.c             |   2 +-
 arch/powerpc/kernel/entry_32.S                |  34 +++++-
 arch/powerpc/kernel/head_32.h                 |   6 +
 arch/powerpc/kernel/head_40x.S                |   8 ++
 arch/powerpc/kernel/head_44x.S                |  16 +++
 arch/powerpc/kernel/head_fsl_booke.S          |  12 ++
 arch/powerpc/kernel/interrupt.c               |   3 +-
 arch/powerpc/kernel/irq.c                     |   2 +-
 arch/powerpc/kernel/kgdb.c                    |   4 +-
 arch/powerpc/kernel/process.c                 |   9 +-
 arch/powerpc/kernel/setup.h                   |   2 +-
 arch/powerpc/kernel/setup_32.c                |   2 +-
 arch/powerpc/kernel/time.c                    |   2 +-
 arch/powerpc/mm/book3s32/kuap.c               |   5 +-
 arch/powerpc/mm/book3s32/kuep.c               |  21 +++-
 arch/powerpc/mm/book3s32/mmu_context.c        |  15 ++-
 arch/powerpc/mm/mmu_context.c                 |   9 ++
 arch/powerpc/mm/nohash/8xx.c                  |  21 ----
 arch/powerpc/mm/nohash/Makefile               |   2 +-
 arch/powerpc/mm/nohash/kup.c                  |  31 +++++
 arch/powerpc/mm/nohash/mmu_context.c          |   6 +-
 arch/powerpc/mm/nohash/tlb_low_64e.S          |  40 +++++-
 arch/powerpc/platforms/Kconfig.cputype        |  12 +-
 35 files changed, 571 insertions(+), 237 deletions(-)
 create mode 100644 arch/powerpc/include/asm/nohash/kup-booke.h
 create mode 100644 arch/powerpc/mm/nohash/kup.c

-- 
2.31.1

