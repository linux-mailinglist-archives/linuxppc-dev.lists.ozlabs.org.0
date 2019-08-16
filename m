Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B34B905B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 18:27:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4697y81fGTzDqNx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 02:27:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="l/qgAOns"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4697jt10jwzDrDN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 02:16:33 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A26A242001;
 Fri, 16 Aug 2019 16:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1565972189; x=1567786590; bh=2mQY7T6R/M7OQA2zxjW7ZjAXYZVYrU3dEDH
 zPnojeBY=; b=l/qgAOnsORU8BllT1sMPVWzZF5hHa80e9kmEZ84sba1f2O+tniw
 ZyC/WWlf6dE6HApBVyoMORV/jn+DdTLxfDXSDm7maUY06tHeDj9+zRYUJ7oEdDFN
 0zZb2UKmUYQeLU0VM7p5c7CmLwjsjEILTUW2h0aIy9+EE16wJH0ShUIU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Irgaf_mSzF_V; Fri, 16 Aug 2019 19:16:29 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0BA1842ECA;
 Fri, 16 Aug 2019 19:16:28 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 16
 Aug 2019 19:16:27 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 4/5] powerpc/powernv/pci: Hook up the writes to
 PCI_SECONDARY_BUS register
Date: Fri, 16 Aug 2019 19:16:13 +0300
Message-ID: <20190816161614.32344-5-s.miroshnichenko@yadro.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190816161614.32344-1-s.miroshnichenko@yadro.com>
References: <20190816161614.32344-1-s.miroshnichenko@yadro.com>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Sergey Miroshnichenko <s.miroshnichenko@yadro.com>,
 Oliver O'Halloran <oohall@gmail.com>, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Writing a new value to the PCI_SECONDARY_BUS register of the bridge means
that its children will become addressable on another address (new B in BDF)
or even un-addressable if the secondary bus is set to zero.

On PowerNV, device PEs are heavily BDF-dependent, so they must be updated
on every such change of its address.

Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 arch/powerpc/platforms/powernv/pci.c | 118 ++++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index a5b04410c8b4..e9b4ed0f97a3 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -717,13 +717,127 @@ int pnv_pci_cfg_read(struct pci_dn *pdn,
 				    where, size, val);
 }
 
+static void invalidate_children_pes(struct pci_dn *pdn)
+{
+	struct pnv_phb *phb = pdn->phb->private_data;
+	struct pci_dn *child;
+	bool found_pe = false;
+	int pe_num;
+	int pe_bus;
+
+	list_for_each_entry(child, &pdn->child_list, list) {
+		struct pnv_ioda_pe *pe = (child->pe_number != IODA_INVALID_PE) ?
+			&phb->ioda.pe_array[child->pe_number] :
+			NULL;
+
+		if (!child->busno)
+			continue;
+
+		if ((child->class_code >> 8) == PCI_CLASS_BRIDGE_PCI)
+			invalidate_children_pes(child);
+
+		if (pe) {
+			u8 rid_bus = (pe->rid >> 8) & 0xff;
+
+			if (rid_bus) {
+				pe_num = child->pe_number;
+				pe_bus = rid_bus;
+				found_pe = true;
+			}
+
+			pe->rid &= 0xff;
+		}
+
+		child->busno = 0;
+	}
+
+	if (found_pe) {
+		u16 rid = pe_bus << 8;
+
+		opal_pci_set_pe(phb->opal_id, pe_num, rid, 7, 0, 0, OPAL_UNMAP_PE);
+	}
+}
+
+static u8 pre_hook_new_sec_bus(struct pci_dn *pdn, u8 new_secondary_bus)
+{
+	u32 old_secondary_bus = 0;
+
+	if ((pdn->class_code >> 8) != PCI_CLASS_BRIDGE_PCI)
+		return 0;
+
+	pnv_pci_cfg_read(pdn, PCI_SECONDARY_BUS, 1, &old_secondary_bus);
+	old_secondary_bus &= 0xff;
+
+	if (old_secondary_bus != new_secondary_bus)
+		invalidate_children_pes(pdn);
+
+	return old_secondary_bus;
+}
+
+static void update_children_pes(struct pci_dn *pdn, u8 new_secondary_bus)
+{
+	struct pnv_phb *phb = pdn->phb->private_data;
+	struct pci_dn *child;
+	bool found_pe = false;
+	int pe_num;
+
+	if (!new_secondary_bus)
+		return;
+
+	list_for_each_entry(child, &pdn->child_list, list) {
+		struct pnv_ioda_pe *pe = (child->pe_number != IODA_INVALID_PE) ?
+			&phb->ioda.pe_array[child->pe_number] :
+			NULL;
+
+		if (child->busno)
+			continue;
+
+		child->busno = new_secondary_bus;
+
+		if (pe) {
+			pe->rid |= (child->busno << 8);
+			pe_num = child->pe_number;
+			found_pe = true;
+		}
+	}
+
+	if (found_pe) {
+		u16 rid = new_secondary_bus << 8;
+
+		opal_pci_set_pe(phb->opal_id, pe_num, rid, 7, 0, 0, OPAL_MAP_PE);
+	}
+}
+
+static void post_hook_new_sec_bus(struct pci_dn *pdn, u8 new_secondary_bus)
+{
+	if ((pdn->class_code >> 8) != PCI_CLASS_BRIDGE_PCI)
+		return;
+
+	update_children_pes(pdn, new_secondary_bus);
+}
+
 int pnv_pci_cfg_write(struct pci_dn *pdn,
 		      int where, int size, u32 val)
 {
 	struct pnv_phb *phb = pdn->phb->private_data;
+	u8 old_secondary_bus = 0, new_secondary_bus = 0;
+	int rc;
+
+	if (where == PCI_SECONDARY_BUS) {
+		new_secondary_bus = val & 0xff;
+		old_secondary_bus = pre_hook_new_sec_bus(pdn, new_secondary_bus);
+	} else if (where == PCI_PRIMARY_BUS && size > 1) {
+		new_secondary_bus = (val >> 8) & 0xff;
+		old_secondary_bus = pre_hook_new_sec_bus(pdn, new_secondary_bus);
+	}
 
-	return pnv_pci_cfg_write_raw(phb->opal_id, pdn->busno, pdn->devfn,
-				     where, size, val);
+	rc = pnv_pci_cfg_write_raw(phb->opal_id, pdn->busno, pdn->devfn,
+				   where, size, val);
+
+	if (new_secondary_bus && old_secondary_bus != new_secondary_bus)
+		post_hook_new_sec_bus(pdn, new_secondary_bus);
+
+	return rc;
 }
 
 #if CONFIG_EEH
-- 
2.21.0

