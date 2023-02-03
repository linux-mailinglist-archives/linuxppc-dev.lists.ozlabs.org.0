Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C911688C12
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 01:45:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7H4w00Dwz3f6v
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 11:45:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O7C5efyh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O7C5efyh;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Gyt58F8z3f5b
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 11:40:22 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312NHmKw003081
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9gdODs1TH4HrCpLEfs4jMMTYsZVh0kbKpuhJk1PTF9o=;
 b=O7C5efyhvdUk9ggO3Mew9xPAMKVhQJi32djAYrv42pTfsVEk6mlf8JbtD0wke5es3Bel
 tdZzRZAfiu86jhqeaR5bvsLsNNFU0Vq0vUfdeiUYi7kkCkZKDXPMt1BZaOdai9wHLvVR
 KIu5Reiv1VnkymQuBO3tHF9cubdiBowCzzDYqr8t99EQa0WqeHIL9H/GsRKL3gdD9WAd
 kLArPPfrbQlHzu91PYYgMSl4DClui7hIargPXtBa1EBlEpq1hLxty4+Rkv+FfNsERGcy
 1z3JT83MdUZVT4VNSSVUy8w7Vn8JgW58uUqdtBHQ1ZgE6NE6bGpjF8TMPA/mcNp5jwQP zw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngpqnsej6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 00:40:13 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 312C6F46012873
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:10 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtyesmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 00:40:10 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3130e8Q850004286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:08 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D2A32004B
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:08 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6262420043
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:07 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A6E8D6063C;
	Fri,  3 Feb 2023 11:40:05 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/5] selftests/powerpc: Add generic read/write file util
Date: Fri,  3 Feb 2023 11:39:43 +1100
Message-Id: <20230203003947.38033-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203003947.38033-1-bgray@linux.ibm.com>
References: <20230203003947.38033-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uaM_8aRI0EQ_oxljMMknMqkjrVYtvc43
X-Proofpoint-GUID: uaM_8aRI0EQ_oxljMMknMqkjrVYtvc43
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_16,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 bulkscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

File read/write is reimplemented in about 5 different ways in the
various PowerPC selftests. This indicates it should be a common util.

Add a common read_file / write_file implementation and convert users
to it where (easily) possible.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v4:	* Set errno as expected by many users that call perror() if
	  it fails (e.g., read_debugfs_file users in powerpc/security)
---
 tools/testing/selftests/powerpc/dscr/dscr.h   |  33 ++---
 .../selftests/powerpc/dscr/dscr_sysfs_test.c  |  21 +--
 .../testing/selftests/powerpc/include/utils.h |   2 +
 .../selftests/powerpc/nx-gzip/gzfht_test.c    |  48 +++----
 tools/testing/selftests/powerpc/pmu/lib.c     |  31 ++--
 .../selftests/powerpc/ptrace/core-pkey.c      |  28 ++--
 tools/testing/selftests/powerpc/utils.c       | 133 +++++++++++-------
 7 files changed, 128 insertions(+), 168 deletions(-)

diff --git a/tools/testing/selftests/powerpc/dscr/dscr.h b/tools/testing/selftests/powerpc/dscr/dscr.h
index b703714e7d98..aaa2b0d89f7e 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr.h
+++ b/tools/testing/selftests/powerpc/dscr/dscr.h
@@ -64,48 +64,31 @@ inline void set_dscr_usr(unsigned long val)
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
+	err = read_file(DSCR_DEFAULT, buf, sizeof(buf) - 1, NULL);
+	if (err) {
 		perror("read() failed");
 		exit(1);
 	}
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
+
+	err = write_file(DSCR_DEFAULT, buf, strlen(buf));
+	if (err) {
 		perror("write() failed");
 		exit(1);
 	}
-	close(fd);
 }
 
 double uniform_deviate(int seed)
diff --git a/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c b/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
index f20d1c166d1e..c350f193830a 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
@@ -12,24 +12,13 @@
 
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
+	rc = read_file(file, buf, sizeof(buf) - 1, NULL);
+	if (rc)
+		return rc;
 
-	rc = read(fd, buf, sizeof(buf));
-	if (rc == -1) {
-		perror("read() failed");
-		close(fd);
-		return 1;
-	}
-	close(fd);
-
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
index 095195a25687..fbc3d265155b 100644
--- a/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
+++ b/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
@@ -146,49 +146,37 @@ int gzip_header_blank(char *buf)
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
+
+	err = read_file(fname, p, statbuf.st_size, &num_bytes);
+	if (err) {
 		perror(fname);
-		return(-1);
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
@@ -399,7 +387,7 @@ int compress_file(int argc, char **argv, void *handle)
 	assert(FNAME_MAX > (strlen(argv[1]) + strlen(FEXT)));
 	strcpy(outname, argv[1]);
 	strcat(outname, FEXT);
-	if (write_output_file(outname, outbuf, dsttotlen)) {
+	if (write_file(outname, outbuf, dsttotlen)) {
 		fprintf(stderr, "write error: %s\n", outname);
 		exit(-1);
 	}
diff --git a/tools/testing/selftests/powerpc/pmu/lib.c b/tools/testing/selftests/powerpc/pmu/lib.c
index 88690b97b7b9..960915304a65 100644
--- a/tools/testing/selftests/powerpc/pmu/lib.c
+++ b/tools/testing/selftests/powerpc/pmu/lib.c
@@ -190,38 +190,23 @@ int parse_proc_maps(void)
 
 bool require_paranoia_below(int level)
 {
+	int err;
 	long current;
-	char *end, buf[16];
-	FILE *f;
-	bool rc;
+	char *end;
+	char buf[16] = {0};
 
-	rc = false;
-
-	f = fopen(PARANOID_PATH, "r");
-	if (!f) {
-		perror("fopen");
-		goto out;
-	}
-
-	if (!fgets(buf, sizeof(buf), f)) {
+	err = read_file(PARANOID_PATH, buf, sizeof(buf) - 1, NULL);
+	if (err) {
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
index 4e8d0ce1ff58..f6f8596ce8e1 100644
--- a/tools/testing/selftests/powerpc/ptrace/core-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
@@ -348,15 +348,11 @@ static int parent(struct shared_info *info, pid_t pid)
 
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
+	err = write_file(core_pattern_file, core_pattern, strlen(core_pattern));
+	if (err) {
+		SKIP_IF_MSG(err == -EPERM, "Try with root privileges");
 		perror("Error writing to core_pattern file");
 		return TEST_FAIL;
 	}
@@ -366,8 +362,8 @@ static int write_core_pattern(const char *core_pattern)
 
 static int setup_core_pattern(char **core_pattern_, bool *changed_)
 {
-	FILE *f;
 	char *core_pattern;
+	size_t len;
 	int ret;
 
 	core_pattern = malloc(PATH_MAX);
@@ -376,22 +372,14 @@ static int setup_core_pattern(char **core_pattern_, bool *changed_)
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
+	ret = read_file(core_pattern_file, core_pattern, PATH_MAX - 1, &len);
+	if (ret) {
 		perror("Error reading core_pattern file");
 		ret = TEST_FAIL;
 		goto out;
 	}
 
-	core_pattern[ret] = '\0';
+	core_pattern[len] = '\0';
 
 	/* Check whether we can predict the name of the core file. */
 	if (!strcmp(core_pattern, "core") || !strcmp(core_pattern, "core.%p"))
diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index 1f36ee1a909a..22ba13425b2c 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -26,34 +26,83 @@
 
 static char auxv[4096];
 
+int read_file(const char *path, char *buf, size_t count, size_t *len)
+{
+	ssize_t rc;
+	int fd;
+	int err;
+	char eof;
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0)
+		return -errno;
+
+	rc = read(fd, buf, count);
+	if (rc < 0) {
+		err = -errno;
+		goto out;
+	}
+
+	if (len)
+		*len = rc;
+
+	/* Overflow if there are still more bytes after filling the buffer */
+	if (rc == count) {
+		rc = read(fd, &eof, 1);
+		if (rc != 0) {
+			err = -EOVERFLOW;
+			goto out;
+		}
+	}
+
+	err = 0;
+
+out:
+	close(fd);
+	errno = -err;
+	return err;
+}
+
+int write_file(const char *path, const char *buf, size_t count)
+{
+	int fd;
+	int err;
+	ssize_t rc;
+
+	fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0644);
+	if (fd < 0)
+		return -errno;
+
+	rc = write(fd, buf, count);
+	if (rc < 0) {
+		err = -errno;
+		goto out;
+	}
+
+	if (rc != count) {
+		err = -EOVERFLOW;
+		goto out;
+	}
+
+	err = 0;
+
+out:
+	close(fd);
+	errno = -err;
+	return err;
+}
+
 int read_auxv(char *buf, ssize_t buf_size)
 {
-	ssize_t num;
-	int rc, fd;
+	int err;
 
-	fd = open("/proc/self/auxv", O_RDONLY);
-	if (fd == -1) {
-		perror("open");
-		return -errno;
+	err = read_file("/proc/self/auxv", buf, buf_size, NULL);
+	if (err) {
+		perror("Error reading /proc/self/auxv");
+		return err;
 	}
 
-	num = read(fd, buf, buf_size);
-	if (num < 0) {
-		perror("read");
-		rc = -EIO;
-		goto out;
-	}
-
-	if (num > buf_size) {
-		printf("overflowed auxv buffer\n");
-		rc = -EOVERFLOW;
-		goto out;
-	}
-
-	rc = 0;
-out:
-	close(fd);
-	return rc;
+	return 0;
 }
 
 void *find_auxv_entry(int type, char *auxv)
@@ -142,65 +191,41 @@ bool is_ppc64le(void)
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
+	err = read_file(path, value, sizeof(value) - 1, NULL);
+	if (err)
+		return err;
 
-	if ((rc = read(fd, value, sizeof(value))) < 0)
-		return rc;
-
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
2.39.1

