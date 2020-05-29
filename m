Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C06121E7575
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 07:36:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YCwf18MrzDqYp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 15:36:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YCm65qllzDqZj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 15:28:54 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04T522gB076398; Fri, 29 May 2020 01:28:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31as1avgus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 01:28:46 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04T53qPK081923;
 Fri, 29 May 2020 01:28:46 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31as1avguk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 01:28:46 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04T5P71O030049;
 Fri, 29 May 2020 05:28:45 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 316ufb6rt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 05:28:45 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04T5SiXK27263482
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 May 2020 05:28:44 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F7F0BE054;
 Fri, 29 May 2020 05:28:44 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE349BE04F;
 Fri, 29 May 2020 05:28:41 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.84.128])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 29 May 2020 05:28:41 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 linux-nvdimm@lists.01.org
Subject: [PATCH v4 3/8] powerpc/pmem: Add flush routines using new pmem store
 and sync instruction
Date: Fri, 29 May 2020 10:58:15 +0530
Message-Id: <20200529052820.151651-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529052820.151651-1-aneesh.kumar@linux.ibm.com>
References: <20200529052820.151651-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-29_01:2020-05-28,
 2020-05-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 impostorscore=0 cotscore=-2147483648 mlxlogscore=999 suspectscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005290034
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, dan.j.williams@intel.com,
 oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Start using dcbstps; phwsync; sequence for flushing persistent memory range.
The new instructions are implemented as a variant of dcbf and hwsync and on
P8 and P9 they will be executed as those instructions. We avoid using them on
older hardware. This helps to avoid difficult to debug bugs.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/lib/pmem.c | 50 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
index 0666a8d29596..5a61aaeb6930 100644
--- a/arch/powerpc/lib/pmem.c
+++ b/arch/powerpc/lib/pmem.c
@@ -9,20 +9,62 @@
 
 #include <asm/cacheflush.h>
 
+static inline void __clean_pmem_range(unsigned long start, unsigned long stop)
+{
+	unsigned long shift = l1_dcache_shift();
+	unsigned long bytes = l1_dcache_bytes();
+	void *addr = (void *)(start & ~(bytes - 1));
+	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
+	unsigned long i;
+
+	for (i = 0; i < size >> shift; i++, addr += bytes)
+		asm volatile(PPC_DCBSTPS(%0, %1): :"i"(0), "r"(addr): "memory");
+
+
+	asm volatile(PPC_PHWSYNC ::: "memory");
+}
+
+static inline void __flush_pmem_range(unsigned long start, unsigned long stop)
+{
+	unsigned long shift = l1_dcache_shift();
+	unsigned long bytes = l1_dcache_bytes();
+	void *addr = (void *)(start & ~(bytes - 1));
+	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
+	unsigned long i;
+
+	for (i = 0; i < size >> shift; i++, addr += bytes)
+		asm volatile(PPC_DCBFPS(%0, %1): :"i"(0), "r"(addr): "memory");
+
+
+	asm volatile(PPC_PHWSYNC ::: "memory");
+}
+
+static inline void clean_pmem_range(unsigned long start, unsigned long stop)
+{
+	if (cpu_has_feature(CPU_FTR_ARCH_207S))
+		return __clean_pmem_range(start, stop);
+}
+
+static inline void flush_pmem_range(unsigned long start, unsigned long stop)
+{
+	if (cpu_has_feature(CPU_FTR_ARCH_207S))
+		return __flush_pmem_range(start, stop);
+}
+
 /*
  * CONFIG_ARCH_HAS_PMEM_API symbols
  */
 void arch_wb_cache_pmem(void *addr, size_t size)
 {
 	unsigned long start = (unsigned long) addr;
-	flush_dcache_range(start, start + size);
+	clean_pmem_range(start, start + size);
 }
 EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
 
 void arch_invalidate_pmem(void *addr, size_t size)
 {
 	unsigned long start = (unsigned long) addr;
-	flush_dcache_range(start, start + size);
+	flush_pmem_range(start, start + size);
 }
 EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
 
@@ -35,7 +77,7 @@ long __copy_from_user_flushcache(void *dest, const void __user *src,
 	unsigned long copied, start = (unsigned long) dest;
 
 	copied = __copy_from_user(dest, src, size);
-	flush_dcache_range(start, start + size);
+	clean_pmem_range(start, start + size);
 
 	return copied;
 }
@@ -45,7 +87,7 @@ void *memcpy_flushcache(void *dest, const void *src, size_t size)
 	unsigned long start = (unsigned long) dest;
 
 	memcpy(dest, src, size);
-	flush_dcache_range(start, start + size);
+	clean_pmem_range(start, start + size);
 
 	return dest;
 }
-- 
2.26.2

