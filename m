Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9AB189636
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 08:31:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j1tw4r9rzDqvY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 18:31:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j1qQ0Rj7zDqnp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 18:28:33 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I73u8m166913
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 03:28:31 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yucv4v65b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 03:28:31 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Wed, 18 Mar 2020 07:28:29 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Mar 2020 07:28:25 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02I7RM1S17629592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 07:27:22 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6819F4203F;
 Wed, 18 Mar 2020 07:28:23 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAB3542042;
 Wed, 18 Mar 2020 07:28:19 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.106.17])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 Mar 2020 07:28:19 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 1/4] mm: Check for node_online in node_present_pages
Date: Wed, 18 Mar 2020 12:58:07 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318072810.9735-1-srikar@linux.vnet.ibm.com>
References: <20200318072810.9735-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20031807-0008-0000-0000-0000035F2E18
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031807-0009-0000-0000-00004A808795
Message-Id: <20200318072810.9735-2-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_02:2020-03-17,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003180032
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
 Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Mel Gorman <mgorman@suse.de>,
 Christopher Lameter <cl@linux.com>, Bharata B Rao <bharata@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Calling a kmalloc_node on a possible node which is not yet onlined can
lead to panic. Currently node_present_pages() doesn't verify the node is
online before accessing the pgdat for the node. However pgdat struct may
not be available resulting in a crash.

NIP [c0000000003d55f4] ___slab_alloc+0x1f4/0x760
LR [c0000000003d5b94] __slab_alloc+0x34/0x60
Call Trace:
[c0000008b3783960] [c0000000003d5734] ___slab_alloc+0x334/0x760 (unreliable)
[c0000008b3783a40] [c0000000003d5b94] __slab_alloc+0x34/0x60
[c0000008b3783a70] [c0000000003d6fa0] __kmalloc_node+0x110/0x490
[c0000008b3783af0] [c0000000003443d8] kvmalloc_node+0x58/0x110
[c0000008b3783b30] [c0000000003fee38] mem_cgroup_css_online+0x108/0x270
[c0000008b3783b90] [c000000000235aa8] online_css+0x48/0xd0
[c0000008b3783bc0] [c00000000023eaec] cgroup_apply_control_enable+0x2ec/0x4d0
[c0000008b3783ca0] [c000000000242318] cgroup_mkdir+0x228/0x5f0
[c0000008b3783d10] [c00000000051e170] kernfs_iop_mkdir+0x90/0xf0
[c0000008b3783d50] [c00000000043dc00] vfs_mkdir+0x110/0x230
[c0000008b3783da0] [c000000000441c90] do_mkdirat+0xb0/0x1a0
[c0000008b3783e20] [c00000000000b278] system_call+0x5c/0x68

Fix this by verifying the node is online before accessing the pgdat
structure. Fix the same for node_spanned_pages() too.

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
Cc: Nathan Lynch <nathanl@linux.ibm.com>

Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 include/linux/mmzone.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index f3f264826423..88078a3b95e5 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -756,8 +756,10 @@ typedef struct pglist_data {
 	atomic_long_t		vm_stat[NR_VM_NODE_STAT_ITEMS];
 } pg_data_t;
 
-#define node_present_pages(nid)	(NODE_DATA(nid)->node_present_pages)
-#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
+#define node_present_pages(nid)		\
+	(node_online(nid) ? NODE_DATA(nid)->node_present_pages : 0)
+#define node_spanned_pages(nid)		\
+	(node_online(nid) ? NODE_DATA(nid)->node_spanned_pages : 0)
 #ifdef CONFIG_FLAT_NODE_MEM_MAP
 #define pgdat_page_nr(pgdat, pagenr)	((pgdat)->node_mem_map + (pagenr))
 #else
-- 
2.18.1

