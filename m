Return-Path: <linuxppc-dev+bounces-1325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD90977FE7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 14:31:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4tvq5kFjz2xr4;
	Fri, 13 Sep 2024 22:31:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726230679;
	cv=none; b=Zm2HCLgED8UQiCUUVtG2ZQuebXsl/0yQgp115IHRRrgynAiraTfppF5XIJSu8zD6hMysOwiY5WSadiBI5Tbqqh+fvgGRhHYeSf9e0woam3zyj6sz/UeGoGPxJoHWFrp25zo/fr3qYNgnJsOmWnmJTm5SevebYN1r8Om3y99x+ExABSjozzE0Wqvuqxy8bOFnyp09UekuPN+WiNaNOdRkdyJDf2uLcGmFYOSNnn3IAR/JR4tpuV39+1hLIIwk+fyJiXyeF1behocNlfQ0gWhxPCe0RtBE8bRkAlVNCvWPBoYUgB0wHZNGK+TbhUl//X437aNWaeRPQUpqWfEJ3cnqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726230679; c=relaxed/relaxed;
	bh=XWboUu/QhdmpUYTzcZAlK6rwdLNtbtFc5AGbr7j7R3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BxufS6AoZhL/tZUkzqX/PQ9b4UHNl41TuxjPAtvjo/B8+33JMXRACkuRn7WJWmTzAXZFnmuzjA3jEGmBHY7OjpPDItsGN/kuKH3dPYFO80XoRLH1V96PhH8EM+3VMFw7OJZj6PIeOVxKHm996MdE3AfsTjpFBZFSV7H7ycLpkk83/03D98kAgnIVILhetCo0cmZD7waNPde1wpm27zkhS9YirEnbb1m14COlz2UrP7T7fn+Q0ESjMOWoQhm4WYnBldQ9CokCSBBBpgrlFe7XQzQu70h3pzg4RtZIKjK2TqPr4+PxDGqaeYAPkAvaP3lcI6WvBC0iHppuVqBQvBQcqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tj3oRyoe; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tj3oRyoe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4tvq1Yryz2xdV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 22:31:18 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48D5v5xx027443;
	Fri, 13 Sep 2024 12:31:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=XWboUu/QhdmpUYTzcZAlK6rwdL
	NtbtFc5AGbr7j7R3w=; b=tj3oRyoeXkKjt2dKlMYdVDZtxCMuhfK2AZuKOqkwuB
	jR2O2PxGJ0ts5GI2KuWHZAwnve61TK3iPEJeW/yi3PcRLZu9MdnbN8uAytfEdzVC
	Aj6IkCN8GuNA9bBk4d5chOOida42MVHYgRyOO2hok0oByZOY24uh8XwffxqIUDWy
	+5WlN3ZRS5YQpOfk6RWa97MkPaXjJAsnxPL+pK4IUdM/OSYHk+u00N9sEQWg2ZF6
	fW37OpPiUiNiSH3uxBCngMLJhgT2sX8S0n4qwK8m+6Uzdt6YV0uGKeboIqaMtoMc
	cn6AQ8iY+fiWH153+Rf9xIQ3/MON77v6oNjDs+kota3g==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gejb1yde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 12:31:07 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48D9cdKf027328;
	Fri, 13 Sep 2024 12:31:06 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 41h3v3nt0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 12:31:06 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48DCV4VN27853388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Sep 2024 12:31:04 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AEE758056;
	Fri, 13 Sep 2024 12:31:04 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21C5A5805A;
	Fri, 13 Sep 2024 12:31:04 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Sep 2024 12:31:04 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Cc: herbert@gondor.apana.org.au, leitao@debian.org, nayna@linux.ibm.com,
        appro@cryptogams.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        ltcgcw@linux.vnet.ibm.com, dtsen@us.ibm.com,
        Danny Tsen <dtsen@linux.ibm.com>
Subject: [PATCH] crypto: Removing CRYPTO_AES_GCM_P10.
Date: Fri, 13 Sep 2024 08:30:43 -0400
Message-ID: <20240913123043.1636183-1-dtsen@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -293XIbKKSlAq5Y-fjJeetFTX0HxSbLJ
X-Proofpoint-GUID: -293XIbKKSlAq5Y-fjJeetFTX0HxSbLJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409130084

Removing CRYPTO_AES_GCM_P10 in Kconfig first so that we can apply the
subsequent patches to fix data mismatch over ipsec tunnel.

Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
---
 arch/powerpc/crypto/Kconfig | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 09ebcbdfb34f..96ca2c4c8827 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -105,22 +105,22 @@ config CRYPTO_AES_PPC_SPE
 	  architecture specific assembler implementations that work on 1KB
 	  tables or 256 bytes S-boxes.
 
-config CRYPTO_AES_GCM_P10
-	tristate "Stitched AES/GCM acceleration support on P10 or later CPU (PPC)"
-	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
-	select CRYPTO_LIB_AES
-	select CRYPTO_ALGAPI
-	select CRYPTO_AEAD
-	select CRYPTO_SKCIPHER
-	help
-	  AEAD cipher: AES cipher algorithms (FIPS-197)
-	  GCM (Galois/Counter Mode) authenticated encryption mode (NIST SP800-38D)
-	  Architecture: powerpc64 using:
-	    - little-endian
-	    - Power10 or later features
-
-	  Support for cryptographic acceleration instructions on Power10 or
-	  later CPU. This module supports stitched acceleration for AES/GCM.
+#config CRYPTO_AES_GCM_P10
+#	tristate "Stitched AES/GCM acceleration support on P10 or later CPU (PPC)"
+#	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
+#	select CRYPTO_LIB_AES
+#	select CRYPTO_ALGAPI
+#	select CRYPTO_AEAD
+#	select CRYPTO_SKCIPHER
+#	help
+#	  AEAD cipher: AES cipher algorithms (FIPS-197)
+#	  GCM (Galois/Counter Mode) authenticated encryption mode (NIST SP800-38D)
+#	  Architecture: powerpc64 using:
+#	    - little-endian
+#	    - Power10 or later features
+#
+#	  Support for cryptographic acceleration instructions on Power10 or
+#	  later CPU. This module supports stitched acceleration for AES/GCM.
 
 config CRYPTO_CHACHA20_P10
 	tristate "Ciphers: ChaCha20, XChacha20, XChacha12 (P10 or later)"
-- 
2.43.0


