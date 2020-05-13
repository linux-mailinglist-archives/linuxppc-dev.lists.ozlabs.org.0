Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F261D05B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 05:56:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MLSl6wz8zDqZR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 13:56:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MLHB21m6zDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 13:48:06 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04D3X5Tl176373; Tue, 12 May 2020 23:48:00 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31016kc0xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 23:47:59 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04D3YQUC182165;
 Tue, 12 May 2020 23:47:59 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31016kc0x6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 23:47:59 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04D3htE5029220;
 Wed, 13 May 2020 03:47:58 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 3100ub3dnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 03:47:58 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04D3lu2H12190124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 May 2020 03:47:56 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55C676A047;
 Wed, 13 May 2020 03:47:57 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F1E16A04D;
 Wed, 13 May 2020 03:47:54 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.3.92])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 13 May 2020 03:47:54 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 linux-nvdimm@lists.01.org
Subject: [PATCH v2 5/5] powerpc/pmem: Avoid the barrier in flush routines
Date: Wed, 13 May 2020 09:17:05 +0530
Message-Id: <20200513034705.172983-5-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513034705.172983-1-aneesh.kumar@linux.ibm.com>
References: <20200513034705.172983-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-12_08:2020-05-11,
 2020-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 cotscore=-2147483648 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005130031
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
Cc: alistair@popple.id.au, dan.j.williams@intel.com, oohall@gmail.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

nvdimm expect the flush routines to just mark the cache clean. The barrier
that mark the store globally visible is done in nvdimm_flush().

Update the papr_scm driver to a simplified nvdim_flush callback that do
only the required barrier.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/lib/pmem.c                   | 34 +++++++++++++++++------
 arch/powerpc/platforms/pseries/papr_scm.c | 13 +++++++++
 2 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
index 076d75efb57a..3ef15cfa925b 100644
--- a/arch/powerpc/lib/pmem.c
+++ b/arch/powerpc/lib/pmem.c
@@ -9,7 +9,7 @@
 
 #include <asm/cacheflush.h>
 
-static inline void clean_pmem_range_isa310(unsigned long start, unsigned long stop)
+static inline void __clean_pmem_range(unsigned long start, unsigned long stop)
 {
 	unsigned long shift = l1_dcache_shift();
 	unsigned long bytes = l1_dcache_bytes();
@@ -18,13 +18,22 @@ static inline void clean_pmem_range_isa310(unsigned long start, unsigned long st
 	unsigned long i;
 
 	for (i = 0; i < size >> shift; i++, addr += bytes)
-		asm volatile(PPC_DCBSTPS(%0, %1): :"i"(0), "r"(addr): "memory");
+		dcbf(addr);
+}
 
+static inline void __flush_pmem_range(unsigned long start, unsigned long stop)
+{
+	unsigned long shift = l1_dcache_shift();
+	unsigned long bytes = l1_dcache_bytes();
+	void *addr = (void *)(start & ~(bytes - 1));
+	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
+	unsigned long i;
 
-	asm volatile(PPC_PHWSYNC ::: "memory");
+	for (i = 0; i < size >> shift; i++, addr += bytes)
+		dcbf(addr);
 }
 
-static inline void flush_pmem_range_isa310(unsigned long start, unsigned long stop)
+static inline void clean_pmem_range_isa310(unsigned long start, unsigned long stop)
 {
 	unsigned long shift = l1_dcache_shift();
 	unsigned long bytes = l1_dcache_bytes();
@@ -33,24 +42,33 @@ static inline void flush_pmem_range_isa310(unsigned long start, unsigned long st
 	unsigned long i;
 
 	for (i = 0; i < size >> shift; i++, addr += bytes)
-		asm volatile(PPC_DCBFPS(%0, %1): :"i"(0), "r"(addr): "memory");
+		asm volatile(PPC_DCBSTPS(%0, %1): :"i"(0), "r"(addr): "memory");
+}
 
+static inline void flush_pmem_range_isa310(unsigned long start, unsigned long stop)
+{
+	unsigned long shift = l1_dcache_shift();
+	unsigned long bytes = l1_dcache_bytes();
+	void *addr = (void *)(start & ~(bytes - 1));
+	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
+	unsigned long i;
 
-	asm volatile(PPC_PHWSYNC ::: "memory");
+	for (i = 0; i < size >> shift; i++, addr += bytes)
+		asm volatile(PPC_DCBFPS(%0, %1): :"i"(0), "r"(addr): "memory");
 }
 
 static inline void clean_pmem_range(unsigned long start, unsigned long stop)
 {
 	if (cpu_has_feature(CPU_FTR_ARCH_31))
 		return clean_pmem_range_isa310(start, stop);
-	return flush_dcache_range(start, stop);
+	return __clean_pmem_range(start, stop);
 }
 
 static inline void flush_pmem_range(unsigned long start, unsigned long stop)
 {
 	if (cpu_has_feature(CPU_FTR_ARCH_31))
 		return flush_pmem_range_isa310(start, stop);
-	return flush_dcache_range(start, stop);
+	return __flush_pmem_range(start, stop);
 }
 
 /*
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index f35592423380..ad506e7003c9 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -285,6 +285,18 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 
 	return 0;
 }
+/*
+ * We have made sure the pmem writes are done such that before calling this
+ * all the caches are flushed/clean. We use dcbf/dcbfps to ensure this. Here
+ * we just need to add the necessary barrier to make sure the above flushes
+ * are have updated persistent storage before any data access or data transfer
+ * caused by subsequent instructions is initiated.
+ */
+static int papr_scm_flush_sync(struct nd_region *nd_region, struct bio *bio)
+{
+	arch_pmem_flush_barrier();
+	return 0;
+}
 
 static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 {
@@ -340,6 +352,7 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	ndr_desc.mapping = &mapping;
 	ndr_desc.num_mappings = 1;
 	ndr_desc.nd_set = &p->nd_set;
+	ndr_desc.flush = papr_scm_flush_sync;
 
 	if (p->is_volatile)
 		p->region = nvdimm_volatile_region_create(p->bus, &ndr_desc);
-- 
2.26.2

