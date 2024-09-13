Return-Path: <linuxppc-dev+bounces-1338-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C83DE9782E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 16:47:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4xxN5yVwz2xfK;
	Sat, 14 Sep 2024 00:47:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726238872;
	cv=none; b=Q2po1LIXtMe2zApzYoQsxHDNGIl5j1QIlEBt0bmcKiHNWdcG1GAqbUzGLZWIn3DBtRiCREDZlzV3i1tsHk9dhKWsuBHTvpUtH4h66qcSu/KC/einmYxmDiylzkqGeDAZmAVo6cQLiPHXkwpOpe2QkTidn3ci6Gb27a51ySsTm/dL1iV42c/iJsEFTgSn1AYe8FWx5qU6TG0PHTjfd69S42xNI0yZI5n5xY6jjBlW2vDhDF2bvXhhmW9g0bQwp3RRiWYGNMhkZknUVXXap9lcpBbzd4Ff85Wf6SgN2OYC7Qh06pKMcvImC4iMf+mNU/H+3PCo9cKyWM7y2j/Go0rIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726238872; c=relaxed/relaxed;
	bh=aA0VD6ILZwVsRCqF6gyMIXcvETRy4AHsm47dMSMexos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NG5voxjlH31LGXAjWDXhxjBnltoul8zc/Ho1al7EF7NojSlQbmPXjnZl1jY+P53dDJsgDKAdu6iwb/Yst+jqTImTz7Fw2SNXsEH5KrH149NTnHaabBxP59niSNyFApbt1AU29/57O/ZDqX81NBJsDB9Al/4daPIwzgTYi2yif+t2NBba675iccWdhPBSoBMWKEDB66g56ve2zcLgNtv/A5TwCe+9IvNP6nr8nArsfXFBBEwoddC8ibX2ru92coccVGSz6R5Cm6mj7ioP1+UIOBl9yIdgr7OcOVfff+s89gosWrFyVANyRatHmLlIS1LMEdb8GVHVbdfoUrtdGy1lWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HZ4lmL5D; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HZ4lmL5D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4xxN2WdDz2xCj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 00:47:51 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48D74ZVp028394;
	Fri, 13 Sep 2024 14:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=aA0VD6ILZwVsRCqF6gyMIXcvET
	Ry4AHsm47dMSMexos=; b=HZ4lmL5DfAEi7SrWDWljVLFu/HrpBbdPmmOfbd5XNZ
	DalIyxewb9m7uYdGawvPM3GwWsNir1FVhgzJPUx7n1qghWrp4Jrn5/p230j2NLvB
	PzIwecRik9bz/0aOX3n90CY8ecNCcvyNG+L22PaFgVkLsKaZUTBzoeXZO9vGQ4Xr
	2VyKbbWO/sRrfwv6qgDmL4GISwGTM5IGB7UJxjn0+pq8+XSHh4LhfiJuNmbQ0vNO
	SDXFhI6gGUzO+IJFwMiVLVxOkHL0l1PvhioAVpWqOyFIYWGszElhjN7WRyKx6pQW
	4ZQBSQOOhuTfjtfTAfT6s+j6szsR67+P3HmG+1j5sLIw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41geg02de4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 14:42:37 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48DCgFTA027389;
	Fri, 13 Sep 2024 14:42:36 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 41h3v3pev3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 14:42:36 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48DEgYu522413890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Sep 2024 14:42:35 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B762758058;
	Fri, 13 Sep 2024 14:42:34 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BD9858059;
	Fri, 13 Sep 2024 14:42:34 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Sep 2024 14:42:34 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Cc: stable@vger.kernel.org, herbert@gondor.apana.org.au, leitao@debian.org,
        nayna@linux.ibm.com, appro@cryptogams.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au, ltcgcw@linux.vnet.ibm.com, dtsen@us.ibm.com,
        Danny Tsen <dtsen@linux.ibm.com>
Subject: [PATCH v2] crypto: Removing CRYPTO_AES_GCM_P10.
Date: Fri, 13 Sep 2024 10:42:23 -0400
Message-ID: <20240913144223.1783162-1-dtsen@linux.ibm.com>
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
X-Proofpoint-GUID: -CEw3quGPWS97YQJeKZRXaB0Yg4lcMyu
X-Proofpoint-ORIG-GUID: -CEw3quGPWS97YQJeKZRXaB0Yg4lcMyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_11,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=808 priorityscore=1501
 adultscore=0 clxscore=1011 spamscore=0 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130102

Disabling CRYPTO_AES_GCM_P10 in Kconfig first so that we can apply the
subsequent patches to fix data mismatch over ipsec tunnel.

Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
---
 arch/powerpc/crypto/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 09ebcbdfb34f..46a4c85e85e2 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -107,6 +107,7 @@ config CRYPTO_AES_PPC_SPE
 
 config CRYPTO_AES_GCM_P10
 	tristate "Stitched AES/GCM acceleration support on P10 or later CPU (PPC)"
+	depends on BROKEN
 	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
 	select CRYPTO_LIB_AES
 	select CRYPTO_ALGAPI
-- 
2.43.0


