Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BED903BF0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 14:31:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s+deGGYJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vz7ML3DlHz3d9T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 22:31:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s+deGGYJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vz7Kb4xjXz3dJ9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 22:29:55 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BBviMX023876;
	Tue, 11 Jun 2024 12:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	subject:from:to:cc:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=pp1; bh=
	2DLsf+SvHScMTHZelGi6oM+GObwA5scUy8yfncQmirM=; b=s+deGGYJQRUNfZnM
	cNilhRDdEeNsztPuuyDnPnDObbl4cmg8nxgBBmTAU9f36AM9pO2VcGytIVVEOn9U
	TsnN8617bU0yKh1yInkOQ6X5gJJInUXpkJOsJY1CwDynqbidkbtIvK3fyH0dU7ew
	amJDz9hNnISYaILzkxQ5ChD9bWODeXSaicDEiQdcs5nH0vMgR1sWEs7mRRWHQbyj
	qoRS4y14AgpoFGsZvWXge6ekHSHldwY1XiSeEJuK+UXm1iF1mGJtNONpI74WLqqu
	TI4J3jvC7EZYA0O0d4glymeUSuXyNjtuCkVel3CDU11gsEtJ0s1jm80qoMRY+KZU
	LFiTCw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ypmv4889k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:29:37 +0000 (GMT)
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45BCTaAW008352;
	Tue, 11 Jun 2024 12:29:36 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ypmv4889g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:29:36 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45B8uYes008700;
	Tue, 11 Jun 2024 12:29:35 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yn4b3582q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:29:35 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45BCTS4o34472524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jun 2024 12:29:30 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 84D8E20043;
	Tue, 11 Jun 2024 12:29:28 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 378B32004B;
	Tue, 11 Jun 2024 12:29:25 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.3.101.175])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jun 2024 12:29:25 +0000 (GMT)
Subject: [PATCH v3 2/6] powerpc/pseries/iommu: Fix the
 VFIO_IOMMU_SPAPR_TCE_GET_INFO ioctl output
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: mpe@ellerman.id.au, tpearson@raptorengineering.com,
        alex.williamson@redhat.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Date: Tue, 11 Jun 2024 12:29:24 +0000
Message-ID: <171810896158.1721.16660200341736554023.stgit@linux.ibm.com>
In-Reply-To: <171810893836.1721.2640631616827396553.stgit@linux.ibm.com>
References: <171810893836.1721.2640631616827396553.stgit@linux.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TM-1FaRYAglYpddfHXR_EamtVPzKPP4o
X-Proofpoint-GUID: x37BXsL4o7u1lZdU2TdmLo88SWkqhZwT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406110092
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
Cc: svaidy@linux.ibm.com, robh@kernel.org, jroedel@suse.de, sbhat@linux.ibm.com, gbatra@linux.vnet.ibm.com, jgg@ziepe.ca, aik@ozlabs.ru, linux-kernel@vger.kernel.org, mahesh@linux.ibm.com, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, oohall@gmail.com, npiggin@gmail.com, kvm@vger.kernel.org, ruscur@russell.cc, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, msuchanek@suse.de, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ioctl VFIO_IOMMU_SPAPR_TCE_GET_INFO is not reporting the
actuals on the platform as not all the details are correctly
collected during the platform probe/scan into the iommu_table_group.

Collect the information during the device setup time as the DMA
window property is already looked up on parent nodes anyway.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c |   81 ++++++++++++++++++++++++++------
 1 file changed, 67 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 330c69830660..eebb8296d431 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -865,13 +865,6 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 				be32_to_cpu(prop.tce_shift), NULL,
 				&iommu_table_lpar_multi_ops);
 
-		/* Only for normal boot with default window. Doesn't matter even
-		 * if we set these with DDW which is 64bit during kdump, since
-		 * these will not be used during kdump.
-		 */
-		ppci->table_group->tce32_start = be64_to_cpu(prop.dma_base);
-		ppci->table_group->tce32_size = 1 << be32_to_cpu(prop.window_shift);
-
 		if (!iommu_init_table(tbl, ppci->phb->node, 0, 0))
 			panic("Failed to initialize iommu table");
 
@@ -1623,6 +1616,71 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	return direct_mapping;
 }
 
+static __u64 query_page_size_to_mask(u32 query_page_size)
+{
+	const long shift[] = {
+		(SZ_4K),   (SZ_64K), (SZ_16M),
+		(SZ_32M),  (SZ_64M), (SZ_128M),
+		(SZ_256M), (SZ_16G), (SZ_2M)
+	};
+	int i, ret = 0;
+
+	for (i = 0; i < ARRAY_SIZE(shift); i++) {
+		if (query_page_size & (1 << i))
+			ret |= shift[i];
+	}
+
+	return ret;
+}
+
+static void spapr_tce_init_table_group(struct pci_dev *pdev,
+				       struct device_node *pdn,
+				       struct dynamic_dma_window_prop prop)
+{
+	struct iommu_table_group  *table_group = PCI_DN(pdn)->table_group;
+	u32 ddw_avail[DDW_APPLICABLE_SIZE];
+
+	struct ddw_query_response query;
+	int ret;
+
+	/* Only for normal boot with default window. Doesn't matter during
+	 * kdump, since these will not be used during kdump.
+	 */
+	if (is_kdump_kernel())
+		return;
+
+	if (table_group->max_dynamic_windows_supported != 0)
+		return; /* already initialized */
+
+	table_group->tce32_start = be64_to_cpu(prop.dma_base);
+	table_group->tce32_size = 1 << be32_to_cpu(prop.window_shift);
+
+	if (!of_find_property(pdn, "ibm,dma-window", NULL))
+		dev_err(&pdev->dev, "default dma window missing!\n");
+
+	ret = of_property_read_u32_array(pdn, "ibm,ddw-applicable",
+			&ddw_avail[0], DDW_APPLICABLE_SIZE);
+	if (ret) {
+		table_group->max_dynamic_windows_supported = -1;
+		return;
+	}
+
+	ret = query_ddw(pdev, ddw_avail, &query, pdn);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: query_ddw failed\n", __func__);
+		table_group->max_dynamic_windows_supported = -1;
+		return;
+	}
+
+	if (query.windows_available == 0)
+		table_group->max_dynamic_windows_supported = 1;
+	else
+		table_group->max_dynamic_windows_supported = IOMMU_TABLE_GROUP_MAX_TABLES;
+
+	table_group->max_levels = 1;
+	table_group->pgsizes |= query_page_size_to_mask(query.page_size);
+}
+
 static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 {
 	struct device_node *pdn, *dn;
@@ -1662,13 +1720,6 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 				be32_to_cpu(prop.tce_shift), NULL,
 				&iommu_table_lpar_multi_ops);
 
-		/* Only for normal boot with default window. Doesn't matter even
-		 * if we set these with DDW which is 64bit during kdump, since
-		 * these will not be used during kdump.
-		 */
-		pci->table_group->tce32_start = be64_to_cpu(prop.dma_base);
-		pci->table_group->tce32_size = 1 << be32_to_cpu(prop.window_shift);
-
 		iommu_init_table(tbl, pci->phb->node, 0, 0);
 		iommu_register_group(pci->table_group,
 				pci_domain_nr(pci->phb->bus), 0);
@@ -1677,6 +1728,8 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 		pr_debug("  found DMA window, table: %p\n", pci->table_group);
 	}
 
+	spapr_tce_init_table_group(dev, pdn, prop);
+
 	set_iommu_table_base(&dev->dev, pci->table_group->tables[0]);
 	iommu_add_device(pci->table_group, &dev->dev);
 }


