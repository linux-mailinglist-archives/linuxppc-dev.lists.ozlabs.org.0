Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC758A8216
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 13:29:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lMEYOPZN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKJb33CkBz3vrr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 21:29:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lMEYOPZN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKJSy6XDbz3vXC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 21:24:02 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43HBFPtS018518;
	Wed, 17 Apr 2024 11:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JenvjqDYMW0xqK+O684Tron/hc7uLEOsYLWTEY/LPZ0=;
 b=lMEYOPZNNieaBjf1bG/GNSm4R0WuOvnZvqVOJEK3TFrdTGutIshnq4rXl/TlPFW3be3L
 RyuH7EnyrPd5yvBiky4zIAqkHFDIlsnfFHvscb/uvOnl2sescDAATN521RNOfV52kZke
 LxuRX64OPYRBZPH4QQe6iH+ZlzpxWdksDcYT/vjsC6uMGSaj1T6KslWPK5Fwcu8vc5/o
 8AmVlbP/QAA8LkTSbnkrS0z50kkBnLCPSvwBBm8YBzhIFOOAQh3CdxpCIoADb7PpLSFn
 qF2xc9YgP480IqOK/mtQVKkRjlg1VYbY+v7+CMs0gKmGvmMnhKQdtl5gWZd+xq32IwVy xQ== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xjcpr03ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:23:57 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43HAuN8S011137;
	Wed, 17 Apr 2024 11:23:57 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xg732khve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:23:57 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43HBNrI443254124
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Apr 2024 11:23:55 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C70720043;
	Wed, 17 Apr 2024 11:23:53 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AA3520040;
	Wed, 17 Apr 2024 11:23:52 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Apr 2024 11:23:52 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.36.21.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BB00F6083B;
	Wed, 17 Apr 2024 21:23:49 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 7/9] selftests/powerpc/dexcr: Add DEXCR config details to lsdexcr
Date: Wed, 17 Apr 2024 21:23:23 +1000
Message-ID: <20240417112325.728010-8-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417112325.728010-1-bgray@linux.ibm.com>
References: <20240417112325.728010-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HWFYUfx_hHx3iCoP32pZqPyqSfvvu8zH
X-Proofpoint-ORIG-GUID: HWFYUfx_hHx3iCoP32pZqPyqSfvvu8zH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Now that the DEXCR can be configured with prctl, add a section in
lsdexcr that explains why each aspect is set the way it is.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 .../testing/selftests/powerpc/dexcr/lsdexcr.c | 113 +++++++++++++++++-
 1 file changed, 111 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/dexcr/lsdexcr.c b/tools/testing/selftests/powerpc/dexcr/lsdexcr.c
index 94abbfcc389e..a63db47b6610 100644
--- a/tools/testing/selftests/powerpc/dexcr/lsdexcr.c
+++ b/tools/testing/selftests/powerpc/dexcr/lsdexcr.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0+
 
-#include <errno.h>
 #include <stddef.h>
 #include <stdio.h>
 #include <string.h>
+#include <sys/prctl.h>
 
 #include "dexcr.h"
 #include "utils.h"
@@ -16,6 +16,8 @@ struct dexcr_aspect {
 	const char *name;
 	const char *desc;
 	unsigned int index;
+	unsigned long prctl;
+	const char *sysctl;
 };
 
 static const struct dexcr_aspect aspects[] = {
@@ -23,26 +25,36 @@ static const struct dexcr_aspect aspects[] = {
 		.name = "SBHE",
 		.desc = "Speculative branch hint enable",
 		.index = 0,
+		.prctl = PR_PPC_DEXCR_SBHE,
+		.sysctl = "speculative_branch_hint_enable",
 	},
 	{
 		.name = "IBRTPD",
 		.desc = "Indirect branch recurrent target prediction disable",
 		.index = 3,
+		.prctl = PR_PPC_DEXCR_IBRTPD,
+		.sysctl = "indirect_branch_recurrent_target_prediction_disable",
 	},
 	{
 		.name = "SRAPD",
 		.desc = "Subroutine return address prediction disable",
 		.index = 4,
+		.prctl = PR_PPC_DEXCR_SRAPD,
+		.sysctl = "subroutine_return_address_prediction_disable",
 	},
 	{
 		.name = "NPHIE",
 		.desc = "Non-privileged hash instruction enable",
 		.index = 5,
+		.prctl = PR_PPC_DEXCR_NPHIE,
+		.sysctl = "nonprivileged_hash_instruction_enable",
 	},
 	{
 		.name = "PHIE",
 		.desc = "Privileged hash instruction enable",
 		.index = 6,
+		.prctl = -1,
+		.sysctl = NULL,
 	},
 };
 
@@ -60,7 +72,7 @@ static void print_dexcr(char *name, unsigned int bits)
 	const char *enabled_aspects[ARRAY_SIZE(aspects) + 1] = {NULL};
 	size_t j = 0;
 
-	printf("%s: %08x", name, bits);
+	printf("%s: 0x%08x", name, bits);
 
 	if (bits == 0) {
 		printf("\n");
@@ -103,6 +115,95 @@ static void print_aspect(const struct dexcr_aspect *aspect)
 	printf("  \t(%s)\n", aspect->desc);
 }
 
+static void print_aspect_config(const struct dexcr_aspect *aspect)
+{
+	char sysctl_path[128] = "/proc/sys/kernel/dexcr/";
+	const char *reason = "unknown";
+	const char *reason_hyp = NULL;
+	const char *reason_sysctl = "no sysctl";
+	const char *reason_prctl = "no prctl";
+	bool actual = effective & DEXCR_PR_BIT(aspect->index);
+	bool expected = false;
+
+	long sysctl_ctrl = 0;
+	int prctl_ctrl = 0;
+	int err;
+
+	if (aspect->prctl >= 0) {
+		prctl_ctrl = pr_get_dexcr(aspect->prctl);
+		if (prctl_ctrl < 0)
+			reason_prctl = "(failed to read prctl)";
+		else {
+			if (prctl_ctrl & PR_PPC_DEXCR_CTRL_SET) {
+				reason_prctl = "set by prctl";
+				expected = true;
+			} else if (prctl_ctrl & PR_PPC_DEXCR_CTRL_CLEAR) {
+				reason_prctl = "cleared by prctl";
+				expected = false;
+			} else
+				reason_prctl = "unknown prctl";
+
+			reason = reason_prctl;
+		}
+	}
+
+	if (aspect->sysctl) {
+		strcat(sysctl_path, aspect->sysctl);
+		err = read_long(sysctl_path, &sysctl_ctrl, 10);
+		if (err)
+			reason_sysctl = "(failed to read sysctl)";
+		else {
+			switch (sysctl_ctrl) {
+			case 0:
+				reason_sysctl = "cleared by sysctl";
+				reason = reason_sysctl;
+				expected = false;
+				break;
+			case 1:
+				reason_sysctl = "set by sysctl";
+				reason = reason_sysctl;
+				expected = true;
+				break;
+			case 2:
+				reason_sysctl = "not modified by sysctl";
+				break;
+			case 3:
+				reason_sysctl = "cleared by sysctl (permanent)";
+				reason = reason_sysctl;
+				expected = false;
+				break;
+			case 4:
+				reason_sysctl = "set by sysctl (permanent)";
+				reason = reason_sysctl;
+				expected = true;
+				break;
+			default:
+				reason_sysctl = "unknown sysctl";
+				break;
+			}
+		}
+	}
+
+
+	if (hdexcr & DEXCR_PR_BIT(aspect->index)) {
+		reason_hyp = "set by hypervisor";
+		reason = reason_hyp;
+		expected = true;
+	} else
+		reason_hyp = "not modified by hypervisor";
+
+	printf("%12s (%d): %-28s (%s, %s, %s)\n",
+	       aspect->name,
+	       aspect->index,
+	       reason,
+	       reason_hyp,
+	       reason_sysctl,
+	       reason_prctl);
+
+	if (actual != expected)
+		printf("                : ! actual %s does not match config\n", aspect->name);
+}
+
 int main(int argc, char *argv[])
 {
 	if (!dexcr_exists()) {
@@ -114,6 +215,8 @@ int main(int argc, char *argv[])
 	hdexcr = get_dexcr(HDEXCR);
 	effective = dexcr | hdexcr;
 
+	printf("current status:\n");
+
 	print_dexcr("    DEXCR", dexcr);
 	print_dexcr("   HDEXCR", hdexcr);
 	print_dexcr("Effective", effective);
@@ -136,6 +239,12 @@ int main(int argc, char *argv[])
 		else
 			printf("ignored\n");
 	}
+	printf("\n");
+
+	printf("configuration:\n");
+	for (size_t i = 0; i < ARRAY_SIZE(aspects); i++)
+		print_aspect_config(&aspects[i]);
+	printf("\n");
 
 	return 0;
 }
-- 
2.44.0

