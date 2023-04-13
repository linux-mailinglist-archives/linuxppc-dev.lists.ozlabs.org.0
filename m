Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFB36E16A9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 23:48:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PyCrK4NlXz3fXb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 07:48:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r0GRWg6o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r0GRWg6o;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py9831wX2z3fCJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 05:46:58 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33DJkde9010136;
	Thu, 13 Apr 2023 19:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=9bXJxQDpqf1FHLqGzpmDLwhqgj0ZIvKATcvCppLD37c=;
 b=r0GRWg6onBfCy+Ud/Ja+kk63Q68i4wgCjw68rZfbSVHGeLCdP0OLL8apQzbXMYxGqkTY
 Lad0Dv7Fmj3YK3Uf4pTTpzs9BGU61zkuiHQbIqnJAM+L4Ff4o34HoG52I5LIndL25Km1
 yvCkBGZtlEo3ALzAuhooNTLqlzAhTj75l8orUnrm/GFc5xrO+c0vPTRpJtH8+nbqeArT
 0e7g7iaw4YfMvhI+IWm3DKgm8kJt4PEjNfM4sEQsI2Y5vSfAm0xFIhWEiCaySOxTMHFN
 f71Q7IqWw2vEBq/YTvMKu0077GXtMvWt1v7IEfyt4ZbNPi6H0q7wjo+hAnZx8mansaiZ Bw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pxmf6hruc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 19:46:40 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33DGbSCn020774;
	Thu, 13 Apr 2023 19:46:39 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3pu0jhd4qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 19:46:39 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33DJkbYm22151704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Apr 2023 19:46:37 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A35715803F;
	Thu, 13 Apr 2023 19:46:37 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16C1A58054;
	Thu, 13 Apr 2023 19:46:37 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 13 Apr 2023 19:46:37 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 0/2] Remove POWER10_CPU dependency and move PPC_MODULE_FEATURE_P10.
Date: Thu, 13 Apr 2023 15:46:23 -0400
Message-Id: <20230413194625.10631-1-dtsen@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kkHix0dOBNVrQxcEppfrkjkeKkloETFL
X-Proofpoint-ORIG-GUID: kkHix0dOBNVrQxcEppfrkjkeKkloETFL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_14,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=639
 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304130174
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

Danny Tsen (2):
  Kconfig: Remove POWER10_CPU dependency.
  aes-gcm-p10-glue.c, cpufeature.h: Move Power10 feature, PPC_MODULE_FEATURE_P10.

 arch/powerpc/crypto/Kconfig            | 2 +-
 arch/powerpc/crypto/aes-gcm-p10-glue.c | 1 -
 arch/powerpc/include/asm/cpufeature.h  | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.31.1

