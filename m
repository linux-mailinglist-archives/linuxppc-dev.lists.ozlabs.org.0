Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E31BE3A61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 19:50:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zZXn4hPnzDqBj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 04:50:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="vYq/kGxz"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYj23tSzzDqW4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:12:54 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id AF3DB43B45;
 Thu, 24 Oct 2019 17:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1571937170; x=1573751571; bh=nwRlUMAhBu6065MIPo0iWQpzSMgerOXg0Y1
 REgkLLP0=; b=vYq/kGxzNUW7colvoS3WIq6dvHWZ6VJ5yVOfTa6Pdx0fNVKhb26
 gJdCgSLxY/+HC0j93JjkaRbtHp6+YrQFoaFe7mzPOHeoOdKuI3GbITOZAJLGkh1e
 tLLqgvje0NORcbYSqxnqMDUOQK3BzP5GgCKfyslhea3j/KU52l1YGyoI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PF6N3UKHVgpS; Thu, 24 Oct 2019 20:12:50 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id AFBDB43D12;
 Thu, 24 Oct 2019 20:12:42 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Oct 2019 20:12:42 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 18/30] PCI: hotplug: Configure MPS for hot-added bridges
 during bus rescan
Date: Thu, 24 Oct 2019 20:12:16 +0300
Message-ID: <20191024171228.877974-19-s.miroshnichenko@yadro.com>
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

Assure that MPS settings are set up for bridges which are discovered during
manually triggered rescan via sysfs. This sequence of bridge init (using
pci_rescan_bus()) will be used for pciehp hot-add events when BARs are
movable.

Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 drivers/pci/probe.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index d0d00cb3e965..94bbdf9b9dc1 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3414,7 +3414,7 @@ static void pci_reassign_root_bus_resources(struct pci_bus *root)
 unsigned int pci_rescan_bus(struct pci_bus *bus)
 {
 	unsigned int max;
-	struct pci_bus *root = bus;
+	struct pci_bus *root = bus, *child;
 
 	while (!pci_is_root_bus(root))
 		root = root->parent;
@@ -3435,6 +3435,9 @@ unsigned int pci_rescan_bus(struct pci_bus *bus)
 		pci_assign_unassigned_bus_resources(bus);
 	}
 
+	list_for_each_entry(child, &root->children, node)
+		pcie_bus_configure_settings(child);
+
 	pci_bus_add_devices(bus);
 
 	return max;
-- 
2.23.0

