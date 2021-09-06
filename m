Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD4140182A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 10:44:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H325d2xs1z2xYS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 18:44:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oNGVzF5w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oNGVzF5w; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H32456gVFz2xfJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Sep 2021 18:43:33 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1868XQ1c110209; Mon, 6 Sep 2021 04:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CYPpLH51wIhxogq90RqxfmevoZ3Hp+g4MRPhUqQuGJA=;
 b=oNGVzF5wKf52w3iHVboUz0OkHM20yqxzbvSnCz6tpbf/RZcc5Pf8T7K1UVh8sjJv5/yp
 rDuF6dZQCrklwIr0tJzHMh+KEnGzhFwEpmwzBNPqIuvMA/Fje0Pbozu26DgEjI4vp7n5
 gXFfsRwc39dsHwK4CgmCxJL5YJnp+2+7g17NtpzKHs2W9QUCQPpsRvPtBhgms6fWb6hs
 aUXSG9K/DyUwKwPRbdWm47cDYwNPvXUGg55mkGbMuCLySvFr7Ziej6Mc0Bw33F5vVVoy
 cfFhYoL0Q6bSINtGKlq4B3dC9K6uzooewVQj6+JKfU7Tnu+hHwZZ8Xb3NtebNjynUdx7 FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3awf2v8yd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 04:43:27 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1868XbF2111093;
 Mon, 6 Sep 2021 04:43:27 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3awf2v8yc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 04:43:27 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1868hLF7011198;
 Mon, 6 Sep 2021 08:43:25 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3av0e90u1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 08:43:25 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1868dBWo61473040
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Sep 2021 08:39:11 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AC6BAE051;
 Mon,  6 Sep 2021 08:43:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C6AEAE058;
 Mon,  6 Sep 2021 08:43:19 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.com (unknown
 [9.43.82.144]) by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Sep 2021 08:43:18 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 2/3] selftests/powerpc: Add test for real address error
 handling
Date: Mon,  6 Sep 2021 14:13:02 +0530
Message-Id: <20210906084303.183921-2-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906084303.183921-1-ganeshgr@linux.ibm.com>
References: <20210906084303.183921-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _-qneiQr1wckjdi_BEvrQv1Pz38kTrDJ
X-Proofpoint-ORIG-GUID: WMUTbv3QU_MljAGDCzc8AJZftfwJpVX8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_04:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060054
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add test for real address or control memory address access
error handling, using NX-GZIP engine.

The error is injected by accessing the control memory address
using illegal instruction, on successful handling the process
attempting to access control memory address using illegal
instruction receives SIGBUS.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
v3: Avoid using shell script to inject error.

v2: Fix build error.
---
 tools/testing/selftests/powerpc/Makefile      |  3 +-
 tools/testing/selftests/powerpc/mce/Makefile  |  7 ++
 .../selftests/powerpc/mce/inject-ra-err.c     | 65 +++++++++++++++++++
 tools/testing/selftests/powerpc/mce/vas-api.h |  1 +
 4 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/mce/Makefile
 create mode 100644 tools/testing/selftests/powerpc/mce/inject-ra-err.c
 create mode 120000 tools/testing/selftests/powerpc/mce/vas-api.h

diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
index 0830e63818c1..4830372d7416 100644
--- a/tools/testing/selftests/powerpc/Makefile
+++ b/tools/testing/selftests/powerpc/Makefile
@@ -31,7 +31,8 @@ SUB_DIRS = alignment		\
 	   vphn         \
 	   math		\
 	   ptrace	\
-	   security
+	   security	\
+	   mce
 
 endif
 
diff --git a/tools/testing/selftests/powerpc/mce/Makefile b/tools/testing/selftests/powerpc/mce/Makefile
new file mode 100644
index 000000000000..2424513982d9
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mce/Makefile
@@ -0,0 +1,7 @@
+#SPDX-License-Identifier: GPL-2.0-or-later
+
+TEST_GEN_PROGS := inject-ra-err
+
+include ../../lib.mk
+
+$(TEST_GEN_PROGS): ../harness.c
diff --git a/tools/testing/selftests/powerpc/mce/inject-ra-err.c b/tools/testing/selftests/powerpc/mce/inject-ra-err.c
new file mode 100644
index 000000000000..94323c34d9a6
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mce/inject-ra-err.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <errno.h>
+#include <fcntl.h>
+#include <signal.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+#include "vas-api.h"
+#include "utils.h"
+
+static bool faulted;
+
+static void sigbus_handler(int n, siginfo_t *info, void *ctxt_v)
+{
+	ucontext_t *ctxt = (ucontext_t *)ctxt_v;
+	struct pt_regs *regs = ctxt->uc_mcontext.regs;
+
+	faulted = true;
+	regs->nip += 4;
+}
+
+static int test_ra_error(void)
+{
+	struct vas_tx_win_open_attr attr;
+	int fd, *paste_addr;
+	char *devname = "/dev/crypto/nx-gzip";
+	struct sigaction act = {
+		.sa_sigaction = sigbus_handler,
+		.sa_flags = SA_SIGINFO,
+	};
+
+	memset(&attr, 0, sizeof(attr));
+	attr.version = 1;
+	attr.vas_id = 0;
+
+	SKIP_IF(access(devname, F_OK));
+
+	fd = open(devname, O_RDWR);
+	FAIL_IF(fd < 0);
+	FAIL_IF(ioctl(fd, VAS_TX_WIN_OPEN, &attr) < 0);
+	FAIL_IF(sigaction(SIGBUS, &act, NULL) != 0);
+
+	paste_addr = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0ULL);
+
+	/* The following assignment triggers exception */
+	mb();
+	*paste_addr = 1;
+	mb();
+
+	FAIL_IF(!faulted);
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(test_ra_error, "inject-ra-err");
+}
+
diff --git a/tools/testing/selftests/powerpc/mce/vas-api.h b/tools/testing/selftests/powerpc/mce/vas-api.h
new file mode 120000
index 000000000000..1455c1bcd351
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mce/vas-api.h
@@ -0,0 +1 @@
+../../../../../arch/powerpc/include/uapi/asm/vas-api.h
\ No newline at end of file
-- 
2.31.1

