Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 423458564EC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 14:53:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cQOGi2Iu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbGkJ1grjz3vYG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 00:53:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cQOGi2Iu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbGjV5lNFz3bwd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 00:53:02 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FCvRXM009209;
	Thu, 15 Feb 2024 13:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=u2UUA63atDGlasutKgLg9ypixbU9NrFIFvQhqKA4BPI=;
 b=cQOGi2IukbXELYxoiJV/7uSD/Ewny89qiK8IxOsb/Ma0UjCMSW97HuRQT/jn6hJeT/BQ
 i6GSUIfEFC3L8+P2lg9nuCyua1CZE3MN27HGYhjpk7hKuPcJaHc3QDH/0cz+ZGETLXS7
 RMAcjHXgbiAP7cHdHBa1aFkyI7AzEQt2tmmY3y9SwSBbV4sS6IO4sqKESmjVai3D00fY
 pWz5SCbs3OY2hfZ6ypMDuxU66Dipn+Ul1nSvv+Ju+b+xWRj0j6y0J93Yqfih3PTSCg3J
 OpT2v0X95z/T1rVC1AQrc5A9FqBUixtbAyoIY75bgXBGLHkrWwL1m2cMRypomYX1Uy/o JA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9k2nhqap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 13:52:42 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41FCveCl010018;
	Thu, 15 Feb 2024 13:52:42 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9k2nhqa6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 13:52:41 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FCht0W010063;
	Thu, 15 Feb 2024 13:52:40 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6npm4nqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 13:52:40 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FDqaL724314534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 13:52:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF04D2005A;
	Thu, 15 Feb 2024 13:52:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B3AD20043;
	Thu, 15 Feb 2024 13:52:33 +0000 (GMT)
Received: from ltcd48-lp2.aus.stglabs.ibm.com (unknown [9.3.101.175])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 13:52:33 +0000 (GMT)
Subject: [PATCH] powerpc/iommu: Refactor spapr_tce_platform_iommu_attach_dev()
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: iommu@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Date: Thu, 15 Feb 2024 07:52:32 -0600
Message-ID: <170800513841.2411.13524607664262048895.stgit@linux.ibm.com>
User-Agent: StGit/1.5
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qqF8oKuU6pAzX4ZsyxvsmAUumSXTlYBo
X-Proofpoint-GUID: Z9sxR3HwDIqpvMoUcjbcZDoBX1rk4RER
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_12,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=452 suspectscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150111
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
Cc: venkat88@linux.vnet.ibm.com, jroedel@suse.de, gbatra@linux.vnet.ibm.com, sbhat@linux.ibm.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, jgg@ziepe.ca, tpearson@raptorengineering.com, npiggin@gmail.com, bgray@linux.ibm.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch makes the iommu_group_get() call only when using it
thereby avoiding the unnecessary get & put for domain already
being set case.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
Changelog:
v2: https://lore.kernel.org/linux-iommu/170793401503.7491.9431631474642074097.stgit@linux.ibm.com/
 - As the v1 itself was merged, the patch was suggested to be reposted as
   cleanup/refactoring to be applied on top of v1.
 - Removed the versioning as this is actually new cleanup/refactoring.
 - Retaining the Reviewed-by as the effective new code was actually reviewed.

v1: https://lore.kernel.org/all/170784021983.6249.10039296655906636112.stgit@linux.ibm.com/
 - Minor refactor to call the iommu_get_group only if required.
 - Updated the title, description and signature(Closes/Reported-by).

 arch/powerpc/kernel/iommu.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index a9bebfd56b3b..37fae3bd89c6 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1285,15 +1285,14 @@ spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
 				    struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct iommu_group *grp = iommu_group_get(dev);
 	struct iommu_table_group *table_group;
+	struct iommu_group *grp;

 	/* At first attach the ownership is already set */
-	if (!domain) {
-		iommu_group_put(grp);
+	if (!domain)
 		return 0;
-	}

+	grp = iommu_group_get(dev);
 	table_group = iommu_group_get_iommudata(grp);
 	/*
 	 * The domain being set to PLATFORM from earlier


