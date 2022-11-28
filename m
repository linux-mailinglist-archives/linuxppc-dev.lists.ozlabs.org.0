Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F90C63A08F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 05:26:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLC8x0jh4z3fFV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 15:26:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F/JvvwRc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F/JvvwRc;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLC1v2vSFz3c2j
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 15:20:35 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS1jSo7027845;
	Mon, 28 Nov 2022 04:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vVfzkeuSKuYkEa9K/PQNn1VO+QVaWz98NeNWBIknzZI=;
 b=F/JvvwRcdKhYaaWYz9ABQgqYuMS4BTNirqdC8qO2PjIlW/8RvJBQOPZneqo0G2wxObPQ
 6VMa8zx1ni3D66HWGjyXH7cVMQe69PHXqf9LHc+XTTc8nTiZmuRBT8SisxVw1oLQU0yI
 uZkutNJj4ym3yrzBPP9wL2fnvlv8iJzfzCjKuNiafeooBNekLyf9cAJ2qnOfJc+G9j0n
 OsDPMd+HjrY8ywS4n1CjctFNSEyPJhn88kqJEKXdHmMImepzenpiuD4BBozjPhQrFeQx
 GYireyy2gU4+bgiwEodXCF7uIa2Lti2dzVdx3x1Rj7LTwZXxzY0TF6Fv8kkAFBq1HnJh iA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vn6w450-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 04:20:31 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS4K6QS016111;
	Mon, 28 Nov 2022 04:20:29 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3m3a2hsx2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 04:20:29 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS4E2ua57803158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 04:14:02 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C38BAE04D;
	Mon, 28 Nov 2022 04:20:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91A2EAE045;
	Mon, 28 Nov 2022 04:20:26 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 04:20:26 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F3D7D60839;
	Mon, 28 Nov 2022 15:20:22 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 6/7] selftests/powerpc: Add {read,write}_{long,ulong}
Date: Mon, 28 Nov 2022 15:19:47 +1100
Message-Id: <20221128041948.58339-7-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128041948.58339-1-bgray@linux.ibm.com>
References: <20221128041948.58339-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wKX872Tr6sifqtsswhm1miwB6-SNJI-Q
X-Proofpoint-ORIG-GUID: wKX872Tr6sifqtsswhm1miwB6-SNJI-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_04,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280029
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

Add helper functions to read and write (unsigned) long values directly
from/to files. One of the kernel interfaces uses hex strings, so we need
to allow passing a base too.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 tools/testing/selftests/powerpc/dscr/dscr.h   |  9 +--
 .../selftests/powerpc/dscr/dscr_sysfs_test.c  | 12 ++--
 .../testing/selftests/powerpc/include/utils.h |  4 ++
 tools/testing/selftests/powerpc/pmu/lib.c     | 11 +---
 tools/testing/selftests/powerpc/utils.c       | 62 +++++++++++++++++++
 5 files changed, 76 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/powerpc/dscr/dscr.h b/tools/testing/selftests/powerpc/dscr/dscr.h
index 9a69d473ffdf..b5166ddcf26a 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr.h
+++ b/tools/testing/selftests/powerpc/dscr/dscr.h
@@ -65,26 +65,21 @@ inline void set_dscr_usr(unsigned long val)
 unsigned long get_default_dscr(void)
 {
 	int err;
-	char buf[16] = {0};
 	unsigned long val;
 
-	if ((err = read_file(DSCR_DEFAULT, buf, sizeof(buf) - 1, NULL))) {
+	if ((err = read_ulong(DSCR_DEFAULT, &val, 16))) {
 		fprintf(stderr, "get_default_dscr() read failed: %s\n", strerror(err));
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
-	if ((err = write_file(DSCR_DEFAULT, buf, strlen(buf)))) {
+	if ((err = write_ulong(DSCR_DEFAULT, val, 16))) {
 		fprintf(stderr, "set_default_dscr() write failed: %s\n", strerror(err));
 		exit(1);
 	}
diff --git a/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c b/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
index 310946262a24..3ac176888feb 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
@@ -12,15 +12,15 @@
 
 static int check_cpu_dscr_default(char *file, unsigned long val)
 {
-	char buf[10] = {0};
-	int rc;
+	unsigned long cpu_dscr;
+	int err;
 
-	if ((rc = read_file(file, buf, sizeof(buf) - 1, NULL)))
-		return rc;
+	if ((err = read_ulong(file, &cpu_dscr, 16)))
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
index b82e143a07c6..044b0236df38 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -40,6 +40,10 @@ int parse_ulong(const char *buffer, size_t count, unsigned long *result, int bas
 
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
index 771658278f55..55481c5b6995 100644
--- a/tools/testing/selftests/powerpc/pmu/lib.c
+++ b/tools/testing/selftests/powerpc/pmu/lib.c
@@ -192,16 +192,9 @@ bool require_paranoia_below(int level)
 {
 	int err;
 	long current;
-	char buf[16] = {0};
-	char *end;
 
-	if ((err = read_file(PARANOID_PATH, buf, sizeof(buf) - 1, NULL))) {
-		printf("Couldn't read " PARANOID_PATH "?\n");
-		return false;
-	}
-
-	if ((err = parse_long(buf, sizeof(buf), &current, 10))) {
-		printf("Couldn't parse " PARANOID_PATH "?\n");
+	if ((err = read_long(PARANOID_PATH, &current, 10))) {
+		fprintf(stderr, "Couldn't read " PARANOID_PATH ": %s\n", strerror(err));
 		return false;
 	}
 
diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index c82539fd44f1..b2906dd71cf5 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -162,6 +162,68 @@ define_parse_number(parse_long, long, intmax_t);
 define_parse_number(parse_uint, unsigned int, uintmax_t);
 define_parse_number(parse_ulong, unsigned long, uintmax_t);
 
+int read_long(const char *path, long *result, int base)
+{
+	int err;
+	char buffer[32] = {0};
+
+	if ((err = read_file(path, buffer, sizeof(buffer) - 1, NULL)))
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
+	if ((err = read_file(path, buffer, sizeof(buffer) - 1, NULL)))
+		return err;
+
+	return parse_ulong(buffer, sizeof(buffer), result, base);
+}
+
+int write_long(const char *path, long result, int base)
+{
+	int len;
+	char buffer[32];
+
+	/* Decimal only; we don't have a format specifier for signed hex values */
+	if (base != 10)
+		return EINVAL;
+
+	len = snprintf(buffer, sizeof(buffer), "%ld", result);
+	if (len < 0 || len >= sizeof(buffer))
+		return EOVERFLOW;
+
+	return write_file(path, buffer, len);
+}
+
+int write_ulong(const char *path, unsigned long result, int base)
+{
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
+		return EINVAL;
+	}
+
+	len = snprintf(buffer, sizeof(buffer), fmt, result);
+	if (len < 0 || len >= sizeof(buffer))
+		return -1;
+
+	return write_file(path, buffer, len);
+}
+
 void *find_auxv_entry(int type, char *auxv)
 {
 	ElfW(auxv_t) *p;
-- 
2.38.1

