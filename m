Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD6977F1C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 10:06:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRHd91TC6z3cKK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 18:06:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRHcg3W5Rz2ygV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 18:05:33 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RRHcS51t9z9xQq;
	Thu, 17 Aug 2023 10:05:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-cH3T4T3rv1; Thu, 17 Aug 2023 10:05:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RRHcS4Kvqz9xQc;
	Thu, 17 Aug 2023 10:05:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 914F78B76C;
	Thu, 17 Aug 2023 10:05:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id C2PnzQQknLiB; Thu, 17 Aug 2023 10:05:28 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.19.54.59])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 550188B763;
	Thu, 17 Aug 2023 10:05:28 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37H85GZ9271335
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 10:05:16 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37H85EMc271331;
	Thu, 17 Aug 2023 10:05:14 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/82xx: Remove pq2_init_pci
Date: Thu, 17 Aug 2023 10:05:08 +0200
Message-ID: <8b2db7c3c2c346aa8aa49507415c360d441e5bf5.1692259498.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692259507; l=1700; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=AaDr0jv+loyQtjp3CyPPkfHPU8hfHOxpOGbN1tdeesA=; b=GXlWDzPtl0zFrvrowKm15dEmwc3CdcVJmf3bV2ZxJM+Q5M65/rCvU5+6dGT8IBbVjXUKCwZ97 HMzbxPIrW0bALRNjCH6HCDewXqEN42poylis7ImWqTmKFfBAzHxuWvk
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

Commit 859b21a008eb ("powerpc: drop PowerQUICC II Family ADS platform
support") removed last user of pq2_init_pci.

Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/82xx/pq2.c | 46 -------------------------------
 1 file changed, 46 deletions(-)

diff --git a/arch/powerpc/platforms/82xx/pq2.c b/arch/powerpc/platforms/82xx/pq2.c
index 3b5cb39a564c..391d72a2e09d 100644
--- a/arch/powerpc/platforms/82xx/pq2.c
+++ b/arch/powerpc/platforms/82xx/pq2.c
@@ -32,49 +32,3 @@ void __noreturn pq2_restart(char *cmd)
 	panic("Restart failed\n");
 }
 NOKPROBE_SYMBOL(pq2_restart)
-
-#ifdef CONFIG_PCI
-static int pq2_pci_exclude_device(struct pci_controller *hose,
-                                  u_char bus, u8 devfn)
-{
-	if (bus == 0 && PCI_SLOT(devfn) == 0)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-	else
-		return PCIBIOS_SUCCESSFUL;
-}
-
-static void __init pq2_pci_add_bridge(struct device_node *np)
-{
-	struct pci_controller *hose;
-	struct resource r;
-
-	if (of_address_to_resource(np, 0, &r) || r.end - r.start < 0x10b)
-		goto err;
-
-	pci_add_flags(PCI_REASSIGN_ALL_BUS);
-
-	hose = pcibios_alloc_controller(np);
-	if (!hose)
-		return;
-
-	hose->dn = np;
-
-	setup_indirect_pci(hose, r.start + 0x100, r.start + 0x104, 0);
-	pci_process_bridge_OF_ranges(hose, np, 1);
-
-	return;
-
-err:
-	printk(KERN_ERR "No valid PCI reg property in device tree\n");
-}
-
-void __init pq2_init_pci(void)
-{
-	struct device_node *np;
-
-	ppc_md.pci_exclude_device = pq2_pci_exclude_device;
-
-	for_each_compatible_node(np, NULL, "fsl,pq2-pci")
-		pq2_pci_add_bridge(np);
-}
-#endif
-- 
2.41.0

