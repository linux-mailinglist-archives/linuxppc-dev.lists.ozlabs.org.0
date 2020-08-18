Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A8E248CF7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 19:31:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWHyJ4n6xzDqVZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 03:31:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHhS4pfszDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:19:18 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWHhK58Xyz9vCxp;
 Tue, 18 Aug 2020 19:19:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 2sG3yHrf7ea4; Tue, 18 Aug 2020 19:19:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWHhK4Mkgz9vCxg;
 Tue, 18 Aug 2020 19:19:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DB0A8B7EC;
 Tue, 18 Aug 2020 19:19:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YkpBHcYFd8X0; Tue, 18 Aug 2020 19:19:15 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F7CA8B7D7;
 Tue, 18 Aug 2020 19:19:15 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3045665CF4; Tue, 18 Aug 2020 17:19:15 +0000 (UTC)
Message-Id: <3cd1e284e93c60db981659585e18d1f6bb73ed2f.1597770847.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597770847.git.christophe.leroy@csgroup.eu>
References: <cover.1597770847.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 03/25] powerpc/ptrace: Consolidate reg index calculation
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 17:19:15 +0000 (UTC)
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

Today we have:

	#ifdef CONFIG_PPC32
		index = addr >> 2;
		if ((addr & 3) || child->thread.regs == NULL)
	#else
		index = addr >> 3;
		if ((addr & 7))
	#endif

sizeof(long) has value 4 for PPC32 and value 8 for PPC64.

Dividing by 4 is equivalent to >> 2 and dividing by 8 is equivalent
to >> 3.

And 3 and 7 are respectively (sizeof(long) - 1).

Use sizeof(long) to get rid of the #ifdef CONFIG_PPC32 and consolidate
the calculation and checking.

thread.regs have to be not NULL on both PPC32 and PPC64 so adding
that test on PPC64 is harmless.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/ptrace/ptrace.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index f6e51be47c6e..51557a9c0765 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -55,14 +55,9 @@ long arch_ptrace(struct task_struct *child, long request,
 
 		ret = -EIO;
 		/* convert to index and check */
-#ifdef CONFIG_PPC32
-		index = addr >> 2;
-		if ((addr & 3) || (index > PT_FPSCR)
+		index = addr / sizeof(long);
+		if ((addr & (sizeof(long) - 1)) || (index > PT_FPSCR)
 		    || (child->thread.regs == NULL))
-#else
-		index = addr >> 3;
-		if ((addr & 7) || (index > PT_FPSCR))
-#endif
 			break;
 
 		CHECK_FULL_REGS(child->thread.regs);
@@ -90,14 +85,9 @@ long arch_ptrace(struct task_struct *child, long request,
 
 		ret = -EIO;
 		/* convert to index and check */
-#ifdef CONFIG_PPC32
-		index = addr >> 2;
-		if ((addr & 3) || (index > PT_FPSCR)
+		index = addr / sizeof(long);
+		if ((addr & (sizeof(long) - 1)) || (index > PT_FPSCR)
 		    || (child->thread.regs == NULL))
-#else
-		index = addr >> 3;
-		if ((addr & 7) || (index > PT_FPSCR))
-#endif
 			break;
 
 		CHECK_FULL_REGS(child->thread.regs);
-- 
2.25.0

