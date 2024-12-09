Return-Path: <linuxppc-dev+bounces-3873-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2579E9A25
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 16:15:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6QQK1LG3z2ydG;
	Tue, 10 Dec 2024 02:14:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733757289;
	cv=none; b=bB0Twl0D/B4iS2ctpm7vxeZ8bONGlMSED4sw+SYpvV8TgbRCAsf9X1RPZYhBhcMmXVN8DQFx87NF4TKDOVUi1gPG4zqFEQ+xDZoG+vzsSs0RN+DigzeCovlEoFFiYPgE228NPtOWZanBwa+rAc09Kup9P+loG/ZAuS8Oyd9EMHRCobGcadgznswKG1VFjVyEuzMkL1ECLMQd2b3e/KX4OsTMM7FkB1AeA7KQS5ov6w0sZyLzlJeC7S1s9fskS40x9noNE76gqwTwZ5VcakqE2t3xDgdpd1PNNvODoaPfGQGf8+oxQwKoGoPOUObUyAEaC1Ib01O5CyEoRHJ/l5nLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733757289; c=relaxed/relaxed;
	bh=BH5TwweUkqOnsc172vXfteFPatvOsrj0SVX8Z9/kJAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8DlAptjx+0Hl5EH+9I2i1cF3zOGqC3XjhJN/z+q0yRZwRZyo7d2sp7+Km8/4zDQ/JcuMRrMaQJljTkxh1XlxIOMA/6Kb2Z1aZZbRRdzqftaGVKvzr1yteeWJLYlMSDaxDGyVEe4QwNYvReuWnx+avO6emRViONiJmAPX4gec8Y3VYsttJsr4fToCl+E+IMwH7j3weKTdTbTEhoItiJ1LuwCSaSVUFyT/zM1XeqW4WY6ek2NtyAiRJw35KnctAK2C3NmGT+wmcmTHbe2xpJOQFpVvgbrdsUxsc6spKCJbdoFVVtDU3SeQU10IR8QF+cul3AcDA2LpbaHnkD9Vp3xyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TtMmdhRc; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TtMmdhRc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6QQJ1bGDz2yZ1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 02:14:48 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B99fpie030610;
	Mon, 9 Dec 2024 15:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=BH5TwweUkqOnsc172
	vXfteFPatvOsrj0SVX8Z9/kJAI=; b=TtMmdhRcp4DpKeloEAPAS9XbIwC5NpxNj
	Q33Bh9Ck5fchUFp989l/15e8sfNID5VDfWthdO09EPzlltvquVMtFdgkCrCxBjmr
	dUebWdLcowruaB6Y3/rA8SZ/mUBu+j/FpaRgk2K6lyeFqYqC5csurmFHJvt+5rPV
	3ZzME0psc+AwCidq9tLXWsjBO97af1t+TLDrWXAHiclH5V+sJTzx4r4QntGfHAI1
	FsqWY0svkmmhjkjezKwl06ird25O+w4+wx0v0GWjOlC9lgV+yoAiMpHJZpnvn4cv
	QZCzaNH86BuAlTCR2BHoAaIaX8MyNpQCab8rl+YmcsBixe0wKmsEw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43cdv8j2cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 15:14:37 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B9FEbCJ025338;
	Mon, 9 Dec 2024 15:14:37 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43cdv8j2cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 15:14:37 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9EAMQT000572;
	Mon, 9 Dec 2024 15:14:35 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43d1pmy66k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 15:14:35 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B9FEXbq59179342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Dec 2024 15:14:33 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A11BD20043;
	Mon,  9 Dec 2024 15:14:33 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9928B2004B;
	Mon,  9 Dec 2024 15:14:31 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.38.185])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Dec 2024 15:14:31 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, shuah@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH 3/3] selftest/powerpc/ptrace: Cleanup duplicate macro definitions
Date: Mon,  9 Dec 2024 20:44:18 +0530
Message-ID: <20241209151418.348085-3-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209151418.348085-1-maddy@linux.ibm.com>
References: <20241209151418.348085-1-maddy@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7bscHaX4F1XZSuaSPKyuX4qUhvgbviZm
X-Proofpoint-ORIG-GUID: sj-gzOJt_bnju5K1pGraPhwvZ-PPWFnP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=904
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090117
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Both core-pkey.c and ptrace-pkey.c tests have similar macro
definitions, move them to "pkeys.h" and remove the macro
definitions from the C file.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 tools/testing/selftests/powerpc/include/pkeys.h      | 8 ++++++++
 tools/testing/selftests/powerpc/ptrace/core-pkey.c   | 8 --------
 tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c | 8 --------
 3 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
index 51729d9a7111..3a0129467de6 100644
--- a/tools/testing/selftests/powerpc/include/pkeys.h
+++ b/tools/testing/selftests/powerpc/include/pkeys.h
@@ -35,10 +35,18 @@
 #define __NR_pkey_alloc		384
 #define __NR_pkey_free		385
 
+#ifndef NT_PPC_PKEY
+#define NT_PPC_PKEY		0x110
+#endif
+
 #define PKEY_BITS_PER_PKEY	2
 #define NR_PKEYS		32
 #define PKEY_BITS_MASK		((1UL << PKEY_BITS_PER_PKEY) - 1)
 
+#define AMR_BITS_PER_PKEY 2
+#define PKEY_REG_BITS (sizeof(u64) * 8)
+#define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey + 1) * AMR_BITS_PER_PKEY))
+
 inline unsigned long pkeyreg_get(void)
 {
 	return mfspr(SPRN_AMR);
diff --git a/tools/testing/selftests/powerpc/ptrace/core-pkey.c b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
index 31c9bf6d95db..f8ff05e5bf6e 100644
--- a/tools/testing/selftests/powerpc/ptrace/core-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
@@ -18,18 +18,10 @@
 #include "child.h"
 #include "pkeys.h"
 
-#ifndef NT_PPC_PKEY
-#define NT_PPC_PKEY		0x110
-#endif
-
 #ifndef PKEY_DISABLE_EXECUTE
 #define PKEY_DISABLE_EXECUTE	0x4
 #endif
 
-#define AMR_BITS_PER_PKEY 2
-#define PKEY_REG_BITS (sizeof(u64) * 8)
-#define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey + 1) * AMR_BITS_PER_PKEY))
-
 #define CORE_FILE_LIMIT	(5 * 1024 * 1024)	/* 5 MB should be enough */
 
 static const char core_pattern_file[] = "/proc/sys/kernel/core_pattern";
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
index 6893ed096457..5d528d0ea9d1 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
@@ -9,18 +9,10 @@
 #include "child.h"
 #include "pkeys.h"
 
-#ifndef NT_PPC_PKEY
-#define NT_PPC_PKEY		0x110
-#endif
-
 #ifndef PKEY_DISABLE_EXECUTE
 #define PKEY_DISABLE_EXECUTE	0x4
 #endif
 
-#define AMR_BITS_PER_PKEY 2
-#define PKEY_REG_BITS (sizeof(u64) * 8)
-#define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey + 1) * AMR_BITS_PER_PKEY))
-
 static const char user_read[] = "[User Read (Running)]";
 static const char user_write[] = "[User Write (Running)]";
 static const char ptrace_read_running[] = "[Ptrace Read (Running)]";
-- 
2.47.0


