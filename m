Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDB346389
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 18:00:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QQKp2bNbzDqcg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 01:59:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QQ0920MCzDrSL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 01:44:41 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5EFhP8E017252
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 11:44:38 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t4e0csddg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 11:44:38 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Fri, 14 Jun 2019 16:44:36 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 14 Jun 2019 16:44:34 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5EFiWeH37814290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2019 15:44:32 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51E1111C05B;
 Fri, 14 Jun 2019 15:44:32 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD76111C052;
 Fri, 14 Jun 2019 15:44:30 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.70.176])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Jun 2019 15:44:30 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 6/9] powerpc/pseries: Move mm/book3s64/vphn.c under
 platforms/pseries/
Date: Fri, 14 Jun 2019 21:14:04 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560526066.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1560526066.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061415-4275-0000-0000-000003425D1B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061415-4276-0000-0000-000038527B42
Message-Id: <02f345abb8bc1ff686c7a4bed32233b7d71abb7b.1560526066.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-14_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906140130
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
arch/powerpc/platforms/pseries. Also merge vphn.h into plpar_wrappers.h

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/plpar_wrappers.h     | 19 +++++++++++++++
 arch/powerpc/mm/book3s64/Makefile             |  1 -
 arch/powerpc/mm/book3s64/vphn.h               | 24 -------------------
 arch/powerpc/mm/numa.c                        | 13 +---------
 arch/powerpc/platforms/pseries/Makefile       |  1 +
 .../{mm/book3s64 => platforms/pseries}/vphn.c | 16 +++++++++++--
 6 files changed, 35 insertions(+), 39 deletions(-)
 delete mode 100644 arch/powerpc/mm/book3s64/vphn.h
 rename arch/powerpc/{mm/book3s64 => platforms/pseries}/vphn.c (83%)

diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index ab7dd454b6eb..5f72f1fa4f81 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -11,6 +11,25 @@
 #include <asm/paca.h>
 #include <asm/page.h>
 
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
+long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity);
+
 static inline long poll_pending(void)
 {
 	return plpar_hcall_norets(H_POLL_PENDING);
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
index 42ea79514420..5027c9cfe56a 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1064,7 +1064,7 @@ u64 memory_hotplug_max(void)
 /* Virtual Processor Home Node (VPHN) support */
 #ifdef CONFIG_PPC_SPLPAR
 
-#include "book3s64/vphn.h"
+#include <asm/plpar_wrappers.h>
 
 struct topology_update_data {
 	struct topology_update_data *next;
@@ -1083,17 +1083,6 @@ static void reset_topology_timer(void);
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
similarity index 83%
rename from arch/powerpc/mm/book3s64/vphn.c
rename to arch/powerpc/platforms/pseries/vphn.c
index 0ee7734afb50..6bbed333e4f2 100644
--- a/arch/powerpc/mm/book3s64/vphn.c
+++ b/arch/powerpc/platforms/pseries/vphn.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <asm/plpar_wrappers.h>
 #include <asm/byteorder.h>
-#include "vphn.h"
+#include <asm/hvcall.h>
 
 /*
  * The associativity domain numbers are returned from the hypervisor as a
@@ -22,7 +23,7 @@
  *
  * Convert to the sequence they would appear in the ibm,associativity property.
  */
-int vphn_unpack_associativity(const long *packed, __be32 *unpacked)
+static int vphn_unpack_associativity(const long *packed, __be32 *unpacked)
 {
 	__be64 be_packed[VPHN_REGISTER_COUNT];
 	int i, nr_assoc_doms = 0;
@@ -71,3 +72,14 @@ int vphn_unpack_associativity(const long *packed, __be32 *unpacked)
 
 	return nr_assoc_doms;
 }
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
-- 
2.21.0

