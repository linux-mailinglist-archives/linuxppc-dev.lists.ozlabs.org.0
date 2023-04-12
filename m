Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2E36E169A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 23:44:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PyClg1g4Mz3fTv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 07:44:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rnPYez3d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rnPYez3d;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxW6709L7z3cfL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 04:13:02 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33CI8AmH026155;
	Wed, 12 Apr 2023 18:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=KkklAoZ5sichcefEnWnmhK55t3H/35XgHfcGvPD040o=;
 b=rnPYez3dQkaCq3gNPVY0vYfPSedkUiTUb/tIGjIf3HqfDxyWPFFBAWArnP2J6SdrmA2T
 yQP1OKwxvwVAW+eSy/+6i6nlOTCYglpOcXgpr3tVnmDe2n8ZzXE6dhE8ihb7xOUF673M
 pDlkM1R+uMpZ/s7i2z6+DtwivPgrn71/1/7M8gp/w9rsaoypMf/QCL9bbLDe6mmGLFpA
 bIDmLJ75gGRmtrTe0xUJRDY6MxN9nx+7k1RaC1JPzDeoT8PJbisE+3Wf1DNfVsvOmKyg
 m3I1gB+zCSGgRSdVd3g7dfUBMz5MJ5CMoVwhVyUuNCtR8sjZXwWUwAQ9fYV/2o2aMKvC pQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3px0aakgs4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Apr 2023 18:12:44 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33CH0HTI028286;
	Wed, 12 Apr 2023 18:12:42 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3pu0fr7hte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Apr 2023 18:12:42 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33CICe7B36110764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Apr 2023 18:12:41 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B264E58055;
	Wed, 12 Apr 2023 18:12:40 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C14258043;
	Wed, 12 Apr 2023 18:12:40 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Apr 2023 18:12:40 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH] Remove POWER10_CPU dependency and move PPC_MODULE_FEATURE_P10.
Date: Wed, 12 Apr 2023 14:12:32 -0400
Message-Id: <20230412181232.2051-1-dtsen@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: M4MhzvZC9zJEw5_QZk-eAg2ul5lJwoVC
X-Proofpoint-ORIG-GUID: M4MhzvZC9zJEw5_QZk-eAg2ul5lJwoVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_08,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxlogscore=758 clxscore=1011 mlxscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120155
X-Mailman-Approved-At: Fri, 14 Apr 2023 07:43:48 +1000
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

Remove Power10 dependency in Kconfig and detect Power10 feature at runtime.
Move PPC_MODULE_FEATURE_P10 definition to be in
arch/powerpc/include/asm/cpufeature.h.

Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
---
 arch/powerpc/crypto/Kconfig            | 2 +-
 arch/powerpc/crypto/aes-gcm-p10-glue.c | 1 -
 arch/powerpc/include/asm/cpufeature.h  | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 1f8f02b494e1..7113f9355165 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -96,7 +96,7 @@ config CRYPTO_AES_PPC_SPE
 
 config CRYPTO_AES_GCM_P10
 	tristate "Stitched AES/GCM acceleration support on P10 or later CPU (PPC)"
-	depends on PPC64 && POWER10_CPU && CPU_LITTLE_ENDIAN
+	depends on PPC64 && CPU_LITTLE_ENDIAN
 	select CRYPTO_LIB_AES
 	select CRYPTO_ALGAPI
 	select CRYPTO_AEAD
diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
index 1533c8cdd26f..bd3475f5348d 100644
--- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
+++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
@@ -22,7 +22,6 @@
 #include <linux/module.h>
 #include <linux/types.h>
 
-#define PPC_MODULE_FEATURE_P10	(32 + ilog2(PPC_FEATURE2_ARCH_3_1))
 #define	PPC_ALIGN		16
 #define GCM_IV_SIZE		12
 
diff --git a/arch/powerpc/include/asm/cpufeature.h b/arch/powerpc/include/asm/cpufeature.h
index f6f790a90367..2dcc66225e7f 100644
--- a/arch/powerpc/include/asm/cpufeature.h
+++ b/arch/powerpc/include/asm/cpufeature.h
@@ -22,6 +22,7 @@
  */
 
 #define PPC_MODULE_FEATURE_VEC_CRYPTO			(32 + ilog2(PPC_FEATURE2_VEC_CRYPTO))
+#define PPC_MODULE_FEATURE_P10				(32 + ilog2(PPC_FEATURE2_ARCH_3_1))
 
 #define cpu_feature(x)		(x)
 
-- 
2.31.1

