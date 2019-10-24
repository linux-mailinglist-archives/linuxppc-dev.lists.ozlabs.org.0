Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B687E3A86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 20:01:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zZmT6bKmzDqSK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 05:00:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="h56CXPiF"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYj421LCzDqW5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:12:56 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6F4F443597;
 Thu, 24 Oct 2019 17:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1571937171; x=1573751572; bh=wO+0zb9Gm5RKxo969ldU/bcx3gB/Ii1YhUM
 AAYpjeeI=; b=h56CXPiFTI1h9W6PFvi30wD5LJI/iOTW0+GTXwp0+O/OwICGFL9
 JDGMN67nzMc+BPVUeTv0g5VR/6lI8dXRqkxmtVN1vLuWcse8OOy5/GnpjzwF1cbt
 5JDO7nIzB8GrF18Ukwg5PWGcI09KFVe5Nu1bz8pc4Sm9QxLZUfCVRxdM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nszyBibWCgs4; Thu, 24 Oct 2019 20:12:51 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 9AECA43E04;
 Thu, 24 Oct 2019 20:12:43 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Oct 2019 20:12:43 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 21/30] powerpc/pci: Access PCI config space directly w/o
 pci_dn
Date: Thu, 24 Oct 2019 20:12:19 +0300
Message-ID: <20191024171228.877974-22-s.miroshnichenko@yadro.com>
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
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To fetch an updated DT for the newly hotplugged device, OS must explicitly
request it from the firmware via the pnv_php driver.

If pnv_php wasn't triggered/loaded, it is still possible to discover new
devices if PCIe I/O will not stop in absence of the pci_dn structure.

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 arch/powerpc/kernel/rtas_pci.c       | 97 +++++++++++++++++++---------
 arch/powerpc/platforms/powernv/pci.c | 64 ++++++++++++------
 2 files changed, 109 insertions(+), 52 deletions(-)

diff --git a/arch/powerpc/kernel/rtas_pci.c b/arch/powerpc/kernel/rtas_pci.c
index ae5e43eaca48..912da28b3737 100644
--- a/arch/powerpc/kernel/rtas_pci.c
+++ b/arch/powerpc/kernel/rtas_pci.c
@@ -42,10 +42,26 @@ static inline int config_access_valid(struct pci_dn *dn, int where)
 	return 0;
 }
 
-int rtas_read_config(struct pci_dn *pdn, int where, int size, u32 *val)
+static int rtas_read_raw_config(unsigned long buid, int busno, unsigned int devfn,
+				int where, int size, u32 *val)
 {
 	int returnval = -1;
-	unsigned long buid, addr;
+	unsigned long addr = rtas_config_addr(busno, devfn, where);
+	int ret;
+
+	if (buid) {
+		ret = rtas_call(ibm_read_pci_config, 4, 2, &returnval,
+				addr, BUID_HI(buid), BUID_LO(buid), size);
+	} else {
+		ret = rtas_call(read_pci_config, 2, 2, &returnval, addr, size);
+	}
+	*val = returnval;
+
+	return ret;
+}
+
+int rtas_read_config(struct pci_dn *pdn, int where, int size, u32 *val)
+{
 	int ret;
 
 	if (!pdn)
@@ -58,16 +74,8 @@ int rtas_read_config(struct pci_dn *pdn, int where, int size, u32 *val)
 		return PCIBIOS_SET_FAILED;
 #endif
 
-	addr = rtas_config_addr(pdn->busno, pdn->devfn, where);
-	buid = pdn->phb->buid;
-	if (buid) {
-		ret = rtas_call(ibm_read_pci_config, 4, 2, &returnval,
-				addr, BUID_HI(buid), BUID_LO(buid), size);
-	} else {
-		ret = rtas_call(read_pci_config, 2, 2, &returnval, addr, size);
-	}
-	*val = returnval;
-
+	ret = rtas_read_raw_config(pdn->phb->buid, pdn->busno, pdn->devfn,
+				   where, size, val);
 	if (ret)
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
@@ -85,18 +93,44 @@ static int rtas_pci_read_config(struct pci_bus *bus,
 
 	pdn = pci_get_pdn_by_devfn(bus, devfn);
 
-	/* Validity of pdn is checked in here */
-	ret = rtas_read_config(pdn, where, size, val);
-	if (*val == EEH_IO_ERROR_VALUE(size) &&
-	    eeh_dev_check_failure(pdn_to_eeh_dev(pdn)))
-		return PCIBIOS_DEVICE_NOT_FOUND;
+	if (pdn) {
+		/* Validity of pdn is checked in here */
+		ret = rtas_read_config(pdn, where, size, val);
+
+		if (*val == EEH_IO_ERROR_VALUE(size) &&
+		    eeh_dev_check_failure(pdn_to_eeh_dev(pdn)))
+			ret = PCIBIOS_DEVICE_NOT_FOUND;
+	} else {
+		struct pci_controller *phb = pci_bus_to_host(bus);
+
+		ret = rtas_read_raw_config(phb->buid, bus->number, devfn,
+					   where, size, val);
+	}
 
 	return ret;
 }
 
+static int rtas_write_raw_config(unsigned long buid, int busno, unsigned int devfn,
+				 int where, int size, u32 val)
+{
+	unsigned long addr = rtas_config_addr(busno, devfn, where);
+	int ret;
+
+	if (buid) {
+		ret = rtas_call(ibm_write_pci_config, 5, 1, NULL, addr,
+				BUID_HI(buid), BUID_LO(buid), size, (ulong)val);
+	} else {
+		ret = rtas_call(write_pci_config, 3, 1, NULL, addr, size, (ulong)val);
+	}
+
+	if (ret)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	return PCIBIOS_SUCCESSFUL;
+}
+
 int rtas_write_config(struct pci_dn *pdn, int where, int size, u32 val)
 {
-	unsigned long buid, addr;
 	int ret;
 
 	if (!pdn)
@@ -109,15 +143,8 @@ int rtas_write_config(struct pci_dn *pdn, int where, int size, u32 val)
 		return PCIBIOS_SET_FAILED;
 #endif
 
-	addr = rtas_config_addr(pdn->busno, pdn->devfn, where);
-	buid = pdn->phb->buid;
-	if (buid) {
-		ret = rtas_call(ibm_write_pci_config, 5, 1, NULL, addr,
-			BUID_HI(buid), BUID_LO(buid), size, (ulong) val);
-	} else {
-		ret = rtas_call(write_pci_config, 3, 1, NULL, addr, size, (ulong)val);
-	}
-
+	ret = rtas_write_raw_config(pdn->phb->buid, pdn->busno, pdn->devfn,
+				    where, size, val);
 	if (ret)
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
@@ -128,12 +155,20 @@ static int rtas_pci_write_config(struct pci_bus *bus,
 				 unsigned int devfn,
 				 int where, int size, u32 val)
 {
-	struct pci_dn *pdn;
+	struct pci_dn *pdn = pci_get_pdn_by_devfn(bus, devfn);
+	int ret;
 
-	pdn = pci_get_pdn_by_devfn(bus, devfn);
+	if (pdn) {
+		/* Validity of pdn is checked in here. */
+		ret = rtas_write_config(pdn, where, size, val);
+	} else {
+		struct pci_controller *phb = pci_bus_to_host(bus);
 
-	/* Validity of pdn is checked in here. */
-	return rtas_write_config(pdn, where, size, val);
+		ret = rtas_write_raw_config(phb->buid, bus->number, devfn,
+					    where, size, val);
+	}
+
+	return ret;
 }
 
 static struct pci_ops rtas_pci_ops = {
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 2825d004dece..ffd546cf9204 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -648,30 +648,29 @@ static void pnv_pci_config_check_eeh(struct pci_dn *pdn)
 	}
 }
 
-int pnv_pci_cfg_read(struct pci_dn *pdn,
-		     int where, int size, u32 *val)
+static int pnv_pci_cfg_read_raw(u64 phb_id, int busno, unsigned int devfn,
+				int where, int size, u32 *val)
 {
-	struct pnv_phb *phb = pdn->phb->private_data;
-	u32 bdfn = (pdn->busno << 8) | pdn->devfn;
+	u32 bdfn = (busno << 8) | devfn;
 	s64 rc;
 
 	switch (size) {
 	case 1: {
 		u8 v8;
-		rc = opal_pci_config_read_byte(phb->opal_id, bdfn, where, &v8);
+		rc = opal_pci_config_read_byte(phb_id, bdfn, where, &v8);
 		*val = (rc == OPAL_SUCCESS) ? v8 : 0xff;
 		break;
 	}
 	case 2: {
 		__be16 v16;
-		rc = opal_pci_config_read_half_word(phb->opal_id, bdfn, where,
-						   &v16);
+		rc = opal_pci_config_read_half_word(phb_id, bdfn, where,
+						    &v16);
 		*val = (rc == OPAL_SUCCESS) ? be16_to_cpu(v16) : 0xffff;
 		break;
 	}
 	case 4: {
 		__be32 v32;
-		rc = opal_pci_config_read_word(phb->opal_id, bdfn, where, &v32);
+		rc = opal_pci_config_read_word(phb_id, bdfn, where, &v32);
 		*val = (rc == OPAL_SUCCESS) ? be32_to_cpu(v32) : 0xffffffff;
 		break;
 	}
@@ -680,27 +679,28 @@ int pnv_pci_cfg_read(struct pci_dn *pdn,
 	}
 
 	pr_devel("%s: bus: %x devfn: %x +%x/%x -> %08x\n",
-		 __func__, pdn->busno, pdn->devfn, where, size, *val);
+		 __func__, busno, devfn, where, size, *val);
+
 	return PCIBIOS_SUCCESSFUL;
 }
 
-int pnv_pci_cfg_write(struct pci_dn *pdn,
-		      int where, int size, u32 val)
+static int pnv_pci_cfg_write_raw(u64 phb_id, int busno, unsigned int devfn,
+				 int where, int size, u32 val)
 {
-	struct pnv_phb *phb = pdn->phb->private_data;
-	u32 bdfn = (pdn->busno << 8) | pdn->devfn;
+	u32 bdfn = (busno << 8) | devfn;
 
 	pr_devel("%s: bus: %x devfn: %x +%x/%x -> %08x\n",
-		 __func__, pdn->busno, pdn->devfn, where, size, val);
+		 __func__, busno, devfn, where, size, val);
+
 	switch (size) {
 	case 1:
-		opal_pci_config_write_byte(phb->opal_id, bdfn, where, val);
+		opal_pci_config_write_byte(phb_id, bdfn, where, val);
 		break;
 	case 2:
-		opal_pci_config_write_half_word(phb->opal_id, bdfn, where, val);
+		opal_pci_config_write_half_word(phb_id, bdfn, where, val);
 		break;
 	case 4:
-		opal_pci_config_write_word(phb->opal_id, bdfn, where, val);
+		opal_pci_config_write_word(phb_id, bdfn, where, val);
 		break;
 	default:
 		return PCIBIOS_FUNC_NOT_SUPPORTED;
@@ -709,6 +709,24 @@ int pnv_pci_cfg_write(struct pci_dn *pdn,
 	return PCIBIOS_SUCCESSFUL;
 }
 
+int pnv_pci_cfg_read(struct pci_dn *pdn,
+		     int where, int size, u32 *val)
+{
+	struct pnv_phb *phb = pdn->phb->private_data;
+
+	return pnv_pci_cfg_read_raw(phb->opal_id, pdn->busno, pdn->devfn,
+				    where, size, val);
+}
+
+int pnv_pci_cfg_write(struct pci_dn *pdn,
+		      int where, int size, u32 val)
+{
+	struct pnv_phb *phb = pdn->phb->private_data;
+
+	return pnv_pci_cfg_write_raw(phb->opal_id, pdn->busno, pdn->devfn,
+				     where, size, val);
+}
+
 #if CONFIG_EEH
 static bool pnv_pci_cfg_check(struct pci_dn *pdn)
 {
@@ -744,13 +762,15 @@ static int pnv_pci_read_config(struct pci_bus *bus,
 			       int where, int size, u32 *val)
 {
 	struct pci_dn *pdn;
-	struct pnv_phb *phb;
+	struct pci_controller *hose = pci_bus_to_host(bus);
+	struct pnv_phb *phb = hose->private_data;
 	int ret;
 
 	*val = 0xFFFFFFFF;
 	pdn = pci_get_pdn_by_devfn(bus, devfn);
 	if (!pdn)
-		return PCIBIOS_DEVICE_NOT_FOUND;
+		return pnv_pci_cfg_read_raw(phb->opal_id, bus->number, devfn,
+					    where, size, val);
 
 	if (!pnv_pci_cfg_check(pdn))
 		return PCIBIOS_DEVICE_NOT_FOUND;
@@ -773,12 +793,14 @@ static int pnv_pci_write_config(struct pci_bus *bus,
 				int where, int size, u32 val)
 {
 	struct pci_dn *pdn;
-	struct pnv_phb *phb;
+	struct pci_controller *hose = pci_bus_to_host(bus);
+	struct pnv_phb *phb = hose->private_data;
 	int ret;
 
 	pdn = pci_get_pdn_by_devfn(bus, devfn);
 	if (!pdn)
-		return PCIBIOS_DEVICE_NOT_FOUND;
+		return pnv_pci_cfg_write_raw(phb->opal_id, bus->number, devfn,
+					     where, size, val);
 
 	if (!pnv_pci_cfg_check(pdn))
 		return PCIBIOS_DEVICE_NOT_FOUND;
-- 
2.23.0

