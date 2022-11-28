Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B1C63A097
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 05:27:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLCBG12nsz3fLh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 15:27:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KUWtXG9s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KUWtXG9s;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLC1z588sz3f4X
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 15:20:39 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS1sp4M013987;
	Mon, 28 Nov 2022 04:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mJu/tcVX9v1nUuDEi0SZLwLARcyL0aZHDalUBSHRb80=;
 b=KUWtXG9suq0n8ANlP/N+sD7uD10tP1zvlkvrI/NwkykvqURgkvl7Lu2FWy93wnT+PPDU
 fkOWAs65MKUouY7p8evfx5IOuj+FvnYsD+ENup2XQ1qMwy8gtoK5t5s1Lmp0I8kioh8x
 Q8htw3lgVxy9Fn4L47Y0aXa2tE1xj0L5rsj/UCetXRkD/yZQvKc9rLO/9nzlkg+nS5pH
 H8mXuV5s8ndVC0n3J4Wmpb2zLNipLWe4U62pL4u76uB3+Sd5U6dIIWXMkjnFXXeEahd5
 mP7oFiKa0hx9DXxHGso0FzM69fmXoHBhRAS51D8NI1AwA+vkLDG0CIc/xdh7zaB7vwm7 Bw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vr152rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 04:20:29 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS460J8025547;
	Mon, 28 Nov 2022 04:20:28 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3m3ae99wq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 04:20:27 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS4L8aP61473206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 04:21:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6D4CA404D;
	Mon, 28 Nov 2022 04:20:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08110A4040;
	Mon, 28 Nov 2022 04:20:25 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 04:20:24 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EB7ED60366;
	Mon, 28 Nov 2022 15:20:22 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/7] selftests/powerpc: Add generic read/write file util
Date: Mon, 28 Nov 2022 15:19:44 +1100
Message-Id: <20221128041948.58339-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128041948.58339-1-bgray@linux.ibm.com>
References: <20221128041948.58339-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RAXALJEy9O58irITvFOpIr4c-ggFmpfV
X-Proofpoint-GUID: RAXALJEy9O58irITvFOpIr4c-ggFmpfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_03,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

File read/write is reimplemented in about 5 different ways in the
various PowerPC selftests. This indicates it should be a common util.

Add a common read_file / write_file implementation and convert users
to it where (easily) possible.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 tools/testing/selftests/powerpc/dscr/dscr.h   |  36 ++----
 .../selftests/powerpc/dscr/dscr_sysfs_test.c  |  19 +--
 .../testing/selftests/powerpc/include/utils.h |   2 +
 .../selftests/powerpc/nx-gzip/gzfht_test.c    |  49 +++-----
 tools/testing/selftests/powerpc/pmu/lib.c     |  27 +----
 .../selftests/powerpc/ptrace/core-pkey.c      |  30 ++---
 tools/testing/selftests/powerpc/utils.c       | 108 ++++++++++--------
 7 files changed, 107 insertions(+), 164 deletions(-)

diff --git a/tools/testing/selftests/powerpc/dscr/dscr.h b/tools/testing/selftests/powerpc/dscr/dscr.h
index b703714e7d98..9a69d473ffdf 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr.h
+++ b/tools/testing/selftests/powerpc/dscr/dscr.h
@@ -64,48 +64,30 @@ inline void set_dscr_usr(unsigned long val)
 /* Default DSCR access */
 unsigned long get_default_dscr(void)
 {
-	int fd = -1, ret;
-	char buf[16];
+	int err;
+	char buf[16] = {0};
 	unsigned long val;
 
-	if (fd == -1) {
-		fd = open(DSCR_DEFAULT, O_RDONLY);
-		if (fd == -1) {
-			perror("open() failed");
-			exit(1);
-		}
-	}
-	memset(buf, 0, sizeof(buf));
-	lseek(fd, 0, SEEK_SET);
-	ret = read(fd, buf, sizeof(buf));
-	if (ret == -1) {
-		perror("read() failed");
+	if ((err = read_file(DSCR_DEFAULT, buf, sizeof(buf) - 1, NULL))) {
+		fprintf(stderr, "get_default_dscr() read failed: %s\n", strerror(err));
 		exit(1);
 	}
+
 	sscanf(buf, "%lx", &val);
-	close(fd);
 	return val;
 }
 
 void set_default_dscr(unsigned long val)
 {
-	int fd = -1, ret;
+	int err;
 	char buf[16];
 
-	if (fd == -1) {
-		fd = open(DSCR_DEFAULT, O_RDWR);
-		if (fd == -1) {
-			perror("open() failed");
-			exit(1);
-		}
-	}
 	sprintf(buf, "%lx\n", val);
-	ret = write(fd, buf, strlen(buf));
-	if (ret == -1) {
-		perror("write() failed");
+
+	if ((err = write_file(DSCR_DEFAULT, buf, strlen(buf)))) {
+		fprintf(stderr, "set_default_dscr() write failed: %s\n", strerror(err));
 		exit(1);
 	}
-	close(fd);
 }
 
 double uniform_deviate(int seed)
diff --git a/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c b/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
index fbbdffdb2e5d..310946262a24 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
@@ -12,23 +12,12 @@
 
 static int check_cpu_dscr_default(char *file, unsigned long val)
 {
-	char buf[10];
-	int fd, rc;
+	char buf[10] = {0};
+	int rc;
 
-	fd = open(file, O_RDWR);
-	if (fd == -1) {
-		perror("open() failed");
-		return 1;
-	}
-
-	rc = read(fd, buf, sizeof(buf));
-	if (rc == -1) {
-		perror("read() failed");
-		return 1;
-	}
-	close(fd);
+	if ((rc = read_file(file, buf, sizeof(buf) - 1, NULL)))
+		return rc;
 
-	buf[rc] = '\0';
 	if (strtol(buf, NULL, 16) != val) {
 		printf("DSCR match failed: %ld (system) %ld (cpu)\n",
 					val, strtol(buf, NULL, 16));
diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index e222a5858450..70885e5814a8 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -33,6 +33,8 @@ void *get_auxv_entry(int type);
 
 int pick_online_cpu(void);
 
+int read_file(const char *path, char *buf, size_t count, size_t *len);
+int write_file(const char *path, const char *buf, size_t count);
 int read_debugfs_file(char *debugfs_file, int *result);
 int write_debugfs_file(char *debugfs_file, int result);
 int read_sysfs_file(char *debugfs_file, char *result, size_t result_size);
diff --git a/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c b/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
index 095195a25687..a6a226e1b8ba 100644
--- a/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
+++ b/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
@@ -146,49 +146,36 @@ int gzip_header_blank(char *buf)
 /* Caller must free the allocated buffer return nonzero on error. */
 int read_alloc_input_file(char *fname, char **buf, size_t *bufsize)
 {
+	int err;
 	struct stat statbuf;
-	FILE *fp;
 	char *p;
 	size_t num_bytes;
 
 	if (stat(fname, &statbuf)) {
 		perror(fname);
-		return(-1);
-	}
-	fp = fopen(fname, "r");
-	if (fp == NULL) {
-		perror(fname);
-		return(-1);
+		return -1;
 	}
+
 	assert(NULL != (p = (char *) malloc(statbuf.st_size)));
-	num_bytes = fread(p, 1, statbuf.st_size, fp);
-	if (ferror(fp) || (num_bytes != statbuf.st_size)) {
-		perror(fname);
-		return(-1);
+
+	if ((err = read_file(fname, p, statbuf.st_size, &num_bytes))) {
+		fprintf(stderr, "Failed to read file: %s\n", strerror(err));
+		goto fail;
 	}
+
+	if (num_bytes != statbuf.st_size) {
+		fprintf(stderr, "Actual bytes != expected bytes\n");
+		err = -1;
+		goto fail;
+	}
+
 	*buf = p;
 	*bufsize = num_bytes;
 	return 0;
-}
 
-/* Returns nonzero on error */
-int write_output_file(char *fname, char *buf, size_t bufsize)
-{
-	FILE *fp;
-	size_t num_bytes;
-
-	fp = fopen(fname, "w");
-	if (fp == NULL) {
-		perror(fname);
-		return(-1);
-	}
-	num_bytes = fwrite(buf, 1, bufsize, fp);
-	if (ferror(fp) || (num_bytes != bufsize)) {
-		perror(fname);
-		return(-1);
-	}
-	fclose(fp);
-	return 0;
+fail:
+	free(p);
+	return err;
 }
 
 /*
@@ -399,7 +386,7 @@ int compress_file(int argc, char **argv, void *handle)
 	assert(FNAME_MAX > (strlen(argv[1]) + strlen(FEXT)));
 	strcpy(outname, argv[1]);
 	strcat(outname, FEXT);
-	if (write_output_file(outname, outbuf, dsttotlen)) {
+	if (write_file(outname, outbuf, dsttotlen)) {
 		fprintf(stderr, "write error: %s\n", outname);
 		exit(-1);
 	}
diff --git a/tools/testing/selftests/powerpc/pmu/lib.c b/tools/testing/selftests/powerpc/pmu/lib.c
index 88690b97b7b9..e8960e7a1271 100644
--- a/tools/testing/selftests/powerpc/pmu/lib.c
+++ b/tools/testing/selftests/powerpc/pmu/lib.c
@@ -190,38 +190,21 @@ int parse_proc_maps(void)
 
 bool require_paranoia_below(int level)
 {
+	int err;
 	long current;
 	char *end, buf[16];
-	FILE *f;
-	bool rc;
-
-	rc = false;
-
-	f = fopen(PARANOID_PATH, "r");
-	if (!f) {
-		perror("fopen");
-		goto out;
-	}
 
-	if (!fgets(buf, sizeof(buf), f)) {
+	if ((err = read_file(PARANOID_PATH, buf, sizeof(buf), NULL))) {
 		printf("Couldn't read " PARANOID_PATH "?\n");
-		goto out_close;
+		return false;
 	}
 
 	current = strtol(buf, &end, 10);
 
 	if (end == buf) {
 		printf("Couldn't parse " PARANOID_PATH "?\n");
-		goto out_close;
+		return false;
 	}
 
-	if (current >= level)
-		goto out_close;
-
-	rc = true;
-out_close:
-	fclose(f);
-out:
-	return rc;
+	return current < level;
 }
-
diff --git a/tools/testing/selftests/powerpc/ptrace/core-pkey.c b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
index 5c82ed9e7c65..46e0695ed8b0 100644
--- a/tools/testing/selftests/powerpc/ptrace/core-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
@@ -348,16 +348,11 @@ static int parent(struct shared_info *info, pid_t pid)
 
 static int write_core_pattern(const char *core_pattern)
 {
-	size_t len = strlen(core_pattern), ret;
-	FILE *f;
+	int err;
 
-	f = fopen(core_pattern_file, "w");
-	SKIP_IF_MSG(!f, "Try with root privileges");
-
-	ret = fwrite(core_pattern, 1, len, f);
-	fclose(f);
-	if (ret != len) {
-		perror("Error writing to core_pattern file");
+	if ((err = write_file(core_pattern_file, core_pattern, strlen(core_pattern)))) {
+		SKIP_IF_MSG(err == -EPERM, "Try with root privileges");
+		fprintf(stderr, "Error writing core_pattern file: %s\n", strerror(err));
 		return TEST_FAIL;
 	}
 
@@ -366,8 +361,8 @@ static int write_core_pattern(const char *core_pattern)
 
 static int setup_core_pattern(char **core_pattern_, bool *changed_)
 {
-	FILE *f;
 	char *core_pattern;
+	size_t len;
 	int ret;
 
 	core_pattern = malloc(PATH_MAX);
@@ -376,22 +371,13 @@ static int setup_core_pattern(char **core_pattern_, bool *changed_)
 		return TEST_FAIL;
 	}
 
-	f = fopen(core_pattern_file, "r");
-	if (!f) {
-		perror("Error opening core_pattern file");
-		ret = TEST_FAIL;
-		goto out;
-	}
-
-	ret = fread(core_pattern, 1, PATH_MAX - 1, f);
-	fclose(f);
-	if (!ret) {
-		perror("Error reading core_pattern file");
+	if ((ret = read_file(core_pattern_file, core_pattern, PATH_MAX - 1, &len))) {
+		fprintf(stderr, "Error reading core_pattern file: %s\n", strerror(ret));
 		ret = TEST_FAIL;
 		goto out;
 	}
 
-	core_pattern[ret] = '\0';
+	core_pattern[len] = '\0';
 
 	/* Check whether we can predict the name of the core file. */
 	if (!strcmp(core_pattern, "core") || !strcmp(core_pattern, "core.%p"))
diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index 1f36ee1a909a..861b1f7aa95f 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -26,34 +26,73 @@
 
 static char auxv[4096];
 
-int read_auxv(char *buf, ssize_t buf_size)
+int read_file(const char *path, char *buf, size_t count, size_t *len)
 {
-	ssize_t num;
-	int rc, fd;
+	ssize_t rc;
+	int fd;
+	int err;
+	char eof;
+
+	if ((fd = open(path, O_RDONLY)) < 0)
+		return errno;
 
-	fd = open("/proc/self/auxv", O_RDONLY);
-	if (fd == -1) {
-		perror("open");
-		return -errno;
+	if ((rc = read(fd, buf, count)) < 0) {
+		err = errno;
+		goto out;
 	}
 
-	num = read(fd, buf, buf_size);
-	if (num < 0) {
-		perror("read");
-		rc = -EIO;
+	if (len)
+		*len = rc;
+
+	/* Overflow if there are still more bytes after filling the buffer */
+	if (rc == count && (rc = read(fd, &eof, 1)) != 0) {
+		err = EOVERFLOW;
 		goto out;
 	}
 
-	if (num > buf_size) {
-		printf("overflowed auxv buffer\n");
-		rc = -EOVERFLOW;
+	err = 0;
+
+out:
+	close(fd);
+	return err;
+}
+
+int write_file(const char *path, const char *buf, size_t count)
+{
+	int fd;
+	int err;
+	ssize_t rc;
+
+	if ((fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0644)) < 0)
+		return errno;
+
+	if ((rc = write(fd, buf, count)) < 0) {
+		err = errno;
 		goto out;
 	}
 
-	rc = 0;
+	if (rc != count) {
+		err = EOVERFLOW;
+		goto out;
+	}
+
+	err = 0;
+
 out:
 	close(fd);
-	return rc;
+	return err;
+}
+
+int read_auxv(char *buf, ssize_t buf_size)
+{
+	int err;
+
+	if ((err = read_file("/proc/self/auxv", buf, buf_size, NULL))) {
+		fprintf(stderr, "Error reading auxv: %s\n", strerror(err));
+		return err;
+	}
+
+	return 0;
 }
 
 void *find_auxv_entry(int type, char *auxv)
@@ -142,65 +181,40 @@ bool is_ppc64le(void)
 int read_sysfs_file(char *fpath, char *result, size_t result_size)
 {
 	char path[PATH_MAX] = "/sys/";
-	int rc = -1, fd;
 
 	strncat(path, fpath, PATH_MAX - strlen(path) - 1);
 
-	if ((fd = open(path, O_RDONLY)) < 0)
-		return rc;
-
-	rc = read(fd, result, result_size);
-
-	close(fd);
-
-	if (rc < 0)
-		return rc;
-
-	return 0;
+	return read_file(path, result, result_size, NULL);
 }
 
 int read_debugfs_file(char *debugfs_file, int *result)
 {
-	int rc = -1, fd;
+	int err;
 	char path[PATH_MAX];
-	char value[16];
+	char value[16] = {0};
 
 	strcpy(path, "/sys/kernel/debug/");
 	strncat(path, debugfs_file, PATH_MAX - strlen(path) - 1);
 
-	if ((fd = open(path, O_RDONLY)) < 0)
-		return rc;
-
-	if ((rc = read(fd, value, sizeof(value))) < 0)
-		return rc;
+	if ((err = read_file(path, value, sizeof(value) - 1, NULL)))
+		return err;
 
-	value[15] = 0;
 	*result = atoi(value);
-	close(fd);
 
 	return 0;
 }
 
 int write_debugfs_file(char *debugfs_file, int result)
 {
-	int rc = -1, fd;
 	char path[PATH_MAX];
 	char value[16];
 
 	strcpy(path, "/sys/kernel/debug/");
 	strncat(path, debugfs_file, PATH_MAX - strlen(path) - 1);
 
-	if ((fd = open(path, O_WRONLY)) < 0)
-		return rc;
-
 	snprintf(value, 16, "%d", result);
 
-	if ((rc = write(fd, value, strlen(value))) < 0)
-		return rc;
-
-	close(fd);
-
-	return 0;
+	return write_file(path, value, strlen(value));
 }
 
 static long perf_event_open(struct perf_event_attr *hw_event, pid_t pid,
-- 
2.38.1

