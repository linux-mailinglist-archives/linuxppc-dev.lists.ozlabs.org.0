Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40674906A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 19:20:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4699775b8mzDrqV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 03:20:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="nMJ6VWve"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4698V0181yzDq7F
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 02:51:19 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2796D42EFA;
 Fri, 16 Aug 2019 16:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1565974276; x=1567788677; bh=XwCH87qcjfQweodBeJ8twB4J3I00QimuAOp
 SLYokm0g=; b=nMJ6VWve08AFQxdKtw+XqhPOJQJFHvzo/D+IG8kGdUwMy+xBBrW
 nLCjPOOQTM9RG1/nLs9XKUKu1Lge+qLT+71jOuqBtzXaaFlBIesUBkWF7f/J23dL
 5TXrRKxR7IzQoGU2FjLGp1mtIIGAEa35hP1peFmB39dPTNR2POBF66B8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pLEjScs2-ULA; Fri, 16 Aug 2019 19:51:16 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 58E7242ED7;
 Fri, 16 Aug 2019 19:51:11 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 16
 Aug 2019 19:51:10 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v5 12/23] PCI: hotplug: movable BARs: Compute limits for
 relocated bridge windows
Date: Fri, 16 Aug 2019 19:50:50 +0300
Message-ID: <20190816165101.911-13-s.miroshnichenko@yadro.com>
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

With enabled movable BARs, bridge windows are recalculated during each pci
rescan. Some of the BARs below the bridge may be fixed/immovable: these
areas are represented by the .immovable_range field in struct pci_bus.

If a bridge window size is equal to its immovable range, it can only be
assigned to the start of this range. But if a bridge window size is larger,
and this difference in size is denoted as "delta", the window can start
from (immovable_range.start - delta) to (immovable_range.start), and it can
end from (immovable_range.end) to (immovable_range.end + delta). This range
(the new .realloc_range field in struct pci_bus) must then be compared with
immovable ranges of neighbouring bridges to guarantee no intersections.

This patch only calculates valid ranges for reallocated bridges during pci
rescan, and the next one will make use of these values during allocation.

Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 drivers/pci/setup-bus.c | 67 +++++++++++++++++++++++++++++++++++++++++
 include/linux/pci.h     |  6 ++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 420510a1a257..586aaa9578b2 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1819,6 +1819,72 @@ static enum enable_type pci_realloc_detect(struct pci_bus *bus,
 }
 #endif
 
+/*
+ * Calculate the address margins where the bridge windows may be allocated to fit all
+ * the fixed and immovable BARs beneath.
+ */
+static void pci_bus_update_realloc_range(struct pci_bus *bus)
+{
+	struct pci_dev *dev;
+	struct pci_bus *parent = bus->parent;
+	int idx;
+
+	list_for_each_entry(dev, &bus->devices, bus_list)
+		if (dev->subordinate)
+			pci_bus_update_realloc_range(dev->subordinate);
+
+	if (!parent || !bus->self)
+		return;
+
+	for (idx = 0; idx < PCI_BRIDGE_RESOURCE_NUM; ++idx) {
+		struct resource *immovable_range = &bus->immovable_range[idx];
+		resource_size_t window_size = resource_size(bus->resource[idx]);
+		resource_size_t realloc_start, realloc_end;
+
+		bus->realloc_range[idx].start = 0;
+		bus->realloc_range[idx].end = 0;
+
+		/* Check if there any immovable BARs under the bridge */
+		if (immovable_range->start >= immovable_range->end)
+			continue;
+
+		/* The lowest possible address where the bridge window can start */
+		realloc_start = immovable_range->end - window_size + 1;
+		/* The highest possible address where the bridge window can end */
+		realloc_end = immovable_range->start + window_size - 1;
+
+		if (realloc_start > immovable_range->start)
+			realloc_start = immovable_range->start;
+
+		if (realloc_end < immovable_range->end)
+			realloc_end = immovable_range->end;
+
+		/*
+		 * Check that realloc range doesn't intersect with hard fixed ranges
+		 * of neighboring bridges
+		 */
+		list_for_each_entry(dev, &parent->devices, bus_list) {
+			struct pci_bus *neighbor = dev->subordinate;
+			struct resource *n_imm_range;
+
+			if (!neighbor || neighbor == bus)
+				continue;
+
+			n_imm_range = &neighbor->immovable_range[idx];
+
+			if (n_imm_range->start >= n_imm_range->end)
+				continue;
+
+			if (n_imm_range->end < immovable_range->start &&
+			    n_imm_range->end > realloc_start)
+				realloc_start = n_imm_range->end;
+		}
+
+		bus->realloc_range[idx].start = realloc_start;
+		bus->realloc_range[idx].end = realloc_end;
+	}
+}
+
 /*
  * First try will not touch PCI bridge res.
  * Second and later try will clear small leaf bridge res.
@@ -1838,6 +1904,7 @@ void pci_assign_unassigned_root_bus_resources(struct pci_bus *bus)
 
 	if (pci_movable_bars_enabled()) {
 		__pci_bus_size_bridges(bus, NULL);
+		pci_bus_update_realloc_range(bus);
 		__pci_bus_assign_resources(bus, NULL, NULL);
 
 		goto dump;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index efafbf816fe6..bf6638cf2525 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -587,6 +587,12 @@ struct pci_bus {
 	 */
 	struct resource immovable_range[PCI_BRIDGE_RESOURCE_NUM];
 
+	/*
+	 * Acceptable address range, where the bridge window may reside, considering its
+	 * size, so it will cover all the fixed and immovable BARs below.
+	 */
+	struct resource realloc_range[PCI_BRIDGE_RESOURCE_NUM];
+
 	struct pci_ops	*ops;		/* Configuration access functions */
 	struct msi_controller *msi;	/* MSI controller */
 	void		*sysdata;	/* Hook for sys-specific extension */
-- 
2.21.0

