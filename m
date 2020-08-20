Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D5824AE2B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 06:59:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXC9R4gRMzDr1R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 14:59:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CxDdKttW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXC7X2pk6zDr0T
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 14:57:27 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07K4XVL6194508; Thu, 20 Aug 2020 00:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JGHAfLeH05yLStqNEmAWiWbfReOOihY0wYJCXH6xXNA=;
 b=CxDdKttWlVF8pl2P+YeRlSKnh+wF1AS2adhJQPoSq46YOvuzsn8dAbl+x59QDaPGy2GJ
 J+fbMDan1JhepkMGf6G+4Ev0+7B0cynVTbzvBmvbVIuGZD89rjVM/v3s1nsu45RImhav
 Bzs+7Ios1vdyT0yIxe/4gRj3hfHUXLBlSfxcCVDSDCTMbFD6xNyfvRZQjJ17r7IO6GGh
 lteZaL3Bl9iNcgLfW4sAZWBy99C7dt81ga7uKAJW98EamWnQ4ALCqnbIFZNgQ4cJoK8c
 yzER/hTobojD6LiaElyzQrZ5Y5jZxWgcbzGzZvcZQFTYdoEVJyKLCkFHkvqOLJXGVan5 xA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 330ccbjg98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 00:57:24 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07K4vLS8091319;
 Thu, 20 Aug 2020 00:57:21 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 330ccbjer3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 00:56:06 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07K4ik5T021263;
 Thu, 20 Aug 2020 04:45:50 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3304cc2pt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 04:45:50 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07K4jm3G26214834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Aug 2020 04:45:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AE28A4060;
 Thu, 20 Aug 2020 04:45:48 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 916A3A405B;
 Thu, 20 Aug 2020 04:45:47 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Aug 2020 04:45:47 +0000 (GMT)
Received: from intelligence.ibm.com (unknown [9.102.47.244])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3833AA00E7;
 Thu, 20 Aug 2020 14:45:46 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] selftests/powerpc: Add a rtas_filter selftest
Date: Thu, 20 Aug 2020 14:45:14 +1000
Message-Id: <20200820044512.7543-2-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200820044512.7543-1-ajd@linux.ibm.com>
References: <20200820044512.7543-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_13:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008200039
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
Cc: nathanl@linux.ibm.com, leobras.c@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a selftest to test the basic functionality of CONFIG_RTAS_FILTER.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v1->v2:
- new patch

---
 .../selftests/powerpc/syscalls/Makefile       |   2 +-
 .../selftests/powerpc/syscalls/rtas_filter.c  | 285 ++++++++++++++++++
 2 files changed, 286 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/syscalls/rtas_filter.c

diff --git a/tools/testing/selftests/powerpc/syscalls/Makefile b/tools/testing/selftests/powerpc/syscalls/Makefile
index 01b22775ca87..b63f8459c704 100644
--- a/tools/testing/selftests/powerpc/syscalls/Makefile
+++ b/tools/testing/selftests/powerpc/syscalls/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-TEST_GEN_PROGS := ipc_unmuxed
+TEST_GEN_PROGS := ipc_unmuxed rtas_filter
 
 CFLAGS += -I../../../../../usr/include
 
diff --git a/tools/testing/selftests/powerpc/syscalls/rtas_filter.c b/tools/testing/selftests/powerpc/syscalls/rtas_filter.c
new file mode 100644
index 000000000000..3b0ac4ff64e5
--- /dev/null
+++ b/tools/testing/selftests/powerpc/syscalls/rtas_filter.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2005-2020 IBM Corporation.
+ *
+ * Includes code from librtas (https://github.com/ibm-power-utilities/librtas/)
+ */
+
+#include <byteswap.h>
+#include <stdint.h>
+#include <inttypes.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/syscall.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <stdarg.h>
+#include <stdlib.h>
+#include <fcntl.h>
+#include <errno.h>
+#include "utils.h"
+
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+#define cpu_to_be32(x)		bswap_32(x)
+#define be32_to_cpu(x)		bswap_32(x)
+#else
+#define cpu_to_be32(x)		(x)
+#define be32_to_cpu(x)		(x)
+#endif
+
+#define RTAS_IO_ASSERT	-1098	/* Unexpected I/O Error */
+#define RTAS_UNKNOWN_OP -1099	/* No Firmware Implementation of Function */
+#define BLOCK_SIZE 4096
+#define PAGE_SIZE 4096
+#define MAX_PAGES 64
+
+static const char *ofdt_rtas_path = "/proc/device-tree/rtas";
+
+typedef __be32 uint32_t;
+struct rtas_args {
+	__be32 token;
+	__be32 nargs;
+	__be32 nret;
+	__be32 args[16];
+	__be32 *rets;	  /* Pointer to return values in args[]. */
+};
+
+struct region {
+	uint64_t addr;
+	uint32_t size;
+	struct region *next;
+};
+
+int read_entire_file(int fd, char **buf, size_t *len)
+{
+	size_t buf_size = 0;
+	size_t off = 0;
+	int rc;
+
+	*buf = NULL;
+	do {
+		buf_size += BLOCK_SIZE;
+		if (*buf == NULL)
+			*buf = malloc(buf_size);
+		else
+			*buf = realloc(*buf, buf_size);
+
+		if (*buf == NULL)
+			return -ENOMEM;
+
+		rc = read(fd, *buf + off, BLOCK_SIZE);
+		if (rc < 0)
+			return -EIO;
+
+		off += rc;
+	} while (rc == BLOCK_SIZE);
+
+	if (len)
+		*len = off;
+
+	return 0;
+}
+
+static int open_prop_file(const char *prop_path, const char *prop_name, int *fd)
+{
+	char *path;
+	int len;
+
+	/* allocate enough for two string, a slash and trailing NULL */
+	len = strlen(prop_path) + strlen(prop_name) + 1 + 1;
+	path = malloc(len);
+	if (path == NULL)
+		return -ENOMEM;
+
+	snprintf(path, len, "%s/%s", prop_path, prop_name);
+
+	*fd = open(path, O_RDONLY);
+	free(path);
+	if (*fd < 0)
+		return -errno;
+
+	return 0;
+}
+
+static int get_property(const char *prop_path, const char *prop_name,
+			char **prop_val, size_t *prop_len)
+{
+	int rc, fd;
+
+	rc = open_prop_file(prop_path, prop_name, &fd);
+	if (rc)
+		return rc;
+
+	rc = read_entire_file(fd, prop_val, prop_len);
+	close(fd);
+
+	return rc;
+}
+
+int rtas_token(const char *call_name)
+{
+	char *prop_buf = NULL;
+	size_t len;
+	int rc;
+
+	rc = get_property(ofdt_rtas_path, call_name, &prop_buf, &len);
+	if (rc < 0) {
+		rc = RTAS_UNKNOWN_OP;
+		goto err;
+	}
+
+	rc = be32_to_cpu(*(int *)prop_buf);
+
+err:
+	free(prop_buf);
+	return rc;
+}
+
+static int read_kregion_bounds(struct region *kregion)
+{
+	char *buf;
+	int fd;
+	int rc;
+
+	fd = open("/proc/ppc64/rtas/rmo_buffer", O_RDONLY);
+	if (fd < 0) {
+		printf("Could not open rmo_buffer file\n");
+		return RTAS_IO_ASSERT;
+	}
+
+	rc = read_entire_file(fd, &buf, NULL);
+	close(fd);
+	if (rc) {
+		free(buf);
+		return rc;
+	}
+
+	sscanf(buf, "%" SCNx64 " %x", &kregion->addr, &kregion->size);
+	free(buf);
+
+	if (!(kregion->size && kregion->addr) ||
+	    (kregion->size > (PAGE_SIZE * MAX_PAGES))) {
+		printf("Unexpected kregion bounds\n");
+		return RTAS_IO_ASSERT;
+	}
+
+	return 0;
+}
+
+static int rtas_call(const char *name, int nargs,
+		     int nrets, ...)
+{
+	struct rtas_args args;
+	__be32 *rets[16];
+	int i, rc, token;
+	va_list ap;
+
+	va_start(ap, nrets);
+
+	token = rtas_token(name);
+	if (token == RTAS_UNKNOWN_OP) {
+		// We don't care if the call doesn't exist
+		printf("call '%s' not available, skipping...", name);
+		rc = RTAS_UNKNOWN_OP;
+		goto err;
+	}
+
+	args.token = cpu_to_be32(token);
+	args.nargs = cpu_to_be32(nargs);
+	args.nret = cpu_to_be32(nrets);
+
+	for (i = 0; i < nargs; i++)
+		args.args[i] = (__be32) va_arg(ap, unsigned long);
+
+	for (i = 0; i < nrets; i++)
+		rets[i] = (__be32 *) va_arg(ap, unsigned long);
+
+	rc = syscall(__NR_rtas, &args);
+	if (rc) {
+		rc = -errno;
+		goto err;
+	}
+
+	if (nrets) {
+		*(rets[0]) = be32_to_cpu(args.args[nargs]);
+
+		for (i = 1; i < nrets; i++) {
+			*(rets[i]) = args.args[nargs + i];
+		}
+	}
+
+err:
+	va_end(ap);
+	return rc;
+}
+
+static int test(void)
+{
+	struct region rmo_region;
+	uint64_t rmo_start;
+	uint64_t rmo_end;
+	__be32 rets[1];
+	int rc;
+
+	// Test a legitimate harmless call
+	// Expected: call succeeds
+	printf("Test a permitted call, no parameters... ");
+	rc = rtas_call("get-time-of-day", 0, 1, rets);
+	printf("rc: %d\n", rc);
+	FAIL_IF(rc != 0 && rc != RTAS_UNKNOWN_OP);
+
+	// Test a prohibited call
+	// Expected: call returns -EINVAL
+	printf("Test a prohibited call... ");
+	rc = rtas_call("nvram-fetch", 0, 1, rets);
+	printf("rc: %d\n", rc);
+	FAIL_IF(rc != -EINVAL && rc != RTAS_UNKNOWN_OP);
+
+	// Get RMO
+	rc = read_kregion_bounds(&rmo_region);
+	if (rc) {
+		printf("Couldn't read RMO region bounds, skipping remaining cases\n");
+		return 0;
+	}
+	rmo_start = rmo_region.addr;
+	rmo_end = rmo_start + rmo_region.size - 1;
+	printf("RMO range: %08lx - %08lx\n", rmo_start, rmo_end);
+
+	// Test a permitted call, user-supplied size, buffer inside RMO
+	// Expected: call succeeds
+	printf("Test a permitted call, user-supplied size, buffer inside RMO... ");
+	rc = rtas_call("ibm,get-system-parameter", 3, 1, 0, cpu_to_be32(rmo_start),
+		       cpu_to_be32(rmo_end - rmo_start + 1), rets);
+	printf("rc: %d\n", rc);
+	FAIL_IF(rc != 0 && rc != RTAS_UNKNOWN_OP);
+
+	// Test a permitted call, user-supplied size, buffer start outside RMO
+	// Expected: call returns -EINVAL
+	printf("Test a permitted call, user-supplied size, buffer start outside RMO... ");
+	rc = rtas_call("ibm,get-system-parameter", 3, 1, 0, cpu_to_be32(rmo_end + 1),
+		       cpu_to_be32(4000), rets);
+	printf("rc: %d\n", rc);
+	FAIL_IF(rc != -EINVAL && rc != RTAS_UNKNOWN_OP);
+
+	// Test a permitted call, user-supplied size, buffer end outside RMO
+	// Expected: call returns -EINVAL
+	printf("Test a permitted call, user-supplied size, buffer end outside RMO... ");
+	rc = rtas_call("ibm,get-system-parameter", 3, 1, 0, cpu_to_be32(rmo_start),
+		       cpu_to_be32(rmo_end - rmo_start + 2), rets);
+	printf("rc: %d\n", rc);
+	FAIL_IF(rc != -EINVAL && rc != RTAS_UNKNOWN_OP);
+
+	// Test a permitted call, fixed size, buffer end outside RMO
+	// Expected: call returns -EINVAL
+	printf("Test a permitted call, fixed size, buffer end outside RMO... ");
+	rc = rtas_call("ibm,configure-connector", 2, 1, cpu_to_be32(rmo_end - 4000), 0, rets);
+	printf("rc: %d\n", rc);
+	FAIL_IF(rc != -EINVAL && rc != RTAS_UNKNOWN_OP);
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	return test_harness(test, "rtas_filter");
+}
-- 
2.20.1

