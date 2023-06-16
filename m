Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE5A732613
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 06:00:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZHDM2b1g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj5620XHWz3brj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 14:00:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZHDM2b1g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj4tG4bGtz3bmp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:49:58 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35G3YWQk006303;
	Fri, 16 Jun 2023 03:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KPkuLQo4KIGWhUS1G9e0KBFCAN5cjPjF3mymAVGO9ac=;
 b=ZHDM2b1g5WjUJX0jwWxgDKVl4amR/aWXQo2vacoms8PJQPYBii9hiiyJfU36cj+IHmKV
 zvWzyGEPfw7+bE/+NJutqE8MxMMs56XdL6kgZw9nuKuHGlSmnHp9i5JYkQOMHA8yibZH
 J68PpsriqlMITSjeEsFjyjpO9XZp8m+xrRl8m5dsL0c9o9DhgC0lc8MBIJGeR3GgkWAh
 GF+Pe3NKs8tYEm7Q4KG6BTwLF7oisPLb07aldDBEzSNnslareKnugIj6/rE6QxCyDwHV
 5QZLTss+dp+75dXEDKw9Tc9hlkCLydsvZfbWhi28jI2L6m472nzt4HvM1DnAyfImf2g3 PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8fxxrbeb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:53 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35G3YVvA006192;
	Fri, 16 Jun 2023 03:49:53 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8fxxrbe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:53 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35G2jBbb012113;
	Fri, 16 Jun 2023 03:49:51 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3r4gt4u17x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:51 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35G3nnr48848036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 03:49:49 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F21C120043;
	Fri, 16 Jun 2023 03:49:48 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12D3420040;
	Fri, 16 Jun 2023 03:49:48 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 03:49:48 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 15789600A8;
	Fri, 16 Jun 2023 13:49:43 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 11/11] selftests/powerpc/dexcr: Add DEXCR status utility lsdexcr
Date: Fri, 16 Jun 2023 13:48:46 +1000
Message-Id: <20230616034846.311705-12-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616034846.311705-1-bgray@linux.ibm.com>
References: <20230616034846.311705-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WFrE4k09UCkavcLL2LpcnnL4cWUm4Xwq
X-Proofpoint-ORIG-GUID: lS5z5duNzfSQCXIFWc7NV1LLsRKZby3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_17,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306160032
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com, npiggin@gmail.com, ruscur@russell.cc
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
2.40.1

