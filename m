Return-Path: <linuxppc-dev+bounces-4074-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B12029F02FE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 04:21:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8ZNn306Gz30Vq;
	Fri, 13 Dec 2024 14:20:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734060057;
	cv=none; b=ELoiyjVOHPco/RlQuiKtJ3GY+ejBaRg9/Ys+3IpQVxe4He70Jhvs1dBvBgJBs+ptsMe80UGBMn7FGhxtIUgkjQPsmTxIdT2TkVmntmzfUCUPhpYneHiFFaSf9lI5x8uCQlyUSTJK8ppf0S7wDhcTgQTzBqfS+waLuXBs+NqqWlNCykkrke3WAsv8Crros4jWygDaAJggU8J7p+sRDDjD5mCFrLMdBTG4YgmbrSbVbwlt2w6MOPa0JrP1wZCMQNjQr/RFEfXysLwmfmUbP09qlL5MAUdW4iMYP5JQFlg1qK3i755LlifxHEy9yjsU2XIBaSyyXjS6DIGL8IHR0BilSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734060057; c=relaxed/relaxed;
	bh=9+fIzCva4GQg1OSuZlC45mBKaO6MZwL8QJAA6yGsi20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zk5lWEkOIi/T8GXIK5nRBoPs4AuIvvL8T5lMlbBvYB2BSG+xgoTR2ZQq6KWS8dyO2+XT7J3emHtoivTWh7wgnN0TPr/YTAZEMBZ6DXXAMMMpTGVlWJyZXVsv/gdSdKCOfu3zdvcL3JSS+rTLBe1m9/Lb1+fT53xfXKFB/owKYXLFyAm5Gl+FKBGOoRDnMv7a6b2u08ZH3jZf45zrJDrMSMtb7XtxnclwMP3AkeGN09VnHbiuBOu+nDx0xLPH7ouAFdXCEyL9efUIF8ZJYagskXPsMJx1+giof2V2oaGsso24BTtNDW1jUumbLi/jpsEGIxDiJO7yEo1sRbnwoD2G2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cddgnLm+; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cddgnLm+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8ZNm0cCLz2yjg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 14:20:55 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCNbqv7003761;
	Fri, 13 Dec 2024 03:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9+fIzC
	va4GQg1OSuZlC45mBKaO6MZwL8QJAA6yGsi20=; b=cddgnLm+x0+E544b0pObyu
	8FrNIMfZtkUrya86+s2rQjwRPJCo7j4wU8af64xl2EUmMSJKsrSlcJlBbf98ofpO
	hxYAlZVDzonGDFohUbiW4lJd+3xADGK2zUmuQDW07xcSperkUlNPFn0NdKkEw+CU
	+J0rWjMOSA3nTf6R3hCiu84aOJNA7oEyXz87y3mn2tCf2QcWngZgTgeCBwIXHZ5f
	30k9CCL6La5yULCm8pqNVAOB1a7bFB9E9SXN5lIIwJMWW7cDG2K5sMW2MCFJRErO
	sDfdLGOVQj8LiSnEGKq7Tyg/hkdovP45tUt2XNQ3cJxyL6sIyrsMfxkSkZhq8ALQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ce0xxm7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 03:20:40 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BD3JZCM020320;
	Fri, 13 Dec 2024 03:20:40 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ce0xxm7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 03:20:40 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCNeuTT016911;
	Fri, 13 Dec 2024 03:20:39 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43d12ym1ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 03:20:39 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BD3KbBg34800168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 03:20:37 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C35A20043;
	Fri, 13 Dec 2024 03:20:37 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 014EA20040;
	Fri, 13 Dec 2024 03:20:36 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Dec 2024 03:20:35 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/32: Replace mulhdu() by mul_u64_u64_shr()
Date: Fri, 13 Dec 2024 08:50:35 +0530
Message-ID: <173405995386.325393.4617269983686036811.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <f29e473c193c87bdbd36b209dfdee99d2f0c60dc.1733566130.git.christophe.leroy@csgroup.eu>
References: <f29e473c193c87bdbd36b209dfdee99d2f0c60dc.1733566130.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xQ1LfHSI39Yldf1BlT4AdPtFZ1Au5TgC
X-Proofpoint-ORIG-GUID: pcrq6ffKa0ToSslYcjSmOyXyhLTqB_wW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 mlxlogscore=788
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130022
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 07 Dec 2024 11:09:27 +0100, Christophe Leroy wrote:
> Using mul_u64_u64_shr() provides similar calculation as mulhdu()
> assembly function, but enables inlining by the compiler.
> 
> The home-made assembly function had special handling for when one of
> the arguments is not a fully populated u64 but time functions use it
> to multiply timebase by a calculated scale which is constructed to
> have most significant bit set.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/32: Replace mulhdu() by mul_u64_u64_shr()
      https://git.kernel.org/powerpc/c/2a17a5bebc9aa7f59e99676350866adc41577c03

Thanks

