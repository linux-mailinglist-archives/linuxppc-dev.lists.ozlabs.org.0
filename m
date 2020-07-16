Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD24222121
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 13:07:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6s0m49QRzDqyk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 21:07:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6rwf2hfYzDqx0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 21:04:02 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06GB2hpu098137; Thu, 16 Jul 2020 07:03:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 329x5ypwjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 07:03:56 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06GB2qBH099130;
 Thu, 16 Jul 2020 07:03:56 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 329x5ypwh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 07:03:55 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06GB11OE013507;
 Thu, 16 Jul 2020 11:03:53 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 327527wgwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 11:03:53 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06GB3oRF14746070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 11:03:51 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBDE242042;
 Thu, 16 Jul 2020 11:03:50 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A115842047;
 Thu, 16 Jul 2020 11:03:49 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jul 2020 11:03:49 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 1/5] selftests/powerpc: Move pkey helpers to headers
Date: Thu, 16 Jul 2020 16:33:43 +0530
Message-Id: <28e633fa9ec1a6500c12188e09ea1887b10a10c1.1594897099.git.sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1594897099.git.sandipan@linux.ibm.com>
References: <cover.1594897099.git.sandipan@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_05:2020-07-16,
 2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=3 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007160088
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
Cc: fweimer@redhat.com, aneesh.kumar@linux.ibm.com, linuxram@us.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This moves all the pkey-related helpers to a new header
file and also a helper to print error messages in signal
handlers to the existing utils header file.

Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 .../testing/selftests/powerpc/include/pkeys.h | 108 ++++++++++++++++++
 .../testing/selftests/powerpc/include/utils.h |   4 +
 .../selftests/powerpc/mm/pkey_exec_prot.c     | 100 +---------------
 3 files changed, 114 insertions(+), 98 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/include/pkeys.h

diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
new file mode 100644
index 0000000000000..9b53a97e664ea
--- /dev/null
+++ b/tools/testing/selftests/powerpc/include/pkeys.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020, Sandipan Das, IBM Corp.
+ */
+
+#ifndef _SELFTESTS_POWERPC_PKEYS_H
+#define _SELFTESTS_POWERPC_PKEYS_H
+
+#include <sys/mman.h>
+
+#include "reg.h"
+#include "utils.h"
+
+/*
+ * Older versions of libc use the Intel-specific access rights.
+ * Hence, override the definitions as they might be incorrect.
+ */
+#undef PKEY_DISABLE_ACCESS
+#define PKEY_DISABLE_ACCESS	0x3
+
+#undef PKEY_DISABLE_WRITE
+#define PKEY_DISABLE_WRITE	0x2
+
+#undef PKEY_DISABLE_EXECUTE
+#define PKEY_DISABLE_EXECUTE	0x4
+
+/* Older versions of libc do not not define this */
+#ifndef SEGV_PKUERR
+#define SEGV_PKUERR	4
+#endif
+
+#define SI_PKEY_OFFSET	0x20
+
+#define SYS_pkey_mprotect	386
+#define SYS_pkey_alloc		384
+#define SYS_pkey_free		385
+
+#define PKEY_BITS_PER_PKEY	2
+#define NR_PKEYS		32
+#define PKEY_BITS_MASK		((1UL << PKEY_BITS_PER_PKEY) - 1)
+
+inline unsigned long pkeyreg_get(void)
+{
+	return mfspr(SPRN_AMR);
+}
+
+inline void pkeyreg_set(unsigned long amr)
+{
+	set_amr(amr);
+}
+
+void pkey_set_rights(int pkey, unsigned long rights)
+{
+	unsigned long amr, shift;
+
+	shift = (NR_PKEYS - pkey - 1) * PKEY_BITS_PER_PKEY;
+	amr = pkeyreg_get();
+	amr &= ~(PKEY_BITS_MASK << shift);
+	amr |= (rights & PKEY_BITS_MASK) << shift;
+	pkeyreg_set(amr);
+}
+
+int sys_pkey_mprotect(void *addr, size_t len, int prot, int pkey)
+{
+	return syscall(SYS_pkey_mprotect, addr, len, prot, pkey);
+}
+
+int sys_pkey_alloc(unsigned long flags, unsigned long rights)
+{
+	return syscall(SYS_pkey_alloc, flags, rights);
+}
+
+int sys_pkey_free(int pkey)
+{
+	return syscall(SYS_pkey_free, pkey);
+}
+
+int pkeys_unsupported(void)
+{
+	bool hash_mmu = false;
+	int pkey;
+
+	/* Protection keys are currently supported on Hash MMU only */
+	FAIL_IF(using_hash_mmu(&hash_mmu));
+	SKIP_IF(!hash_mmu);
+
+	/* Check if the system call is supported */
+	pkey = sys_pkey_alloc(0, 0);
+	SKIP_IF(pkey < 0);
+	sys_pkey_free(pkey);
+
+	return 0;
+}
+
+int siginfo_pkey(siginfo_t *si)
+{
+	/*
+	 * In older versions of libc, siginfo_t does not have si_pkey as
+	 * a member.
+	 */
+#ifdef si_pkey
+	return si->si_pkey;
+#else
+	return *((int *)(((char *) si) + SI_PKEY_OFFSET));
+#endif
+}
+
+#endif /* _SELFTESTS_POWERPC_PKEYS_H */
diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index 9dbe607cc5ec3..7f259f36e23bc 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -97,6 +97,10 @@ do {								\
 #define _str(s) #s
 #define str(s) _str(s)
 
+#define sigsafe_err(msg)	({ \
+		ssize_t nbytes __attribute__((unused)); \
+		nbytes = write(STDERR_FILENO, msg, strlen(msg)); })
+
 /* POWER9 feature */
 #ifndef PPC_FEATURE2_ARCH_3_00
 #define PPC_FEATURE2_ARCH_3_00 0x00800000
diff --git a/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c b/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
index 7c7c93425c5e9..1253ad6afba24 100644
--- a/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
+++ b/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
@@ -14,83 +14,13 @@
 #include <signal.h>
 
 #include <unistd.h>
-#include <sys/mman.h>
 
-#include "reg.h"
-#include "utils.h"
-
-/*
- * Older versions of libc use the Intel-specific access rights.
- * Hence, override the definitions as they might be incorrect.
- */
-#undef PKEY_DISABLE_ACCESS
-#define PKEY_DISABLE_ACCESS	0x3
-
-#undef PKEY_DISABLE_WRITE
-#define PKEY_DISABLE_WRITE	0x2
-
-#undef PKEY_DISABLE_EXECUTE
-#define PKEY_DISABLE_EXECUTE	0x4
-
-/* Older versions of libc do not not define this */
-#ifndef SEGV_PKUERR
-#define SEGV_PKUERR	4
-#endif
-
-#define SI_PKEY_OFFSET	0x20
-
-#define SYS_pkey_mprotect	386
-#define SYS_pkey_alloc		384
-#define SYS_pkey_free		385
-
-#define PKEY_BITS_PER_PKEY	2
-#define NR_PKEYS		32
-#define PKEY_BITS_MASK		((1UL << PKEY_BITS_PER_PKEY) - 1)
+#include "pkeys.h"
 
 #define PPC_INST_NOP	0x60000000
 #define PPC_INST_TRAP	0x7fe00008
 #define PPC_INST_BLR	0x4e800020
 
-#define sigsafe_err(msg)	({ \
-		ssize_t nbytes __attribute__((unused)); \
-		nbytes = write(STDERR_FILENO, msg, strlen(msg)); })
-
-static inline unsigned long pkeyreg_get(void)
-{
-	return mfspr(SPRN_AMR);
-}
-
-static inline void pkeyreg_set(unsigned long amr)
-{
-	set_amr(amr);
-}
-
-static void pkey_set_rights(int pkey, unsigned long rights)
-{
-	unsigned long amr, shift;
-
-	shift = (NR_PKEYS - pkey - 1) * PKEY_BITS_PER_PKEY;
-	amr = pkeyreg_get();
-	amr &= ~(PKEY_BITS_MASK << shift);
-	amr |= (rights & PKEY_BITS_MASK) << shift;
-	pkeyreg_set(amr);
-}
-
-static int sys_pkey_mprotect(void *addr, size_t len, int prot, int pkey)
-{
-	return syscall(SYS_pkey_mprotect, addr, len, prot, pkey);
-}
-
-static int sys_pkey_alloc(unsigned long flags, unsigned long rights)
-{
-	return syscall(SYS_pkey_alloc, flags, rights);
-}
-
-static int sys_pkey_free(int pkey)
-{
-	return syscall(SYS_pkey_free, pkey);
-}
-
 static volatile sig_atomic_t fault_pkey, fault_code, fault_type;
 static volatile sig_atomic_t remaining_faults;
 static volatile unsigned int *fault_addr;
@@ -110,16 +40,7 @@ static void segv_handler(int signum, siginfo_t *sinfo, void *ctx)
 {
 	int signal_pkey;
 
-	/*
-	 * In older versions of libc, siginfo_t does not have si_pkey as
-	 * a member.
-	 */
-#ifdef si_pkey
-	signal_pkey = sinfo->si_pkey;
-#else
-	signal_pkey = *((int *)(((char *) sinfo) + SI_PKEY_OFFSET));
-#endif
-
+	signal_pkey = siginfo_pkey(sinfo);
 	fault_code = sinfo->si_code;
 
 	/* Check if this fault originated from the expected address */
@@ -178,23 +99,6 @@ static void segv_handler(int signum, siginfo_t *sinfo, void *ctx)
 	remaining_faults--;
 }
 
-static int pkeys_unsupported(void)
-{
-	bool hash_mmu = false;
-	int pkey;
-
-	/* Protection keys are currently supported on Hash MMU only */
-	FAIL_IF(using_hash_mmu(&hash_mmu));
-	SKIP_IF(!hash_mmu);
-
-	/* Check if the system call is supported */
-	pkey = sys_pkey_alloc(0, 0);
-	SKIP_IF(pkey < 0);
-	sys_pkey_free(pkey);
-
-	return 0;
-}
-
 static int test(void)
 {
 	struct sigaction segv_act, trap_act;
-- 
2.25.1

