Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D46968C5A66
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 19:40:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k11JKdhY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vf3Xj3DM9z30Vq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 03:40:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k11JKdhY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vf3W90MtDz30Tj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 03:39:00 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44EFfnZ9022109;
	Tue, 14 May 2024 17:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=s380DvIVUvrqNkCPvWQHywF6rq8I55TzcUuDNMTmk7A=;
 b=k11JKdhYJkXi0FlErdzjhCBQ1bHqwdHmRof8d50Q8Tl1v4TuaQWENszEj/alcX+X6562
 btV3Rxoplz78bJv17ISs6fG5d5DUBVm3GbqhQny1lbCsV2rNxPQYt0v9xKoV0keS+rjc
 jM7pIcGU2tZXKKJxgAFSx/tCAyQM0kveCvkktdxzbmp0jFcr9AdR9q0d8m6hDRuK0EVq
 DnK27RHAkKqeEMS3V4E7GfCbk3I2pLu+zsOqm/DJ/89xFKcak1XJbmSVFcS+J7SAi3HQ
 LiBO1oIG5IBaeQ+GtCJMhFKtiqjmc4LbgTKWA7fXx4l+T9xDIDrqtAqImiszOe0N+LEi LQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y4a9brbdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 17:38:44 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44EFOu8S002288;
	Tue, 14 May 2024 17:38:43 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2m0p6r78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 17:38:43 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44EHcePx25362850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 17:38:42 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 47E9758052;
	Tue, 14 May 2024 17:38:40 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7F0D5805D;
	Tue, 14 May 2024 17:38:39 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 May 2024 17:38:39 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 0/3] crypto: X25519 supports for ppc64le
Date: Tue, 14 May 2024 13:38:32 -0400
Message-Id: <20240514173835.4814-1-dtsen@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O4MzfgNaX7KpN4B9YAgFpEOV1qf4shVt
X-Proofpoint-GUID: O4MzfgNaX7KpN4B9YAgFpEOV1qf4shVt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_10,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 mlxlogscore=663 malwarescore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405140124
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

This patch series provide X25519 support for ppc64le with a new module
curve25519-ppc64le.

The implementation is based on CRYPTOGAMs perl output from x25519-ppc64.pl.
Modified and added 3 supporting functions.

This patch has passed the selftest by running modprobe
curve25519-ppc64le.

Danny Tsen (3):
  X25519 low-level primitives for ppc64le.
  X25519 core functions to handle scalar multiplication for ppc64le.
  Update Kconfig and Makefile.

 arch/powerpc/crypto/Kconfig                   |  11 +
 arch/powerpc/crypto/Makefile                  |   2 +
 arch/powerpc/crypto/curve25519-ppc64le-core.c | 299 ++++++++
 arch/powerpc/crypto/curve25519-ppc64le_asm.S  | 648 ++++++++++++++++++
 4 files changed, 960 insertions(+)
 create mode 100644 arch/powerpc/crypto/curve25519-ppc64le-core.c
 create mode 100644 arch/powerpc/crypto/curve25519-ppc64le_asm.S

-- 
2.31.1

