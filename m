Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B516C3E1134
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 11:21:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgNQm43Ymz3dK0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 19:21:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p+bgl9k7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=p+bgl9k7; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgNPw3Jybz30FK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 19:20:52 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17594Bbf141595; Thu, 5 Aug 2021 05:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WeJLIEsSNDOJvPsWncm3PmOj2HPSONDtpuuWF0qwzA4=;
 b=p+bgl9k7VcEwt74frTX4sMX05EAtC+EKg8Yfbp1BdwYkYeXn+ZjK5l+Jxr3jJBvyvLeq
 TeNMbPAk1ALAGqhTuz5UUjR0CuwcTNj7AK4oMf4WoINKJY99MerIryR+nE9fCVmn8vDq
 qa8uhcAIoN1Xwq6XZokg5Y3HOFjz1hH0p6IEpCOBuwQ6FB01le1dXMQED8LZ+09y0Rvs
 IXBHX9zQJP6oWAiSgSQswx1ZCQr38P4QCkrWhmVl7Tgy9Lu+1QkcLucPtV4ku5FRTNzG
 vjjXmgIiPxHyid189DylkZOCOePE4vpz7ReSym44CQIQFTSUkZVKYujfvWAP5bGAz7o9 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a846b4sr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 05:20:46 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17595CbT146870;
 Thu, 5 Aug 2021 05:20:45 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a846b4sqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 05:20:45 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17597gcK005862;
 Thu, 5 Aug 2021 09:20:44 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3a4x58stw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 09:20:44 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1759KeuF54264208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 09:20:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F25F8AE05D;
 Thu,  5 Aug 2021 09:20:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7983AAE061;
 Thu,  5 Aug 2021 09:20:37 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.com (unknown
 [9.85.115.109])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 09:20:37 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 2/3] selftests/powerpc: Add test for real address error
 handling
Date: Thu,  5 Aug 2021 14:50:24 +0530
Message-Id: <20210805092025.272871-2-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
References: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4Goz4_7HCzHnJUKw28EKIBb2JQACuEQA
X-Proofpoint-GUID: wRNyr7Xn8_7hIkZmFY9Y_vjPT8-_bMwx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_03:2021-08-05,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108050054
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
Cc: mikey@neuling.org, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 mahesh@linux.ibm.com, npiggin@gmail.com
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
v2: Fix build error.
---
 tools/testing/selftests/powerpc/Makefile      |  3 +-
 tools/testing/selftests/powerpc/mce/Makefile  |  6 +++
 .../selftests/powerpc/mce/inject-ra-err.c     | 42 +++++++++++++++++++
 .../selftests/powerpc/mce/inject-ra-err.sh    | 18 ++++++++
 tools/testing/selftests/powerpc/mce/vas-api.h |  1 +
 5 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/mce/Makefile
 create mode 100644 tools/testing/selftests/powerpc/mce/inject-ra-err.c
 create mode 100755 tools/testing/selftests/powerpc/mce/inject-ra-err.sh
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
index 000000000000..0f537ce86370
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mce/Makefile
@@ -0,0 +1,6 @@
+#SPDX-License-Identifier: GPL-2.0-or-later
+
+TEST_PROGS := inject-ra-err.sh
+TEST_GEN_FILES := inject-ra-err
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/powerpc/mce/inject-ra-err.c b/tools/testing/selftests/powerpc/mce/inject-ra-err.c
new file mode 100644
index 000000000000..05ab11cec3da
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mce/inject-ra-err.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <stdio.h>
+#include <unistd.h>
+#include <string.h>
+#include <errno.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <fcntl.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include "vas-api.h"
+
+int main(void)
+{
+	int fd, ret;
+	int *paste_addr;
+	struct vas_tx_win_open_attr attr;
+	char *devname = "/dev/crypto/nx-gzip";
+
+	memset(&attr, 0, sizeof(attr));
+	attr.version = 1;
+	attr.vas_id = 0;
+
+	fd = open(devname, O_RDWR);
+	if (fd < 0) {
+		fprintf(stderr, "Failed to open device %s\n", devname);
+		return -errno;
+	}
+	ret = ioctl(fd, VAS_TX_WIN_OPEN, &attr);
+	if (ret < 0) {
+		fprintf(stderr, "ioctl() n %d, error %d\n", ret, errno);
+		ret = -errno;
+		goto out;
+	}
+	paste_addr = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0ULL);
+	/* The following assignment triggers exception */
+	*paste_addr = 1;
+	ret = 0;
+out:
+	close(fd);
+	return ret;
+}
diff --git a/tools/testing/selftests/powerpc/mce/inject-ra-err.sh b/tools/testing/selftests/powerpc/mce/inject-ra-err.sh
new file mode 100755
index 000000000000..3633cdc651a1
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mce/inject-ra-err.sh
@@ -0,0 +1,18 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+if [[ ! -w /dev/crypto/nx-gzip ]]; then
+	echo "WARN: Can't access /dev/crypto/nx-gzip, skipping"
+	exit 0
+fi
+
+timeout 5 ./inject-ra-err
+
+# 128 + 7 (SIGBUS) = 135, 128 is a exit code with special meaning.
+if [ $? -ne 135 ]; then
+	echo "FAILED: Real address or Control memory access error not handled"
+	exit $?
+fi
+
+echo "OK: Real address or Control memory access error is handled"
+exit 0
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

