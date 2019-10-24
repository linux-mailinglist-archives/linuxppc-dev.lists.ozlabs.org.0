Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 813A1E3A4B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 19:44:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zZP70X91zDqXX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 04:44:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="GNC1o+1P"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYhz5TKjzDqMK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:12:51 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 76E9A42F15;
 Thu, 24 Oct 2019 17:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1571937167; x=1573751568; bh=dEtonO9WGVanX91lx4CEaG6vqwfmZCpSHvc
 P/eimQVM=; b=GNC1o+1PVFrShivoThk3yWRC/OSQCwMVc7QEIRUYlbyTP66iOh8
 cc+mRyvYyMGPFrT2kBOz8f4PZSj25H549+b22cmVBCP5NMOtEEAQz+tMMFkGvLmo
 by3QJ1DOee63CqgOo/OUTzm1nc6SwQF2BMBRQXmRmdUYm3CO5aCiHvIs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVn_oPmCl1r7; Thu, 24 Oct 2019 20:12:47 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id A0E9E43130;
 Thu, 24 Oct 2019 20:12:41 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Oct 2019 20:12:41 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 13/30] PCI: hotplug: movable BARs: Compute limits for
 relocated bridge windows
Date: Thu, 24 Oct 2019 20:12:11 +0300
Message-ID: <20191024171228.877974-14-s.miroshnichenko@yadro.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024171228.877974-1-s.miroshnichenko@yadro.com>
References: <20191024171228.877974-1-s.miroshnichenko@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.15.136]
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
index a7546e02ea7c..653ba4d5f191 100644
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
 
 	if (pci_can_move_bars) {
 		__pci_bus_size_bridges(bus, NULL);
+		pci_bus_update_realloc_range(bus);
 		__pci_bus_assign_resources(bus, NULL, NULL);
 
 		goto dump;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index ef41be0ce082..e1edcb3fad31 100644
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
2.23.0

