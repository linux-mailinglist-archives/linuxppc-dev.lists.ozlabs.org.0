Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E924739F1E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 12:58:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qmy5y0wJtz3cb6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 20:58:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qmy2Q0R69z3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 20:55:25 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Qmy210013z9sRm;
	Thu, 22 Jun 2023 12:55:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JzeXHVWfZ6P7; Thu, 22 Jun 2023 12:55:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Qmy1v70Wsz9sRt;
	Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EC07F8B763;
	Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id qI5FN3vJJBbQ; Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.14])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3B8978B77D;
	Thu, 22 Jun 2023 12:54:59 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35MAsrUl2382567
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jun 2023 12:54:53 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35MAsrTX2382566;
	Thu, 22 Jun 2023 12:54:53 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Naveen N Rao <naveen@kernel.org>
Subject: [PATCH v2 04/14] powerpc/kuap: Make disabling KUAP at boottime impossible except on book3s/64
Date: Thu, 22 Jun 2023 12:54:26 +0200
Message-Id: <8e178a6823aee38af74dc59d246185bfc4d846d9.1687430631.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687430631.git.christophe.leroy@csgroup.eu>
References: <cover.1687430631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687431271; l=3711; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=qpT8lcamvy7dK8UQJBZ5uk7RcXiHWOqfTZFEErmAGRw=; b=U9dBB/+u2VxlX8iaDgxnhExM/RgR10aljKoyAeC7MwwAM4kZ9SACfIvBAxTwuSXLsBum47C4N sDEorkMzxQ9BeRp2ptsdZog+OJi/GMkLEY8tvjfOdyAwl5qhcZkfMOb
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

It is possible to disable KUAP at boottime with 'nosmap' parameter.

That is implemented with jump_label hence adds a 'nop' in front
of each open/close of userspace access.

From a security point of view it makes sence to disallow disabling
KUAP. And on processors like the 8xx where 'nop' is not seamless,
it saves a few cycles.

In addition, objtool UACCESS validation cannot cope with that
feature because it visits every static branches independentely and
is not able to see that when a UACCESS enable is skipped, the
matching UACCESS disable is skipped as well.

So make KUAP always active when selected in kernel config.

In the future it may be re-implemented by noping the instructions
instead of using static branches.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/kup.h  |  4 +---
 arch/powerpc/mm/book3s32/kuap.c | 15 ++++++---------
 arch/powerpc/mm/init-common.c   |  6 +++---
 arch/powerpc/mm/nohash/kup.c    |  8 +-------
 4 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 74b7f4cee2ed..a02340535efa 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -49,11 +49,9 @@ void setup_kuep(bool disabled);
 void setup_kuap(bool disabled);
 
 #ifndef kuap_is_disabled
-extern struct static_key_false disable_kuap_key;
-
 static __always_inline bool kuap_is_disabled(void)
 {
-	return static_branch_unlikely(&disable_kuap_key);
+	return false;
 }
 #endif
 #else
diff --git a/arch/powerpc/mm/book3s32/kuap.c b/arch/powerpc/mm/book3s32/kuap.c
index c5484729b595..639219d0a821 100644
--- a/arch/powerpc/mm/book3s32/kuap.c
+++ b/arch/powerpc/mm/book3s32/kuap.c
@@ -17,17 +17,14 @@ EXPORT_SYMBOL(kuap_unlock_all_ool);
 
 void setup_kuap(bool disabled)
 {
-	if (!disabled) {
-		kuap_lock_all_ool();
-		init_mm.context.sr0 |= SR_KS;
-		current->thread.sr0 |= SR_KS;
-	}
+	WARN_ON(disabled);
+
+	kuap_lock_all_ool();
+	init_mm.context.sr0 |= SR_KS;
+	current->thread.sr0 |= SR_KS;
 
 	if (smp_processor_id() != boot_cpuid)
 		return;
 
-	if (disabled)
-		static_branch_enable(&disable_kuap_key);
-	else
-		pr_info("Activating Kernel Userspace Access Protection\n");
+	pr_info("Activating Kernel Userspace Access Protection\n");
 }
diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index 74e140b1efef..237086742ec7 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -32,9 +32,6 @@ EXPORT_SYMBOL_GPL(kernstart_virt_addr);
 bool disable_kuep = !IS_ENABLED(CONFIG_PPC_KUEP);
 bool disable_kuap = !IS_ENABLED(CONFIG_PPC_KUAP);
 
-struct static_key_false disable_kuap_key;
-EXPORT_SYMBOL(disable_kuap_key);
-
 static int __init parse_nosmep(char *p)
 {
 	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
@@ -48,6 +45,9 @@ early_param("nosmep", parse_nosmep);
 
 static int __init parse_nosmap(char *p)
 {
+	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
+		return 0;
+
 	disable_kuap = true;
 	pr_warn("Disabling Kernel Userspace Access Protection\n");
 	return 0;
diff --git a/arch/powerpc/mm/nohash/kup.c b/arch/powerpc/mm/nohash/kup.c
index 4e22adfa2aa8..3bb79f89de06 100644
--- a/arch/powerpc/mm/nohash/kup.c
+++ b/arch/powerpc/mm/nohash/kup.c
@@ -15,13 +15,7 @@
 #ifdef CONFIG_PPC_KUAP
 void setup_kuap(bool disabled)
 {
-	if (disabled) {
-		if (IS_ENABLED(CONFIG_40x))
-			disable_kuep = true;
-		if (smp_processor_id() == boot_cpuid)
-			static_branch_enable(&disable_kuap_key);
-		return;
-	}
+	WARN_ON(disabled);
 
 	pr_info("Activating Kernel Userspace Access Protection\n");
 
-- 
2.40.1

