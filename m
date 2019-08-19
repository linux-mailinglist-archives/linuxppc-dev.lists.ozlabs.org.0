Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A44892452
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 15:09:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BvQD5nXmzDqhm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 23:09:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="hW9FcYRa"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BvMF40rSzDqBb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 23:06:33 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46BvM46Dc0z9v0nV;
 Mon, 19 Aug 2019 15:06:24 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=hW9FcYRa; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xDsjm5MCL1QQ; Mon, 19 Aug 2019 15:06:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46BvM459zvz9v0nR;
 Mon, 19 Aug 2019 15:06:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566219984; bh=KFV/1fdZg0fpwYENKq684+t6u9FVfI/nrP/O7DkpXJU=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=hW9FcYRa8+yW+kCQC74uITpVTbQhGYCpJnmSRE46UEtlXVvmPhI8jc28nvmmfnLXO
 bggxt7MXPe6oOuzYImFEIDUAjJqYCnwg1ULbrx4ZoLgLzDTuji2XW9MVP0cedXbrg5
 Tuydr04iIVycyErpxYcu2yL8byt1Qcy6SHWA0+u8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 36E418B7B7;
 Mon, 19 Aug 2019 15:06:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3sD7BLoLGF8M; Mon, 19 Aug 2019 15:06:30 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1A78D8B7B6;
 Mon, 19 Aug 2019 15:06:30 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1E6E56B708; Mon, 19 Aug 2019 13:06:30 +0000 (UTC)
Message-Id: <c19a82b37677ace0eebb0dc8c2120373c29c8dd1.1566219503.git.christophe.leroy@c-s.fr>
In-Reply-To: <a6781075192afe0c909ce7d091de7931183a5d93.1566219503.git.christophe.leroy@c-s.fr>
References: <a6781075192afe0c909ce7d091de7931183a5d93.1566219503.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 2/3] powerpc: refactoring BUG/WARN macros
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 segher@kernel.crashing.org
Date: Mon, 19 Aug 2019 13:06:30 +0000 (UTC)
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

BUG(), WARN() and friends are using a similar inline
assembly to implement various traps with various flags.

Lets refactor via a new BUG_ENTRY() macro.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/bug.h | 41 +++++++++++++++--------------------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 3928fdaebb71..dbf7da90f507 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -57,6 +57,15 @@
 	".previous\n"
 #endif
 
+#define BUG_ENTRY(insn, flags, ...)			\
+	__asm__ __volatile__(				\
+		"1:	" insn "\n"			\
+		_EMIT_BUG_ENTRY				\
+		: : "i" (__FILE__), "i" (__LINE__),	\
+		  "i" (flags),				\
+		  "i" (sizeof(struct bug_entry)),	\
+		  ##__VA_ARGS__)
+
 /*
  * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
  * optimisations. However depending on the complexity of the condition
@@ -64,11 +73,7 @@
  */
 
 #define BUG() do {						\
-	__asm__ __volatile__(					\
-		"1:	twi 31,0,0\n"				\
-		_EMIT_BUG_ENTRY					\
-		: : "i" (__FILE__), "i" (__LINE__),		\
-		    "i" (0), "i"  (sizeof(struct bug_entry)));	\
+	BUG_ENTRY("twi 31, 0, 0", 0);				\
 	unreachable();						\
 } while (0)
 
@@ -77,23 +82,11 @@
 		if (x)						\
 			BUG();					\
 	} else {						\
-		__asm__ __volatile__(				\
-		"1:	"PPC_TLNEI"	%4,0\n"			\
-		_EMIT_BUG_ENTRY					\
-		: : "i" (__FILE__), "i" (__LINE__), "i" (0),	\
-		  "i" (sizeof(struct bug_entry)),		\
-		  "r" ((__force long)(x)));			\
+		BUG_ENTRY(PPC_TLNEI " %4, 0", 0, "r" ((__force long)(x)));	\
 	}							\
 } while (0)
 
-#define __WARN_FLAGS(flags) do {				\
-	__asm__ __volatile__(					\
-		"1:	twi 31,0,0\n"				\
-		_EMIT_BUG_ENTRY					\
-		: : "i" (__FILE__), "i" (__LINE__),		\
-		  "i" (BUGFLAG_WARNING|(flags)),		\
-		  "i" (sizeof(struct bug_entry)));		\
-} while (0)
+#define __WARN_FLAGS(flags) BUG_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags))
 
 #define WARN_ON(x) ({						\
 	int __ret_warn_on = !!(x);				\
@@ -101,13 +94,9 @@
 		if (__ret_warn_on)				\
 			__WARN_TAINT(TAINT_WARN);		\
 	} else {						\
-		__asm__ __volatile__(				\
-		"1:	"PPC_TLNEI"	%4,0\n"			\
-		_EMIT_BUG_ENTRY					\
-		: : "i" (__FILE__), "i" (__LINE__),		\
-		  "i" (BUGFLAG_WARNING|BUGFLAG_TAINT(TAINT_WARN)),\
-		  "i" (sizeof(struct bug_entry)),		\
-		  "r" (__ret_warn_on));				\
+		BUG_ENTRY(PPC_TLNEI " %4, 0",			\
+			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
+			  "r" (__ret_warn_on));	\
 	}							\
 	unlikely(__ret_warn_on);				\
 })
-- 
2.13.3

