Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E746D04D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 14:36:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnNFK50vWz3fTM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 23:36:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pWQn/B4M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pWQn/B4M;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnNDT2WKLz3bh8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 23:35:20 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32UBqWdb030820;
	Thu, 30 Mar 2023 12:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=hArjTQXcD5roCtMSgLmZrJhf++lquJ+tD5ZrBUtgW6c=;
 b=pWQn/B4MMRahAnIy3b4lDSvqpFg6H0dzELCRqujZv79rs1m65nlCJyrCnIHMbGQtlzAw
 6gxUONx75iOis3MxADLC0+crW5jZBQdC5Q4mNSVD6gO0i+JSSklYyOyuVKS0XpaeDNEO
 0xcZvXVHq2yfHb1UqceheOhvKLOcgilFq5KRyyAPx/tE6aqq6r+2C8m1Uur77w0XLBxm
 dyciKVUDRJcn4s/gcjxuug5d0j/T7G1fR1AopBdqiymuG8lW73rq8+CxUYr9E6+I13Ch
 q9Rvw/sa6uPwFxSFFAnldXyFa/erh+5aQa+k0TtSaukB1lHm6n8J9srJKx8GBsDy7fUm TA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmph9f21d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 12:35:11 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32UBmAS5022873;
	Thu, 30 Mar 2023 12:35:11 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmph9f213-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 12:35:11 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32UAjiAo019786;
	Thu, 30 Mar 2023 12:35:10 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3phrk82ra5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 12:35:10 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32UCZ8Yr459368
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Mar 2023 12:35:09 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAAA258063;
	Thu, 30 Mar 2023 12:35:08 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D7C758059;
	Thu, 30 Mar 2023 12:35:06 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.103.32])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Mar 2023 12:35:05 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc/papr_scm: Update the NUMA distance table for the target node
Date: Thu, 30 Mar 2023 18:05:02 +0530
Message-Id: <20230330123502.1524429-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u_NGBSuiRFHQL8VnEG6499_GmaBP9tbQ
X-Proofpoint-ORIG-GUID: nVCuzDjimGNMMKpoL79cxCoOg_10i7rQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_07,2023-03-30_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 lowpriorityscore=0 mlxlogscore=918 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303300101
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

platform device helper routines won't update the NUMA distance table
while creating a platform device, even if the device is present on
a NUMA node that doesn't have memory or CPU. This is especially true
for pmem devices. If the target node of the pmem device is not online, we
find the nearest online node to the device and associate the pmem
device with that online node. To find the nearest online node, we should
have the numa distance table updated correctly. Update the distance
information during the device probe.

distance_lookup_table value for distance_ref_points_depth = 2 before and after
fix is below
node 3 distance depth 0  - 0
node 3 distance depth 1  - 0
node 4 distance depth 0  - 4
node 4 distance depth 1  - 2
node 5 distance depth 0  - 5
node 5 distance depth 1  - 1

after fix
node 3 distance depth 0  - 3
node 3 distance depth 1  - 1
node 4 distance depth 0  - 4
node 4 distance depth 1  - 2
node 5 distance depth 0  - 5
node 5 distance depth 1  - 1

Without the fix, the nearest numa node to the pmem device will be picked as 4.
After the fix, we get the correct numa node which is 5.

Fixes: da1115fdbd6e ("powerpc/nvdimm: Pick nearby online node if the device node is not online")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 2f8385523a13..5bef75714bd5 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -1428,6 +1428,10 @@ static int papr_scm_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	/*
+	 * of platform device create won't update the numa distance table
+	 */
+	update_numa_distance(dn);
 
 	p = kzalloc(sizeof(*p), GFP_KERNEL);
 	if (!p)
-- 
2.39.2

