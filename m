Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5DA91D95A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 09:47:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T3PuyQYd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCJ6m115Fz3d9G
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 17:47:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T3PuyQYd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=krishnak@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCJ4l30T6z3cM5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 17:45:59 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4616vKvY025560;
	Mon, 1 Jul 2024 07:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=/qWCb0RrNPuPW
	4UHecWAZj4MlZnWK893nVlQRpserAE=; b=T3PuyQYd7JyaAdKWu5Awb2qzGeULg
	zV/NIwZBi9JJeMuk/Zb8recslKhawKLuqTXE0LeWcT91B0S99ctMTqBefJ/ZNQUV
	UpRsQnN5mjR1D5/AYiu/+b1iPoU4AUuw4uqAO/1HJG/+XChq+qqNdFpAqUomVq9W
	hHrEyskf8zmKUJg/HqQIQXewhu0A6k68pmsjwHBLAKJ/M5Gkfpl5BeShyiSBggP2
	6YVVgldKm6V1FQj49r1Qz/KUasI33JPOLNG7qtVAn3uYg6mYmV+NqtOjQzsXzKjo
	VJ8NeID0BBeq0nEvI7tvqLX51jSS39mLsCroPuvmCPD4KP6aYO5RVtSOA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403pb98auk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 07:45:50 +0000 (GMT)
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4617jnfU005813;
	Mon, 1 Jul 2024 07:45:49 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403pb98auf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 07:45:49 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46151S8h030022;
	Mon, 1 Jul 2024 07:45:49 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 402x3mnxud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 07:45:48 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4617jhCF55771470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2024 07:45:45 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 329982004B;
	Mon,  1 Jul 2024 07:45:43 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 073DD20040;
	Mon,  1 Jul 2024 07:45:40 +0000 (GMT)
Received: from li-a50b8fcc-3415-11b2-a85c-f1daa4f09788.in.ibm.com (unknown [9.109.241.85])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  1 Jul 2024 07:45:39 +0000 (GMT)
From: Krishna Kumar <krishnak@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com
Subject: [PATCH v4 2/2] powerpc: hotplug driver bridge support
Date: Mon,  1 Jul 2024 13:15:07 +0530
Message-ID: <20240701074513.94873-3-krishnak@linux.ibm.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240701074513.94873-1-krishnak@linux.ibm.com>
References: <20240701074513.94873-1-krishnak@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -uKa2DmjEIygamUOQFeGQEff9bnWi5xw
X-Proofpoint-ORIG-GUID: Eh40lHwqZYgl-C9qUFuzFyouUf-dJovG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_05,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010051
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
Cc: nathanl@linux.ibm.com, aneesh.kumar@kernel.org, linux-pci@vger.kernel.org, Shawn Anastasio <sanastasio@raptorengineering.com>, Krishna Kumar <krishnak@linux.ibm.com>, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, gbatra@linux.ibm.com, bhelgaas@google.com, tpearson@raptorengineering.com, oohall@gmail.com, brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is an issue with the hotplug operation when it's done on the
bridge/switch slot. The bridge-port and devices behind the bridge, which
become offline by hot-unplug operation, don't get hot-plugged/enabled by
doing hot-plug operation on that slot. Only the first port of the bridge
gets enabled and the remaining port/devices remain unplugged. The hot
plug/unplug operation is done by the hotplug driver
(drivers/pci/hotplug/pnv_php.c).

Root Cause Analysis: This behavior is due to missing code for the
switch/bridge. The existing driver depends on pci_hp_add_devices()
function for device enablement. This function calls pci_scan_slot() on
only one device-node/port of the bridge, not on all the siblings'
device-node/port.

The missing code needs to be added which will find all the sibling
device-nodes/bridge-ports and will run explicit pci_scan_slot() on
those.  A new function has been added for this purpose which gets
invoked from pci_hp_add_devices(). This new function
pci_traverse_sibling_nodes_and_scan_slot() gets all the sibling
bridge-ports by traversal and explicitly invokes pci_scan_slot on them.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Gaurav Batra <gbatra@linux.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Brian King <brking@linux.vnet.ibm.com>

Tested-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Signed-off-by: Krishna Kumar <krishnak@linux.ibm.com>
---
 arch/powerpc/include/asm/ppc-pci.h |  4 ++++
 arch/powerpc/kernel/pci-hotplug.c  |  5 ++---
 arch/powerpc/kernel/pci_dn.c       | 32 ++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-pci.h b/arch/powerpc/include/asm/ppc-pci.h
index a8b7e8682f5b..83db8d0798ac 100644
--- a/arch/powerpc/include/asm/ppc-pci.h
+++ b/arch/powerpc/include/asm/ppc-pci.h
@@ -28,6 +28,10 @@ struct pci_dn;
 void *pci_traverse_device_nodes(struct device_node *start,
 				void *(*fn)(struct device_node *, void *),
 				void *data);
+
+void pci_traverse_sibling_nodes_and_scan_slot(struct device_node *start,
+					       struct pci_bus *bus);
+
 extern void pci_devs_phb_init_dynamic(struct pci_controller *phb);
 
 #if defined(CONFIG_IOMMU_API) && (defined(CONFIG_PPC_PSERIES) || \
diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
index 0fe251c6ac2c..639a3d592fe2 100644
--- a/arch/powerpc/kernel/pci-hotplug.c
+++ b/arch/powerpc/kernel/pci-hotplug.c
@@ -106,7 +106,7 @@ EXPORT_SYMBOL_GPL(pci_hp_remove_devices);
  */
 void pci_hp_add_devices(struct pci_bus *bus)
 {
-	int slotno, mode, max;
+	int mode, max;
 	struct pci_dev *dev;
 	struct pci_controller *phb;
 	struct device_node *dn = pci_bus_to_OF_node(bus);
@@ -129,8 +129,7 @@ void pci_hp_add_devices(struct pci_bus *bus)
 		 * order for fully rescan all the way down to pick them up.
 		 * They can have been removed during partial hotplug.
 		 */
-		slotno = PCI_SLOT(PCI_DN(dn->child)->devfn);
-		pci_scan_slot(bus, PCI_DEVFN(slotno, 0));
+		pci_traverse_sibling_nodes_and_scan_slot(dn, bus);
 		max = bus->busn_res.start;
 		/*
 		 * Scan bridges that are already configured. We don't touch
diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index 38561d6a2079..bea612759832 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -493,4 +493,36 @@ static void pci_dev_pdn_setup(struct pci_dev *pdev)
 	pdn = pci_get_pdn(pdev);
 	pdev->dev.archdata.pci_data = pdn;
 }
+
+void pci_traverse_sibling_nodes_and_scan_slot(struct device_node *start, struct pci_bus *bus)
+{
+	struct device_node *dn;
+	int slotno;
+
+	u32 class = 0;
+
+	if (!of_property_read_u32(start->child, "class-code", &class)) {
+		/* Call of pci_scan_slot for non-bridge/EP case */
+		if (!((class >> 8) == PCI_CLASS_BRIDGE_PCI)) {
+			slotno = PCI_SLOT(PCI_DN(start->child)->devfn);
+			pci_scan_slot(bus, PCI_DEVFN(slotno, 0));
+			return;
+		}
+	}
+
+	/* Iterate all siblings */
+	for_each_child_of_node(start, dn) {
+		class = 0;
+
+		if (!of_property_read_u32(start->child, "class-code", &class)) {
+			/* Call of pci_scan_slot on each sibling-nodes/bridge-ports */
+			if ((class >> 8) == PCI_CLASS_BRIDGE_PCI) {
+				slotno = PCI_SLOT(PCI_DN(dn)->devfn);
+				pci_scan_slot(bus, PCI_DEVFN(slotno, 0));
+			}
+		}
+	}
+
+}
+
 DECLARE_PCI_FIXUP_EARLY(PCI_ANY_ID, PCI_ANY_ID, pci_dev_pdn_setup);
-- 
2.45.0

