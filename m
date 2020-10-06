Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C222848F7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 11:07:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5BRw0gtmzDqCY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 20:07:08 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5BQG13s7zDqDh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 20:05:41 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C5BQ92skmz9tyfQ;
 Tue,  6 Oct 2020 11:05:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id I0kuODAj476l; Tue,  6 Oct 2020 11:05:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C5BQ90w0dz9tyf5;
 Tue,  6 Oct 2020 11:05:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1596E8B7C3;
 Tue,  6 Oct 2020 11:05:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4ioz5Kq1wCci; Tue,  6 Oct 2020 11:05:38 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CD6578B7C5;
 Tue,  6 Oct 2020 11:05:37 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A80FD65DE8; Tue,  6 Oct 2020 09:05:37 +0000 (UTC)
Message-Id: <1b68632425d8866d147aea9005004e4594672211.1601975100.git.christophe.leroy@csgroup.eu>
In-Reply-To: <319d379f696412681c66a987cc75e6abf8f958d2.1601975100.git.christophe.leroy@csgroup.eu>
References: <319d379f696412681c66a987cc75e6abf8f958d2.1601975100.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/2] powerpc/32s: Remove #ifdef CONFIG_PPC_BOOK3S_32 in
 head_book3s_32.S
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue,  6 Oct 2020 09:05:37 +0000 (UTC)
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

head_book3s_32.S is only built when CONFIG_PPC_BOOK3S_32 is selected.

Remove all conditions based on CONFIG_PPC_BOOK3S_32 in the file.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_book3s_32.S | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index e07a2c07ffe4..f659378adaf3 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -183,10 +183,8 @@ __after_mmu_off:
 	bl	reloc_offset
 	li	r24,0			/* cpu# */
 	bl	call_setup_cpu		/* Call setup_cpu for this CPU */
-#ifdef CONFIG_PPC_BOOK3S_32
 	bl	reloc_offset
 	bl	init_idle_6xx
-#endif /* CONFIG_PPC_BOOK3S_32 */
 
 
 /*
@@ -892,10 +890,8 @@ __secondary_start:
 	lis	r3,-KERNELBASE@h
 	mr	r4,r24
 	bl	call_setup_cpu		/* Call setup_cpu for this CPU */
-#ifdef CONFIG_PPC_BOOK3S_32
 	lis	r3,-KERNELBASE@h
 	bl	init_idle_6xx
-#endif /* CONFIG_PPC_BOOK3S_32 */
 
 	/* get current's stack and current */
 	lis	r2,secondary_current@ha
@@ -936,17 +932,6 @@ __secondary_start:
 #include "../kvm/book3s_rmhandlers.S"
 #endif
 
-/*
- * Those generic dummy functions are kept for CPUs not
- * included in CONFIG_PPC_BOOK3S_32
- */
-#if !defined(CONFIG_PPC_BOOK3S_32)
-_ENTRY(__save_cpu_setup)
-	blr
-_ENTRY(__restore_cpu_setup)
-	blr
-#endif /* !defined(CONFIG_PPC_BOOK3S_32) */
-
 /*
  * Load stuff into the MMU.  Intended to be called with
  * IR=0 and DR=0.
-- 
2.25.0

