Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA4669B901
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 10:18:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJjll4sClz3fXV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 20:18:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJjjT4qBjz3fRK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 20:16:29 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4PJjjC2bC0z9scw;
	Sat, 18 Feb 2023 10:16:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ncrDxCUZd67; Sat, 18 Feb 2023 10:16:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4PJjjC1hglz9scs;
	Sat, 18 Feb 2023 10:16:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A4C08B78D;
	Sat, 18 Feb 2023 10:16:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fYZNLPwJ-zed; Sat, 18 Feb 2023 10:16:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.7.180])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DBD258B768;
	Sat, 18 Feb 2023 10:16:14 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 31I9G8N4642537
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 18 Feb 2023 10:16:08 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 31I9G85N642528;
	Sat, 18 Feb 2023 10:16:08 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 04/10] powerpc/47x: Split ppc47x machine in two
Date: Sat, 18 Feb 2023 10:15:47 +0100
Message-Id: <f8f90020c09abdeccacf6d24f0c513e9a8ad75be.1676711562.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <6cb9865d916231c38401ba34ad1a98c249fae135.1676711562.git.christophe.leroy@csgroup.eu>
References: <6cb9865d916231c38401ba34ad1a98c249fae135.1676711562.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676711718; l=2584; s=20211009; h=from:subject:message-id; bh=9M0CwmB0Wm03CvlxKQyiW8+JYt1D4vMd6pODquen9Fs=; b=RvsftSdHLys0j+QrqI1vs/UTYPr0MFW+mSbi3LuwOsXcQXNXz4uIdrwT3LhYZW0TbZy3JUMyXWI3 DQ4nJUB9DX28solk8Vu+eaIvWhvi3svjHTEzyK5HF7fPYxuhulCM
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

This machine matches two compatibles and sets .pci_irq_fixup
on one of them.

Split it into two machines, then the probe function can be dropped.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Also update/duplicate machine_{device/arch}_initcall
---
 arch/powerpc/platforms/44x/ppc476.c | 37 ++++++++++++++---------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/platforms/44x/ppc476.c b/arch/powerpc/platforms/44x/ppc476.c
index 7c91ac5a5241..11f939ee98c4 100644
--- a/arch/powerpc/platforms/44x/ppc476.c
+++ b/arch/powerpc/platforms/44x/ppc476.c
@@ -114,7 +114,8 @@ static int __init ppc47x_device_probe(void)
 
 	return 0;
 }
-machine_device_initcall(ppc47x, ppc47x_device_probe);
+machine_device_initcall(ppc47x_akebono, ppc47x_device_probe);
+machine_device_initcall(ppc47x_currituck, ppc47x_device_probe);
 
 static void __init ppc47x_init_irq(void)
 {
@@ -249,7 +250,8 @@ static int __init ppc47x_get_board_rev(void)
 	pr_info("%s: Unable to find board revision\n", __func__);
 	return 0;
 }
-machine_arch_initcall(ppc47x, ppc47x_get_board_rev);
+machine_arch_initcall(ppc47x_akebono, ppc47x_get_board_rev);
+machine_arch_initcall(ppc47x_currituck, ppc47x_get_board_rev);
 
 /* Use USB controller should have been hardware swizzled but it wasn't :( */
 static void ppc47x_pci_irq_fixup(struct pci_dev *dev)
@@ -268,27 +270,24 @@ static void ppc47x_pci_irq_fixup(struct pci_dev *dev)
 	}
 }
 
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init ppc47x_probe(void)
-{
-	if (of_machine_is_compatible("ibm,akebono"))
-		return 1;
-
-	if (of_machine_is_compatible("ibm,currituck")) {
-		ppc_md.pci_irq_fixup = ppc47x_pci_irq_fixup;
-		return 1;
-	}
-
-	return 0;
-}
+define_machine(ppc47x_akebono) {
+	.name			= "PowerPC 47x (akebono)",
+	.compatible		= "ibm,akebono",
+	.probe			= ppc47x_probe,
+	.progress		= udbg_progress,
+	.init_IRQ		= ppc47x_init_irq,
+	.setup_arch		= ppc47x_setup_arch,
+	.restart		= ppc4xx_reset_system,
+	.calibrate_decr		= generic_calibrate_decr,
+};
 
-define_machine(ppc47x) {
-	.name			= "PowerPC 47x",
+define_machine(ppc47x_currituck) {
+	.name			= "PowerPC 47x (currituck)",
+	.compatible		= "ibm,currituck",
 	.probe			= ppc47x_probe,
 	.progress		= udbg_progress,
 	.init_IRQ		= ppc47x_init_irq,
+	.pci_irq_fixup		= ppc47x_pci_irq_fixup,
 	.setup_arch		= ppc47x_setup_arch,
 	.restart		= ppc4xx_reset_system,
 	.calibrate_decr		= generic_calibrate_decr,
-- 
2.39.1

