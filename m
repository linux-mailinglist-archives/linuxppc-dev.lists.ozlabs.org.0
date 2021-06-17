Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2CE3AADC9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 09:38:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5DS11yM1z3dbg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:38:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EzXhlUXX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EzXhlUXX; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5DPC0CLDz308Y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 17:35:42 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15H7YSZr064710; Thu, 17 Jun 2021 03:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gT2oZLTvmJ7bFhHVoXGzd1+jGcUuC7R/zHMMNYj/Yrg=;
 b=EzXhlUXX/+m5iwO/ookik8lY5oV4+oTpOwewUbjrRHtXPNR9KbJCKKSLYrr8/T59HUX9
 W/dlCBb3MXtfuI70w+5Rr/uR/DurW5MjFwfMP1inHGIhiGVhBlFUrkxqSxebE+CaYAxt
 LNri3ag0tHBbcnEKSir8U83JxPzPHWUWv3gocuAys+H23gCvirr7HaxKanAGhbWNhMZc
 w4GNorxxoyxijTXUp3IB/hbzqOT78ZzxxHq9qMZUu12vvMtiyQUH6xs/wLpfmc/Ysheb
 LtrcSZDI/ZYiBbwuasqppCjN0wLbaTkY129Q1bUm+76ArFZEzI82bOPBseOp3dE71g+H 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3980yaj7up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 03:35:33 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15H7YRAs064641;
 Thu, 17 Jun 2021 03:35:33 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3980yaj7u5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 03:35:32 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15H7WEJZ023250;
 Thu, 17 Jun 2021 07:35:32 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 394mja6tdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 07:35:32 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15H7ZVnB6554514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 07:35:31 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6821C112066;
 Thu, 17 Jun 2021 07:35:31 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC11111206E;
 Thu, 17 Jun 2021 07:35:28 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.31.110])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 07:35:28 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 6/8] powerpc/pseries: Add a helper for form1 cpu distance
Date: Thu, 17 Jun 2021 13:04:56 +0530
Message-Id: <20210617073458.510545-7-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617073458.510545-1-aneesh.kumar@linux.ibm.com>
References: <20210617073458.510545-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: itzdLsfS1GeeYcNG6V3Js-sgnXILerpr
X-Proofpoint-ORIG-GUID: ToSj0Vjr8CArtI-GUx9LnZXX3LjqEYX0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_02:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 mlxscore=0 phishscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170052
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, nvdimm@lists.linux.dev,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, dan.j.williams@intel.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This helper is only used with the dispatch trace log collection.
A later patch will add Form2 affinity support and this change helps
in keeping that simpler. Also add a comment explaining we don't expect
the code to be called with FORM0

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index c481f08d565b..d32729f235b8 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -166,7 +166,7 @@ static void unmap_cpu_from_node(unsigned long cpu)
 }
 #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
 
-int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
+static int __cpu_form1_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 {
 	int dist = 0;
 
@@ -182,6 +182,14 @@ int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 	return dist;
 }
 
+int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
+{
+	/* We should not get called with FORM0 */
+	VM_WARN_ON(affinity_form == FORM0_AFFINITY);
+
+	return __cpu_form1_distance(cpu1_assoc, cpu2_assoc);
+}
+
 /* must hold reference to node during call */
 static const __be32 *of_get_associativity(struct device_node *dev)
 {
-- 
2.31.1

