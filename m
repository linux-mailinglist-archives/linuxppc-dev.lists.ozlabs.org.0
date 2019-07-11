Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B0E659FD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 17:07:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kztz65DyzDqjh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 01:07:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kzfw32RjzDqjJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 00:57:11 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6BEsEBr061765; Thu, 11 Jul 2019 10:57:03 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tp74f8mqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jul 2019 10:57:03 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x6BEtEgL066578;
 Thu, 11 Jul 2019 10:57:03 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tp74f8mq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jul 2019 10:57:03 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6BEsdss020533;
 Thu, 11 Jul 2019 14:57:02 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 2tjk96vt2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jul 2019 14:57:02 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6BEv11N52297994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Jul 2019 14:57:01 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C40CBE059;
 Thu, 11 Jul 2019 14:57:01 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11254BE053;
 Thu, 11 Jul 2019 14:56:58 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.70.240])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 11 Jul 2019 14:56:58 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/nvdimm: Pick the nearby online node if the device
 node is not online
Date: Thu, 11 Jul 2019 20:26:54 +0530
Message-Id: <20190711145654.17589-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-11_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907110169
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is similar to what ACPI does. Nvdimm layer doesn't bring the SCM device
numa node online. Hence we need to make sure we always use an online node
as ndr_desc.numa_node. Otherwise this result in kernel crashes. The target
node is used by dax/kmem and that will bring up the numa node online correctly.

Without this patch, we do hit kernel crash as below because we try to access
uninitialized NODE_DATA in different code paths.

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
---
 arch/powerpc/platforms/pseries/papr_scm.c | 30 +++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index c8ec670ee924..4abb0ecda30a 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -255,12 +255,32 @@ static const struct attribute_group *papr_scm_dimm_groups[] = {
 	NULL,
 };
 
+static inline int papr_scm_node(int node)
+{
+	int min_dist = INT_MAX, dist;
+	int nid, min_node;
+
+	if (node_online(node))
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
@@ -299,8 +319,11 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 
 	memset(&ndr_desc, 0, sizeof(ndr_desc));
 	ndr_desc.attr_groups = region_attr_groups;
-	ndr_desc.numa_node = dev_to_node(&p->pdev->dev);
-	ndr_desc.target_node = ndr_desc.numa_node;
+	target_nid = dev_to_node(&p->pdev->dev);
+	online_nid = papr_scm_node(target_nid);
+	set_dev_node(&p->pdev->dev, online_nid);
+	ndr_desc.numa_node = online_nid;
+	ndr_desc.target_node = target_nid;
 	ndr_desc.res = &p->res;
 	ndr_desc.of_node = p->dn;
 	ndr_desc.provider_data = p;
@@ -318,6 +341,9 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 				ndr_desc.res, p->dn);
 		goto err;
 	}
+	if (target_nid != online_nid)
+		dev_info(dev, "Region registered with target node %d and online node %d",
+			 target_nid, online_nid);
 
 	return 0;
 
-- 
2.21.0

