Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D23E5E343E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 15:31:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zSnw2C64zDqVF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 00:31:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clombard@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zSjt6LqTzDqTv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 00:28:18 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9ODRTwI110433
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 09:28:13 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vucuyr13p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 09:28:12 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <clombard@linux.vnet.ibm.com>;
 Thu, 24 Oct 2019 14:28:10 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 24 Oct 2019 14:28:07 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9ODS64526411222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 13:28:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CD5E11C058;
 Thu, 24 Oct 2019 13:28:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11A0F11C052;
 Thu, 24 Oct 2019 13:28:06 +0000 (GMT)
Received: from lombard-w541.ibmuc.com (unknown [9.145.180.183])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Oct 2019 13:28:05 +0000 (GMT)
From: christophe lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com, aik@ozlabs.ru, groug@kaod.org, clg@kaod.org
Subject: [PATCH 1/2] powerpc/powernv: Register IOMMU group for OpenCAPI devices
Date: Thu, 24 Oct 2019 15:28:04 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191024132805.30701-1-clombard@linux.vnet.ibm.com>
References: <20191024132805.30701-1-clombard@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19102413-0020-0000-0000-0000037DDB9A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19102413-0021-0000-0000-000021D422D2
Message-Id: <20191024132805.30701-2-clombard@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-24_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910240128
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch adds group registration for the OpenCAPI devices.
An unique iommu group is register for multiple PE, ie for a set of
multiple devices sharing the same domain, same bus and same slot.

This groud registration will be used to assign an OpenCAPI device to a
guest to participate in VFIO, like vfio-pci.

The release_ownership hook is used to disable the Scheduled Process Area
and clean allocated data if it's not done previously when the ocxl driver
is unloaded.

To support multiple OpenCAPI devices on the same machine, iommu group
and platform data are declared in the npu_link which is common for each
devices sharing the same domain, same bus and same slot.

Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/powernv/ocxl.c     | 164 +++++++++++++++++-----
 arch/powerpc/platforms/powernv/pci-ioda.c |  19 ++-
 arch/powerpc/platforms/powernv/pci.h      |  13 ++
 3 files changed, 156 insertions(+), 40 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
index 12b146c2f855..67b2be965415 100644
--- a/arch/powerpc/platforms/powernv/ocxl.c
+++ b/arch/powerpc/platforms/powernv/ocxl.c
@@ -74,6 +74,8 @@ struct npu_link {
 	u16 fn_desired_actags[8];
 	struct actag_range fn_actags[8];
 	bool assignment_done;
+	struct iommu_group *group;
+	struct platform_data data;
 };
 static struct list_head links_list = LIST_HEAD_INIT(links_list);
 static DEFINE_MUTEX(links_list_lock);
@@ -603,54 +605,56 @@ int pnv_ocxl_platform_setup(struct pci_dev *dev, int PE_mask,
 {
 	struct pci_controller *hose = pci_bus_to_host(dev->bus);
 	struct pnv_phb *phb = hose->private_data;
-	struct platform_data *data;
+	struct npu_link *link = NULL;
 	int xsl_irq;
 	u32 bdfn;
-	int rc;
-
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
+	int rc = 0;
 
-	rc = alloc_spa(dev, data);
-	if (rc) {
-		kfree(data);
-		return rc;
+	mutex_lock(&links_list_lock);
+	link = find_link(dev);
+	if (!link) {
+		dev_err(&dev->dev, "Failed to setup platform\n");
+		mutex_unlock(&links_list_lock);
+		return -ENODEV;
 	}
 
+	rc = alloc_spa(dev, &link->data);
+	if (rc)
+		goto unlock;
+
 	rc = get_xsl_irq(dev, &xsl_irq);
 	if (rc) {
-		free_spa(data);
-		kfree(data);
-		return rc;
+		free_spa(&link->data);
+		goto unlock;
 	}
 
-	rc = map_xsl_regs(dev, &data->dsisr, &data->dar, &data->tfc,
-			  &data->pe_handle);
+	rc = map_xsl_regs(dev, &link->data.dsisr, &link->data.dar,
+			  &link->data.tfc, &link->data.pe_handle);
 	if (rc) {
-		free_spa(data);
-		kfree(data);
-		return rc;
+		free_spa(&link->data);
+		goto unlock;
 	}
 
 	bdfn = (dev->bus->number << 8) | dev->devfn;
 	rc = opal_npu_spa_setup(phb->opal_id, bdfn,
-				virt_to_phys(data->spa->spa_mem),
+				virt_to_phys(link->data.spa->spa_mem),
 				PE_mask);
 	if (rc) {
 		dev_err(&dev->dev, "Can't setup Shared Process Area: %d\n", rc);
-		unmap_xsl_regs(data->dsisr, data->dar, data->tfc,
-			       data->pe_handle);
-		free_spa(data);
-		kfree(data);
-		return rc;
+		unmap_xsl_regs(link->data.dsisr, link->data.dar,
+			       link->data.tfc, link->data.pe_handle);
+		free_spa(&link->data);
+		goto unlock;
 	}
-	data->phb_opal_id = phb->opal_id;
-	data->bdfn = bdfn;
-	*platform_data = (void *) data;
+	link->data.phb_opal_id = phb->opal_id;
+	link->data.bdfn = bdfn;
 
 	*hwirq = xsl_irq;
-	return 0;
+	*platform_data = (void *)&link->data;
+
+unlock:
+	mutex_unlock(&links_list_lock);
+	return rc;
 }
 EXPORT_SYMBOL_GPL(pnv_ocxl_platform_setup);
 
@@ -682,11 +686,13 @@ void pnv_ocxl_platform_release(void *platform_data)
 	struct platform_data *data = (struct platform_data *)platform_data;
 	int rc;
 
-	rc = opal_npu_spa_setup(data->phb_opal_id, data->bdfn, 0, 0);
-	WARN_ON(rc);
-	unmap_xsl_regs(data->dsisr, data->dar, data->tfc, data->pe_handle);
-	free_spa(data);
-	kfree(data);
+	if (data->spa) {
+		rc = opal_npu_spa_setup(data->phb_opal_id, data->bdfn, 0, 0);
+		WARN_ON(rc);
+		unmap_xsl_regs(data->dsisr, data->dar, data->tfc,
+			       data->pe_handle);
+		free_spa(data);
+	}
 }
 EXPORT_SYMBOL_GPL(pnv_ocxl_platform_release);
 
@@ -837,3 +843,95 @@ int pnv_ocxl_remove_pe(void *platform_data, int pasid, u32 *pid,
 	return remove_pe_from_cache(data, *pe_handle);
 }
 EXPORT_SYMBOL_GPL(pnv_ocxl_remove_pe);
+
+static void take_ownership(struct iommu_table_group *table_group)
+{
+}
+
+static void release_ownership(struct iommu_table_group *table_group)
+{
+	struct pnv_ioda_pe *pe = container_of(table_group,
+					      struct pnv_ioda_pe,
+					      table_group);
+	struct npu_link *link = NULL;
+
+	mutex_lock(&links_list_lock);
+
+	link = find_link(pe->pdev);
+	if (!link)
+		return;
+
+	if (link->data.spa)
+		pnv_ocxl_platform_release(&link->data);
+
+	mutex_unlock(&links_list_lock);
+}
+
+static long set_window(struct iommu_table_group *table_group,
+		       int num, struct iommu_table *tbl)
+{
+	return 0;
+}
+
+static long unset_window(struct iommu_table_group *table_group,
+			 int num)
+{
+	return 0;
+}
+
+static long create_table(struct iommu_table_group *table_group,
+			 int num, __u32 page_shift, __u64 window_size,
+			 __u32 levels, struct iommu_table **ptbl)
+{
+	return 0;
+}
+
+static struct iommu_table_group_ops pnv_ocxl_ops = {
+	.take_ownership = take_ownership,
+	.release_ownership = release_ownership,
+	.set_window = set_window,
+	.unset_window = unset_window,
+	.create_table = create_table,
+};
+
+static void group_release(void *iommu_data)
+{
+	struct iommu_table_group *table_group = iommu_data;
+
+	table_group->group = NULL;
+}
+
+struct iommu_table_group *pnv_ocxl_setup_table_group(struct pnv_ioda_pe *pe)
+{
+	struct iommu_table_group *table_group;
+	struct npu_link *link = NULL;
+	struct pci_controller *hose;
+
+	mutex_lock(&links_list_lock);
+
+	/* The functions of a device all share the same link and by
+	 * default the same table group
+	 */
+	link = find_link(pe->pdev);
+	if (!link)
+		return NULL;
+
+	hose = pe->phb->hose;
+	table_group = &pe->table_group;
+	table_group->ops = &pnv_ocxl_ops;
+	if (link->group) {
+		table_group->group = link->group;
+		iommu_group_set_iommudata(link->group, table_group,
+					  group_release);
+	} else {
+		if (!table_group->group) {
+			iommu_register_group(table_group,
+					     hose->global_number,
+					     pe->pe_number);
+			link->group = table_group->group;
+		}
+	}
+
+	mutex_unlock(&links_list_lock);
+	return table_group;
+}
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index d8080558d020..3f98b05e2d55 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2629,22 +2629,27 @@ static void pnv_pci_ioda_setup_iommu_api(void)
 	list_for_each_entry(hose, &hose_list, list_node) {
 		phb = hose->private_data;
 
-		if (phb->type == PNV_PHB_NPU_NVLINK ||
-		    phb->type == PNV_PHB_NPU_OCAPI)
+		if (phb->type == PNV_PHB_NPU_NVLINK)
 			continue;
 
 		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
 			struct iommu_table_group *table_group;
 
-			table_group = pnv_try_setup_npu_table_group(pe);
-			if (!table_group) {
-				if (!pnv_pci_ioda_pe_dma_weight(pe))
+			if (phb->type == PNV_PHB_NPU_OCAPI) {
+				table_group = pnv_ocxl_setup_table_group(pe);
+				if (!table_group)
 					continue;
+			} else {
+				table_group = pnv_try_setup_npu_table_group(pe);
+				if (!table_group) {
+					if (!pnv_pci_ioda_pe_dma_weight(pe))
+						continue;
 
-				table_group = &pe->table_group;
-				iommu_register_group(&pe->table_group,
+					table_group = &pe->table_group;
+					iommu_register_group(&pe->table_group,
 						pe->phb->hose->global_number,
 						pe->pe_number);
+				}
 			}
 			pnv_ioda_setup_bus_iommu_group(pe, table_group,
 					pe->pbus);
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 469c24463247..df4b7583efea 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -218,6 +218,19 @@ extern struct iommu_table_group *pnv_try_setup_npu_table_group(
 extern struct iommu_table_group *pnv_npu_compound_attach(
 		struct pnv_ioda_pe *pe);
 
+/* OpenCAPI functions */
+#if IS_ENABLED(CONFIG_OCXL_BASE)
+extern struct iommu_table_group *pnv_ocxl_setup_table_group(
+			struct pnv_ioda_pe *pe);
+#else
+static inline struct iommu_table_group *pnv_ocxl_setup_table_group(
+			struct pnv_ioda_pe *pe)
+{
+	return NULL;
+}
+#endif /* CONFIG_OCXL_BASE */
+
+
 /* pci-ioda-tce.c */
 #define POWERNV_IOMMU_DEFAULT_LEVELS	1
 #define POWERNV_IOMMU_MAX_LEVELS	5
-- 
2.21.0

