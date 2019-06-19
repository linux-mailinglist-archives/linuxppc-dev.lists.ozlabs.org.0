Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 365304BA16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 15:37:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TQxQ4xcMzDqQK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 23:37:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TQl911X6zDqq3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 23:28:52 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JDHFTV036036
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 09:28:48 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t7nhasrr2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 09:28:48 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Wed, 19 Jun 2019 14:28:46 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Jun 2019 14:28:43 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5JDSgeb25493604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 13:28:42 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6160DA4051;
 Wed, 19 Jun 2019 13:28:42 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1538AA404D;
 Wed, 19 Jun 2019 13:28:42 +0000 (GMT)
Received: from pic2.home (unknown [9.145.171.67])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Jun 2019 13:28:42 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, andrew.donnellan@au1.ibm.com,
 clombard@linux.ibm.com
Subject: [RFC 03/11] powerpc/powernv/ioda: set up PE on opencapi device when
 enabling
Date: Wed, 19 Jun 2019 15:28:32 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619132840.27634-1-fbarrat@linux.ibm.com>
References: <20190619132840.27634-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061913-0008-0000-0000-000002F5227C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061913-0009-0000-0000-000022623E58
Message-Id: <20190619132840.27634-4-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906190109
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
Cc: aik@ozlabs.ru, arbab@linux.ibm.com, oohall@gmail.com, groug@kaod.org,
 alastair@au1.ibm.com
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
index 2c063b05bb64..2cf06fb98978 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1258,8 +1258,6 @@ static void pnv_pci_ioda_setup_PEs(void)
 {
 	struct pci_controller *hose;
 	struct pnv_phb *phb;
-	struct pci_bus *bus;
-	struct pci_dev *pdev;
 	struct pnv_ioda_pe *pe;
 
 	list_for_each_entry(hose, &hose_list, list_node) {
@@ -1271,11 +1269,6 @@ static void pnv_pci_ioda_setup_PEs(void)
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
@@ -3373,6 +3366,28 @@ static bool pnv_pci_enable_device_hook(struct pci_dev *dev)
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
@@ -3613,7 +3628,7 @@ static const struct pci_controller_ops pnv_npu_ioda_controller_ops = {
 };
 
 static const struct pci_controller_ops pnv_npu_ocapi_ioda_controller_ops = {
-	.enable_device_hook	= pnv_pci_enable_device_hook,
+	.enable_device_hook	= pnv_ocapi_enable_device_hook,
 	.window_alignment	= pnv_pci_window_alignment,
 	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
 	.shutdown		= pnv_pci_ioda_shutdown,
-- 
2.21.0

