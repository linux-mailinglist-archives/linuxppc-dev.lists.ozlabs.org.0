Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9403B876F5C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 06:54:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ijh/6Fv4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TsC1B2kl3z3vZW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 16:54:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ijh/6Fv4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TsByn5yfNz3vXT
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 16:52:49 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4295IFZi026223;
	Sat, 9 Mar 2024 05:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ZAfASJM3DMj0Nw73XRihZAWiZqggzq2/3ytxwz8G5Y0=;
 b=ijh/6Fv4XiAov275EUtua9HIlE+KoLDZvVdZcpI4oCTKqxaHF8GJdHx8ZFAQ9QNXIGFn
 zx4ZrFiKysD/fMbVuXU7HwSnkClLE3eUO6NtUU4s9JXUXX67qHULb4JfxgbTVdlBw9D/
 YLBiZckjGcFAJKZr03Tik4eSyOt7Zw8AkheXinHz9MCWeYZe2/bZZZV2AUdAyzT0ugrr
 9SQw/tKuPkPNuSLBFF0VPucvaPnFxJSBZjjDWm3wtFUJkvvAZcTYlC7m9SQKunG5H68y
 acZuVQAPb1mW3D+Q0z0LnaTHfnfx9YPdkdQeD74F/otJLPwIRPobR7mlgBALh4+Kqsld kg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wrhg907k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Mar 2024 05:52:44 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4295pctS019779;
	Sat, 9 Mar 2024 05:52:43 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wrhg907k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Mar 2024 05:52:43 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4294wg82031549;
	Sat, 9 Mar 2024 05:52:42 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wmgnkrqc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Mar 2024 05:52:42 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4295qb1e30867878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 9 Mar 2024 05:52:39 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7267D20043;
	Sat,  9 Mar 2024 05:52:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 095D620040;
	Sat,  9 Mar 2024 05:52:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.52.192])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  9 Mar 2024 05:52:31 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH 3/3] tools/perf/arch/powerc: Add get_arch_regnum for powerpc
Date: Sat,  9 Mar 2024 11:21:36 +0530
Message-Id: <20240309055136.96556-4-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240309055136.96556-1-atrajeev@linux.vnet.ibm.com>
References: <20240309055136.96556-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EYsWGzpW_J7gdbWkOmQVbR2RVXDzqDNa
X-Proofpoint-GUID: BEzQ4XYIbiTlv39BTXJmtPBrwvgQp2_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The function get_dwarf_regnum() returns a DWARF register number
from a register name string. This calls arch specific function
get_arch_regnum to return register number for corresponding arch.
Add mappings for register name to register number in powerpc code:
arch/powerpc/util/dwarf-regs.c

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/arch/powerpc/util/dwarf-regs.c | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tools/perf/arch/powerpc/util/dwarf-regs.c b/tools/perf/arch/powerpc/util/dwarf-regs.c
index 0c4f4caf53ac..d955e3e577ea 100644
--- a/tools/perf/arch/powerpc/util/dwarf-regs.c
+++ b/tools/perf/arch/powerpc/util/dwarf-regs.c
@@ -98,3 +98,32 @@ int regs_query_register_offset(const char *name)
 			return roff->ptregs_offset;
 	return -EINVAL;
 }
+
+struct dwarf_regs_idx {
+	const char *name;
+	int idx;
+};
+
+static const struct dwarf_regs_idx powerpc_regidx_table[] = {
+	{ "r0", 0 }, { "r1", 1 }, { "r2", 2 }, { "r3", 3 }, { "r4", 4 },
+	{ "r5", 5 }, { "r6", 6 }, { "r7", 7 }, { "r8", 8 }, { "r9", 9 },
+	{ "r10", 10 }, { "r11", 11 }, { "r12", 12 }, { "r13", 13 }, { "r14", 14 },
+	{ "r15", 15 }, { "r16", 16 }, { "r17", 17 }, { "r18", 18 }, { "r19", 19 },
+	{ "r20", 20 }, { "r21", 21 }, { "r22", 22 }, { "r23", 23 }, { "r24", 24 },
+	{ "r25", 25 }, { "r26", 26 }, { "r27", 27 }, { "r27", 27 }, { "r28", 28 },
+	{ "r29", 29 }, { "r30", 30 }, { "r31", 31 },
+};
+
+int get_arch_regnum(const char *name)
+{
+	unsigned int i;
+
+	if (*name != 'r')
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(powerpc_regidx_table); i++)
+		if (!strcmp(powerpc_regidx_table[i].name, name))
+			return powerpc_regidx_table[i].idx;
+
+	return -ENOENT;
+}
-- 
2.43.0

