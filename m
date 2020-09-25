Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C24682783E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 11:24:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByRMT4sXyzDqlP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 19:24:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ByRKb4PdszDqTk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Sep 2020 19:23:08 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.149])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 3D7976560366;
 Fri, 25 Sep 2020 11:23:00 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 25 Sep
 2020 11:23:00 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0045bd37d62-2868-4c9f-bf72-a3fd7a51f65e,
 9FEABA9465DDD0BD54BA607D821A18C8532B37F7) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/pci: Fix PHB removal/rescan on PowerNV
Date: Fri, 25 Sep 2020 11:22:58 +0200
Message-ID: <20200925092258.525079-1-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9a63d98b-f999-466e-86b0-f189a34ac6bd
X-Ovh-Tracer-Id: 13183162010790890403
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvddtgdduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefvdeutddvieekkeeuhfekudejjefggffghfetgfelgfevveefgefhvdegtdelveenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To fix an issue with PHB hotplug on pSeries machine (HPT/XIVE), commit
3a3181e16fbd introduced a PPC specific pcibios_remove_bus() routine to
clear all interrupt mappings when the bus is removed. This routine
frees an array allocated in pcibios_scan_phb().

This broke PHB hotplug on PowerNV because, when a PHB is removed and
re-scanned through sysfs, the PCI layer un-assigns and re-assigns
resources to the PHB but does not destroy and recreate the PCI
controller structure. Since pcibios_remove_bus() does not clear the
'irq_map' array pointer, a second removal of the PHB will try to free
the array a second time and corrupt memory.

Free the 'irq_map' array in pcibios_free_controller() to fix
corruption and clear interrupt mapping after it has been
disposed. This to avoid filling up the array with successive
remove/rescan of a bus.

Cc: "Oliver O'Halloran" <oohall@gmail.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Fixes: 3a3181e16fbd ("powerpc/pci: unmap legacy INTx interrupts when a PHB is removed")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

Michael, I am not sure the Fixes tag is required. Feel free to drop
it. 

---
 arch/powerpc/kernel/pci-common.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index deb831f0ae13..6fc228e0359d 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -143,6 +143,8 @@ void pcibios_free_controller(struct pci_controller *phb)
 	list_del(&phb->list_node);
 	spin_unlock(&hose_spinlock);
 
+	kfree(phb->irq_map);
+
 	if (phb->is_dynamic)
 		kfree(phb);
 }
@@ -450,10 +452,10 @@ static void pci_irq_map_dispose(struct pci_bus *bus)
 
 	pr_debug("PCI: Clearing interrupt mappings for PHB %04x:%02x...\n",
 		 pci_domain_nr(bus), bus->number);
-	for (i = 0; i < phb->irq_count; i++)
+	for (i = 0; i < phb->irq_count; i++) {
 		irq_dispose_mapping(phb->irq_map[i]);
-
-	kfree(phb->irq_map);
+		phb->irq_map[i] = 0;
+	}
 }
 
 void pcibios_remove_bus(struct pci_bus *bus)
-- 
2.25.4

