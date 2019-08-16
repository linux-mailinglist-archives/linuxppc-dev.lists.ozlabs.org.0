Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9205D9065E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 19:02:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4698kv21vCzDqpJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 03:02:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="c+BFc0L0"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4698Tv5XdVzDq6J
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 02:51:15 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id B1A2442001;
 Fri, 16 Aug 2019 16:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1565974271; x=1567788672; bh=mKBbR82Srtto2VpJamxciNYssUs4Y4yDFRb
 U7JWpUgg=; b=c+BFc0L0m+Qv/QlRbpX9tDaskY5kIMdSNcNHmYIiWfbB34veWtD
 8ehXeCB0ECgNnK0j4YlAo6Na5Z6CGIyNgKGdUckvEgCqVMNrAlmV+1AikNcSxuUj
 cp2+p1GRSFKZdBl3Xay7V/WwsLy4/BLLi1Bj801LbW8Jhq6S9GEbw8IU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0mtgKAkvT17A; Fri, 16 Aug 2019 19:51:11 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 861AC411F8;
 Fri, 16 Aug 2019 19:51:10 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 16
 Aug 2019 19:51:09 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v5 04/23] PCI: Define PCI-specific version of the
 release_child_resources()
Date: Fri, 16 Aug 2019 19:50:42 +0300
Message-ID: <20190816165101.911-5-s.miroshnichenko@yadro.com>
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

If release the bridge resources with standard release_child_resources(), it
drops the .start field of children's BARs to zero, but with the STARTALIGN
flag remaining set, which makes the resource invalid for reassignment.

Some resources must preserve their offset and size: those marked with the
PCI_FIXED and the immovable ones - which are bound by drivers without
support of the movable BARs feature.

Add the pci_release_child_resources() to replace release_child_resources()
in handling the described PCI-specific cases.

Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 drivers/pci/setup-bus.c | 54 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 79b1fa6519be..6cb8b293c576 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1482,6 +1482,55 @@ static void __pci_bridge_assign_resources(const struct pci_dev *bridge,
 	(IORESOURCE_IO | IORESOURCE_MEM | IORESOURCE_PREFETCH |\
 	 IORESOURCE_MEM_64)
 
+/*
+ * Similar to generic release_child_resources(), but aware of immovable BARs and
+ * PCI_FIXED and STARTALIGN flags
+ */
+static void pci_release_child_resources(struct pci_bus *bus, struct resource *r)
+{
+	struct pci_dev *dev;
+
+	if (!bus || !r)
+		return;
+
+	if (r->flags & IORESOURCE_PCI_FIXED)
+		return;
+
+	r->child = NULL;
+
+	list_for_each_entry(dev, &bus->devices, bus_list) {
+		int i;
+
+		for (i = 0; i < PCI_NUM_RESOURCES; i++) {
+			struct resource *tmp = &dev->resource[i];
+			resource_size_t size = resource_size(tmp);
+
+			if (!tmp->flags || tmp->parent != r)
+				continue;
+
+			tmp->parent = NULL;
+			tmp->sibling = NULL;
+
+			pci_release_child_resources(dev->subordinate, tmp);
+
+			if ((tmp->flags & IORESOURCE_PCI_FIXED) ||
+			    !pci_dev_movable_bars_supported(dev)) {
+				pci_dbg(dev, "release immovable %pR (%s), keep its flags, base and size\n",
+					tmp, tmp->name);
+				continue;
+			}
+
+			pci_dbg(dev, "release %pR (%s)\n", tmp, tmp->name);
+
+			tmp->start = 0;
+			tmp->end = size - 1;
+
+			tmp->flags &= ~IORESOURCE_STARTALIGN;
+			tmp->flags |= IORESOURCE_SIZEALIGN;
+		}
+	}
+}
+
 static void pci_bridge_release_resources(struct pci_bus *bus,
 					 unsigned long type)
 {
@@ -1522,7 +1571,10 @@ static void pci_bridge_release_resources(struct pci_bus *bus,
 		return;
 
 	/* If there are children, release them all */
-	release_child_resources(r);
+	if (pci_movable_bars_enabled())
+		pci_release_child_resources(bus, r);
+	else
+		release_child_resources(r);
 	if (!release_resource(r)) {
 		type = old_flags = r->flags & PCI_RES_TYPE_MASK;
 		pci_info(dev, "resource %d %pR released\n",
-- 
2.21.0

