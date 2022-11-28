Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 845AA63A08D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 05:24:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLC6t2zDnz3cLC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 15:24:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ONIYrWmu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ONIYrWmu;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLC1t0yhsz3cKG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 15:20:33 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS2MMNe019009;
	Mon, 28 Nov 2022 04:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=l/PN7FoJsC/HVB6vpxycwokuQ5dDxDGmgj5qqWR9kD4=;
 b=ONIYrWmuYH4JwM8fY8HnVZ06G4gddrH646JkEA9jK+OeZ06g5TXr+g33VxTK2pzgCXst
 gdzJY8GK7LpiaxYMDLfRzdTDhZWQsMdQkqibuIyPzJ7nUtgNF8ha+vD0eUxUAungH/FU
 KWt+mdyaIM8MuYPdd91QMphnDuxPo26Fl4r9R+2msD6I4Fp2i6RBcMMxqeWWKFeLKktY
 ZG9O5ADRUhsT5dAFfFTlscj1Q029dnh6inYcX5y/AAUcrl3Ea8ohmgZppynDGGpH5PF8
 AeCIasFd6n+pHz7/XqfMGBMztb9MxzYVzJWGLeJuyU/+j78wA1R8YNYk38LyB5CxRTcQ SQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vmr5889-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 04:20:31 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS45JjR027800;
	Mon, 28 Nov 2022 04:20:29 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3m3ae99wrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 04:20:29 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS4E2Gw5243610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 04:14:02 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CCDB4C04A;
	Mon, 28 Nov 2022 04:20:27 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91DAB4C040;
	Mon, 28 Nov 2022 04:20:26 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 04:20:26 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F1B2960810;
	Mon, 28 Nov 2022 15:20:22 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 5/7] selftests/powerpc: Parse long/unsigned long value safely
Date: Mon, 28 Nov 2022 15:19:46 +1100
Message-Id: <20221128041948.58339-6-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128041948.58339-1-bgray@linux.ibm.com>
References: <20221128041948.58339-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FTHtvcHt1uKKk25TRNFBZeeIJZdUk2Xn
X-Proofpoint-ORIG-GUID: FTHtvcHt1uKKk25TRNFBZeeIJZdUk2Xn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_04,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 mlxscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211280026
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

Often a file is expected to hold an integral value. Existing functions
will use a C stdlib function like atoi or strtol to parse the file.
These operations are error prone, with complicated error conditions
(atoi returns 0 if not a number, and is undefined behaviour if not in
range. strtol returns 0 if not a number, and LONG_MIN/MAX if not in
range + sets errno to ERANGE).

Add a dedicated parse function that accounts for these error conditions
so tests can safely parse numbers without undetected bad data. It's a
bit ugly to generate the functions through a macro, but it beats copying
the error check logic multiple times over.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 .../testing/selftests/powerpc/include/utils.h |  5 ++
 tools/testing/selftests/powerpc/pmu/lib.c     |  9 ++--
 tools/testing/selftests/powerpc/utils.c       | 53 +++++++++++++++++--
 3 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index de5e3790f397..b82e143a07c6 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -33,6 +33,11 @@ void *get_auxv_entry(int type);
 
 int pick_online_cpu(void);
 
+int parse_int(const char *buffer, size_t count, int *result, int base);
+int parse_long(const char *buffer, size_t count, long *result, int base);
+int parse_uint(const char *buffer, size_t count, unsigned int *result, int base);
+int parse_ulong(const char *buffer, size_t count, unsigned long *result, int base);
+
 int read_file(const char *path, char *buf, size_t count, size_t *len);
 int write_file(const char *path, const char *buf, size_t count);
 int read_debugfs_file(const char *debugfs_file, char *buf, size_t count);
diff --git a/tools/testing/selftests/powerpc/pmu/lib.c b/tools/testing/selftests/powerpc/pmu/lib.c
index e8960e7a1271..771658278f55 100644
--- a/tools/testing/selftests/powerpc/pmu/lib.c
+++ b/tools/testing/selftests/powerpc/pmu/lib.c
@@ -192,16 +192,15 @@ bool require_paranoia_below(int level)
 {
 	int err;
 	long current;
-	char *end, buf[16];
+	char buf[16] = {0};
+	char *end;
 
-	if ((err = read_file(PARANOID_PATH, buf, sizeof(buf), NULL))) {
+	if ((err = read_file(PARANOID_PATH, buf, sizeof(buf) - 1, NULL))) {
 		printf("Couldn't read " PARANOID_PATH "?\n");
 		return false;
 	}
 
-	current = strtol(buf, &end, 10);
-
-	if (end == buf) {
+	if ((err = parse_long(buf, sizeof(buf), &current, 10))) {
 		printf("Couldn't parse " PARANOID_PATH "?\n");
 		return false;
 	}
diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index 8593e67ce779..c82539fd44f1 100644
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
@@ -113,6 +115,53 @@ int write_debugfs_file(const char *subpath, const char *buf, size_t count)
 	return write_file(path, buf, count);
 }
 
+#define TYPE_MIN(x)				\
+	_Generic((x),				\
+		int:		INT_MIN,	\
+		long:		LONG_MIN,	\
+		unsigned int:	0,		\
+		unsigned long:	0)
+
+#define TYPE_MAX(x)				\
+	_Generic((x),				\
+		int:		INT_MAX,	\
+		long:		LONG_MAX,	\
+		unsigned int:	INT_MAX,	\
+		unsigned long:	LONG_MAX)
+
+#define define_parse_number(fn, type, super_type)				\
+	int fn(const char *buffer, size_t count, type *result, int base)	\
+	{									\
+		char *end;							\
+		super_type parsed;						\
+										\
+		errno = 0;							\
+		parsed = _Generic(parsed,					\
+				  intmax_t:	strtoimax,			\
+				  uintmax_t:	strtoumax)(buffer, &end, base);	\
+										\
+		if (errno == ERANGE ||						\
+		    parsed < TYPE_MIN(*result) || parsed > TYPE_MAX(*result))	\
+			return ERANGE;						\
+										\
+		/* Require at least one digit */				\
+		if (end == buffer)						\
+			return EINVAL;						\
+										\
+		/* Require all remaining characters be whitespace-ish */	\
+		for (; end < buffer + count; end++)				\
+			if (!(*end == ' ' || *end == '\n' || *end == '\0'))	\
+				return EINVAL;					\
+										\
+		*result = parsed;						\
+		return 0;							\
+	}
+
+define_parse_number(parse_int, int, intmax_t);
+define_parse_number(parse_long, long, intmax_t);
+define_parse_number(parse_uint, unsigned int, uintmax_t);
+define_parse_number(parse_ulong, unsigned long, uintmax_t);
+
 void *find_auxv_entry(int type, char *auxv)
 {
 	ElfW(auxv_t) *p;
@@ -213,9 +262,7 @@ int read_debugfs_int(const char *debugfs_file, int *result)
 	if ((err = read_debugfs_file(debugfs_file, value, sizeof(value) - 1)))
 		return err;
 
-	*result = atoi(value);
-
-	return 0;
+	return parse_int(value, sizeof(value), result, 10);
 }
 
 int write_debugfs_int(const char *debugfs_file, int result)
-- 
2.38.1

