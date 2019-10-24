Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9C5E3AD5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 20:20:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zbBk6F6RzDqdp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 05:20:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="sSU16cwM"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYjD6x6QzDqWS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:13:04 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2337043611;
 Thu, 24 Oct 2019 17:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1571937177; x=1573751578; bh=Ly1PnEFeD8eqUYeDGQz6RzFYm/+hza4Wmd7
 9/emghxo=; b=sSU16cwMIvKkPcKFHziNyzbW4yXBUTk0MhmVLo4MN+CF6CHc1zs
 NxMJNhKC6BQt1ypZ5RIexaxkLKgsFYwLH1issHPKIToBcCEi2oTkCFzxXlE/+QGP
 9/FdDUn9qFrLjHiWPYKlO459o1qhf3Iu4KYM38A4JDmvTg4qurLb1VFQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id adOlb3e024Bv; Thu, 24 Oct 2019 20:12:57 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 44CD1437F8;
 Thu, 24 Oct 2019 20:12:45 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Oct 2019 20:12:44 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 29/30] PCI: pciehp: movable BARs: Trigger a domain rescan
 on hp events
Date: Thu, 24 Oct 2019 20:12:27 +0300
Message-ID: <20191024171228.877974-30-s.miroshnichenko@yadro.com>
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
 Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>,
 linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With movable BARs, adding a hotplugged device is not local to its bridge
anymore, but it affects the whole domain: BARs, bridge windows and bus
numbers can be substantially rearranged. So instead of trying to fit the
new devices into preallocated reserved gaps, initiate a full domain rescan.

The pci_rescan_bus() covers all the operations of the replaced functions:
 - assigning new bus numbers, as the pci_hp_add_bridge() does it;
 - allocating BARs (pci_assign_unassigned_bridge_resources());
 - cofiguring MPS settings (pcie_bus_configure_settings());
 - binding devices to their drivers (pci_bus_add_devices()).

CC: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 drivers/pci/hotplug/pciehp_pci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/hotplug/pciehp_pci.c b/drivers/pci/hotplug/pciehp_pci.c
index d17f3bf36f70..6d4c1ef38210 100644
--- a/drivers/pci/hotplug/pciehp_pci.c
+++ b/drivers/pci/hotplug/pciehp_pci.c
@@ -58,6 +58,11 @@ int pciehp_configure_device(struct controller *ctrl)
 		goto out;
 	}
 
+	if (pci_can_move_bars) {
+		pci_rescan_bus(parent);
+		goto out;
+	}
+
 	for_each_pci_bridge(dev, parent)
 		pci_hp_add_bridge(dev);
 
-- 
2.23.0

