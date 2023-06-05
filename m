Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BADB722425
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 13:06:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZW5J6PSBz3flK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 21:06:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZW3m44F1z3f0R
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 21:05:24 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4QZW3Y2MkFz9sCb;
	Mon,  5 Jun 2023 13:05:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fhu60oon1sMC; Mon,  5 Jun 2023 13:05:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4QZW3Y1dnNz9sB3;
	Mon,  5 Jun 2023 13:05:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 32CC38B778;
	Mon,  5 Jun 2023 13:05:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FLX9MLqsCKmh; Mon,  5 Jun 2023 13:05:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0E8008B763;
	Mon,  5 Jun 2023 13:05:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 355B58tp063393
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 5 Jun 2023 13:05:08 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 355B587i063391;
	Mon, 5 Jun 2023 13:05:08 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 3/4] powerpc/kuap: Refactor static branch for disabling kuap
Date: Mon,  5 Jun 2023 13:04:52 +0200
Message-Id: <4d775047675e9f8ae2a9db9cb8a0cc8216a309b8.1685963081.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1a3c69e38349b687c6c65240d7c09a7817a797d8.1685963081.git.christophe.leroy@csgroup.eu>
References: <1a3c69e38349b687c6c65240d7c09a7817a797d8.1685963081.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685963090; l=5299; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=qWCbIk7tuCCl/dFn3S+BAwbrwl5BPzFumLesk9JPXVc=; b=Bf/qG292ejJpldRkQ4LnPA2iJPYNtDhZEkohnJtbbVUw6XRLEOnQ45oC5XRybY3EOcceecFt7 ikywqSF39B4CZ+ONJr/paDJQEhumioURgJFU7df2sRxPZphDyHcYW6y
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All but book3s/64 use a static branch key for disabling kuap.
book3s/64 uses a memory feature.

Refactor all targets except book3s/64.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h     |  7 -------
 arch/powerpc/include/asm/book3s/64/kup.h     |  1 +
 arch/powerpc/include/asm/kup.h               | 15 +++++++++++++++
 arch/powerpc/include/asm/nohash/32/kup-8xx.h |  7 -------
 arch/powerpc/include/asm/nohash/kup-booke.h  |  7 -------
 arch/powerpc/mm/book3s32/kuap.c              |  3 ---
 arch/powerpc/mm/init-common.c                |  3 +++
 arch/powerpc/mm/nohash/kup.c                 |  3 ---
 8 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 466a19cfb4df..8da9997a67ba 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -11,8 +11,6 @@
 
 #include <linux/jump_label.h>
 
-extern struct static_key_false disable_kuap_key;
-
 static __always_inline bool kuep_is_disabled(void)
 {
 	return !IS_ENABLED(CONFIG_PPC_KUEP);
@@ -25,11 +23,6 @@ static __always_inline bool kuep_is_disabled(void)
 #define KUAP_NONE	(~0UL)
 #define KUAP_ALL	(~1UL)
 
-static __always_inline bool kuap_is_disabled(void)
-{
-	return static_branch_unlikely(&disable_kuap_key);
-}
-
 static inline void kuap_lock_one(unsigned long addr)
 {
 	mtsr(mfsr(addr) | SR_KS, addr);
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 1b0215ff3710..f8b8e93c488c 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -233,6 +233,7 @@ static __always_inline bool kuap_is_disabled(void)
 {
 	return !mmu_has_feature(MMU_FTR_BOOK3S_KUAP);
 }
+#define kuap_is_disabled kuap_is_disabled
 
 static inline void kuap_user_restore(struct pt_regs *regs)
 {
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 0a4e07175612..74b7f4cee2ed 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -6,6 +6,12 @@
 #define KUAP_WRITE	2
 #define KUAP_READ_WRITE	(KUAP_READ | KUAP_WRITE)
 
+#ifndef __ASSEMBLY__
+#include <linux/types.h>
+
+static __always_inline bool kuap_is_disabled(void);
+#endif
+
 #ifdef CONFIG_PPC_BOOK3S_64
 #include <asm/book3s/64/kup.h>
 #endif
@@ -41,6 +47,15 @@ void setup_kuep(bool disabled);
 
 #ifdef CONFIG_PPC_KUAP
 void setup_kuap(bool disabled);
+
+#ifndef kuap_is_disabled
+extern struct static_key_false disable_kuap_key;
+
+static __always_inline bool kuap_is_disabled(void)
+{
+	return static_branch_unlikely(&disable_kuap_key);
+}
+#endif
 #else
 static inline void setup_kuap(bool disabled) { }
 
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index a372cd822887..1d53f38c5cd5 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -13,13 +13,6 @@
 
 #include <asm/reg.h>
 
-extern struct static_key_false disable_kuap_key;
-
-static __always_inline bool kuap_is_disabled(void)
-{
-	return static_branch_unlikely(&disable_kuap_key);
-}
-
 static inline void __kuap_save_and_lock(struct pt_regs *regs)
 {
 	regs->kuap = mfspr(SPRN_MD_AP);
diff --git a/arch/powerpc/include/asm/nohash/kup-booke.h b/arch/powerpc/include/asm/nohash/kup-booke.h
index 71182cbe20c3..07759ae9117b 100644
--- a/arch/powerpc/include/asm/nohash/kup-booke.h
+++ b/arch/powerpc/include/asm/nohash/kup-booke.h
@@ -18,13 +18,6 @@
 
 #include <asm/reg.h>
 
-extern struct static_key_false disable_kuap_key;
-
-static __always_inline bool kuap_is_disabled(void)
-{
-	return static_branch_unlikely(&disable_kuap_key);
-}
-
 static inline void __kuap_lock(void)
 {
 	mtspr(SPRN_PID, 0);
diff --git a/arch/powerpc/mm/book3s32/kuap.c b/arch/powerpc/mm/book3s32/kuap.c
index 28676cabb005..c5484729b595 100644
--- a/arch/powerpc/mm/book3s32/kuap.c
+++ b/arch/powerpc/mm/book3s32/kuap.c
@@ -3,9 +3,6 @@
 #include <asm/kup.h>
 #include <asm/smp.h>
 
-struct static_key_false disable_kuap_key;
-EXPORT_SYMBOL(disable_kuap_key);
-
 void kuap_lock_all_ool(void)
 {
 	kuap_lock_all();
diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index 119ef491f797..74e140b1efef 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -32,6 +32,9 @@ EXPORT_SYMBOL_GPL(kernstart_virt_addr);
 bool disable_kuep = !IS_ENABLED(CONFIG_PPC_KUEP);
 bool disable_kuap = !IS_ENABLED(CONFIG_PPC_KUAP);
 
+struct static_key_false disable_kuap_key;
+EXPORT_SYMBOL(disable_kuap_key);
+
 static int __init parse_nosmep(char *p)
 {
 	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
diff --git a/arch/powerpc/mm/nohash/kup.c b/arch/powerpc/mm/nohash/kup.c
index 552becf90e97..4e22adfa2aa8 100644
--- a/arch/powerpc/mm/nohash/kup.c
+++ b/arch/powerpc/mm/nohash/kup.c
@@ -13,9 +13,6 @@
 #include <asm/smp.h>
 
 #ifdef CONFIG_PPC_KUAP
-struct static_key_false disable_kuap_key;
-EXPORT_SYMBOL(disable_kuap_key);
-
 void setup_kuap(bool disabled)
 {
 	if (disabled) {
-- 
2.40.1

