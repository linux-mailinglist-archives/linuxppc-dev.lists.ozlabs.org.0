Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B10CAE6C1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 11:23:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SKMJ03PhzDrBY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 19:23:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Uo7vBuqs"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SKDZ6sgrzDqtm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 19:17:17 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46SKDS719hz9txW0;
 Tue, 10 Sep 2019 11:17:12 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Uo7vBuqs; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aiL9FREYs1Iv; Tue, 10 Sep 2019 11:17:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46SKDS5yLgz9txVx;
 Tue, 10 Sep 2019 11:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568107032; bh=W7DK9fV7ou1Pj1g9DnumvyDlGuhYJdM1G0uUAoFgmVY=;
 h=From:Subject:To:Cc:Date:From;
 b=Uo7vBuqsQYCrMwrHXVGWzbOzqvISk+RBR+kV0zI1xyLyEpyh5cXME5zC/2O25DQqA
 puotdR6/Dn7foKcZ9Pd/6FHOUF/aAc5b8HUi0v5XMr1aeZw8w7cffZV/QoLBUgA7TS
 kRXPM+mpk8wzDRiGC/YuAvZQ08R+3NEgkmXVNilE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 02D958B877;
 Tue, 10 Sep 2019 11:17:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Nni7Vn_UJZAF; Tue, 10 Sep 2019 11:17:12 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D2A58B885;
 Tue, 10 Sep 2019 11:16:19 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 16AA46B739; Tue, 10 Sep 2019 09:16:18 +0000 (UTC)
Message-Id: <cover.1568106758.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 00/15] Enable CONFIG_VMAP_STACK on PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, dja@axtens.net
Date: Tue, 10 Sep 2019 09:16:18 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The purpose of this serie is to enable CONFIG_VMAP_STACK on PPC32.

rfc v1: initial support on 8xx

rfc v2: added stack overflow detection.

v3:
- Stack overflow detection works, tested with LKDTM STACK_EXHAUST test
- Support for book3s32 added

Christophe Leroy (15):
  powerpc/32: replace MTMSRD() by mtmsr
  powerpc/32: Add EXCEPTION_PROLOG_0 in head_32.h
  powerpc/32: save DEAR/DAR before calling handle_page_fault
  powerpc/32: move MSR_PR test into EXCEPTION_PROLOG_0
  powerpc/32: add a macro to get and/or save DAR and DSISR on stack.
  powerpc/32: prepare for CONFIG_VMAP_STACK
  powerpc: align stack to 2 * THREAD_SIZE with VMAP_STACK
  powerpc/32: Add early stack overflow detection with VMAP stack.
  powerpc/8xx: Use alternative scratch registers in DTLB miss handler
  powerpc/8xx: drop exception entries for non-existing exceptions
  powerpc/8xx: move DataStoreTLBMiss perf handler
  powerpc/8xx: split breakpoint exception
  powerpc/8xx: Enable CONFIG_VMAP_STACK
  powerpc/32s: reorganise DSI handler.
  powerpc/32s: Activate CONFIG_VMAP_STACK

 arch/powerpc/include/asm/irq.h         |   1 +
 arch/powerpc/include/asm/processor.h   |   6 ++
 arch/powerpc/include/asm/thread_info.h |  18 ++++
 arch/powerpc/kernel/asm-offsets.c      |   6 ++
 arch/powerpc/kernel/entry_32.S         |  55 ++++++++--
 arch/powerpc/kernel/head_32.S          |  57 ++++++----
 arch/powerpc/kernel/head_32.h          | 129 ++++++++++++++++++++---
 arch/powerpc/kernel/head_40x.S         |   2 +
 arch/powerpc/kernel/head_8xx.S         | 186 +++++++++++++++------------------
 arch/powerpc/kernel/head_booke.h       |   2 +
 arch/powerpc/kernel/head_fsl_booke.S   |   1 +
 arch/powerpc/kernel/irq.c              |   1 +
 arch/powerpc/kernel/setup_32.c         |   3 +-
 arch/powerpc/kernel/setup_64.c         |   2 +-
 arch/powerpc/kernel/traps.c            |  15 ++-
 arch/powerpc/kernel/vmlinux.lds.S      |   2 +-
 arch/powerpc/mm/book3s32/hash_low.S    |  46 +++++---
 arch/powerpc/mm/book3s32/mmu.c         |   9 +-
 arch/powerpc/perf/8xx-pmu.c            |  12 ++-
 arch/powerpc/platforms/Kconfig.cputype |   3 +
 20 files changed, 379 insertions(+), 177 deletions(-)

-- 
2.13.3

