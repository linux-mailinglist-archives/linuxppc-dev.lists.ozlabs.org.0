Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F46634AF8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 00:17:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NH0XS4lGyz3f87
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 10:17:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JTd2qPI2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JTd2qPI2;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NH0QJ65h1z3cKb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 10:12:08 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMM3Q8Y010046;
	Tue, 22 Nov 2022 23:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mY4lw1QPTrn/AW8DFz/TBpXBS59kiZKWIAcTqLSKDkw=;
 b=JTd2qPI2NHHKsXNXurpDNxEnfomsye9x/ZyGDPdz0HiQMbJkq1uEWeROSMiwb0ixDOh4
 RYvs+51svbPoMuSc6U7vas6HedzY21xCKtDlCicBVGYdbRjvaGr7AfRWF+9jUWOFDKTl
 BaIZB7TxQzBlPdU6J35HnJV0svJVNtzXTr38nxgJfMufyNNdry1HFVXIBE8JWh2hCKoM
 2bTnE8h9QN3yBz/kSJrpotfB798yn6a3jI/k062vCPtWBDOJaAlMiFMG78xWFT3VANmn
 4fEIlvp8sdHloijlaXqPA718CTIHdcH2HPDgvZ3kNwMGeYEzWBhN1pRLHnLQdV9y5ZVL 0Q== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10bkuk3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 23:12:06 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AMN5PMf004261;
	Tue, 22 Nov 2022 23:12:04 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03fra.de.ibm.com with ESMTP id 3kxps93jh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 23:12:04 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AMNC1gc60817690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 23:12:01 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B662A405B;
	Tue, 22 Nov 2022 23:12:01 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E12D3A4054;
	Tue, 22 Nov 2022 23:12:00 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 23:12:00 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B917560839;
	Wed, 23 Nov 2022 10:11:56 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 6/7] selftests/powerpc: Add {read,write}_{long,ulong}
Date: Wed, 23 Nov 2022 10:11:02 +1100
Message-Id: <20221122231103.15829-7-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122231103.15829-1-bgray@linux.ibm.com>
References: <20221122231103.15829-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ir7UW0EmdWwak9CX17zxjb1bL3giMHZJ
X-Proofpoint-GUID: ir7UW0EmdWwak9CX17zxjb1bL3giMHZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211220174
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
index 7c7d8aaa69fb..32a96c8967ac 100644
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

