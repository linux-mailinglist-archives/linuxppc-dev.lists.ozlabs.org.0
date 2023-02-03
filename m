Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E94E688C08
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 01:42:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7H0n0Htsz3fBC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 11:42:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fNkXWOtN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fNkXWOtN;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Gym4SxSz3bcs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 11:40:16 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312NHmdq003049
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=N97XsOb3FLHzZNxYy60OjjPkisJ8wCk17oIabIZSNQ0=;
 b=fNkXWOtNJC4F6Vs5c+l6RaWxWlaZc+MZMy/uyzsuyUetvuIJx+WS59FHbetr+OuR5ovL
 6l90zHwt0LIS2ahYohjNRgDKsdeENpkmh0uVWzxt/qqflhgziJS71gd5AOFLRIgNWezf
 TOkxsmoO/UXuRWrUGbwPi5Hamcb0SlX5TOyUl0La6Gyzzrvh6Ojpd+7huk6jbU+WJgpQ
 /Be7pbL9vyzkhuYlCT0F1ECKs3k5+NVzFMdH9uNMj0WsNGuPP+t5LfAjSh2zXlrjuMSB
 w2nzahbAMFmtw3TVhFcA+xkXG9GnTyHoeXAJ1JE9as6X+9fiqhsozwOuC3/eF0w8EP6C MA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngpqnsej1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 00:40:12 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 312DlmTm026916
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:10 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3ncvs7pthn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 00:40:10 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3130e8D147448338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:08 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62ABA20043
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:08 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6876320040
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:07 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AFA1D6064A;
	Fri,  3 Feb 2023 11:40:05 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/5] selftests/powerpc: Add read/write debugfs file, int
Date: Fri,  3 Feb 2023 11:39:44 +1100
Message-Id: <20230203003947.38033-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203003947.38033-1-bgray@linux.ibm.com>
References: <20230203003947.38033-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O27TaR_lM5Gha29tdGfoVL4d3g8ojpF1
X-Proofpoint-GUID: O27TaR_lM5Gha29tdGfoVL4d3g8ojpF1
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Debugfs files are not always integers, so make *_file return/write a
byte buffer, and *_int deal with int values specifically. This increases
consistency with the other file read/write helpers.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

---

v4:	* Add reviewed-by
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
index 22ba13425b2c..495299a79f50 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -105,6 +105,24 @@ int read_auxv(char *buf, ssize_t buf_size)
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
@@ -197,16 +215,12 @@ int read_sysfs_file(char *fpath, char *result, size_t result_size)
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
-	err = read_file(path, value, sizeof(value) - 1, NULL);
+	err = read_debugfs_file(debugfs_file, value, sizeof(value) - 1);
 	if (err)
 		return err;
 
@@ -215,17 +229,13 @@ int read_debugfs_file(char *debugfs_file, int *result)
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
2.39.1

