Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD06903BFA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 14:33:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ADVbWCdw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vz7Pq2njVz3dSd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 22:33:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ADVbWCdw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vz7L76hMzz3dFx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 22:30:23 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BBUqZS017562;
	Tue, 11 Jun 2024 12:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	subject:from:to:cc:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=pp1; bh=
	HkP+tbp3uLxf4WdcO3PBJNiNRxX/u4/TYB8X5ieVVYo=; b=ADVbWCdwNj837qmE
	g7+sCAFMELK65LREIfXhsON4FJCSvTbHqNYkRPRY1M0XwW60Pkhi3LdV39mem7iK
	zahy1CEi+QNhnbRNIjHpcJGkvgUUO4xz68876u8TiJnAK5mYnPwHNET2W3A+KmAf
	OEn/UkvwBpnH9Z6qIJbd8d4y2xFyyMK0uQ0wATeZ4u/kitaYkwGVP4KsKmvJ0jXC
	VRcW/eo/P6ttewUOiGtjPZdbbLw1KLHcIH3YqWXI0Cq7aFUenEvoUvBt22klwU6e
	pksZ2kw1hJBYo6wF+xNYxM0O/sYUbpzRLTJSqV/I/4Tm8/MOvJFZKcNnbKAw7OPm
	JZZrfQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ypnr1r3w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:30:14 +0000 (GMT)
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45BCUEfC007296;
	Tue, 11 Jun 2024 12:30:14 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ypnr1r3vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:30:13 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45BB7OEl020069;
	Tue, 11 Jun 2024 12:30:12 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yn34mwn09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:30:12 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45BCU6CC38011254
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jun 2024 12:30:08 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C15EA20040;
	Tue, 11 Jun 2024 12:30:06 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 990F32004F;
	Tue, 11 Jun 2024 12:30:03 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.3.101.175])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jun 2024 12:30:03 +0000 (GMT)
Subject: [PATCH v3 5/6] powerpc/iommu: Move dev_has_iommu_table() to iommu.c
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: mpe@ellerman.id.au, tpearson@raptorengineering.com,
        alex.williamson@redhat.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Date: Tue, 11 Jun 2024 12:30:03 +0000
Message-ID: <171810899821.1721.10732893379752118244.stgit@linux.ibm.com>
In-Reply-To: <171810893836.1721.2640631616827396553.stgit@linux.ibm.com>
References: <171810893836.1721.2640631616827396553.stgit@linux.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: r58SjdmH83sxctc4WSafK16X9KeYhAqV
X-Proofpoint-GUID: OBh89jiXphfSmQ29BoMDVmL18ATobfrv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=980 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Move function dev_has_iommu_table() to powerpc/kernel/iommu.c
as it is going to be used by machine specific iommu code as
well in subsequent patches.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 arch/powerpc/include/asm/iommu.h |    1 +
 arch/powerpc/kernel/eeh.c        |   16 ----------------
 arch/powerpc/kernel/iommu.c      |   17 +++++++++++++++++
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 744cc5fc22d3..784809e34abe 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -220,6 +220,7 @@ extern long iommu_tce_xchg_no_kill(struct mm_struct *mm,
 		enum dma_data_direction *direction);
 extern void iommu_tce_kill(struct iommu_table *tbl,
 		unsigned long entry, unsigned long pages);
+int dev_has_iommu_table(struct device *dev, void *data);
 
 #else
 static inline void iommu_register_group(struct iommu_table_group *table_group,
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


