Return-Path: <linuxppc-dev+bounces-1531-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0C597EC5A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2024 15:36:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XC3st2tfsz2yNv;
	Mon, 23 Sep 2024 23:36:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727098562;
	cv=none; b=lnp7UQHh1OpL6DVFUO9GM/fxVyTi8ScVR5mB6W7oNizGnt0nZEDOJ/f3ONLqohoxvMLm1D91xxG7eR5MTAisjiwWXO8Em7QhmSHDKsnUutTOIpIkT8xKFQdoOy292i0GzwG9yY2JK8wM7qRUnTrQuO4VkvJ3xzYcCX7e23Dt3LgRSD0MV6vwClhPpafPN8ZrQjw1m4NxhUz0XbLVCORnyiTZTqB4tkJV4vNIoQYFggSAv7dTAsntPfHt/TybbZ9hZoDvqS6mg5bsM+VWYASXJjLqpBXOw8Z+KmqqcwqUK59EqYzxnxYSS3nlxR0tfjo1dvAha2DQMSGJy1Hnp4fHlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727098562; c=relaxed/relaxed;
	bh=K6VUVDVlbjknK1JITS3QVF2LIjrXAxju6GiTmbIQkx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GNfZaD98yjFc8TpXsRDcgRC8wjKVZPI1Nyvi/unxNfQamCDnXJ57h/ZbFrvwvGNszm4f33h1epDwpgSp/gOP1LvW7BKzIwypqnoV5umIVytf07HVGieUin2DNZUvGmJGjdunDgLr1CEdQZwPo4hsJRnxWKOgrCX8u/cXLkb1w4RtaW2k4KYREXrg/azLyAeUGALqJcC5ODdI4HrY7hbhwKXahxkjMRbgRGwvKw6+lpSLrER5SulLCk5TF66xoqKSO1yuTo3CSDmdBGTMJAOTqW6KuPUwl0fNspVGk+ijQitObEFo+i+9vVKhwEegUGi2E30QFOdlZLByPB0p3pWBlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KzYL0Jtz; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KzYL0Jtz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XC3ss6pgvz2yNn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:36:01 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48N3QAmf019038;
	Mon, 23 Sep 2024 13:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=K6VUVDVlbjknK1JITS3QVF2LIj
	rXAxju6GiTmbIQkx4=; b=KzYL0JtzygsIgy+RbQQRJC7wt6VXu1BITPSf4zBl1B
	dcB8dE+JztIiaQ3mPqvFEEhHDaHeeOd4qngx7NPZrxXE864WT+LoHE9T3UlAbNZT
	Qdhv3LvkGX2C8J1zlideLrGbNB7bzwhO0M6rGWSTFzcc2BVEHtvoFBuk16saAdWL
	R43XjJn0e18G9u62W0iiV41xRW+AdTiAm67RVUWO909iPAYEslkBIYC5vKfqVSYK
	GhmNRT4+24v7tR/xMFRyuqAeKtfqa4PyNIVRfTuMa60+iptTePQZ/jrlNkDqUb8o
	KLbYUbeiALd9iAZKnl9ZI8mHUJwr5fPpwHxc5lbae8ng==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41skjrc305-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 13:30:45 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48NBI9Xt012507;
	Mon, 23 Sep 2024 13:30:44 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41t9fpptav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 13:30:44 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48NDUhW731916756
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Sep 2024 13:30:43 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B95FE58062;
	Mon, 23 Sep 2024 13:30:43 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EF1458066;
	Mon, 23 Sep 2024 13:30:43 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Sep 2024 13:30:43 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Cc: stable@vger.kernel.org, herbert@gondor.apana.org.au, leitao@debian.org,
        nayna@linux.ibm.com, appro@cryptogams.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au, ltcgcw@linux.vnet.ibm.com, dtsen@us.ibm.com,
        Danny Tsen <dtsen@linux.ibm.com>
Subject: [PATCH 0/3] crypto: Fix data mismatch over ipsec tunnel encrypted/decrypted with ppc64le AES/GCM module.
Date: Mon, 23 Sep 2024 09:30:37 -0400
Message-ID: <20240923133040.4630-1-dtsen@linux.ibm.com>
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
X-Proofpoint-GUID: yvnFcF5vjJnVYZy3BRhiNiuA6wQdrHdK
X-Proofpoint-ORIG-GUID: yvnFcF5vjJnVYZy3BRhiNiuA6wQdrHdK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-23_10,2024-09-23_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409230099

Fix data mismatch over ipsec tunnel encrypted/decrypted with ppc64le AES/GCM module.

This patch is to fix an issue when simd is not usable that data mismatch
may occur. The fix is to register algs as SIMD modules so that the
algorithm is excecuted when SIMD instructions is usable.

A new module rfc4106(gcm(aes)) is also added. Re-write AES/GCM assembly
codes with smaller footprints and small performance gain.

This patch has been tested with the kernel crypto module tcrypt.ko and
has passed the selftest.  The patch is also tested with
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.

Fixes: fd0e9b3e2ee6 ("crypto: p10-aes-gcm - An accelerated AES/GCM stitched implementation")
Fixes: cdcecfd9991f ("crypto: p10-aes-gcm - Glue code for AES/GCM stitched implementation")
Fixes: 45a4672b9a6e2 ("crypto: p10-aes-gcm - Update Kconfig and Makefile")

Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>

Danny Tsen (3):
  crypto: Re-write AES/GCM stitched implementation for ppcle64.
  crypto: Register modules as SIMD modules for ppcle64 AES/GCM algs.
  crypto: added CRYPTO_SIMD in Kconfig for CRYPTO_AES_GCM_P10.

 arch/powerpc/crypto/Kconfig            |    2 +-
 arch/powerpc/crypto/aes-gcm-p10-glue.c |  141 +-
 arch/powerpc/crypto/aes-gcm-p10.S      | 2421 +++++++++++-------------
 3 files changed, 1187 insertions(+), 1377 deletions(-)

-- 
2.43.0


