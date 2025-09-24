Return-Path: <linuxppc-dev+bounces-12565-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BFEB9B8A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Sep 2025 20:41:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cX5Kb6XXRz3cZ2;
	Thu, 25 Sep 2025 04:41:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758739299;
	cv=none; b=mr6lEFBP6ePsmuYrvUAxsbEIv8Kh9ymejWs3LQYHagy8F0wN82RNm5g669FdjLbF2E+IetzbbVqdJ2lrpfAHaxTYNViP1614QzaXfgFY2A0zh2vEz3Qhqbo2J4a7ucuxJnfXFSPtQt/g5qqJFFrbomNeMrBrDUdhl0QuZNutdIo1v/9b8tEbUOY0cpSHxaeHu2FwGlPDi49BOMH7YTWSKnw95/DBHy5iZq2ezXdxSObk1oTj1DEYzFxxY4PGicAChN/IaqCj+tfkjaCssJyhSshJJNPbt5adSLk00Ldwn7iOOGR/KboRCRegJOX+B9z2jB0WHybzaQhzZIVJiZtY8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758739299; c=relaxed/relaxed;
	bh=PHCLozNs8XzpOCtAz+k9sPOC3h5UT0PplDyJSKTs6KU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bKyxuRRkqbb9bL69teFRWHxp+jlq3u9nb7uKsmIyA+q9HUSMsCMK9XgNRXvvJDIYYLkU+r2csWwKSKQzyKztW56S4t0mISsDrfrkFudxcI1/jx5vtsn90yai2Uxd67oXYfMI12h7GReX/B4xo7WDnk3r6UH84NEhpNHauy2IgskUC6Z3O7YpGq5hou2IzykuxlIMcu5ljzLWdBfT0RNuh67wUYXo33oZGyqTZ9+Os7z6L6qyECngnv82qc4SjA/L9V43YOsFrfk4q0+d0dWFS9EtjidFjSXPhLd+1oSCZUfk3UBaarAcsWVGfd5Oc2LAaS7bZq/ky3FK80k8YhwTBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eiaXysNV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eiaXysNV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cX5Kb0gHBz2yqg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 04:41:38 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODJW4k018428;
	Wed, 24 Sep 2025 18:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=PHCLozNs8XzpOCtAz
	+k9sPOC3h5UT0PplDyJSKTs6KU=; b=eiaXysNVGMMjCsw2yqwL2NrHEZseoY7m+
	5x0QXOff0iKT9a0F0tdHN1mjTko/uYDcB9GbWHDDZb3Fps0wx/56pWV1ioRTDY7s
	9EQklTbL0zpPoWDKY1/I0wX4P32F5+N1cx5fb/rGx7MAyxduRnzt45mj5O/N59Q4
	MXBkejaf3kEBXnXh09C3YOfONLtwIYuw/LQnN1icpkdcmrbXuSZFZ2wiqPIe8zWD
	jB74gzEaiHnxfWzw/noWj2jT+wyPkcX9N0ONEbqC646zXew49LQu7OqOFYru1zlP
	xIXiKqApnCuxr2wjNkpF8Ud4g2EWAa/3Zl/oyafQ0w6w5g7M/hcMg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499kwyrjxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 18:41:25 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58OIeGjU030341;
	Wed, 24 Sep 2025 18:41:25 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499kwyrjxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 18:41:25 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58OHEY4v019709;
	Wed, 24 Sep 2025 18:41:24 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49a83ka0cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 18:41:24 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58OIfKEJ23068968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Sep 2025 18:41:20 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 009C320043;
	Wed, 24 Sep 2025 18:41:20 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0FB620040;
	Wed, 24 Sep 2025 18:41:15 +0000 (GMT)
Received: from li-218185cc-29b5-11b2-a85c-9a1300ae2e6e.ibm.com.com (unknown [9.39.28.85])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 24 Sep 2025 18:41:15 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Dave Jiang <dave.jiang@intel.com>, Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH 2/2] drivers/base/node: merge unregister_one_node() and unregister_node() to a single function.
Date: Thu, 25 Sep 2025 00:10:51 +0530
Message-ID: <c99d97e253378455f1b3b7bec5b0c830d4e73074.1758736423.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758736423.git.donettom@linux.ibm.com>
References: <cover.1758736423.git.donettom@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=J5Cq7BnS c=1 sm=1 tr=0 ts=68d43b55 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=sw-la1bpkcxN7rInSZYA:9
X-Proofpoint-GUID: 8z-p1hcRXPahib9S9HXeS57-bo1XE31D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxNSBTYWx0ZWRfX3psyah9vGzdF
 uGK2zJuP1W5l8Et2tLHmn/Y521Z6H3+76RoP0GPGB69mMb34qjvJVDHfCZBw08troUzQW8RPsWk
 Tdk7ekxgo50w6DKFZLm1tSp/c2P5CgMVAYutoNxufhwTYGuP9aHeN3UsG0oogIGtQgQfp5M0jVd
 7xA2tbWPGiV+OfrT+5eazGbephUXNlISC2BAr7zOAlwLICF+Y3zw7x5Hu0woaIVf3Ndhu4Gw/Zj
 bvifJCXIJNFszFpKQ11FRx21T036Zc3PvcSBVV58Mh0uKssGNnTuflfcX+szCwm5JralgUC8S7O
 6jz86Bq//CJ/IV894jjyMPuS5EtpNBz+c4ipsqvImXQIiTU2G5smwWQ8/Z6lAIyzrA+3huKX1dQ
 lrniVGl1
X-Proofpoint-ORIG-GUID: mwJEkKJ0QQId_Sm7pkbfjDCvGd3WXx2e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1011 adultscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200015
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

unregister_one_node() and unregister_node() are small functions.
This patch merges them into a single function named unregister_node()
to improve code readability.

No functional changes are introduced.

Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
 drivers/base/node.c  | 37 +++++++++++++++++--------------------
 include/linux/node.h |  6 ++----
 mm/memory_hotplug.c  |  4 ++--
 3 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index eab620e29c78..d460c1675c77 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -638,23 +638,6 @@ static void node_device_release(struct device *dev)
 	kfree(to_node(dev));
 }
 
-/**
- * unregister_node - unregister a node device
- * @node: node going away
- *
- * Unregisters a node device @node.  All the devices on the node must be
- * unregistered before calling this function.
- */
-void unregister_node(struct node *node)
-{
-	hugetlb_unregister_node(node);
-	compaction_unregister_node(node);
-	reclaim_unregister_node(node);
-	node_remove_accesses(node);
-	node_remove_caches(node);
-	device_unregister(&node->dev);
-}
-
 struct node *node_devices[MAX_NUMNODES];
 
 /*
@@ -887,12 +870,26 @@ int register_node(int nid)
 	return error;
 }
 
-void unregister_one_node(int nid)
+/**
+ * unregister_node - unregister a node device
+ * @nid: nid of the node going away
+ *
+ * Unregisters the node device at node id  @nid.  All the devices on the
+ * node must be unregistered before calling this function.
+ */
+void unregister_node(int nid)
 {
-	if (!node_devices[nid])
+	struct node *node = node_devices[nid];
+
+	if (!node)
 		return;
 
-	unregister_node(node_devices[nid]);
+	hugetlb_unregister_node(node);
+	compaction_unregister_node(node);
+	reclaim_unregister_node(node);
+	node_remove_accesses(node);
+	node_remove_caches(node);
+	device_unregister(&node->dev);
 	node_devices[nid] = NULL;
 }
 
diff --git a/include/linux/node.h b/include/linux/node.h
index 4dcf876cd0b4..d721127964b3 100644
--- a/include/linux/node.h
+++ b/include/linux/node.h
@@ -124,8 +124,6 @@ static inline void register_memory_blocks_under_nodes(void)
 }
 #endif
 
-extern void unregister_node(struct node *node);
-
 struct node_notify {
 	int nid;
 };
@@ -169,7 +167,7 @@ static inline int hotplug_node_notifier(notifier_fn_t fn, int pri)
 extern void node_dev_init(void);
 /* Core of the node registration - only memory hotplug should use this */
 extern int register_node(int nid);
-extern void unregister_one_node(int nid);
+extern void unregister_node(int nid);
 extern int register_cpu_under_node(unsigned int cpu, unsigned int nid);
 extern int unregister_cpu_under_node(unsigned int cpu, unsigned int nid);
 extern void unregister_memory_block_under_nodes(struct memory_block *mem_blk);
@@ -185,7 +183,7 @@ static inline int register_node(int nid)
 {
 	return 0;
 }
-static inline int unregister_one_node(int nid)
+static inline int unregister_node(int nid)
 {
 	return 0;
 }
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 6c050d867031..94a8f6e8811a 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1596,7 +1596,7 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 error:
 	if (new_node) {
 		node_set_offline(nid);
-		unregister_one_node(nid);
+		unregister_node(nid);
 	}
 error_memblock_remove:
 	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK))
@@ -2201,7 +2201,7 @@ void try_offline_node(int nid)
 	 * node now.
 	 */
 	node_set_offline(nid);
-	unregister_one_node(nid);
+	unregister_node(nid);
 }
 EXPORT_SYMBOL(try_offline_node);
 
-- 
2.51.0


