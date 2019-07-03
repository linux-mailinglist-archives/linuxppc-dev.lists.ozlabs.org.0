Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5115EA3E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 19:18:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f79R1sp6zDqTn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 03:18:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f6sW74x0zDqR6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 03:04:31 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x63H2lPe088354
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 3 Jul 2019 13:04:30 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2th0728jab-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 13:04:29 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 3 Jul 2019 18:04:28 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Jul 2019 18:04:24 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x63H4Ncc39321746
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jul 2019 17:04:23 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F4DFAE045;
 Wed,  3 Jul 2019 17:04:23 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B92A5AE04D;
 Wed,  3 Jul 2019 17:04:21 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.84.138])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Jul 2019 17:04:21 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 6/9] powerpc/pseries: Move mm/book3s64/vphn.c under
 platforms/pseries/
Date: Wed,  3 Jul 2019 22:33:59 +0530
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070317-0008-0000-0000-000002F9829A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070317-0009-0000-0000-00002266D1AF
Message-Id: <88430cc3e387aac8766d513f53ede44ad49ced91.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-03_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907030207
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mingming Cao <mingming.cao@ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

hcall_vphn() is specific to pseries and will be used in a subsequent
patch. So, move it to a more appropriate place under
arch/powerpc/platforms/pseries. Also merge vphn.h into lppaca.h
and update vphn selftest to use the new files.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/lppaca.h             | 24 +++++++++++++++++++
 arch/powerpc/mm/book3s64/Makefile             |  1 -
 arch/powerpc/mm/book3s64/vphn.h               | 24 -------------------
 arch/powerpc/mm/numa.c                        | 14 -----------
 arch/powerpc/platforms/pseries/Makefile       |  1 +
 .../{mm/book3s64 => platforms/pseries}/vphn.c | 20 ++++++++++++++--
 tools/testing/selftests/powerpc/vphn/Makefile |  2 +-
 .../selftests/powerpc/vphn/asm/lppaca.h       |  1 +
 tools/testing/selftests/powerpc/vphn/vphn.c   |  2 +-
 tools/testing/selftests/powerpc/vphn/vphn.h   |  1 -
 10 files changed, 46 insertions(+), 44 deletions(-)
 delete mode 100644 arch/powerpc/mm/book3s64/vphn.h
 rename arch/powerpc/{mm/book3s64 => platforms/pseries}/vphn.c (80%)
 create mode 120000 tools/testing/selftests/powerpc/vphn/asm/lppaca.h
 delete mode 120000 tools/testing/selftests/powerpc/vphn/vphn.h

diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
index 837a43a1b578..f60257c9766d 100644
--- a/arch/powerpc/include/asm/lppaca.h
+++ b/arch/powerpc/include/asm/lppaca.h
@@ -5,6 +5,29 @@
  */
 #ifndef _ASM_POWERPC_LPPACA_H
 #define _ASM_POWERPC_LPPACA_H
+
+/*
+ * The below VPHN macros are outside the __KERNEL__ check since these are
+ * used for compiling the vphn selftest in userspace
+ */
+
+/* The H_HOME_NODE_ASSOCIATIVITY h_call returns 6 64-bit registers. */
+#define VPHN_REGISTER_COUNT 6
+
+/*
+ * 6 64-bit registers unpacked into up to 24 be32 associativity values. To
+ * form the complete property we have to add the length in the first cell.
+ */
+#define VPHN_ASSOC_BUFSIZE (VPHN_REGISTER_COUNT*sizeof(u64)/sizeof(u16) + 1)
+
+/*
+ * The H_HOME_NODE_ASSOCIATIVITY hcall takes two values for flags:
+ * 1 for retrieving associativity information for a guest cpu
+ * 2 for retrieving associativity information for a host/hypervisor cpu
+ */
+#define VPHN_FLAG_VCPU	1
+#define VPHN_FLAG_PCPU	2
+
 #ifdef __KERNEL__
 
 /*
@@ -166,6 +189,7 @@ extern void (*dtl_consumer)(struct dtl_entry *entry, u64 index);
 
 extern void register_dtl_buffer(int cpu);
 extern void alloc_dtl_buffers(void);
+extern long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity);
 
 #endif /* CONFIG_PPC_BOOK3S */
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index 974b4fc19f4f..fd393b8be14f 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -10,7 +10,6 @@ obj-$(CONFIG_PPC_NATIVE)	+= hash_native.o
 obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_pgtable.o radix_tlb.o
 obj-$(CONFIG_PPC_4K_PAGES)	+= hash_4k.o
 obj-$(CONFIG_PPC_64K_PAGES)	+= hash_64k.o
-obj-$(CONFIG_PPC_SPLPAR)	+= vphn.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hash_hugetlbpage.o
 ifdef CONFIG_HUGETLB_PAGE
 obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_hugetlbpage.o
diff --git a/arch/powerpc/mm/book3s64/vphn.h b/arch/powerpc/mm/book3s64/vphn.h
deleted file mode 100644
index f7ff1e0c3801..000000000000
--- a/arch/powerpc/mm/book3s64/vphn.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ARCH_POWERPC_MM_VPHN_H_
-#define _ARCH_POWERPC_MM_VPHN_H_
-
-/* The H_HOME_NODE_ASSOCIATIVITY h_call returns 6 64-bit registers. */
-#define VPHN_REGISTER_COUNT 6
-
-/*
- * 6 64-bit registers unpacked into up to 24 be32 associativity values. To
- * form the complete property we have to add the length in the first cell.
- */
-#define VPHN_ASSOC_BUFSIZE (VPHN_REGISTER_COUNT*sizeof(u64)/sizeof(u16) + 1)
-
-/*
- * The H_HOME_NODE_ASSOCIATIVITY hcall takes two values for flags:
- * 1 for retrieving associativity information for a guest cpu
- * 2 for retrieving associativity information for a host/hypervisor cpu
- */
-#define VPHN_FLAG_VCPU	1
-#define VPHN_FLAG_PCPU	2
-
-extern int vphn_unpack_associativity(const long *packed, __be32 *unpacked);
-
-#endif
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 42ea79514420..77f673717362 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1063,9 +1063,6 @@ u64 memory_hotplug_max(void)
 
 /* Virtual Processor Home Node (VPHN) support */
 #ifdef CONFIG_PPC_SPLPAR
-
-#include "book3s64/vphn.h"
-
 struct topology_update_data {
 	struct topology_update_data *next;
 	unsigned int cpu;
@@ -1083,17 +1080,6 @@ static void reset_topology_timer(void);
 static int topology_timer_secs = 1;
 static int topology_inited;
 
-static long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity)
-{
-	long rc;
-	long retbuf[PLPAR_HCALL9_BUFSIZE] = {0};
-
-	rc = plpar_hcall9(H_HOME_NODE_ASSOCIATIVITY, retbuf, flags, cpu);
-	vphn_unpack_associativity(retbuf, associativity);
-
-	return rc;
-}
-
 /*
  * Change polling interval for associativity changes.
  */
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index a43ec843c8e2..ab3d59aeacca 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_LPARCFG)		+= lparcfg.o
 obj-$(CONFIG_IBMVIO)		+= vio.o
 obj-$(CONFIG_IBMEBUS)		+= ibmebus.o
 obj-$(CONFIG_PAPR_SCM)		+= papr_scm.o
+obj-$(CONFIG_PPC_SPLPAR)	+= vphn.o
 
 ifdef CONFIG_PPC_PSERIES
 obj-$(CONFIG_SUSPEND)		+= suspend.o
diff --git a/arch/powerpc/mm/book3s64/vphn.c b/arch/powerpc/platforms/pseries/vphn.c
similarity index 80%
rename from arch/powerpc/mm/book3s64/vphn.c
rename to arch/powerpc/platforms/pseries/vphn.c
index 0ee7734afb50..3f07bf6c670e 100644
--- a/arch/powerpc/mm/book3s64/vphn.c
+++ b/arch/powerpc/platforms/pseries/vphn.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <asm/byteorder.h>
-#include "vphn.h"
+#include <asm/lppaca.h>
 
 /*
  * The associativity domain numbers are returned from the hypervisor as a
@@ -22,7 +22,7 @@
  *
  * Convert to the sequence they would appear in the ibm,associativity property.
  */
-int vphn_unpack_associativity(const long *packed, __be32 *unpacked)
+static int vphn_unpack_associativity(const long *packed, __be32 *unpacked)
 {
 	__be64 be_packed[VPHN_REGISTER_COUNT];
 	int i, nr_assoc_doms = 0;
@@ -71,3 +71,19 @@ int vphn_unpack_associativity(const long *packed, __be32 *unpacked)
 
 	return nr_assoc_doms;
 }
+
+/* NOTE: This file is included by a selftest and built in userspace. */
+#ifdef __KERNEL__
+#include <asm/hvcall.h>
+
+long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity)
+{
+	long rc;
+	long retbuf[PLPAR_HCALL9_BUFSIZE] = {0};
+
+	rc = plpar_hcall9(H_HOME_NODE_ASSOCIATIVITY, retbuf, flags, cpu);
+	vphn_unpack_associativity(retbuf, associativity);
+
+	return rc;
+}
+#endif
diff --git a/tools/testing/selftests/powerpc/vphn/Makefile b/tools/testing/selftests/powerpc/vphn/Makefile
index 18b885da01bd..cf65cbf33085 100644
--- a/tools/testing/selftests/powerpc/vphn/Makefile
+++ b/tools/testing/selftests/powerpc/vphn/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 TEST_GEN_PROGS := test-vphn
 
-CFLAGS += -m64
+CFLAGS += -m64 -I$(CURDIR)
 
 top_srcdir = ../../../../..
 include ../../lib.mk
diff --git a/tools/testing/selftests/powerpc/vphn/asm/lppaca.h b/tools/testing/selftests/powerpc/vphn/asm/lppaca.h
new file mode 120000
index 000000000000..942b1d00999c
--- /dev/null
+++ b/tools/testing/selftests/powerpc/vphn/asm/lppaca.h
@@ -0,0 +1 @@
+../../../../../../arch/powerpc/include/asm/lppaca.h
\ No newline at end of file
diff --git a/tools/testing/selftests/powerpc/vphn/vphn.c b/tools/testing/selftests/powerpc/vphn/vphn.c
index 1d1f5f2be3b2..5b5fbddccabd 120000
--- a/tools/testing/selftests/powerpc/vphn/vphn.c
+++ b/tools/testing/selftests/powerpc/vphn/vphn.c
@@ -1 +1 @@
-../../../../../arch/powerpc/mm/book3s64/vphn.c
\ No newline at end of file
+../../../../../arch/powerpc/platforms/pseries/vphn.c
\ No newline at end of file
diff --git a/tools/testing/selftests/powerpc/vphn/vphn.h b/tools/testing/selftests/powerpc/vphn/vphn.h
deleted file mode 120000
index 45fe160f8288..000000000000
--- a/tools/testing/selftests/powerpc/vphn/vphn.h
+++ /dev/null
@@ -1 +0,0 @@
-../../../../../arch/powerpc/mm/book3s64/vphn.h
\ No newline at end of file
-- 
2.22.0

