Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD2A903BF8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 14:32:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GvaO4GGM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vz7N71FZQz3dTD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 22:32:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GvaO4GGM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vz7Kc4sBbz3cQs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 22:29:56 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BCRHbN028122;
	Tue, 11 Jun 2024 12:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	subject:from:to:cc:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=pp1; bh=
	Ie3B94Z/ucL+3HCaOf6G6Yji6qwBDT76JQ3WdI2p8qQ=; b=GvaO4GGMip9b2rMl
	bBakHYz/x1l97COnc3FStPCW2ErFRYxbddchLsmwYEtTv0kZlJwGDjQR4pc2XVPf
	SwZgfaIwSTkTcNbZb4lrTVHeuvDX2RrEIzVicmUCJshj7QChFDLKUeg6LHfBr2ms
	Y4LLTbSG4ZnRoDuzq1+6zRW8mKVHshAo5RbkCLTW6awhoqjy5R33tbiWCZxD2l96
	pLkcIuN67xfzAxyoIj9riFiXy6x5U/bWF1m2J7gFQwyIhW+93ClcaWIFI+Mx8oRZ
	SKSeHffS8DG2PcnT2a8pqUCh7M3VgvXHu0JJZ38yx0IWV7YOQF78n5300ofMFzMB
	iSHx3Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ypp6b81xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:29:47 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45BCTlin000923;
	Tue, 11 Jun 2024 12:29:47 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ypp6b81xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:29:47 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45BAhaJL003886;
	Tue, 11 Jun 2024 12:29:46 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yn2mpnqwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:29:46 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45BCTe4638207958
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jun 2024 12:29:42 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 92F0620040;
	Tue, 11 Jun 2024 12:29:40 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 274B92004B;
	Tue, 11 Jun 2024 12:29:37 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.3.101.175])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jun 2024 12:29:36 +0000 (GMT)
Subject: [PATCH v3 3/6] powerpc/pseries/iommu: Use the iommu table[0] for IOV
 VF's DDW
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: mpe@ellerman.id.au, tpearson@raptorengineering.com,
        alex.williamson@redhat.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Date: Tue, 11 Jun 2024 12:29:36 +0000
Message-ID: <171810897369.1721.17385606620745647086.stgit@linux.ibm.com>
In-Reply-To: <171810893836.1721.2640631616827396553.stgit@linux.ibm.com>
References: <171810893836.1721.2640631616827396553.stgit@linux.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -nOlKHuQPCnz6pvz4eNsKBDjdReWlMKO
X-Proofpoint-GUID: ArpSHXlhUNqbnrJKlgbxfYcgkDU2nDFx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=905
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110092
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

This patch basically brings consistency with PowerNV approach
to use the first freely available iommu table when the default
window is removed.

The pSeries iommu code convention has been that the table[0] is
for the default 32 bit DMA window and the table[1] is for the
64 bit DDW.

With VFs having only 1 DMA window, the default has to be removed
for creating the larger DMA window. The existing code uses the
table[1] for that, while marking the table[0] as NULL. This is
fine as long as the host driver itself uses the device.

For the VFIO user, on pSeries there is no way to skip table[0]
as the VFIO subdriver uses the first freely available table.
The window 0, when created as 64-bit DDW in that context would
still be on table[0], as the maximum number of windows is 1.

This won't have any impact for the host driver as the table is
fetched from the device's iommu_table_base.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index eebb8296d431..cffa64cf60e7 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -155,7 +155,7 @@ static void iommu_pseries_free_group(struct iommu_table_group *table_group,
 #endif
 
 	/* Default DMA window table is at index 0, while DDW at 1. SR-IOV
-	 * adapters only have table on index 1.
+	 * adapters only have table on index 0(if not direct mapped).
 	 */
 	if (table_group->tables[0])
 		iommu_tce_table_put(table_group->tables[0]);
@@ -1527,6 +1527,11 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 			clean_dma_window(pdn, win64->value);
 			goto out_del_list;
 		}
+		if (default_win_removed) {
+			iommu_tce_table_put(pci->table_group->tables[0]);
+			pci->table_group->tables[0] = NULL;
+			set_iommu_table_base(&dev->dev, NULL);
+		}
 	} else {
 		struct iommu_table *newtbl;
 		int i;
@@ -1556,15 +1561,12 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 					    1UL << len, page_shift, NULL, &iommu_table_lpar_multi_ops);
 		iommu_init_table(newtbl, pci->phb->node, start, end);
 
-		pci->table_group->tables[1] = newtbl;
+		pci->table_group->tables[default_win_removed ? 0 : 1] = newtbl;
 
 		set_iommu_table_base(&dev->dev, newtbl);
 	}
 
 	if (default_win_removed) {
-		iommu_tce_table_put(pci->table_group->tables[0]);
-		pci->table_group->tables[0] = NULL;
-
 		/* default_win is valid here because default_win_removed == true */
 		of_remove_property(pdn, default_win);
 		dev_info(&dev->dev, "Removed default DMA window for %pOF\n", pdn);


