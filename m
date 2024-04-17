Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C768A821C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 13:30:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tN0ClLYQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKJbz1Jq2z3vv2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 21:30:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tN0ClLYQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKJSz4hgsz3vXk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 21:24:03 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43HBCZwh000741;
	Wed, 17 Apr 2024 11:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vTgnciMX73XmlNLx9K1vnU1SSwJklPQeI8oNLto/q/o=;
 b=tN0ClLYQYHHsIa/PwrA3AmPHZ5XdfFEvoZL+W1TyfyhVeHyfOowxV2SapHpaorBDavH9
 lhOyfE2+vwVyz36AFjHunY8zH1l8oPUy63fEMKm0Ch+u51tmvV+cV79rPr77BP8CSAmY
 cgH588UxqO5Iqp6Z42zkN7xCiQUqWqCOjibw6LrC8esXYGTLerYbqF5kMnMGpGcggZiP
 dcuDfFO7OeNhEiAX+8l/0OmLrFMFSF1jBWW8RYvLx2ARRi3Sc9jUk4TvH8BL9vRdvzyT
 9Ol+FcTQWKNay5aJRdmKoIXg6UHok7Cypp47Z1GjCDNnbO7va92ero0/xI7Z3zXNc7Dn IA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xjdbb80ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:23:59 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43H8Hm7K018152;
	Wed, 17 Apr 2024 11:23:58 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xg4ctc65n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:23:58 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43HBNtbe38928676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Apr 2024 11:23:57 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDF2B2004E;
	Wed, 17 Apr 2024 11:23:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20B8C20040;
	Wed, 17 Apr 2024 11:23:54 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Apr 2024 11:23:54 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.36.21.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7C16D6033D;
	Wed, 17 Apr 2024 21:23:51 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 8/9] selftests/powerpc/dexcr: Add chdexcr utility
Date: Wed, 17 Apr 2024 21:23:24 +1000
Message-ID: <20240417112325.728010-9-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417112325.728010-1-bgray@linux.ibm.com>
References: <20240417112325.728010-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HSyMXcU9b5h670ko5KAVjp2n8ZvIySBI
X-Proofpoint-GUID: HSyMXcU9b5h670ko5KAVjp2n8ZvIySBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404170078
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

Adds a utility to exercise the prctl DEXCR inheritance in the shell.
Supports setting and clearing each aspect.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 .../selftests/powerpc/dexcr/.gitignore        |   1 +
 .../testing/selftests/powerpc/dexcr/Makefile  |   2 +-
 .../testing/selftests/powerpc/dexcr/chdexcr.c | 110 +++++++++++++++
 tools/testing/selftests/powerpc/dexcr/dexcr.h |  47 +++++++
 .../testing/selftests/powerpc/dexcr/lsdexcr.c | 130 ++++--------------
 5 files changed, 185 insertions(+), 105 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/dexcr/chdexcr.c

diff --git a/tools/testing/selftests/powerpc/dexcr/.gitignore b/tools/testing/selftests/powerpc/dexcr/.gitignore
index 5d526613cd26..11eefb4b9fa4 100644
--- a/tools/testing/selftests/powerpc/dexcr/.gitignore
+++ b/tools/testing/selftests/powerpc/dexcr/.gitignore
@@ -1,3 +1,4 @@
 dexcr_test
 hashchk_test
+chdexcr
 lsdexcr
diff --git a/tools/testing/selftests/powerpc/dexcr/Makefile b/tools/testing/selftests/powerpc/dexcr/Makefile
index 076943193c07..6a89e88ef7b2 100644
--- a/tools/testing/selftests/powerpc/dexcr/Makefile
+++ b/tools/testing/selftests/powerpc/dexcr/Makefile
@@ -1,5 +1,5 @@
 TEST_GEN_PROGS := dexcr_test hashchk_test
-TEST_GEN_FILES := lsdexcr
+TEST_GEN_FILES := lsdexcr chdexcr
 
 include ../../lib.mk
 
diff --git a/tools/testing/selftests/powerpc/dexcr/chdexcr.c b/tools/testing/selftests/powerpc/dexcr/chdexcr.c
new file mode 100644
index 000000000000..217187a83224
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/chdexcr.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <errno.h>
+#include <stddef.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/prctl.h>
+
+#include "dexcr.h"
+#include "utils.h"
+
+static void die(const char *msg)
+{
+	printf("%s\n", msg);
+	exit(1);
+}
+
+static void help(void)
+{
+	printf("Invoke a provided program with a custom DEXCR on-exec reset value\n"
+	       "\n"
+	       "usage: chdexcr [CHDEXCR OPTIONS] -- PROGRAM [ARGS...]\n"
+	       "\n"
+	       "Each configurable DEXCR aspect is exposed as an option.\n"
+	       "\n"
+	       "The normal option sets the aspect in the DEXCR. The --no- variant\n"
+	       "clears that aspect. For example, --ibrtpd sets the IBRTPD aspect bit,\n"
+	       "so indirect branch predicition will be disabled in the provided program.\n"
+	       "Conversely, --no-ibrtpd clears the aspect bit, so indirect branch\n"
+	       "prediction may occur.\n"
+	       "\n"
+	       "CHDEXCR OPTIONS:\n");
+
+	for (int i = 0; i < ARRAY_SIZE(aspects); i++) {
+		const struct dexcr_aspect *aspect = &aspects[i];
+
+		if (aspect->prctl == -1)
+			continue;
+
+		printf("  --%-6s / --no-%-6s : %s\n", aspect->opt, aspect->opt, aspect->desc);
+	}
+}
+
+static const struct dexcr_aspect *opt_to_aspect(const char *opt)
+{
+	for (int i = 0; i < ARRAY_SIZE(aspects); i++)
+		if (aspects[i].prctl != -1 && !strcmp(aspects[i].opt, opt))
+			return &aspects[i];
+
+	return NULL;
+}
+
+static int apply_option(const char *option)
+{
+	const struct dexcr_aspect *aspect;
+	const char *opt = NULL;
+	const char *set_prefix = "--";
+	const char *clear_prefix = "--no-";
+	unsigned long ctrl = 0;
+	int err;
+
+	if (!strcmp(option, "-h") || !strcmp(option, "--help")) {
+		help();
+		exit(0);
+	}
+
+	/* Strip out --(no-) prefix and determine ctrl value */
+	if (!strncmp(option, clear_prefix, strlen(clear_prefix))) {
+		opt = &option[strlen(clear_prefix)];
+		ctrl |= PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC;
+	} else if (!strncmp(option, set_prefix, strlen(set_prefix))) {
+		opt = &option[strlen(set_prefix)];
+		ctrl |= PR_PPC_DEXCR_CTRL_SET_ONEXEC;
+	}
+
+	if (!opt || !*opt)
+		return 1;
+
+	aspect = opt_to_aspect(opt);
+	if (!aspect)
+		die("unknown aspect");
+
+	err = pr_set_dexcr(aspect->prctl, ctrl);
+	if (err)
+		die("failed to apply option");
+
+	return 0;
+}
+
+int main(int argc, char *const argv[], char *const envp[])
+{
+	int i;
+
+	if (!dexcr_exists())
+		die("DEXCR not detected on this hardware");
+
+	for (i = 1; i < argc; i++)
+		if (apply_option(argv[i]))
+			break;
+
+	if (i < argc && !strcmp(argv[i], "--"))
+		i++;
+
+	if (i >= argc)
+		die("missing command");
+
+	execve(argv[i], &argv[i], envp);
+	return errno;
+}
diff --git a/tools/testing/selftests/powerpc/dexcr/dexcr.h b/tools/testing/selftests/powerpc/dexcr/dexcr.h
index a6aa7eac11da..51e9ba3b0997 100644
--- a/tools/testing/selftests/powerpc/dexcr/dexcr.h
+++ b/tools/testing/selftests/powerpc/dexcr/dexcr.h
@@ -9,6 +9,7 @@
 #define _SELFTESTS_POWERPC_DEXCR_DEXCR_H
 
 #include <stdbool.h>
+#include <sys/prctl.h>
 #include <sys/types.h>
 
 #include "reg.h"
@@ -26,6 +27,52 @@
 #define PPC_RAW_HASHCHK(b, i, a) \
 	str(.long (0x7C0005E4 | PPC_RAW_HASH_ARGS(b, i, a));)
 
+struct dexcr_aspect {
+	const char *name;	/* Short display name */
+	const char *opt;	/* Option name for chdexcr */
+	const char *desc;	/* Expanded aspect meaning */
+	unsigned int index;	/* Aspect bit index in DEXCR */
+	unsigned long prctl;	/* 'which' value for get/set prctl */
+};
+
+static const struct dexcr_aspect aspects[] = {
+	{
+		.name = "SBHE",
+		.opt = "sbhe",
+		.desc = "Speculative branch hint enable",
+		.index = 0,
+		.prctl = PR_PPC_DEXCR_SBHE,
+	},
+	{
+		.name = "IBRTPD",
+		.opt = "ibrtpd",
+		.desc = "Indirect branch recurrent target prediction disable",
+		.index = 3,
+		.prctl = PR_PPC_DEXCR_IBRTPD,
+	},
+	{
+		.name = "SRAPD",
+		.opt = "srapd",
+		.desc = "Subroutine return address prediction disable",
+		.index = 4,
+		.prctl = PR_PPC_DEXCR_SRAPD,
+	},
+	{
+		.name = "NPHIE",
+		.opt = "nphie",
+		.desc = "Non-privileged hash instruction enable",
+		.index = 5,
+		.prctl = PR_PPC_DEXCR_NPHIE,
+	},
+	{
+		.name = "PHIE",
+		.opt = "phie",
+		.desc = "Privileged hash instruction enable",
+		.index = 6,
+		.prctl = -1,
+	},
+};
+
 bool dexcr_exists(void);
 
 bool pr_dexcr_aspect_supported(unsigned long which);
diff --git a/tools/testing/selftests/powerpc/dexcr/lsdexcr.c b/tools/testing/selftests/powerpc/dexcr/lsdexcr.c
index a63db47b6610..7588929180ab 100644
--- a/tools/testing/selftests/powerpc/dexcr/lsdexcr.c
+++ b/tools/testing/selftests/powerpc/dexcr/lsdexcr.c
@@ -12,52 +12,6 @@ static unsigned int dexcr;
 static unsigned int hdexcr;
 static unsigned int effective;
 
-struct dexcr_aspect {
-	const char *name;
-	const char *desc;
-	unsigned int index;
-	unsigned long prctl;
-	const char *sysctl;
-};
-
-static const struct dexcr_aspect aspects[] = {
-	{
-		.name = "SBHE",
-		.desc = "Speculative branch hint enable",
-		.index = 0,
-		.prctl = PR_PPC_DEXCR_SBHE,
-		.sysctl = "speculative_branch_hint_enable",
-	},
-	{
-		.name = "IBRTPD",
-		.desc = "Indirect branch recurrent target prediction disable",
-		.index = 3,
-		.prctl = PR_PPC_DEXCR_IBRTPD,
-		.sysctl = "indirect_branch_recurrent_target_prediction_disable",
-	},
-	{
-		.name = "SRAPD",
-		.desc = "Subroutine return address prediction disable",
-		.index = 4,
-		.prctl = PR_PPC_DEXCR_SRAPD,
-		.sysctl = "subroutine_return_address_prediction_disable",
-	},
-	{
-		.name = "NPHIE",
-		.desc = "Non-privileged hash instruction enable",
-		.index = 5,
-		.prctl = PR_PPC_DEXCR_NPHIE,
-		.sysctl = "nonprivileged_hash_instruction_enable",
-	},
-	{
-		.name = "PHIE",
-		.desc = "Privileged hash instruction enable",
-		.index = 6,
-		.prctl = -1,
-		.sysctl = NULL,
-	},
-};
-
 static void print_list(const char *list[], size_t len)
 {
 	for (size_t i = 0; i < len; i++) {
@@ -117,89 +71,57 @@ static void print_aspect(const struct dexcr_aspect *aspect)
 
 static void print_aspect_config(const struct dexcr_aspect *aspect)
 {
-	char sysctl_path[128] = "/proc/sys/kernel/dexcr/";
-	const char *reason = "unknown";
+	const char *reason = NULL;
 	const char *reason_hyp = NULL;
-	const char *reason_sysctl = "no sysctl";
 	const char *reason_prctl = "no prctl";
 	bool actual = effective & DEXCR_PR_BIT(aspect->index);
-	bool expected = false;
-
-	long sysctl_ctrl = 0;
-	int prctl_ctrl = 0;
-	int err;
-
-	if (aspect->prctl >= 0) {
-		prctl_ctrl = pr_get_dexcr(aspect->prctl);
-		if (prctl_ctrl < 0)
-			reason_prctl = "(failed to read prctl)";
-		else {
-			if (prctl_ctrl & PR_PPC_DEXCR_CTRL_SET) {
+	bool expected = actual;  /* Assume it's fine if we don't expect a specific set/clear value */
+
+	if (actual)
+		reason = "set by unknown";
+	else
+		reason = "cleared by unknown";
+
+	if (aspect->prctl != -1) {
+		int ctrl = pr_get_dexcr(aspect->prctl);
+
+		if (ctrl < 0) {
+			reason_prctl = "failed to read prctl";
+		} else {
+			if (ctrl & PR_PPC_DEXCR_CTRL_SET) {
 				reason_prctl = "set by prctl";
 				expected = true;
-			} else if (prctl_ctrl & PR_PPC_DEXCR_CTRL_CLEAR) {
+			} else if (ctrl & PR_PPC_DEXCR_CTRL_CLEAR) {
 				reason_prctl = "cleared by prctl";
 				expected = false;
-			} else
+			} else {
 				reason_prctl = "unknown prctl";
+			}
 
 			reason = reason_prctl;
 		}
 	}
 
-	if (aspect->sysctl) {
-		strcat(sysctl_path, aspect->sysctl);
-		err = read_long(sysctl_path, &sysctl_ctrl, 10);
-		if (err)
-			reason_sysctl = "(failed to read sysctl)";
-		else {
-			switch (sysctl_ctrl) {
-			case 0:
-				reason_sysctl = "cleared by sysctl";
-				reason = reason_sysctl;
-				expected = false;
-				break;
-			case 1:
-				reason_sysctl = "set by sysctl";
-				reason = reason_sysctl;
-				expected = true;
-				break;
-			case 2:
-				reason_sysctl = "not modified by sysctl";
-				break;
-			case 3:
-				reason_sysctl = "cleared by sysctl (permanent)";
-				reason = reason_sysctl;
-				expected = false;
-				break;
-			case 4:
-				reason_sysctl = "set by sysctl (permanent)";
-				reason = reason_sysctl;
-				expected = true;
-				break;
-			default:
-				reason_sysctl = "unknown sysctl";
-				break;
-			}
-		}
-	}
-
-
 	if (hdexcr & DEXCR_PR_BIT(aspect->index)) {
 		reason_hyp = "set by hypervisor";
 		reason = reason_hyp;
 		expected = true;
-	} else
+	} else {
 		reason_hyp = "not modified by hypervisor";
+	}
 
-	printf("%12s (%d): %-28s (%s, %s, %s)\n",
+	printf("%12s (%d): %-28s (%s, %s)\n",
 	       aspect->name,
 	       aspect->index,
 	       reason,
 	       reason_hyp,
-	       reason_sysctl,
 	       reason_prctl);
 
+	/*
+	 * The checks are not atomic, so this can technically trigger if the
+	 * hypervisor makes a change while we are checking each source. It's
+	 * far more likely to be a bug if we see this though.
+	 */
 	if (actual != expected)
 		printf("                : ! actual %s does not match config\n", aspect->name);
 }
-- 
2.44.0

