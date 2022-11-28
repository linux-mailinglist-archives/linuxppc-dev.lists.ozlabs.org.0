Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15422639FCB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 03:53:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL95t6LBkz3fBx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 13:53:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EVbCD4yH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EVbCD4yH;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL8wl08PRz30JR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 13:45:58 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS20MTc025556;
	Mon, 28 Nov 2022 02:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=R7KspJvPE2qhS0exkqAPqrJvHiBFnGiD8cQHFJf1ukQ=;
 b=EVbCD4yHmZmnPcrY83kuDJxiV92OOgVtgDXJ+eP+O7JO6a7s4kAgReHti2D0lFaO/QKt
 JnNOxADirBTxBL7pruew8XIBV7OqQeTpX2pUVS5Z+qCaSqcmsH3kbMOnlBetN2v1wnbT
 h22wavjXLQtsSwEc2pnS2dz4TGClydCWkl0SzVEBbe/hXwKjWHcZwmVw2mpChJrOGmiM
 yBaTzQmSXluNCwacPASW57Jw91uokoa7oR4Qnao8dAd5EJyyqXjSw9/x8KsKausHdz7Z
 xskictifWfM2nhF8tgiZjJB8kvhFUepmLKyi5zcMT9tzJld7t5DEMOEXd4SRpCVQSjUu cQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vnnun0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:49 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS2ZS1S020125;
	Mon, 28 Nov 2022 02:45:47 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 3m3ae99ubx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS2jjnP53019006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 02:45:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5400CA405F;
	Mon, 28 Nov 2022 02:45:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8E43A405C;
	Mon, 28 Nov 2022 02:45:44 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 02:45:44 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7E0A660954;
	Mon, 28 Nov 2022 13:45:39 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 12/13] selftests/powerpc: Add DEXCR status utility lsdexcr
Date: Mon, 28 Nov 2022 13:44:57 +1100
Message-Id: <20221128024458.46121-13-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128024458.46121-1-bgray@linux.ibm.com>
References: <20221128024458.46121-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BR6RyKUYuYMAsyPaNV43wXS6lvMfPgQp
X-Proofpoint-GUID: BR6RyKUYuYMAsyPaNV43wXS6lvMfPgQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_02,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280018
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
Cc: ajd@linux.ibm.com, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, cmr@bluescreens.de, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a utility 'lsdexcr' to print the current DEXCR status. Useful for
quickly checking the status when debugging test failures, using the
sysctl interfaces manually, or just wanting to check it.

Example output:

          Requested: 84000000 (SBHE, NPHIE)
Hypervisor enforced: 00000000
          Effective: 84000000 (SBHE, NPHIE)

        SBHE * (0): set, prctl editable  	(Speculative branch hint enable)
      IBRTPD   (3): clear, prctl editable  	(Indirect branch recurrent target prediction disable)
       SRAPD   (4): clear, prctl editable  	(Subroutine return address prediction disable)
       NPHIE * (5): set  	(Non-privileged hash instruction enable)

Global SBHE override: 1 (set)

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 .../selftests/powerpc/dexcr/.gitignore        |   1 +
 .../testing/selftests/powerpc/dexcr/Makefile  |   2 +
 .../testing/selftests/powerpc/dexcr/lsdexcr.c | 178 ++++++++++++++++++
 3 files changed, 181 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/dexcr/lsdexcr.c

diff --git a/tools/testing/selftests/powerpc/dexcr/.gitignore b/tools/testing/selftests/powerpc/dexcr/.gitignore
index 035a1fcd8fb3..7dd2fad93732 100644
--- a/tools/testing/selftests/powerpc/dexcr/.gitignore
+++ b/tools/testing/selftests/powerpc/dexcr/.gitignore
@@ -1,2 +1,3 @@
 dexcr_test
 hashchk_user
+lsdexcr
diff --git a/tools/testing/selftests/powerpc/dexcr/Makefile b/tools/testing/selftests/powerpc/dexcr/Makefile
index 9814e72a4afa..8cb732cda7e7 100644
--- a/tools/testing/selftests/powerpc/dexcr/Makefile
+++ b/tools/testing/selftests/powerpc/dexcr/Makefile
@@ -1,4 +1,5 @@
 TEST_GEN_PROGS := dexcr_test hashchk_test
+TEST_GEN_FILES := lsdexcr
 
 TEST_FILES := settings
 top_srcdir = ../../../../..
@@ -7,3 +8,4 @@ include ../../lib.mk
 HASHCHK_TEST_CFLAGS = -no-pie $(call cc-option,-mno-rop-protect)
 
 $(TEST_GEN_PROGS): ../harness.c ../utils.c ./dexcr.c ./cap.c
+$(TEST_GEN_FILES): ../utils.c ./dexcr.c
diff --git a/tools/testing/selftests/powerpc/dexcr/lsdexcr.c b/tools/testing/selftests/powerpc/dexcr/lsdexcr.c
new file mode 100644
index 000000000000..c9f0035f8e2e
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/lsdexcr.c
@@ -0,0 +1,178 @@
+#include <errno.h>
+#include <stddef.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/prctl.h>
+
+#include "dexcr.h"
+#include "utils.h"
+
+static unsigned int requested;
+static unsigned int enforced;
+static unsigned int effective;
+
+struct dexcr_aspect {
+	const char *name;
+	const char *desc;
+	unsigned int index;
+	unsigned long pr_val;
+};
+
+static const struct dexcr_aspect aspects[] = {
+	{
+		.name = "SBHE",
+		.desc = "Speculative branch hint enable",
+		.index = 0,
+		.pr_val = PR_PPC_DEXCR_SBHE,
+	},
+	{
+		.name = "IBRTPD",
+		.desc = "Indirect branch recurrent target prediction disable",
+		.index = 3,
+		.pr_val = PR_PPC_DEXCR_IBRTPD,
+	},
+	{
+		.name = "SRAPD",
+		.desc = "Subroutine return address prediction disable",
+		.index = 4,
+		.pr_val = PR_PPC_DEXCR_SRAPD,
+	},
+	{
+		.name = "NPHIE",
+		.desc = "Non-privileged hash instruction enable",
+		.index = 5,
+		.pr_val = PR_PPC_DEXCR_NPHIE,
+	},
+};
+
+#define NUM_ASPECTS (sizeof(aspects) / sizeof(struct dexcr_aspect))
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
+	const char *enabled_aspects[32] = {NULL};
+	size_t j = 0;
+
+	printf("%s: %08x", name, bits);
+
+	if (bits == 0) {
+		printf("\n");
+		return;
+	}
+
+	for (size_t i = 0; i < NUM_ASPECTS; i++) {
+		unsigned int mask = pr_aspect_to_dexcr_mask(aspects[i].pr_val);
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
+	const char *attributes[32] = {NULL};
+	size_t j = 0;
+	unsigned long mask;
+	int pr_status;
+
+	/* Kernel-independent info about aspect */
+	mask = pr_aspect_to_dexcr_mask(aspect->pr_val);
+	if (requested & mask)
+		attributes[j++] = "set";
+	if (enforced & mask)
+		attributes[j++] = "hypervisor enforced";
+	if (!(effective & mask))
+		attributes[j++] = "clear";
+
+	/* Kernel understanding of the aspect */
+	pr_status = prctl(PR_PPC_GET_DEXCR, aspect->pr_val, 0, 0, 0);
+	if (pr_status == -1) {
+		switch (errno) {
+		case ENODEV:
+			attributes[j++] = "aspect not present";
+			break;
+		case EINVAL:
+			attributes[j++] = "unrecognised aspect";
+			break;
+		default:
+			attributes[j++] = "unknown kernel error";
+			break;
+		}
+	} else {
+		if (pr_status & PR_PPC_DEXCR_SET_ASPECT)
+			attributes[j++] = "prctl set";
+		if (pr_status & PR_PPC_DEXCR_FORCE_SET_ASPECT)
+			attributes[j++] = "prctl force set";
+		if (pr_status & PR_PPC_DEXCR_CLEAR_ASPECT)
+			attributes[j++] = "prctl clear";
+		if (pr_status & PR_PPC_DEXCR_PRCTL)
+			attributes[j++] = "prctl editable";
+	}
+
+	printf("%12s %c (%d): ", aspect->name, effective & mask ? '*' : ' ', aspect->index);
+	print_list(attributes, j);
+	printf("  \t(%s)\n", aspect->desc);
+}
+
+static void print_overrides(void) {
+	long sbhe;
+	int err;
+
+	printf("Global SBHE override: ");
+	if ((err = read_long(SYSCTL_DEXCR_SBHE, &sbhe, 10))) {
+		printf("error reading " SYSCTL_DEXCR_SBHE ": %d (%s)\n", err, strerror(err));
+	} else {
+		const char *meaning;
+		switch (sbhe) {
+		case -1:
+			meaning = "default";
+			break;
+		case 0:
+			meaning = "clear";
+			break;
+		case 1:
+			meaning = "set";
+			break;
+		default:
+			meaning = "unknown";
+		}
+
+		printf("%ld (%s)\n", sbhe, meaning);
+	}
+}
+
+int main(int argc, char *argv[])
+{
+	requested = get_dexcr(UDEXCR);
+	enforced = get_dexcr(ENFORCED);
+	effective = requested | enforced;
+
+	print_dexcr("          Requested", requested);
+	print_dexcr("Hypervisor enforced", enforced);
+	print_dexcr("          Effective", effective);
+	printf("\n");
+
+	for (size_t i = 0; i < NUM_ASPECTS; i++)
+		print_aspect(&aspects[i]);
+	printf("\n");
+
+	print_overrides();
+
+	return 0;
+}
-- 
2.38.1

