Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7DC914A6D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 14:42:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YqjnrMyd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W77050NHBz3cTS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 22:42:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YqjnrMyd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W76wd6nnfz3cZn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 22:39:29 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OBwbsP032681;
	Mon, 24 Jun 2024 12:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	subject:from:to:cc:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=pp1; bh=
	lr6e1+vfNrPfM49ecKxEgIZrNV9dBE4qOg6iv/LnnZI=; b=YqjnrMydEz96VdO8
	JR2jCtaMzjLHzbNtWiP1W1ltER6BmWB6oTSk6ZmW7iLVfcvfDxlr7aIvTkWScF6Y
	prHaeGww+c1SrSL2ixNWBT2Kap1EhU2EyCmUI+/pbc09RUeO2xlul38y09OgKvyU
	/DKSE9JDvmjWNPG3NhUoOWfLHcGQpPELM4uZpG5tVT1oanwNeyxNiTNvqweJnwlf
	qdEJPrxY1Rp23kRX0nFD9UUiO4F1P/7c8pmsj4PXAh5KnssY3JAKCgVfch/lJ9WT
	MrWL8J0dqoYLgFz7OyibiQi6qJpTWeUeVLr+QEZIGUEFZkuJzPmtyRHDu6GgZuF9
	KrxXrg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yy8d1r3nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 12:39:21 +0000 (GMT)
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45OCdLF1013018;
	Mon, 24 Jun 2024 12:39:21 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yy8d1r3np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 12:39:21 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45OAkMb4020074;
	Mon, 24 Jun 2024 12:39:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yxb5m8eyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 12:39:19 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45OCdEjj26542668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jun 2024 12:39:16 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69B2820043;
	Mon, 24 Jun 2024 12:39:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E775820040;
	Mon, 24 Jun 2024 12:39:10 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.3.101.175])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Jun 2024 12:39:10 +0000 (GMT)
Subject: [PATCH v4 5/6] powerpc/iommu: Move dev_has_iommu_table() to iommu.c
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: mpe@ellerman.id.au, tpearson@raptorengineering.com,
        alex.williamson@redhat.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Date: Mon, 24 Jun 2024 12:39:10 +0000
Message-ID: <171923274748.1397.6274953248403106679.stgit@linux.ibm.com>
In-Reply-To: <171923268781.1397.8871195514893204050.stgit@linux.ibm.com>
References: <171923268781.1397.8871195514893204050.stgit@linux.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9JEEWZzPW53U3nD_tLiZYnN8dE_qvGz6
X-Proofpoint-GUID: nsfg4u1k5BCy2KW3yklqppQJEs4TpS_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_09,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=976 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240099
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
Cc: svaidy@linux.ibm.com, robh@kernel.org, jroedel@suse.de, sbhat@linux.ibm.com, gbatra@linux.vnet.ibm.com, jgg@ziepe.ca, aik@ozlabs.ru, sanastasio@raptorengineering.com, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, mahesh@linux.ibm.com, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, oohall@gmail.com, npiggin@gmail.com, kvm@vger.kernel.org, ruscur@russell.cc, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, msuchanek@suse.de, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move function dev_has_iommu_table() to powerpc/kernel/iommu.c
as it is going to be used by machine specific iommu code as
well in subsequent patches.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 arch/powerpc/include/asm/iommu.h |    6 ++++++
 arch/powerpc/kernel/eeh.c        |   16 ----------------
 arch/powerpc/kernel/iommu.c      |   17 +++++++++++++++++
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 744cc5fc22d3..b2fe6e7f81d6 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -220,6 +220,7 @@ extern long iommu_tce_xchg_no_kill(struct mm_struct *mm,
 		enum dma_data_direction *direction);
 extern void iommu_tce_kill(struct iommu_table *tbl,
 		unsigned long entry, unsigned long pages);
+int dev_has_iommu_table(struct device *dev, void *data);
 
 #else
 static inline void iommu_register_group(struct iommu_table_group *table_group,
@@ -233,6 +234,11 @@ static inline int iommu_add_device(struct iommu_table_group *table_group,
 {
 	return 0;
 }
+
+static inline int dev_has_iommu_table(struct device *dev, void *data)
+{
+	return 0;
+}
 #endif /* !CONFIG_IOMMU_API */
 
 u64 dma_iommu_get_required_mask(struct device *dev);
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 6670063a7a6c..d03f17987fca 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1273,22 +1273,6 @@ EXPORT_SYMBOL(eeh_dev_release);
 
 #ifdef CONFIG_IOMMU_API
 
-static int dev_has_iommu_table(struct device *dev, void *data)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pci_dev **ppdev = data;
-
-	if (!dev)
-		return 0;
-
-	if (device_iommu_mapped(dev)) {
-		*ppdev = pdev;
-		return 1;
-	}
-
-	return 0;
-}
-
 /**
  * eeh_iommu_group_to_pe - Convert IOMMU group to EEH PE
  * @group: IOMMU group
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index b5febc6c7a5e..ed8204cfa319 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -988,6 +988,23 @@ unsigned long iommu_direction_to_tce_perm(enum dma_data_direction dir)
 EXPORT_SYMBOL_GPL(iommu_direction_to_tce_perm);
 
 #ifdef CONFIG_IOMMU_API
+
+int dev_has_iommu_table(struct device *dev, void *data)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct pci_dev **ppdev = data;
+
+	if (!dev)
+		return 0;
+
+	if (device_iommu_mapped(dev)) {
+		*ppdev = pdev;
+		return 1;
+	}
+
+	return 0;
+}
+
 /*
  * SPAPR TCE API
  */


