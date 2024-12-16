Return-Path: <linuxppc-dev+bounces-4199-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C35229F3538
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 17:03:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBl9d51Myz304l;
	Tue, 17 Dec 2024 03:03:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734365029;
	cv=none; b=AgL8+JpJdRpmqYojPqPVhEYszNqZEdhGKzVMQGZu2SaxAySFuStg5LX5TaSgSoOwch+4g9o0lm3Lk5CXl6wVZ9KTxUW8aislh/vxkA2R4cGJSRtM1/EDfDhW06iFbfVTpAFnuW2NuWynHvlugijau7y+14paCSn1GKciZQjZLsW3sufFgtQnP1a5yBeIjdTZJjmov2i+T8nRNCWxzD8HG8tv8M4zmituztjYz5/NKtPTTtHsl0vfm1V3t/NTFVVTo2Lbt4t2XZFUdbzjwkwvBByUoJEtbqxO2/z9drLmFAEMTIuhytsMB/a2KF5byzNPnyt9uoZbAIq2570l7TlVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734365029; c=relaxed/relaxed;
	bh=qWrWP29wqKFHLLKF2sOgSyYt3Ljp5XDmh5aF1EScO3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQaES1PX/TY7USGXcyLMIrUPN8R8MI5/MuIvck106bxZq7No6tR+VM4nCkOkr6+pwBWU1PsnXjGfpOS35ABgzHa7J+7oAQx43zsyrPqt6JmpipFYBPK/VZvKvBpQFKfWYY7tkeybzXw/kCIr2uWHRAeapSuQ3Nr0boHcsY2v09supHVwItLXIYuwDfw/qg7sMChuI+2UbQvzzRtVTkkcZ3gULOEfZQIBL8UBqJtpkJY3rNwL+VXfKrPaFSYpgkS7u01E2YWAHkG2gcbxbegrVDH2mCMblYWDhmqdJlWClhsICi90TzehcpiEgVZSSZwGLad0VCNfbWOcPXkHYVmlWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T968UMGg; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T968UMGg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBl9c5NTJz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 03:03:48 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGCtF4v009108;
	Mon, 16 Dec 2024 16:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=qWrWP29wqKFHLLKF2
	sOgSyYt3Ljp5XDmh5aF1EScO3I=; b=T968UMGghSJXj6k4Zm9si5HiRKryS6Mc0
	dc7mYxrfFi5MLzHj6vxnjnmFf1bFs83udI/npItHgcoLkk9RIV5EqbqPKPCeCPzr
	cZ+GQ3R2XfscE/MYmrbI2sMwArIxkojKm3XN8JGRNQ5715TmS8b21HB5MTxwCrM8
	B2cfhvjtdLMpZK7AN1Ig6nmp8RyoWwPnjT4MrLld9OorK2EDlqaX8Krgwcpd6Pd1
	qxDrIfaw9PYb3oayG0dZWQJ7k1AUAgcfyGfN/7wICAn5UObvWWy2guEjSTASBGFR
	hPcwDBmqsg90A/qajQJ9JAGGtrV2ZaR1LlpJ3CDTlKaiMxY1XYg4g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43j98h3yrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 16:03:35 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BGFdmue025077;
	Mon, 16 Dec 2024 16:03:35 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43j98h3yrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 16:03:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGDGd2R014335;
	Mon, 16 Dec 2024 16:03:34 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hmqxxqxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 16:03:33 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BGG3WYH21037362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 16:03:32 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F134D2004D;
	Mon, 16 Dec 2024 16:03:31 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C06DA20043;
	Mon, 16 Dec 2024 16:03:27 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.70.111])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Dec 2024 16:03:27 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, shuah@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v2 3/3] selftest/powerpc/ptrace: Cleanup duplicate macro definitions
Date: Mon, 16 Dec 2024 21:32:57 +0530
Message-ID: <20241216160257.87252-3-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241216160257.87252-1-maddy@linux.ibm.com>
References: <20241216160257.87252-1-maddy@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: CaL2mTjAe4Q65c47NgpxxXJJrO92w-lC
X-Proofpoint-GUID: WWlbwlNSNedLMkS3byKv0IW08V-OvhDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=848 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160133
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Both core-pkey.c and ptrace-pkey.c tests have
similar macro definitions, move them to "pkeys.h"
and remove the macro definitions from the C file.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
 - Removed additional macros pointed out by Ritesh
   which are duplicates and are avilable in "pkeys.h"

 tools/testing/selftests/powerpc/include/pkeys.h      |  8 ++++++++
 tools/testing/selftests/powerpc/ptrace/core-pkey.c   | 12 ------------
 tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c | 12 ------------
 3 files changed, 8 insertions(+), 24 deletions(-)

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
index 31c9bf6d95db..f061434af452 100644
--- a/tools/testing/selftests/powerpc/ptrace/core-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
@@ -18,18 +18,6 @@
 #include "child.h"
 #include "pkeys.h"
 
-#ifndef NT_PPC_PKEY
-#define NT_PPC_PKEY		0x110
-#endif
-
-#ifndef PKEY_DISABLE_EXECUTE
-#define PKEY_DISABLE_EXECUTE	0x4
-#endif
-
-#define AMR_BITS_PER_PKEY 2
-#define PKEY_REG_BITS (sizeof(u64) * 8)
-#define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey + 1) * AMR_BITS_PER_PKEY))
-
 #define CORE_FILE_LIMIT	(5 * 1024 * 1024)	/* 5 MB should be enough */
 
 static const char core_pattern_file[] = "/proc/sys/kernel/core_pattern";
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
index 6893ed096457..fc633014424f 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
@@ -9,18 +9,6 @@
 #include "child.h"
 #include "pkeys.h"
 
-#ifndef NT_PPC_PKEY
-#define NT_PPC_PKEY		0x110
-#endif
-
-#ifndef PKEY_DISABLE_EXECUTE
-#define PKEY_DISABLE_EXECUTE	0x4
-#endif
-
-#define AMR_BITS_PER_PKEY 2
-#define PKEY_REG_BITS (sizeof(u64) * 8)
-#define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey + 1) * AMR_BITS_PER_PKEY))
-
 static const char user_read[] = "[User Read (Running)]";
 static const char user_write[] = "[User Write (Running)]";
 static const char ptrace_read_running[] = "[Ptrace Read (Running)]";
-- 
2.47.0


