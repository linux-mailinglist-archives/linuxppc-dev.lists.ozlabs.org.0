Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1AA278541
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 12:37:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BySzM5VPnzDqMr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 20:37:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=C7SP3ob+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BySt65y7ZzDqk5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Sep 2020 20:33:02 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08PAViLh074809; Fri, 25 Sep 2020 06:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=6H1tSf6R3pTrk951yx6DJLgEKESrwf0f5g/h14P1qqM=;
 b=C7SP3ob+I6A/Oazg9EOVEsv/kjucbKZgmDIAx13EtNAMByIklO4T/ZJlC37rxnpG0oTy
 h9UnH0C2D6FvYcbY8N0iuBI/bGGI66CliqKR7voPhALeAmnSHkwSdX3eFuVOxUUODDie
 oYIubHCPVPibTyAE5AFcvUyUmoa+2fuvj4B7QaSUrMKaC2xGWcKWgZLJ2SI5209hEbZx
 R9O6We88sm54beBNDioWCsJj4AkPwHs14XW4sEfFqhHGIyLP0ggx12/sHC6Ns8MgzCxV
 ArAeAhSurRQ4srk6zza5RWdS6Rl5+X7TpeeWU6ZbXUmzXrgmle70onxNfBeVr10JQmly 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33sdt2a6xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Sep 2020 06:32:54 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08PAWEJt076562;
 Fri, 25 Sep 2020 06:32:54 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33sdt2a6wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Sep 2020 06:32:54 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08PAWGA4017928;
 Fri, 25 Sep 2020 10:32:52 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 33n9m8373e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Sep 2020 10:32:52 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08PAWnp820119932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Sep 2020 10:32:49 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42E9A42042;
 Fri, 25 Sep 2020 10:32:49 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76B7942041;
 Fri, 25 Sep 2020 10:32:47 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.205.231])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 25 Sep 2020 10:32:47 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 2/3] lkdtm/powerpc: Add SLB multihit test
Date: Fri, 25 Sep 2020 16:01:22 +0530
Message-Id: <20200925103123.21102-3-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200925103123.21102-1-ganeshgr@linux.ibm.com>
References: <20200925103123.21102-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-25_04:2020-09-24,
 2020-09-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009250068
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

Add support to inject slb multihit errors, to test machine
check handling.

Based on work by Mahesh Salgaonkar and Michal Suchánek.

Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michal Suchánek <msuchanek@suse.de>
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 drivers/misc/lkdtm/Makefile  |   4 ++
 drivers/misc/lkdtm/core.c    |   3 +
 drivers/misc/lkdtm/lkdtm.h   |   3 +
 drivers/misc/lkdtm/powerpc.c | 132 +++++++++++++++++++++++++++++++++++
 4 files changed, 142 insertions(+)
 create mode 100644 drivers/misc/lkdtm/powerpc.c

diff --git a/drivers/misc/lkdtm/Makefile b/drivers/misc/lkdtm/Makefile
index c70b3822013f..6a82f407fbcd 100644
--- a/drivers/misc/lkdtm/Makefile
+++ b/drivers/misc/lkdtm/Makefile
@@ -11,6 +11,10 @@ lkdtm-$(CONFIG_LKDTM)		+= usercopy.o
 lkdtm-$(CONFIG_LKDTM)		+= stackleak.o
 lkdtm-$(CONFIG_LKDTM)		+= cfi.o
 
+ifeq ($(CONFIG_PPC64),y)
+lkdtm-$(CONFIG_LKDTM)		+= powerpc.o
+endif
+
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
index 000000000000..d6db18444757
--- /dev/null
+++ b/drivers/misc/lkdtm/powerpc.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+
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
+static inline unsigned long mk_esid_data(unsigned long ea, int ssize,
+					 unsigned long slot)
+{
+	return (ea & slb_esid_mask(ssize)) | SLB_ESID_V | slot;
+}
+
+#define slb_vsid_shift(ssize)	\
+	((ssize) == MMU_SEGSIZE_256M ? SLB_VSID_SHIFT : SLB_VSID_SHIFT_1T)
+
+static inline unsigned long mk_vsid_data(unsigned long ea, int ssize,
+					 unsigned long flags)
+{
+	return (get_kernel_vsid(ea, ssize) << slb_vsid_shift(ssize)) | flags |
+		((unsigned long)ssize << SLB_VSID_SSIZE_SHIFT);
+}
+
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
+	p[0] = '!';
+}
+
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
+		inject_vmalloc_slb_multihit();
+		inject_kmalloc_slb_multihit();
+		insert_dup_slb_entry_0();
+	}
+	pr_info("Recovered from SLB multihit. (Ignore this message on non HPTE machines)");
+}
-- 
2.26.2

