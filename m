Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E67716ED4C1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 20:49:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4vLX5JXkz3f4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 04:49:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=So6MeUEo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=So6MeUEo;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4vJg519Jz3bg3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 04:47:47 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33OIcQMt027133;
	Mon, 24 Apr 2023 18:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fENkWrcrvNmfprVJ26dBpSSoDPW77dID+uxB51LKQ/M=;
 b=So6MeUEoi7vQMbMxwm41zUd23dec47tAJuHw9LJoQ7QhB5gA6TJN+Gx4bZT3NK5iSTx6
 +g0X4+wbwwTTuzEtToR6aKWKvj8VbQfRVQ6+5yhmE0APRvTJRdwPW7VU8qOaqdCTup9+
 gDPRXuy6oiNm54lgU3NRTFRxWEetvnXQ8wDPTgy7fb/NLdOwB6mm86MbaoLRCrFTtBcD
 /iD7SEbaKXsmRfAE4DQHhCqYxYC6yZBoev9NApkuGjjO6a2Z2OiS4SdsI1cXEe/35t/v
 FPTMr3mQDJDZ+jBobb0uhu3ZKuwU6hS/d+TPbm++lVcesF7FSnE4NEVxf6Yb0vHOzta0 aA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q5wn8bkaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 18:47:33 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33OHj5eD013888;
	Mon, 24 Apr 2023 18:47:33 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3q4777mge9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 18:47:32 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33OIlVM130671382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Apr 2023 18:47:31 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF4ED5805A;
	Mon, 24 Apr 2023 18:47:30 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD4F658051;
	Mon, 24 Apr 2023 18:47:30 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Apr 2023 18:47:30 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 1/5] An optimized Chacha20 implementation with 8-way unrolling for ppc64le.
Date: Mon, 24 Apr 2023 14:47:22 -0400
Message-Id: <20230424184726.2091-2-dtsen@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230424184726.2091-1-dtsen@linux.ibm.com>
References: <20230424184726.2091-1-dtsen@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: V-gA5PdG71_LIwrBgAKkAM9kX9gu6efS
X-Proofpoint-GUID: V-gA5PdG71_LIwrBgAKkAM9kX9gu6efS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_11,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxlogscore=925 lowpriorityscore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 mlxscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304240167
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, Danny Tsen <dtsen@linux.ibm.com>, appro@cryptogams.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Improve overall performance of chacha20 encrypt and decrypt operations
for Power10 or later CPU.

Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
---
 arch/powerpc/crypto/chacha-p10le-8x.S | 842 ++++++++++++++++++++++++++
 1 file changed, 842 insertions(+)
 create mode 100644 arch/powerpc/crypto/chacha-p10le-8x.S

diff --git a/arch/powerpc/crypto/chacha-p10le-8x.S b/arch/powerpc/crypto/chacha-p10le-8x.S
new file mode 100644
index 000000000000..7c15d17101d7
--- /dev/null
+++ b/arch/powerpc/crypto/chacha-p10le-8x.S
@@ -0,0 +1,842 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#
+# Accelerated chacha20 implementation for ppc64le.
+#
+# Copyright 2023- IBM Inc. All rights reserved
+#
+#===================================================================================
+# Written by Danny Tsen <dtsen@us.ibm.com>
+#
+# chacha_p10le_8x(u32 *state, byte *dst, const byte *src,
+#				 size_t len, int nrounds);
+#
+# do rounds,  8 quarter rounds
+# 1.  a += b; d ^= a; d <<<= 16;
+# 2.  c += d; b ^= c; b <<<= 12;
+# 3.  a += b; d ^= a; d <<<= 8;
+# 4.  c += d; b ^= c; b <<<= 7
+#
+# row1 = (row1 + row2),  row4 = row1 xor row4,  row4 rotate each word by 16
+# row3 = (row3 + row4),  row2 = row3 xor row2,  row2 rotate each word by 12
+# row1 = (row1 + row2), row4 = row1 xor row4,  row4 rotate each word by 8
+# row3 = (row3 + row4), row2 = row3 xor row2,  row2 rotate each word by 7
+#
+# 4 blocks (a b c d)
+#
+# a0 b0 c0 d0
+# a1 b1 c1 d1
+# ...
+# a4 b4 c4 d4
+# ...
+# a8 b8 c8 d8
+# ...
+# a12 b12 c12 d12
+# a13 ...
+# a14 ...
+# a15 b15 c15 d15
+#
+# Column round (v0, v4,  v8, v12, v1, v5,  v9, v13, v2, v6, v10, v14, v3, v7, v11, v15)
+# Diagnal round (v0, v5, v10, v15, v1, v6, v11, v12, v2, v7,  v8, v13, v3, v4,  v9, v14)
+#
+
+#include <asm/ppc_asm.h>
+#include <asm/asm-offsets.h>
+#include <asm/asm-compat.h>
+#include <linux/linkage.h>
+
+.machine	"any"
+.text
+
+.macro	SAVE_GPR GPR OFFSET FRAME
+	std	\GPR,\OFFSET(\FRAME)
+.endm
+
+.macro	SAVE_VRS VRS OFFSET FRAME
+	li	16, \OFFSET
+	stvx	\VRS, 16, \FRAME
+.endm
+
+.macro	SAVE_VSX VSX OFFSET FRAME
+	li	16, \OFFSET
+	stxvx	\VSX, 16, \FRAME
+.endm
+
+.macro	RESTORE_GPR GPR OFFSET FRAME
+	ld	\GPR,\OFFSET(\FRAME)
+.endm
+
+.macro	RESTORE_VRS VRS OFFSET FRAME
+	li	16, \OFFSET
+	lvx	\VRS, 16, \FRAME
+.endm
+
+.macro	RESTORE_VSX VSX OFFSET FRAME
+	li	16, \OFFSET
+	lxvx	\VSX, 16, \FRAME
+.endm
+
+.macro SAVE_REGS
+	mflr 0
+	std 0, 16(1)
+	stdu 1,-752(1)
+
+	SAVE_GPR 14, 112, 1
+	SAVE_GPR 15, 120, 1
+	SAVE_GPR 16, 128, 1
+	SAVE_GPR 17, 136, 1
+	SAVE_GPR 18, 144, 1
+	SAVE_GPR 19, 152, 1
+	SAVE_GPR 20, 160, 1
+	SAVE_GPR 21, 168, 1
+	SAVE_GPR 22, 176, 1
+	SAVE_GPR 23, 184, 1
+	SAVE_GPR 24, 192, 1
+	SAVE_GPR 25, 200, 1
+	SAVE_GPR 26, 208, 1
+	SAVE_GPR 27, 216, 1
+	SAVE_GPR 28, 224, 1
+	SAVE_GPR 29, 232, 1
+	SAVE_GPR 30, 240, 1
+	SAVE_GPR 31, 248, 1
+
+	addi	9, 1, 256
+	SAVE_VRS 20, 0, 9
+	SAVE_VRS 21, 16, 9
+	SAVE_VRS 22, 32, 9
+	SAVE_VRS 23, 48, 9
+	SAVE_VRS 24, 64, 9
+	SAVE_VRS 25, 80, 9
+	SAVE_VRS 26, 96, 9
+	SAVE_VRS 27, 112, 9
+	SAVE_VRS 28, 128, 9
+	SAVE_VRS 29, 144, 9
+	SAVE_VRS 30, 160, 9
+	SAVE_VRS 31, 176, 9
+
+	SAVE_VSX 14, 192, 9
+	SAVE_VSX 15, 208, 9
+	SAVE_VSX 16, 224, 9
+	SAVE_VSX 17, 240, 9
+	SAVE_VSX 18, 256, 9
+	SAVE_VSX 19, 272, 9
+	SAVE_VSX 20, 288, 9
+	SAVE_VSX 21, 304, 9
+	SAVE_VSX 22, 320, 9
+	SAVE_VSX 23, 336, 9
+	SAVE_VSX 24, 352, 9
+	SAVE_VSX 25, 368, 9
+	SAVE_VSX 26, 384, 9
+	SAVE_VSX 27, 400, 9
+	SAVE_VSX 28, 416, 9
+	SAVE_VSX 29, 432, 9
+	SAVE_VSX 30, 448, 9
+	SAVE_VSX 31, 464, 9
+.endm # SAVE_REGS
+
+.macro RESTORE_REGS
+	addi	9, 1, 256
+	RESTORE_VRS 20, 0, 9
+	RESTORE_VRS 21, 16, 9
+	RESTORE_VRS 22, 32, 9
+	RESTORE_VRS 23, 48, 9
+	RESTORE_VRS 24, 64, 9
+	RESTORE_VRS 25, 80, 9
+	RESTORE_VRS 26, 96, 9
+	RESTORE_VRS 27, 112, 9
+	RESTORE_VRS 28, 128, 9
+	RESTORE_VRS 29, 144, 9
+	RESTORE_VRS 30, 160, 9
+	RESTORE_VRS 31, 176, 9
+
+	RESTORE_VSX 14, 192, 9
+	RESTORE_VSX 15, 208, 9
+	RESTORE_VSX 16, 224, 9
+	RESTORE_VSX 17, 240, 9
+	RESTORE_VSX 18, 256, 9
+	RESTORE_VSX 19, 272, 9
+	RESTORE_VSX 20, 288, 9
+	RESTORE_VSX 21, 304, 9
+	RESTORE_VSX 22, 320, 9
+	RESTORE_VSX 23, 336, 9
+	RESTORE_VSX 24, 352, 9
+	RESTORE_VSX 25, 368, 9
+	RESTORE_VSX 26, 384, 9
+	RESTORE_VSX 27, 400, 9
+	RESTORE_VSX 28, 416, 9
+	RESTORE_VSX 29, 432, 9
+	RESTORE_VSX 30, 448, 9
+	RESTORE_VSX 31, 464, 9
+
+	RESTORE_GPR 14, 112, 1
+	RESTORE_GPR 15, 120, 1
+	RESTORE_GPR 16, 128, 1
+	RESTORE_GPR 17, 136, 1
+	RESTORE_GPR 18, 144, 1
+	RESTORE_GPR 19, 152, 1
+	RESTORE_GPR 20, 160, 1
+	RESTORE_GPR 21, 168, 1
+	RESTORE_GPR 22, 176, 1
+	RESTORE_GPR 23, 184, 1
+	RESTORE_GPR 24, 192, 1
+	RESTORE_GPR 25, 200, 1
+	RESTORE_GPR 26, 208, 1
+	RESTORE_GPR 27, 216, 1
+	RESTORE_GPR 28, 224, 1
+	RESTORE_GPR 29, 232, 1
+	RESTORE_GPR 30, 240, 1
+	RESTORE_GPR 31, 248, 1
+
+	addi    1, 1, 752
+	ld 0, 16(1)
+	mtlr 0
+.endm # RESTORE_REGS
+
+.macro QT_loop_8x
+	# QR(v0, v4,  v8, v12, v1, v5,  v9, v13, v2, v6, v10, v14, v3, v7, v11, v15)
+	xxlor	0, 32+25, 32+25
+	xxlor	32+25, 20, 20
+	vadduwm 0, 0, 4
+	vadduwm 1, 1, 5
+	vadduwm 2, 2, 6
+	vadduwm 3, 3, 7
+	  vadduwm 16, 16, 20
+	  vadduwm 17, 17, 21
+	  vadduwm 18, 18, 22
+	  vadduwm 19, 19, 23
+
+	  vpermxor 12, 12, 0, 25
+	  vpermxor 13, 13, 1, 25
+	  vpermxor 14, 14, 2, 25
+	  vpermxor 15, 15, 3, 25
+	  vpermxor 28, 28, 16, 25
+	  vpermxor 29, 29, 17, 25
+	  vpermxor 30, 30, 18, 25
+	  vpermxor 31, 31, 19, 25
+	xxlor	32+25, 0, 0
+	vadduwm 8, 8, 12
+	vadduwm 9, 9, 13
+	vadduwm 10, 10, 14
+	vadduwm 11, 11, 15
+	  vadduwm 24, 24, 28
+	  vadduwm 25, 25, 29
+	  vadduwm 26, 26, 30
+	  vadduwm 27, 27, 31
+	vxor 4, 4, 8
+	vxor 5, 5, 9
+	vxor 6, 6, 10
+	vxor 7, 7, 11
+	  vxor 20, 20, 24
+	  vxor 21, 21, 25
+	  vxor 22, 22, 26
+	  vxor 23, 23, 27
+
+	xxlor	0, 32+25, 32+25
+	xxlor	32+25, 21, 21
+	vrlw 4, 4, 25  #
+	vrlw 5, 5, 25
+	vrlw 6, 6, 25
+	vrlw 7, 7, 25
+	  vrlw 20, 20, 25  #
+	  vrlw 21, 21, 25
+	  vrlw 22, 22, 25
+	  vrlw 23, 23, 25
+	xxlor	32+25, 0, 0
+	vadduwm 0, 0, 4
+	vadduwm 1, 1, 5
+	vadduwm 2, 2, 6
+	vadduwm 3, 3, 7
+	  vadduwm 16, 16, 20
+	  vadduwm 17, 17, 21
+	  vadduwm 18, 18, 22
+	  vadduwm 19, 19, 23
+
+	xxlor	0, 32+25, 32+25
+	xxlor	32+25, 22, 22
+	  vpermxor 12, 12, 0, 25
+	  vpermxor 13, 13, 1, 25
+	  vpermxor 14, 14, 2, 25
+	  vpermxor 15, 15, 3, 25
+	  vpermxor 28, 28, 16, 25
+	  vpermxor 29, 29, 17, 25
+	  vpermxor 30, 30, 18, 25
+	  vpermxor 31, 31, 19, 25
+	xxlor	32+25, 0, 0
+	vadduwm 8, 8, 12
+	vadduwm 9, 9, 13
+	vadduwm 10, 10, 14
+	vadduwm 11, 11, 15
+	  vadduwm 24, 24, 28
+	  vadduwm 25, 25, 29
+	  vadduwm 26, 26, 30
+	  vadduwm 27, 27, 31
+	xxlor	0, 32+28, 32+28
+	xxlor	32+28, 23, 23
+	vxor 4, 4, 8
+	vxor 5, 5, 9
+	vxor 6, 6, 10
+	vxor 7, 7, 11
+	  vxor 20, 20, 24
+	  vxor 21, 21, 25
+	  vxor 22, 22, 26
+	  vxor 23, 23, 27
+	vrlw 4, 4, 28  #
+	vrlw 5, 5, 28
+	vrlw 6, 6, 28
+	vrlw 7, 7, 28
+	  vrlw 20, 20, 28  #
+	  vrlw 21, 21, 28
+	  vrlw 22, 22, 28
+	  vrlw 23, 23, 28
+	xxlor	32+28, 0, 0
+
+	# QR(v0, v5, v10, v15, v1, v6, v11, v12, v2, v7,  v8, v13, v3, v4,  v9, v14)
+	xxlor	0, 32+25, 32+25
+	xxlor	32+25, 20, 20
+	vadduwm 0, 0, 5
+	vadduwm 1, 1, 6
+	vadduwm 2, 2, 7
+	vadduwm 3, 3, 4
+	  vadduwm 16, 16, 21
+	  vadduwm 17, 17, 22
+	  vadduwm 18, 18, 23
+	  vadduwm 19, 19, 20
+
+	  vpermxor 15, 15, 0, 25
+	  vpermxor 12, 12, 1, 25
+	  vpermxor 13, 13, 2, 25
+	  vpermxor 14, 14, 3, 25
+	  vpermxor 31, 31, 16, 25
+	  vpermxor 28, 28, 17, 25
+	  vpermxor 29, 29, 18, 25
+	  vpermxor 30, 30, 19, 25
+
+	xxlor	32+25, 0, 0
+	vadduwm 10, 10, 15
+	vadduwm 11, 11, 12
+	vadduwm 8, 8, 13
+	vadduwm 9, 9, 14
+	  vadduwm 26, 26, 31
+	  vadduwm 27, 27, 28
+	  vadduwm 24, 24, 29
+	  vadduwm 25, 25, 30
+	vxor 5, 5, 10
+	vxor 6, 6, 11
+	vxor 7, 7, 8
+	vxor 4, 4, 9
+	  vxor 21, 21, 26
+	  vxor 22, 22, 27
+	  vxor 23, 23, 24
+	  vxor 20, 20, 25
+
+	xxlor	0, 32+25, 32+25
+	xxlor	32+25, 21, 21
+	vrlw 5, 5, 25
+	vrlw 6, 6, 25
+	vrlw 7, 7, 25
+	vrlw 4, 4, 25
+	  vrlw 21, 21, 25
+	  vrlw 22, 22, 25
+	  vrlw 23, 23, 25
+	  vrlw 20, 20, 25
+	xxlor	32+25, 0, 0
+
+	vadduwm 0, 0, 5
+	vadduwm 1, 1, 6
+	vadduwm 2, 2, 7
+	vadduwm 3, 3, 4
+	  vadduwm 16, 16, 21
+	  vadduwm 17, 17, 22
+	  vadduwm 18, 18, 23
+	  vadduwm 19, 19, 20
+
+	xxlor	0, 32+25, 32+25
+	xxlor	32+25, 22, 22
+	  vpermxor 15, 15, 0, 25
+	  vpermxor 12, 12, 1, 25
+	  vpermxor 13, 13, 2, 25
+	  vpermxor 14, 14, 3, 25
+	  vpermxor 31, 31, 16, 25
+	  vpermxor 28, 28, 17, 25
+	  vpermxor 29, 29, 18, 25
+	  vpermxor 30, 30, 19, 25
+	xxlor	32+25, 0, 0
+
+	vadduwm 10, 10, 15
+	vadduwm 11, 11, 12
+	vadduwm 8, 8, 13
+	vadduwm 9, 9, 14
+	  vadduwm 26, 26, 31
+	  vadduwm 27, 27, 28
+	  vadduwm 24, 24, 29
+	  vadduwm 25, 25, 30
+
+	xxlor	0, 32+28, 32+28
+	xxlor	32+28, 23, 23
+	vxor 5, 5, 10
+	vxor 6, 6, 11
+	vxor 7, 7, 8
+	vxor 4, 4, 9
+	  vxor 21, 21, 26
+	  vxor 22, 22, 27
+	  vxor 23, 23, 24
+	  vxor 20, 20, 25
+	vrlw 5, 5, 28
+	vrlw 6, 6, 28
+	vrlw 7, 7, 28
+	vrlw 4, 4, 28
+	  vrlw 21, 21, 28
+	  vrlw 22, 22, 28
+	  vrlw 23, 23, 28
+	  vrlw 20, 20, 28
+	xxlor	32+28, 0, 0
+.endm
+
+.macro QT_loop_4x
+	# QR(v0, v4,  v8, v12, v1, v5,  v9, v13, v2, v6, v10, v14, v3, v7, v11, v15)
+	vadduwm 0, 0, 4
+	vadduwm 1, 1, 5
+	vadduwm 2, 2, 6
+	vadduwm 3, 3, 7
+	  vpermxor 12, 12, 0, 20
+	  vpermxor 13, 13, 1, 20
+	  vpermxor 14, 14, 2, 20
+	  vpermxor 15, 15, 3, 20
+	vadduwm 8, 8, 12
+	vadduwm 9, 9, 13
+	vadduwm 10, 10, 14
+	vadduwm 11, 11, 15
+	vxor 4, 4, 8
+	vxor 5, 5, 9
+	vxor 6, 6, 10
+	vxor 7, 7, 11
+	vrlw 4, 4, 21
+	vrlw 5, 5, 21
+	vrlw 6, 6, 21
+	vrlw 7, 7, 21
+	vadduwm 0, 0, 4
+	vadduwm 1, 1, 5
+	vadduwm 2, 2, 6
+	vadduwm 3, 3, 7
+	  vpermxor 12, 12, 0, 22
+	  vpermxor 13, 13, 1, 22
+	  vpermxor 14, 14, 2, 22
+	  vpermxor 15, 15, 3, 22
+	vadduwm 8, 8, 12
+	vadduwm 9, 9, 13
+	vadduwm 10, 10, 14
+	vadduwm 11, 11, 15
+	vxor 4, 4, 8
+	vxor 5, 5, 9
+	vxor 6, 6, 10
+	vxor 7, 7, 11
+	vrlw 4, 4, 23
+	vrlw 5, 5, 23
+	vrlw 6, 6, 23
+	vrlw 7, 7, 23
+
+	# QR(v0, v5, v10, v15, v1, v6, v11, v12, v2, v7,  v8, v13, v3, v4,  v9, v14)
+	vadduwm 0, 0, 5
+	vadduwm 1, 1, 6
+	vadduwm 2, 2, 7
+	vadduwm 3, 3, 4
+	  vpermxor 15, 15, 0, 20
+	  vpermxor 12, 12, 1, 20
+	  vpermxor 13, 13, 2, 20
+	  vpermxor 14, 14, 3, 20
+	vadduwm 10, 10, 15
+	vadduwm 11, 11, 12
+	vadduwm 8, 8, 13
+	vadduwm 9, 9, 14
+	vxor 5, 5, 10
+	vxor 6, 6, 11
+	vxor 7, 7, 8
+	vxor 4, 4, 9
+	vrlw 5, 5, 21
+	vrlw 6, 6, 21
+	vrlw 7, 7, 21
+	vrlw 4, 4, 21
+	vadduwm 0, 0, 5
+	vadduwm 1, 1, 6
+	vadduwm 2, 2, 7
+	vadduwm 3, 3, 4
+	  vpermxor 15, 15, 0, 22
+	  vpermxor 12, 12, 1, 22
+	  vpermxor 13, 13, 2, 22
+	  vpermxor 14, 14, 3, 22
+	vadduwm 10, 10, 15
+	vadduwm 11, 11, 12
+	vadduwm 8, 8, 13
+	vadduwm 9, 9, 14
+	vxor 5, 5, 10
+	vxor 6, 6, 11
+	vxor 7, 7, 8
+	vxor 4, 4, 9
+	vrlw 5, 5, 23
+	vrlw 6, 6, 23
+	vrlw 7, 7, 23
+	vrlw 4, 4, 23
+.endm
+
+# Transpose
+.macro TP_4x a0 a1 a2 a3
+	xxmrghw  10, 32+\a0, 32+\a1	# a0, a1, b0, b1
+	xxmrghw  11, 32+\a2, 32+\a3	# a2, a3, b2, b3
+	xxmrglw  12, 32+\a0, 32+\a1	# c0, c1, d0, d1
+	xxmrglw  13, 32+\a2, 32+\a3	# c2, c3, d2, d3
+	xxpermdi	32+\a0, 10, 11, 0	# a0, a1, a2, a3
+	xxpermdi	32+\a1, 10, 11, 3	# b0, b1, b2, b3
+	xxpermdi	32+\a2, 12, 13, 0	# c0, c1, c2, c3
+	xxpermdi	32+\a3, 12, 13, 3	# d0, d1, d2, d3
+.endm
+
+# key stream = working state + state
+.macro Add_state S
+	vadduwm \S+0, \S+0, 16-\S
+	vadduwm \S+4, \S+4, 17-\S
+	vadduwm \S+8, \S+8, 18-\S
+	vadduwm \S+12, \S+12, 19-\S
+
+	vadduwm \S+1, \S+1, 16-\S
+	vadduwm \S+5, \S+5, 17-\S
+	vadduwm \S+9, \S+9, 18-\S
+	vadduwm \S+13, \S+13, 19-\S
+
+	vadduwm \S+2, \S+2, 16-\S
+	vadduwm \S+6, \S+6, 17-\S
+	vadduwm \S+10, \S+10, 18-\S
+	vadduwm \S+14, \S+14, 19-\S
+
+	vadduwm	\S+3, \S+3, 16-\S
+	vadduwm	\S+7, \S+7, 17-\S
+	vadduwm	\S+11, \S+11, 18-\S
+	vadduwm	\S+15, \S+15, 19-\S
+.endm
+
+#
+# write 256 bytes
+#
+.macro Write_256 S
+	add 9, 14, 5
+	add 16, 14, 4
+	lxvw4x 0, 0, 9
+	lxvw4x 1, 17, 9
+	lxvw4x 2, 18, 9
+	lxvw4x 3, 19, 9
+	lxvw4x 4, 20, 9
+	lxvw4x 5, 21, 9
+	lxvw4x 6, 22, 9
+	lxvw4x 7, 23, 9
+	lxvw4x 8, 24, 9
+	lxvw4x 9, 25, 9
+	lxvw4x 10, 26, 9
+	lxvw4x 11, 27, 9
+	lxvw4x 12, 28, 9
+	lxvw4x 13, 29, 9
+	lxvw4x 14, 30, 9
+	lxvw4x 15, 31, 9
+
+	xxlxor \S+32, \S+32, 0
+	xxlxor \S+36, \S+36, 1
+	xxlxor \S+40, \S+40, 2
+	xxlxor \S+44, \S+44, 3
+	xxlxor \S+33, \S+33, 4
+	xxlxor \S+37, \S+37, 5
+	xxlxor \S+41, \S+41, 6
+	xxlxor \S+45, \S+45, 7
+	xxlxor \S+34, \S+34, 8
+	xxlxor \S+38, \S+38, 9
+	xxlxor \S+42, \S+42, 10
+	xxlxor \S+46, \S+46, 11
+	xxlxor \S+35, \S+35, 12
+	xxlxor \S+39, \S+39, 13
+	xxlxor \S+43, \S+43, 14
+	xxlxor \S+47, \S+47, 15
+
+	stxvw4x \S+32, 0, 16
+	stxvw4x \S+36, 17, 16
+	stxvw4x \S+40, 18, 16
+	stxvw4x \S+44, 19, 16
+
+	stxvw4x \S+33, 20, 16
+	stxvw4x \S+37, 21, 16
+	stxvw4x \S+41, 22, 16
+	stxvw4x \S+45, 23, 16
+
+	stxvw4x \S+34, 24, 16
+	stxvw4x \S+38, 25, 16
+	stxvw4x \S+42, 26, 16
+	stxvw4x \S+46, 27, 16
+
+	stxvw4x \S+35, 28, 16
+	stxvw4x \S+39, 29, 16
+	stxvw4x \S+43, 30, 16
+	stxvw4x \S+47, 31, 16
+
+.endm
+
+#
+# chacha20_p10le_8x(u32 *state, byte *dst, const byte *src, size_t len, int nrounds);
+#
+SYM_FUNC_START(chacha_p10le_8x)
+.align 5
+	cmpdi	6, 0
+	ble	Out_no_chacha
+
+	SAVE_REGS
+
+	# r17 - r31 mainly for Write_256 macro.
+	li	17, 16
+	li	18, 32
+	li	19, 48
+	li	20, 64
+	li	21, 80
+	li	22, 96
+	li	23, 112
+	li	24, 128
+	li	25, 144
+	li	26, 160
+	li	27, 176
+	li	28, 192
+	li	29, 208
+	li	30, 224
+	li	31, 240
+
+	mr 15, 6			# len
+	li 14, 0			# offset to inp and outp
+
+        lxvw4x	48, 0, 3		#  vr16, constants
+	lxvw4x	49, 17, 3		#  vr17, key 1
+	lxvw4x	50, 18, 3		#  vr18, key 2
+	lxvw4x	51, 19, 3		#  vr19, counter, nonce
+
+	# create (0, 1, 2, 3) counters
+	vspltisw 0, 0
+	vspltisw 1, 1
+	vspltisw 2, 2
+	vspltisw 3, 3
+	vmrghw	4, 0, 1
+	vmrglw	5, 2, 3
+	vsldoi	30, 4, 5, 8		# vr30 counter, 4 (0, 1, 2, 3)
+
+	vspltisw 21, 12
+	vspltisw 23, 7
+
+	addis	11, 2, permx@toc@ha
+	addi	11, 11, permx@toc@l
+	lxvw4x	32+20, 0, 11
+	lxvw4x	32+22, 17, 11
+
+	sradi	8, 7, 1
+
+	mtctr 8
+
+	# save constants to vsx
+	xxlor	16, 48, 48
+	xxlor	17, 49, 49
+	xxlor	18, 50, 50
+	xxlor	19, 51, 51
+
+	vspltisw 25, 4
+	vspltisw 26, 8
+
+	xxlor	25, 32+26, 32+26
+	xxlor	24, 32+25, 32+25
+
+	vadduwm	31, 30, 25		# counter = (0, 1, 2, 3) + (4, 4, 4, 4)
+	xxlor	30, 32+30, 32+30
+	xxlor	31, 32+31, 32+31
+
+	xxlor	20, 32+20, 32+20
+	xxlor	21, 32+21, 32+21
+	xxlor	22, 32+22, 32+22
+	xxlor	23, 32+23, 32+23
+
+	cmpdi	6, 512
+	blt	Loop_last
+
+Loop_8x:
+	xxspltw  32+0, 16, 0
+	xxspltw  32+1, 16, 1
+	xxspltw  32+2, 16, 2
+	xxspltw  32+3, 16, 3
+
+	xxspltw  32+4, 17, 0
+	xxspltw  32+5, 17, 1
+	xxspltw  32+6, 17, 2
+	xxspltw  32+7, 17, 3
+	xxspltw  32+8, 18, 0
+	xxspltw  32+9, 18, 1
+	xxspltw  32+10, 18, 2
+	xxspltw  32+11, 18, 3
+	xxspltw  32+12, 19, 0
+	xxspltw  32+13, 19, 1
+	xxspltw  32+14, 19, 2
+	xxspltw  32+15, 19, 3
+	vadduwm	12, 12, 30	# increase counter
+
+	xxspltw  32+16, 16, 0
+	xxspltw  32+17, 16, 1
+	xxspltw  32+18, 16, 2
+	xxspltw  32+19, 16, 3
+
+	xxspltw  32+20, 17, 0
+	xxspltw  32+21, 17, 1
+	xxspltw  32+22, 17, 2
+	xxspltw  32+23, 17, 3
+	xxspltw  32+24, 18, 0
+	xxspltw  32+25, 18, 1
+	xxspltw  32+26, 18, 2
+	xxspltw  32+27, 18, 3
+	xxspltw  32+28, 19, 0
+	xxspltw  32+29, 19, 1
+	vadduwm	28, 28, 31	# increase counter
+	xxspltw  32+30, 19, 2
+	xxspltw  32+31, 19, 3
+
+.align 5
+quarter_loop_8x:
+	QT_loop_8x
+
+	bdnz	quarter_loop_8x
+
+	xxlor	0, 32+30, 32+30
+	xxlor	32+30, 30, 30
+	vadduwm	12, 12, 30
+	xxlor	32+30, 0, 0
+	TP_4x 0, 1, 2, 3
+	TP_4x 4, 5, 6, 7
+	TP_4x 8, 9, 10, 11
+	TP_4x 12, 13, 14, 15
+
+	xxlor	0, 48, 48
+	xxlor	1, 49, 49
+	xxlor	2, 50, 50
+	xxlor	3, 51, 51
+	xxlor	48, 16, 16
+	xxlor	49, 17, 17
+	xxlor	50, 18, 18
+	xxlor	51, 19, 19
+	Add_state 0
+	xxlor	48, 0, 0
+	xxlor	49, 1, 1
+	xxlor	50, 2, 2
+	xxlor	51, 3, 3
+	Write_256 0
+	addi	14, 14, 256	# offset +=256
+	addi	15, 15, -256	# len -=256
+
+	xxlor	5, 32+31, 32+31
+	xxlor	32+31, 31, 31
+	vadduwm	28, 28, 31
+	xxlor	32+31, 5, 5
+	TP_4x 16+0, 16+1, 16+2, 16+3
+	TP_4x 16+4, 16+5, 16+6, 16+7
+	TP_4x 16+8, 16+9, 16+10, 16+11
+	TP_4x 16+12, 16+13, 16+14, 16+15
+
+	xxlor	32, 16, 16
+	xxlor	33, 17, 17
+	xxlor	34, 18, 18
+	xxlor	35, 19, 19
+	Add_state 16
+	Write_256 16
+	addi	14, 14, 256	# offset +=256
+	addi	15, 15, -256	# len +=256
+
+	xxlor	32+24, 24, 24
+	xxlor	32+25, 25, 25
+	xxlor	32+30, 30, 30
+	vadduwm	30, 30, 25
+	vadduwm	31, 30, 24
+	xxlor	30, 32+30, 32+30
+	xxlor	31, 32+31, 32+31
+
+	cmpdi	15, 0
+	beq	Out_loop
+
+	cmpdi	15, 512
+	blt	Loop_last
+
+	mtctr 8
+	b Loop_8x
+
+Loop_last:
+        lxvw4x	48, 0, 3		#  vr16, constants
+	lxvw4x	49, 17, 3		#  vr17, key 1
+	lxvw4x	50, 18, 3		#  vr18, key 2
+	lxvw4x	51, 19, 3		#  vr19, counter, nonce
+
+	vspltisw 21, 12
+	vspltisw 23, 7
+	addis	11, 2, permx@toc@ha
+	addi	11, 11, permx@toc@l
+	lxvw4x	32+20, 0, 11
+	lxvw4x	32+22, 17, 11
+
+	sradi	8, 7, 1
+	mtctr 8
+
+Loop_4x:
+	vspltw  0, 16, 0
+	vspltw  1, 16, 1
+	vspltw  2, 16, 2
+	vspltw  3, 16, 3
+
+	vspltw  4, 17, 0
+	vspltw  5, 17, 1
+	vspltw  6, 17, 2
+	vspltw  7, 17, 3
+	vspltw  8, 18, 0
+	vspltw  9, 18, 1
+	vspltw  10, 18, 2
+	vspltw  11, 18, 3
+	vspltw  12, 19, 0
+	vadduwm	12, 12, 30	# increase counter
+	vspltw  13, 19, 1
+	vspltw  14, 19, 2
+	vspltw  15, 19, 3
+
+.align 5
+quarter_loop:
+	QT_loop_4x
+
+	bdnz	quarter_loop
+
+	vadduwm	12, 12, 30
+	TP_4x 0, 1, 2, 3
+	TP_4x 4, 5, 6, 7
+	TP_4x 8, 9, 10, 11
+	TP_4x 12, 13, 14, 15
+
+	Add_state 0
+	Write_256 0
+	addi	14, 14, 256	# offset += 256
+	addi	15, 15, -256	# len += 256
+
+	# Update state counter
+	vspltisw 25, 4
+	vadduwm	30, 30, 25
+
+	cmpdi	15, 0
+	beq	Out_loop
+	cmpdi	15, 256
+	blt	Out_loop
+
+	mtctr 8
+	b Loop_4x
+
+Out_loop:
+	RESTORE_REGS
+	blr
+
+Out_no_chacha:
+	li	3, 0
+	blr
+SYM_FUNC_END(chacha_p10le_8x)
+
+SYM_DATA_START_LOCAL(PERMX)
+.align 5
+permx:
+.long 0x22330011, 0x66774455, 0xaabb8899, 0xeeffccdd
+.long 0x11223300, 0x55667744, 0x99aabb88, 0xddeeffcc
+SYM_DATA_END(PERMX)
-- 
2.31.1

