Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D37D25BEAF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 16:51:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cr0d6V4dzDqX6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 00:51:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cqgw068czDqYM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 00:36:43 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x61ESVvI001099; Mon, 1 Jul 2019 10:36:39 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tfkvb8xub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jul 2019 10:36:38 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x61ETNQu005060;
 Mon, 1 Jul 2019 10:36:38 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tfkvb8xr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jul 2019 10:36:38 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x61EYo9x028891;
 Mon, 1 Jul 2019 14:36:35 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 2tdym6fgfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jul 2019 14:36:35 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x61EaZWw44499292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2019 14:36:35 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1160FAC062;
 Mon,  1 Jul 2019 14:36:35 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95A4FAC05F;
 Mon,  1 Jul 2019 14:36:32 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.81.231])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  1 Jul 2019 14:36:32 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH v2 2/3] powerpc/mm: Fix node look up with numa=off boot
Date: Mon,  1 Jul 2019 20:06:25 +0530
Message-Id: <20190701143626.17628-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701143626.17628-1-aneesh.kumar@linux.ibm.com>
References: <20190701143626.17628-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907010179
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If we boot with numa=off, we need to make sure we return NUMA_NO_NODE when
looking up associativity details of resources. Without this, we hit crash
like below

BUG: Unable to handle kernel data access at 0x40000000008
Faulting instruction address: 0xc000000008f31704
cpu 0x1b: Vector: 380 (Data SLB Access) at [c00000000b9bb320]
    pc: c000000008f31704: _raw_spin_lock+0x14/0x100
    lr: c0000000083f41fc: ____cache_alloc_node+0x5c/0x290
    sp: c00000000b9bb5b0
   msr: 800000010280b033
   dar: 40000000008
  current = 0xc00000000b9a2700
  paca    = 0xc00000000a740c00   irqmask: 0x03   irq_happened: 0x01
    pid   = 1, comm = swapper/27
Linux version 5.2.0-rc4-00925-g74e188c620b1 (root@linux-d8ip) (gcc version 7.4.1 20190424 [gcc-7-branch revision 270538] (SUSE Linux)) #34 SMP Sat Jun 29 00:41:02 EDT 2019
enter ? for help
[link register   ] c0000000083f41fc ____cache_alloc_node+0x5c/0x290
[c00000000b9bb5b0] 0000000000000dc0 (unreliable)
[c00000000b9bb5f0] c0000000083f48c8 kmem_cache_alloc_node_trace+0x138/0x360
[c00000000b9bb670] c000000008aa789c devres_alloc_node+0x4c/0xa0
[c00000000b9bb6a0] c000000008337218 devm_memremap+0x58/0x130
[c00000000b9bb6f0] c000000008aed00c devm_nsio_enable+0xdc/0x170
[c00000000b9bb780] c000000008af3b6c nd_pmem_probe+0x4c/0x180
[c00000000b9bb7b0] c000000008ad84cc nvdimm_bus_probe+0xac/0x260
[c00000000b9bb840] c000000008aa0628 really_probe+0x148/0x500
[c00000000b9bb8d0] c000000008aa0d7c driver_probe_device+0x19c/0x1d0
[c00000000b9bb950] c000000008aa11bc device_driver_attach+0xcc/0x100
[c00000000b9bb990] c000000008aa12ec __driver_attach+0xfc/0x1e0
[c00000000b9bba10] c000000008a9d0a4 bus_for_each_dev+0xb4/0x130
[c00000000b9bba70] c000000008a9fc04 driver_attach+0x34/0x50
[c00000000b9bba90] c000000008a9f118 bus_add_driver+0x1d8/0x300
[c00000000b9bbb20] c000000008aa2358 driver_register+0x98/0x1a0
[c00000000b9bbb90] c000000008ad7e6c __nd_driver_register+0x5c/0x100
[c00000000b9bbbf0] c0000000093efbac nd_pmem_driver_init+0x34/0x48
[c00000000b9bbc10] c0000000080106c0 do_one_initcall+0x60/0x2d0
[c00000000b9bbce0] c00000000938463c kernel_init_freeable+0x384/0x48c
[c00000000b9bbdb0] c000000008010a5c kernel_init+0x2c/0x160
[c00000000b9bbe20] c00000000800ba54 ret_from_kernel_thread+0x5c/0x68

Reported-and-debugged-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index aee718509085..27f792c0df68 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -212,7 +212,7 @@ static int associativity_to_nid(const __be32 *associativity)
 {
 	int nid = NUMA_NO_NODE;
 
-	if (min_common_depth == -1)
+	if (min_common_depth == -1 || !numa_enabled)
 		goto out;
 
 	if (of_read_number(associativity, 1) >= min_common_depth)
@@ -420,7 +420,7 @@ static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 	int nid = default_nid;
 	int rc, index;
 
-	if (min_common_depth < 0)
+	if ((min_common_depth < 0) || !numa_enabled)
 		return default_nid;
 
 	rc = of_get_assoc_arrays(&aa);
@@ -810,7 +810,7 @@ static void __init find_possible_nodes(void)
 	struct device_node *rtas;
 	u32 numnodes, i;
 
-	if (min_common_depth <= 0)
+	if (min_common_depth <= 0 || !numa_enabled)
 		return;
 
 	rtas = of_find_node_by_path("/rtas");
-- 
2.21.0

