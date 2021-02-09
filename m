Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEF4314C59
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 11:03:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZdkP1QfvzDsmC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 21:03:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZdZm5Br3zDqfq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 20:56:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZdZb5Mv3z9tx3c;
 Tue,  9 Feb 2021 10:56:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QauxdVRoC_Rc; Tue,  9 Feb 2021 10:56:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZdZb4WBHz9tx3b;
 Tue,  9 Feb 2021 10:56:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 73E318B7D6;
 Tue,  9 Feb 2021 10:56:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7z_eq46-55VA; Tue,  9 Feb 2021 10:56:24 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 26AB28B7D4;
 Tue,  9 Feb 2021 10:56:24 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E48F767342; Tue,  9 Feb 2021 09:56:23 +0000 (UTC)
Message-Id: <cover.1612864003.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 00/41] powerpc/32: Switch to interrupt entry/exit in C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Feb 2021 09:56:23 +0000 (UTC)
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

This series aims at porting interrupt entry/exit in C on PPC32, using
the work already merged for PPC64.

First part do minimal changes in 40x in order to be able to enable MMU
earlier in exception entry.

Second part prepares and switches interrupt exit in C.

Third part moves more and more things in C, ending with KUAP management.

v1 is boot tested on 8xx and 83xx, releasing it as an RFC to get early feedback.

This series applies on top of the one switching ppc32 syscall entry/exit in C.

First patch is a bug fix already submitted but not yet merged that interracts with the series.

Christophe Leroy (41):
  powerpc/32: Preserve cr1 in exception prolog stack check to fix build
    error
  powerpc/40x: Don't use SPRN_SPRG_SCRATCH0/1 in TLB miss handlers
  powerpc/40x: Change CRITICAL_EXCEPTION_PROLOG macro to a gas macro
  powerpc/40x: Save SRR0/SRR1 and r10/r11 earlier in critical exception
  powerpc/40x: Reorder a few instructions in critical exception prolog
  powerpc/40x: Prepare for enabling MMU in critical exception prolog
  powerpc/40x: Prepare normal exception handler for enabling MMU early
  powerpc/32: Reconcile interrupts in C
  powerpc/32: Entry cpu time accounting in C
  powerpc/32: Handle bookE debugging in C in exception entry
  powerpc/32: Use fast instruction to set MSR RI in exception prolog on
    8xx
  powerpc/32: Remove ksp_limit
  powerpc/32: Always enable data translation in exception prolog
  powerpc/32: Tag DAR in EXCEPTION_PROLOG_2 for the 8xx
  powerpc/32: Enable instruction translation at the same time as data
    translation
  powerpc/32: Statically initialise first emergency context
  powerpc/32: Add vmap_stack_overflow label inside the macro
  powerpc/32: Use START_EXCEPTION() as much as possible
  powerpc/32: Move exception prolog code into .text once MMU is back on
  powerpc/32: Provide a name to exception prolog continuation in virtual
    mode
  powerpc/32: Refactor booke critical registers saving
  powerpc/32: Perform normal function call in exception entry
  powerpc/32: Always save non volatile registers on exception entry
  powerpc/32: Replace ASM exception exit by C exception exit from ppc64
  powerpc/32: Set regs parameter in r3 in transfer_to_handler
  powerpc/32: Remove handle_page_fault()
  powerpc/32: Save trap number on stack in exception prolog
  powerpc/32: Add a prepare_transfer_to_handler macro for exception
    prologs
  powerpc/32: Only restore non volatile registers when required
  powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE
  powerpc/32: Remove the xfer parameter in EXCEPTION() macro
  powerpc/32: Refactor saving of volatile registers in exception prologs
  powerpc/32: Save remaining registers in exception prolog
  powerpc/32: Set current->thread.regs in C interrupt entry
  powerpc/32: Return directly from power_save_ppc32_restore()
  powerpc/32: Only use prepare_transfer_to_handler function on book3s/32
    and e500
  powerpc/32s: Move KUEP locking/unlocking in C
  powerpc/64s: Make kuap_check_amr() and kuap_get_and_check_amr()
    generic
  powerpc/32s: Create C version of kuap save/restore/check helpers
  powerpc/8xx: Create C version of kuap save/restore/check helpers
  powerpc/32: Manage KUAP in C

 arch/powerpc/include/asm/book3s/32/kup.h     | 126 ++-
 arch/powerpc/include/asm/book3s/64/kup.h     |  24 +-
 arch/powerpc/include/asm/interrupt.h         |  21 +
 arch/powerpc/include/asm/kup.h               |  37 +-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h |  58 +-
 arch/powerpc/include/asm/ppc_asm.h           |  10 -
 arch/powerpc/include/asm/processor.h         |   6 +-
 arch/powerpc/include/asm/ptrace.h            |  13 +-
 arch/powerpc/kernel/asm-offsets.c            |   4 -
 arch/powerpc/kernel/entry_32.S               | 810 ++++---------------
 arch/powerpc/kernel/fpu.S                    |   2 -
 arch/powerpc/kernel/head_32.h                | 197 ++---
 arch/powerpc/kernel/head_40x.S               | 271 ++++---
 arch/powerpc/kernel/head_44x.S               |  10 +-
 arch/powerpc/kernel/head_8xx.S               | 151 ++--
 arch/powerpc/kernel/head_book3s_32.S         | 239 +++---
 arch/powerpc/kernel/head_booke.h             | 188 +++--
 arch/powerpc/kernel/head_fsl_booke.S         |  64 +-
 arch/powerpc/kernel/idle_6xx.S               |  14 +-
 arch/powerpc/kernel/idle_e500.S              |  14 +-
 arch/powerpc/kernel/interrupt.c              |  35 +-
 arch/powerpc/kernel/misc_32.S                |  14 -
 arch/powerpc/kernel/process.c                |   6 +-
 arch/powerpc/kernel/setup_32.c               |   2 +-
 arch/powerpc/kernel/traps.c                  |   9 -
 arch/powerpc/kernel/vector.S                 |   2 -
 arch/powerpc/lib/sstep.c                     |   9 -
 arch/powerpc/mm/book3s32/Makefile            |   1 +
 arch/powerpc/mm/book3s32/hash_low.S          |  14 -
 arch/powerpc/mm/book3s32/kuep.c              |  38 +
 arch/powerpc/mm/fault.c                      |   4 +-
 31 files changed, 875 insertions(+), 1518 deletions(-)
 create mode 100644 arch/powerpc/mm/book3s32/kuep.c

-- 
2.25.0

