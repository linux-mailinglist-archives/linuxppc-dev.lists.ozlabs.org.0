Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C31FB27A018
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:23:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzgDZ1nPdzDqS1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:23:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg4p6rvNzDqPv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:23 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg4Y1mbTz9vCxx;
 Sun, 27 Sep 2020 11:16:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id U2cG5DDVaODT; Sun, 27 Sep 2020 11:16:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg4Y10LJz9vCxw;
 Sun, 27 Sep 2020 11:16:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A1D118B771;
 Sun, 27 Sep 2020 11:16:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id aMYHOO3LHzx1; Sun, 27 Sep 2020 11:16:17 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F3DE8B75B;
 Sun, 27 Sep 2020 11:16:17 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1D5FA65DE8; Sun, 27 Sep 2020 09:16:16 +0000 (UTC)
Message-Id: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 00/30] Modernise VDSO setup
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:16 +0000 (UTC)
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

This series modernises the setup of VDSO:
- Switch to using _install_special_mapping() which has replaced install_special_mapping()
- Move datapage in front of text like most other architectures to simplify its localisation
- Perform link time symbol resolution instead of runtime

This leads to a huge size reduction of vdso.c

Replaces the two following series:
 [v1,1/9] powerpc/vdso: Remove BUG_ON() in vdso_init()
 [v2,1/5] powerpc/vdso: Remove DBG()

This series is based on top of the series to the C generic VDSO.
It is functionnaly independant but some trivial merge conflict
occurs in some files. I may rebase it on top of merge if the
C generic VDSO series cannot be merged soon.

Christophe Leroy (30):
  powerpc/vdso: Stripped VDSO is not needed, don't build it
  powerpc/vdso: Add missing includes and clean vdso_setup_syscall_map()
  powerpc/vdso: Rename syscall_map_32/64 to simplify
    vdso_setup_syscall_map()
  powerpc/vdso: Remove get_page() in vdso_pagelist initialization
  powerpc/vdso: Remove NULL termination element in vdso_pagelist
  powerpc/vdso: Refactor 32 bits and 64 bits pages setup
  powerpc/vdso: Remove unnecessary ifdefs in vdso_pagelist
    initialization
  powerpc/vdso: Use VDSO size in arch_setup_additional_pages()
  powerpc/vdso: Simplify arch_setup_additional_pages() exit
  powerpc/vdso: Move to _install_special_mapping() and remove
    arch_vma_name()
  powerpc/vdso: Provide vdso_remap()
  powerpc/vdso: Replace vdso_base by vdso
  powerpc/vdso: Move vdso datapage up front
  powerpc/vdso: Simplify __get_datapage()
  powerpc/vdso: Remove unused \tmp param in __get_datapage()
  powerpc/vdso: Retrieve sigtramp offsets at buildtime
  powerpc/vdso: Use builtin symbols to locate fixup section
  powerpc/vdso: Merge __kernel_sync_dicache_p5() into
    __kernel_sync_dicache()
  powerpc/vdso: Remove vdso32_pages and vdso64_pages
  powerpc/vdso: Remove __kernel_datapage_offset
  powerpc/vdso: Remove runtime generated sigtramp offsets
  powerpc/vdso: Remove vdso_patches[] and associated functions
  powerpc/vdso: Remove unused text member in struct lib32/64_elfinfo
  powerpc/vdso: Remove symbol section information in struct
    lib32/64_elfinfo
  powerpc/vdso: Remove lib32_elfinfo and lib64_elfinfo
  powerpc/vdso: Remove vdso_setup()
  powerpc/vdso: Remove vdso_ready
  powerpc/vdso: Remove DBG()
  powerpc/vdso: Remove VDSO32_LBASE and VDSO64_LBASE
  powerpc/vdso: Cleanup vdso.h

 arch/powerpc/Makefile                         |  24 +-
 arch/powerpc/include/asm/book3s/32/mmu-hash.h |   2 +-
 arch/powerpc/include/asm/book3s/64/mmu.h      |   2 +-
 arch/powerpc/include/asm/elf.h                |   2 +-
 arch/powerpc/include/asm/mm-arch-hooks.h      |  25 -
 arch/powerpc/include/asm/mmu_context.h        |   6 +-
 arch/powerpc/include/asm/nohash/32/mmu-40x.h  |   2 +-
 arch/powerpc/include/asm/nohash/32/mmu-44x.h  |   2 +-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h  |   2 +-
 arch/powerpc/include/asm/nohash/mmu-book3e.h  |   2 +-
 arch/powerpc/include/asm/vdso.h               |  29 +-
 arch/powerpc/include/asm/vdso/gettimeofday.h  |   4 +-
 arch/powerpc/include/asm/vdso_datapage.h      |  17 +-
 arch/powerpc/kernel/asm-offsets.c             |   6 +-
 arch/powerpc/kernel/signal_32.c               |   8 +-
 arch/powerpc/kernel/signal_64.c               |   4 +-
 arch/powerpc/kernel/vdso.c                    | 682 +++---------------
 arch/powerpc/kernel/vdso32/Makefile           |  27 +-
 arch/powerpc/kernel/vdso32/cacheflush.S       |  19 +-
 arch/powerpc/kernel/vdso32/datapage.S         |   7 +-
 .../powerpc/kernel/vdso32/gen_vdso_offsets.sh |  16 +
 arch/powerpc/kernel/vdso32/vdso32.lds.S       |  24 +-
 arch/powerpc/kernel/vdso64/Makefile           |  25 +-
 arch/powerpc/kernel/vdso64/cacheflush.S       |  18 +-
 arch/powerpc/kernel/vdso64/datapage.S         |   7 +-
 .../powerpc/kernel/vdso64/gen_vdso_offsets.sh |  16 +
 arch/powerpc/kernel/vdso64/vdso64.lds.S       |  23 +-
 arch/powerpc/perf/callchain_32.c              |   8 +-
 arch/powerpc/perf/callchain_64.c              |   4 +-
 29 files changed, 267 insertions(+), 746 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/mm-arch-hooks.h
 create mode 100755 arch/powerpc/kernel/vdso32/gen_vdso_offsets.sh
 create mode 100755 arch/powerpc/kernel/vdso64/gen_vdso_offsets.sh

-- 
2.25.0

