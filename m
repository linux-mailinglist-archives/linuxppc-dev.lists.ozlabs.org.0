Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D9595471
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 04:32:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CFFX5SkPzDq9W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 12:32:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CDrG66VDzDql9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 12:14:22 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7K2Casd112799
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 22:14:19 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ug7sh05wg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 22:14:19 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Tue, 20 Aug 2019 03:14:18 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 03:14:16 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7K2EEmR61014386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 02:14:14 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAB64C605B;
 Tue, 20 Aug 2019 02:14:14 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87B7AC6059;
 Tue, 20 Aug 2019 02:14:11 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.220.248])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 02:14:11 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 08/16] powerpc/pseries/svm: Use shared memory for LPPACA
 structures
Date: Mon, 19 Aug 2019 23:13:18 -0300
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820021326.6884-1-bauerman@linux.ibm.com>
References: <20190820021326.6884-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19082002-0036-0000-0000-00000AE5F87D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011621; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01249321; UDB=6.00659505; IPR=6.01030857; 
 MB=3.00028240; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-20 02:14:18
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082002-0037-0000-0000-00004D139F55
Message-Id: <20190820021326.6884-9-bauerman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200018
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Anshuman Khandual <khandual@linux.vnet.ibm.com>

LPPACA structures need to be shared with the host. Hence they need to be in
shared memory. Instead of allocating individual chunks of memory for a
given structure from memblock, a contiguous chunk of memory is allocated
and then converted into shared memory. Subsequent allocation requests will
come from the contiguous chunk which will be always shared memory for all
structures.

While we are able to use a kmem_cache constructor for the Debug Trace Log,
LPPACAs are allocated very early in the boot process (before SLUB is
available) so we need to use a simpler scheme here.

Introduce helper is_svm_platform() which uses the S bit of the MSR to tell
whether we're running as a secure guest.

Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/include/asm/svm.h | 26 ++++++++++++++++++++
 arch/powerpc/kernel/paca.c     | 43 +++++++++++++++++++++++++++++++++-
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/svm.h b/arch/powerpc/include/asm/svm.h
new file mode 100644
index 000000000000..2689d8d841f8
--- /dev/null
+++ b/arch/powerpc/include/asm/svm.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * SVM helper functions
+ *
+ * Copyright 2018 Anshuman Khandual, IBM Corporation.
+ */
+
+#ifndef _ASM_POWERPC_SVM_H
+#define _ASM_POWERPC_SVM_H
+
+#ifdef CONFIG_PPC_SVM
+
+static inline bool is_secure_guest(void)
+{
+	return mfmsr() & MSR_S;
+}
+
+#else /* CONFIG_PPC_SVM */
+
+static inline bool is_secure_guest(void)
+{
+	return false;
+}
+
+#endif /* CONFIG_PPC_SVM */
+#endif /* _ASM_POWERPC_SVM_H */
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 612fc87ef785..949eceb254d8 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -14,6 +14,8 @@
 #include <asm/sections.h>
 #include <asm/pgtable.h>
 #include <asm/kexec.h>
+#include <asm/svm.h>
+#include <asm/ultravisor.h>
 
 #include "setup.h"
 
@@ -54,6 +56,41 @@ static void *__init alloc_paca_data(unsigned long size, unsigned long align,
 
 #define LPPACA_SIZE 0x400
 
+static void *__init alloc_shared_lppaca(unsigned long size, unsigned long align,
+					unsigned long limit, int cpu)
+{
+	size_t shared_lppaca_total_size = PAGE_ALIGN(nr_cpu_ids * LPPACA_SIZE);
+	static unsigned long shared_lppaca_size;
+	static void *shared_lppaca;
+	void *ptr;
+
+	if (!shared_lppaca) {
+		memblock_set_bottom_up(true);
+
+		shared_lppaca =
+			memblock_alloc_try_nid(shared_lppaca_total_size,
+					       PAGE_SIZE, MEMBLOCK_LOW_LIMIT,
+					       limit, NUMA_NO_NODE);
+		if (!shared_lppaca)
+			panic("cannot allocate shared data");
+
+		memblock_set_bottom_up(false);
+		uv_share_page(PHYS_PFN(__pa(shared_lppaca)),
+			      shared_lppaca_total_size >> PAGE_SHIFT);
+	}
+
+	ptr = shared_lppaca + shared_lppaca_size;
+	shared_lppaca_size += size;
+
+	/*
+	 * This is very early in boot, so no harm done if the kernel crashes at
+	 * this point.
+	 */
+	BUG_ON(shared_lppaca_size >= shared_lppaca_total_size);
+
+	return ptr;
+}
+
 /*
  * See asm/lppaca.h for more detail.
  *
@@ -83,7 +120,11 @@ static struct lppaca * __init new_lppaca(int cpu, unsigned long limit)
 	if (early_cpu_has_feature(CPU_FTR_HVMODE))
 		return NULL;
 
-	lp = alloc_paca_data(LPPACA_SIZE, 0x400, limit, cpu);
+	if (is_secure_guest())
+		lp = alloc_shared_lppaca(LPPACA_SIZE, 0x400, limit, cpu);
+	else
+		lp = alloc_paca_data(LPPACA_SIZE, 0x400, limit, cpu);
+
 	init_lppaca(lp);
 
 	return lp;

