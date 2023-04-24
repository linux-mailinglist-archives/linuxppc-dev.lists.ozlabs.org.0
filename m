Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C6A6ED4B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 20:48:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4vKb3MMQz3f7r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 04:48:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PnTYr+Ut;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PnTYr+Ut;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4vJg4Gmhz3bfw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 04:47:46 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33OIjWt3005208;
	Mon, 24 Apr 2023 18:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=PU0yTWnCifsPQLIhuXxRyUNG/QoJ66lSgetgnDeM0x0=;
 b=PnTYr+Ut4Lq9NoIL5qtGqNXEJPagn/Bvf6+H0Uddxxr/+dWY2ihQ5uc6axzg0txrZT3w
 kAZd7fJ0XOjIGWqpPhLU7PzYhLp1ocWqqc0hTdJFthWG9enyCbs7Anly4nXueMbinun+
 XHPBHsuR1Uh14D8MTIuyKN2FD0lCNkppEgY8hzWFXQ2wKNIKYJs0AkjgLzVTiSk60MuS
 HlzA0E4iGfVqyn9UXYPI8qFU341VMjjdk4R8HkB1jgIYAs7JTF5ChSL7COZRQU5Xwzbb
 awuQKdV/6KEISHjfoue8qzhuYeMBiTmDRWSDhhwSno3k9+L+WkgaIba+rbEUfFy0WSCn Cw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q5w76cj3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 18:47:32 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33OIBntJ014357;
	Mon, 24 Apr 2023 18:47:31 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3q4777mge5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 18:47:30 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33OIlTk020840748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Apr 2023 18:47:29 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21FAC5805A;
	Mon, 24 Apr 2023 18:47:29 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E702A58051;
	Mon, 24 Apr 2023 18:47:28 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Apr 2023 18:47:28 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 0/5] crypto: Accelerated Chacha20/Poly1305 implementation
Date: Mon, 24 Apr 2023 14:47:21 -0400
Message-Id: <20230424184726.2091-1-dtsen@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I01tP0s8TSId33nmyRRvCVMuahHNnH4n
X-Proofpoint-ORIG-GUID: I01tP0s8TSId33nmyRRvCVMuahHNnH4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_11,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=536
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304240167
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
 arch/powerpc/crypto/chacha-p10-glue.c   |  223 +++++
 arch/powerpc/crypto/chacha-p10le-8x.S   |  842 ++++++++++++++++++
 arch/powerpc/crypto/poly1305-p10-glue.c |  186 ++++
 arch/powerpc/crypto/poly1305-p10le_64.S | 1075 +++++++++++++++++++++++
 6 files changed, 2356 insertions(+)
 create mode 100644 arch/powerpc/crypto/chacha-p10-glue.c
 create mode 100644 arch/powerpc/crypto/chacha-p10le-8x.S
 create mode 100644 arch/powerpc/crypto/poly1305-p10-glue.c
 create mode 100644 arch/powerpc/crypto/poly1305-p10le_64.S

-- 
2.31.1

