Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2871DADC6E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2019 17:49:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Rszc6hdMzDqM6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 01:49:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Rsvl0qc2zDqND
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 01:46:10 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x89FjlMS064005
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Sep 2019 11:46:07 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uwsnqg0jv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2019 11:46:07 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Mon, 9 Sep 2019 16:46:05 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Sep 2019 16:46:03 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x89FjbWD40960392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Sep 2019 15:45:37 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 344B54203F;
 Mon,  9 Sep 2019 15:46:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBA0842045;
 Mon,  9 Sep 2019 15:46:01 +0000 (GMT)
Received: from pic2.home (unknown [9.145.178.189])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  9 Sep 2019 15:46:01 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, andrew.donnellan@au1.ibm.com,
 clombard@linux.ibm.com
Subject: [PATCH 03/11] powerpc/powernv/ioda: set up PE on opencapi device when
 enabling
Date: Mon,  9 Sep 2019 17:45:52 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190909154600.19917-1-fbarrat@linux.ibm.com>
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19090915-0020-0000-0000-00000369DB6B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090915-0021-0000-0000-000021BF5D46
Message-Id: <20190909154600.19917-4-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-09_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909090158
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
Cc: groug@kaod.org, alastair@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The PE for an opencapi device was set as part of a late PHB fixup
operation, when creating the PHB. To use the PCI hotplug framework,
this is not going to work, as the PHB stays the same, it's only the
devices underneath which are updated. For regular PCI devices, it is
done as part of the reconfiguration of the bridge, but for opencapi
PHBs, we don't have an intermediate bridge. So let's define the PE
when the device is enabled. PEs are meaningless for opencapi, the NPU
doesn't define them and opal is not doing anything with them.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 31 +++++++++++++++++------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 3dbbf5365c1c..06ce7ddaa0cf 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1260,8 +1260,6 @@ static void pnv_pci_ioda_setup_PEs(void)
 {
 	struct pci_controller *hose;
 	struct pnv_phb *phb;
-	struct pci_bus *bus;
-	struct pci_dev *pdev;
 	struct pnv_ioda_pe *pe;
 
 	list_for_each_entry(hose, &hose_list, list_node) {
@@ -1273,11 +1271,6 @@ static void pnv_pci_ioda_setup_PEs(void)
 			if (phb->model == PNV_PHB_MODEL_NPU2)
 				WARN_ON_ONCE(pnv_npu2_init(hose));
 		}
-		if (phb->type == PNV_PHB_NPU_OCAPI) {
-			bus = hose->bus;
-			list_for_each_entry(pdev, &bus->devices, bus_list)
-				pnv_ioda_setup_dev_PE(pdev);
-		}
 	}
 	list_for_each_entry(hose, &hose_list, list_node) {
 		phb = hose->private_data;
@@ -3385,6 +3378,28 @@ static bool pnv_pci_enable_device_hook(struct pci_dev *dev)
 	return true;
 }
 
+static bool pnv_ocapi_enable_device_hook(struct pci_dev *dev)
+{
+	struct pci_controller *hose = pci_bus_to_host(dev->bus);
+	struct pnv_phb *phb = hose->private_data;
+	struct pci_dn *pdn;
+	struct pnv_ioda_pe *pe;
+
+	if (!phb->initialized)
+		return true;
+
+	pdn = pci_get_pdn(dev);
+	if (!pdn)
+		return false;
+
+	if (pdn->pe_number == IODA_INVALID_PE) {
+		pe = pnv_ioda_setup_dev_PE(dev);
+		if (!pe)
+			return false;
+	}
+	return true;
+}
+
 static long pnv_pci_ioda1_unset_window(struct iommu_table_group *table_group,
 				       int num)
 {
@@ -3625,7 +3640,7 @@ static const struct pci_controller_ops pnv_npu_ioda_controller_ops = {
 };
 
 static const struct pci_controller_ops pnv_npu_ocapi_ioda_controller_ops = {
-	.enable_device_hook	= pnv_pci_enable_device_hook,
+	.enable_device_hook	= pnv_ocapi_enable_device_hook,
 	.window_alignment	= pnv_pci_window_alignment,
 	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
 	.shutdown		= pnv_pci_ioda_shutdown,
-- 
2.21.0

