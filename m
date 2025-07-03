Return-Path: <linuxppc-dev+bounces-10064-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E673AF6738
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 03:39:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXfZ768Zpz2ymc;
	Thu,  3 Jul 2025 11:39:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751506751;
	cv=none; b=YbPAJJ1I3deALaSipHZWWSqyCd7N6g9neIPyqf322QPOULP3w82Qmesvae6ymO90NxvVvIBNzGzNJyJc6pMXvgXpmmkL02NHYuJIO9hIPuLMF6qxyAy1SR29S3RmlR3LxH9giFTokgUOAd30+6BxvAG6ZDGJGHoWDxFmYzIVaXVsvWAKoc47coJPZPCP/qZY5XtkToZvS+h9ASp//9hiy5cyzXgbpeFqOPeBexoPvYn1cheGC07JtiK9EQj+MP+ojp8VHiE4kIUDuAg2rLGsuCKH2mTENQkYLVCYdnvNHQHivp/b0QinPljFJIB9ffgtTQXRqLkEsUnkVqrM1Bp56w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751506751; c=relaxed/relaxed;
	bh=xgpVyoLPh9JdhYBwUjqBEZjWvAdIc2zVJFh7ZQkPLrQ=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TFw3tvkwIzu6aq114G239VXHJw+mpvoUQHY8wPt17IRIT9LX2rzYt7HY5QrgISXBr4Bo1z5UBdMlCD3Ki+zFl+OlKTWfCrhteQ4MPgUSI1VQY6EKWNzXVy9glqGQ+pmkwkCWemEMo/3JKGDc09s83wZCFs6FCE129erEDjI3lWTsXlmzNKj3hnt9n7drbXrogsTYioDJWnBYs0kB5AWpOL/MgsJFXetQMW6By4JlazxXMBbzHHOhs9DuQ6Q8WCCyLc3RpvIeZymVCUirx3dMM8zboUIV4owvp3z2ADPw9uUNCdFQuJ15tV7Rmu0ywE1pkwgy/Pcd6HOjVhCTrgy9ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b4L3lFIM; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b4L3lFIM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXfZ66FL0z2yf3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 11:39:10 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562JEAxQ003793;
	Thu, 3 Jul 2025 01:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xgpVyo
	LPh9JdhYBwUjqBEZjWvAdIc2zVJFh7ZQkPLrQ=; b=b4L3lFIMHGyWmS95nHIWRl
	h9DRdGUb2nGcL/94yxLei0wURBf1o8sIkM2wWKH+Sw5cpfWPMCUi/PHLXNLxC2xH
	GBjP7tPOwggeK6mtiy2XMDP4TI9iVe3pUoZIViaZzyOOX57CVTDT+b+CoyHk6N7h
	0FQvKDHndXCoP/gzpvoNh/FsB70oEyg2nelcqHqKf4CYYWweKNDeupcieG6y1mtn
	Npb941m9Twm6vF/BYn8Z/VCcEiMvPERje11ZFtw0a1YQt/LSXOB7U9/rWL5EZGID
	kABh2ml9ah7UXaVybZkhO9Sx99QVwTwFR2ANXq4r2uE0o3TX0uSV3S0NRerwCALw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j84dgwfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 01:38:45 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5631YEmd000959;
	Thu, 3 Jul 2025 01:38:44 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j84dgwfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 01:38:44 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 562MZRJ6006841;
	Thu, 3 Jul 2025 01:38:43 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 47jvxmj8qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 01:38:43 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5631cgPX24511054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Jul 2025 01:38:42 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1B0458059;
	Thu,  3 Jul 2025 01:38:41 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C598C58058;
	Thu,  3 Jul 2025 01:38:39 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.102.8])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  3 Jul 2025 01:38:39 +0000 (GMT)
Message-ID: <eb91dcf034db28e457a4482faa397dd7632f00fd.camel@linux.ibm.com>
Subject: Re: [PATCH v2] integrity: Extract secure boot enquiry function out
 of IMA
From: Mimi Zohar <zohar@linux.ibm.com>
To: GONG Ruiqi <gongruiqi1@huawei.com>,
        Roberto Sassu
 <roberto.sassu@huawei.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Madhavan Srinivasan	
 <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heiko
 Carstens	 <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander
 Gordeev	 <agordeev@linux.ibm.com>
Cc: Eric Snowberg <eric.snowberg@oracle.com>,
        Christophe Leroy	
 <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle
 <svens@linux.ibm.com>, "Lee, Chun-Yi" <jlee@suse.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-integrity@vger.kernel.org,
        keyrings@vger.kernel.org, Lu Jialin <lujialin4@huawei.com>,
        Nayna Jain	
 <nayna@linux.ibm.com>
In-Reply-To: <20250628063251.321370-1-gongruiqi1@huawei.com>
References: <20250628063251.321370-1-gongruiqi1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Jul 2025 21:38:39 -0400
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
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AK6aKBga4oupROxNi37kIoTGk3q8-5S4
X-Proofpoint-GUID: uDLi-sImN3F6mgsunZuJI4XJFtTsseEO
X-Authority-Analysis: v=2.4 cv=Ib6HWXqa c=1 sm=1 tr=0 ts=6865df25 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=i0EeH86SAAAA:8 a=S3K_XBxPWrw5AGGlcUgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDAwOCBTYWx0ZWRfXy2T4VTZGAdYP sUju6z4tCTzdEu3yCSnNzl9jOk3a4Ybp+UEyit+nsO1F3Rgn1K5leqHez3AipMUriRQ47LArP40 9BIqUj1y+Bwq3B6h56eZ8DCtsDqi+DKDsWMDAYm4+YLvPQsohUdOM06LkKYeK88Imwvhck9/FKo
 RqhPOZlG8YHqnt9HTM0wcWpofMPCBacYx0/fzrLe8sEh0fXC8+meVu/0kh2zeoxYclYP478kWTh sK9ePhL+SfXMtDKJaKxDGBhNzTab5Y2zo9cq55R3XU88nQ8TJSh4mTASDybyMK5UU67y0xVmxwQ ESS/8ZY/oYFc2rySDpumZmdXH5mBW1Ba2NXxmGHm4qkTbGVckU9hBrIXoqf43+N17w7NMatu3TU
 yJrPAtqTjqPi4XMtScNX9MOfw5mHsMbrSdiWPhSSMhgXCy4Rf4Z4bRb9sltJlp2H9t2Gt+qB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=691 lowpriorityscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030008
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[CC: Nayna Jain]

On Sat, 2025-06-28 at 14:32 +0800, GONG Ruiqi wrote:
> Commit 92ad19559ea9 ("integrity: Do not load MOK and MOKx when secure
> boot be disabled") utilizes arch_ima_get_secureboot() to perform a
> secure boot status check before loading the Machine Owner Key (MOK).
> However, only when CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=3Dy can this
> function be functional, while this config has nothing to do with secure
> boot or MOK loading.
>=20
> Given that arch_ima_get_secureboot() is just a helper to retrieve info
> about secure boot via EFI and doesn't necessarily be a part of IMA,
> rename it to arch_integrity_get_secureboot(), decouple its functionality
> from IMA and extract it to be a integrity subsystem helper, so that both
> certificate loading and IMA can make use of it.
>=20
> Compile-tested on powerpc, s390 and x86, with CONFIG_IMA_ARCH_POLICY=3Dn
> and =3Dy based on defconfig and allmodconfig.
>=20
> Signed-off-by: GONG Ruiqi <gongruiqi1@huawei.com>

The original reason for querying the secure boot status of the system was i=
n
order to differentiate IMA policies.  Subsequently, the secure boot check w=
as
also added to safely allow loading of the certificates stored in MOK. So lo=
ading
IMA policies and the MOK certificates ARE dependent on the secure boot mode=
.
                                                                           =
    =20
What is your real motivation for moving the secure boot checking out of IMA=
?   =20
                                                                           =
    =20
FYI, there are a number of problems with the patch itself.  From a very hig=
h
level: =20
                                                                           =
    =20
- The EFI secure boot check is co-located with loading the architecture spe=
cific
policies.  By co-locating the secure boot check with loading the architectu=
re
specific IMA policies, there aren't any ifdef's in C code.  Please refer to=
 the
"conditional compilation" section in the kernel coding-style documentation =
on
avoiding ifdef's in C code.
                                                                           =
    =20
- Each architecture has it's own method of detecting secure boot. Originall=
y the
x86 code was in arch/x86, but to prevent code duplication it was moved to I=
MA.=20
The new file should at least be named efi_secureboot.c. =20
                                                                           =
    =20
- The patch title should be about moving and renaming the secure boot check=
.=20
The patch description should include a valid reason for the change.

Mimi & Nayna

