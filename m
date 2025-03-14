Return-Path: <linuxppc-dev+bounces-7038-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E47A60871
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 06:47:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDYJz5DR1z3cYh;
	Fri, 14 Mar 2025 16:46:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741931203;
	cv=none; b=AZ6iINOAffHz7FF+dgKMWJV+8uzoX95nDFuhMX77YN1NRs731mNfi/FMeP6v9K7Tvd1KQaBY2fCYNd+7DrMjfqhxTcR0Ol8PLlqZlNrxHEm3kszRHLMZmATKb1H9wJc0pl5Qo0OQloDg0zdWOL9QF2aIOx5UsoxXm34e1WM9U4BvTm+Q5EAzU+v9Go5yO1C9IVrijJ8/jnq/DdtVGplcJ6zxlTy3BPDZ4HpVi4j9HuYl5egqLKvgJKJu5liKhB8W9tJ/4FfzP7xvbVb4MePMGgCub/zzNo6jW5aj1L7mZpsX0/DohQ+INT/X/zi/bGAL+J0SuzWYPl2gwAHDyG1Btg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741931203; c=relaxed/relaxed;
	bh=Slm+QcWnMt+vSRjRU5hHB8Yv0leGrSO3vsQoycHpWIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WKtldoEhCG3zI/v9exKgL15erVsazXuzkFmrx9FWooi65GtrkLRX649dfzbtn+53HDXLGt7pyQmSIgj0Rgl+wQSAxZfiY1YP4MOYWS/9othFtU/npYHpSrk0Lsk9HcJvAqQJvsgWqTOjeIPb9+5AsVrtt32Wsd/gkQDOESl2fJxFBOez3d2fiKnnzqPljQ02OcqFEEbqpMjlgv6ju5/K0uvF43z1HdYoly1eWt422kLta7wXGZd9MG9kKGb6NscnSI1MingjtTILXStzoM0aApnQV7WSULrSenI4MXAAf0Dq0/rAEz7VVv7F2jlYSPOT0otjd0c1WMdOQb6Bvbl7WA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p4E29TPj; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p4E29TPj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDYJz0Dvhz30gC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 16:46:42 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNOvDK018097;
	Fri, 14 Mar 2025 05:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Slm+QcWnMt+vSRjRU
	5hHB8Yv0leGrSO3vsQoycHpWIg=; b=p4E29TPj7uPkh0elSoSXMUQguAd/iNUu2
	XeVUlS5IUYZM+VuPmolqtNi5FmfjyaEckHSZ6TvnRqjzbxoBHW4vKfa+KuoqUSdr
	l/gLZAqi3/TTqmvpIgYcdj0W5tW35izlt6iFgcX5znUgXkFEpGbcrFRd/lkqgsko
	gtsrAH1e/03bjLWDJU50k5zGJewrgOEoZ1RyABkCGJzPylT1LeyvhxDM4GHxrPem
	v4Q+6fOVyGQY1B+COGOLb6Ao5JSnL8HzYF7lk+NJp9hRF9La6qC5tt5gcunJFj5U
	Jr4AFl06YaI+xHTaiV9NV9TCHfOR0Ci4Xrmw/f0AvKmv4A+lA3fLQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c0srbwdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 05:46:32 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52E5kVgV012946;
	Fri, 14 Mar 2025 05:46:31 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c0srbwd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 05:46:31 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E4S8aQ003148;
	Fri, 14 Mar 2025 05:46:30 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atstwess-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 05:46:30 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52E5kRQY23003404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 05:46:27 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 437C52004B;
	Fri, 14 Mar 2025 05:46:27 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7E6820040;
	Fri, 14 Mar 2025 05:46:23 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.22.126])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 05:46:23 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, fbarrat@linux.ibm.com,
        ajd@linux.ibm.com, mahesh@linux.ibm.com, oohall@gmail.com,
        hbathini@linux.ibm.com, dhowells@redhat.com, haren@linux.ibm.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] powerpc: powenv: oxcl: use lock guard for mutex
Date: Fri, 14 Mar 2025 11:15:43 +0530
Message-ID: <20250314054544.1998928-6-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250314054544.1998928-1-sshegde@linux.ibm.com>
References: <20250314054544.1998928-1-sshegde@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hOAh2jrwfqOKyxz43bSzBNe7auPwMxaK
X-Proofpoint-GUID: VfIWj_W0UKqk5AiwHFnE4EH2KH-C0QeM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_01,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 phishscore=0 mlxlogscore=830 mlxscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503140041
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

use guard(mutex) for scope based resource management of mutex.
This would make the code simpler and easier to maintain.

More details on lock guards can be found at
https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/ocxl.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
index 64a9c7125c29..f8139948348e 100644
--- a/arch/powerpc/platforms/powernv/ocxl.c
+++ b/arch/powerpc/platforms/powernv/ocxl.c
@@ -172,12 +172,11 @@ static void pnv_ocxl_fixup_actag(struct pci_dev *dev)
 	if (phb->type != PNV_PHB_NPU_OCAPI)
 		return;
 
-	mutex_lock(&links_list_lock);
+	guard(mutex)(&links_list_lock);
 
 	link = find_link(dev);
 	if (!link) {
 		dev_warn(&dev->dev, "couldn't update actag information\n");
-		mutex_unlock(&links_list_lock);
 		return;
 	}
 
@@ -206,7 +205,6 @@ static void pnv_ocxl_fixup_actag(struct pci_dev *dev)
 	dev_dbg(&dev->dev, "total actags for function: %d\n",
 		link->fn_desired_actags[PCI_FUNC(dev->devfn)]);
 
-	mutex_unlock(&links_list_lock);
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_ANY_ID, PCI_ANY_ID, pnv_ocxl_fixup_actag);
 
@@ -253,12 +251,11 @@ int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled,
 {
 	struct npu_link *link;
 
-	mutex_lock(&links_list_lock);
+	guard(mutex)(&links_list_lock);
 
 	link = find_link(dev);
 	if (!link) {
 		dev_err(&dev->dev, "actag information not found\n");
-		mutex_unlock(&links_list_lock);
 		return -ENODEV;
 	}
 	/*
@@ -274,7 +271,6 @@ int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled,
 	*enabled   = link->fn_actags[PCI_FUNC(dev->devfn)].count;
 	*supported = link->fn_desired_actags[PCI_FUNC(dev->devfn)];
 
-	mutex_unlock(&links_list_lock);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pnv_ocxl_get_actag);
@@ -293,12 +289,11 @@ int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count)
 	 *
 	 * We only support one AFU-carrying function for now.
 	 */
-	mutex_lock(&links_list_lock);
+	guard(mutex)(&links_list_lock);
 
 	link = find_link(dev);
 	if (!link) {
 		dev_err(&dev->dev, "actag information not found\n");
-		mutex_unlock(&links_list_lock);
 		return -ENODEV;
 	}
 
@@ -309,7 +304,6 @@ int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count)
 			break;
 		}
 
-	mutex_unlock(&links_list_lock);
 	dev_dbg(&dev->dev, "%d PASIDs available for function\n",
 		rc ? 0 : *count);
 	return rc;
-- 
2.39.3


