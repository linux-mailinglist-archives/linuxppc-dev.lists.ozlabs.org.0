Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B15458B813D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 22:12:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LxBjMBR1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTWZk2VbWz3dFS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 06:12:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LxBjMBR1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTWZ04XbMz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 06:11:52 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43UK2Xpa007507;
	Tue, 30 Apr 2024 20:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : from : to : cc
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=yBhQkttHnEyL5cv2acTqp19DVPXSx5tGvkMc8RzjqEA=;
 b=LxBjMBR1WhMCimHmYhDo6ZYa3DBTOr6EYmh2Ts3p1cRnWXa/gzQHIjwqhI5xl4kqglJj
 C89i8ff/eBHBPmN5vkvdxElIPUoZOMAJRbyV6kYg3ioFyCVpT9eLQG7mvDoMn7DRh8JS
 GdCg3SQVCwEFTknfRUjxTh3ag0vtz+y8eHQepodRCtcZQmSTeA8kWIMQ/LDjeRF2NX2a
 X6KZSuad6UQXgmGsc1QoNWvPW+ldr4ZcwQAw8GnzcKnTL2eSqSU/Rxl7vVNDB7tC7/M3
 djj2l0Rgctu2yo1OTnWdSUY9wp/iem6rN2hPoiADs72TZM5HISTDqlXGnY0xxCHlm7l2 LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xu7aw80ry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 20:11:41 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43UKBfVm020065;
	Tue, 30 Apr 2024 20:11:41 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xu7aw80ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 20:11:41 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43UGtH7m003210;
	Tue, 30 Apr 2024 20:06:39 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xscppey66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 20:06:39 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43UK6XCw50659668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2024 20:06:35 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C204B20043;
	Tue, 30 Apr 2024 20:06:33 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B80D20040;
	Tue, 30 Apr 2024 20:06:30 +0000 (GMT)
Received: from ltcd48-lp2.aus.stglabs.ibm.com (unknown [9.3.101.175])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 30 Apr 2024 20:06:30 +0000 (GMT)
Subject: [RFC PATCH v2 4/6] vfio/spapr: Always clear TCEs before unsetting the
 window
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: mpe@ellerman.id.au, tpearson@raptorengineering.com,
        alex.williamson@redhat.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Date: Tue, 30 Apr 2024 15:06:29 -0500
Message-ID: <171450758612.10851.13609092281484392070.stgit@linux.ibm.com>
In-Reply-To: <171450753489.10851.3056035705169121613.stgit@linux.ibm.com>
References: <171450753489.10851.3056035705169121613.stgit@linux.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: v2Ee3IWtSfGXxFnGrk9v1eDWCkNWoWr8
X-Proofpoint-GUID: w1ScwEyd33lLBSZOVCzp4v6AovvoB6ET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_12,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=862 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404300145
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


