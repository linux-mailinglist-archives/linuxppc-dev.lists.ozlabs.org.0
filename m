Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BBD3DBE55
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jul 2021 20:25:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gbwn03FC3z3dDZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 04:25:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U3UGlbLH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=U3UGlbLH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gbwly41dLz2yMq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jul 2021 04:24:29 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16UI2mFU078567; Fri, 30 Jul 2021 14:24:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Kmhaq752ikg1W9jC2kH4xkZrNa6PYE6AGfdqeJJ0v6k=;
 b=U3UGlbLHsBVN8gbkSb1Qpyv/FMSxuYNXIKaqMbFly/+X1hM0sdFnHjCoj4PYKfj+ibWa
 mc3zD4tGoHO+vj8tl0k/RjAWkJwLFlAKUyBSqkyb2a3iV+6Lyahfov1c3GRBX5qg7qfv
 5+eJ+ZU/kJRBFpal82DSycneq2t69S3fqwK5uqG/dGuRrsj5ahKGqinbvsUeuS8Y+4Kw
 FjMhN1LePrmJt9ifXcp8t1wuBeX8foMCa8UOHwFmX+j28fZXMS95OmqoaL+Sj1gbMELX
 OlABKVnNGri0goTEDZ8Pu1btHvK7ryOkjn3LrPf8c9fnyV5EGmSImmthABWf/KKOyDD9 gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a4npnhj86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 14:24:20 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16UI2w97079822;
 Fri, 30 Jul 2021 14:24:19 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a4npnhj7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 14:24:19 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16UIMUTY009828;
 Fri, 30 Jul 2021 18:24:18 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3a235xuqwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 18:24:18 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16UILTak29032720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Jul 2021 18:21:29 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B34FA4040;
 Fri, 30 Jul 2021 18:24:14 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E99DA4055;
 Fri, 30 Jul 2021 18:24:12 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com (unknown
 [9.199.33.196])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 30 Jul 2021 18:24:11 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 2/3] selftests/powerpc: Add test for real address error
 handling
Date: Fri, 30 Jul 2021 23:53:48 +0530
Message-Id: <20210730182349.625819-2-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210730182349.625819-1-ganeshgr@linux.ibm.com>
References: <20210730182349.625819-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 01K6Cc1gc3aY4T0pr-aAo-1vQGP8NC4h
X-Proofpoint-GUID: wJCu1KtMqaVKGcc-_G1w7esY-qf0VM9z
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-30_11:2021-07-30,
 2021-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107300121
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
 tools/testing/selftests/powerpc/Makefile      |  3 +-
 tools/testing/selftests/powerpc/mce/Makefile  |  6 +++
 .../selftests/powerpc/mce/inject-ra-err.c     | 42 +++++++++++++++++++
 .../selftests/powerpc/mce/inject-ra-err.sh    | 19 +++++++++
 4 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/mce/Makefile
 create mode 100644 tools/testing/selftests/powerpc/mce/inject-ra-err.c
 create mode 100755 tools/testing/selftests/powerpc/mce/inject-ra-err.sh

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
index 000000000000..58374bc92e90
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
+#include <asm/vas-api.h>
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
index 000000000000..0e9c8ae6ad78
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mce/inject-ra-err.sh
@@ -0,0 +1,19 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+if [[ ! -w /dev/crypto/nx-gzip ]]; then
+	echo "WARN: Can't access /dev/crypto/nx-gzip, skipping"
+	exit 0
+fi
+
+# Timeout in 5 seconds, If not handled it may run indefinitely.
+timeout 5 ./inject-ra-err
+
+# 128 + 7 (SIGBUS) = 135, 128 is a exit Code With Special Meaning.
+if [ $? -ne 135 ]; then
+	echo "FAILED: Control memory access error not handled"
+	exit $?
+fi
+
+echo "OK: Control memory access error is handled"
+exit 0
-- 
2.31.1

