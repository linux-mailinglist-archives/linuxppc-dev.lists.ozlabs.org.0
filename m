Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE23906E8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 19:31:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4699NN6lLpzDr2j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 03:31:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="sUgG7Hdn"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4698V24vWdzDqnf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 02:51:22 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 44ED142EE0;
 Fri, 16 Aug 2019 16:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1565974278; x=1567788679; bh=mzzHmMxypSmyMD7JSc2YFxKV7OgmlBqwPAt
 HK9+W88E=; b=sUgG7HdnFlRNZMyAKd5GqmHabzzDIZW/fJxy9iDvjVyFSPNGOvI
 ke/5A4RSabLs60SZzDRp+NUGOr1w6y8jV24jx+p6CHteKLOGp4kylDexaTZHJ+nR
 wiuAyd+jKWMVgB9/PYQGySfvkt1i5z9f15W5ysnVrBDRMK/jL8tbRNJo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 70wtIAOWB8CI; Fri, 16 Aug 2019 19:51:18 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 18B7042EDF;
 Fri, 16 Aug 2019 19:51:12 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 16
 Aug 2019 19:51:11 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v5 15/23] PCI: hotplug: movable BARs: Assign fixed and
 immovable BARs before others
Date: Fri, 16 Aug 2019 19:50:53 +0300
Message-ID: <20190816165101.911-16-s.miroshnichenko@yadro.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190816165101.911-1-s.miroshnichenko@yadro.com>
References: <20190816165101.911-1-s.miroshnichenko@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.15.60]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reassign resources during rescan in two steps: first the fixed/immovable
BARs and bridge windows that have fixed areas, so the movable ones will not
steal these reserved areas; then the rest - so the movable BARs will divide
the rest of the space.

With this change, pci_assign_resource() is now able to assign all types of
BARs, so the pdev_assign_fixed_resources() became unused and thus removed.

Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 drivers/pci/pci.h       |  2 ++
 drivers/pci/setup-bus.c | 79 ++++++++++++++++++++++++-----------------
 drivers/pci/setup-res.c |  8 +++--
 3 files changed, 55 insertions(+), 34 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 12add575faf1..e1fcc46f9c40 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -260,6 +260,8 @@ void pci_disable_bridge_window(struct pci_dev *dev);
 
 bool pci_dev_movable_bars_supported(struct pci_dev *dev);
 
+int assign_fixed_resource_on_bus(struct pci_bus *b, struct resource *r);
+
 /* PCIe link information */
 #define PCIE_SPEED2STR(speed) \
 	((speed) == PCIE_SPEED_16_0GT ? "16 GT/s" : \
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 6f12411357f3..c7b7e30c6284 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -38,6 +38,15 @@ struct pci_dev_resource {
 	unsigned long flags;
 };
 
+enum assign_step {
+	assign_fixed_resources,
+	assign_float_resources,
+};
+
+static void _assign_requested_resources_sorted(struct list_head *head,
+					       struct list_head *fail_head,
+					       enum assign_step step);
+
 static void free_list(struct list_head *head)
 {
 	struct pci_dev_resource *dev_res, *tmp;
@@ -278,19 +287,48 @@ static void reassign_resources_sorted(struct list_head *realloc_head,
  */
 static void assign_requested_resources_sorted(struct list_head *head,
 				 struct list_head *fail_head)
+{
+	_assign_requested_resources_sorted(head, fail_head, assign_fixed_resources);
+	_assign_requested_resources_sorted(head, fail_head, assign_float_resources);
+}
+
+static void _assign_requested_resources_sorted(struct list_head *head,
+					       struct list_head *fail_head,
+					       enum assign_step step)
 {
 	struct resource *res;
 	struct pci_dev_resource *dev_res;
 	int idx;
 
 	list_for_each_entry(dev_res, head, list) {
+		bool is_fixed = false;
+
 		if (!pci_dev_bars_enabled(dev_res->dev))
 			continue;
 
 		res = dev_res->res;
+		if (!resource_size(res))
+			continue;
+
 		idx = res - &dev_res->dev->resource[0];
-		if (resource_size(res) &&
-		    pci_assign_resource(dev_res->dev, idx)) {
+
+		if (idx < PCI_BRIDGE_RESOURCES) {
+			is_fixed = (res->flags & IORESOURCE_PCI_FIXED) ||
+				!pci_dev_movable_bars_supported(dev_res->dev);
+		} else {
+			int b_res_idx = pci_get_bridge_resource_idx(res);
+			struct resource *fixed_res =
+				&dev_res->dev->subordinate->immovable_range[b_res_idx];
+
+			is_fixed = (fixed_res->start < fixed_res->end);
+		}
+
+		if (assign_fixed_resources == step && !is_fixed)
+			continue;
+		else if (assign_float_resources == step && is_fixed)
+			continue;
+
+		if (pci_assign_resource(dev_res->dev, idx)) {
 			if (fail_head) {
 				/*
 				 * If the failed resource is a ROM BAR and
@@ -1336,7 +1374,7 @@ void pci_bus_size_bridges(struct pci_bus *bus)
 }
 EXPORT_SYMBOL(pci_bus_size_bridges);
 
-static void assign_fixed_resource_on_bus(struct pci_bus *b, struct resource *r)
+int assign_fixed_resource_on_bus(struct pci_bus *b, struct resource *r)
 {
 	int i;
 	struct resource *parent_r;
@@ -1353,35 +1391,14 @@ static void assign_fixed_resource_on_bus(struct pci_bus *b, struct resource *r)
 		    !(r->flags & IORESOURCE_PREFETCH))
 			continue;
 
-		if (resource_contains(parent_r, r))
-			request_resource(parent_r, r);
-	}
-}
-
-/*
- * Try to assign any resources marked as IORESOURCE_PCI_FIXED, as they are
- * skipped by pbus_assign_resources_sorted().
- */
-static void pdev_assign_fixed_resources(struct pci_dev *dev)
-{
-	int i;
-
-	for (i = 0; i <  PCI_NUM_RESOURCES; i++) {
-		struct pci_bus *b;
-		struct resource *r = &dev->resource[i];
-
-		if (r->parent || !(r->flags & IORESOURCE_PCI_FIXED) ||
-		    !(r->flags & (IORESOURCE_IO | IORESOURCE_MEM)))
-			continue;
-
-		b = dev->bus;
-		while (b && !r->parent) {
-			assign_fixed_resource_on_bus(b, r);
-			b = b->parent;
-			if (!r->parent && pci_movable_bars_enabled())
-				break;
+		if (resource_contains(parent_r, r)) {
+			if (!request_resource(parent_r, r))
+				return 0;
 		}
 	}
+
+	dev_err(&b->dev, "failed to assign immovable %pR\n", r);
+	return -EBUSY;
 }
 
 void __pci_bus_assign_resources(const struct pci_bus *bus,
@@ -1397,8 +1414,6 @@ void __pci_bus_assign_resources(const struct pci_bus *bus,
 		if (!pci_dev_bars_enabled(dev))
 			continue;
 
-		pdev_assign_fixed_resources(dev);
-
 		b = dev->subordinate;
 		if (!b)
 			continue;
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index 7357bcc12a53..02620cfac0c7 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -348,8 +348,12 @@ int pci_assign_resource(struct pci_dev *dev, int resno)
 	resource_size_t align, size;
 	int ret;
 
-	if (res->flags & IORESOURCE_PCI_FIXED)
-		return 0;
+	if ((res->flags & IORESOURCE_PCI_FIXED) ||
+	    (resno < PCI_BRIDGE_RESOURCES &&
+	     !pci_dev_movable_bars_supported(dev) &&
+	     res->start)) {
+		return assign_fixed_resource_on_bus(dev->bus, res);
+	}
 
 	res->flags |= IORESOURCE_UNSET;
 	align = pci_resource_alignment(dev, res);
-- 
2.21.0

