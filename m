Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3266D3610F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 19:19:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLmKG0c1Yz3c1h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 03:18:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLmJb1bnSz2yYr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 03:18:19 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FLmJQ28nVz9vBLm;
 Thu, 15 Apr 2021 19:18:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xQ_LIEXY2H5D; Thu, 15 Apr 2021 19:18:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FLmJQ08Wvz9tyvC;
 Thu, 15 Apr 2021 19:18:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F13E68B804;
 Thu, 15 Apr 2021 19:18:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CN9zIg9V5yLe; Thu, 15 Apr 2021 19:18:13 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B7A058B7F6;
 Thu, 15 Apr 2021 19:18:13 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7341B679F6; Thu, 15 Apr 2021 17:18:13 +0000 (UTC)
Message-Id: <cover.1618506910.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 0/5] Convert powerpc to GENERIC_PTDUMP
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org
Date: Thu, 15 Apr 2021 17:18:13 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series converts powerpc to generic PTDUMP.

For that, we first need to add missing hugepd support
to pagewalk and ptdump.

Christophe Leroy (5):
  mm: pagewalk: Fix walk for hugepage tables
  mm: ptdump: Fix build failure
  mm: ptdump: Provide page size to notepage()
  mm: ptdump: Support hugepd table entries
  powerpc/mm: Convert powerpc to GENERIC_PTDUMP

 arch/arm64/mm/ptdump.c            |   2 +-
 arch/powerpc/Kconfig              |   2 +
 arch/powerpc/Kconfig.debug        |  30 ------
 arch/powerpc/mm/Makefile          |   2 +-
 arch/powerpc/mm/mmu_decl.h        |   2 +-
 arch/powerpc/mm/ptdump/8xx.c      |   6 +-
 arch/powerpc/mm/ptdump/Makefile   |   9 +-
 arch/powerpc/mm/ptdump/book3s64.c |   6 +-
 arch/powerpc/mm/ptdump/ptdump.c   | 161 +++++++++---------------------
 arch/powerpc/mm/ptdump/shared.c   |   6 +-
 arch/riscv/mm/ptdump.c            |   2 +-
 arch/s390/mm/dump_pagetables.c    |   3 +-
 arch/x86/mm/dump_pagetables.c     |   2 +-
 include/linux/ptdump.h            |   2 +-
 mm/pagewalk.c                     |  54 ++++++++--
 mm/ptdump.c                       |  33 ++++--
 16 files changed, 145 insertions(+), 177 deletions(-)

-- 
2.25.0

