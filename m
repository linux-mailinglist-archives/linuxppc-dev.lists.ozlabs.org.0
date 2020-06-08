Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FAD1F1358
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 09:13:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gPc74G5dzDqQ1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 17:13:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gPWp0rRmzDqFM
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 17:09:41 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05872VEn139204; Mon, 8 Jun 2020 03:09:33 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31hd5w4jdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 03:09:33 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05874pp0005445;
 Mon, 8 Jun 2020 07:09:32 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 31g2s9afg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 07:09:32 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05879WAh50004226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jun 2020 07:09:32 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5AF428059;
 Mon,  8 Jun 2020 07:09:31 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 471CC28058;
 Mon,  8 Jun 2020 07:09:30 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.88.17])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jun 2020 07:09:29 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 1/4] powerpc/percpu: Update percpu bootmem allocator
Date: Mon,  8 Jun 2020 12:39:01 +0530
Message-Id: <20200608070904.387440-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-08_03:2020-06-08,
 2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 cotscore=-2147483648 priorityscore=1501 suspectscore=2
 bulkscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 spamscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006080049
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
Cc: cam@neo-zeon.de, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This update the ppc64 version to be closer to x86/sparc.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/kernel/setup_64.c | 45 ++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index bb47555d48a2..eaddd53a0e13 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -753,17 +753,46 @@ void __init emergency_stack_init(void)
 }
 
 #ifdef CONFIG_SMP
-#define PCPU_DYN_SIZE		()
-
-static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size, size_t align)
+/**
+ * pcpu_alloc_bootmem - NUMA friendly alloc_bootmem wrapper for percpu
+ * @cpu: cpu to allocate for
+ * @size: size allocation in bytes
+ * @align: alignment
+ *
+ * Allocate @size bytes aligned at @align for cpu @cpu.  This wrapper
+ * does the right thing for NUMA regardless of the current
+ * configuration.
+ *
+ * RETURNS:
+ * Pointer to the allocated area on success, NULL on failure.
+ */
+static void * __init pcpu_alloc_bootmem(unsigned int cpu, size_t size,
+					size_t align)
 {
-	return memblock_alloc_try_nid(size, align, __pa(MAX_DMA_ADDRESS),
-				      MEMBLOCK_ALLOC_ACCESSIBLE,
-				      early_cpu_to_node(cpu));
+	const unsigned long goal = __pa(MAX_DMA_ADDRESS);
+#ifdef CONFIG_NEED_MULTIPLE_NODES
+	int node = early_cpu_to_node(cpu);
+	void *ptr;
 
+	if (!node_online(node) || !NODE_DATA(node)) {
+		ptr = memblock_alloc_from(size, align, goal);
+		pr_info("cpu %d has no node %d or node-local memory\n",
+			cpu, node);
+		pr_debug("per cpu data for cpu%d %lu bytes at %016lx\n",
+			 cpu, size, __pa(ptr));
+	} else {
+		ptr = memblock_alloc_try_nid(size, align, goal,
+					     MEMBLOCK_ALLOC_ACCESSIBLE, node);
+		pr_debug("per cpu data for cpu%d %lu bytes on node%d at "
+			 "%016lx\n", cpu, size, node, __pa(ptr));
+	}
+	return ptr;
+#else
+	return memblock_alloc_from(size, align, goal);
+#endif
 }
 
-static void __init pcpu_fc_free(void *ptr, size_t size)
+static void __init pcpu_free_bootmem(void *ptr, size_t size)
 {
 	memblock_free(__pa(ptr), size);
 }
@@ -798,7 +827,7 @@ void __init setup_per_cpu_areas(void)
 		atom_size = 1 << 20;
 
 	rc = pcpu_embed_first_chunk(0, dyn_size, atom_size, pcpu_cpu_distance,
-				    pcpu_fc_alloc, pcpu_fc_free);
+				    pcpu_alloc_bootmem, pcpu_free_bootmem);
 	if (rc < 0)
 		panic("cannot initialize percpu area (err=%d)", rc);
 
-- 
2.26.2

