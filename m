Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D85F036EF6C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 20:19:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWP0q69bgz2yxT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 04:19:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k0SZ1V9n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k0SZ1V9n; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWP0N2V8Xz2xg4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 04:19:15 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TI37AY015183; Thu, 29 Apr 2021 14:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=tNzaY0AITcOJ1D6aYOukbo7/TrCEawyMrXWB4APtCfY=;
 b=k0SZ1V9nB858EBjCyMtQ6+nTeSv2yCGekBwoGN7b+OZUDF7c1/XXnYu9mdHcLcDcmMBp
 fYCG6khL0yDepekiKCfMWrkfjZdef/nxGJQVzmlIIsVVu/+rE5XS5fruftI5k2YZh1mP
 eHGYkGtiG15ClnSWO/z2wWOThWo7Iau5HhPy5nPjRcsZYPFvYlrSYMnvyXpRKJOOqxz8
 clX8Y9iflXZlc28bBWVh+QnN1+u9NLemUL8ZBfW5IFHxxTsssZdt3RBfzZlkE8SzCwXz
 OHRbj9MsVOWn9UqC80uyWOseoHJeIyxXhKz2HbhrrFD6heNxXSLVGaTPUtr+OyOrCREd Mw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3881htrqau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 14:19:08 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TIG0J5006224;
 Thu, 29 Apr 2021 18:19:06 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 384ay8jjne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 18:19:05 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13TIJ2Dg33358110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 18:19:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 231CFA405C;
 Thu, 29 Apr 2021 18:19:02 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0A87A4054;
 Thu, 29 Apr 2021 18:19:01 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.30.132])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 29 Apr 2021 18:19:01 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org
Subject: [PATCH] ppc64/numa: consider the max numa node for migratable LPAR
Date: Thu, 29 Apr 2021 20:19:01 +0200
Message-Id: <20210429181901.17674-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eeE1ccPszK3E8ZIgG8GywJoQMfh8v8er
X-Proofpoint-ORIG-GUID: eeE1ccPszK3E8ZIgG8GywJoQMfh8v8er
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_08:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290116
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a LPAR is migratable, we should consider the maximum possible NUMA
node instead the number of NUMA node from the actual system.

The DT property 'ibm,current-associativity-domains' is defining the maximum
number of nodes the LPAR can see when running on that box. But if the LPAR
is being migrated on another box, it may seen up to the nodes defined by
'ibm,max-associativity-domains'. So if a LPAR is migratable, that value
should be used.

Unfortunately, there is no easy way to know if a LPAR is migratable or
not. The hypervisor is exporting the property 'ibm,migratable-partition' in
the case it set to migrate partition, but that would not mean that the
current partition is migratable.

Without that patch, when a LPAR is started on a 2 nodes box and then
migrated to a 3 nodes box, the hypervisor may spread the LPAR's CPUs on the
3rd node. In that case if a CPU from that 3rd node is added to the LPAR, it
will be wrongly assigned to the node because the kernel has been set to use
up to 2 nodes (the configuration of the departure node). With that patch
applies, the CPU is correctly added to the 3rd node.

Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index f2bf98bdcea2..673fa6e47850 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -893,7 +893,7 @@ static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
 static void __init find_possible_nodes(void)
 {
 	struct device_node *rtas;
-	const __be32 *domains;
+	const __be32 *domains = NULL;
 	int prop_length, max_nodes;
 	u32 i;
 
@@ -909,9 +909,14 @@ static void __init find_possible_nodes(void)
 	 * it doesn't exist, then fallback on ibm,max-associativity-domains.
 	 * Current denotes what the platform can support compared to max
 	 * which denotes what the Hypervisor can support.
+	 *
+	 * If the LPAR is migratable, new nodes might be activated after a LPM,
+	 * so we should consider the max number in that case.
 	 */
-	domains = of_get_property(rtas, "ibm,current-associativity-domains",
-					&prop_length);
+	if (!of_get_property(of_root, "ibm,migratable-partition", NULL))
+		domains = of_get_property(rtas,
+					  "ibm,current-associativity-domains",
+					  &prop_length);
 	if (!domains) {
 		domains = of_get_property(rtas, "ibm,max-associativity-domains",
 					&prop_length);
@@ -920,6 +925,9 @@ static void __init find_possible_nodes(void)
 	}
 
 	max_nodes = of_read_number(&domains[min_common_depth], 1);
+	printk(KERN_INFO "Partition configured for %d NUMA nodes.\n",
+	       max_nodes);
+
 	for (i = 0; i < max_nodes; i++) {
 		if (!node_possible(i))
 			node_set(i, node_possible_map);
-- 
2.31.1

