Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 522F187C7C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 03:58:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GzM/GHbe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwpqB0ntQz3by2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 13:58:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GzM/GHbe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwppN5hWlz30hY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 13:58:04 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42F2GHY7011410;
	Fri, 15 Mar 2024 02:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=EyaGodCE/CcMGmqqhaEJG1uwK0+9tolyNg1IxjMwU4s=;
 b=GzM/GHbeeH2pH76XcTwQkW4+548uQoWr3St1r3VmqxsF3P3PlkSejifBUgjVnP7i6YDU
 LEIq/ZhkddlGfkjD57DO+Q9GAQhFHDf2vj6xiVHBS6AEVGQ+9InRke0LCNUsL+AIO0+S
 A95B1ONDGdHU5u9B2hPVA8nEja8cG1Qjzf79HH7aMm7bnpvVtSP6yINuQhLQu2hTnsc+
 yr9s89vzoo3xSj6OsXb/P8AAB4Zs727C6dvsQg9DWY/DKitt+54wi0aw2+hFfOUNi0DU
 cX/GiPu8d09DELkl/i9mK9XqqwDnTMedR74Sjm0YKYy3cP5WSsCJeU27+fJrZuLLs8xl NQ== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wvcfhrumf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 02:57:58 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42F02bXm018575;
	Fri, 15 Mar 2024 02:57:57 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ws4t2grxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 02:57:57 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42F2vrVh9568686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Mar 2024 02:57:55 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80F4D2004E;
	Fri, 15 Mar 2024 02:57:53 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB3E220043;
	Fri, 15 Mar 2024 02:57:52 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Mar 2024 02:57:52 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.36.9.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8F7C0600F0;
	Fri, 15 Mar 2024 13:57:48 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v1 1/3] powerpc/code-patching: Test patch_instructions() during boot
Date: Fri, 15 Mar 2024 13:57:34 +1100
Message-ID: <20240315025736.404867-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Qq-tOcUcdH5LOmYURt31MKJaTaOjGkP5
X-Proofpoint-GUID: Qq-tOcUcdH5LOmYURt31MKJaTaOjGkP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 mlxlogscore=803 mlxscore=0 spamscore=0 clxscore=1011
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2403150021
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

patch_instructions() introduces new behaviour with a couple of
variations. Test each case of

  * a repeated 32-bit instruction,
  * a repeated 64-bit instruction (ppc64), and
  * a copied sequence of instructions

for both on a single page and when it crosses a page boundary.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/lib/test-code-patching.c | 92 +++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/powerpc/lib/test-code-patching.c b/arch/powerpc/lib/test-code-patching.c
index c44823292f73..35a3756272df 100644
--- a/arch/powerpc/lib/test-code-patching.c
+++ b/arch/powerpc/lib/test-code-patching.c
@@ -347,6 +347,97 @@ static void __init test_prefixed_patching(void)
 	check(!memcmp(iptr, expected, sizeof(expected)));
 }
 
+static void __init test_multi_instruction_patching(void)
+{
+	u32 code[256];
+	void *buf;
+	u32 *addr32;
+	u64 *addr64;
+	ppc_inst_t inst64 = ppc_inst_prefix(OP_PREFIX << 26 | 3UL << 24, PPC_RAW_TRAP());
+	u32 inst32 = PPC_RAW_NOP();
+
+	buf = vzalloc(PAGE_SIZE * 8);
+	check(buf);
+	if (!buf)
+		return;
+
+	/* Test single page 32-bit repeated instruction */
+	addr32 = buf + PAGE_SIZE;
+	check(!patch_instructions(addr32 + 1, &inst32, 12, true));
+
+	check(addr32[0] == 0);
+	check(addr32[1] == inst32);
+	check(addr32[2] == inst32);
+	check(addr32[3] == inst32);
+	check(addr32[4] == 0);
+
+	/* Test single page 64-bit repeated instruction */
+	if (IS_ENABLED(CONFIG_PPC64)) {
+		check(ppc_inst_prefixed(inst64));
+
+		addr64 = buf + PAGE_SIZE * 2;
+		ppc_inst_write(code, inst64);
+		check(!patch_instructions((u32 *)(addr64 + 1), code, 24, true));
+
+		check(addr64[0] == 0);
+		check(ppc_inst_equal(ppc_inst_read((u32 *)&addr64[1]), inst64));
+		check(ppc_inst_equal(ppc_inst_read((u32 *)&addr64[2]), inst64));
+		check(ppc_inst_equal(ppc_inst_read((u32 *)&addr64[3]), inst64));
+		check(addr64[4] == 0);
+	}
+
+	/* Test single page memcpy */
+	addr32 = buf + PAGE_SIZE * 3;
+
+	for (int i = 0; i < ARRAY_SIZE(code); i++)
+		code[i] = i + 1;
+
+	check(!patch_instructions(addr32 + 1, code, sizeof(code), false));
+
+	check(addr32[0] == 0);
+	check(!memcmp(&addr32[1], code, sizeof(code)));
+	check(addr32[ARRAY_SIZE(code) + 1] == 0);
+
+	/* Test multipage 32-bit repeated instruction */
+	addr32 = buf + PAGE_SIZE * 4 - 8;
+	check(!patch_instructions(addr32 + 1, &inst32, 12, true));
+
+	check(addr32[0] == 0);
+	check(addr32[1] == inst32);
+	check(addr32[2] == inst32);
+	check(addr32[3] == inst32);
+	check(addr32[4] == 0);
+
+	/* Test multipage 64-bit repeated instruction */
+	if (IS_ENABLED(CONFIG_PPC64)) {
+		check(ppc_inst_prefixed(inst64));
+
+		addr64 = buf + PAGE_SIZE * 5 - 8;
+		ppc_inst_write(code, inst64);
+		check(!patch_instructions((u32 *)(addr64 + 1), code, 24, true));
+
+		check(addr64[0] == 0);
+		check(ppc_inst_equal(ppc_inst_read((u32 *)&addr64[1]), inst64));
+		check(ppc_inst_equal(ppc_inst_read((u32 *)&addr64[2]), inst64));
+		check(ppc_inst_equal(ppc_inst_read((u32 *)&addr64[3]), inst64));
+		check(addr64[4] == 0);
+	}
+
+	/* Test multipage memcpy */
+	addr32 = buf + PAGE_SIZE * 6 - 12;
+
+	for (int i = 0; i < ARRAY_SIZE(code); i++)
+		code[i] = i + 1;
+
+	check(!patch_instructions(addr32 + 1, code, sizeof(code), false));
+
+	check(addr32[0] == 0);
+	check(!memcmp(&addr32[1], code, sizeof(code)));
+	check(addr32[ARRAY_SIZE(code) + 1] == 0);
+
+	vfree(buf);
+}
+
 static int __init test_code_patching(void)
 {
 	pr_info("Running code patching self-tests ...\n");
@@ -356,6 +447,7 @@ static int __init test_code_patching(void)
 	test_create_function_call();
 	test_translate_branch();
 	test_prefixed_patching();
+	test_multi_instruction_patching();
 
 	return 0;
 }
-- 
2.44.0

