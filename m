Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD830285E99
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 14:00:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5tFk55j8zDqNL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 23:00:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aYBV5Akf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5t0M4VClzDqGt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 22:49:07 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097BXYSX095176; Wed, 7 Oct 2020 07:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=u98EBEd+eL/XwjhLO9FoiApPSDkcy8Mkl6rO9xwRMuE=;
 b=aYBV5Akf3GrcVkTOPyjwrIJ7lywzr855GcOGXxlamC4s3acGd3m7lC3FIdxR5q6OMaTh
 K6ltE8z68X0a+vycpmj8Mzprzo2AbqN3qCdo+cbFsMZWq2QQwJkFRvK0BzAKRlYjwE+Y
 2pldfYjxSY6djZTBNdC1XhCVDbCoe17hzNVBuik0DPjHMgVH2EYWYJqh0n/N+bcFFUEN
 yHcewfJuUSA2U2Hw/f2S4SlREJEYHLm2B4GWyNqYoNNfMEraRkGXQX1aYjt7n/hf+Tje
 GFwG5gtVs4Om8vuP79uxnsXBIJLIXG7xgbU16XediW9JohAf0gR0Dk59PksMqhNswiJl cQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 341avjcm9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 07:49:02 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 097BliMO017150;
 Wed, 7 Oct 2020 11:49:01 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 3411xd4sbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 11:49:01 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 097Bn0sn22610254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Oct 2020 11:49:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A74D9AC05F;
 Wed,  7 Oct 2020 11:49:00 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E05CDAC059;
 Wed,  7 Oct 2020 11:48:58 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.77.206.190])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  7 Oct 2020 11:48:58 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 4/4] powerpc/lmb-size: Use addr #size-cells value when
 fetching lmb-size
Date: Wed,  7 Oct 2020 17:18:36 +0530
Message-Id: <20201007114836.282468-5-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201007114836.282468-1-aneesh.kumar@linux.ibm.com>
References: <20201007114836.282468-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_08:2020-10-06,
 2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010070079
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
Cc: nathanl@linux.ibm.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make it consistent with other usages.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c        |  7 ++++---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 13 +++++++++----
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 78c5afe98359..f8e9eb49d46b 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -498,7 +498,7 @@ static int __init probe_memory_block_size(unsigned long node, const char *uname,
 					  depth, void *data)
 {
 	unsigned long *mem_block_size = (unsigned long *)data;
-	const __be64 *prop;
+	const __be32 *prop;
 	int len;
 
 	if (depth != 1)
@@ -508,13 +508,14 @@ static int __init probe_memory_block_size(unsigned long node, const char *uname,
 		return 0;
 
 	prop = of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
-	if (!prop || len < sizeof(__be64))
+
+	if (!prop || len < dt_root_size_cells * sizeof(__be32))
 		/*
 		 * Nothing in the device tree
 		 */
 		*mem_block_size = MIN_MEMORY_BLOCK_SIZE;
 	else
-		*mem_block_size = be64_to_cpup(prop);
+		*mem_block_size = of_read_number(prop, dt_root_size_cells);
 	return 1;
 }
 
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 843db91e39aa..f8aef06b29ec 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -30,12 +30,17 @@ unsigned long pseries_memory_block_size(void)
 
 	np = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
 	if (np) {
-		const __be64 *size;
+		int len;
+		int size_cells;
+		const __be32 *prop;
 
-		size = of_get_property(np, "ibm,lmb-size", NULL);
-		if (size)
-			memblock_size = be64_to_cpup(size);
+		size_cells = of_n_size_cells(np);
+
+		prop = of_get_property(np, "ibm,lmb-size", &len);
+		if (prop && len >= size_cells * sizeof(__be32))
+			memblock_size = of_read_number(prop, size_cells);
 		of_node_put(np);
+
 	} else  if (machine_is(pseries)) {
 		/* This fallback really only applies to pseries */
 		unsigned int memzero_size = 0;
-- 
2.26.2

