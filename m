Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FE4A43FB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 12:21:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46LC6k1W8FzDr4C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 20:21:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="XcPoqKSs"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46LC3q20hJzDrBd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 20:18:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46LC3h1mPdz9v4gN;
 Sat, 31 Aug 2019 12:18:24 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=XcPoqKSs; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id yCN6EBBjj26Z; Sat, 31 Aug 2019 12:18:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46LC3h0Ttpz9v4gL;
 Sat, 31 Aug 2019 12:18:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567246704; bh=qFMzlyfxCodFSC4zHAOz2kDQ77ypyGQHTBxTejDX1bI=;
 h=From:Subject:To:Cc:Date:From;
 b=XcPoqKSsWPUOi2/+SwSxnbm73qCTTiXgUobkrwGvL7FHKduXJ5zNKAYV4Iq5g1pfI
 w/kTNtJGAOmRI3kLJ+tHVsu2DOAOldn+6zYmMbAT40yHcGwTPYCSY9afpvXAvq6nYq
 U3+BNQOwhYJ6mIMUb0To3O8ANNxbvwbwQUVl3ZGA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6828E8B7B9;
 Sat, 31 Aug 2019 12:18:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JaMaC9-f54tk; Sat, 31 Aug 2019 12:18:25 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 33C698B789;
 Sat, 31 Aug 2019 12:18:25 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 551F06985C; Sat, 31 Aug 2019 10:18:23 +0000 (UTC)
Message-Id: <cover.1567245404.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 00/10] Enable CONFIG_VMAP_STACK on PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, dja@axtens.net
Date: Sat, 31 Aug 2019 10:18:23 +0000 (UTC)
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

The purpose of this serie is to enable CONFIG_VMAP_STACK on PPC32.

For the time being we have something working on 8xx.

Further work I'm working on:
- Fix stack overflow detection (doesn't work all the time yet, with the LKDTM STACK_EXHAUST test it hang).
- Add support to powerpc 603
- Add support to all book3s32

v2: added stack overflow detection.

Christophe Leroy (10):
  powerpc/32: replace MTMSRD() by mtmsr
  powerpc/32: Add EXCEPTION_PROLOG_0 in head_32.h
  powerpc/32: prepare for CONFIG_VMAP_STACK
  powerpc/8xx: Use alternative scratch registers in DTLB miss handler
  powerpc/8xx: drop exception entries for non-existing exceptions
  powerpc/8xx: move DataStoreTLBMiss perf handler
  powerpc/8xx: split breakpoint exception
  powerpc/8xx: Enable CONFIG_VMAP_STACK
  powerpc: align stack to 2 * THREAD_SIZE with VMAP_STACK
  powerpc/32: Add stack overflow detection with VMAP stack.

 arch/powerpc/Kconfig                   |   1 +
 arch/powerpc/include/asm/processor.h   |   5 ++
 arch/powerpc/include/asm/thread_info.h |  18 ++++
 arch/powerpc/kernel/asm-offsets.c      |   5 ++
 arch/powerpc/kernel/entry_32.S         |  37 +++++++--
 arch/powerpc/kernel/head_32.S          |   4 +-
 arch/powerpc/kernel/head_32.h          |  98 ++++++++++++++++++++--
 arch/powerpc/kernel/head_8xx.S         | 145 ++++++++++++++++++---------------
 arch/powerpc/kernel/setup_32.c         |   2 +-
 arch/powerpc/kernel/setup_64.c         |   2 +-
 arch/powerpc/kernel/vmlinux.lds.S      |   2 +-
 arch/powerpc/perf/8xx-pmu.c            |  12 ++-
 12 files changed, 240 insertions(+), 91 deletions(-)

-- 
2.13.3

