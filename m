Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE4D2A4E1C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 19:15:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQdJ74Mv4zDqjg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 05:15:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQd6H2VPbzDqgp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 05:07:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CQd661jCcz9v1YX;
 Tue,  3 Nov 2020 19:07:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aQCFbUAmQvZd; Tue,  3 Nov 2020 19:07:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CQd660d6Vz9v1YS;
 Tue,  3 Nov 2020 19:07:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DDE858B7DB;
 Tue,  3 Nov 2020 19:07:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ni7TN5eVC9O6; Tue,  3 Nov 2020 19:07:11 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 74E208B7D4;
 Tue,  3 Nov 2020 19:07:11 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3405366860; Tue,  3 Nov 2020 18:07:11 +0000 (UTC)
Message-Id: <cover.1604426550.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v13 0/8] powerpc: switch VDSO to C implementation
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 nathanl@linux.ibm.com, anton@ozlabs.org
Date: Tue,  3 Nov 2020 18:07:11 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a series to switch powerpc VDSO to generic C implementation.

Changes in v13:
- Reorganised headers to avoid the need for a fake 32 bits config for building VDSO32 on PPC64
- Rebased after the removal of powerpc 601
- Using DOTSYM() macro to call functions directly without using OPD
- Explicitely dropped .opd and .got1 sections which are now unused

Changes in v12:
- Rebased to today's powerpc/merge branch (Conflicts on VDSO Makefiles)
- Added missing prototype for __kernel_clock_gettime64()

Changes in v11:
- Rebased to today's powerpc/merge branch
- Prototype of __arch_get_hw_counter() was modified in mainline (patch 2)

Changes in v10 are:
- Added a comment explaining the reason for the double stack frame
- Moved back .cfi_register lr next to mflr

Main changes in v9 are:
- Dropped the patches which put the VDSO datapage in front of VDSO text in the mapping
- Adds a second stack frame because the caller doesn't set one, at least on PPC64
- Saving the TOC pointer on PPC64 (is that really needed ?)

This series applies on today's powerpc/merge branch.

See the last patches for details on changes and performance.

Christophe Leroy (8):
  powerpc/feature: Fix CPU_FTRS_ALWAYS by removing CPU_FTRS_GENERIC_32
  powerpc/feature: Use CONFIG_PPC64 instead of __powerpc64__ to define
    possible features
  powerpc/processor: Move cpu_relax() into asm/vdso/processor.h
  powerpc/time: Move timebase functions into new asm/timebase.h
  powerpc/vdso: Prepare for switching VDSO to generic C implementation.
  powerpc/vdso: Save and restore TOC pointer on PPC64
  powerpc/vdso: Switch VDSO to generic C implementation.
  powerpc/vdso: Provide __kernel_clock_gettime64() on vdso32

 arch/powerpc/Kconfig                         |   2 +
 arch/powerpc/include/asm/clocksource.h       |   7 +
 arch/powerpc/include/asm/cputable.h          |   9 +-
 arch/powerpc/include/asm/ppc_asm.h           |   2 +
 arch/powerpc/include/asm/processor.h         |  13 +-
 arch/powerpc/include/asm/time.h              |  30 +-
 arch/powerpc/include/asm/timebase.h          |  42 +++
 arch/powerpc/include/asm/vdso/clocksource.h  |   7 +
 arch/powerpc/include/asm/vdso/gettimeofday.h | 201 +++++++++++++
 arch/powerpc/include/asm/vdso/processor.h    |  23 ++
 arch/powerpc/include/asm/vdso/vsyscall.h     |  25 ++
 arch/powerpc/include/asm/vdso_datapage.h     |  40 +--
 arch/powerpc/kernel/asm-offsets.c            |  49 +--
 arch/powerpc/kernel/time.c                   |  91 +-----
 arch/powerpc/kernel/vdso.c                   |   5 +-
 arch/powerpc/kernel/vdso32/Makefile          |  26 +-
 arch/powerpc/kernel/vdso32/gettimeofday.S    | 300 +------------------
 arch/powerpc/kernel/vdso32/vdso32.lds.S      |   2 +
 arch/powerpc/kernel/vdso32/vgettimeofday.c   |  34 +++
 arch/powerpc/kernel/vdso64/Makefile          |  23 +-
 arch/powerpc/kernel/vdso64/gettimeofday.S    | 242 +--------------
 arch/powerpc/kernel/vdso64/vdso64.lds.S      |   2 +-
 arch/powerpc/kernel/vdso64/vgettimeofday.c   |  29 ++
 23 files changed, 466 insertions(+), 738 deletions(-)
 create mode 100644 arch/powerpc/include/asm/clocksource.h
 create mode 100644 arch/powerpc/include/asm/timebase.h
 create mode 100644 arch/powerpc/include/asm/vdso/clocksource.h
 create mode 100644 arch/powerpc/include/asm/vdso/gettimeofday.h
 create mode 100644 arch/powerpc/include/asm/vdso/processor.h
 create mode 100644 arch/powerpc/include/asm/vdso/vsyscall.h
 create mode 100644 arch/powerpc/kernel/vdso32/vgettimeofday.c
 create mode 100644 arch/powerpc/kernel/vdso64/vgettimeofday.c

-- 
2.25.0

