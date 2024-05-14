Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B93D28C5770
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 15:55:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DcCdWFxf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdyYG2Nxbz2yvx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 23:55:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DcCdWFxf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=krishnak@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdyWD0Jm9z3cHN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 23:53:43 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44EDaZMl005751;
	Tue, 14 May 2024 13:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=C5qWt0e38v1074KlUM8VFQVQaT4VJCT12TFoV5P9puE=;
 b=DcCdWFxfKoYKRAhuY1dRgFqr4rzdPpyzfX+ePrf0CPW8+CFJMDxv1xS+WC+BzWvkuv4m
 AYhQPLbZtFOUOxycatuwlyzqow1O6PpBai1Ifh2p0DeKLj2VareQpdR48R3FrH1VN0v9
 n82q8wYvFudf8DiuZWAarcYAeZJCsJQqPm+5pL/fKiNuZKZ6wnEuMNxWdGGVxj06XJm2
 dJyMKu30eCPEoYXWwFXjcjIswc1RMYtdfxVvho57i21+1bZPIarHrP0zvaoPh7Jc0ehm
 zy03DFPIgUCSRDumu8Uu0EAx79yc3qP/RJy6YFKjVZc9EqeXaFhAncbqmmYQwwZdrNm1 OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y48dng4xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 13:53:35 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44EDrYWm000343;
	Tue, 14 May 2024 13:53:34 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y48dng4xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 13:53:34 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44EBFFY6020349;
	Tue, 14 May 2024 13:53:33 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2kcywubj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 13:53:33 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44EDrRtX22479202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 13:53:29 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B10A20049;
	Tue, 14 May 2024 13:53:27 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6FA220040;
	Tue, 14 May 2024 13:53:23 +0000 (GMT)
Received: from li-a50b8fcc-3415-11b2-a85c-f1daa4f09788.ibm.com.com (unknown [9.171.90.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 May 2024 13:53:23 +0000 (GMT)
From: Krishna Kumar <krishnak@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc: hotplug driver bridge support
Date: Tue, 14 May 2024 19:22:59 +0530
Message-ID: <20240514135303.176134-3-krishnak@linux.ibm.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240514135303.176134-1-krishnak@linux.ibm.com>
References: <20240514135303.176134-1-krishnak@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XOQxAnhEUzaQimG4_ZxyIbCnE0l8o6jY
X-Proofpoint-GUID: nk_H9j8um0dxuUzVwiEliI-0QW7SnjNj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_07,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405140098
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Gaurav Batra <gbatra@linux.ibm.com>, linux-pci@vger.kernel.org, Brian King <brking@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, mahesh@linux.ibm.com, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Krishna Kumar <krishnak@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is an issue with the hotplug operation when it's done on the
bridge/switch slot. The bridge-port and devices behind the bridge, which
become offline by hot-unplug operation, don't get hot-plugged/enabled by
doing hot-plug operation on that slot. Only the first port of the bridge
gets enabled and the remaining port/devices remain unplugged. The hot
plug/unplug operation is done by the hotplug driver
(drivers/pci/hotplug/pnv_php.c).

Root Cause Analysis: This behavior is due to missing code for the DPC
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

Signed-off-by: Krishna Kumar <krishnak@linux.ibm.com>
---
Command for reproducing the issue :

For hot unplug/disable - echo 0 > /sys/bus/pci/slots/C5/power
For hot plug/enable -    echo 1 > /sys/bus/pci/slots/C5/power

where C5 is slot associated with bridge.

Scenario/Tests:
Output of lspci -nn before test is given below. This snippet contains
devices used for testing on Powernv machine.

0004:02:00.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
0004:02:01.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
0004:02:02.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
0004:02:03.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
0004:08:00.0 Serial Attached SCSI controller [0107]:
Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3 [1000:00c9] (rev 01)
0004:09:00.0 Serial Attached SCSI controller [0107]:
Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3 [1000:00c9] (rev 01)

Output of lspci -tv before test is as follows:

# lspci -tv
 +-[0004:00]---00.0-[01-0e]--+-00.0-[02-0e]--+-00.0-[03-07]--
 |                           |               +-01.0-[08]----00.0  Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
 |                           |               +-02.0-[09]----00.0  Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
 |                           |               \-03.0-[0a-0e]--
 |                           \-00.1  PMC-Sierra Inc. Device 4052

C5(bridge) and C6(End Point) slot address are as below:
# cat /sys/bus/pci/slots/C5/address
0004:02:00
# cat /sys/bus/pci/slots/C6/address
0004:09:00

Hot-unplug operation on slot associated with bridge:
# echo 0 > /sys/bus/pci/slots/C5/power
# lspci -tv
 +-[0004:00]---00.0-[01-0e]--+-00.0-[02-0e]--
 |                           \-00.1  PMC-Sierra Inc. Device 4052

From the above lspci -tv output, it can be observed that hot unplug
operation has removed all the PMC-Sierra bridge ports like:
00.0-[03-07], 01.0-[08], 02.0-[09], 03.0-[0a-0e] and the SAS devices
behind the bridge-port. Without the fix, when the hot plug operation is
done on the same slot, it adds only the first bridge port and doesn't
restore all the bridge-ports and devices that it unplugged earlier.
Below snippet shows this.

Hot-plug operation on the bridge slot without the fix:
# echo 1 > /sys/bus/pci/slots/C5/power
# lspci -tv
 +-[0004:00]---00.0-[01-0e]--+-00.0-[02-0e]--+-00.0-[03-07]--
 |                           \-00.1  PMC-Sierra Inc. Device 4052

After the fix, it restores all the devices in the same manner how it
unplugged them earlier during the hot unplug operation. The below snippet
shows the same.
Hot-plug operation on bridge slot with the fix:
# echo 1 > /sys/bus/pci/slots/C5/power
# lspci -tv
 +-[0004:00]---00.0-[01-0e]--+-00.0-[02-0e]--+-00.0-[03-07]--
 |                           |               +-01.0-[08]----00.0  Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
 |                           |               +-02.0-[09]----00.0  Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
 |                           |               \-03.0-[0a-0e]--
 |                           \-00.1  PMC-Sierra Inc. Device 4052

Removal of End point device behind bridge are also intact and behaving
correctly.
Hot-unplug operation on Endpoint device C6:
# echo 0 > /sys/bus/pci/slots/C6/power
# lspci -tv
 +-[0004:00]---00.0-[01-0e]--+-00.0-[02-0e]--+-00.0-[03-07]--
 |                           |               +-01.0-[08]----00.0  Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
 |                           |               +-02.0-[09]--
 |                           |               \-03.0-[0a-0e]--
 |                           \-00.1  PMC-Sierra Inc. Device 4052

Hot-plug operation on Endpoint device C6:
# echo 1 > /sys/bus/pci/slots/C6/power
# lspci -tv
 +-[0004:00]---00.0-[01-0e]--+-00.0-[02-0e]--+-00.0-[03-07]--
 |                           |               +-01.0-[08]----00.0  Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
 |                           |               +-02.0-[09]----00.0  Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
 |                           |               \-03.0-[0a-0e]--
 |                           \-00.1  PMC-Sierra Inc. Device 4052

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

