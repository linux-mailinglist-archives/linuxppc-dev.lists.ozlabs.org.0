Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CECF283B87
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 23:36:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4637J014cgzDqxl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 07:36:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y5g7Mwi9"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4637Dn3Wd8zDqG9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 07:34:01 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95BF42089E;
 Tue,  6 Aug 2019 21:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565127238;
 bh=w7ZeJ1UA06evD7HjvkGhJg55AF7OGY6ypOUX9UQQZck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y5g7Mwi9I66TpqSc77Td1wGn8Za03ghFwgTuD9lWxH3y9zXM0wB46m49t6kuAGWqt
 x9Fp4/R8++WoFLHRyMWG3L34AvlLKQg2C61wq4+ulrppyZFhDE8+lKPYQwXSeonR3W
 5fjlCnvQwYF5XE/yrsvPprUQc230trPU8g+uR1cw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 21/59] powerpc/nvdimm: Pick nearby online node if
 the device node is not online
Date: Tue,  6 Aug 2019 17:32:41 -0400
Message-Id: <20190806213319.19203-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806213319.19203-1-sashal@kernel.org>
References: <20190806213319.19203-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

[ Upstream commit da1115fdbd6e86c62185cdd2b4bf7add39f2f82b ]

Currently, nvdimm subsystem expects the device numa node for SCM device to be
an online node. It also doesn't try to bring the device numa node online. Hence
if we use a non-online numa node as device node we hit crashes like below. This
is because we try to access uninitialized NODE_DATA in different code paths.

cpu 0x0: Vector: 300 (Data Access) at [c0000000fac53170]
    pc: c0000000004bbc50: ___slab_alloc+0x120/0xca0
    lr: c0000000004bc834: __slab_alloc+0x64/0xc0
    sp: c0000000fac53400
   msr: 8000000002009033
   dar: 73e8
 dsisr: 80000
  current = 0xc0000000fabb6d80
  paca    = 0xc000000003870000   irqmask: 0x03   irq_happened: 0x01
    pid   = 7, comm = kworker/u16:0
Linux version 5.2.0-06234-g76bd729b2644 (kvaneesh@ltc-boston123) (gcc version 7.4.0 (Ubuntu 7.4.0-1ubuntu1~18.04.1)) #135 SMP Thu Jul 11 05:36:30 CDT 2019
enter ? for help
[link register   ] c0000000004bc834 __slab_alloc+0x64/0xc0
[c0000000fac53400] c0000000fac53480 (unreliable)
[c0000000fac53500] c0000000004bc818 __slab_alloc+0x48/0xc0
[c0000000fac53560] c0000000004c30a0 __kmalloc_node_track_caller+0x3c0/0x6b0
[c0000000fac535d0] c000000000cfafe4 devm_kmalloc+0x74/0xc0
[c0000000fac53600] c000000000d69434 nd_region_activate+0x144/0x560
[c0000000fac536d0] c000000000d6b19c nd_region_probe+0x17c/0x370
[c0000000fac537b0] c000000000d6349c nvdimm_bus_probe+0x10c/0x230
[c0000000fac53840] c000000000cf3cc4 really_probe+0x254/0x4e0
[c0000000fac538d0] c000000000cf429c driver_probe_device+0x16c/0x1e0
[c0000000fac53950] c000000000cf0b44 bus_for_each_drv+0x94/0x130
[c0000000fac539b0] c000000000cf392c __device_attach+0xdc/0x200
[c0000000fac53a50] c000000000cf231c bus_probe_device+0x4c/0xf0
[c0000000fac53a90] c000000000ced268 device_add+0x528/0x810
[c0000000fac53b60] c000000000d62a58 nd_async_device_register+0x28/0xa0
[c0000000fac53bd0] c0000000001ccb8c async_run_entry_fn+0xcc/0x1f0
[c0000000fac53c50] c0000000001bcd9c process_one_work+0x46c/0x860
[c0000000fac53d20] c0000000001bd4f4 worker_thread+0x364/0x5f0
[c0000000fac53db0] c0000000001c7260 kthread+0x1b0/0x1c0
[c0000000fac53e20] c00000000000b954 ret_from_kernel_thread+0x5c/0x68

The patch tries to fix this by picking the nearest online node as the SCM node.
This does have a problem of us losing the information that SCM node is
equidistant from two other online nodes. If applications need to understand these
fine-grained details we should express then like x86 does via
/sys/devices/system/node/nodeX/accessY/initiators/

With the patch we get

 # numactl -H
available: 2 nodes (0-1)
node 0 cpus:
node 0 size: 0 MB
node 0 free: 0 MB
node 1 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
node 1 size: 130865 MB
node 1 free: 129130 MB
node distances:
node   0   1
  0:  10  20
  1:  20  10
 # cat /sys/bus/nd/devices/region0/numa_node
0
 # dmesg | grep papr_scm
[   91.332305] papr_scm ibm,persistent-memory:ibm,pmemory@44104001: Region registered with target node 2 and online node 0

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20190729095128.23707-1-aneesh.kumar@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 29 +++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 96c53b23e58f9..30af5019a68fe 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -194,12 +194,32 @@ static const struct attribute_group *papr_scm_dimm_groups[] = {
 	NULL,
 };
 
+static inline int papr_scm_node(int node)
+{
+	int min_dist = INT_MAX, dist;
+	int nid, min_node;
+
+	if ((node == NUMA_NO_NODE) || node_online(node))
+		return node;
+
+	min_node = first_online_node;
+	for_each_online_node(nid) {
+		dist = node_distance(node, nid);
+		if (dist < min_dist) {
+			min_dist = dist;
+			min_node = nid;
+		}
+	}
+	return min_node;
+}
+
 static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 {
 	struct device *dev = &p->pdev->dev;
 	struct nd_mapping_desc mapping;
 	struct nd_region_desc ndr_desc;
 	unsigned long dimm_flags;
+	int target_nid, online_nid;
 
 	p->bus_desc.ndctl = papr_scm_ndctl;
 	p->bus_desc.module = THIS_MODULE;
@@ -238,8 +258,10 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 
 	memset(&ndr_desc, 0, sizeof(ndr_desc));
 	ndr_desc.attr_groups = region_attr_groups;
-	ndr_desc.numa_node = dev_to_node(&p->pdev->dev);
-	ndr_desc.target_node = ndr_desc.numa_node;
+	target_nid = dev_to_node(&p->pdev->dev);
+	online_nid = papr_scm_node(target_nid);
+	ndr_desc.numa_node = online_nid;
+	ndr_desc.target_node = target_nid;
 	ndr_desc.res = &p->res;
 	ndr_desc.of_node = p->dn;
 	ndr_desc.provider_data = p;
@@ -254,6 +276,9 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 				ndr_desc.res, p->dn);
 		goto err;
 	}
+	if (target_nid != online_nid)
+		dev_info(dev, "Region registered with target node %d and online node %d",
+			 target_nid, online_nid);
 
 	return 0;
 
-- 
2.20.1

