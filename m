Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8060923D82A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 10:52:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMj0x162lzDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 18:52:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMhyp6f4yzDqcQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 18:50:24 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BMhyg3Nfcz9v0TG;
 Thu,  6 Aug 2020 10:50:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id VhIF0KbsPeBM; Thu,  6 Aug 2020 10:50:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BMhyg2Wcfz9v0St;
 Thu,  6 Aug 2020 10:50:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B26658B7FA;
 Thu,  6 Aug 2020 10:50:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id o0efautfMvDK; Thu,  6 Aug 2020 10:50:20 +0200 (CEST)
Received: from po16052vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 89F438B75E;
 Thu,  6 Aug 2020 10:50:20 +0200 (CEST)
Received: by po16052vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 765F965BC9; Thu,  6 Aug 2020 08:50:20 +0000 (UTC)
Message-Id: <04169f40c09682ce5747518268ca84285bc17fbc.1596703345.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/signal: Move and simplify get_clean_sp()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  6 Aug 2020 08:50:20 +0000 (UTC)
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

get_clean_sp() is only used in kernel/signal.c . Move it there.

And GCC is smart enough to reduce the function when on PPC32, no
need of a special PPC32 simple version.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/processor.h | 14 --------------
 arch/powerpc/kernel/signal.c         |  7 +++++++
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index ed0d633ab5aa..5c20b6d509ae 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -404,20 +404,6 @@ static inline void prefetchw(const void *x)
 
 #define HAVE_ARCH_PICK_MMAP_LAYOUT
 
-#ifdef CONFIG_PPC64
-static inline unsigned long get_clean_sp(unsigned long sp, int is_32)
-{
-	if (is_32)
-		return sp & 0x0ffffffffUL;
-	return sp;
-}
-#else
-static inline unsigned long get_clean_sp(unsigned long sp, int is_32)
-{
-	return sp;
-}
-#endif
-
 /* asm stubs */
 extern unsigned long isa300_idle_stop_noloss(unsigned long psscr_val);
 extern unsigned long isa300_idle_stop_mayloss(unsigned long psscr_val);
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index d15a98c758b8..bd0ba7c5e2cf 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -171,6 +171,13 @@ inline unsigned long copy_ckfpr_from_user(struct task_struct *task,
 
 int show_unhandled_signals = 1;
 
+static unsigned long get_clean_sp(unsigned long sp, int is_32)
+{
+	if (is_32)
+		return sp & 0x0ffffffffUL;
+	return sp;
+}
+
 /*
  * Allocate space for the signal frame
  */
-- 
2.25.0

