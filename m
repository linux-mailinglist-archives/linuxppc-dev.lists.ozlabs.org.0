Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B93669F6FC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 15:47:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMJs90dR5z3fgy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 01:47:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMJnP1C9Vz3cLT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 01:43:52 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4PMJn24BcHz9sTK;
	Wed, 22 Feb 2023 15:43:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1B_hiUGDNoUU; Wed, 22 Feb 2023 15:43:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4PMJmw6rcyz9sTP;
	Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DA1F98B798;
	Wed, 22 Feb 2023 15:43:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id tVgWbnZBDkVp; Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9FBE58B78F;
	Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 31MEhM2J1187117
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 15:43:22 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 31MEhMbw1187116;
	Wed, 22 Feb 2023 15:43:22 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v4 08/17] powerpc/85xx: Remove #ifdefs CONFIG_PPC_I8259 in mpc85xx_ds
Date: Wed, 22 Feb 2023 15:42:55 +0100
Message-Id: <3fc29340ba57d61921ddf395ac80a3a83b37783b.1677076552.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677076552.git.christophe.leroy@csgroup.eu>
References: <cover.1677076552.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677076980; l=2267; s=20211009; h=from:subject:message-id; bh=nWBQe8lwquK/CyACk0YHIWCQ+dvzXRrfH8PjQNsiwUc=; b=vOen4Nhkhe/fay27COFNi0kjTgJH/0sSQB9xScuRfbh1tOmbIxSyKhI5R0RYOVy5gNMmzoQY/+Wm WE46ykuwBIwVWB6AkHyNgQXFfTSB20Ayxjzsz1DLYrVrlxzbpAYz
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

All necessary items are declared all the time, no need to use
a #ifdef CONFIG_PPC_I8259.

Refactor CONFIG_PPC_I8259 actions into a dedicated init function.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/85xx/mpc85xx_ds.c | 37 +++++++++++++-----------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index e995c939c14d..2b3e9aecb3ad 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -34,7 +34,6 @@
 
 #include "mpc85xx.h"
 
-#ifdef CONFIG_PPC_I8259
 static void mpc85xx_8259_cascade(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
@@ -45,29 +44,16 @@ static void mpc85xx_8259_cascade(struct irq_desc *desc)
 	}
 	chip->irq_eoi(&desc->irq_data);
 }
-#endif	/* CONFIG_PPC_I8259 */
 
-void __init mpc85xx_ds_pic_init(void)
+static void __init mpc85xx_8259_init(void)
 {
-	struct mpic *mpic;
-	int flags = MPIC_BIG_ENDIAN | MPIC_SINGLE_DEST_CPU;
-#ifdef CONFIG_PPC_I8259
 	struct device_node *np;
 	struct device_node *cascade_node = NULL;
 	int cascade_irq;
-#endif
 
-	if (of_machine_is_compatible("fsl,MPC8572DS-CAMP"))
-		flags |= MPIC_NO_RESET;
-
-	mpic = mpic_alloc(NULL, 0, flags, 0, 256, " OpenPIC  ");
-
-	if (WARN_ON(!mpic))
+	if (!IS_ENABLED(CONFIG_PPC_I8259))
 		return;
 
-	mpic_init(mpic);
-
-#ifdef CONFIG_PPC_I8259
 	/* Initialize the i8259 controller */
 	for_each_node_by_type(np, "interrupt-controller")
 	    if (of_device_is_compatible(np, "chrp,iic")) {
@@ -92,7 +78,24 @@ void __init mpc85xx_ds_pic_init(void)
 	of_node_put(cascade_node);
 
 	irq_set_chained_handler(cascade_irq, mpc85xx_8259_cascade);
-#endif	/* CONFIG_PPC_I8259 */
+}
+
+void __init mpc85xx_ds_pic_init(void)
+{
+	struct mpic *mpic;
+	int flags = MPIC_BIG_ENDIAN | MPIC_SINGLE_DEST_CPU;
+
+	if (of_machine_is_compatible("fsl,MPC8572DS-CAMP"))
+		flags |= MPIC_NO_RESET;
+
+	mpic = mpic_alloc(NULL, 0, flags, 0, 256, " OpenPIC  ");
+
+	if (WARN_ON(!mpic))
+		return;
+
+	mpic_init(mpic);
+
+	mpc85xx_8259_init();
 }
 
 static struct device_node *pci_with_uli;
-- 
2.39.1

