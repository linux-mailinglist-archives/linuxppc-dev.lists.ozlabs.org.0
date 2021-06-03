Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDAA399CE1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 10:42:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwfXt0nrnz3c4h
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 18:42:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwfWz6QXwz2yxn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 18:41:51 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FwfWk4qstzBC5n;
 Thu,  3 Jun 2021 10:41:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P8MjqLwMIrOQ; Thu,  3 Jun 2021 10:41:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FwfWk3xz1zBC5Z;
 Thu,  3 Jun 2021 10:41:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D4EF8B848;
 Thu,  3 Jun 2021 10:41:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6iMZvVGWD2F4; Thu,  3 Jun 2021 10:41:38 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DEE688B767;
 Thu,  3 Jun 2021 10:41:37 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B94B464BD2; Thu,  3 Jun 2021 08:41:37 +0000 (UTC)
Message-Id: <24591ca480d14a62ef910e38a5273d551262c4a2.1622708530.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1622708530.git.christophe.leroy@csgroup.eu>
References: <cover.1622708530.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 02/12] powerpc/32s: Refactor update of user segment
 registers
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  3 Jun 2021 08:41:37 +0000 (UTC)
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

KUEP implements the update of user segment registers.

Move it into mmu-hash.h in order to use it from other places.

And inline kuep_lock() and kuep_unlock(). Inlining kuep_lock() is
important for system_call_exception(), otherwise system_call_exception()
has to save into stack the system call parameters that are used just
after, and doing that takes more instructions than kuep_lock() itself.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h      | 21 +++++++++++
 arch/powerpc/include/asm/book3s/32/mmu-hash.h | 27 ++++++++++++++
 arch/powerpc/include/asm/kup.h                |  5 +--
 arch/powerpc/mm/book3s32/kuep.c               | 37 -------------------
 4 files changed, 49 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index c1f7c2e625a6..83aa0dde50d6 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -7,6 +7,27 @@
 
 #ifndef __ASSEMBLY__
 
+static __always_inline bool kuep_is_disabled(void)
+{
+	return !IS_ENABLED(CONFIG_PPC_KUEP);
+}
+
+static inline void kuep_lock(void)
+{
+	if (kuep_is_disabled())
+		return;
+
+	update_user_segments(mfsr(0) | SR_NX);
+}
+
+static inline void kuep_unlock(void)
+{
+	if (kuep_is_disabled())
+		return;
+
+	update_user_segments(mfsr(0) & ~SR_NX);
+}
+
 #ifdef CONFIG_PPC_KUAP
 
 #include <linux/sched.h>
diff --git a/arch/powerpc/include/asm/book3s/32/mmu-hash.h b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
index b85f8e114a9c..cc0284bbac86 100644
--- a/arch/powerpc/include/asm/book3s/32/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
@@ -102,6 +102,33 @@ extern s32 patch__hash_page_B, patch__hash_page_C;
 extern s32 patch__flush_hash_A0, patch__flush_hash_A1, patch__flush_hash_A2;
 extern s32 patch__flush_hash_B;
 
+#include <asm/reg.h>
+#include <asm/task_size_32.h>
+
+#define UPDATE_TWO_USER_SEGMENTS(n) do {		\
+	if (TASK_SIZE > ((n) << 28))			\
+		mtsr(val1, (n) << 28);			\
+	if (TASK_SIZE > (((n) + 1) << 28))		\
+		mtsr(val2, ((n) + 1) << 28);		\
+	val1 = (val1 + 0x222) & 0xf0ffffff;		\
+	val2 = (val2 + 0x222) & 0xf0ffffff;		\
+} while (0)
+
+static __always_inline void update_user_segments(u32 val)
+{
+	int val1 = val;
+	int val2 = (val + 0x111) & 0xf0ffffff;
+
+	UPDATE_TWO_USER_SEGMENTS(0);
+	UPDATE_TWO_USER_SEGMENTS(2);
+	UPDATE_TWO_USER_SEGMENTS(4);
+	UPDATE_TWO_USER_SEGMENTS(6);
+	UPDATE_TWO_USER_SEGMENTS(8);
+	UPDATE_TWO_USER_SEGMENTS(10);
+	UPDATE_TWO_USER_SEGMENTS(12);
+	UPDATE_TWO_USER_SEGMENTS(14);
+}
+
 #endif /* !__ASSEMBLY__ */
 
 /* We happily ignore the smaller BATs on 601, we don't actually use
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index ec96232529ac..4b94d4293777 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -46,10 +46,7 @@ void setup_kuep(bool disabled);
 static inline void setup_kuep(bool disabled) { }
 #endif /* CONFIG_PPC_KUEP */
 
-#if defined(CONFIG_PPC_KUEP) && defined(CONFIG_PPC_BOOK3S_32)
-void kuep_lock(void);
-void kuep_unlock(void);
-#else
+#ifndef CONFIG_PPC_BOOK3S_32
 static inline void kuep_lock(void) { }
 static inline void kuep_unlock(void) { }
 #endif
diff --git a/arch/powerpc/mm/book3s32/kuep.c b/arch/powerpc/mm/book3s32/kuep.c
index 6eafe7b2b031..919595f47e25 100644
--- a/arch/powerpc/mm/book3s32/kuep.c
+++ b/arch/powerpc/mm/book3s32/kuep.c
@@ -1,43 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <asm/kup.h>
-#include <asm/reg.h>
-#include <asm/task_size_32.h>
-#include <asm/mmu.h>
-
-#define KUEP_UPDATE_TWO_USER_SEGMENTS(n) do {		\
-	if (TASK_SIZE > ((n) << 28))			\
-		mtsr(val1, (n) << 28);			\
-	if (TASK_SIZE > (((n) + 1) << 28))		\
-		mtsr(val2, ((n) + 1) << 28);		\
-	val1 = (val1 + 0x222) & 0xf0ffffff;		\
-	val2 = (val2 + 0x222) & 0xf0ffffff;		\
-} while (0)
-
-static __always_inline void kuep_update(u32 val)
-{
-	int val1 = val;
-	int val2 = (val + 0x111) & 0xf0ffffff;
-
-	KUEP_UPDATE_TWO_USER_SEGMENTS(0);
-	KUEP_UPDATE_TWO_USER_SEGMENTS(2);
-	KUEP_UPDATE_TWO_USER_SEGMENTS(4);
-	KUEP_UPDATE_TWO_USER_SEGMENTS(6);
-	KUEP_UPDATE_TWO_USER_SEGMENTS(8);
-	KUEP_UPDATE_TWO_USER_SEGMENTS(10);
-	KUEP_UPDATE_TWO_USER_SEGMENTS(12);
-	KUEP_UPDATE_TWO_USER_SEGMENTS(14);
-}
-
-void kuep_lock(void)
-{
-	kuep_update(mfsr(0) | SR_NX);
-}
-
-void kuep_unlock(void)
-{
-	kuep_update(mfsr(0) & ~SR_NX);
-}
 
 void __init setup_kuep(bool disabled)
 {
-- 
2.25.0

