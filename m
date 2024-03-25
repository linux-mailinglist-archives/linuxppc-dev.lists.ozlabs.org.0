Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F333888EE1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 06:30:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cV5ORCEt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V31jG2F9Rz3dVp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:30:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cV5ORCEt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V31gn36mGz2yGk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 16:28:53 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42P4sIoq016779;
	Mon, 25 Mar 2024 05:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=9AQTkPKqKyjlEXBPnlFfZ1Ulgx6EuKKjdzZBxA+dsGQ=;
 b=cV5ORCEtY6DdP11xqFhMnGnjRtVlEVuOnQP5JcIAdaezrTzWgNS0AL2M+cZmM5u4kwad
 Rsg7QVHQtCJqJsI2UGTGmwD5sD8UlGqF13zlRb47Bl/0iB0AL57DXPMO6v32prGI4pYg
 SqIhIenV7KEnluUgbcC0g0/R7Mnof1D6SLiHG+F6DGubLQT7LuZ7cnnv8uN1NN44GI90
 YOfwRDpx5Y8+EWt8lY3AYINR8z63a6E4nYgxTrP78X8ibe9qW4zOEFePBsgcoKrzxTzE
 mGEWiKsMiUwfyczY4Xf+z0AP0cRygr07xnR+bbvo6H+C/JIIjX2O9SenQxb/czhwlHrt Yw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x2g8f1k7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:28:44 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42P43gMu003753;
	Mon, 25 Mar 2024 05:28:43 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x2c42efsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:28:43 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42P5Sepk44040476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Mar 2024 05:28:42 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2608920043;
	Mon, 25 Mar 2024 05:28:40 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4553120040;
	Mon, 25 Mar 2024 05:28:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Mar 2024 05:28:39 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 637C8600B1;
	Mon, 25 Mar 2024 16:28:36 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc/code-patching: Test patch_instructions() during boot
Date: Mon, 25 Mar 2024 16:28:14 +1100
Message-ID: <20240325052815.854044-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sqtcm_96GL7Xk1S6_kLahWwjDaExMV52
X-Proofpoint-ORIG-GUID: sqtcm_96GL7Xk1S6_kLahWwjDaExMV52
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_02,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=930 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403250029
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

v1: https://lore.kernel.org/all/20240315025736.404867-1-bgray@linux.ibm.com/

v2: * Shrink the code array to reduce frame size. It still
      crosses a page, and 32 vs 256 words is unlikely to
      make a difference in test coverage otherwise.
---
 arch/powerpc/lib/test-code-patching.c | 92 +++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/powerpc/lib/test-code-patching.c b/arch/powerpc/lib/test-code-patching.c
index c44823292f73..f76030087f98 100644
--- a/arch/powerpc/lib/test-code-patching.c
+++ b/arch/powerpc/lib/test-code-patching.c
@@ -347,6 +347,97 @@ static void __init test_prefixed_patching(void)
 	check(!memcmp(iptr, expected, sizeof(expected)));
 }
 
+static void __init test_multi_instruction_patching(void)
+{
+	u32 code[32];
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

