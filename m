Return-Path: <linuxppc-dev+bounces-2365-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BEF9A3767
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 09:40:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVGpD5clfz3blb;
	Fri, 18 Oct 2024 18:40:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729237236;
	cv=none; b=GIUA44d/+oxqZp2G8hALUusLTAb4HviO93ZqDq6xczyHDT8kfu0aIQNxdoAV2r/FUUAuwUw/30SBbjOsbnj42Gg3SZlAmyoTbhF/cbu+z+ILebXeQjPNd31D1p/f1BlCHOEuguwCPZk5RlI6kxBqjl1HsAueIdVSCnFkppVFQ+hLeC7hyMYxgTn9qLAWWvwr5dWvBdtirBKCaHlozvp12eERRMUNSwf1jJonLu8lhksSMLU/aX63G5rfueGSOwXZ/qKt3xng+YT42eaRTCJ0Y9YmDQ2M2Cum6aQtHYiMjuuAvR04tysHkwQAsBquOP+Xd2OUGCQTPgjMfA5mGduTZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729237236; c=relaxed/relaxed;
	bh=aB4+XUWJxp+dZ02JgErKT/qQEJA9r3SbzM+17IkQ7Yw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=kAOKfkYvzEDpoOsdYK/i/5SdUGBCOR30nKsHfwVcQtx8VRn7EdPRDNd/ZwdTMO5J/URuxUBy7I8Fc3ke3s3sP1fuTd+n2wWUGEgV2KIRmOQWB89+kIcq88azySwgaw6lTmdUwEeNjix7F12F7NcrV/poCFlNM306sq+azjDB0aL9WHDC9X5IZXe1jbM/LI8wRaBCWsdhyTxiJ9X1+ybRsNkK3GwygqB1aREhghmEASKNWkt0ArA4w9X/mNO8IrWsbjDKsW1Omx1RKkiAF5uHLDsh0C8BzlJ0msuYhVTCeDGWRU601anxLuJ9KWGKISIGUPjeisipymo45+RovXbFpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lLcg+raO; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lLcg+raO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVGpC10hVz3bkc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 18:40:34 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HJS9Bs025117;
	Fri, 18 Oct 2024 07:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=aB4+XUWJxp+dZ02JgErKT/qQEJA9
	r3SbzM+17IkQ7Yw=; b=lLcg+raOhpkvOZUH182ts0atCRmjXpOpQcjMjNOkWDlA
	LKdeSszPq7xTMN9fBlDz35YMQpiyzi0j5vXl+/x4EM344rhIh16E4uE2735rRMd3
	kvB9X/yS3WMGoR9m4WIdUyK35v+yWSLni9dSvAqlSdUYMI0jX1paWUei+Dyad3Vl
	RhboiYo4vi768L0GhCs+0TuSTXwD/QYLfMA7f70KZsFRXANTi3Oc4Qg00UqGvPhr
	GUO6ZnmQnkQ1zkQq9dVqqKb3rcUmE3rxCOp6KHR0GychReABSm4vA3es2vqpgbBx
	+Ehsm0vcxj9E+VX9Gia3CXOtWuyepp/GAe26IYO+wQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42asbd7kmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:40:22 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49I7eLO8011160;
	Fri, 18 Oct 2024 07:40:21 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42asbd7km8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:40:21 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49I6Spkl005946;
	Fri, 18 Oct 2024 07:40:20 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 428651atnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:40:20 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49I7eJKl20841106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Oct 2024 07:40:20 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D2BEB58058;
	Fri, 18 Oct 2024 07:40:19 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 105CD58057;
	Fri, 18 Oct 2024 07:40:16 +0000 (GMT)
Received: from [9.43.51.48] (unknown [9.43.51.48])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Oct 2024 07:40:15 +0000 (GMT)
Message-ID: <56940325-8474-42f7-97b4-fabbd3ea0da0@linux.ibm.com>
Date: Fri, 18 Oct 2024 13:10:13 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.12-5 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fjd9GPTKh4Q1PJa0jkezPHKo29pJuN8m
X-Proofpoint-GUID: XQT0JPKv-g7xJhvfE-TsIWA-TeiKoc2C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 clxscore=1011 adultscore=0 priorityscore=1501 mlxlogscore=660
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180045
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull my first pullrequest for powerpc tree.

My gpg key is available in pgpkeys.git and it is signed by Michael Ellerman and others.

https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git/commit/?id=5931604633197aa5cdbf6c4c9de0f08ab931615f

Please pull some more powerpc fixes for 6.12:

The following changes since commit 8956c582ac6b1693a351230179f898979dd00bdf:

  powerpc/8xx: Fix kernel DTLB miss on dcbz (2024-10-11 15:53:06 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.12-5

for you to fetch changes up to cf8989d20d64ad702a6210c11a0347ebf3852aa7:

  powerpc/powernv: Free name on error in opal_event_init() (2024-10-16 09:26:50 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.12 #5

 - To prevent possible memory leak, free "name" on error in opal_event_init()

Thanks to: Michael Ellerman, 2639161967.

- ------------------------------------------------------------------
Michael Ellerman (1):
      powerpc/powernv: Free name on error in opal_event_init()


 arch/powerpc/platforms/powernv/opal-irqchip.c | 1 +
 1 file changed, 1 insertion(+)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmcSCXYACgkQpnEsdPSH
ZJQUwRAAjPQqxLvWlexOaz8Q+bIW04WxENK9t2ke4njWuBJsh7N2k4F+hphGtTjU
qLBU+MeawQoAIjMptcSLoruxIQsYdGqN/oFp+u5+kKEVwC2aTDJBHAw4FnjxUJQ4
ztZk5vc9/PuvrafRfEuIsujIvmuCHFh9gzflgQbgArXZ2NFKKdy+CyBonryO0/DQ
5IXO8S91PCx20xhveLWwIdUIpK1bBZQmttwx4QWLNmB7ZtbOv05h2tlDo0Fwv1eC
oAWitl6r85ISBcSXGKu6teIIhxMSi4l2/LJl1cuhl4v37r6JXi1EPkAtvMQQK40P
tahvl3/8Oxb8QRO/cvDS23jM588AJ5zIassRlYucRWrJJ4G32MvK/4Ftz+Hs0kF9
ioADX1tl416w9wpMtGanSao1fieNQF2RnuTm55DFtSEzZOETxayPjDK2hg3s/iy1
qp2sFKRdSx+Ljbm/WDDGN2o6PlwWUS3HOu9d/CJEwpGu9Sv0zyOlxLHDteRR5fho
BYLTBRI10T92pFMFCG1/gli27fx7OiPud44vc9gk9a9ymO8oF4+/IVLDSX6gpFiY
uuM5s/P6sGkKCuIH85nUQZQPgK0z3T8zdt4hqUTepBsoBd24BRf0abOzwUkENXdB
UxWylfW9jbhYAZtqhSXYFBSKOzXpz3vGBRuUKQ5GG+3lA+fIjng=
=Xm97
-----END PGP SIGNATURE-----

