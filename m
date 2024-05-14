Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3513A8C5A5E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 19:39:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OcnTIZVP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vf3Ww5R0bz3cGC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 03:39:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OcnTIZVP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vf3W90KvSz30TL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 03:39:00 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44EGSNXT010080;
	Tue, 14 May 2024 17:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=IPRmGXpqFMN5H9pdMDz8u04PBzPoFJCcXZtHx0zLOh8=;
 b=OcnTIZVPRftsDMQ07A8M+JtD2socD0l6+3hWzl1mQB+zel87pqhW8LV0Jd4Hid7027g6
 nC/sMqj9xQJy9MqUfx7mQ5wwtPnocWJ9VdQ/LKAzGALlvikkFyTeeU2wF1k2lzmfmfN3
 VUS0cx3RzRx9o/Lng8JJg5cPZ2BynrHS1GRbufYlAJycAE67i3P41FA1+ES/ZsM82Kg/
 s9erqU+OlKQvDNlukFQz9aYY6LT4XrGAqKnlcEa3D1CtQn6p4BpXeULWAUH/SOxUfN9n
 WNLUg2QWCe0x2EraVWTXKpNqiNdSvuG6k4xWQWmm+WyAzngiyvcKKFk3ArSPUiPglriJ Ww== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y4bgmr66a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 17:38:45 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44EFhZ0j006200;
	Tue, 14 May 2024 17:38:45 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2mgmen0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 17:38:45 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44EHcflx000532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 17:38:44 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAEFA58065;
	Tue, 14 May 2024 17:38:41 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B79B5805D;
	Tue, 14 May 2024 17:38:41 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 May 2024 17:38:41 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 1/3] crypto: X25519 low-level primitives for ppc64le.
Date: Tue, 14 May 2024 13:38:33 -0400
Message-Id: <20240514173835.4814-2-dtsen@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240514173835.4814-1-dtsen@linux.ibm.com>
References: <20240514173835.4814-1-dtsen@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YdnFBblhDUOLUNUlE_5CbGRy5kkllFvl
X-Proofpoint-ORIG-GUID: YdnFBblhDUOLUNUlE_5CbGRy5kkllFvl
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_10,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=836 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405140124
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

Use the perl output of x25519-ppc64.pl from CRYPTOGAMs and added three
supporting functions, x25519_fe51_sqr_times, x25519_fe51_frombytes
and x25519_fe51_tobytes.

Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
---
 arch/powerpc/crypto/curve25519-ppc64le_asm.S | 648 +++++++++++++++++++
 1 file changed, 648 insertions(+)
 create mode 100644 arch/powerpc/crypto/curve25519-ppc64le_asm.S

diff --git a/arch/powerpc/crypto/curve25519-ppc64le_asm.S b/arch/powerpc/crypto/curve25519-ppc64le_asm.S
new file mode 100644
index 000000000000..8a018104838a
--- /dev/null
+++ b/arch/powerpc/crypto/curve25519-ppc64le_asm.S
@@ -0,0 +1,648 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#
+# Copyright 2024- IBM Corp.  All Rights Reserved.
+#
+# This code is taken from CRYPTOGAMs[1] and is included here using the option
+# in the license to distribute the code under the GPL. Therefore this program
+# is free software; you can redistribute it and/or modify it under the terms of
+# the GNU General Public License version 2 as published by the Free Software
+# Foundation.
+#
+# [1] https://www.openssl.org/~appro/cryptogams/
+
+# Copyright (c) 2006-2017, CRYPTOGAMS by <appro@openssl.org>
+# All rights reserved.
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions
+# are met:
+#
+#       * Redistributions of source code must retain copyright notices,
+#         this list of conditions and the following disclaimer.
+#
+#       * Redistributions in binary form must reproduce the above
+#         copyright notice, this list of conditions and the following
+#         disclaimer in the documentation and/or other materials
+#         provided with the distribution.
+#
+#       * Neither the name of the CRYPTOGAMS nor the names of its
+#         copyright holder and contributors may be used to endorse or
+#         promote products derived from this software without specific
+#         prior written permission.
+#
+# ALTERNATIVELY, provided that this notice is retained in full, this
+# product may be distributed under the terms of the GNU General Public
+# License (GPL), in which case the provisions of the GPL apply INSTEAD OF
+# those given above.
+#
+# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS
+# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+# ====================================================================
+# Written by Andy Polyakov <appro@openssl.org> for the OpenSSL
+# project. The module is, however, dual licensed under OpenSSL and
+# CRYPTOGAMS licenses depending on where you obtain it. For further
+# details see https://www.openssl.org/~appro/cryptogams/.
+# ====================================================================
+
+#
+# ====================================================================
+# Written and Modified by Danny Tsen <dtsen@us.ibm.com>
+# - Added x25519_fe51_sqr_times, x25519_fe51_frombytes, x25519_fe51_tobytes
+#
+# X25519 lower-level primitives for PPC64.
+#
+
+#include <linux/linkage.h>
+
+.machine "any"
+.abiversion	2
+.text
+
+SYM_FUNC_START(x25519_fe51_mul)
+.align	5
+
+	stdu	1,-144(1)
+	std	21,56(1)
+	std	22,64(1)
+	std	23,72(1)
+	std	24,80(1)
+	std	25,88(1)
+	std	26,96(1)
+	std	27,104(1)
+	std	28,112(1)
+	std	29,120(1)
+	std	30,128(1)
+	std	31,136(1)
+
+	ld	6,0(5)
+	ld	7,0(4)
+	ld	8,8(4)
+	ld	9,16(4)
+	ld	10,24(4)
+	ld	11,32(4)
+
+	mulld	22,7,6
+	mulhdu	23,7,6
+
+	mulld	24,8,6
+	mulhdu	25,8,6
+
+	mulld	30,11,6
+	mulhdu	31,11,6
+	ld	4,8(5)
+	mulli	11,11,19
+
+	mulld	26,9,6
+	mulhdu	27,9,6
+
+	mulld	28,10,6
+	mulhdu	29,10,6
+	mulld	12,11,4
+	mulhdu	21,11,4
+	addc	22,22,12
+	adde	23,23,21
+
+	mulld	12,7,4
+	mulhdu	21,7,4
+	addc	24,24,12
+	adde	25,25,21
+
+	mulld	12,10,4
+	mulhdu	21,10,4
+	ld	6,16(5)
+	mulli	10,10,19
+	addc	30,30,12
+	adde	31,31,21
+
+	mulld	12,8,4
+	mulhdu	21,8,4
+	addc	26,26,12
+	adde	27,27,21
+
+	mulld	12,9,4
+	mulhdu	21,9,4
+	addc	28,28,12
+	adde	29,29,21
+	mulld	12,10,6
+	mulhdu	21,10,6
+	addc	22,22,12
+	adde	23,23,21
+
+	mulld	12,11,6
+	mulhdu	21,11,6
+	addc	24,24,12
+	adde	25,25,21
+
+	mulld	12,9,6
+	mulhdu	21,9,6
+	ld	4,24(5)
+	mulli	9,9,19
+	addc	30,30,12
+	adde	31,31,21
+
+	mulld	12,7,6
+	mulhdu	21,7,6
+	addc	26,26,12
+	adde	27,27,21
+
+	mulld	12,8,6
+	mulhdu	21,8,6
+	addc	28,28,12
+	adde	29,29,21
+	mulld	12,9,4
+	mulhdu	21,9,4
+	addc	22,22,12
+	adde	23,23,21
+
+	mulld	12,10,4
+	mulhdu	21,10,4
+	addc	24,24,12
+	adde	25,25,21
+
+	mulld	12,8,4
+	mulhdu	21,8,4
+	ld	6,32(5)
+	mulli	8,8,19
+	addc	30,30,12
+	adde	31,31,21
+
+	mulld	12,11,4
+	mulhdu	21,11,4
+	addc	26,26,12
+	adde	27,27,21
+
+	mulld	12,7,4
+	mulhdu	21,7,4
+	addc	28,28,12
+	adde	29,29,21
+	mulld	12,8,6
+	mulhdu	21,8,6
+	addc	22,22,12
+	adde	23,23,21
+
+	mulld	12,9,6
+	mulhdu	21,9,6
+	addc	24,24,12
+	adde	25,25,21
+
+	mulld	12,10,6
+	mulhdu	21,10,6
+	addc	26,26,12
+	adde	27,27,21
+
+	mulld	12,11,6
+	mulhdu	21,11,6
+	addc	28,28,12
+	adde	29,29,21
+
+	mulld	12,7,6
+	mulhdu	21,7,6
+	addc	30,30,12
+	adde	31,31,21
+
+.Lfe51_reduce:
+	li	0,-1
+	srdi	0,0,13
+
+	srdi	12,26,51
+	and	9,26,0
+	insrdi	12,27,51,0
+	srdi	21,22,51
+	and	7,22,0
+	insrdi	21,23,51,0
+	addc	28,28,12
+	addze	29,29
+	addc	24,24,21
+	addze	25,25
+
+	srdi	12,28,51
+	and	10,28,0
+	insrdi	12,29,51,0
+	srdi	21,24,51
+	and	8,24,0
+	insrdi	21,25,51,0
+	addc	30,30,12
+	addze	31,31
+	add	9,9,21
+
+	srdi	12,30,51
+	and	11,30,0
+	insrdi	12,31,51,0
+	mulli	12,12,19
+
+	add	7,7,12
+
+	srdi	21,9,51
+	and	9,9,0
+	add	10,10,21
+
+	srdi	12,7,51
+	and	7,7,0
+	add	8,8,12
+
+	std	9,16(3)
+	std	10,24(3)
+	std	11,32(3)
+	std	7,0(3)
+	std	8,8(3)
+
+	ld	21,56(1)
+	ld	22,64(1)
+	ld	23,72(1)
+	ld	24,80(1)
+	ld	25,88(1)
+	ld	26,96(1)
+	ld	27,104(1)
+	ld	28,112(1)
+	ld	29,120(1)
+	ld	30,128(1)
+	ld	31,136(1)
+	addi	1,1,144
+	blr
+SYM_FUNC_END(x25519_fe51_mul)
+
+SYM_FUNC_START(x25519_fe51_sqr)
+.align	5
+
+	stdu	1,-144(1)
+	std	21,56(1)
+	std	22,64(1)
+	std	23,72(1)
+	std	24,80(1)
+	std	25,88(1)
+	std	26,96(1)
+	std	27,104(1)
+	std	28,112(1)
+	std	29,120(1)
+	std	30,128(1)
+	std	31,136(1)
+
+	ld	7,0(4)
+	ld	8,8(4)
+	ld	9,16(4)
+	ld	10,24(4)
+	ld	11,32(4)
+
+	add	6,7,7
+	mulli	21,11,19
+
+	mulld	22,7,7
+	mulhdu	23,7,7
+	mulld	24,8,6
+	mulhdu	25,8,6
+	mulld	26,9,6
+	mulhdu	27,9,6
+	mulld	28,10,6
+	mulhdu	29,10,6
+	mulld	30,11,6
+	mulhdu	31,11,6
+	add	6,8,8
+	mulld	12,11,21
+	mulhdu	11,11,21
+	addc	28,28,12
+	adde	29,29,11
+
+	mulli	5,10,19
+
+	mulld	12,8,8
+	mulhdu	11,8,8
+	addc	26,26,12
+	adde	27,27,11
+	mulld	12,9,6
+	mulhdu	11,9,6
+	addc	28,28,12
+	adde	29,29,11
+	mulld	12,10,6
+	mulhdu	11,10,6
+	addc	30,30,12
+	adde	31,31,11
+	mulld	12,21,6
+	mulhdu	11,21,6
+	add	6,10,10
+	addc	22,22,12
+	adde	23,23,11
+	mulld	12,10,5
+	mulhdu	10,10,5
+	addc	24,24,12
+	adde	25,25,10
+	mulld	12,6,21
+	mulhdu	10,6,21
+	add	6,9,9
+	addc	26,26,12
+	adde	27,27,10
+
+	mulld	12,9,9
+	mulhdu	10,9,9
+	addc	30,30,12
+	adde	31,31,10
+	mulld	12,5,6
+	mulhdu	10,5,6
+	addc	22,22,12
+	adde	23,23,10
+	mulld	12,21,6
+	mulhdu	10,21,6
+	addc	24,24,12
+	adde	25,25,10
+
+	b	.Lfe51_reduce
+SYM_FUNC_END(x25519_fe51_sqr)
+
+SYM_FUNC_START(x25519_fe51_mul121666)
+.align	5
+
+	stdu	1,-144(1)
+	std	21,56(1)
+	std	22,64(1)
+	std	23,72(1)
+	std	24,80(1)
+	std	25,88(1)
+	std	26,96(1)
+	std	27,104(1)
+	std	28,112(1)
+	std	29,120(1)
+	std	30,128(1)
+	std	31,136(1)
+
+	lis	6,1
+	ori	6,6,56130
+	ld	7,0(4)
+	ld	8,8(4)
+	ld	9,16(4)
+	ld	10,24(4)
+	ld	11,32(4)
+
+	mulld	22,7,6
+	mulhdu	23,7,6
+	mulld	24,8,6
+	mulhdu	25,8,6
+	mulld	26,9,6
+	mulhdu	27,9,6
+	mulld	28,10,6
+	mulhdu	29,10,6
+	mulld	30,11,6
+	mulhdu	31,11,6
+
+	b	.Lfe51_reduce
+SYM_FUNC_END(x25519_fe51_mul121666)
+
+SYM_FUNC_START(x25519_fe51_sqr_times)
+.align	5
+
+	stdu	1,-144(1)
+	std	21,56(1)
+	std	22,64(1)
+	std	23,72(1)
+	std	24,80(1)
+	std	25,88(1)
+	std	26,96(1)
+	std	27,104(1)
+	std	28,112(1)
+	std	29,120(1)
+	std	30,128(1)
+	std	31,136(1)
+
+	ld	7,0(4)
+	ld	8,8(4)
+	ld	9,16(4)
+	ld	10,24(4)
+	ld	11,32(4)
+
+	mtctr	5
+
+.Lsqr_times_loop:
+	add	6,7,7
+	mulli	21,11,19
+
+	mulld	22,7,7
+	mulhdu	23,7,7
+	mulld	24,8,6
+	mulhdu	25,8,6
+	mulld	26,9,6
+	mulhdu	27,9,6
+	mulld	28,10,6
+	mulhdu	29,10,6
+	mulld	30,11,6
+	mulhdu	31,11,6
+	add	6,8,8
+	mulld	12,11,21
+	mulhdu	11,11,21
+	addc	28,28,12
+	adde	29,29,11
+
+	mulli	5,10,19
+
+	mulld	12,8,8
+	mulhdu	11,8,8
+	addc	26,26,12
+	adde	27,27,11
+	mulld	12,9,6
+	mulhdu	11,9,6
+	addc	28,28,12
+	adde	29,29,11
+	mulld	12,10,6
+	mulhdu	11,10,6
+	addc	30,30,12
+	adde	31,31,11
+	mulld	12,21,6
+	mulhdu	11,21,6
+	add	6,10,10
+	addc	22,22,12
+	adde	23,23,11
+	mulld	12,10,5
+	mulhdu	10,10,5
+	addc	24,24,12
+	adde	25,25,10
+	mulld	12,6,21
+	mulhdu	10,6,21
+	add	6,9,9
+	addc	26,26,12
+	adde	27,27,10
+
+	mulld	12,9,9
+	mulhdu	10,9,9
+	addc	30,30,12
+	adde	31,31,10
+	mulld	12,5,6
+	mulhdu	10,5,6
+	addc	22,22,12
+	adde	23,23,10
+	mulld	12,21,6
+	mulhdu	10,21,6
+	addc	24,24,12
+	adde	25,25,10
+
+	# fe51_reduce
+	li	0,-1
+	srdi	0,0,13
+
+	srdi	12,26,51
+	and	9,26,0
+	insrdi	12,27,51,0
+	srdi	21,22,51
+	and	7,22,0
+	insrdi	21,23,51,0
+	addc	28,28,12
+	addze	29,29
+	addc	24,24,21
+	addze	25,25
+
+	srdi	12,28,51
+	and	10,28,0
+	insrdi	12,29,51,0
+	srdi	21,24,51
+	and	8,24,0
+	insrdi	21,25,51,0
+	addc	30,30,12
+	addze	31,31
+	add	9,9,21
+
+	srdi	12,30,51
+	and	11,30,0
+	insrdi	12,31,51,0
+	mulli	12,12,19
+
+	add	7,7,12
+
+	srdi	21,9,51
+	and	9,9,0
+	add	10,10,21
+
+	srdi	12,7,51
+	and	7,7,0
+	add	8,8,12
+
+	std	9,16(3)
+	std	10,24(3)
+	std	11,32(3)
+	std	7,0(3)
+	std	8,8(3)
+	bdnz	.Lsqr_times_loop
+
+	ld	21,56(1)
+	ld	22,64(1)
+	ld	23,72(1)
+	ld	24,80(1)
+	ld	25,88(1)
+	ld	26,96(1)
+	ld	27,104(1)
+	ld	28,112(1)
+	ld	29,120(1)
+	ld	30,128(1)
+	ld	31,136(1)
+	addi	1,1,144
+	blr
+SYM_FUNC_END(x25519_fe51_sqr_times)
+
+SYM_FUNC_START(x25519_fe51_frombytes)
+.align	5
+
+	li	12, -1
+	srdi	12, 12, 13	# 0x7ffffffffffff
+
+	ld	5, 0(4)
+	ld	6, 8(4)
+	ld	7, 16(4)
+	ld	8, 24(4)
+
+	srdi	10, 5, 51
+	and	5, 5, 12	# h0
+
+	sldi	11, 6, 13
+	or	11, 10, 11	# h1t
+	srdi	10, 6, 38
+	and	6, 11, 12	# h1
+
+	sldi	11, 7, 26
+	or	10, 10, 11	# h2t
+
+	srdi	11, 7, 25
+	and	7, 10, 12	# h2
+	sldi	10, 8, 39
+	or	11, 11, 10	# h3t
+
+	srdi	9, 8, 12
+	and	8, 11, 12	# h3
+	and	9, 9, 12	# h4
+
+	std	5, 0(3)
+	std	6, 8(3)
+	std	7, 16(3)
+	std	8, 24(3)
+	std	9, 32(3)
+
+	blr
+SYM_FUNC_END(x25519_fe51_frombytes)
+
+SYM_FUNC_START(x25519_fe51_tobytes)
+.align	5
+
+	ld	5, 0(4)
+	ld	6, 8(4)
+	ld	7, 16(4)
+	ld	8, 24(4)
+	ld	9, 32(4)
+
+	li	12, -1
+	srdi	12, 12, 13	# 0x7ffffffffffff
+
+	# Full reducuction
+	addi	10, 5, 19
+	srdi	10, 10, 51
+	add	10, 10, 6
+	srdi	10, 10, 51
+	add	10, 10, 7
+	srdi	10, 10, 51
+	add	10, 10, 8
+	srdi	10, 10, 51
+	add	10, 10, 9
+	srdi	10, 10, 51
+
+	mulli	10, 10, 19
+	add	5, 5, 10
+	srdi	11, 5, 51
+	add	6, 6, 11
+	srdi	11, 6, 51
+	add	7, 7, 11
+	srdi	11, 7, 51
+	add	8, 8, 11
+	srdi	11, 8, 51
+	add	9, 9, 11
+
+	and	5, 5, 12
+	and	6, 6, 12
+	and	7, 7, 12
+	and	8, 8, 12
+	and	9, 9, 12
+
+	sldi	10, 6, 51
+	or	5, 5, 10	# s0
+
+	srdi	11, 6, 13
+	sldi	10, 7, 38
+	or	6, 11, 10	# s1
+
+	srdi	11, 7, 26
+	sldi	10, 8, 25
+	or	7, 11, 10	# s2
+
+	srdi	11, 8, 39
+	sldi	10, 9, 12
+	or	8, 11, 10	# s4
+
+	std	5, 0(3)
+	std	6, 8(3)
+	std	7, 16(3)
+	std	8, 24(3)
+
+	blr
+SYM_FUNC_END(x25519_fe51_tobytes)
-- 
2.31.1

