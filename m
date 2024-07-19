Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E9C9371EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 03:15:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SL1+xeZ/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQBYX33XPz3dRj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 11:15:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SL1+xeZ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=quic_jjohnson@quicinc.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQBXr6pwyz3cSP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2024 11:14:35 +1000 (AEST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J0xWXq017355;
	Fri, 19 Jul 2024 01:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zHbhBFyOllyjuCCAoTfJqv
	bJVQQNgmBpoTjvwW2kojM=; b=SL1+xeZ/TLoJ42dJK3+7PKiiUcdiGJrJyMPO+O
	VJV3ufsk8ZXdvaOa3dmlPb5Ie1SREOXZnJ0MAbhrxY12vIn+CfSpnsyRAgXQQdzP
	F2MGTVAmqNYCnxMrjaMGiiW+LZXHopuU0s35LrLJtQlpJTLO1D5FkWSH7eUdqyzu
	ph1BPXFgI6/41jteKodVNGEDqlAjZYSZsrcEBDeLh8VBj1ACBi6YoF5cGazrcpi8
	l9aascroSiNrIG3oNrds/cJd4j26UWzJJCk2eGhmPDhvmYW6fIQAI/g6fKXV9ukv
	3mTYSruBw8DIAGFlqP8Axm8gOR76U6nwhnQlGXjL4wTozLkQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe33g0r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 01:14:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46J1EIhK017016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 01:14:18 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Jul
 2024 18:14:18 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 18 Jul 2024 18:14:18 -0700
Subject: [PATCH] crypto: ppc/curve25519 - add missing MODULE_DESCRIPTION()
 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240718-md-powerpc-arch-powerpc-crypto-v1-1-b23a1989248e@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAOm9mWYC/z3NQQ6CMBCF4auQWTtJKUbRqxgXw3SwXdA2U4IYw
 t2txrj8Fu9/GxTRIAWuzQYqSyghxYr20AB7ig/B4KrBGns057bHyWFOT9HMSMr+D9ZXnhNavpy
 63jojNEKNZJUxrN+D2716oCI4KEX2n+xvNVGZRWHf3wtmQyOQAAAA
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
	<npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>,
        Danny Tsen <dtsen@linux.ibm.com>
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AHCmfBGGce-eTHgTuaMnKcweacq8a52Y
X-Proofpoint-GUID: AHCmfBGGce-eTHgTuaMnKcweacq8a52Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_18,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407190007
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, Jeff
 Johnson <quic_jjohnson@quicinc.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
description is missing"), a module without a MODULE_DESCRIPTION() will
result in a warning with make W=1. The following warning is being
observed when building ppc64le with CRYPTO_CURVE25519_PPC64=m:

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/crypto/curve25519-ppc64le.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 arch/powerpc/crypto/curve25519-ppc64le-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/crypto/curve25519-ppc64le-core.c b/arch/powerpc/crypto/curve25519-ppc64le-core.c
index 4e3e44ea4484..f7810be0b292 100644
--- a/arch/powerpc/crypto/curve25519-ppc64le-core.c
+++ b/arch/powerpc/crypto/curve25519-ppc64le-core.c
@@ -295,5 +295,6 @@ module_exit(curve25519_mod_exit);
 
 MODULE_ALIAS_CRYPTO("curve25519");
 MODULE_ALIAS_CRYPTO("curve25519-ppc64le");
+MODULE_DESCRIPTION("PPC64le Curve25519 scalar multiplication with 51 bits limbs");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Danny Tsen <dtsen@us.ibm.com>");

---
base-commit: df1e9791998a92fe9f1e7d3f031b34daaad39e2f
change-id: 20240718-md-powerpc-arch-powerpc-crypto-2c96382d0eaf

