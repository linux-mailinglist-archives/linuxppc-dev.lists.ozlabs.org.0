Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAF04878BC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 15:15:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVlck6Sm7z3bP1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jan 2022 01:15:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VN6JhUqc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VN6JhUqc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVlbz0Kmcz30Mm
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jan 2022 01:15:10 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207DnD88026095; 
 Fri, 7 Jan 2022 14:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RmkEGnOt3ZbibdhCyMQ4wZULG5uf3dzPs4B2f3jf/mY=;
 b=VN6JhUqc3kyzsqS/fThFOWhd5q7Hl40d0YFpiD0l0s+953WSJzZueWMjN6Zl7tkBfDTL
 JXapWCdWdN/UUIk8Z3NrOVB3+qLGUku8m9UuPM/Ylk0tMKSUCCi0pfERGSsvK/76cur2
 wqLSx0c5USwE9EV53AXPj0UD37DxN68GIsbyI7eSeXaByPELeuNhb3efNkqeKUrUNfDd
 RM507/CM2wLPn0XwEGeeWwYm60q+932dOUjNHUl4hzzPHzNZXZRYRGjtMsFeM5RkcPy6
 rdsTBTvrgJ4OC0p7UHjqtCzoOLZiSMrKBSjx4zIGpxTRAJdXzAjoAb5q7vFcaYyT2MjJ Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3depqvgfua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 14:15:05 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207EF41B013340;
 Fri, 7 Jan 2022 14:15:04 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3depqvgfts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 14:15:04 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207E7fWf021287;
 Fri, 7 Jan 2022 14:15:03 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3de4xgedpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 14:15:02 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207EExwZ44827134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 14:14:59 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFF4911C06E;
 Fri,  7 Jan 2022 14:14:59 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B50411C054;
 Fri,  7 Jan 2022 14:14:57 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.com (unknown
 [9.43.110.164])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 14:14:56 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 RESEND 2/3] selftests/powerpc: Add test for real address
 error handling
Date: Fri,  7 Jan 2022 19:44:27 +0530
Message-Id: <20220107141428.67862-2-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220107141428.67862-1-ganeshgr@linux.ibm.com>
References: <20220107141428.67862-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GKUg_c0WNALp2RSiDh3WqrdvdTFl1XpE
X-Proofpoint-GUID: sBBJg00oFYUiX-xSXxiJks5Ale0Y4K-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_05,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070097
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
 npiggin@gmail.com, dja@axtens.net
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

