Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A31463A08C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 05:24:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLC5s2Fkmz3fBr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 15:24:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T7B9BJXl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T7B9BJXl;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLC1s5X20z3cJY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 15:20:33 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS2Q4xn014028;
	Mon, 28 Nov 2022 04:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DmUFeQdZwwMIl5Cy8ERLqu6FsUKEaiyDrWhOJxt6ey0=;
 b=T7B9BJXlfR4Hvw3JEtTgHTqV7JzG52jGE8oQrluKCSjLeQIsb1rrTVk6j33GPrGeTRr9
 BKSpKwIME55IDxF1jyj2ahsXBygVSn83CbKZ08EE1eiOSVV0Hz8QhDhONt2yyD5KWIUo
 1UDiqaFLuBjCMYEeUcpUfENaS9afdPvayNuh3IDlYv6NI6eu0Haiudn/9U1QnrSgQicq
 Mcz6JY0qzaEd/O0Y6jAjfiTW1IPTfuXcrPjfstD4m/0omJpjWheTQEod/Z7fOyKzTXJI
 Qtknard7WM8AMQ0/D/3gyrY1mIvezZAW73/Q9PiWwg2NRJKbaTVgYQQzkMgfLs4xp/ET Og== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vr152rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 04:20:29 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS45NpP009252;
	Mon, 28 Nov 2022 04:20:28 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04fra.de.ibm.com with ESMTP id 3m3ae91d00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 04:20:27 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS4L8U8787198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 04:21:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A591F11C04C;
	Mon, 28 Nov 2022 04:20:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 076B511C050;
	Mon, 28 Nov 2022 04:20:25 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 04:20:24 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EF08260312;
	Mon, 28 Nov 2022 15:20:22 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/7] selftests/powerpc: Add read/write debugfs file, int
Date: Mon, 28 Nov 2022 15:19:45 +1100
Message-Id: <20221128041948.58339-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128041948.58339-1-bgray@linux.ibm.com>
References: <20221128041948.58339-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lQLvtjBG9eyhKNqmSnxu8WsL9HYsz2VY
X-Proofpoint-GUID: lQLvtjBG9eyhKNqmSnxu8WsL9HYsz2VY
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

Debugfs files are not always integers, so make *_file return/write a
byte buffer, and *_int deal with int values specifically. This increases
consistency with the other file read/write helpers.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 .../testing/selftests/powerpc/include/utils.h |  6 ++--
 .../selftests/powerpc/security/entry_flush.c  | 12 +++----
 .../selftests/powerpc/security/rfi_flush.c    | 12 +++----
 .../powerpc/security/uaccess_flush.c          | 18 +++++-----
 tools/testing/selftests/powerpc/utils.c       | 34 ++++++++++++-------
 5 files changed, 47 insertions(+), 35 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index 70885e5814a8..de5e3790f397 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -35,8 +35,10 @@ int pick_online_cpu(void);
 
 int read_file(const char *path, char *buf, size_t count, size_t *len);
 int write_file(const char *path, const char *buf, size_t count);
-int read_debugfs_file(char *debugfs_file, int *result);
-int write_debugfs_file(char *debugfs_file, int result);
+int read_debugfs_file(const char *debugfs_file, char *buf, size_t count);
+int write_debugfs_file(const char *debugfs_file, const char *buf, size_t count);
+int read_debugfs_int(const char *debugfs_file, int *result);
+int write_debugfs_int(const char *debugfs_file, int result);
 int read_sysfs_file(char *debugfs_file, char *result, size_t result_size);
 int perf_event_open_counter(unsigned int type,
 			    unsigned long config, int group_fd);
diff --git a/tools/testing/selftests/powerpc/security/entry_flush.c b/tools/testing/selftests/powerpc/security/entry_flush.c
index 68ce377b205e..e01c573deadd 100644
--- a/tools/testing/selftests/powerpc/security/entry_flush.c
+++ b/tools/testing/selftests/powerpc/security/entry_flush.c
@@ -34,18 +34,18 @@ int entry_flush_test(void)
 	// The PMU event we use only works on Power7 or later
 	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06));
 
-	if (read_debugfs_file("powerpc/rfi_flush", &rfi_flush_orig) < 0) {
+	if (read_debugfs_int("powerpc/rfi_flush", &rfi_flush_orig) < 0) {
 		perror("Unable to read powerpc/rfi_flush debugfs file");
 		SKIP_IF(1);
 	}
 
-	if (read_debugfs_file("powerpc/entry_flush", &entry_flush_orig) < 0) {
+	if (read_debugfs_int("powerpc/entry_flush", &entry_flush_orig) < 0) {
 		perror("Unable to read powerpc/entry_flush debugfs file");
 		SKIP_IF(1);
 	}
 
 	if (rfi_flush_orig != 0) {
-		if (write_debugfs_file("powerpc/rfi_flush", 0) < 0) {
+		if (write_debugfs_int("powerpc/rfi_flush", 0) < 0) {
 			perror("error writing to powerpc/rfi_flush debugfs file");
 			FAIL_IF(1);
 		}
@@ -105,7 +105,7 @@ int entry_flush_test(void)
 
 	if (entry_flush == entry_flush_orig) {
 		entry_flush = !entry_flush_orig;
-		if (write_debugfs_file("powerpc/entry_flush", entry_flush) < 0) {
+		if (write_debugfs_int("powerpc/entry_flush", entry_flush) < 0) {
 			perror("error writing to powerpc/entry_flush debugfs file");
 			return 1;
 		}
@@ -120,12 +120,12 @@ int entry_flush_test(void)
 
 	set_dscr(0);
 
-	if (write_debugfs_file("powerpc/rfi_flush", rfi_flush_orig) < 0) {
+	if (write_debugfs_int("powerpc/rfi_flush", rfi_flush_orig) < 0) {
 		perror("unable to restore original value of powerpc/rfi_flush debugfs file");
 		return 1;
 	}
 
-	if (write_debugfs_file("powerpc/entry_flush", entry_flush_orig) < 0) {
+	if (write_debugfs_int("powerpc/entry_flush", entry_flush_orig) < 0) {
 		perror("unable to restore original value of powerpc/entry_flush debugfs file");
 		return 1;
 	}
diff --git a/tools/testing/selftests/powerpc/security/rfi_flush.c b/tools/testing/selftests/powerpc/security/rfi_flush.c
index f73484a6470f..6bedc86443a6 100644
--- a/tools/testing/selftests/powerpc/security/rfi_flush.c
+++ b/tools/testing/selftests/powerpc/security/rfi_flush.c
@@ -34,18 +34,18 @@ int rfi_flush_test(void)
 	// The PMU event we use only works on Power7 or later
 	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06));
 
-	if (read_debugfs_file("powerpc/rfi_flush", &rfi_flush_orig) < 0) {
+	if (read_debugfs_int("powerpc/rfi_flush", &rfi_flush_orig) < 0) {
 		perror("Unable to read powerpc/rfi_flush debugfs file");
 		SKIP_IF(1);
 	}
 
-	if (read_debugfs_file("powerpc/entry_flush", &entry_flush_orig) < 0) {
+	if (read_debugfs_int("powerpc/entry_flush", &entry_flush_orig) < 0) {
 		have_entry_flush = 0;
 	} else {
 		have_entry_flush = 1;
 
 		if (entry_flush_orig != 0) {
-			if (write_debugfs_file("powerpc/entry_flush", 0) < 0) {
+			if (write_debugfs_int("powerpc/entry_flush", 0) < 0) {
 				perror("error writing to powerpc/entry_flush debugfs file");
 				return 1;
 			}
@@ -105,7 +105,7 @@ int rfi_flush_test(void)
 
 	if (rfi_flush == rfi_flush_orig) {
 		rfi_flush = !rfi_flush_orig;
-		if (write_debugfs_file("powerpc/rfi_flush", rfi_flush) < 0) {
+		if (write_debugfs_int("powerpc/rfi_flush", rfi_flush) < 0) {
 			perror("error writing to powerpc/rfi_flush debugfs file");
 			return 1;
 		}
@@ -120,13 +120,13 @@ int rfi_flush_test(void)
 
 	set_dscr(0);
 
-	if (write_debugfs_file("powerpc/rfi_flush", rfi_flush_orig) < 0) {
+	if (write_debugfs_int("powerpc/rfi_flush", rfi_flush_orig) < 0) {
 		perror("unable to restore original value of powerpc/rfi_flush debugfs file");
 		return 1;
 	}
 
 	if (have_entry_flush) {
-		if (write_debugfs_file("powerpc/entry_flush", entry_flush_orig) < 0) {
+		if (write_debugfs_int("powerpc/entry_flush", entry_flush_orig) < 0) {
 			perror("unable to restore original value of powerpc/entry_flush "
 			       "debugfs file");
 			return 1;
diff --git a/tools/testing/selftests/powerpc/security/uaccess_flush.c b/tools/testing/selftests/powerpc/security/uaccess_flush.c
index cf80f960e38a..fcf23ea9b183 100644
--- a/tools/testing/selftests/powerpc/security/uaccess_flush.c
+++ b/tools/testing/selftests/powerpc/security/uaccess_flush.c
@@ -36,30 +36,30 @@ int uaccess_flush_test(void)
 	// The PMU event we use only works on Power7 or later
 	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06));
 
-	if (read_debugfs_file("powerpc/rfi_flush", &rfi_flush_orig) < 0) {
+	if (read_debugfs_int("powerpc/rfi_flush", &rfi_flush_orig) < 0) {
 		perror("Unable to read powerpc/rfi_flush debugfs file");
 		SKIP_IF(1);
 	}
 
-	if (read_debugfs_file("powerpc/entry_flush", &entry_flush_orig) < 0) {
+	if (read_debugfs_int("powerpc/entry_flush", &entry_flush_orig) < 0) {
 		perror("Unable to read powerpc/entry_flush debugfs file");
 		SKIP_IF(1);
 	}
 
-	if (read_debugfs_file("powerpc/uaccess_flush", &uaccess_flush_orig) < 0) {
+	if (read_debugfs_int("powerpc/uaccess_flush", &uaccess_flush_orig) < 0) {
 		perror("Unable to read powerpc/entry_flush debugfs file");
 		SKIP_IF(1);
 	}
 
 	if (rfi_flush_orig != 0) {
-		if (write_debugfs_file("powerpc/rfi_flush", 0) < 0) {
+		if (write_debugfs_int("powerpc/rfi_flush", 0) < 0) {
 			perror("error writing to powerpc/rfi_flush debugfs file");
 			FAIL_IF(1);
 		}
 	}
 
 	if (entry_flush_orig != 0) {
-		if (write_debugfs_file("powerpc/entry_flush", 0) < 0) {
+		if (write_debugfs_int("powerpc/entry_flush", 0) < 0) {
 			perror("error writing to powerpc/entry_flush debugfs file");
 			FAIL_IF(1);
 		}
@@ -119,7 +119,7 @@ int uaccess_flush_test(void)
 
 	if (uaccess_flush == uaccess_flush_orig) {
 		uaccess_flush = !uaccess_flush_orig;
-		if (write_debugfs_file("powerpc/uaccess_flush", uaccess_flush) < 0) {
+		if (write_debugfs_int("powerpc/uaccess_flush", uaccess_flush) < 0) {
 			perror("error writing to powerpc/uaccess_flush debugfs file");
 			return 1;
 		}
@@ -134,17 +134,17 @@ int uaccess_flush_test(void)
 
 	set_dscr(0);
 
-	if (write_debugfs_file("powerpc/rfi_flush", rfi_flush_orig) < 0) {
+	if (write_debugfs_int("powerpc/rfi_flush", rfi_flush_orig) < 0) {
 		perror("unable to restore original value of powerpc/rfi_flush debugfs file");
 		return 1;
 	}
 
-	if (write_debugfs_file("powerpc/entry_flush", entry_flush_orig) < 0) {
+	if (write_debugfs_int("powerpc/entry_flush", entry_flush_orig) < 0) {
 		perror("unable to restore original value of powerpc/entry_flush debugfs file");
 		return 1;
 	}
 
-	if (write_debugfs_file("powerpc/uaccess_flush", uaccess_flush_orig) < 0) {
+	if (write_debugfs_int("powerpc/uaccess_flush", uaccess_flush_orig) < 0) {
 		perror("unable to restore original value of powerpc/uaccess_flush debugfs file");
 		return 1;
 	}
diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index 861b1f7aa95f..8593e67ce779 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -95,6 +95,24 @@ int read_auxv(char *buf, ssize_t buf_size)
 	return 0;
 }
 
+int read_debugfs_file(const char *subpath, char *buf, size_t count)
+{
+	char path[PATH_MAX] = "/sys/kernel/debug/";
+
+	strncat(path, subpath, sizeof(path) - strlen(path) - 1);
+
+	return read_file(path, buf, count, NULL);
+}
+
+int write_debugfs_file(const char *subpath, const char *buf, size_t count)
+{
+	char path[PATH_MAX] = "/sys/kernel/debug/";
+
+	strncat(path, subpath, sizeof(path) - strlen(path) - 1);
+
+	return write_file(path, buf, count);
+}
+
 void *find_auxv_entry(int type, char *auxv)
 {
 	ElfW(auxv_t) *p;
@@ -187,16 +205,12 @@ int read_sysfs_file(char *fpath, char *result, size_t result_size)
 	return read_file(path, result, result_size, NULL);
 }
 
-int read_debugfs_file(char *debugfs_file, int *result)
+int read_debugfs_int(const char *debugfs_file, int *result)
 {
 	int err;
-	char path[PATH_MAX];
 	char value[16] = {0};
 
-	strcpy(path, "/sys/kernel/debug/");
-	strncat(path, debugfs_file, PATH_MAX - strlen(path) - 1);
-
-	if ((err = read_file(path, value, sizeof(value) - 1, NULL)))
+	if ((err = read_debugfs_file(debugfs_file, value, sizeof(value) - 1)))
 		return err;
 
 	*result = atoi(value);
@@ -204,17 +218,13 @@ int read_debugfs_file(char *debugfs_file, int *result)
 	return 0;
 }
 
-int write_debugfs_file(char *debugfs_file, int result)
+int write_debugfs_int(const char *debugfs_file, int result)
 {
-	char path[PATH_MAX];
 	char value[16];
 
-	strcpy(path, "/sys/kernel/debug/");
-	strncat(path, debugfs_file, PATH_MAX - strlen(path) - 1);
-
 	snprintf(value, 16, "%d", result);
 
-	return write_file(path, value, strlen(value));
+	return write_debugfs_file(debugfs_file, value, strlen(value));
 }
 
 static long perf_event_open(struct perf_event_attr *hw_event, pid_t pid,
-- 
2.38.1

