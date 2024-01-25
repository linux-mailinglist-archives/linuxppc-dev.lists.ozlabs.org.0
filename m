Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5822E83C1AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 13:10:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vp4NhwYO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLKQl1gV3z3cYC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 23:10:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vp4NhwYO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLKP83w6lz3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 23:09:00 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40PBxrBO017909;
	Thu, 25 Jan 2024 12:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : from : to : cc
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=xq3woupK/AJHaIAxlnBBcKbFimpB/Ytqlol8MeYqF4s=;
 b=Vp4NhwYOtwjJvvJ96RQy2MACM1JRMn5rUQJKciWmaaQ8T4wKPPvQdSM+NN2gdF22wHhj
 fSVJQdMYU261vUYmaFVGjiWbkEQRY/dgucdXVkGWFyrck5hFS+yfNAh7Cm4p6Al3v/6e
 B4GXoNy4YisIIxwOEg+kO2OlOsmL7YRGgmbDFheASuvHpZ6q/dIY9guR3UH/n3LWEVkm
 Zi6E8eR2xIYoUu4ZYgopNti0jlC07zh9Bd/yaoyCk79M40zANXimIG8rfyokeYAk+Cwu
 dCToqVP96fyW49lXEi+GGb7c7/jDyqJH7H166sMr3MxoMPuqYo2fBgv5pD/N87hkRssJ /A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vupgph8m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 12:08:46 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40PBlBjp013231;
	Thu, 25 Jan 2024 12:08:46 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vupgph8kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 12:08:46 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40PAOPrk025268;
	Thu, 25 Jan 2024 12:08:45 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vrtqkkvtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 12:08:45 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40PC8gWh000548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jan 2024 12:08:42 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B08420040;
	Thu, 25 Jan 2024 12:08:42 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4E7A20063;
	Thu, 25 Jan 2024 12:08:39 +0000 (GMT)
Received: from ltcd48-lp2.aus.stglab.ibm.com (unknown [9.3.101.175])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jan 2024 12:08:39 +0000 (GMT)
Subject: [PATCH 1/2] powerpc: iommu: Bring back table group
 release_ownership() call
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: iommu@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Date: Thu, 25 Jan 2024 06:08:39 -0600
Message-ID:  <170618451433.3805.9015493852395837391.stgit@ltcd48-lp2.aus.stglab.ibm.com>
In-Reply-To:  <170618450592.3805.8216395093813382208.stgit@ltcd48-lp2.aus.stglab.ibm.com>
References:  <170618450592.3805.8216395093813382208.stgit@ltcd48-lp2.aus.stglab.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8Oc4vB_K5IVqloohLoC5iKjgxeZvViyP
X-Proofpoint-ORIG-GUID: E1GfupPUpyw-wyPiEx2bqwEdZom0-0IP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_06,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=997 mlxscore=0 malwarescore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401250084
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
Cc: jroedel@suse.de, gbatra@linux.vnet.ibm.com, sbhat@linux.ibm.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, jgg@ziepe.ca, tpearson@raptorengineering.com, npiggin@gmail.com, bgray@linux.ibm.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit 2ad56efa80db ("powerpc/iommu: Setup a default domain and
remove set_platform_dma_ops") refactored the code removing the
set_platform_dma_ops(). It missed out the table group
release_ownership() call which would have got called otherwise
during the guest shutdown via vfio_group_detach_container(). On
PPC64, this particular call actually sets up the 32-bit TCE table,
and enables the 64-bit DMA bypass etc. Now after guest shutdown,
the subsequent host driver (e.g megaraid-sas) probe post unbind
from vfio-pci fails like,

megaraid_sas 0031:01:00.0: Warning: IOMMU dma not supported: mask 0x7fffffffffffffff, table unavailable
megaraid_sas 0031:01:00.0: Warning: IOMMU dma not supported: mask 0xffffffff, table unavailable
megaraid_sas 0031:01:00.0: Failed to set DMA mask
megaraid_sas 0031:01:00.0: Failed from megasas_init_fw 6539

The patch brings back the call to table_group release_ownership()
call when switching back to PLATFORM domain.

Fixes: 2ad56efa80db ("powerpc/iommu: Setup a default domain and remove set_platform_dma_ops")
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 arch/powerpc/kernel/iommu.c |   16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index ebe259bdd462..ac7df43fa7ef 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1296,9 +1296,19 @@ spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
 	if (!grp)
 		return -ENODEV;
 
-	table_group = iommu_group_get_iommudata(grp);
-	ret = table_group->ops->take_ownership(table_group);
-	iommu_group_put(grp);
+	if (platform_domain->type == IOMMU_DOMAIN_PLATFORM) {
+		ret = 0;
+		table_group = iommu_group_get_iommudata(grp);
+		/*
+		 * The domain being set to PLATFORM from earlier
+		 * BLOCKED. The table_group ownership has to be released.
+		 */
+		table_group->ops->release_ownership(table_group);
+	} else if (platform_domain->type == IOMMU_DOMAIN_BLOCKED) {
+		table_group = iommu_group_get_iommudata(grp);
+		ret = table_group->ops->take_ownership(table_group);
+		iommu_group_put(grp);
+	}
 
 	return ret;
 }


