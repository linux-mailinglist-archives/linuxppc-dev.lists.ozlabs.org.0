Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 561BB24CED9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 09:19:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXtDP2d15zDr5R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 17:19:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXt8N5ZkgzDr82
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 17:15:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BXt8F5Xvcz9tym5;
 Fri, 21 Aug 2020 09:15:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id O0PyNLgBqKj0; Fri, 21 Aug 2020 09:15:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BXt8F4c1Vz9tym4;
 Fri, 21 Aug 2020 09:15:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A286A8B8AD;
 Fri, 21 Aug 2020 09:15:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xvEEdfAwWWmE; Fri, 21 Aug 2020 09:15:26 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3C6518B8A2;
 Fri, 21 Aug 2020 09:15:26 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0403765CFE; Fri, 21 Aug 2020 07:15:25 +0000 (UTC)
Message-Id: <09fc73fe9c7423c6b4cf93f93df9bb0ed8eefab5.1597994047.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/32s: Fix module loading failure when VMALLOC_END is
 over 0xf0000000
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 schwab@linux-m68k.org
Date: Fri, 21 Aug 2020 07:15:25 +0000 (UTC)
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

In is_module_segment(), when VMALLOC_END is over 0xf0000000,
ALIGN(VMALLOC_END, SZ_256M) has value 0.

In that case, addr >= ALIGN(VMALLOC_END, SZ_256M) is always
true then is_module_segment() always returns false.

Use (ALIGN(VMALLOC_END, SZ_256M) - 1) which will have
value 0xffffffff and will be suitable for the comparison.

Reported-by: Andreas Schwab <schwab@linux-m68k.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Fixes: c49643319715 ("powerpc/32s: Only leave NX unset on segments used for modules")
---
 arch/powerpc/mm/book3s32/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 82ae9e06a773..d426eaf76bb0 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -194,12 +194,12 @@ static bool is_module_segment(unsigned long addr)
 #ifdef MODULES_VADDR
 	if (addr < ALIGN_DOWN(MODULES_VADDR, SZ_256M))
 		return false;
-	if (addr >= ALIGN(MODULES_END, SZ_256M))
+	if (addr > ALIGN(MODULES_END, SZ_256M) - 1)
 		return false;
 #else
 	if (addr < ALIGN_DOWN(VMALLOC_START, SZ_256M))
 		return false;
-	if (addr >= ALIGN(VMALLOC_END, SZ_256M))
+	if (addr > ALIGN(VMALLOC_END, SZ_256M) - 1)
 		return false;
 #endif
 	return true;
-- 
2.25.0

