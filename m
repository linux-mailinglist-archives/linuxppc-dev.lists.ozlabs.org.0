Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6774B50EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 17:02:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XmYq3PvzzF3q9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 01:02:39 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XmRr5vTTzF3pG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 00:57:28 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HEsfkG106121; Tue, 17 Sep 2019 10:57:21 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v31m9gbgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 10:57:20 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8HEjHED022210;
 Tue, 17 Sep 2019 14:57:18 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 2v0t5u7ptq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 14:57:18 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8HEvGkh52625862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 14:57:16 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FB786E056;
 Tue, 17 Sep 2019 14:57:16 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12BAE6E054;
 Tue, 17 Sep 2019 14:57:15 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.41.201])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 14:57:14 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/3] powerpc/64/mm: implement page mapping percpu first chunk
 allocator
Date: Tue, 17 Sep 2019 20:27:01 +0530
Message-Id: <20190917145702.9214-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190917145702.9214-1-aneesh.kumar@linux.ibm.com>
References: <20190917145702.9214-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170144
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement page mapping percpu first chunk allocator as a fallback to
the embedding allocator. With 4K hash translation we limit our page
table range to 64TB and commit: 0034d395f89d ("powerpc/mm/hash64: Map all the
kernel regions in the same 0xc range") moved all kernel mapping to
that 64TB range. In-order to support sparse memory layout we need
to increase our linear mapping space and reduce other mappings.

With such a layout percpu embedded first chunk allocator will fail
because of small vmalloc range. Add a fallback to page mapping
percpu first chunk allocator for such failures.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/Kconfig           |  5 ++-
 arch/powerpc/kernel/setup_64.c | 59 ++++++++++++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6a7c797fa9d2..69d29e3486f8 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -63,7 +63,10 @@ config HAVE_SETUP_PER_CPU_AREA
 	def_bool PPC64
 
 config NEED_PER_CPU_EMBED_FIRST_CHUNK
-	def_bool PPC64
+	def_bool y if PPC64
+
+config NEED_PER_CPU_PAGE_FIRST_CHUNK
+	def_bool y if PPC64
 
 config NR_IRQS
 	int "Number of virtual interrupt numbers"
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 44b4c432a273..4049d450afd6 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -65,6 +65,7 @@
 #include <asm/hw_irq.h>
 #include <asm/feature-fixups.h>
 #include <asm/kup.h>
+#include <asm/pgalloc.h>
 
 #include "setup.h"
 
@@ -761,13 +762,56 @@ static int pcpu_cpu_distance(unsigned int from, unsigned int to)
 unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(__per_cpu_offset);
 
+static void __init pcpu_populate_pte(unsigned long addr)
+{
+	pgd_t *pgd = pgd_offset_k(addr);
+	pud_t *pud;
+	pmd_t *pmd;
+
+	if (pgd_none(*pgd)) {
+		pud_t *new;
+
+		new = memblock_alloc_from(PUD_TABLE_SIZE, PUD_TABLE_SIZE, PUD_TABLE_SIZE);
+		if (!new)
+			goto err_alloc;
+		pgd_populate(&init_mm, pgd, new);
+	}
+
+	pud = pud_offset(pgd, addr);
+	if (pud_none(*pud)) {
+		pmd_t *new;
+
+		new = memblock_alloc_from(PMD_TABLE_SIZE, PMD_TABLE_SIZE, PMD_TABLE_SIZE);
+		if (!new)
+			goto err_alloc;
+		pud_populate(&init_mm, pud, new);
+	}
+
+	pmd = pmd_offset(pud, addr);
+	if (!pmd_present(*pmd)) {
+		pte_t *new;
+
+		new = memblock_alloc_from(PTE_TABLE_SIZE, PTE_TABLE_SIZE, PTE_TABLE_SIZE);
+		if (!new)
+			goto err_alloc;
+		pmd_populate_kernel(&init_mm, pmd, new);
+	}
+
+	return;
+
+err_alloc:
+	panic("%s: Failed to allocate %lu bytes align=%lx from=%lx\n",
+	      __func__, PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
+}
+
+
 void __init setup_per_cpu_areas(void)
 {
 	const size_t dyn_size = PERCPU_MODULE_RESERVE + PERCPU_DYNAMIC_RESERVE;
 	size_t atom_size;
 	unsigned long delta;
 	unsigned int cpu;
-	int rc;
+	int rc = -EINVAL;
 
 	/*
 	 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
@@ -779,8 +823,19 @@ void __init setup_per_cpu_areas(void)
 	else
 		atom_size = 1 << 20;
 
-	rc = pcpu_embed_first_chunk(0, dyn_size, atom_size, pcpu_cpu_distance,
+	if (pcpu_chosen_fc != PCPU_FC_PAGE) {
+		rc = pcpu_embed_first_chunk(0, dyn_size, atom_size, pcpu_cpu_distance,
 				    pcpu_fc_alloc, pcpu_fc_free);
+		if (rc)
+			pr_warning("PERCPU: %s allocator failed (%d), "
+				   "falling back to page size\n",
+				   pcpu_fc_names[pcpu_chosen_fc], rc);
+	}
+
+	if (rc < 0)
+		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE,
+					   pcpu_fc_alloc, pcpu_fc_free,
+					   pcpu_populate_pte);
 	if (rc < 0)
 		panic("cannot initialize percpu area (err=%d)", rc);
 
-- 
2.21.0

