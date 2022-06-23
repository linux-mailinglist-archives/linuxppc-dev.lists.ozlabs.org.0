Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D51D557A56
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 14:30:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTKN01pMmz3cff
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 22:30:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q1gl5buX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q1gl5buX;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTKML4Trlz3bk7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 22:29:50 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NAQYEA027943;
	Thu, 23 Jun 2022 12:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Qj3YNZEYqlTD/obmc7ResKquiY/z5yJ+P0dEzb2i7Cg=;
 b=q1gl5buXMVaxxsHqdY3Ym9rlpLP6rgMoOeYXApIXYZ9IODId3HlkoHZCgct6ADyfo014
 lOvH6zGHcn3JX48ajmlV1PsAfBiMSnunIc8FDtJgJxbvIxJys88zvUpzb7a5bdW2R1Kc
 rPy9qX8aGZiMv0KF2HgrUEQ8tCsi2PgN0DQtkBpHJu9FtG0riUjCc7spKQIt9dJZkY0+
 ve0NTK++q8k5/PK/3Q35IKvwD5WzzkYdc1p6UwVSNs9/7PdBt9VVJUAI64QTHdRdaCGD
 O0SWbTpzeBgBLrjlvznsl3ywAuPHwoHogf0WdANg5UrLR0K+Uyvdv1ZiBZXwYQ/IbES9 0Q== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gvmfhpqxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jun 2022 12:29:42 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25NCKT23028658;
	Thu, 23 Jun 2022 12:29:41 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma01dal.us.ibm.com with ESMTP id 3guk92mjub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jun 2022 12:29:41 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25NCTelF39911920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jun 2022 12:29:40 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E3AD2805E;
	Thu, 23 Jun 2022 12:29:40 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B57728059;
	Thu, 23 Jun 2022 12:29:38 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.18.68])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jun 2022 12:29:38 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 2/3] powerpc/mm: Update max/min_low_pfn in the same function
Date: Thu, 23 Jun 2022 17:59:21 +0530
Message-Id: <20220623122922.640980-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623122922.640980-1-aneesh.kumar@linux.ibm.com>
References: <20220623122922.640980-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W38rCs6DVUqOFs3BtnxNiVpGY2-S6j3Z
X-Proofpoint-ORIG-GUID: W38rCs6DVUqOFs3BtnxNiVpGY2-S6j3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_05,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxlogscore=935 suspectscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206230049
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
Cc: linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For both CONFIG_NUMA enabled/disabled use mem_topology_setup to
update max/min_low_pfn.

This also add min_low_pfn update to CONFIG_NUMA which was initialized
to zero before.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 0801b2ce9b7d..b44ce71917d7 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1160,6 +1160,9 @@ void __init mem_topology_setup(void)
 {
 	int cpu;
 
+	max_low_pfn = max_pfn = memblock_end_of_DRAM() >> PAGE_SHIFT;
+	min_low_pfn = MEMORY_START >> PAGE_SHIFT;
+
 	/*
 	 * Linux/mm assumes node 0 to be online at boot. However this is not
 	 * true on PowerPC, where node 0 is similar to any other node, it
@@ -1204,9 +1207,6 @@ void __init initmem_init(void)
 {
 	int nid;
 
-	max_low_pfn = memblock_end_of_DRAM() >> PAGE_SHIFT;
-	max_pfn = max_low_pfn;
-
 	memblock_dump_all();
 
 	for_each_online_node(nid) {
-- 
2.36.1

