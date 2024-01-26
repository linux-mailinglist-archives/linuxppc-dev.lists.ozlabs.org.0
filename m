Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4290983DD13
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 16:10:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dSDx1zsx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TM1NB11Yqz3bqB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 02:10:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dSDx1zsx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TM1MK3J1jz2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jan 2024 02:09:48 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40QEWUt0016460;
	Fri, 26 Jan 2024 15:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=EMfDROFbgJEi008tLRtRfT5S/vVzIQIrctpoV9Kn3Kk=;
 b=dSDx1zsxQ7vx+0ifKCtclKF1SH3AuEsQzf0vjxAhom2XNuLpwk/SVB0C4lwCV+USmygd
 twrkr745XknJkghyH0974ZZpMZ1A+EPU7l+DorkdVAU2z3Ahei88CYFyeBWzVnUIuuXB
 TLHc0kQPGvoJbd9W9BVbFgLRgtubddA2Pg6QINrPUpyq1KIhTWwlNOuQo45YKl4BYORR
 GV60paUIHtCOW2pb6cx5c6PAG3BrpWSm7dCxMjaXCF4/mK6pYBiKq1PfVg+T4HbVleQO
 dTHobHKLofwZKH1JKk9WkuIsK9NMe78OkK3Wg8lpBnX7HDhsguKh7DFjYrg6TnnoPu/O zg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vvek90wjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 15:09:26 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40QF7XKX006293;
	Fri, 26 Jan 2024 15:09:26 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vvek90wja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 15:09:26 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40QD78IV028239;
	Fri, 26 Jan 2024 15:09:25 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vru732xwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 15:09:25 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40QF9MJK27460100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jan 2024 15:09:22 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 348192004B;
	Fri, 26 Jan 2024 15:09:22 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A624320049;
	Fri, 26 Jan 2024 15:09:19 +0000 (GMT)
Received: from ltcd48-lp2.aus.stglab.ibm.com (unknown [9.3.101.175])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Jan 2024 15:09:19 +0000 (GMT)
Subject: [PATCH v2] powerpc: iommu: Bring back table group release_ownership()
 call
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: iommu@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Date: Fri, 26 Jan 2024 09:09:18 -0600
Message-ID:  <170628173462.3742.18330000394415935845.stgit@ltcd48-lp2.aus.stglab.ibm.com>
User-Agent: StGit/1.5
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YFJalwNzOQy4a9hjiadrOA2gTSIYVP95
X-Proofpoint-ORIG-GUID: W4cEKw2h2TRDXchVH7azbDxp1mZ68xEa
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401260111
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
call when switching back to PLATFORM domain from BLOCKED, while
also separates the domain_ops for both.

Fixes: 2ad56efa80db ("powerpc/iommu: Setup a default domain and remove set_platform_dma_ops")
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
Changelog:
v1: https://lore.kernel.org/linux-iommu/170618451433.3805.9015493852395837391.stgit@ltcd48-lp2.aus.stglab.ibm.com/
 - Split the common attach_dev call to platform and blocked attach_dev
   calls as suggested.

 arch/powerpc/kernel/iommu.c |   37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index ebe259bdd462..d71eac3b2887 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1287,20 +1287,20 @@ spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct iommu_group *grp = iommu_group_get(dev);
 	struct iommu_table_group *table_group;
-	int ret = -EINVAL;

 	/* At first attach the ownership is already set */
 	if (!domain)
 		return 0;

-	if (!grp)
-		return -ENODEV;
-
 	table_group = iommu_group_get_iommudata(grp);
-	ret = table_group->ops->take_ownership(table_group);
+	/*
+	 * The domain being set to PLATFORM from earlier
+	 * BLOCKED. The table_group ownership has to be released.
+	 */
+	table_group->ops->release_ownership(table_group);
 	iommu_group_put(grp);

-	return ret;
+	return 0;
 }

 static const struct iommu_domain_ops spapr_tce_platform_domain_ops = {
@@ -1312,13 +1312,32 @@ static struct iommu_domain spapr_tce_platform_domain = {
 	.ops = &spapr_tce_platform_domain_ops,
 };

-static struct iommu_domain spapr_tce_blocked_domain = {
-	.type = IOMMU_DOMAIN_BLOCKED,
+static int
+spapr_tce_blocked_iommu_attach_dev(struct iommu_domain *platform_domain,
+				     struct device *dev)
+{
+	struct iommu_group *grp = iommu_group_get(dev);
+	struct iommu_table_group *table_group;
+	int ret = -EINVAL;
+
 	/*
 	 * FIXME: SPAPR mixes blocked and platform behaviors, the blocked domain
 	 * also sets the dma_api ops
 	 */
-	.ops = &spapr_tce_platform_domain_ops,
+	table_group = iommu_group_get_iommudata(grp);
+	ret = table_group->ops->take_ownership(table_group);
+	iommu_group_put(grp);
+
+	return ret;
+}
+
+static const struct iommu_domain_ops spapr_tce_blocked_domain_ops = {
+	.attach_dev = spapr_tce_blocked_iommu_attach_dev,
+};
+
+static struct iommu_domain spapr_tce_blocked_domain = {
+	.type = IOMMU_DOMAIN_BLOCKED,
+	.ops = &spapr_tce_blocked_domain_ops,
 };

 static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)


