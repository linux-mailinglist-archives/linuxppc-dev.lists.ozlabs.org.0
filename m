Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E15CA4323E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 18:35:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HY2Y32L1dz306F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 03:35:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eryn886y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=eryn886y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HY2XC4QpCz2ypT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 03:34:34 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19IFMDRU032581; 
 Mon, 18 Oct 2021 12:34:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=RKHlgz3gAdL1fe9jxCJioN4S/k+Ww44qDDequDBkLpw=;
 b=eryn886yh3ExoFuxCPhW3NdbvRIOgrBdiuXWiez9MNP5HvLk0R6RT38LNKNg+QVaoF8s
 i4qxfsPnaJ1/TNAwnFWa0f6zrL/J9mrICC8iftiDC0h7d0g9R1GHgcp3IeVYg05rehrl
 j/LxA1UJYyCEVblL8Ygi9aaXbCIHZa4p7XkSsyU+rHbnhAVtIicG94FnFsQySfsL0J0n
 hXFA4+/tmnzHGyfp/9F2q4ZMwzQOlIO+R2LfmMtEZpzImMBX6rgCqhhEXvcSlRwxqNSB
 RPHsPZmbKj3LKcP+0ZQHPRVJ5eofx9TyndmQkQc3Coynnl/IC6CX76Dq6hGYdWAI18UN ag== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bsbgq9jqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 12:34:28 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19IGNDOs028464;
 Mon, 18 Oct 2021 16:34:27 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3bqpcak4uf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 16:34:26 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19IGYPmT6161066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 16:34:25 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBA336A057;
 Mon, 18 Oct 2021 16:34:24 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C335D6A058;
 Mon, 18 Oct 2021 16:34:24 +0000 (GMT)
Received: from localhost (unknown [9.211.47.38])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 18 Oct 2021 16:34:24 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries/mobility: ignore ibm,
 platform-facilities updates
Date: Mon, 18 Oct 2021 11:34:24 -0500
Message-Id: <20211018163424.2491472-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8FIEy-1etbdo1xRS5Vc98VCEBvw7f0fP
X-Proofpoint-ORIG-GUID: 8FIEy-1etbdo1xRS5Vc98VCEBvw7f0fP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180096
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
Cc: tyreld@linux.ibm.com, cheloha@linux.ibm.com, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On VMs with NX encryption, compression, and/or RNG offload, these
capabilities are described by nodes in the ibm,platform-facilities device
tree hierarchy:

  $ tree -d /sys/firmware/devicetree/base/ibm,platform-facilities/
  /sys/firmware/devicetree/base/ibm,platform-facilities/
  ├── ibm,compression-v1
  ├── ibm,random-v1
  └── ibm,sym-encryption-v1

  3 directories

The acceleration functions that these nodes describe are not disrupted by
live migration, not even temporarily.

But the post-migration ibm,update-nodes sequence firmware always sends
"delete" messages for this hierarchy, followed by an "add" directive to
reconstruct it via ibm,configure-connector (log with debugging statements
enabled in mobility.c):

  mobility: removing node /ibm,platform-facilities/ibm,random-v1:4294967285
  mobility: removing node /ibm,platform-facilities/ibm,compression-v1:4294967284
  mobility: removing node /ibm,platform-facilities/ibm,sym-encryption-v1:4294967283
  mobility: removing node /ibm,platform-facilities:4294967286
  ...
  mobility: added node /ibm,platform-facilities:4294967286

Note we receive a single "add" message for the entire hierarchy, and what
we receive from the ibm,configure-connector sequence is the top-level
platform-facilities node along with its three children. The debug message
simply reports the parent node and not the whole subtree.

Also, significantly, the nodes added are almost completely equivalent to
the ones removed; even phandles are unchanged. ibm,shared-interrupt-pool in
the leaf nodes is the only property I've observed to differ, and Linux does
not use that. So in practice, the sum of update messages Linux receives for
this hierarchy is equivalent to minor property updates.

We succeed in removing the original hierarchy from the device tree. But the
drivers bound to the leaf nodes are ignorant of this, and do not relinquish
their references. The leaf nodes, still reachable through sysfs, of course
still refer to the now-freed ibm,platform-facilities parent node, which
makes use-after-free possible:

  refcount_t: addition on 0; use-after-free.
  WARNING: CPU: 3 PID: 1706 at lib/refcount.c:25 refcount_warn_saturate+0x164/0x1f0
  refcount_warn_saturate+0x160/0x1f0 (unreliable)
  kobject_get+0xf0/0x100
  of_node_get+0x30/0x50
  of_get_parent+0x50/0xb0
  of_fwnode_get_parent+0x54/0x90
  fwnode_count_parents+0x50/0x150
  fwnode_full_name_string+0x30/0x110
  device_node_string+0x49c/0x790
  vsnprintf+0x1c0/0x4c0
  sprintf+0x44/0x60
  devspec_show+0x34/0x50
  dev_attr_show+0x40/0xa0
  sysfs_kf_seq_show+0xbc/0x200
  kernfs_seq_show+0x44/0x60
  seq_read_iter+0x2a4/0x740
  kernfs_fop_read_iter+0x254/0x2e0
  new_sync_read+0x120/0x190
  vfs_read+0x1d0/0x240

Moreover, the "new" replacement subtree is not correctly added to the
device tree, resulting in ibm,platform-facilities parent node without the
appropriate leaf nodes, and broken symlinks in the sysfs device hierarchy:

  $ tree -d /sys/firmware/devicetree/base/ibm,platform-facilities/
  /sys/firmware/devicetree/base/ibm,platform-facilities/

  0 directories

  $ cd /sys/devices/vio ; find . -xtype l -exec file {} +
  ./ibm,sym-encryption-v1/of_node: broken symbolic link to
    ../../../firmware/devicetree/base/ibm,platform-facilities/ibm,sym-encryption-v1
  ./ibm,random-v1/of_node:         broken symbolic link to
    ../../../firmware/devicetree/base/ibm,platform-facilities/ibm,random-v1
  ./ibm,compression-v1/of_node:    broken symbolic link to
    ../../../firmware/devicetree/base/ibm,platform-facilities/ibm,compression-v1

This is because add_dt_node() -> dlpar_attach_node() attaches only the
parent node returned from configure-connector, ignoring any children. This
should be corrected for the general case, but fixing that won't help with
the stale OF node references, which is the more urgent problem.

One way to address that would be to make the drivers respond to node
removal notifications, so that node references can be dropped
appropriately. But this would likely force the drivers to disrupt active
clients for no useful purpose: equivalent nodes are immediately re-added.
And recall that the acceleration capabilities described by the nodes remain
available throughout the whole process.

The solution I believe to be robust for this situation is to convert
remove+add of a node with an unchanged phandle to an update of the node's
properties in the Linux device tree structure. That would involve changing
and adding a fair amount of code, and may take several iterations to land.

Until that can be realized we have a confirmed use-after-free and the
possibility of memory corruption. So add a limited workaround that
discriminates on the node type, ignoring adds and removes. This should be
amenable to backporting in the meantime.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: 410bccf97881 ("powerpc/pseries: Partition migration in the kernel")
Cc: stable@vger.kernel.org
---
 arch/powerpc/platforms/pseries/mobility.c | 34 +++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index e83e0891272d..210a37a065fb 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -63,6 +63,27 @@ static int mobility_rtas_call(int token, char *buf, s32 scope)
 
 static int delete_dt_node(struct device_node *dn)
 {
+	struct device_node *pdn;
+	bool is_platfac;
+
+	pdn = of_get_parent(dn);
+	is_platfac = of_node_is_type(dn, "ibm,platform-facilities") ||
+		     of_node_is_type(pdn, "ibm,platform-facilities");
+	of_node_put(pdn);
+
+	/*
+	 * The drivers that bind to nodes in the platform-facilities
+	 * hierarchy don't support node removal, and the removal directive
+	 * from firmware is always followed by an add of an equivalent
+	 * node. The capability (e.g. RNG, encryption, compression)
+	 * represented by the node is never interrupted by the migration.
+	 * So ignore changes to this part of the tree.
+	 */
+	if (is_platfac) {
+		pr_notice("ignoring remove operation for %pOFfp\n", dn);
+		return 0;
+	}
+
 	pr_debug("removing node %pOFfp\n", dn);
 	dlpar_detach_node(dn);
 	return 0;
@@ -222,6 +243,19 @@ static int add_dt_node(struct device_node *parent_dn, __be32 drc_index)
 	if (!dn)
 		return -ENOENT;
 
+	/*
+	 * Since delete_dt_node() ignores this node type, this is the
+	 * necessary counterpart. We also know that a platform-facilities
+	 * node returned from dlpar_configure_connector() has children
+	 * attached, and dlpar_attach_node() only adds the parent, leaking
+	 * the children. So ignore these on the add side for now.
+	 */
+	if (of_node_is_type(dn, "ibm,platform-facilities")) {
+		pr_notice("ignoring add operation for %pOF\n", dn);
+		dlpar_free_cc_nodes(dn);
+		return 0;
+	}
+
 	rc = dlpar_attach_node(dn, parent_dn);
 	if (rc)
 		dlpar_free_cc_nodes(dn);
-- 
2.31.1

