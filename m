Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3904D2150
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 20:21:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KClZ40cZzz3bTH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 06:21:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KClXx5wvMz3bTj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 06:20:49 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KClXk24Fgz9sSk;
 Tue,  8 Mar 2022 20:20:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q21GJ4Dap7cE; Tue,  8 Mar 2022 20:20:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KClXh6Dc4z9sSX;
 Tue,  8 Mar 2022 20:20:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BD9188B77E;
 Tue,  8 Mar 2022 20:20:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id tkujhpM5_J9Z; Tue,  8 Mar 2022 20:20:36 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.9])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 427B88B783;
 Tue,  8 Mar 2022 20:20:36 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 228JKS8j3553839
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 8 Mar 2022 20:20:28 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 228JKPeT3553838;
 Tue, 8 Mar 2022 20:20:25 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 1/6] powerpc/64: Move pci_device_from_OF_node() out of
 asm/pci-bridge.h
Date: Tue,  8 Mar 2022 20:20:20 +0100
Message-Id: <3c88286b55413730d7784133993a46ef4a3607ce.1646767214.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1646767223; l=2027; s=20211009;
 h=from:subject:message-id; bh=mAJX7N3vTZPKixeL2cCTPk4O2NDIuRL15HeHkjweej8=;
 b=ndIrWl2AXaYMAxQITZB1EIAwT73MFbQK/J17ktE+hWXpsv9PDxN4cpp4yC9tfMHb9ghEDBZavAvm
 Gkc+Wrx9CHqYdfdK4bR1gDvHgRGdVONgvryo1MU/8Zc5qiA/yVxR
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move pci_device_from_OF_node() in pci64.c because it needs definition
of struct device_node and is not worth inlining.

ppc32.c already has it in pci32.c.

That way pci-bridge.h doesn't need linux/of.h (Brought by asm/prom.h
via asm/pci.h)

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/pci-bridge.h | 14 ++------------
 arch/powerpc/kernel/pci_64.c          |  9 +++++++++
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index 90f488fa4c17..c85f901227c9 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -170,10 +170,10 @@ static inline struct pci_controller *pci_bus_to_host(const struct pci_bus *bus)
 	return bus->sysdata;
 }
 
-#ifndef CONFIG_PPC64
-
 extern int pci_device_from_OF_node(struct device_node *node,
 				   u8 *bus, u8 *devfn);
+#ifndef CONFIG_PPC64
+
 extern void pci_create_OF_bus_map(void);
 
 #else	/* CONFIG_PPC64 */
@@ -235,16 +235,6 @@ struct pci_dn *add_sriov_vf_pdns(struct pci_dev *pdev);
 void remove_sriov_vf_pdns(struct pci_dev *pdev);
 #endif
 
-static inline int pci_device_from_OF_node(struct device_node *np,
-					  u8 *bus, u8 *devfn)
-{
-	if (!PCI_DN(np))
-		return -ENODEV;
-	*bus = PCI_DN(np)->busno;
-	*devfn = PCI_DN(np)->devfn;
-	return 0;
-}
-
 #if defined(CONFIG_EEH)
 static inline struct eeh_dev *pdn_to_eeh_dev(struct pci_dn *pdn)
 {
diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
index 3fb7e572abed..81f84e71ab93 100644
--- a/arch/powerpc/kernel/pci_64.c
+++ b/arch/powerpc/kernel/pci_64.c
@@ -285,3 +285,12 @@ int pcibus_to_node(struct pci_bus *bus)
 }
 EXPORT_SYMBOL(pcibus_to_node);
 #endif
+
+int pci_device_from_OF_node(struct device_node *np, u8 *bus, u8 *devfn)
+{
+	if (!PCI_DN(np))
+		return -ENODEV;
+	*bus = PCI_DN(np)->busno;
+	*devfn = PCI_DN(np)->devfn;
+	return 0;
+}
-- 
2.34.1

