Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EAC914A62
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 14:41:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=slFTjN1f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W76zJ58TPz3cbR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 22:41:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=slFTjN1f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W76wR0QgPz3cTS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 22:39:18 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OCSt4g015666;
	Mon, 24 Jun 2024 12:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	subject:from:to:cc:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=pp1; bh=
	yBhQkttHnEyL5cv2acTqp19DVPXSx5tGvkMc8RzjqEA=; b=slFTjN1fr9GLLu+d
	WpRSJCIC1gNtoxpxhFqzuTssQZPbGYj4FFN9bh9sfPpYhvtduK6bWuMhcG3JUb4V
	/Mu1twG7HPINIuArqre3jeDtT9OQ5X5bk3TiM3PkICx5TVsREBodcJE1ZpVnNDQZ
	ubw++fwJ9yP3Bc0nMEkGMh8mMieht+y1bxogzG9ZkCK2m5g7V08NjGVj0vpGFv9t
	BzyXFebjM40Zx7vNPyALDynPsoAaU5vA8KykmIPD2zMPZwlkBzwL491VdpG+oI+J
	IFmaLp5WObroMCwdhnYotgOUpSZNGYOgOmRntfX6VKAxIB0uvEU43wf4PhULIZek
	EsswXA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yy8u4r0v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 12:39:10 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45OCd92Q001415;
	Mon, 24 Jun 2024 12:39:09 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yy8u4r0up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 12:39:09 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45OAMlw8000575;
	Mon, 24 Jun 2024 12:39:08 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yxaemrm8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 12:39:08 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45OCd2to49348952
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jun 2024 12:39:04 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5192720043;
	Mon, 24 Jun 2024 12:39:02 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6B0520040;
	Mon, 24 Jun 2024 12:38:58 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.3.101.175])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Jun 2024 12:38:58 +0000 (GMT)
Subject: [PATCH v4 4/6] vfio/spapr: Always clear TCEs before unsetting the
 window
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: mpe@ellerman.id.au, tpearson@raptorengineering.com,
        alex.williamson@redhat.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Date: Mon, 24 Jun 2024 12:38:58 +0000
Message-ID: <171923273535.1397.1236742071894414895.stgit@linux.ibm.com>
In-Reply-To: <171923268781.1397.8871195514893204050.stgit@linux.ibm.com>
References: <171923268781.1397.8871195514893204050.stgit@linux.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E8BcRtYOtbYXq--juKL9VUPfyo9J-iGt
X-Proofpoint-ORIG-GUID: XS3PfcpElw7PNvaZnxWcIkjAfMpPPmQo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_09,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 mlxlogscore=838 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The PAPR expects the TCE table to have no entries at the time of
unset window(i.e. remove-pe). The TCE clear right now is done
before freeing the iommu table. On pSeries, the unset window
makes those entries inaccessible to the OS and the H_PUT/GET calls
fail on them with H_CONSTRAINED.

On PowerNV, this has no side effect as the TCE clear can be done
before the DMA window removal as well.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 drivers/vfio/vfio_iommu_spapr_tce.c |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
index a94ec6225d31..5f9e7e477078 100644
--- a/drivers/vfio/vfio_iommu_spapr_tce.c
+++ b/drivers/vfio/vfio_iommu_spapr_tce.c
@@ -364,7 +364,6 @@ static void tce_iommu_release(void *iommu_data)
 		if (!tbl)
 			continue;
 
-		tce_iommu_clear(container, tbl, tbl->it_offset, tbl->it_size);
 		tce_iommu_free_table(container, tbl);
 	}
 
@@ -720,6 +719,8 @@ static long tce_iommu_remove_window(struct tce_container *container,
 
 	BUG_ON(!tbl->it_size);
 
+	tce_iommu_clear(container, tbl, tbl->it_offset, tbl->it_size);
+
 	/* Detach groups from IOMMUs */
 	list_for_each_entry(tcegrp, &container->group_list, next) {
 		table_group = iommu_group_get_iommudata(tcegrp->grp);
@@ -738,7 +739,6 @@ static long tce_iommu_remove_window(struct tce_container *container,
 	}
 
 	/* Free table */
-	tce_iommu_clear(container, tbl, tbl->it_offset, tbl->it_size);
 	tce_iommu_free_table(container, tbl);
 	container->tables[num] = NULL;
 
@@ -1197,9 +1197,14 @@ static void tce_iommu_release_ownership(struct tce_container *container,
 		return;
 	}
 
-	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i)
-		if (container->tables[i])
+	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i) {
+		if (container->tables[i]) {
+			tce_iommu_clear(container, container->tables[i],
+					container->tables[i]->it_offset,
+					container->tables[i]->it_size);
 			table_group->ops->unset_window(table_group, i);
+		}
+	}
 }
 
 static long tce_iommu_take_ownership(struct tce_container *container,


