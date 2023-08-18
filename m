Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A8A7805FD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 08:53:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRsyl1NdNz3cR8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 16:53:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRsxW31f4z3cPJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 16:52:10 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RRsxL46p5z9wtt;
	Fri, 18 Aug 2023 08:52:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LiPPU3P2aRpV; Fri, 18 Aug 2023 08:52:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RRsxL3V5Fz9wtQ;
	Fri, 18 Aug 2023 08:52:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 742028B76C;
	Fri, 18 Aug 2023 08:52:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 1P4BEjFwJOeQ; Fri, 18 Aug 2023 08:52:06 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (PO17626.IDSI0.si.c-s.fr [172.19.54.29])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2CEB18B763;
	Fri, 18 Aug 2023 08:52:06 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37I6q2Em021734
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 08:52:02 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37I6ptDc021716;
	Fri, 18 Aug 2023 08:51:55 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2] powerpc/512x: Make mpc512x_select_reset_compat() static
Date: Fri, 18 Aug 2023 08:51:48 +0200
Message-ID: <36a19e13025dbf17e92e832dd24150642b0e9bad.1692341499.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692341507; l=2561; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=69gjT6dGiiA87yrcdfW2QUGSmZ7Vx8PquMwccpsJf3w=; b=3OxJFkXpXWamil9nkMCXX3NaGZf7chUYKaCAsC8/6F7LhH/3CP5+7yQ30QX7TQ+M5TN22V76m 1T/2n44SmIwCe4quiTcnmbJ70AT6qci89CzQQyx2C9N+Kmnh9Bn+Ukt
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

mpc512x_select_reset_compat() is only used in the file it
is defined.

Make it static.

Move mpc512x_restart_init() after mpc512x_select_reset_compat().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Move mpc512x_restart_init() after mpc512x_select_reset_compat().
---
 arch/powerpc/platforms/512x/mpc512x.h        |  1 -
 arch/powerpc/platforms/512x/mpc512x_shared.c | 30 ++++++++++----------
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/platforms/512x/mpc512x.h b/arch/powerpc/platforms/512x/mpc512x.h
index 2f3c60e373e1..d2cb06e3a436 100644
--- a/arch/powerpc/platforms/512x/mpc512x.h
+++ b/arch/powerpc/platforms/512x/mpc512x.h
@@ -13,7 +13,6 @@ extern void __init mpc512x_init(void);
 extern void __init mpc512x_setup_arch(void);
 extern int __init mpc5121_clk_init(void);
 const char *__init mpc512x_select_psc_compat(void);
-const char *__init mpc512x_select_reset_compat(void);
 extern void __noreturn mpc512x_restart(char *cmd);
 
 #endif				/* __MPC512X_H__ */
diff --git a/arch/powerpc/platforms/512x/mpc512x_shared.c b/arch/powerpc/platforms/512x/mpc512x_shared.c
index 5ac0ead2540f..8f75e9574c27 100644
--- a/arch/powerpc/platforms/512x/mpc512x_shared.c
+++ b/arch/powerpc/platforms/512x/mpc512x_shared.c
@@ -29,20 +29,6 @@
 
 static struct mpc512x_reset_module __iomem *reset_module_base;
 
-static void __init mpc512x_restart_init(void)
-{
-	struct device_node *np;
-	const char *reset_compat;
-
-	reset_compat = mpc512x_select_reset_compat();
-	np = of_find_compatible_node(NULL, NULL, reset_compat);
-	if (!np)
-		return;
-
-	reset_module_base = of_iomap(np, 0);
-	of_node_put(np);
-}
-
 void __noreturn mpc512x_restart(char *cmd)
 {
 	if (reset_module_base) {
@@ -363,7 +349,7 @@ const char *__init mpc512x_select_psc_compat(void)
 	return NULL;
 }
 
-const char *__init mpc512x_select_reset_compat(void)
+static const char *__init mpc512x_select_reset_compat(void)
 {
 	if (of_machine_is_compatible("fsl,mpc5121"))
 		return "fsl,mpc5121-reset";
@@ -455,6 +441,20 @@ static void __init mpc512x_psc_fifo_init(void)
 	}
 }
 
+static void __init mpc512x_restart_init(void)
+{
+	struct device_node *np;
+	const char *reset_compat;
+
+	reset_compat = mpc512x_select_reset_compat();
+	np = of_find_compatible_node(NULL, NULL, reset_compat);
+	if (!np)
+		return;
+
+	reset_module_base = of_iomap(np, 0);
+	of_node_put(np);
+}
+
 void __init mpc512x_init_early(void)
 {
 	mpc512x_restart_init();
-- 
2.41.0

