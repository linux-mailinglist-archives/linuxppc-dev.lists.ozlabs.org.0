Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0F26EFAD8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 21:17:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q67sV4mJZz3fKQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 05:17:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CLJPm+Ls;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CLJPm+Ls;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q67m00GT1z3ccl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Apr 2023 05:12:15 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33QJ9bTL028718;
	Wed, 26 Apr 2023 19:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9PrGG528GTcQxlCdN7mIPHt0tiYSjTjbp7FJM+r0+EY=;
 b=CLJPm+LscZici3oNAQ/KaO/owagWYU589t7j8K3xK+JXP2fNRm+qh7/4Ev/ejSSIj0GP
 vEHmyDslIAR0Jp3TgJAY458lkcNYd+RC8CkGCC67xCTyDYqCQglGSJJhCYryE41c+UQg
 tRUxDX+O2QM0NvKinhg3lDP8aAvh4YK9Yj5i5urc7u9gtpYcv7JOaCJPo/tDrkBPsErl
 M/HvEubkr9kY0ByaiheM+ITHZYNegCpHhUgszPIljisNf+0W0BiNufvv7LpQ7rclis6q
 8y0Ftm31vB2tawSQPCazlTorTE1SG6C+Z3hRAU4NTHXZ4cBLtJZ32yJDXzL3hvUtNhuf 1w== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q78023arm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Apr 2023 19:11:59 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33QGIb2Z024955;
	Wed, 26 Apr 2023 19:11:56 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3q4778etyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Apr 2023 19:11:56 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33QJBtn72228764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Apr 2023 19:11:55 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97CF358055;
	Wed, 26 Apr 2023 19:11:55 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6495F58043;
	Wed, 26 Apr 2023 19:11:55 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Apr 2023 19:11:55 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 5/5] Update Kconfig and Makefile.
Date: Wed, 26 Apr 2023 15:11:47 -0400
Message-Id: <20230426191147.60610-6-dtsen@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230426191147.60610-1-dtsen@linux.ibm.com>
References: <20230426191147.60610-1-dtsen@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Tf0kpNNYNeiyM2re27BM8QvG3HN0B-0R
X-Proofpoint-ORIG-GUID: Tf0kpNNYNeiyM2re27BM8QvG3HN0B-0R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_10,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304260169
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

Defined CRYPTO_CHACHA20_P10 and CRYPTO POLY1305_P10 in Kconfig to
support optimized implementation for Power10 and later CPU.

Added new module driver chacha-p10-crypto and poly1305-p10-crypto.

Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
---
 arch/powerpc/crypto/Kconfig  | 26 ++++++++++++++++++++++++++
 arch/powerpc/crypto/Makefile |  4 ++++
 2 files changed, 30 insertions(+)

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 7113f9355165..f74d9dd6574b 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -111,4 +111,30 @@ config CRYPTO_AES_GCM_P10
 	  Support for cryptographic acceleration instructions on Power10 or
 	  later CPU. This module supports stitched acceleration for AES/GCM.
 
+config CRYPTO_CHACHA20_P10
+	tristate "Ciphers: ChaCha20, XChacha20, XChacha12 (P10 or later)"
+	depends on PPC64 && CPU_LITTLE_ENDIAN
+	select CRYPTO_SKCIPHER
+	select CRYPTO_LIB_CHACHA_GENERIC
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	help
+	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
+	  stream cipher algorithms
+
+	  Architecture: PowerPC64
+	  - Power10 or later
+	  - Little-endian
+
+config CRYPTO_POLY1305_P10
+	tristate "Hash functions: Poly1305 (P10 or later)"
+	depends on PPC64 && CPU_LITTLE_ENDIAN
+	select CRYPTO_HASH
+	select CRYPTO_LIB_POLY1305_GENERIC
+	help
+	  Poly1305 authenticator algorithm (RFC7539)
+
+	  Architecture: PowerPC64
+	  - Power10 or later
+	  - Little-endian
+
 endmenu
diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index 05c7486f42c5..cd5282eff451 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -14,6 +14,8 @@ obj-$(CONFIG_CRYPTO_CRC32C_VPMSUM) += crc32c-vpmsum.o
 obj-$(CONFIG_CRYPTO_CRCT10DIF_VPMSUM) += crct10dif-vpmsum.o
 obj-$(CONFIG_CRYPTO_VPMSUM_TESTER) += crc-vpmsum_test.o
 obj-$(CONFIG_CRYPTO_AES_GCM_P10) += aes-gcm-p10-crypto.o
+obj-$(CONFIG_CRYPTO_CHACHA20_P10) += chacha-p10-crypto.o
+obj-$(CONFIG_CRYPTO_POLY1305_P10) += poly1305-p10-crypto.o
 
 aes-ppc-spe-y := aes-spe-core.o aes-spe-keys.o aes-tab-4k.o aes-spe-modes.o aes-spe-glue.o
 md5-ppc-y := md5-asm.o md5-glue.o
@@ -23,6 +25,8 @@ sha256-ppc-spe-y := sha256-spe-asm.o sha256-spe-glue.o
 crc32c-vpmsum-y := crc32c-vpmsum_asm.o crc32c-vpmsum_glue.o
 crct10dif-vpmsum-y := crct10dif-vpmsum_asm.o crct10dif-vpmsum_glue.o
 aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp8-ppc.o aesp8-ppc.o
+chacha-p10-crypto-y := chacha-p10-glue.o chacha-p10le-8x.o
+poly1305-p10-crypto-y := poly1305-p10-glue.o poly1305-p10le_64.o
 
 quiet_cmd_perl = PERL    $@
       cmd_perl = $(PERL) $< $(if $(CONFIG_CPU_LITTLE_ENDIAN), linux-ppc64le, linux-ppc64) > $@
-- 
2.31.1

