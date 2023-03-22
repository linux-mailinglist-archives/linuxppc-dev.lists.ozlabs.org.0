Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 307D96C4267
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 06:53:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhHhn0Xhlz3fWZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 16:53:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eVGsuPDc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eVGsuPDc;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhHXj4rjzz3cCD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 16:46:45 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32M4ii5D023875
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kaCvw38dsgsOzi4yBRPMPtO23IrkqVLKsUivcFbF9vQ=;
 b=eVGsuPDcFUegIzQNRiLT5anAugkXCKh9gJlmDWEowf5ywaOUp8bVDi9tnnY0CNZ5EDXA
 Fr+pvQd3nvEZ3zID7KiraORVDv5ETa9pf1LXXJMKgdXLq6IJc7m/En9dhLfxMzPqaLa+
 skButR2r0fRoPOm6+0an51nydDfZ8rmrMkr5LuXrycz/kumWwca/MkFKTg7do9SvN4y2
 A5pNALf3EIZ25JYVzdVdPsRF67c5NuuK/FsZzF3gZg8RERyO0/T/y+JxotxwsmrgbVdJ
 SFoT7Gc3f8b5ZY19lFgLeNJGz+OT+K9yXPEcQGk7fPcukJJJhGC/lH1woBnM4IQSwOUM 3A== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pftwt12b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:43 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32M1tZjE015007
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:41 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pd4jfdfts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32M5kcTE42598778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 952562005A
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94EA22004B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:37 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9A3DA606F0;
	Wed, 22 Mar 2023 16:46:32 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 9/9] selftests/powerpc/dexcr: Add DEXCR status utility lsdexcr
Date: Wed, 22 Mar 2023 16:46:12 +1100
Message-Id: <20230322054612.1340573-10-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322054612.1340573-1-bgray@linux.ibm.com>
References: <20230322054612.1340573-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 01y4dPNttQM3QnLIsZ8SyCgKwZYrAVO_
X-Proofpoint-GUID: 01y4dPNttQM3QnLIsZ8SyCgKwZYrAVO_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303220039
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

Add a utility 'lsdexcr' to print the current DEXCR status. Useful for
quickly checking the status such as when debugging test failures or
verifying the new default DEXCR does what you want (for userspace at
least). Example output:

    # ./lsdexcr
       uDEXCR: 04000000 (NPHIE)
       HDEXCR: 00000000
    Effective: 04000000 (NPHIE)

            SBHE   (0): clear  	(Speculative branch hint enable)
          IBRTPD   (3): clear  	(Indirect branch recurrent target ...)
           SRAPD   (4): clear  	(Subroutine return address ...)
           NPHIE * (5): set  	(Non-privileged hash instruction enable)
            PHIE   (6): clear  	(Privileged hash instruction enable)

    DEXCR[NPHIE] enabled: hashst/hashchk working

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v1:	* Report if hashst/hashchk actually does something
---
 .../selftests/powerpc/dexcr/.gitignore        |   1 +
 .../testing/selftests/powerpc/dexcr/Makefile  |   2 +
 .../testing/selftests/powerpc/dexcr/lsdexcr.c | 141 ++++++++++++++++++
 3 files changed, 144 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/dexcr/lsdexcr.c

diff --git a/tools/testing/selftests/powerpc/dexcr/.gitignore b/tools/testing/selftests/powerpc/dexcr/.gitignore
index d12e4560aca9..b82f45dd46b9 100644
--- a/tools/testing/selftests/powerpc/dexcr/.gitignore
+++ b/tools/testing/selftests/powerpc/dexcr/.gitignore
@@ -1 +1,2 @@
 hashchk_test
+lsdexcr
diff --git a/tools/testing/selftests/powerpc/dexcr/Makefile b/tools/testing/selftests/powerpc/dexcr/Makefile
index 16c8b489948a..76210f2bcec3 100644
--- a/tools/testing/selftests/powerpc/dexcr/Makefile
+++ b/tools/testing/selftests/powerpc/dexcr/Makefile
@@ -1,7 +1,9 @@
 TEST_GEN_PROGS := hashchk_test
+TEST_GEN_FILES := lsdexcr
 
 include ../../lib.mk
 
 $(OUTPUT)/hashchk_test: CFLAGS += -fno-pie $(call cc-option,-mno-rop-protect)
 
 $(TEST_GEN_PROGS): ../harness.c ../utils.c ./dexcr.c
+$(TEST_GEN_FILES): ../utils.c ./dexcr.c
diff --git a/tools/testing/selftests/powerpc/dexcr/lsdexcr.c b/tools/testing/selftests/powerpc/dexcr/lsdexcr.c
new file mode 100644
index 000000000000..94abbfcc389e
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/lsdexcr.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <errno.h>
+#include <stddef.h>
+#include <stdio.h>
+#include <string.h>
+
+#include "dexcr.h"
+#include "utils.h"
+
+static unsigned int dexcr;
+static unsigned int hdexcr;
+static unsigned int effective;
+
+struct dexcr_aspect {
+	const char *name;
+	const char *desc;
+	unsigned int index;
+};
+
+static const struct dexcr_aspect aspects[] = {
+	{
+		.name = "SBHE",
+		.desc = "Speculative branch hint enable",
+		.index = 0,
+	},
+	{
+		.name = "IBRTPD",
+		.desc = "Indirect branch recurrent target prediction disable",
+		.index = 3,
+	},
+	{
+		.name = "SRAPD",
+		.desc = "Subroutine return address prediction disable",
+		.index = 4,
+	},
+	{
+		.name = "NPHIE",
+		.desc = "Non-privileged hash instruction enable",
+		.index = 5,
+	},
+	{
+		.name = "PHIE",
+		.desc = "Privileged hash instruction enable",
+		.index = 6,
+	},
+};
+
+static void print_list(const char *list[], size_t len)
+{
+	for (size_t i = 0; i < len; i++) {
+		printf("%s", list[i]);
+		if (i + 1 < len)
+			printf(", ");
+	}
+}
+
+static void print_dexcr(char *name, unsigned int bits)
+{
+	const char *enabled_aspects[ARRAY_SIZE(aspects) + 1] = {NULL};
+	size_t j = 0;
+
+	printf("%s: %08x", name, bits);
+
+	if (bits == 0) {
+		printf("\n");
+		return;
+	}
+
+	for (size_t i = 0; i < ARRAY_SIZE(aspects); i++) {
+		unsigned int mask = DEXCR_PR_BIT(aspects[i].index);
+
+		if (bits & mask) {
+			enabled_aspects[j++] = aspects[i].name;
+			bits &= ~mask;
+		}
+	}
+
+	if (bits)
+		enabled_aspects[j++] = "unknown";
+
+	printf(" (");
+	print_list(enabled_aspects, j);
+	printf(")\n");
+}
+
+static void print_aspect(const struct dexcr_aspect *aspect)
+{
+	const char *attributes[8] = {NULL};
+	size_t j = 0;
+	unsigned long mask;
+
+	mask = DEXCR_PR_BIT(aspect->index);
+	if (dexcr & mask)
+		attributes[j++] = "set";
+	if (hdexcr & mask)
+		attributes[j++] = "set (hypervisor)";
+	if (!(effective & mask))
+		attributes[j++] = "clear";
+
+	printf("%12s %c (%d): ", aspect->name, effective & mask ? '*' : ' ', aspect->index);
+	print_list(attributes, j);
+	printf("  \t(%s)\n", aspect->desc);
+}
+
+int main(int argc, char *argv[])
+{
+	if (!dexcr_exists()) {
+		printf("DEXCR not detected on this hardware\n");
+		return 1;
+	}
+
+	dexcr = get_dexcr(DEXCR);
+	hdexcr = get_dexcr(HDEXCR);
+	effective = dexcr | hdexcr;
+
+	print_dexcr("    DEXCR", dexcr);
+	print_dexcr("   HDEXCR", hdexcr);
+	print_dexcr("Effective", effective);
+	printf("\n");
+
+	for (size_t i = 0; i < ARRAY_SIZE(aspects); i++)
+		print_aspect(&aspects[i]);
+	printf("\n");
+
+	if (effective & DEXCR_PR_NPHIE) {
+		printf("DEXCR[NPHIE] enabled: hashst/hashchk ");
+		if (hashchk_triggers())
+			printf("working\n");
+		else
+			printf("failed to trigger\n");
+	} else {
+		printf("DEXCR[NPHIE] disabled: hashst/hashchk ");
+		if (hashchk_triggers())
+			printf("unexpectedly triggered\n");
+		else
+			printf("ignored\n");
+	}
+
+	return 0;
+}
-- 
2.39.2

