Return-Path: <linuxppc-dev+bounces-10352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 145ECB0D510
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 10:57:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmWNz1bVDz3bkT;
	Tue, 22 Jul 2025 18:57:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753174643;
	cv=none; b=n15iEOZsSeYlknV7ONqSjR+F8w03TxeyUOp88d39EuDHrsT+55dSzzjyZpTj1qgOiOWXESvf5fsCCLDaOC3mlor8FyShQ74gQc+03Cndplv0e9lfweboGRBhH/8CZrrYn8ntGwTyYiu3OJQ3e3doo3p0G3hvPSpkDliU0R8PMfqvovO3xdIV7sqDzVIpm+OxTAL2GiTkMqFz+Spdw9tcZI1IiWLqX09GtHjysJdJEc4dNP0MWJs/5r4Wk3M75gDCjUASra24tq4rGFe846ProWmE25VivGLuRhXgq3hp1DWYAPpNdjUchyA9jYmUKhBMzuhYwtNnnt8tATPlFuAfgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753174643; c=relaxed/relaxed;
	bh=vmhU+FR2k26av2hIZiV+NNFmRQFDTiIkuVxAjb0IsSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWnUtRMxtrqRvOKaRjVduRRdwUflDVPEb199J91ni+6IdAVIV7+450IpjPNXihzHQO/75XQi9hEh1Pu4gpIY94q1z8ue5k6RbSrWiV60n00JSkNRnQNNXQUeiz+Vk/lihHcoDOrWhd8PqGFwg699Akc6KcVagOoGCti52BjHxeuL7Cr/7D/sCO1kuDQdciE9awxaZ+Xax46T8xriAtbUlcSOtWI8igIOkxpDXcg5Pq4xwsnCwHZMxTq+X4Xx2Qnpl6yQxmDbQT7VaKpIp76EZLpyqjw3sOQhzI8ofPDg2n0GgmHxjCC+eekgqXmZcigQU9h9TFs0ATweDMAv1ffPRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lsUkL/un; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityab1@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lsUkL/un;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityab1@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmWNy408Bz2yHs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 18:57:22 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7oMTp029365;
	Tue, 22 Jul 2025 08:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vmhU+FR2k26av2hIZ
	iV+NNFmRQFDTiIkuVxAjb0IsSQ=; b=lsUkL/uny4vFkT0POwiMUtBkRrEKiAMlN
	a5Twk1p+hI/kGsSrsmdp4ZL0EOXNEtcBqGZqxFMKldJ3SGnGaixdWzMIYUjFHqrR
	2Ldpl8lJaB7CpD5DheGxadISS5c4cZGFhkPaVPI4EM1qGEWXp6E1Pqri7b6a1gs7
	yW3mVnXimgXf1EOxvlL8f/LdnQ0I8ORxbeSPGyU+8vbdnH0S//b2eLeAIr6GTgZI
	YdaxaVIvKjfOcoIYpvafwojNq5jUJ07ynajNXS/VcuixmxppVzBLWCzZbJ85d1px
	PlQ9Uk3kganrJto3PU27oaULMCsuF9kKc8KkBYhv2JEFwj4CWnMNg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4805ut58aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 08:57:07 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 56M8nhKw006671;
	Tue, 22 Jul 2025 08:57:07 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4805ut58at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 08:57:07 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56M6bOO3014356;
	Tue, 22 Jul 2025 08:57:06 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 480ppp23kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 08:57:06 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56M8v2GM37159328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Jul 2025 08:57:02 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADB8620043;
	Tue, 22 Jul 2025 08:57:02 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55EAE20040;
	Tue, 22 Jul 2025 08:57:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.109.199.41])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Jul 2025 08:57:00 +0000 (GMT)
From: Aditya Bodkhe <adityab1@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, rostedt@goodmis.org, mhiramat@kernel.org,
        mark.rutland@arm.com, venkat88@linux.ibm.com,
        Hari Bathini <hbathini@linux.ibm.com>,
        Aditya Bodkhe <adityab1@linux.ibm.com>
Subject: [PATCH v2 2/2] powerpc/fprobe: fix updated fprobe for function-graph tracer
Date: Tue, 22 Jul 2025 14:26:48 +0530
Message-ID: <20250722085648.1640-2-adityab1@linux.ibm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250722085648.1640-1-adityab1@linux.ibm.com>
References: <20250722085648.1640-1-adityab1@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA3MSBTYWx0ZWRfX+j3SfIQTa1HU
 dyh+hlxgIT1HFy4bkK9Jm6O8wQjES4X2iM6ZRjdVCKsS2CiGO6Yk+FeQ2c0X0X2AsNVSddBj8aq
 rFTDSkHpXcHOYE4nUMFis2viuoCLu2LxDwkDfptGF5y1HSnb4BALLea0shm3xjMVw2BtB3Drqg+
 e8wyftxHKddariMVxfe/xps8fXCn10/W7q+D5QkakJQe14n6c2IbpXJeSEBtd781ipBkwV3eYO3
 1t189Wh3Jew7AyF5WiAbjj4yaXTWk3mFvPkb0Y8WCngr0NnNcgUObyVTq/YYvX/4JEfy4Pkw0ze
 EtgHUL9vmQcvsTJ/6BkP0m4zl7pfrTVl2ZH/8g9PQEp64oRsKoRzyd5lF/DJCUVUy7u/aVTB6P0
 +B/wYqcn1dtrvSIsGG+0sOyXGP+4N8XNejhpEr+dABIaqXmFDAVrngMZREE6CMlstGEqYK3a
X-Proofpoint-ORIG-GUID: k5Pq5Gutfr422_L3YlQ_jpgECrKiYigz
X-Authority-Analysis: v=2.4 cv=cIDgskeN c=1 sm=1 tr=0 ts=687f5263 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=eJdZZeSqwtc_5qrUTOUA:9
X-Proofpoint-GUID: 0h7k1LtYsY36usoiqbCTrOIEOf02aPNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=633 mlxscore=0 spamscore=0 suspectscore=0
 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220071
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Hari Bathini <hbathini@linux.ibm.com>

Since commit 4346ba160409 ("fprobe: Rewrite fprobe on function-graph
tracer"), FPROBE depends on HAVE_FUNCTION_GRAPH_FREGS. With previous
patch adding HAVE_FUNCTION_GRAPH_FREGS for powerpc, FPROBE can be
enabled on powerpc. But with the commit b5fa903b7f7c ("fprobe: Add
fprobe_header encoding feature"), asm/fprobe.h header is needed to
define arch dependent encode/decode macros. The fprobe header MSB
pattern on powerpc is not 0xf. So, define FPROBE_HEADER_MSB_PATTERN
expected on powerpc.

Also, commit 762abbc0d09f ("fprobe: Use ftrace_regs in fprobe exit
handler") introduced HAVE_FTRACE_REGS_HAVING_PT_REGS for archs that
have pt_regs in ftrace_regs. Advertise that on powerpc to reuse
common definitions like ftrace_partial_regs().

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Signed-off-by: Aditya Bodkhe <adityab1@linux.ibm.com>
---
 arch/powerpc/Kconfig              |  1 +
 arch/powerpc/include/asm/fprobe.h | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 arch/powerpc/include/asm/fprobe.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9163521bc4b9..2203e4fb64c1 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -246,6 +246,7 @@ config PPC
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_GUP_FAST
 	select HAVE_FTRACE_GRAPH_FUNC
+	select HAVE_FTRACE_REGS_HAVING_PT_REGS
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_DESCRIPTORS	if PPC64_ELF_ABI_V1
diff --git a/arch/powerpc/include/asm/fprobe.h b/arch/powerpc/include/asm/fprobe.h
new file mode 100644
index 000000000000..d64bc28fb3d3
--- /dev/null
+++ b/arch/powerpc/include/asm/fprobe.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_PPC_FPROBE_H
+#define _ASM_PPC_FPROBE_H
+
+#include <asm-generic/fprobe.h>
+
+#ifdef CONFIG_64BIT
+#undef FPROBE_HEADER_MSB_PATTERN
+#define FPROBE_HEADER_MSB_PATTERN	(PAGE_OFFSET & ~FPROBE_HEADER_MSB_MASK)
+#endif
+
+#endif /* _ASM_PPC_FPROBE_H */
-- 
2.50.0


