Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C5C2DA50E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 01:52:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cw08s0r4JzDqBP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 11:52:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=gromero@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jzowWCjL; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cw05s4QZ8zDqM5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 11:49:46 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BF0WFUk146676; Mon, 14 Dec 2020 19:49:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=CKyRv7Q4Fyt8qIWe2IOsm0mBjfnjoG0nr/UkyWu3Nyw=;
 b=jzowWCjLwLpVfcZYKRr4Z6ubpkdhdNrXVYko+yhrExZu9V5/qPU1HKF05ueXpKBx1+Nk
 4N9THcunxrjB8+4wZTa0cIpbD0IZ4i8C8f0YieAQcrGieVlVGCPxsbYfnTXmtJTYOE4r
 trmnR9fA22EJwJQLEfC0A1UefKB3d5yF8QCqZqS3zSLRsHi2NYE2B9/GeKVmE3qEIPTM
 XRwxGEJeJpt0gCEPR/hBDFSKsTbLDrKk6m+TkCGxG2Nt6EKI1DPV7TT3016Otqyuht+Z
 mbTWMo4P1aWgmvFelNm19alO2gmxTj7Anm2tqQxHGhs7JODsb6vw4bxemboIIbhJSMQf XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35ehy7h8nk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 19:49:38 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BF0ncix010625;
 Mon, 14 Dec 2020 19:49:38 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35ehy7h8ne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 19:49:38 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BF0W3hM029829;
 Tue, 15 Dec 2020 00:49:37 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 35cng8uu78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Dec 2020 00:49:37 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BF0nb9r29163776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Dec 2020 00:49:37 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2677AAE05C;
 Tue, 15 Dec 2020 00:49:37 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68744AE05F;
 Tue, 15 Dec 2020 00:49:34 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.201.212])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 15 Dec 2020 00:49:33 +0000 (GMT)
From: Gustavo Romero <gromero@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: Add test to check if TM is disabled when
 it must be
Date: Mon, 14 Dec 2020 19:49:01 -0500
Message-Id: <1607993341-30377-1-git-send-email-gromero@linux.ibm.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-14_13:2020-12-11,
 2020-12-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012140158
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
Cc: mikey@neuling.org, gustavo.romero@protonmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a TM test to check that when TM is not advertised by the OS (is disabled) a
transaction can not really be started and generates a SIGILL, which is the right
behavior in that case.

Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
---
 tools/testing/selftests/powerpc/tm/.gitignore |  1 +
 tools/testing/selftests/powerpc/tm/Makefile   |  2 +-
 tools/testing/selftests/powerpc/tm/tm-no-tm.c | 48 +++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/tm/tm-no-tm.c

diff --git a/tools/testing/selftests/powerpc/tm/.gitignore b/tools/testing/selftests/powerpc/tm/.gitignore
index d8900a0..1d23309 100644
--- a/tools/testing/selftests/powerpc/tm/.gitignore
+++ b/tools/testing/selftests/powerpc/tm/.gitignore
@@ -20,3 +20,4 @@ tm-unavailable
 tm-trap
 tm-sigreturn
 tm-poison
+tm-no-tm
diff --git a/tools/testing/selftests/powerpc/tm/Makefile b/tools/testing/selftests/powerpc/tm/Makefile
index 5881e97..756a03f 100644
--- a/tools/testing/selftests/powerpc/tm/Makefile
+++ b/tools/testing/selftests/powerpc/tm/Makefile
@@ -5,7 +5,7 @@ SIGNAL_CONTEXT_CHK_TESTS := tm-signal-context-chk-gpr tm-signal-context-chk-fpu
 TEST_GEN_PROGS := tm-resched-dscr tm-syscall tm-signal-msr-resv tm-signal-stack \
 	tm-vmxcopy tm-fork tm-tar tm-tmspr tm-vmx-unavail tm-unavailable tm-trap \
 	$(SIGNAL_CONTEXT_CHK_TESTS) tm-sigreturn tm-signal-sigreturn-nt \
-	tm-signal-context-force-tm tm-poison tm-signal-pagefault
+	tm-signal-context-force-tm tm-poison tm-signal-pagefault tm-no-tm
 
 TEST_FILES := settings
 
diff --git a/tools/testing/selftests/powerpc/tm/tm-no-tm.c b/tools/testing/selftests/powerpc/tm/tm-no-tm.c
new file mode 100644
index 0000000..3b83e20
--- /dev/null
+++ b/tools/testing/selftests/powerpc/tm/tm-no-tm.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020, Gustavo Romero, IBM Corp.
+ *
+ * This test checks if when TM is not supported by the OS indeed it's not
+ * possible to start a TM transaction. Moreover, when trying to start a new
+ * transaction the user gets an illegal instruction, which is the correct
+ * behavior in that case, instead of any other signal, like SIGSEGV etc.
+ *
+ * Since firmware can change the TM instruction behavior in many ways, it's good
+ * to have a test to check if TM is properly disabled when the OS advertises
+ * that TM is not available in userspace.
+ *
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <signal.h>
+
+#include "utils.h"
+#include "tm.h"
+
+void illegal_signal_handler(int signo_notused, siginfo_t *si_notused, void *uc_notused)
+{
+	exit(EXIT_SUCCESS);
+}
+
+int tm_no_tm_test(void)
+{
+	struct sigaction illegal_sa;
+
+	SKIP_IF(have_htm());
+
+	illegal_sa.sa_flags = SA_SIGINFO;
+	illegal_sa.sa_sigaction = illegal_signal_handler;
+
+	sigaction(SIGILL, &illegal_sa, NULL);
+
+	/* It must cause a SIGILL since TM is not supported by the OS */
+	asm("tbegin.;");
+
+	return EXIT_FAILURE;
+}
+
+int main(int argc, char **argv)
+{
+	return test_harness(tm_no_tm_test, "tm_no_tm_test");
+}
-- 
2.7.4

