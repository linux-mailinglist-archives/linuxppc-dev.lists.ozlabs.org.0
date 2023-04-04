Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 736AD6D5770
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 06:15:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrDvb2tDSz3cHs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 14:15:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qDx5zCIm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qDx5zCIm;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrDtg6cTpz2xHJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 14:14:50 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3343bNd5012672;
	Tue, 4 Apr 2023 04:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=VKI9aH5kmBphqrfgmYA/7oEyqeMKddx7ygTrpi5Drig=;
 b=qDx5zCImprxeZkjd8uJwqQF0jeqm+mss9UhNL6bF6HtGn8eIV2yM66CRtvVMFIVnqf3y
 rL7UMh7aimAVhTSkVu1pizza6XkKF2PgCLMy8OtOdYhqFMbgSOZkLtuSUcOzRPMSvs5r
 FGcjgtaMW7xJlgTkGwWzB4vQNrGSrWXgocJc23C1g3ErLR3STQawENuANw7BCuEZH1SU
 ko2EWP57paGzC2wAnYwSvKOUW/R7HOUoF8WNhAeT9bvZGKoFKrTbg4wjcO2gLctDKgrP
 YG9jZOAcrEA5P2S2yOPRUS1QRn0gkjQkCPtDQ2HiY54WU7YfGFiJdzNCeqyMOHS0Vmld Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pr1gbr2sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Apr 2023 04:14:42 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 334405dg023978;
	Tue, 4 Apr 2023 04:14:41 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pr1gbr2sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Apr 2023 04:14:41 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3343lvt5016965;
	Tue, 4 Apr 2023 04:14:41 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3ppc88tktm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Apr 2023 04:14:40 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3344Ed7A33620502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Apr 2023 04:14:39 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B73F5805D;
	Tue,  4 Apr 2023 04:14:39 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14EBD58058;
	Tue,  4 Apr 2023 04:14:37 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.99.195])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Apr 2023 04:14:36 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v2] powerpc/papr_scm: Update the NUMA distance table for the target node
Date: Tue,  4 Apr 2023 09:44:33 +0530
Message-Id: <20230404041433.1781804-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: agNEOFFCCnjlCzu_vwIJF4HdTDPvXOsw
X-Proofpoint-GUID: j3VS9VXoy61P4I3gJf8HGttIQlXyT2PR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_19,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=953 impostorscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040036
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

For a papr scm device on NUMA node 3 distance_lookup_table value for
distance_ref_points_depth = 2 before and after fix is below:

Before fix:
node 3 distance depth 0  - 0
node 3 distance depth 1  - 0
node 4 distance depth 0  - 4
node 4 distance depth 1  - 2
node 5 distance depth 0  - 5
node 5 distance depth 1  - 1

After fix
node 3 distance depth 0  - 3
node 3 distance depth 1  - 1
node 4 distance depth 0  - 4
node 4 distance depth 1  - 2
node 5 distance depth 0  - 5
node 5 distance depth 1  - 1

Without the fix, the nearest numa node to the pmem device(NUMA node 3) will be
picked as 4. After the fix, we get the correct numa node which is 5.

Fixes: da1115fdbd6e ("powerpc/nvdimm: Pick nearby online node if the device node is not online")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
Changes from v1:
* Update commit message
* Update code comment

 arch/powerpc/mm/numa.c                    | 1 +
 arch/powerpc/platforms/pseries/papr_scm.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index b44ce71917d7..16cfe56be05b 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -366,6 +366,7 @@ void update_numa_distance(struct device_node *node)
 	WARN(numa_distance_table[nid][nid] == -1,
 	     "NUMA distance details for node %d not provided\n", nid);
 }
+EXPORT_SYMBOL_GPL(update_numa_distance);
 
 /*
  * ibm,numa-lookup-index-table= {N, domainid1, domainid2, ..... domainidN}
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 2f8385523a13..500b2bd5417c 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -1428,6 +1428,13 @@ static int papr_scm_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	/*
+	 * open firmware  platform device create won't update the
+	 * numa distance table. For papr scm device we use numa_map_to_online_node
+	 * to find the nearest online numa node and that requires corrrect
+	 * distance table information.
+	 */
+	update_numa_distance(dn);
 
 	p = kzalloc(sizeof(*p), GFP_KERNEL);
 	if (!p)
-- 
2.39.2

