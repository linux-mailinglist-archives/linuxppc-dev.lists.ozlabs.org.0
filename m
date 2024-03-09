Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83762876F5A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 06:53:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LT83utfR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TsBzc2HDCz3vfG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 16:53:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LT83utfR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TsByK4m2nz3vYZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 16:52:25 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42957T1I008548;
	Sat, 9 Mar 2024 05:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aCTDQxs20/top2PK9D2jW/zsY8W34gmrBdKbkadRHx8=;
 b=LT83utfRKkP1WP5BnDvOgRJCtSlvU/m37MWozmdllriD6TQXA5bHvro6LD4skwsBazyd
 el9laddqPH7SgKXQwnhb+pMHimuHcoUeTdOBNOhI4yx0MYTn+xktJk74Z3dFamGcArdP
 qiWFuLSqwbbNKGVIZ9wcI+rhVG4YIlEoarzXOcRmPyCeM6QQxB4/j02Vpm3DGp52Pxtt
 5o5algcyIeHd5qVC9P9nXF8D8RgoulyG4190C35BPkyYEIsfy65TOKiAMJHgxG4FKzCz
 op18R5NdIOW431m7CVOx0C3CMkdtP1rsmax5Vxx5+T1keNI2/br+cKVwi8AXHicllOMs fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wrhbbravk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Mar 2024 05:52:19 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4295qJOj031611;
	Sat, 9 Mar 2024 05:52:19 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wrhbbravg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Mar 2024 05:52:19 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4292rZHf025387;
	Sat, 9 Mar 2024 05:52:18 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wmeu097g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Mar 2024 05:52:17 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4295qChi31785410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 9 Mar 2024 05:52:14 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CD8920043;
	Sat,  9 Mar 2024 05:52:12 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9C8720040;
	Sat,  9 Mar 2024 05:52:06 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.52.192])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  9 Mar 2024 05:52:06 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH 1/3] tools/perf/arch/powerpc: Add load/store in powerpc annotate instructions for data type profling
Date: Sat,  9 Mar 2024 11:21:34 +0530
Message-Id: <20240309055136.96556-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240309055136.96556-1-atrajeev@linux.vnet.ibm.com>
References: <20240309055136.96556-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qIiRnvfJph4lc3jbhp61MtF0i-Rh-4if
X-Proofpoint-GUID: _dl91ioDeLrSUDaur4L7b3QlH-Z3C29I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403090045
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add powerpc instruction nmemonic table to associate load/store
instructions with move_ops. mov_ops is used to identify mem_type
to associate instruction with data type and offset. Also initialize
and allocate arch specific fields for nr_instructions, instructions and
nr_instructions_allocate.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../perf/arch/powerpc/annotate/instructions.c | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/perf/arch/powerpc/annotate/instructions.c b/tools/perf/arch/powerpc/annotate/instructions.c
index a3f423c27cae..07af4442be38 100644
--- a/tools/perf/arch/powerpc/annotate/instructions.c
+++ b/tools/perf/arch/powerpc/annotate/instructions.c
@@ -1,6 +1,65 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/compiler.h>
 
+/*
+ * powerpc instruction nmemonic table to associate load/store instructions with
+ * move_ops. mov_ops is used to identify mem_type to associate instruction with
+ * data type and offset.
+ */
+static struct ins powerpc__instructions[] = {
+	{ .name = "lbz",	.ops = &mov_ops,  },
+	{ .name = "lbzx",	.ops = &mov_ops,  },
+	{ .name = "lbzu",	.ops = &mov_ops,  },
+	{ .name = "lbzux",	.ops = &mov_ops,  },
+	{ .name = "lhz",	.ops = &mov_ops,  },
+	{ .name = "lhzx",	.ops = &mov_ops,  },
+	{ .name = "lhzu",	.ops = &mov_ops,  },
+	{ .name = "lhzux",	.ops = &mov_ops,  },
+	{ .name = "lha",	.ops = &mov_ops,  },
+	{ .name = "lhax",	.ops = &mov_ops,  },
+	{ .name = "lhau",	.ops = &mov_ops,  },
+	{ .name = "lhaux",	.ops = &mov_ops,  },
+	{ .name = "lwz",	.ops = &mov_ops,  },
+	{ .name = "lwzx",	.ops = &mov_ops,  },
+	{ .name = "lwzu",	.ops = &mov_ops,  },
+	{ .name = "lwzux",	.ops = &mov_ops,  },
+	{ .name = "lwa",	.ops = &mov_ops,  },
+	{ .name = "lwax",	.ops = &mov_ops,  },
+	{ .name = "lwaux",	.ops = &mov_ops,  },
+	{ .name = "ld",		.ops = &mov_ops,  },
+	{ .name = "ldx",	.ops = &mov_ops,  },
+	{ .name = "ldu",	.ops = &mov_ops,  },
+	{ .name = "ldux",	.ops = &mov_ops,  },
+	{ .name = "stb",	.ops = &mov_ops,  },
+	{ .name = "stbx",	.ops = &mov_ops,  },
+	{ .name = "stbu",	.ops = &mov_ops,  },
+	{ .name = "stbux",	.ops = &mov_ops,  },
+	{ .name = "sth",	.ops = &mov_ops,  },
+	{ .name = "sthx",	.ops = &mov_ops,  },
+	{ .name = "sthu",	.ops = &mov_ops,  },
+	{ .name = "sthux",	.ops = &mov_ops,  },
+	{ .name = "stw",	.ops = &mov_ops,  },
+	{ .name = "stwx",	.ops = &mov_ops,  },
+	{ .name = "stwu",	.ops = &mov_ops,  },
+	{ .name = "stwux",	.ops = &mov_ops,  },
+	{ .name = "std",	.ops = &mov_ops,  },
+	{ .name = "stdx",	.ops = &mov_ops,  },
+	{ .name = "stdu",	.ops = &mov_ops,  },
+	{ .name = "stdux",	.ops = &mov_ops,  },
+	{ .name = "lhbrx",	.ops = &mov_ops,  },
+	{ .name = "sthbrx",	.ops = &mov_ops,  },
+	{ .name = "lwbrx",	.ops = &mov_ops,  },
+	{ .name = "stwbrx",	.ops = &mov_ops,  },
+	{ .name = "ldbrx",	.ops = &mov_ops,  },
+	{ .name = "stdbrx",	.ops = &mov_ops,  },
+	{ .name = "lmw",	.ops = &mov_ops,  },
+	{ .name = "stmw",	.ops = &mov_ops,  },
+	{ .name = "lswi",	.ops = &mov_ops,  },
+	{ .name = "lswx",	.ops = &mov_ops,  },
+	{ .name = "stswi",	.ops = &mov_ops,  },
+	{ .name = "stswx",	.ops = &mov_ops,  },
+};
+
 static struct ins_ops *powerpc__associate_instruction_ops(struct arch *arch, const char *name)
 {
 	int i;
@@ -52,6 +111,13 @@ static struct ins_ops *powerpc__associate_instruction_ops(struct arch *arch, con
 static int powerpc__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 {
 	if (!arch->initialized) {
+		arch->nr_instructions = ARRAY_SIZE(powerpc__instructions);
+		arch->instructions = calloc(arch->nr_instructions, sizeof(struct ins));
+		if (arch->instructions == NULL)
+			return -ENOMEM;
+
+		memcpy(arch->instructions, (struct ins *)powerpc__instructions, sizeof(struct ins) * arch->nr_instructions);
+		arch->nr_instructions_allocated = arch->nr_instructions;
 		arch->initialized = true;
 		arch->associate_instruction_ops = powerpc__associate_instruction_ops;
 		arch->objdump.comment_char      = '#';
-- 
2.43.0

