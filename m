Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 871E3688C09
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 01:42:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7H1q35Zlz3f8t
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 11:42:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sdL6kBLJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sdL6kBLJ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Gyp1NPgz3bcs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 11:40:17 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312NBnd8016146
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fOeWca7m3QMnxcBcEsWAT8sT1XtyHEpDz+AISXD751c=;
 b=sdL6kBLJ4txd9ySuA4eNtmQ2EuLTC1+J+MBszp0vntBK+NdAPLDdehp+KxO/E8vFW7jv
 lpp0EYli/RV+Do7FFG/XOp9k2zDGqgrSw4BEcascjBIejgcDh0WVhBBpJe6Hlgc+fTTX
 ZnocnKsWGfMvbAupeP2KIDN+0y4sIsP2kdkcxVCG1g9yOX+Rk3ushvwuyCrqMYBXmryk
 is5dtFKBHLGoW05sHB6wuQMJzh1NsZEIFE95g7Qk8E5tE+fWSkJhc2FT/v0djNc/SfbR
 VVLkaIcHi7nZ/SxjNrusJGYuFTyWH5JeT62hRunaCS362wG5//oayiUH7BfEdJCBQbpH nw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngn62bd6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 00:40:14 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 312DdHIb001561
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:13 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3ncvv6cune-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 00:40:13 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3130eASd35651880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:10 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A402020040
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:10 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A938C20043
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:09 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C43586051E;
	Fri,  3 Feb 2023 11:40:05 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/5] selftests/powerpc: Add automatically allocating read_file
Date: Fri,  3 Feb 2023 11:39:47 +1100
Message-Id: <20230203003947.38033-6-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203003947.38033-1-bgray@linux.ibm.com>
References: <20230203003947.38033-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: il5yeQdLWPgRM8M13nlfm_Os_2eKFt50
X-Proofpoint-ORIG-GUID: il5yeQdLWPgRM8M13nlfm_Os_2eKFt50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_16,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030003
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A couple of tests roll their own auto-allocating file read logic.

Add a generic implementation and convert them to use it.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v4:	* Make allocation more concise using realloc(NULL, length)
	  without special casing initial malloc(length)
---
 .../testing/selftests/powerpc/include/utils.h |  1 +
 .../selftests/powerpc/nx-gzip/gzfht_test.c    | 38 +--------
 .../selftests/powerpc/syscalls/Makefile       |  2 +-
 .../selftests/powerpc/syscalls/rtas_filter.c  | 81 +++----------------
 tools/testing/selftests/powerpc/utils.c       | 58 +++++++++++++
 5 files changed, 71 insertions(+), 109 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index 311ddc124ebc..eed7dd7582b2 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -42,6 +42,7 @@ int parse_ulong(const char *buffer, size_t count, unsigned long *result, int bas
 
 int read_file(const char *path, char *buf, size_t count, size_t *len);
 int write_file(const char *path, const char *buf, size_t count);
+int read_file_alloc(const char *path, char **buf, size_t *len);
 int read_long(const char *path, long *result, int base);
 int write_long(const char *path, long result, int base);
 int read_ulong(const char *path, unsigned long *result, int base);
diff --git a/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c b/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
index fbc3d265155b..4de079923ccb 100644
--- a/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
+++ b/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
@@ -143,42 +143,6 @@ int gzip_header_blank(char *buf)
 	return i;
 }
 
-/* Caller must free the allocated buffer return nonzero on error. */
-int read_alloc_input_file(char *fname, char **buf, size_t *bufsize)
-{
-	int err;
-	struct stat statbuf;
-	char *p;
-	size_t num_bytes;
-
-	if (stat(fname, &statbuf)) {
-		perror(fname);
-		return -1;
-	}
-
-	assert(NULL != (p = (char *) malloc(statbuf.st_size)));
-
-	err = read_file(fname, p, statbuf.st_size, &num_bytes);
-	if (err) {
-		perror(fname);
-		goto fail;
-	}
-
-	if (num_bytes != statbuf.st_size) {
-		fprintf(stderr, "Actual bytes != expected bytes\n");
-		err = -1;
-		goto fail;
-	}
-
-	*buf = p;
-	*bufsize = num_bytes;
-	return 0;
-
-fail:
-	free(p);
-	return err;
-}
-
 /*
  * Z_SYNC_FLUSH as described in zlib.h.
  * Returns number of appended bytes
@@ -245,7 +209,7 @@ int compress_file(int argc, char **argv, void *handle)
 		fprintf(stderr, "usage: %s <fname>\n", argv[0]);
 		exit(-1);
 	}
-	if (read_alloc_input_file(argv[1], &inbuf, &inlen))
+	if (read_file_alloc(argv[1], &inbuf, &inlen))
 		exit(-1);
 	fprintf(stderr, "file %s read, %ld bytes\n", argv[1], inlen);
 
diff --git a/tools/testing/selftests/powerpc/syscalls/Makefile b/tools/testing/selftests/powerpc/syscalls/Makefile
index b63f8459c704..54ff5cfffc63 100644
--- a/tools/testing/selftests/powerpc/syscalls/Makefile
+++ b/tools/testing/selftests/powerpc/syscalls/Makefile
@@ -6,4 +6,4 @@ CFLAGS += -I../../../../../usr/include
 top_srcdir = ../../../../..
 include ../../lib.mk
 
-$(TEST_GEN_PROGS): ../harness.c
+$(TEST_GEN_PROGS): ../harness.c ../utils.c
diff --git a/tools/testing/selftests/powerpc/syscalls/rtas_filter.c b/tools/testing/selftests/powerpc/syscalls/rtas_filter.c
index 03b487f18d00..9b17780f0b18 100644
--- a/tools/testing/selftests/powerpc/syscalls/rtas_filter.c
+++ b/tools/testing/selftests/powerpc/syscalls/rtas_filter.c
@@ -8,6 +8,7 @@
 #include <byteswap.h>
 #include <stdint.h>
 #include <inttypes.h>
+#include <linux/limits.h>
 #include <stdio.h>
 #include <string.h>
 #include <sys/syscall.h>
@@ -50,70 +51,16 @@ struct region {
 	struct region *next;
 };
 
-int read_entire_file(int fd, char **buf, size_t *len)
-{
-	size_t buf_size = 0;
-	size_t off = 0;
-	int rc;
-
-	*buf = NULL;
-	do {
-		buf_size += BLOCK_SIZE;
-		if (*buf == NULL)
-			*buf = malloc(buf_size);
-		else
-			*buf = realloc(*buf, buf_size);
-
-		if (*buf == NULL)
-			return -ENOMEM;
-
-		rc = read(fd, *buf + off, BLOCK_SIZE);
-		if (rc < 0)
-			return -EIO;
-
-		off += rc;
-	} while (rc == BLOCK_SIZE);
-
-	if (len)
-		*len = off;
-
-	return 0;
-}
-
-static int open_prop_file(const char *prop_path, const char *prop_name, int *fd)
-{
-	char *path;
-	int len;
-
-	/* allocate enough for two string, a slash and trailing NULL */
-	len = strlen(prop_path) + strlen(prop_name) + 1 + 1;
-	path = malloc(len);
-	if (path == NULL)
-		return -ENOMEM;
-
-	snprintf(path, len, "%s/%s", prop_path, prop_name);
-
-	*fd = open(path, O_RDONLY);
-	free(path);
-	if (*fd < 0)
-		return -errno;
-
-	return 0;
-}
-
 static int get_property(const char *prop_path, const char *prop_name,
 			char **prop_val, size_t *prop_len)
 {
-	int rc, fd;
+	char path[PATH_MAX];
 
-	rc = open_prop_file(prop_path, prop_name, &fd);
-	if (rc)
-		return rc;
+	int len = snprintf(path, sizeof(path), "%s/%s", prop_path, prop_name);
+	if (len < 0 || len >= sizeof(path))
+		return -ENOMEM;
 
-	rc = read_entire_file(fd, prop_val, prop_len);
-	close(fd);
-
-	return rc;
+	return read_file_alloc(path, prop_val, prop_len);
 }
 
 int rtas_token(const char *call_name)
@@ -138,22 +85,14 @@ int rtas_token(const char *call_name)
 static int read_kregion_bounds(struct region *kregion)
 {
 	char *buf;
-	int fd;
-	int rc;
+	int err;
 
-	fd = open("/proc/ppc64/rtas/rmo_buffer", O_RDONLY);
-	if (fd < 0) {
-		printf("Could not open rmo_buffer file\n");
+	err = read_file_alloc("/proc/ppc64/rtas/rmo_buffer", &buf, NULL);
+	if (err) {
+		perror("Could not open rmo_buffer file");
 		return RTAS_IO_ASSERT;
 	}
 
-	rc = read_entire_file(fd, &buf, NULL);
-	close(fd);
-	if (rc) {
-		free(buf);
-		return rc;
-	}
-
 	sscanf(buf, "%" SCNx64 " %x", &kregion->addr, &kregion->size);
 	free(buf);
 
diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index 1017f1738619..7c8cfedb012a 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -65,6 +65,64 @@ int read_file(const char *path, char *buf, size_t count, size_t *len)
 	return err;
 }
 
+int read_file_alloc(const char *path, char **buf, size_t *len)
+{
+	size_t read_offset = 0;
+	size_t buffer_len = 0;
+	char *buffer = NULL;
+	int err;
+	int fd;
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0)
+		return -errno;
+
+	/*
+	 * We don't use stat & preallocate st_size because some non-files
+	 * report 0 file size. Instead just dynamically grow the buffer
+	 * as needed.
+	 */
+	while (1) {
+		ssize_t rc;
+
+		if (read_offset >= buffer_len / 2) {
+			char *next_buffer;
+
+			buffer_len = buffer_len ? buffer_len * 2 : 4096;
+			next_buffer = realloc(buffer, buffer_len);
+			if (!next_buffer) {
+				err = -errno;
+				goto out;
+			}
+			buffer = next_buffer;
+		}
+
+		rc = read(fd, buffer + read_offset, buffer_len - read_offset);
+		if (rc < 0) {
+			err = -errno;
+			goto out;
+		}
+
+		if (rc == 0)
+			break;
+
+		read_offset += rc;
+	}
+
+	*buf = buffer;
+	if (len)
+		*len = read_offset;
+
+	err = 0;
+
+out:
+	close(fd);
+	if (err)
+		free(buffer);
+	errno = -err;
+	return err;
+}
+
 int write_file(const char *path, const char *buf, size_t count)
 {
 	int fd;
-- 
2.39.1

