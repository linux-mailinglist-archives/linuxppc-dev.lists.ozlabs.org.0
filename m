Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B700B8C793F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 17:23:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dJij+bKi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgDPJ0wCkz3fnr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 01:23:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dJij+bKi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgDLG2kJhz3fRK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 01:20:22 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GDEIhu030613;
	Thu, 16 May 2024 15:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5nMelTmMbO56bSQrp6/Ccu6IA7pxu29++FFJZKkFP4U=;
 b=dJij+bKi7kBQOHgGxhLbhz2xsJmhQRTSgasK+VeKofOBTS/b5WKGEt6jR+tNi7FWksy3
 T3Oipu+qBvcvCqgKRTXkyLlw/Hff9eTsjMdMhEm5LAHvqmln1IvzlQyg0mk2wrHBBKOV
 wZ68PWPmJh3OV3qdsPjHfL/vadtrBkKWaaSjtBx3sjcpfSqXPjw84+yfpbaAAtuGTHP1
 KqUrQ/9ZwBH0XzHiN6/zWWZ31eJxW70b6zGTuIjckBRcke2YAUE0kJMhVj+n/7JER/M8
 9P9QUsy6Ib44oXh3MPjHRL7MO5Igk6YbwWueftxbBcUTCYsv9U2GGycEwbk3clwi68dB sQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5ju60bdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 15:20:10 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GC3Bk8029599;
	Thu, 16 May 2024 15:20:08 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2n7m29fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 15:20:08 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GFK56V39059846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 15:20:07 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D98CE58078;
	Thu, 16 May 2024 15:20:03 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0FFD5806B;
	Thu, 16 May 2024 15:20:03 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 15:20:03 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 3/3] crypto: Update Kconfig and Makefile for ppc64le x25519.
Date: Thu, 16 May 2024 11:19:57 -0400
Message-Id: <20240516151957.2215-4-dtsen@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240516151957.2215-1-dtsen@linux.ibm.com>
References: <20240516151957.2215-1-dtsen@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MP_AHtOf1pFp6RPU5qSUDGVev9rTglGp
X-Proofpoint-ORIG-GUID: MP_AHtOf1pFp6RPU5qSUDGVev9rTglGp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=678 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160108
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

Defined CRYPTO_CURVE25519_PPC64 to support X25519 for ppc64le.

Added new module curve25519-ppc64le for X25519.

Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
---
 arch/powerpc/crypto/Kconfig  | 11 +++++++++++
 arch/powerpc/crypto/Makefile |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 1e201b7ae2fc..09ebcbdfb34f 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -2,6 +2,17 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (powerpc)"
 
+config CRYPTO_CURVE25519_PPC64
+	tristate "Public key crypto: Curve25519 (PowerPC64)"
+	depends on PPC64 && CPU_LITTLE_ENDIAN
+	select CRYPTO_LIB_CURVE25519_GENERIC
+	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
+	help
+	  Curve25519 algorithm
+
+	  Architecture: PowerPC64
+	  - Little-endian
+
 config CRYPTO_CRC32C_VPMSUM
 	tristate "CRC32c"
 	depends on PPC64 && ALTIVEC
diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index fca0e9739869..59808592f0a1 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_CRYPTO_AES_GCM_P10) += aes-gcm-p10-crypto.o
 obj-$(CONFIG_CRYPTO_CHACHA20_P10) += chacha-p10-crypto.o
 obj-$(CONFIG_CRYPTO_POLY1305_P10) += poly1305-p10-crypto.o
 obj-$(CONFIG_CRYPTO_DEV_VMX_ENCRYPT) += vmx-crypto.o
+obj-$(CONFIG_CRYPTO_CURVE25519_PPC64) += curve25519-ppc64le.o
 
 aes-ppc-spe-y := aes-spe-core.o aes-spe-keys.o aes-tab-4k.o aes-spe-modes.o aes-spe-glue.o
 md5-ppc-y := md5-asm.o md5-glue.o
@@ -29,6 +30,7 @@ aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp10-ppc.o aesp10-p
 chacha-p10-crypto-y := chacha-p10-glue.o chacha-p10le-8x.o
 poly1305-p10-crypto-y := poly1305-p10-glue.o poly1305-p10le_64.o
 vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
+curve25519-ppc64le-y := curve25519-ppc64le-core.o curve25519-ppc64le_asm.o
 
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
 override flavour := linux-ppc64le
-- 
2.31.1

