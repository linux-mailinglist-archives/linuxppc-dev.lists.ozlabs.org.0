Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D87420CE1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 13:17:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wQ1X6s68zDqMd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 21:17:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wPzh1QHTzDqSM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 21:15:25 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49wPzP5LWHz9tyrG;
 Mon, 29 Jun 2020 13:15:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OXuXuozMG7Iv; Mon, 29 Jun 2020 13:15:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49wPzP4K8pz9tyqw;
 Mon, 29 Jun 2020 13:15:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 35C818B79E;
 Mon, 29 Jun 2020 13:15:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9LehT2Iwe4Is; Mon, 29 Jun 2020 13:15:20 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0AFBA8B799;
 Mon, 29 Jun 2020 13:15:20 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C32AF65B29; Mon, 29 Jun 2020 11:15:19 +0000 (UTC)
Message-Id: <cover.1593428200.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 0/6] powerpc/32s: Allocate modules outside of vmalloc space
 for STRICT_KERNEL_RWX
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 29 Jun 2020 11:15:19 +0000 (UTC)
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

On book3s32 (hash), exec protection is set per 256Mb segments with NX bit.
Instead of clearing NX bit on vmalloc space when CONFIG_MODULES is selected,
allocate modules in a dedicated segment (0xb0000000-0xbfffffff by default).
This allows to keep exec protection on vmalloc space while allowing exec
on modules.

v2:
- Removed the two patches that fix ptdump. Will submitted independently
- Only changing the user/kernel boundary for PPC32 now.
- Reordered the patches inside the series.

Christophe Leroy (6):
  powerpc/lib: Prepare code-patching for modules allocated outside
    vmalloc space
  powerpc: Use MODULES_VADDR if defined
  powerpc/32s: Only leave NX unset on segments used for modules
  powerpc/32: Set user/kernel boundary at TASK_SIZE instead of
    PAGE_OFFSET
  powerpc/32s: Kernel space starts at TASK_SIZE
  powerpc/32s: Use dedicated segment for modules with STRICT_KERNEL_RWX

 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/32/pgtable.h | 15 +++++----------
 arch/powerpc/include/asm/page.h              |  4 +++-
 arch/powerpc/kernel/head_32.S                | 12 ++++++------
 arch/powerpc/kernel/module.c                 | 11 +++++++++++
 arch/powerpc/lib/code-patching.c             |  2 +-
 arch/powerpc/mm/book3s32/hash_low.S          |  2 +-
 arch/powerpc/mm/book3s32/mmu.c               | 17 ++++++++++++++---
 arch/powerpc/mm/kasan/kasan_init_32.c        |  6 ++++++
 arch/powerpc/mm/ptdump/ptdump.c              | 16 ++++++++++++++--
 10 files changed, 62 insertions(+), 24 deletions(-)

-- 
2.25.0

