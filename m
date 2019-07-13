Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A95678C7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 08:16:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45m01204byzDqbm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 16:16:22 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lzgW5qJFzDqv1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 16:01:11 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6D5uN72133923
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 02:01:09 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tq87uaar4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 02:01:08 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Sat, 13 Jul 2019 07:01:08 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 13 Jul 2019 07:01:04 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6D613J560752244
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2019 06:01:03 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44012C6069;
 Sat, 13 Jul 2019 06:01:03 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20E52C6055;
 Sat, 13 Jul 2019 06:01:00 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.135.203])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 13 Jul 2019 06:00:59 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 07/13] powerpc/pseries/svm: Use shared memory for Debug
 Trace Log (DTL)
Date: Sat, 13 Jul 2019 03:00:17 -0300
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190713060023.8479-1-bauerman@linux.ibm.com>
References: <20190713060023.8479-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19071306-0004-0000-0000-00001526F181
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011419; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01231433; UDB=6.00648705; IPR=6.01012726; 
 MB=3.00027699; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-13 06:01:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071306-0005-0000-0000-00008C6EF51C
Message-Id: <20190713060023.8479-8-bauerman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-13_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907130070
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

Secure guests need to share the DTL buffers with the hypervisor. To that
end, use a kmem_cache constructor which converts the underlying buddy
allocated SLUB cache pages into shared memory.

Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/include/asm/svm.h          |  5 ++++
 arch/powerpc/platforms/pseries/Makefile |  1 +
 arch/powerpc/platforms/pseries/setup.c  |  5 +++-
 arch/powerpc/platforms/pseries/svm.c    | 40 +++++++++++++++++++++++++
 4 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/svm.h b/arch/powerpc/include/asm/svm.h
index fef3740f46a6..f253116c31fc 100644
--- a/arch/powerpc/include/asm/svm.h
+++ b/arch/powerpc/include/asm/svm.h
@@ -15,6 +15,9 @@ static inline bool is_secure_guest(void)
 	return mfmsr() & MSR_S;
 }
 
+void dtl_cache_ctor(void *addr);
+#define get_dtl_cache_ctor()	(is_secure_guest() ? dtl_cache_ctor : NULL)
+
 #else /* CONFIG_PPC_SVM */
 
 static inline bool is_secure_guest(void)
@@ -22,5 +25,7 @@ static inline bool is_secure_guest(void)
 	return false;
 }
 
+#define get_dtl_cache_ctor() NULL
+
 #endif /* CONFIG_PPC_SVM */
 #endif /* _ASM_POWERPC_SVM_H */
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index ab3d59aeacca..a420ef4c9d8e 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_IBMVIO)		+= vio.o
 obj-$(CONFIG_IBMEBUS)		+= ibmebus.o
 obj-$(CONFIG_PAPR_SCM)		+= papr_scm.o
 obj-$(CONFIG_PPC_SPLPAR)	+= vphn.o
+obj-$(CONFIG_PPC_SVM)		+= svm.o
 
 ifdef CONFIG_PPC_PSERIES
 obj-$(CONFIG_SUSPEND)		+= suspend.o
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index cb418d2bb1ac..3009b5bd11d2 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -73,6 +73,7 @@
 #include <asm/security_features.h>
 #include <asm/asm-const.h>
 #include <asm/swiotlb.h>
+#include <asm/svm.h>
 
 #include "pseries.h"
 #include "../../../../drivers/pci/pci.h"
@@ -301,8 +302,10 @@ static inline int alloc_dispatch_logs(void)
 
 static int alloc_dispatch_log_kmem_cache(void)
 {
+	void (*ctor)(void *) = get_dtl_cache_ctor();
+
 	dtl_cache = kmem_cache_create("dtl", DISPATCH_LOG_BYTES,
-						DISPATCH_LOG_BYTES, 0, NULL);
+						DISPATCH_LOG_BYTES, 0, ctor);
 	if (!dtl_cache) {
 		pr_warn("Failed to create dispatch trace log buffer cache\n");
 		pr_warn("Stolen time statistics will be unreliable\n");
diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
new file mode 100644
index 000000000000..c508196f7c83
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Secure VM platform
+ *
+ * Copyright 2019 IBM Corporation
+ * Author: Anshuman Khandual <khandual@linux.vnet.ibm.com>
+ */
+
+#include <linux/mm.h>
+#include <asm/ultravisor.h>
+
+/* There's one dispatch log per CPU. */
+#define NR_DTL_PAGE (DISPATCH_LOG_BYTES * CONFIG_NR_CPUS / PAGE_SIZE)
+
+static struct page *dtl_page_store[NR_DTL_PAGE];
+static long dtl_nr_pages;
+
+static bool is_dtl_page_shared(struct page *page)
+{
+	long i;
+
+	for (i = 0; i < dtl_nr_pages; i++)
+		if (dtl_page_store[i] == page)
+			return true;
+
+	return false;
+}
+
+void dtl_cache_ctor(void *addr)
+{
+	unsigned long pfn = PHYS_PFN(__pa(addr));
+	struct page *page = pfn_to_page(pfn);
+
+	if (!is_dtl_page_shared(page)) {
+		dtl_page_store[dtl_nr_pages] = page;
+		dtl_nr_pages++;
+		WARN_ON(dtl_nr_pages >= NR_DTL_PAGE);
+		uv_share_page(pfn, 1);
+	}
+}

