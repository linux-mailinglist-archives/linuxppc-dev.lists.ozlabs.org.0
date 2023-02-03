Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14529688C10
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 01:44:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7H3t6rZZz3fBc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 11:44:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Td91F/zr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Td91F/zr;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Gyp4VPRz3cdr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 11:40:18 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3130JnMR028656
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=50a53i2fLzRTPP6R2UMSiYAXFaEKi9JT7GBFUtn9fxM=;
 b=Td91F/zrmERjiahiyzFTUseoRwJCCNFLK3Oa8U5qK8jhmY5AYTvEptO36ouEwBgeJMOS
 e8li5xfMPjk4TvMHeBhraF55lGAB+aamvaIM4+QBovNPClPyLhX3iRz86cUeUu2DnzH7
 rWnt4ZWyiimwLTQQdNGGBjEpTlWncXu9kgSariwjWcTKCazygs/3Nf4ggG2b05Fr6RaR
 RqQG0d9A3wK5WG+ywQcHun0TKVt2387jiaCfIuQz6JvYbah7rsAO9Rwxpm5dqnqd/adw
 Hc89X0XULALO9ZfdYdLda6Rcv+kSSwzQgdg80DWh3WuSxnB/1Pw5lOp5oDZvYGXDslXw Og== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngqma0ae8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 00:40:13 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 312CQDV1014228
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:11 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3ncvugmv7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 00:40:10 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3130e8hF50004288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:08 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73CD220043
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:08 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7680F20040
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:07 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BE3AA606DB;
	Fri,  3 Feb 2023 11:40:05 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] selftests/powerpc: Add {read,write}_{long,ulong}
Date: Fri,  3 Feb 2023 11:39:46 +1100
Message-Id: <20230203003947.38033-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203003947.38033-1-bgray@linux.ibm.com>
References: <20230203003947.38033-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3NjD_nJSGjk1VCJlE2VgLzEDJyByThWw
X-Proofpoint-ORIG-GUID: 3NjD_nJSGjk1VCJlE2VgLzEDJyByThWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_16,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxscore=0 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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

Add helper functions to read and write (unsigned) long values directly
from/to files. One of the kernel interfaces uses hex strings, so we need
to allow passing a base too.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v4:	* Set errno where it isn't already set
---
 tools/testing/selftests/powerpc/dscr/dscr.h   |  9 +--
 .../selftests/powerpc/dscr/dscr_sysfs_test.c  | 14 ++--
 .../testing/selftests/powerpc/include/utils.h |  4 +
 tools/testing/selftests/powerpc/pmu/lib.c     |  9 +--
 tools/testing/selftests/powerpc/utils.c       | 81 +++++++++++++++++++
 5 files changed, 95 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/powerpc/dscr/dscr.h b/tools/testing/selftests/powerpc/dscr/dscr.h
index aaa2b0d89f7e..2c54998d4715 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr.h
+++ b/tools/testing/selftests/powerpc/dscr/dscr.h
@@ -65,26 +65,21 @@ inline void set_dscr_usr(unsigned long val)
 unsigned long get_default_dscr(void)
 {
 	int err;
-	char buf[16] = {0};
 	unsigned long val;
 
-	err = read_file(DSCR_DEFAULT, buf, sizeof(buf) - 1, NULL);
+	err = read_ulong(DSCR_DEFAULT, &val, 16);
 	if (err) {
 		perror("read() failed");
 		exit(1);
 	}
-	sscanf(buf, "%lx", &val);
 	return val;
 }
 
 void set_default_dscr(unsigned long val)
 {
 	int err;
-	char buf[16];
 
-	sprintf(buf, "%lx\n", val);
-
-	err = write_file(DSCR_DEFAULT, buf, strlen(buf));
+	err = write_ulong(DSCR_DEFAULT, val, 16);
 	if (err) {
 		perror("write() failed");
 		exit(1);
diff --git a/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c b/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
index c350f193830a..4f1fef6198fc 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
@@ -12,16 +12,16 @@
 
 static int check_cpu_dscr_default(char *file, unsigned long val)
 {
-	char buf[10] = {0};
-	int rc;
+	unsigned long cpu_dscr;
+	int err;
 
-	rc = read_file(file, buf, sizeof(buf) - 1, NULL);
-	if (rc)
-		return rc;
+	err = read_ulong(file, &cpu_dscr, 16);
+	if (err)
+		return err;
 
-	if (strtol(buf, NULL, 16) != val) {
+	if (cpu_dscr != val) {
 		printf("DSCR match failed: %ld (system) %ld (cpu)\n",
-					val, strtol(buf, NULL, 16));
+					val, cpu_dscr);
 		return 1;
 	}
 	return 0;
diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index 7c1fa385824c..311ddc124ebc 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -42,6 +42,10 @@ int parse_ulong(const char *buffer, size_t count, unsigned long *result, int bas
 
 int read_file(const char *path, char *buf, size_t count, size_t *len);
 int write_file(const char *path, const char *buf, size_t count);
+int read_long(const char *path, long *result, int base);
+int write_long(const char *path, long result, int base);
+int read_ulong(const char *path, unsigned long *result, int base);
+int write_ulong(const char *path, unsigned long result, int base);
 int read_debugfs_file(const char *debugfs_file, char *buf, size_t count);
 int write_debugfs_file(const char *debugfs_file, const char *buf, size_t count);
 int read_debugfs_int(const char *debugfs_file, int *result);
diff --git a/tools/testing/selftests/powerpc/pmu/lib.c b/tools/testing/selftests/powerpc/pmu/lib.c
index 1cfc13a25aee..719f94f10d41 100644
--- a/tools/testing/selftests/powerpc/pmu/lib.c
+++ b/tools/testing/selftests/powerpc/pmu/lib.c
@@ -192,15 +192,8 @@ bool require_paranoia_below(int level)
 {
 	int err;
 	long current;
-	char buf[16] = {0};
 
-	err = read_file(PARANOID_PATH, buf, sizeof(buf) - 1, NULL);
-	if (err) {
-		printf("Couldn't read " PARANOID_PATH "?\n");
-		return false;
-	}
-
-	err = parse_long(buf, sizeof(buf), &current, 10);
+	err = read_long(PARANOID_PATH, &current, 10);
 	if (err) {
 		printf("Couldn't parse " PARANOID_PATH "?\n");
 		return false;
diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index ddfd871881bf..1017f1738619 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -245,6 +245,87 @@ int parse_ulong(const char *buffer, size_t count, unsigned long *result, int bas
 	return err;
 }
 
+int read_long(const char *path, long *result, int base)
+{
+	int err;
+	char buffer[32] = {0};
+
+	err = read_file(path, buffer, sizeof(buffer) - 1, NULL);
+	if (err)
+		return err;
+
+	return parse_long(buffer, sizeof(buffer), result, base);
+}
+
+int read_ulong(const char *path, unsigned long *result, int base)
+{
+	int err;
+	char buffer[32] = {0};
+
+	err = read_file(path, buffer, sizeof(buffer) - 1, NULL);
+	if (err)
+		return err;
+
+	return parse_ulong(buffer, sizeof(buffer), result, base);
+}
+
+int write_long(const char *path, long result, int base)
+{
+	int err;
+	int len;
+	char buffer[32];
+
+	/* Decimal only for now: no format specifier for signed hex values */
+	if (base != 10) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	len = snprintf(buffer, sizeof(buffer), "%ld", result);
+	if (len < 0 || len >= sizeof(buffer)) {
+		err = -EOVERFLOW;
+		goto out;
+	}
+
+	err = write_file(path, buffer, len);
+
+out:
+	errno = -err;
+	return err;
+}
+
+int write_ulong(const char *path, unsigned long result, int base)
+{
+	int err;
+	int len;
+	char buffer[32];
+	char *fmt;
+
+	switch (base) {
+	case 10:
+		fmt = "%lu";
+		break;
+	case 16:
+		fmt = "%lx";
+		break;
+	default:
+		err = -EINVAL;
+		goto out;
+	}
+
+	len = snprintf(buffer, sizeof(buffer), fmt, result);
+	if (len < 0 || len >= sizeof(buffer)) {
+		err = -errno;
+		goto out;
+	}
+
+	err = write_file(path, buffer, len);
+
+out:
+	errno = -err;
+	return err;
+}
+
 void *find_auxv_entry(int type, char *auxv)
 {
 	ElfW(auxv_t) *p;
-- 
2.39.1

