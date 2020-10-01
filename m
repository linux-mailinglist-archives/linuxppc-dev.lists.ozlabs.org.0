Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE0428060B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Oct 2020 19:57:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2LSP4dtszDqbs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Oct 2020 03:57:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=H6ADQQ5l; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2LLf3G6szDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Oct 2020 03:52:42 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 091HWFuN158053; Thu, 1 Oct 2020 13:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=PTC+0PwqYejzqwTUobdRW0ukRon30fkWz6RWuFunnLQ=;
 b=H6ADQQ5lv7t3sZsD3uOCp63DoOD/XdDrnH52OAedmCadtDdzcG/JTA0dhOl7IaXoFD5K
 g29VzdorQihbm/GZWraJF3Ev8lytvsLpR4mH0hhIaHbDPITE1OO5ZJZ7iPSO4TkcVFou
 QTyhLP9G1HaYrusHPw2FKPU9Sig694/IoVSc0RwrVlJDfFp7oRH+GiiIMrxoez940DOj
 eFFkCXCq9b2krOyXjlSnEfcw/l9ol1XmAQbEVIO8tgiQQcqRib48/LDoKLVZg/B6RD4E
 rSMhBEle4L3DfELSEziG6lNHXur6LxSQfuQusKbMHEMhlzvmpH1jqB4D5Fux20DNy8c5 tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33wj06v162-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Oct 2020 13:52:37 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 091HcQkL189058;
 Thu, 1 Oct 2020 13:52:37 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33wj06v153-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Oct 2020 13:52:36 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 091HbkHU004263;
 Thu, 1 Oct 2020 17:52:34 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 33v5kg1980-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Oct 2020 17:52:34 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 091HqVP519595752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Oct 2020 17:52:31 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F84742041;
 Thu,  1 Oct 2020 17:52:31 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADC144204B;
 Thu,  1 Oct 2020 17:52:29 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.200.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Oct 2020 17:52:29 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 2/2] lkdtm/powerpc: Add SLB multihit test
Date: Thu,  1 Oct 2020 23:21:44 +0530
Message-Id: <20201001175144.286189-3-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201001175144.286189-1-ganeshgr@linux.ibm.com>
References: <20201001175144.286189-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-01_06:2020-10-01,
 2020-10-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010010144
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
Cc: msuchanek@suse.de, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 keescook@chromium.org, npiggin@gmail.com, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To check machine check handling, add support to inject slb
multihit errors.

Reviewed-by: Michal Suchánek <msuchanek@suse.de>
Co-developed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 drivers/misc/lkdtm/Makefile             |   1 +
 drivers/misc/lkdtm/core.c               |   3 +
 drivers/misc/lkdtm/lkdtm.h              |   3 +
 drivers/misc/lkdtm/powerpc.c            | 156 ++++++++++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |   1 +
 5 files changed, 164 insertions(+)
 create mode 100644 drivers/misc/lkdtm/powerpc.c

diff --git a/drivers/misc/lkdtm/Makefile b/drivers/misc/lkdtm/Makefile
index c70b3822013f..f37ecfb0a707 100644
--- a/drivers/misc/lkdtm/Makefile
+++ b/drivers/misc/lkdtm/Makefile
@@ -10,6 +10,7 @@ lkdtm-$(CONFIG_LKDTM)		+= rodata_objcopy.o
 lkdtm-$(CONFIG_LKDTM)		+= usercopy.o
 lkdtm-$(CONFIG_LKDTM)		+= stackleak.o
 lkdtm-$(CONFIG_LKDTM)		+= cfi.o
+lkdtm-$(CONFIG_PPC64)		+= powerpc.o
 
 KASAN_SANITIZE_stackleak.o	:= n
 KCOV_INSTRUMENT_rodata.o	:= n
diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
index a5e344df9166..8d5db42baa90 100644
--- a/drivers/misc/lkdtm/core.c
+++ b/drivers/misc/lkdtm/core.c
@@ -178,6 +178,9 @@ static const struct crashtype crashtypes[] = {
 #ifdef CONFIG_X86_32
 	CRASHTYPE(DOUBLE_FAULT),
 #endif
+#ifdef CONFIG_PPC64
+	CRASHTYPE(PPC_SLB_MULTIHIT),
+#endif
 };
 
 
diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
index 8878538b2c13..b305bd511ee5 100644
--- a/drivers/misc/lkdtm/lkdtm.h
+++ b/drivers/misc/lkdtm/lkdtm.h
@@ -104,4 +104,7 @@ void lkdtm_STACKLEAK_ERASING(void);
 /* cfi.c */
 void lkdtm_CFI_FORWARD_PROTO(void);
 
+/* powerpc.c */
+void lkdtm_PPC_SLB_MULTIHIT(void);
+
 #endif
diff --git a/drivers/misc/lkdtm/powerpc.c b/drivers/misc/lkdtm/powerpc.c
new file mode 100644
index 000000000000..033111f7d929
--- /dev/null
+++ b/drivers/misc/lkdtm/powerpc.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+#include "lkdtm.h"
+
+/* Gets index for new slb entry */
+static inline unsigned long get_slb_index(void)
+{
+	unsigned long index;
+
+	index = get_paca()->stab_rr;
+
+	/*
+	 * simple round-robin replacement of slb starting at SLB_NUM_BOLTED.
+	 */
+	if (index < (mmu_slb_size - 1))
+		index++;
+	else
+		index = SLB_NUM_BOLTED;
+	get_paca()->stab_rr = index;
+	return index;
+}
+
+#define slb_esid_mask(ssize)	\
+	(((ssize) == MMU_SEGSIZE_256M) ? ESID_MASK : ESID_MASK_1T)
+
+/* Form the operand for slbmte */
+static inline unsigned long mk_esid_data(unsigned long ea, int ssize,
+					 unsigned long slot)
+{
+	return (ea & slb_esid_mask(ssize)) | SLB_ESID_V | slot;
+}
+
+#define slb_vsid_shift(ssize)	\
+	((ssize) == MMU_SEGSIZE_256M ? SLB_VSID_SHIFT : SLB_VSID_SHIFT_1T)
+
+/* Form the operand for slbmte */
+static inline unsigned long mk_vsid_data(unsigned long ea, int ssize,
+					 unsigned long flags)
+{
+	return (get_kernel_vsid(ea, ssize) << slb_vsid_shift(ssize)) | flags |
+		((unsigned long)ssize << SLB_VSID_SSIZE_SHIFT);
+}
+
+/* Inserts new slb entry */
+static void insert_slb_entry(char *p, int ssize)
+{
+	unsigned long flags, entry;
+
+	flags = SLB_VSID_KERNEL | mmu_psize_defs[MMU_PAGE_64K].sllp;
+	preempt_disable();
+
+	entry = get_slb_index();
+	asm volatile("slbmte %0,%1" :
+			: "r" (mk_vsid_data((unsigned long)p, ssize, flags)),
+			  "r" (mk_esid_data((unsigned long)p, ssize, entry))
+			: "memory");
+
+	entry = get_slb_index();
+	asm volatile("slbmte %0,%1" :
+			: "r" (mk_vsid_data((unsigned long)p, ssize, flags)),
+			  "r" (mk_esid_data((unsigned long)p, ssize, entry))
+			: "memory");
+	preempt_enable();
+	/*
+	 * This triggers exception, If handled correctly we must recover
+	 * from this error.
+	 */
+	p[0] = '!';
+}
+
+/* Inject slb multihit on vmalloc-ed address i.e 0xD00... */
+static void inject_vmalloc_slb_multihit(void)
+{
+	char *p;
+
+	p = vmalloc(2048);
+	if (!p)
+		return;
+
+	insert_slb_entry(p, MMU_SEGSIZE_1T);
+	vfree(p);
+}
+
+/* Inject slb multihit on kmalloc-ed address i.e 0xC00... */
+static void inject_kmalloc_slb_multihit(void)
+{
+	char *p;
+
+	p = kmalloc(2048, GFP_KERNEL);
+	if (!p)
+		return;
+
+	insert_slb_entry(p, MMU_SEGSIZE_1T);
+	kfree(p);
+}
+
+/*
+ * Few initial SLB entries are bolted. Add a test to inject
+ * multihit in bolted entry 0.
+ */
+static void insert_dup_slb_entry_0(void)
+{
+	unsigned long test_address = 0xC000000000000000;
+	volatile unsigned long *test_ptr;
+	unsigned long entry, i = 0;
+	unsigned long esid, vsid;
+
+	test_ptr = (unsigned long *)test_address;
+	preempt_disable();
+
+	asm volatile("slbmfee  %0,%1" : "=r" (esid) : "r" (i));
+	asm volatile("slbmfev  %0,%1" : "=r" (vsid) : "r" (i));
+	entry = get_slb_index();
+
+	/* for i !=0 we would need to mask out the old entry number */
+	asm volatile("slbmte %0,%1" :
+			: "r" (vsid),
+			  "r" (esid | entry)
+			: "memory");
+
+	asm volatile("slbmfee  %0,%1" : "=r" (esid) : "r" (i));
+	asm volatile("slbmfev  %0,%1" : "=r" (vsid) : "r" (i));
+	entry = get_slb_index();
+
+	/* for i !=0 we would need to mask out the old entry number */
+	asm volatile("slbmte %0,%1" :
+			: "r" (vsid),
+			  "r" (esid | entry)
+			: "memory");
+
+	pr_info("lkdtm: %s accessing test address 0x%lx: 0x%lx\n",
+		__func__, test_address, *test_ptr);
+
+	preempt_enable();
+}
+
+void lkdtm_PPC_SLB_MULTIHIT(void)
+{
+	if (mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
+		pr_info("Injecting SLB multihit errors\n");
+		/*
+		 * These need not be separate tests, And they do pretty
+		 * much same thing. In any case we must recover from the
+		 * errors introduced by these functions, machine would not
+		 * survive these tests in case of failure to handle.
+		 */
+		inject_vmalloc_slb_multihit();
+		inject_kmalloc_slb_multihit();
+		insert_dup_slb_entry_0();
+		pr_info("Recovered from SLB multihit errors\n");
+	} else {
+		pr_err("XFAIL: This test is for ppc64 and with hash mode MMU only\n");
+	}
+}
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index 9d266e79c6a2..7eb3cf91c89e 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -70,3 +70,4 @@ USERCOPY_KERNEL
 USERCOPY_KERNEL_DS
 STACKLEAK_ERASING OK: the rest of the thread stack is properly erased
 CFI_FORWARD_PROTO
+PPC_SLB_MULTIHIT Recovered
-- 
2.26.2

