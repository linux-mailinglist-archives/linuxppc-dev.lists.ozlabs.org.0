Return-Path: <linuxppc-dev+bounces-9393-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC9BADAC5D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jun 2025 11:51:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bLQHj5X1bz2xfB;
	Mon, 16 Jun 2025 19:51:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750067473;
	cv=none; b=odB37Cko8jz+Vc/rb0Kir5kqAWDyONjuoppKEe5pjlLbncI7FH6IE5xRt7QmmUHWVNbjoynuSqixn+2tQ6KUgvwd8sRPrCPYLKyijbESSLJdHEf7eUQEcxrH2Z4ADciVYIVLw24PHIgAiNT3KuVMPJIlRt+5dsNwcsGX9rTE/8xDhsA9+qbkGqBIF5BX3NApQ25XoRAIa6YEBCLF+bRkWOvx11SNuWzwnuDw+ressgX2F3ZO/zeegBmNIXGq2sN4SpZ2fBpnoT0mvwW5XNEkyxdjk0a0iw8wkXkZof0ZJUISaAUlmb031Uer47xGqWPVZlStYWH2JfHIJfj+uzp2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750067473; c=relaxed/relaxed;
	bh=98MNDMpqZTSUPDBDmSnnEsdlpYfJx/Fn3bMpLgmmmYU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=RVRAnT2//K2hONth0HiuP9joBewhepkDCUBNMSCBDmfJ8Eyll+/Yd335wqS22hMrvZ81ieU+zYecArOXJEGGhbrS4cbmHagVwyTq867SmFJzbpDDjl0afYkdQQOrGHtvROPmOkHBAakay4db586Oj56hJ6insO22q6eRSO+1hpeHSBs+kehkhuHiyYcSQFyjH8p26LA8dy6DsGKE4kx6fWxlb7/XEiSbV2GaAXuwjq/VP2G8Ri61LNW61RYMv2HNusfBcW0P5pArI6p2aazQn4kOylxVYKdjwLYtIaNWPbu2U8bzSRhgVOtRfgx3oXZJ8rN7AcqIbWctQSIebaTBiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tog76yPz; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tog76yPz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bLQHh5nKVz2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jun 2025 19:51:12 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G32qrk016045;
	Mon, 16 Jun 2025 09:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=98MNDMpqZTSUPDBDmSnnEsdlpYfJ
	x/Fn3bMpLgmmmYU=; b=Tog76yPz3YHUDAJiCbFxWSaAbn0HDoszUroBjHdjEtdY
	oxTwQbpUm1HCJi4XkohCfiu4zoTf/KI7wTLTEM6K6W8XsNwK3wlaOR97ijJDggGv
	ArTHONTUozLlwIjcBT3CJTPuLGS7p0BVnl2yGxEHd2aeNrhssbhxIr84uGa5OJsI
	+X1qInagSw05Xlu7y/+EFszZIgqXGqDmYdAkW8io4INQQbFYGSg6sPQqu+Lwv99y
	iYIndI+GdgGc6a4m32Nw5/7eFuZWIxShsa3PSuNigDjnooL3kd/hQgEnT7rOpnPX
	NeksWbPeLRQ2fh60VOcrYYINUpR6nnwPrUNF/oI7mw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790tds2xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 09:50:55 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55G9YD7p008557;
	Mon, 16 Jun 2025 09:50:54 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790tds2xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 09:50:54 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55G7XTXv010817;
	Mon, 16 Jun 2025 09:50:53 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 479kdt5qq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 09:50:53 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55G9orDV10879740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 09:50:53 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3AD95805B;
	Mon, 16 Jun 2025 09:50:52 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E98CE5805C;
	Mon, 16 Jun 2025 09:50:49 +0000 (GMT)
Received: from [9.204.206.207] (unknown [9.204.206.207])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Jun 2025 09:50:49 +0000 (GMT)
Message-ID: <81e04fa6-2870-4b0e-82aa-602f9435a848@linux.ibm.com>
Date: Mon, 16 Jun 2025 15:20:48 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, j.ne@posteo.net,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        nnmlinux@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.16-3 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zFH7w9_vervdXEVUb4kQuu2nEypuXHIZ
X-Proofpoint-GUID: V5JGqvKaX-sx4vZbGCZ62RJ1yrPyFTRu
X-Authority-Analysis: v=2.4 cv=c92rQQ9l c=1 sm=1 tr=0 ts=684fe8ff cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=BtL6d0wylExIv2mDCBkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA2MiBTYWx0ZWRfX5h13Ve8iySnl LIJLhbagCLJ6jViKG4qUqZ6DSlVlIa8VXUcgrEoIXFiCYbEo27pmR4BoHVNz8Fwf7WnqEor5LL5 o9rfsjMoXv0KJdis1drKkQ/A9CkR0slEfboEXJ8IL4LsEPneInogaJcPRCkGEfWMTim43HjIFZ5
 ek4hoKSczkKMMoZVJ0elYPgMF7XgwoGTnZcmES9j+Y2yNftiBnT4Pyoqfa8BLBKA99ljGXXnuVn iAOVZ0khxc1VBC/OArJEPj9Src4af0qg3ZhrgA/qZD/ArZW7lFWnsV4OawfN/WlbwA16myWiBbK 56aupHyYcbeWIEpSNAXAEykKUUpz5pBg+Wg14X2/dI//iUFTnsBuugIdwwwmVyNQ7XE8JFlBs67
 QUeBzYce7VAWeIt+4Nt3/1KXd5dpJRuBtG5kCwTva8FeKanVGzS3OMOb2eMVyyJFB+QMoQuJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=939 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160062
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc fixes for 6.16:

The following changes since commit 0d67f0dee6c9176bc09a5482dd7346e3a0f14d0b:

  powerpc/vas: Return -EINVAL if the offset is non-zero in mmap() (2025-06-10 07:56:41 +0530)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.16-3

for you to fetch changes up to ab107276607af90b13a5994997e19b7b9731e251:

  powerpc: Fix struct termio related ioctl macros (2025-06-13 22:18:50 +0530)

- ------------------------------------------------------------------
powerpc fixes for 6.16 #3

 - Fix to handle VDSO32 with pcrel
 - Couple of dts fixes in microwatt and mpc8315erdb
 - Fix to handle PE bridge reconfiguration in VFIO EEH recovery path
 - Fix ioctl macros related to struct termio

Thanks to: Christophe Leroy, Ganesh Goudar, J. Neuschäfer, Justin M. Forbes, Michael Ellerman, Narayana Murty N, Tulio Magno, Vaibhav Jain

- ------------------------------------------------------------------
Christophe Leroy (1):
      powerpc/vdso: Fix build of VDSO32 with pcrel

J. Neuschäfer (2):
      powerpc/microwatt: Fix model property in device tree
      powerpc: dts: mpc8315erdb: Add GPIO controller node

Madhavan Srinivasan (1):
      powerpc: Fix struct termio related ioctl macros

Narayana Murty N (1):
      powerpc/eeh: Fix missing PE bridge reconfiguration during VFIO EEH recovery


 arch/powerpc/boot/dts/microwatt.dts    |  2 +-
 arch/powerpc/boot/dts/mpc8315erdb.dts  | 10 ++++++++++
 arch/powerpc/include/asm/ppc_asm.h     |  2 +-
 arch/powerpc/include/uapi/asm/ioctls.h |  8 ++++----
 arch/powerpc/kernel/eeh.c              |  2 ++
 arch/powerpc/kernel/vdso/Makefile      |  2 +-
 6 files changed, 19 insertions(+), 7 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmhP6CgACgkQpnEsdPSH
ZJQocg/9Edbt09ToMZMdk2R5CXxDlzeGliFX7bdKV2Q4jwEqyjHMc4J3PqCNGymO
3GmP2yemB18a4ujl36KQet6CsbRtSPd4RX9yXUyyPTZAEuyo3sNIsrJEYmD2HV4B
fErrE8xln+/l21HNBlPWQ0EN4m3c4bY6c6K3VaY8dMoxg11A79SGIRY/3cr93tYA
zjYdbWnCz4rxpgffKmfdM2xu17DmMO2Molq4lfsRp1vkfDBUq+sGGMYvn/njCCMb
W5I9/CN5xJrhF2iKBwP4U0wl2GsQ1DSgqp2RNvKv3wnuiKt5dUiYg6FswAsM2nQ/
89YTNgBhjtZsO9rLSX2jk1tmf8o5lJ7CGvByQgXMr35AWt1XhMe5dC+XXIXsU2YQ
fbK81Eiyf2NMFdfKN77hwwo3SfpdZqP1FC/4bjfsJ8JzsTZPrVfFfVXTV3rIAJsG
TNIioFauZAz/wlrwHkTyLqkXp77TJXtVsl9dHbvr2tpqblyb1k3b24qgwckWvf1t
XDc90Y478bdblBN+PThaxUm2AVFhWZSNxLzo2DiltetbtTmC5qeIyzl5PkgdJALr
Kqxqe2dg2ZkGXhi+FFNWWxicdleEbV8+zKQeY4K/tPnsPdUqe5DoQaqjPoMytRAF
l5RN5lqxNOY9odAH9gkgJSUlhWXI7+SSSIq2xF1ci6JnWBH+izE=
=NMl4
-----END PGP SIGNATURE-----

