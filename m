Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FB6E3AC7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 20:18:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zb8P2YLPzDqdf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 05:18:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="hmU0M1g4"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYj917QFzDqW5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:13:01 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 5541043597;
 Thu, 24 Oct 2019 17:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1571937177; x=1573751578; bh=WoAGswMD0jcTKXY/it96M1aTyTP0ATGaJ8r
 2Yos5H2Q=; b=hmU0M1g41x6vEfQPw5xHcLxC9h3WP7gvi3IHdFTDnisYPAjz2DD
 ohjsb/HzrLr/cDv6yQR/L8ZD4J1NP+/ygQCJPR9eajrPWAo6qbx6xQzX6GcHhwxs
 malwQtTiHiySjs4VMjl/hqOFJJP7xEhRAM+3CgSu4XWYiK5oznNeNcz8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2GSjhsYQarjV; Thu, 24 Oct 2019 20:12:57 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 74F5843E18;
 Thu, 24 Oct 2019 20:12:45 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Oct 2019 20:12:45 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 30/30] Revert "powerpc/powernv/pci: Work around races in
 PCI bridge enabling"
Date: Thu, 24 Oct 2019 20:12:28 +0300
Message-ID: <20191024171228.877974-31-s.miroshnichenko@yadro.com>
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

This reverts commit db2173198b9513f7add8009f225afa1f1c79bcc6.

The root cause of this bug is fixed by the following two commits:

  1. "PCI: Fix race condition in pci_enable/disable_device()"
  2. "PCI: Enable bridge's I/O and MEM access for hotplugged devices"

The x86 is also affected by this bug if a PCIe bridge has been hotplugged
without pre-enabling by the BIOS.

CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 37 -----------------------
 1 file changed, 37 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 33d5ed8c258f..f12f3a49d3bb 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3119,49 +3119,12 @@ static void pnv_pci_ioda_create_dbgfs(void)
 #endif /* CONFIG_DEBUG_FS */
 }
 
-static void pnv_pci_enable_bridge(struct pci_bus *bus)
-{
-	struct pci_dev *dev = bus->self;
-	struct pci_bus *child;
-
-	/* Empty bus ? bail */
-	if (list_empty(&bus->devices))
-		return;
-
-	/*
-	 * If there's a bridge associated with that bus enable it. This works
-	 * around races in the generic code if the enabling is done during
-	 * parallel probing. This can be removed once those races have been
-	 * fixed.
-	 */
-	if (dev) {
-		int rc = pci_enable_device(dev);
-		if (rc)
-			pci_err(dev, "Error enabling bridge (%d)\n", rc);
-		pci_set_master(dev);
-	}
-
-	/* Perform the same to child busses */
-	list_for_each_entry(child, &bus->children, node)
-		pnv_pci_enable_bridge(child);
-}
-
-static void pnv_pci_enable_bridges(void)
-{
-	struct pci_controller *hose;
-
-	list_for_each_entry(hose, &hose_list, list_node)
-		pnv_pci_enable_bridge(hose->bus);
-}
-
 static void pnv_pci_ioda_fixup(void)
 {
 	pnv_pci_ioda_setup_PEs();
 	pnv_pci_ioda_setup_iommu_api();
 	pnv_pci_ioda_create_dbgfs();
 
-	pnv_pci_enable_bridges();
-
 #ifdef CONFIG_EEH
 	pnv_eeh_post_init();
 #endif
-- 
2.23.0

