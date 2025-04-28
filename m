Return-Path: <linuxppc-dev+bounces-8101-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 865C1A9F20C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 15:20:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmPGB1xZwz304x;
	Mon, 28 Apr 2025 23:20:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745846450;
	cv=none; b=ga3w21zZ8y4neWETuAfYFK2UfDq7hGAiJKSWgKsJ1mVBXnO6qx+M9Q9rsO+VdYC11hemcJRuez62mHlyhL72q+yMauvOMOGenBapgGS7ou6askda/2+U+q6CYz3+j/K0chfbqsWXk2ZomV0h2rvZlilx1Ay7ikdsjQ+btkvXP0jdkltQdYS7gNEtiuRcm1zHwjRKLnFaSAXDJmvYMXsGTmEHw7wMgg1DN+dYnyrWHGK2wjwRBbFWcuWq4S9QJrjrQ2XgBZ6ESEqyeJrmubIvRVnjQpX+hUQ+C7B6Cmi9dVNhHn9D2xUeRzRypApH8fGlLd1C57BvmsTVQ0BLR1I/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745846450; c=relaxed/relaxed;
	bh=seDaDRAvts/ybRbfT6WMEYoOYh8mM6UN+9cj9JMviUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k46Fk5zdeErhZCsf4t29uPTu+zE3iuh24yLE4Wl/2zfTiv+eK4rISANZI3YYxxS9E7jQB7Q155UmGXYv30v0M37RsCoqqse1keEB8rYtEuV3uggwNtIjWAgfHtadXWo+PnGCzkhzG7xozX2i8z9TnPrKzEUemRAjrj4J05LyQLmJDBuWfJJCmLdN5Q12sF7ytl5b6v4K+sQC0trFip3pIsSbbE0ymsibs3eLi622HPUBLUCq5P859w8+ajjWCDSfRe+f89f+gSNKnFShbjKnDQlC5XDu5EdcA7eppOMQ65a8KVtWBfnluQkaI82auX4jyr9Y/woq8Rzb3N7X/I0X0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OPPXYSvF; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OPPXYSvF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmPG93M2kz2yqq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 23:20:49 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SAefKA022824;
	Mon, 28 Apr 2025 13:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=seDaDRAvts/ybRbfT
	6WMEYoOYh8mM6UN+9cj9JMviUI=; b=OPPXYSvFureZeDPfUYkpg2ZphpQJWYHIg
	muUzzRUn+IS8ohSg0tgQKFf/GzwD3mld4INOqAdkmZ+CHj/uKCMLzYBCSl+qfElW
	kuYmE57CemecZRTlBOtdDIB+2K6P1gs8Aci4ly2mJKObteksZYKITT1ySdbnxfhj
	Lz47MnWfyhFcbVX6hM8qgz+hZBMai7j1CeD61AagMaFFEMxBUeplTPRo0nuamwei
	OAA9Plo+hTMzfQTCWKI8E4a2gCZ4IvDaFAl60SFTxlxcxAvyLpzcUp1/8t5KBC6E
	3XAVggsVW5aKSH+g7H9dEcSu5HMQz31p4gxY9f2gRWd/4FFYe9sBQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46a84s0qgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 13:20:24 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53SBZD1F001799;
	Mon, 28 Apr 2025 13:20:23 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469bamegag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 13:20:23 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53SDKJQY50397596
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 13:20:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0E8620040;
	Mon, 28 Apr 2025 13:20:19 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6F7D20043;
	Mon, 28 Apr 2025 13:20:15 +0000 (GMT)
Received: from li-80eaad4c-2afd-11b2-a85c-af8123d033e3.ibm.com (unknown [9.124.219.50])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Apr 2025 13:20:15 +0000 (GMT)
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        linuxppc-dev@lists.ozlabs.org, "Nysal Jan K.A." <nysal@linux.ibm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] selftests/mm: Fix a build failure on powerpc
Date: Mon, 28 Apr 2025 18:49:35 +0530
Message-ID: <20250428131937.641989-2-nysal@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428131937.641989-1-nysal@linux.ibm.com>
References: <20250428131937.641989-1-nysal@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Mchsu4/f c=1 sm=1 tr=0 ts=680f8098 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=eIFaomMv7K_DaQaFpIwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEwOCBTYWx0ZWRfX9cHEmT6RPkmt ULlIMp7J8N67EZZRn6YjvouXN1NecTs93kQx0CYtEpWO1ithBn6qlGoscJj85CSPjnpdjMdQFsX kso9E+w0Jv9BT+HjfjPDd6krV119bAWk8HMwcQQSYORuStzlXdepzd5v69qUr/hthr/9ivRWVit
 4auy2DRbPhfP+876HGUlZxPBWayrwOvwo9bsah3IuW70JON/vy2woJTMEZTqIdUpzBT4O8Px/Z+ frq7QhdXfYGrYBS/KFRK2vJicHGuvgDjPQ/1z65CNanQ47NviMvQqGJvxyGQV7fw1zXXyHb8jU8 C0lImHInMPqt+P6kk1XHqsBoFOEsqq5FqmgrLlvJKb/oSI2f8ZZUMehCNjNwQqp+oaM767xIGF6
 WzLjuoQr4oGmlJQNCpRW0uRGGy5qpEPLbR3pyiJGUvdL/wmn4IhoQjvCChgP/tFXe3BHGorE
X-Proofpoint-ORIG-GUID: NWPF_M0em3vCenetzMbNZhpYx1xdGHLc
X-Proofpoint-GUID: NWPF_M0em3vCenetzMbNZhpYx1xdGHLc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=853 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280108
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The compiler is unaware of the size of code generated by the ".rept"
assembler directive. This results in the compiler emitting branch
instructions where the offset to branch to exceeds the maximum allowed
value, resulting in build failures like the following:

  CC       protection_keys
  /tmp/ccypKWAE.s: Assembler messages:
  /tmp/ccypKWAE.s:2073: Error: operand out of range (0x0000000000020158
  is not between 0xffffffffffff8000 and 0x0000000000007ffc)
  /tmp/ccypKWAE.s:2509: Error: operand out of range (0x0000000000020130
  is not between 0xffffffffffff8000 and 0x0000000000007ffc)

Fix the issue by manually adding nop instructions using the preprocessor.

Fixes: 46036188ea1f5 ("selftests/mm: build with -O2")
Reported-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
---
 tools/testing/selftests/mm/pkey-powerpc.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/pkey-powerpc.h b/tools/testing/selftests/mm/pkey-powerpc.h
index d8ec906b8120..17bf2d1b0192 100644
--- a/tools/testing/selftests/mm/pkey-powerpc.h
+++ b/tools/testing/selftests/mm/pkey-powerpc.h
@@ -104,8 +104,18 @@ static inline void expect_fault_on_read_execonly_key(void *p1, int pkey)
 	return;
 }
 
+#define REPEAT_8(s) s s s s s s s s
+#define REPEAT_64(s) REPEAT_8(s) REPEAT_8(s) REPEAT_8(s) REPEAT_8(s) \
+		     REPEAT_8(s) REPEAT_8(s) REPEAT_8(s) REPEAT_8(s)
+#define REPEAT_512(s) REPEAT_64(s) REPEAT_64(s) REPEAT_64(s) REPEAT_64(s) \
+		      REPEAT_64(s) REPEAT_64(s) REPEAT_64(s) REPEAT_64(s)
+#define REPEAT_4096(s) REPEAT_512(s) REPEAT_512(s) REPEAT_512(s) REPEAT_512(s) \
+		       REPEAT_512(s) REPEAT_512(s) REPEAT_512(s) REPEAT_512(s)
+#define REPEAT_16384(s) REPEAT_4096(s) REPEAT_4096(s) \
+			REPEAT_4096(s) REPEAT_4096(s)
+
 /* 4-byte instructions * 16384 = 64K page */
-#define __page_o_noops() asm(".rept 16384 ; nop; .endr")
+#define __page_o_noops() asm(REPEAT_16384("nop\n"))
 
 static inline void *malloc_pkey_with_mprotect_subpage(long size, int prot, u16 pkey)
 {
-- 
2.47.0


