Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2936EFAC8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 21:13:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q67nl4cCCz3fDv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 05:13:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H/PJ+d8I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H/PJ+d8I;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q67ls5M6Xz3ccl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Apr 2023 05:12:09 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33QJ9dwD028793;
	Wed, 26 Apr 2023 19:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=yhvrAIKR5O57Y5/51eA5aOty3mrW59iWoKUgs2oPvAQ=;
 b=H/PJ+d8IO01PGaMx8ecDjU40okUO18C8qBr2ImM4Pp6VBkuvVuZGSN+CxsqRC8HucE0T
 jQKg9mUUiGdQ1I7/tUqOH5/jehwnybZUtKMGK8pITFKTl4U3kU9hqL/H6NNx50xfmVaP
 vrjj/bVkFIc/y58KvRc+0I6xPJDVZAO7F+BOItIx9F5jzsMRlXn/grV0jGVf14IuttAn
 BexiSvvAarQ/lX9YWXgHzC8zkIHWpu2Zdw8NjbLF0N0rlJIFGuGfFXU6+ultiZP/QtOD
 hZtBxv8a4v7i/j1JnuePzgFPInPU/TqRxmvyaNutTDVdM6WwTc8FpjzuEH71eSb9s3mP Ag== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q78023apk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Apr 2023 19:11:53 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33QIYbWi009083;
	Wed, 26 Apr 2023 19:11:52 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3q4778cgba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Apr 2023 19:11:52 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33QJBoqh36438288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Apr 2023 19:11:50 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71C4C58059;
	Wed, 26 Apr 2023 19:11:50 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CCE258055;
	Wed, 26 Apr 2023 19:11:50 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Apr 2023 19:11:50 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 0/5] crypto: Accelerated Chacha20/Poly1305 implementation
Date: Wed, 26 Apr 2023 15:11:42 -0400
Message-Id: <20230426191147.60610-1-dtsen@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1iYHzCvbW89hit0Gy51rS9MZavwYgW2Q
X-Proofpoint-ORIG-GUID: 1iYHzCvbW89hit0Gy51rS9MZavwYgW2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_10,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 phishscore=0 mlxlogscore=536 clxscore=1015 priorityscore=1501
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

This patch series provide an accelerated/optimized Chacha20 and Poly1305
implementation for Power10 or later CPU (ppc64le).  This module
implements algorithm specified in RFC7539.  The implementation
provides 3.5X better performance than the baseline for Chacha20 and
Poly1305 individually and 1.5X improvement for Chacha20/Poly1305
operation.

This patch has been tested with the kernel crypto module tcrypt.ko and
has passed the selftest.  The patch is also tested with
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.


Danny Tsen (5):
  An optimized Chacha20 implementation with 8-way unrolling for ppc64le.
  Glue code for optmized Chacha20 implementation for ppc64le.
  An optimized Poly1305 implementation with 4-way unrolling for ppc64le.
  Glue code for optmized Poly1305 implementation for ppc64le.
  Update Kconfig and Makefile.

 arch/powerpc/crypto/Kconfig             |   26 +
 arch/powerpc/crypto/Makefile            |    4 +
 arch/powerpc/crypto/chacha-p10-glue.c   |  221 +++++
 arch/powerpc/crypto/chacha-p10le-8x.S   |  842 ++++++++++++++++++
 arch/powerpc/crypto/poly1305-p10-glue.c |  186 ++++
 arch/powerpc/crypto/poly1305-p10le_64.S | 1075 +++++++++++++++++++++++
 6 files changed, 2354 insertions(+)
 create mode 100644 arch/powerpc/crypto/chacha-p10-glue.c
 create mode 100644 arch/powerpc/crypto/chacha-p10le-8x.S
 create mode 100644 arch/powerpc/crypto/poly1305-p10-glue.c
 create mode 100644 arch/powerpc/crypto/poly1305-p10le_64.S

-- 
2.31.1

