Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FD7399CD6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 10:42:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwfX95Pydz30BC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 18:42:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwfWq5CX0z2xb6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 18:41:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FwfWh2xqMzBC5j;
 Thu,  3 Jun 2021 10:41:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2aIBgItm49pb; Thu,  3 Jun 2021 10:41:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FwfWh223WzBC5Z;
 Thu,  3 Jun 2021 10:41:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3BC018B848;
 Thu,  3 Jun 2021 10:41:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ScWqzpR0GDFX; Thu,  3 Jun 2021 10:41:36 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DD36D8B767;
 Thu,  3 Jun 2021 10:41:35 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id ADBBA64BD2; Thu,  3 Jun 2021 08:41:35 +0000 (UTC)
Message-Id: <cover.1622708530.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 00/12] powerpc: Optimise KUAP on book3s/32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  3 Jun 2021 08:41:35 +0000 (UTC)
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

This series is a rework of KUAP on book3s/32.

On book3s32, KUAP is heavier than on other platform because it can't
be opened globaly at once, it must be done for each 256Mb segment.

Instead of opening access to all necessary segments via a heavy logic,
only open access to the segment matching the start of the range.

99.999% of the time, the range doesn't cross segment limit so
it is not worth checking and handling that corner case at the
first place. If that happens, take a fault and do the additional
segments opening in the fault handler. See patch 9 for details.

This series also adds the capability to disable KUAP and KUEP at boot
time via the "nosmap" and "nosmep" kernel parameters as PPC64 does.

Last 2 patches are cleanup of generic KUAP code once book3s/32 has
been simplified.

Changes in v2:
- Incorporated the conversion to C of switch_mmu_context()
- Converted initial KUAP/KUEP setup to C
- Added capability to disable KUAP and KUEP at boottime
- Enable KUAP and KUEP by default 

Christophe Leroy (12):
  powerpc/32s: Move setup_{kuep/kuap}() into {kuep/kuap}.c
  powerpc/32s: Refactor update of user segment registers
  powerpc/32s: move CTX_TO_VSID() into mmu-hash.h
  powerpc/32s: Convert switch_mmu_context() to C
  powerpc/32s: Simplify calculation of segment register content
  powerpc/32s: Initialise KUAP and KUEP in C
  powerpc/32s: Allow disabling KUEP at boot time
  powerpc/32s: Allow disabling KUAP at boot time
  powerpc/32s: Rework Kernel Userspace Access Protection
  powerpc/32s: Activate KUAP and KUEP by default
  powerpc/kuap: Remove KUAP_CURRENT_XXX
  powerpc/kuap: Remove to/from/size parameters of prevent_user_access()

 arch/powerpc/include/asm/book3s/32/kup.h      | 199 ++++++++++++------
 arch/powerpc/include/asm/book3s/32/mmu-hash.h |  41 ++++
 arch/powerpc/include/asm/book3s/64/kup.h      |   3 +-
 arch/powerpc/include/asm/kup.h                |  28 +--
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  |   3 +-
 arch/powerpc/include/asm/processor.h          |  10 +-
 arch/powerpc/kernel/asm-offsets.c             |   5 -
 arch/powerpc/kernel/head_book3s_32.S          |  64 ------
 arch/powerpc/kernel/process.c                 |   3 +
 arch/powerpc/kernel/smp.c                     |   4 +
 arch/powerpc/kvm/book3s_32_mmu_host.c         |   3 -
 arch/powerpc/mm/book3s32/Makefile             |   1 +
 arch/powerpc/mm/book3s32/kuap.c               |  30 +++
 arch/powerpc/mm/book3s32/kuep.c               |  42 +---
 arch/powerpc/mm/book3s32/mmu.c                |  20 --
 arch/powerpc/mm/book3s32/mmu_context.c        |  48 +++--
 arch/powerpc/platforms/Kconfig.cputype        |   4 +-
 17 files changed, 276 insertions(+), 232 deletions(-)
 create mode 100644 arch/powerpc/mm/book3s32/kuap.c

-- 
2.25.0

