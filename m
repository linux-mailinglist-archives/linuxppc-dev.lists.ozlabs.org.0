Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FB18C0F52
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 14:09:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E/XFM+pG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZrR81m6Jz3cfT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 22:09:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E/XFM+pG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=krishnak@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZrP00y30z3cWS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 22:07:31 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 449C7LT4022459;
	Thu, 9 May 2024 12:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=H4tShS+NnsebvFbzHCu9hb+yI5WH8D5a3muAw7bPVtM=;
 b=E/XFM+pGHD8ygO7O9NjpsaEv8+sjDPD5LrDv3Ia/wtgJ+YRYQ449vvSfF2Fs8vGafyBx
 FV5x6mLButeUC5dMSEAIJ2SWGfdg1ZtDd58ONjnyVEZQrrP88Cr+XdH177hdirTvDoiH
 Ch/z7TfeVrp4we7saqR5KnaztZfi3tTvQzaunQCDflpeqE6TG+QWGDyV3sQkt2fTCiuB
 J55bD1QhoOl6YkNcMSMy0a35eDq+U9wYv6rMtfnmOhNSUlnkrNWZXG7+DQVstMOXhgqG
 JstENkYe7+RCFT2dpRQXT20GosB8jv9yV2HQZP2fh27F8oEEOkDgp2uoKQ26ldA3UG1X oA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y0x77000u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 12:07:20 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 449C7J1S022431;
	Thu, 9 May 2024 12:07:20 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y0x77000p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 12:07:19 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 449BKtlS003990;
	Thu, 9 May 2024 12:07:18 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xysgsjphs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 12:07:18 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 449C7C8a31916658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 May 2024 12:07:15 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDC0220063;
	Thu,  9 May 2024 12:07:12 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B72620040;
	Thu,  9 May 2024 12:07:09 +0000 (GMT)
Received: from li-a50b8fcc-3415-11b2-a85c-f1daa4f09788.in.ibm.com (unknown [9.109.241.85])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 May 2024 12:07:09 +0000 (GMT)
From: Krishna Kumar <krishnak@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com
Subject: [PATCH 2/2] arch/powerpc: hotplug driver bridge support
Date: Thu,  9 May 2024 17:35:54 +0530
Message-ID: <20240509120644.653577-3-krishnak@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509120644.653577-1-krishnak@linux.ibm.com>
References: <20240509120644.653577-1-krishnak@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 69z0-lO4Yvt12ZPiaLIX6zcMzRHQZKT6
X-Proofpoint-ORIG-GUID: kn6K2sGR7l2H9UBQrRWScwibF36WhnTf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_06,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405090080
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
Cc: nathanl@linux.ibm.com, aneesh.kumar@kernel.org, linux-pci@vger.kernel.org, Krishna Kumar <krishnak@linux.ibm.com>, linux-kernel@vger.kernel.org, gbatra@linux.ibm.com, bhelgaas@google.com, tpearson@raptorengineering.com, oohall@gmail.com, brking@linux.vnet.ibm.com, mahesh.salgaonkar@in.ibm.com, linuxppc-dev@lists.ozlabs.org
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



 arch/powerpc/include/asm/ppc-pci.h |  4 +++
 arch/powerpc/kernel/pci-hotplug.c  |  5 ++--
 arch/powerpc/kernel/pci_dn.c       | 42 ++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-pci.h b/arch/powerpc/include/asm/ppc-pci.h
index a8b7e8682f5b..a5d5ee4ff7c0 100644
--- a/arch/powerpc/include/asm/ppc-pci.h
+++ b/arch/powerpc/include/asm/ppc-pci.h
@@ -28,6 +28,10 @@ struct pci_dn;
 void *pci_traverse_device_nodes(struct device_node *start,
 				void *(*fn)(struct device_node *, void *),
 				void *data);
+
+void *pci_traverse_sibling_nodes_and_scan_slot(struct device_node *start,
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
index 38561d6a2079..2e202f9cec21 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -493,4 +493,46 @@ static void pci_dev_pdn_setup(struct pci_dev *pdev)
 	pdn = pci_get_pdn(pdev);
 	pdev->dev.archdata.pci_data = pdn;
 }
+
+void *pci_traverse_sibling_nodes_and_scan_slot(struct device_node *start, struct pci_bus *bus)
+{
+	struct device_node *dn;
+	struct device_node *parent;
+	int slotno;
+
+	const __be32 *classp1;
+	u32 class1 = 0;
+
+	classp1 = of_get_property(start->child, "class-code", NULL);
+	if (classp1)
+		class1 = of_read_number(classp1, 1);
+
+	/* Call of pci_scan_slot for non-bridge/EP case */
+	if (!((class1 >> 8) == PCI_CLASS_BRIDGE_PCI)) {
+		slotno = PCI_SLOT(PCI_DN(start->child)->devfn);
+		pci_scan_slot(bus, PCI_DEVFN(slotno, 0));
+		return NULL;
+	}
+
+	/* Iterate all siblings */
+	parent = start;
+	for_each_child_of_node(parent, dn) {
+		const __be32 *classp;
+		u32 class = 0;
+
+		classp = of_get_property(dn, "class-code", NULL);
+		if (classp)
+			class = of_read_number(classp, 1);
+
+		/* Call of pci_scan_slot on each sibling-nodes/bridge-ports */
+		if ((class >> 8) == PCI_CLASS_BRIDGE_PCI) {
+			slotno = PCI_SLOT(PCI_DN(dn)->devfn);
+			pci_scan_slot(bus, PCI_DEVFN(slotno, 0));
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(pci_traverse_sibling_nodes_and_scan_slot);
+
 DECLARE_PCI_FIXUP_EARLY(PCI_ANY_ID, PCI_ANY_ID, pci_dev_pdn_setup);
-- 
2.44.0

