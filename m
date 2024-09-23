Return-Path: <linuxppc-dev+bounces-1530-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE1597EC4D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2024 15:31:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XC3mC3YnDz2yGd;
	Mon, 23 Sep 2024 23:31:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727098267;
	cv=none; b=RAhlSRtiRNfw5xq/N2uO5NG7KBplF1Pb/XjBweimcZmINj9adT4g8cCDi+O1UVFSeWo7DBcghiaS0/stOoExtYs16Qq1H7v2TcwxShBmDR+DpIUclcN/l96VdUitNp0yuxw/qNEstMFb4eLb8vfoKb/7QL21qIKCQEILfWq4SKZYVm1emP8vMPWtxrwctlduI9hnr8hwp9ekufE8zEyjtmAGCQnRHlU2xHkng1OLgAAQJ0Pui8yylTQR9Sv0IkaOUaOM8Qd1eQ87ZO9BHL+tBS0t8q3E/KRZQ59NHN5EmnuzthvA7uiS9iuoUGIdgKRjHG8/WxTSvK04b8tvW3Mz0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727098267; c=relaxed/relaxed;
	bh=u7k5SwI6chCIksCZz8Hi2DUWn3zMg3MUHqjtPjnnnwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SjaLiQvweG+YkJqn78SaaETnNNR9d0jcZlCmSYA72mMFJJ2leJgQvGX1ubfxoG3HdRaOJTqedfpWxjm3e23w4/RdKlbNSOuYJgctvOfr1JPEwHbUjR7XF5Z3v7hc3zAQKpVjF/1ObDdiicAYMKb6yEoPIvG6G4pfFMfBqkBf9b4o3/bTAULBd7UVgmVcbQgG1IT9lXniNGEu4IuqxmoPCUEbqmMi43vuSnXs0IS3ikZ8+WF02c5BOScFyFnGrG7uVOpnFO7vYP7/ctIeVBBXq4T+3XyzRMLjVbyBVQ1aw6oEOCotD7gyWNoGT1hoPkvBY8UNo66NnZsKoH4cPh+juw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hg9wFZ6R; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hg9wFZ6R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XC3mC14Sfz2xk7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:31:06 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48N1qrBw022199;
	Mon, 23 Sep 2024 13:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=u7k5SwI6chCIk
	sCZz8Hi2DUWn3zMg3MUHqjtPjnnnwI=; b=hg9wFZ6Rd1sP01JpFDlNGN2PJ51ZU
	bKCifHe2jBfpBc6+baLTY2cvHfl+vZbmWn2OfMPELbLatvzSlue1TGrHqlRLN3WO
	UiW863CvPoUVDAwI7NXNrozA7zKqecGtiqZ+sSWm8bGyfwhXX0y/6kloCbE1Bp2W
	7XWgBVU18ykMTAvWv7nwuXcP9TaUtHUtCtkMB2GT1o9dxUErrDMUnCsTtAGuympY
	6K1pqZ29fYHRHpl/RCWzlJfhbfCJX1oHyDTDVXqiqgiPdAXLQ867nZp8IZ4uZJ2r
	Kty9flSJmqOBehZNEhyQa1cn2/0gHSIcEbLdH9XsPeGR71w29wZvg6gaw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41sntw46ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 13:30:54 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48NAwTQn008701;
	Mon, 23 Sep 2024 13:30:51 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41t8v0xww8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 13:30:51 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48NDUnGh33489364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Sep 2024 13:30:50 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C16FD5805A;
	Mon, 23 Sep 2024 13:30:49 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D6985805C;
	Mon, 23 Sep 2024 13:30:49 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Sep 2024 13:30:49 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Cc: stable@vger.kernel.org, herbert@gondor.apana.org.au, leitao@debian.org,
        nayna@linux.ibm.com, appro@cryptogams.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au, ltcgcw@linux.vnet.ibm.com, dtsen@us.ibm.com,
        Danny Tsen <dtsen@linux.ibm.com>
Subject: [PATCH 3/3] crypto: added CRYPTO_SIMD in Kconfig for CRYPTO_AES_GCM_P10.
Date: Mon, 23 Sep 2024 09:30:40 -0400
Message-ID: <20240923133040.4630-4-dtsen@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240923133040.4630-1-dtsen@linux.ibm.com>
References: <20240923133040.4630-1-dtsen@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: VMTLlQ3Y2GYVfKo8jqx_hYOZoqfcDzAQ
X-Proofpoint-GUID: VMTLlQ3Y2GYVfKo8jqx_hYOZoqfcDzAQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-23_10,2024-09-23_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxlogscore=864 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409230099

Added CRYPTO_SIMD for CRYPTO_AES_GCM_P10.

Fixes: 45a4672b9a6e ("crypto: p10-aes-gcm - Update Kconfig and Makefile")

Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
---
 arch/powerpc/crypto/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 46a4c85e85e2..951a43726461 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -107,12 +107,12 @@ config CRYPTO_AES_PPC_SPE
 
 config CRYPTO_AES_GCM_P10
 	tristate "Stitched AES/GCM acceleration support on P10 or later CPU (PPC)"
-	depends on BROKEN
 	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
 	select CRYPTO_LIB_AES
 	select CRYPTO_ALGAPI
 	select CRYPTO_AEAD
 	select CRYPTO_SKCIPHER
+	select CRYPTO_SIMD
 	help
 	  AEAD cipher: AES cipher algorithms (FIPS-197)
 	  GCM (Galois/Counter Mode) authenticated encryption mode (NIST SP800-38D)
-- 
2.43.0


