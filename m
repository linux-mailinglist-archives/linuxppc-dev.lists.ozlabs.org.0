Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1781886F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 15:10:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hZp82SsHzDqGl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 01:10:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hYhN2B2qzDqfF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 00:20:52 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02HDBjlN141892
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 09:20:49 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ytgkv9pef-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 09:20:49 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Tue, 17 Mar 2020 13:20:47 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Mar 2020 13:20:43 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02HDKgZ145744366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 13:20:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BC45A405F;
 Tue, 17 Mar 2020 13:20:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59FE0A4054;
 Tue, 17 Mar 2020 13:20:39 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.71.34])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Mar 2020 13:20:39 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/4] mm/slub: Use mem_node to allocate a new slab
Date: Tue, 17 Mar 2020 18:47:51 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200317131753.4074-1-srikar@linux.vnet.ibm.com>
References: <3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com>
 <20200317131753.4074-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20031713-0020-0000-0000-000003B5E0B4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031713-0021-0000-0000-0000220E451E
Message-Id: <20200317131753.4074-3-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-17_04:2020-03-17,
 2020-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=763
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003170058
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Mel Gorman <mgorman@suse.de>,
 Christopher Lameter <cl@linux.com>, Bharata B Rao <bharata@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently while allocating a slab for a offline node, we use its
associated node_numa_mem to search for a partial slab. If we don't find
a partial slab, we try allocating a slab from the offline node using
__alloc_pages_node. However this is bound to fail.

NIP [c00000000039a300] __alloc_pages_nodemask+0x130/0x3b0
LR [c00000000039a3c4] __alloc_pages_nodemask+0x1f4/0x3b0
Call Trace:
[c0000008b36837f0] [c00000000039a3b4] __alloc_pages_nodemask+0x1e4/0x3b0 (unreliable)
[c0000008b3683870] [c0000000003d1ff8] new_slab+0x128/0xcf0
[c0000008b3683950] [c0000000003d6060] ___slab_alloc+0x410/0x820
[c0000008b3683a40] [c0000000003d64a4] __slab_alloc+0x34/0x60
[c0000008b3683a70] [c0000000003d78b0] __kmalloc_node+0x110/0x490
[c0000008b3683af0] [c000000000343a08] kvmalloc_node+0x58/0x110
[c0000008b3683b30] [c0000000003ffd44] mem_cgroup_css_online+0x104/0x270
[c0000008b3683b90] [c000000000234e08] online_css+0x48/0xd0
[c0000008b3683bc0] [c00000000023dedc] cgroup_apply_control_enable+0x2ec/0x4d0
[c0000008b3683ca0] [c0000000002416f8] cgroup_mkdir+0x228/0x5f0
[c0000008b3683d10] [c000000000520360] kernfs_iop_mkdir+0x90/0xf0
[c0000008b3683d50] [c00000000043e400] vfs_mkdir+0x110/0x230
[c0000008b3683da0] [c000000000441ee0] do_mkdirat+0xb0/0x1a0
[c0000008b3683e20] [c00000000000b278] system_call+0x5c/0x68

Mitigate this by allocating the new slab from the node_numa_mem.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: Mel Gorman <mgorman@suse.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Christopher Lameter <cl@linux.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Kirill Tkhai <ktkhai@virtuozzo.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Bharata B Rao <bharata@linux.ibm.com>

Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 mm/slub.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 1c55bf7892bf..fdf7f38f96e6 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1970,14 +1970,8 @@ static void *get_partial(struct kmem_cache *s, gfp_t flags, int node,
 		struct kmem_cache_cpu *c)
 {
 	void *object;
-	int searchnode = node;
 
-	if (node == NUMA_NO_NODE)
-		searchnode = numa_mem_id();
-	else if (!node_present_pages(node))
-		searchnode = node_to_mem_node(node);
-
-	object = get_partial_node(s, get_node(s, searchnode), c, flags);
+	object = get_partial_node(s, get_node(s, node), c, flags);
 	if (object || node != NUMA_NO_NODE)
 		return object;
 
@@ -2470,6 +2464,11 @@ static inline void *new_slab_objects(struct kmem_cache *s, gfp_t flags,
 
 	WARN_ON_ONCE(s->ctor && (flags & __GFP_ZERO));
 
+	if (node == NUMA_NO_NODE)
+		node = numa_mem_id();
+	else if (!node_present_pages(node))
+		node = node_to_mem_node(node);
+
 	freelist = get_partial(s, flags, node, c);
 
 	if (freelist)
@@ -2569,12 +2568,10 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
 redo:
 
 	if (unlikely(!node_match(page, node))) {
-		int searchnode = node;
-
 		if (node != NUMA_NO_NODE && !node_present_pages(node))
-			searchnode = node_to_mem_node(node);
+			node = node_to_mem_node(node);
 
-		if (unlikely(!node_match(page, searchnode))) {
+		if (unlikely(!node_match(page, node))) {
 			stat(s, ALLOC_NODE_MISMATCH);
 			deactivate_slab(s, page, c->freelist, c);
 			goto new_slab;
-- 
2.18.1

