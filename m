Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5BBE3B30
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 20:42:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zbhg1RNZzDqDZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 05:42:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="hNsfoI1t"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYvn0VktzDqW0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:22:13 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 819B2437F3;
 Thu, 24 Oct 2019 17:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1571937727; x=1573752128; bh=kHULJzUrp5uU1XsnC8WoUR2mO6BxtaquZFh
 WerC3HdM=; b=hNsfoI1tpqvKWmqxXS2WIT10KEFRtCDmOwC8LjrHIyoSVe//WFz
 UJ2TxFjriJpuWOm4ImXVgBPNvVNlm9xprPelUCIUnU1FTNun5kx6mFUsZ/uZjc+H
 qs8zVV6k11CZLqR2FPc0M4I/RZG6g/1QauYjZbYBoX827enQYw2BBWIM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fv6MHD-zjc6U; Thu, 24 Oct 2019 20:22:07 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8F30A42F14;
 Thu, 24 Oct 2019 20:22:05 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Oct 2019 20:22:05 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH RFC 06/11] powerpc/pci: Enable assigning bus numbers instead
 of reading them from DT
Date: Thu, 24 Oct 2019 20:21:52 +0300
Message-ID: <20191024172157.878735-7-s.miroshnichenko@yadro.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024172157.878735-1-s.miroshnichenko@yadro.com>
References: <20191024172157.878735-1-s.miroshnichenko@yadro.com>
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

If the firmware indicates support of reassigning bus numbers via the PHB's
"ibm,supported-movable-bdfs" property in DT, PowerNV will not depend on PCI
topology info from DT anymore.

This makes possible to re-enumerate the fabric, assign the new bus numbers
and switch from the pnv_php module to the standard pciehp driver for PCI
hotplug functionality.

Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 arch/powerpc/kernel/pci_dn.c                 | 5 +++++
 arch/powerpc/platforms/powernv/eeh-powernv.c | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index ad0ecf48e943..b9b7518eb2b4 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -559,6 +559,11 @@ void pci_devs_phb_init_dynamic(struct pci_controller *phb)
 		phb->pci_data = pdn;
 	}
 
+	if (of_get_property(dn, "ibm,supported-movable-bdfs", NULL)) {
+		pci_add_flags(PCI_REASSIGN_ALL_BUS);
+		return;
+	}
+
 	/* Update dn->phb ptrs for new phb and children devices */
 	pci_traverse_device_nodes(dn, add_pdn, phb);
 }
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 6bc24a47e9ef..6c126aa2a6b7 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -42,7 +42,8 @@ void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
 {
 	struct pci_dn *pdn = pci_get_pdn(pdev);
 
-	if (eeh_has_flag(EEH_FORCE_DISABLED))
+	if (eeh_has_flag(EEH_FORCE_DISABLED) ||
+	    !pci_has_flag(PCI_REASSIGN_ALL_BUS))
 		return;
 
 	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
-- 
2.23.0

