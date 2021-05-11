Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C291137A0D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 09:32:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfV4K68TFz309P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 17:32:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tgbhQ4QX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tgbhQ4QX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfV3p5h9Hz2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 17:31:50 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14B75CWW134387; Tue, 11 May 2021 03:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=MIqjaZO00c7j96e3E5odnRjvjW8XfjRSMn2eBpvgxrI=;
 b=tgbhQ4QXHblEWshgsoq+Jv1TJ2u+55ZDak+wVdyyunnmPTBuhZPKXpmN+k/6bL+3iOLK
 nDbEFhwqhDmRJBtNZ03UKul3/RCez04esu5jc/vjXwE0fx/AnxUNIS3H7amAvy/2mH1C
 SU8Eiji68W2SDnUBzSumiCasjaGqDnSD9i/mWld7IpQb9m5EXvod1uMM2j2MX1usL4yL
 cIyiHQkWbGvhci/P2LThmi0enb8VV0npBN4dBeBfGXFggE/mlgLfD7E1u9eJ84etYJFd
 K5kJ5qUDHekG9yg1FLLryV9fvuysH/0u8IUgNxyrzqNoK6X1u6Uv+BwFGb57ifDTVPaZ OA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38fm1tag1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 May 2021 03:31:42 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14B7MW0a004054;
 Tue, 11 May 2021 07:31:40 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 38dhwh9gyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 May 2021 07:31:40 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14B7VcbM33030500
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 May 2021 07:31:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01AED4C05C;
 Tue, 11 May 2021 07:31:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A71774C07E;
 Tue, 11 May 2021 07:31:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.34.120])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 11 May 2021 07:31:37 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org
Subject: [PATCH v2] ppc64/numa: consider the max numa node for migratable LPAR
Date: Tue, 11 May 2021 09:31:36 +0200
Message-Id: <20210511073136.17795-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3N0Xa6K1QIt-ipkp-Nt-4r7gxQiD8Eoy
X-Proofpoint-GUID: 3N0Xa6K1QIt-ipkp-Nt-4r7gxQiD8Eoy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-11_02:2021-05-10,
 2021-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105110053
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

Without this patch, when a LPAR is started on a 2 nodes box and then
migrated to a 3 nodes box, the hypervisor may spread the LPAR's CPUs on the
3rd node. In that case if a CPU from that 3rd node is added to the LPAR, it
will be wrongly assigned to the node because the kernel has been set to use
up to 2 nodes (the configuration of the departure node). With this patch
applies, the CPU is correctly added to the 3rd node.

Fixes: f9f130ff2ec9 ("powerpc/numa: Detect support for coregroup")
Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
V2: Address Srikar's comments
 - Fix the commit message
 - Use pr_info instead printk(KERN_INFO..)
---
 arch/powerpc/mm/numa.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index f2bf98bdcea2..094a1076fd1f 100644
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
@@ -920,6 +925,8 @@ static void __init find_possible_nodes(void)
 	}
 
 	max_nodes = of_read_number(&domains[min_common_depth], 1);
+	pr_info("Partition configured for %d NUMA nodes.\n", max_nodes);
+
 	for (i = 0; i < max_nodes; i++) {
 		if (!node_possible(i))
 			node_set(i, node_possible_map);
-- 
2.31.1

