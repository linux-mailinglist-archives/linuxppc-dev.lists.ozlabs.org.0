Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 150B163A08E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 05:25:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLC7v6D15z3f4l
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 15:25:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HSLwWSX8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HSLwWSX8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLC1t30zdz3cJY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 15:20:34 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS2Qqwj018667;
	Mon, 28 Nov 2022 04:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UIyW/WxEz075aUDSyX8Mg8jhU6RYNuedjIyyI3584L8=;
 b=HSLwWSX8y+BXr8zVcLyUtsJlB/YrSh+UTZSnOc2bu4XvmoMDO2PScTsZxGlaNGBIwEn3
 idtZ5YQdTIWc/QvTSWoT6hfsQyTtHmwF3zSCD0Z13rXUbB4tZFdQC/3m1jUFG3KWVKM0
 VnCfjcY9RzuUxnwyS5D/waHbEANQuZBnZLXc9VY3Qk7djMxhbjXU43u7oFb6xjsLUXJX
 kdIuFYeV5CSTXKxZ91FJS2a0x/tXSmGZ4bTyyuYPW4Aiv0nAvDBKDyyjwGjU/egHV6lO
 F/nP3jycVrd6wbQA8+FhYMss/fYOFUFLcMt1vASj123pt1yNDeOL1T8ARs4j3LxmHwyz 1g== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vktd89d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 04:20:31 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS4K6QR016111;
	Mon, 28 Nov 2022 04:20:29 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3m3a2hsx2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 04:20:29 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS4KRPV8258172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 04:20:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B85A11C04C;
	Mon, 28 Nov 2022 04:20:27 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91B3411C04A;
	Mon, 28 Nov 2022 04:20:26 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 04:20:26 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 025716038E;
	Mon, 28 Nov 2022 15:20:23 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 7/7] selftests/powerpc: Add automatically allocating read_file
Date: Mon, 28 Nov 2022 15:19:48 +1100
Message-Id: <20221128041948.58339-8-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128041948.58339-1-bgray@linux.ibm.com>
References: <20221128041948.58339-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lOurO7LUuij1cbKEislNV_Q6ZfshIlTT
X-Proofpoint-GUID: lOurO7LUuij1cbKEislNV_Q6ZfshIlTT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_03,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280026
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A couple of tests roll their own auto-allocating file read logic.

Add a generic implementation and convert them to use it.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 .../testing/selftests/powerpc/include/utils.h |  1 +
 .../selftests/powerpc/nx-gzip/gzfht_test.c    | 37 +--------
 .../selftests/powerpc/syscalls/Makefile       |  2 +-
 .../selftests/powerpc/syscalls/rtas_filter.c  | 80 +++----------------
 tools/testing/selftests/powerpc/utils.c       | 63 +++++++++++++++
 5 files changed, 75 insertions(+), 108 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index 044b0236df38..95f3a24a4569 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -40,6 +40,7 @@ int parse_ulong(const char *buffer, size_t count, unsigned long *result, int bas
 
 int read_file(const char *path, char *buf, size_t count, size_t *len);
 int write_file(const char *path, const char *buf, size_t count);
+int read_file_alloc(const char *path, char **buf, size_t *len);
 int read_long(const char *path, long *result, int base);
 int write_long(const char *path, long result, int base);
 int read_ulong(const char *path, unsigned long *result, int base);
diff --git a/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c b/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
index a6a226e1b8ba..4de079923ccb 100644
--- a/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
+++ b/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
@@ -143,41 +143,6 @@ int gzip_header_blank(char *buf)
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
-	if ((err = read_file(fname, p, statbuf.st_size, &num_bytes))) {
-		fprintf(stderr, "Failed to read file: %s\n", strerror(err));
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
@@ -244,7 +209,7 @@ int compress_file(int argc, char **argv, void *handle)
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
index 03b487f18d00..05f25f12556f 100644
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
-
-	rc = open_prop_file(prop_path, prop_name, &fd);
-	if (rc)
-		return rc;
+	char path[PATH_MAX];
 
-	rc = read_entire_file(fd, prop_val, prop_len);
-	close(fd);
+	int len = snprintf(path, sizeof(path), "%s/%s", prop_path, prop_name);
+	if (len < 0 || len >= sizeof(path))
+		return -ENOMEM;
 
-	return rc;
+	return read_file_alloc(path, prop_val, prop_len);
 }
 
 int rtas_token(const char *call_name)
@@ -138,22 +85,13 @@ int rtas_token(const char *call_name)
 static int read_kregion_bounds(struct region *kregion)
 {
 	char *buf;
-	int fd;
-	int rc;
+	int err;
 
-	fd = open("/proc/ppc64/rtas/rmo_buffer", O_RDONLY);
-	if (fd < 0) {
-		printf("Could not open rmo_buffer file\n");
+	if ((err = read_file_alloc("/proc/ppc64/rtas/rmo_buffer", &buf, NULL))) {
+		fprintf(stderr, "Error reading rmo_buffer: %s\n", strerror(err));
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
index b2906dd71cf5..52b18bf2020a 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -59,6 +59,69 @@ int read_file(const char *path, char *buf, size_t count, size_t *len)
 	return err;
 }
 
+int read_file_alloc(const char *path, char **buf, size_t *len)
+{
+	ssize_t rc;
+	char *buffer;
+	size_t read_offset;
+	size_t length;
+	int fd;
+	int err;
+
+
+	if ((fd = open(path, O_RDONLY)) < 0)
+		return -errno;
+
+	/*
+	 * We don't use stat & preallocate st_size because some non-files
+	 * report 0 file size. Instead just dynamically grow the buffer
+	 * as needed.
+	 */
+	length = 4096;
+	buffer = malloc(length);
+	read_offset = 0;
+
+	if (!buffer) {
+		err = errno;
+		goto out;
+	}
+
+	while (1) {
+		if ((rc = read(fd, buffer + read_offset, length - read_offset)) < 0) {
+			err = errno;
+			goto out;
+		}
+
+		if (rc == 0)
+			break;
+
+		read_offset += rc;
+
+		if (read_offset > length / 2) {
+			char *next_buffer;
+
+			length *= 2;
+			next_buffer = realloc(buffer, length);
+			if (!next_buffer) {
+				err = errno;
+				free(buffer);
+				goto out;
+			}
+			buffer = next_buffer;
+		}
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
+	return err;
+}
+
 int write_file(const char *path, const char *buf, size_t count)
 {
 	int fd;
-- 
2.38.1

