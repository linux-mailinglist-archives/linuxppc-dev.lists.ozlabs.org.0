Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9658564DC7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 08:39:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lbx4N4X2Dz3btH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 16:39:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BcUT/29y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BcUT/29y;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lbx3h15YDz30LS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 16:39:11 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2646G3C6005074;
	Mon, 4 Jul 2022 06:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Qj3YNZEYqlTD/obmc7ResKquiY/z5yJ+P0dEzb2i7Cg=;
 b=BcUT/29y+JLJa8tUDBukWKV1K7ch2wLhWoO2beeWFN+WgtgHq9zL/FVQfUBWjTOKzeCy
 W6bqGhtk3rc5vRyBgQ05RRltHfSJPiZl0EbL7JQFSDTN+mlE6hFFsaHwdGDAc03rbDmL
 8LLVT1COMSWZWmiX1nikoYRX/rla9597Hx/hz1Nf5POVsbbhdiFUGj9mOgBgnXtjyJCl
 UCrfKiCLNpr4IfLx6mTxigOWk3e9xOyuY1x+ZEG5iJlcm/pcHU7ecX43zbELXVDQwRjq
 UgYi1f30TWR/lHEg8gi4lFOHrq0ciRw/rzFvu7zmFyB7wdzWfJgbHY8QcRA4VNAqbVmy qQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h3tsr0d3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Jul 2022 06:39:03 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2646LiLk020398;
	Mon, 4 Jul 2022 06:39:02 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma01dal.us.ibm.com with ESMTP id 3h2dn9kjjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Jul 2022 06:39:02 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2646d15n12321338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Jul 2022 06:39:01 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F27167805E;
	Mon,  4 Jul 2022 06:39:00 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E0C77805C;
	Mon,  4 Jul 2022 06:38:59 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.74.198])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon,  4 Jul 2022 06:38:58 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/mm: Update max/min_low_pfn in the same function
Date: Mon,  4 Jul 2022 12:08:51 +0530
Message-Id: <20220704063851.295482-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7SzGodVjt5w1WDWLs2TvbVsI0yyVDaiA
X-Proofpoint-GUID: 7SzGodVjt5w1WDWLs2TvbVsI0yyVDaiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-04_05,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=946 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207040027
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

