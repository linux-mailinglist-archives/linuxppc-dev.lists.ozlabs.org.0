Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE98688C06
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 01:41:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7Gzl348Lz3f7l
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 11:41:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r61rfWll;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r61rfWll;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Gym2j98z3bW6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 11:40:15 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312NC3vh013904
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wUnd+MEQAOnRyGRVzsVaOR144xqrV7Hlh4EXlFgF7zE=;
 b=r61rfWllDVRJ7piCc4+UfiHYhs4kwt9sHQzpVKibfa6RJnUjy+UHzqOLjiDnLhMR59sr
 Gw/Upy6HSwHBDs1C2IqZCjIyqognCaJ08DDjzur+YCZOqAB3YZN2vlHIJQhwIy2+mie8
 j1Yu3RiwRtaxn9yNdVac7OBPbX1oLzS2i6sUc+51skSBRUjxJwafW+xYdunqVlvJAefu
 te483sbd8L75XuPXWgOAd305rYFAJOQcCSNNnQUsW4KRuL6B1YIik9Ee2/fvLCb5KNfw
 q0xaqSMObxJKa5+R0gybF3vAaEOr0/jv5CAl7QHKdxLnapGg0uvnqJSvdJpI1RGXMIV8 jg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngpmr9kev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 00:40:13 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 312CHZsY026906
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:10 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3ncvs7pthp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 00:40:10 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3130e8YK52756768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:08 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6694F2004B
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:08 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D19620043
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:07 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B6E3960687;
	Fri,  3 Feb 2023 11:40:05 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/5] selftests/powerpc: Parse long/unsigned long value safely
Date: Fri,  3 Feb 2023 11:39:45 +1100
Message-Id: <20230203003947.38033-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203003947.38033-1-bgray@linux.ibm.com>
References: <20230203003947.38033-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EsuhgM0gbVpAkXImpbE-zfxiaab4QNWU
X-Proofpoint-ORIG-GUID: EsuhgM0gbVpAkXImpbE-zfxiaab4QNWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_16,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Often a file is expected to hold an integral value. Existing functions
will use a C stdlib function like atoi or strtol to parse the file.
These operations are error prone, with complicated error conditions
(atoi returns 0 if not a number, and is undefined behaviour if not in
range. strtol returns 0 if not a number, and LONG_MIN/MAX if not in
range + sets errno to ERANGE).

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v4:	* Implement as C functions, remove macros
	* Declare parsers for intmax_t, uintmax_t
	* Stop validating the remaining buffer after a null terminator
	* Set errno to match the return code
---
 .../testing/selftests/powerpc/include/utils.h |   7 +
 tools/testing/selftests/powerpc/pmu/lib.c     |   6 +-
 tools/testing/selftests/powerpc/utils.c       | 126 +++++++++++++++++-
 3 files changed, 132 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index de5e3790f397..7c1fa385824c 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -33,6 +33,13 @@ void *get_auxv_entry(int type);
 
 int pick_online_cpu(void);
 
+int parse_intmax(const char *buffer, size_t count, intmax_t *result, int base);
+int parse_uintmax(const char *buffer, size_t count, uintmax_t *result, int base);
+int parse_int(const char *buffer, size_t count, int *result, int base);
+int parse_uint(const char *buffer, size_t count, unsigned int *result, int base);
+int parse_long(const char *buffer, size_t count, long *result, int base);
+int parse_ulong(const char *buffer, size_t count, unsigned long *result, int base);
+
 int read_file(const char *path, char *buf, size_t count, size_t *len);
 int write_file(const char *path, const char *buf, size_t count);
 int read_debugfs_file(const char *debugfs_file, char *buf, size_t count);
diff --git a/tools/testing/selftests/powerpc/pmu/lib.c b/tools/testing/selftests/powerpc/pmu/lib.c
index 960915304a65..1cfc13a25aee 100644
--- a/tools/testing/selftests/powerpc/pmu/lib.c
+++ b/tools/testing/selftests/powerpc/pmu/lib.c
@@ -192,7 +192,6 @@ bool require_paranoia_below(int level)
 {
 	int err;
 	long current;
-	char *end;
 	char buf[16] = {0};
 
 	err = read_file(PARANOID_PATH, buf, sizeof(buf) - 1, NULL);
@@ -201,9 +200,8 @@ bool require_paranoia_below(int level)
 		return false;
 	}
 
-	current = strtol(buf, &end, 10);
-
-	if (end == buf) {
+	err = parse_long(buf, sizeof(buf), &current, 10);
+	if (err) {
 		printf("Couldn't parse " PARANOID_PATH "?\n");
 		return false;
 	}
diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index 495299a79f50..ddfd871881bf 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -8,6 +8,8 @@
 #include <elf.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <inttypes.h>
+#include <limits.h>
 #include <link.h>
 #include <sched.h>
 #include <stdio.h>
@@ -123,6 +125,126 @@ int write_debugfs_file(const char *subpath, const char *buf, size_t count)
 	return write_file(path, buf, count);
 }
 
+static int validate_int_parse(const char *buffer, size_t count, char *end)
+{
+	int err = 0;
+
+	/* Require at least one digit */
+	if (end == buffer) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	/* Require all remaining characters be whitespace-ish */
+	for (; end < buffer + count; end++) {
+		if (*end == '\0')
+			break;
+
+		if (*end != ' ' && *end != '\n') {
+			err = -EINVAL;
+			goto out;
+		}
+	}
+
+out:
+	errno = -err;
+	return err;
+}
+
+static int parse_bounded_int(const char *buffer, size_t count, intmax_t *result,
+			     int base, intmax_t min, intmax_t max)
+{
+	int err;
+	char *end;
+
+	errno = 0;
+	*result = strtoimax(buffer, &end, base);
+
+	if (errno)
+		return -errno;
+
+	err = validate_int_parse(buffer, count, end);
+	if (err)
+		goto out;
+
+	if (*result < min || *result > max)
+		err = -EOVERFLOW;
+
+out:
+	errno = -err;
+	return err;
+}
+
+static int parse_bounded_uint(const char *buffer, size_t count, uintmax_t *result,
+			      int base, uintmax_t max)
+{
+	int err = 0;
+	char *end;
+
+	errno = 0;
+	*result = strtoumax(buffer, &end, base);
+
+	if (errno)
+		return -errno;
+
+	err = validate_int_parse(buffer, count, end);
+	if (err)
+		goto out;
+
+	if (*result > max)
+		err = -EOVERFLOW;
+
+out:
+	errno = -err;
+	return err;
+}
+
+int parse_intmax(const char *buffer, size_t count, intmax_t *result, int base)
+{
+	return parse_bounded_int(buffer, count, result, base, INTMAX_MIN, INTMAX_MAX);
+}
+
+int parse_uintmax(const char *buffer, size_t count, uintmax_t *result, int base)
+{
+	return parse_bounded_uint(buffer, count, result, base, UINTMAX_MAX);
+}
+
+int parse_int(const char *buffer, size_t count, int *result, int base)
+{
+	intmax_t parsed;
+	int err = parse_bounded_int(buffer, count, &parsed, base, INT_MIN, INT_MAX);
+
+	*result = parsed;
+	return err;
+}
+
+int parse_uint(const char *buffer, size_t count, unsigned int *result, int base)
+{
+	uintmax_t parsed;
+	int err = parse_bounded_uint(buffer, count, &parsed, base, UINT_MAX);
+
+	*result = parsed;
+	return err;
+}
+
+int parse_long(const char *buffer, size_t count, long *result, int base)
+{
+	intmax_t parsed;
+	int err = parse_bounded_int(buffer, count, &parsed, base, LONG_MIN, LONG_MAX);
+
+	*result = parsed;
+	return err;
+}
+
+int parse_ulong(const char *buffer, size_t count, unsigned long *result, int base)
+{
+	uintmax_t parsed;
+	int err = parse_bounded_uint(buffer, count, &parsed, base, ULONG_MAX);
+
+	*result = parsed;
+	return err;
+}
+
 void *find_auxv_entry(int type, char *auxv)
 {
 	ElfW(auxv_t) *p;
@@ -224,9 +346,7 @@ int read_debugfs_int(const char *debugfs_file, int *result)
 	if (err)
 		return err;
 
-	*result = atoi(value);
-
-	return 0;
+	return parse_int(value, sizeof(value), result, 10);
 }
 
 int write_debugfs_int(const char *debugfs_file, int result)
-- 
2.39.1

