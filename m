Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CD677E4E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 17:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQsK34D9yz3cRl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 01:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
X-Greylist: delayed 796 seconds by postgrey-1.37 at boromir; Thu, 17 Aug 2023 01:20:13 AEST
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQsJY3cJMz2yVc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 01:20:11 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RQsJR495xz9vrH;
	Wed, 16 Aug 2023 17:20:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDlecIB-ieoD; Wed, 16 Aug 2023 17:20:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RQsJR3WNWz9vrG;
	Wed, 16 Aug 2023 17:20:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 751BF8B76C;
	Wed, 16 Aug 2023 17:20:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id reRrJu1GUOtL; Wed, 16 Aug 2023 17:20:07 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6076B8B763;
	Wed, 16 Aug 2023 17:20:07 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37GFK2ja218230
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 17:20:02 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37GFK2kY218210;
	Wed, 16 Aug 2023 17:20:02 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/fsl_pci: Make fsl_add_bridge() static
Date: Wed, 16 Aug 2023 17:19:54 +0200
Message-ID: <2115e3597d81e72a865820af54f0e290d0fd2b3a.1692199186.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692199193; l=1331; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Vlhvq+K/Tundf4PJaSZMj+1fYxSRqKHEir+nWnz+4vc=; b=0/4CB+V2pEOanGhKZt0FnkbP5HGYJ35VswxKo1tUOWdJiPit7YK21t89hIK4NPZJTg1w7/c+M wySPz60mNODAbRASdcUSS7e0Gb4p1UUGEC71OamnDsOZDnwrB1GGG44
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

Since commit 905e75c46dba ("powerpc/fsl-pci: Unify pci/pcie initialization code")
fsl_add_bridge() is not used anymore outside of fsl_pci.c

Make it static.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/sysdev/fsl_pci.c | 2 +-
 arch/powerpc/sysdev/fsl_pci.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index 6daf620b63a4..5f7219df35ef 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -519,7 +519,7 @@ void fsl_pcibios_fixup_bus(struct pci_bus *bus)
 	}
 }
 
-int fsl_add_bridge(struct platform_device *pdev, int is_primary)
+static int fsl_add_bridge(struct platform_device *pdev, int is_primary)
 {
 	int len;
 	struct pci_controller *hose;
diff --git a/arch/powerpc/sysdev/fsl_pci.h b/arch/powerpc/sysdev/fsl_pci.h
index 093a875d7d1e..3bc4ab9d8341 100644
--- a/arch/powerpc/sysdev/fsl_pci.h
+++ b/arch/powerpc/sysdev/fsl_pci.h
@@ -112,7 +112,6 @@ struct ccsr_pci {
 
 };
 
-extern int fsl_add_bridge(struct platform_device *pdev, int is_primary);
 extern void fsl_pcibios_fixup_bus(struct pci_bus *bus);
 extern void fsl_pcibios_fixup_phb(struct pci_controller *phb);
 extern int mpc83xx_add_bridge(struct device_node *dev);
-- 
2.41.0

