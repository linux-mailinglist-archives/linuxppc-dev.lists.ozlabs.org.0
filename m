Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 603C183C227
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 13:11:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NRloBHEG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLKRl2Brmz3cXs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 23:11:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NRloBHEG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLKPP3wtXz3cHF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 23:09:13 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40PBkxof011424;
	Thu, 25 Jan 2024 12:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : from : to : cc
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=gG7MWoLavXnDvTTl0ZNI4e07YAFVw1dRRN0uz35CGH8=;
 b=NRloBHEGgwxRhiG9kPGGlqR3Pj4sYFg2s50WNbCZf2HyYHqkTBuxA1/cpO38w7aqpKxX
 9v7WMUYSPMU8V4Q4HLIfQ/tlmeKSL+HBtVcNulZCkJCBvTQri/6d7dJ6WM8jpicmBPCW
 urvy4vuTGSwbgV0H4W1o8VCxBTXwBUcsGQ88+sfjZlvmSM5Gcn5kdjMjvPKeqK6/Qv3K
 ZV6H6xgThKfjkHypE7VxHNKL72w267EkB42bj0Ku0L7mOKaSlbSq64D3HMZaTB0pOR52
 jBAVcqVzysznwaHoOIohfWcRMiQEC1IMA/v7XsVlXudsZFv9xVJORhcyKuUxBcfNzdGc Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vupgph8ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 12:09:00 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40PBm9Xt019389;
	Thu, 25 Jan 2024 12:08:59 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vupgph8tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 12:08:59 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40P9eDin022510;
	Thu, 25 Jan 2024 12:08:58 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vrt0mc2h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 12:08:58 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40PC8tr624969908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jan 2024 12:08:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46F5720040;
	Thu, 25 Jan 2024 12:08:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6FCB20043;
	Thu, 25 Jan 2024 12:08:52 +0000 (GMT)
Received: from ltcd48-lp2.aus.stglab.ibm.com (unknown [9.3.101.175])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jan 2024 12:08:52 +0000 (GMT)
Subject: [PATCH 2/2] iommu: Fix the domain type checks when default_domain is
 set
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: iommu@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Date: Thu, 25 Jan 2024 06:08:52 -0600
Message-ID:  <170618452753.3805.4425669653666211728.stgit@ltcd48-lp2.aus.stglab.ibm.com>
In-Reply-To:  <170618450592.3805.8216395093813382208.stgit@ltcd48-lp2.aus.stglab.ibm.com>
References:  <170618450592.3805.8216395093813382208.stgit@ltcd48-lp2.aus.stglab.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9xLRX-Ci5ldGH1TbQ5_NxrdYVilzJJRA
X-Proofpoint-ORIG-GUID: tjZYyV_h8WBjmfJrXQ754fuCM9NqkNdA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_06,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=989 mlxscore=0 malwarescore=0
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

On PPC64, the iommu_ops.def_domain_type() is not defined and
CONFIG_IOMMU_DMA not enabled. With commit 0f6a90436a57 ("iommu: Do not
use IOMMU_DOMAIN_DMA if CONFIG_IOMMU_DMA is not enabled"), the
iommu_get_default_domain_type() return IOMMU_DOMAIN_IDENTITY. With
commit 2ad56efa80db ("powerpc/iommu: Setup a default domain and remove
set_platform_dma_ops"), the defaule_domain is set wih the type being
PLATFORM. With these two changes, iommu_group_alloc_default_domain()
ends up returning the NULL(with recent changes, ERR_PTR(-EINVAL))
leading to iommu_probe_device() failure and the device has no
iommu_group set in effect. Subsequently, the bind to vfio(VFIO_IOMMU)
fail as the iommu_group is not set for the device.

Make the iommu_get_default_domain_type() to take default_domain->type
into consideration along with default_domain_type() and fix
iommu_group_alloc_default_domain() to not error out if the requested
type is same as default domain type.

Fixes: 2ad56efa80db ("powerpc/iommu: Setup a default domain and remove set_platform_dma_ops")
Fixes: 0f6a90436a57 ("iommu: Do not use IOMMU_DOMAIN_DMA if CONFIG_IOMMU_DMA is not enabled")
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 drivers/iommu/iommu.c |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 68e648b55767..04083a1d9f7e 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -135,6 +135,8 @@ static struct group_device *iommu_group_alloc_device(struct iommu_group *group,
 						     struct device *dev);
 static void __iommu_group_free_device(struct iommu_group *group,
 				      struct group_device *grp_dev);
+static int iommu_get_def_domain_type(struct iommu_group *group,
+				     struct device *dev, int cur_type);
 
 #define IOMMU_GROUP_ATTR(_name, _mode, _show, _store)		\
 struct iommu_group_attribute iommu_group_attr_##_name =		\
@@ -1788,7 +1790,8 @@ __iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 static struct iommu_domain *
 iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 {
-	const struct iommu_ops *ops = dev_iommu_ops(iommu_group_first_dev(group));
+	struct device *dev = iommu_group_first_dev(group);
+	const struct iommu_ops *ops = dev_iommu_ops(dev);
 	struct iommu_domain *dom;
 
 	lockdep_assert_held(&group->mutex);
@@ -1799,7 +1802,7 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 	 * domain. Do not use in new drivers.
 	 */
 	if (ops->default_domain) {
-		if (req_type)
+		if (iommu_get_def_domain_type(group, dev, req_type) != req_type)
 			return ERR_PTR(-EINVAL);
 		return ops->default_domain;
 	}
@@ -1871,10 +1874,13 @@ static int iommu_get_def_domain_type(struct iommu_group *group,
 	const struct iommu_ops *ops = dev_iommu_ops(dev);
 	int type;
 
-	if (!ops->def_domain_type)
+	if (ops->def_domain_type)
+		type = ops->def_domain_type(dev);
+	else if (group->default_domain)
+		type = group->default_domain->type;
+	else
 		return cur_type;
 
-	type = ops->def_domain_type(dev);
 	if (!type || cur_type == type)
 		return cur_type;
 	if (!cur_type)


