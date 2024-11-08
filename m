Return-Path: <linuxppc-dev+bounces-3030-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 501B19C15FA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 06:25:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xl6pH1PcSz3bbT;
	Fri,  8 Nov 2024 16:25:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731043511;
	cv=none; b=VG2q9QRz5rPGXr4b9YAeew8XhKMgWcMeC6X3deORMQ8npsuRD9dmfFSfu3PYugUt1wgWzige13nyfeIxQXiuC4cFPfYHzL2V41yqUhLTcjwCVtN9dTmzRUJ4TFi4xKk9qAG9nJBVpIv0hbKVKXnJ9NckjHnSIWqLFYQbHfQnS7pCMqNPtKTec5QMoIY51RnzezdS4Y1mI7Vlb5dc+7/aFDkq9UOvMv0Gw+08Dk0VOsOL0qxj/T+gA9gLQIMdFn8cXfxdGc0GY6H1YomLaP+eYsijBQ0zm3vnJoONfKeNnKoEm4toQLwYTR3OlYF+XgoQiCWhi/f92ZMjSpjQ+0Kw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731043511; c=relaxed/relaxed;
	bh=dNlS3DxGPIin2DkLAI20LbpHoTOW+PMREunhdASWcp0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=YmEeC7LFwgf05dT3Q7bFdyn9xZ9R6kV63ouAotVh4rgvryDHEHpOibk1Tei7dRr/yEk5jdLT361cBrBToEpynGpkBh2q7jPflYVAtFQj+NvS0UK0m9jHMEZVxyjQyxh5UKdCQRh/JOvekTdkQT6DoO3HsHka4Vxh1ELOOiAJnI1fpnDPqB7jfe5HnjvEoIp24PyVWSAliAZLn7jRDKwjmP1UGlEbh7J8NAAis2Maj+acAqylqVC0IGoQXiMg3dSUMTtrzNZvd0DpsE1vUeJgAXFXbUyRub69qgFPJbMCUKO7hRNwSSB8giqghirTVYMriF/KffurQohHX/nYO+chdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pKapTdRx; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pKapTdRx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xl6pG1BnRz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 16:25:09 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A84eaw7015756;
	Fri, 8 Nov 2024 05:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=dNlS3DxGPIin2DkLAI20LbpHoTOW
	+PMREunhdASWcp0=; b=pKapTdRxRUsn7PnTl357H+g6W4juKR79D/ZAXlUjjINO
	RxaQnYzywVe4Y2Dr9Mib7DBPvOvzaT8hf6Q8tbzmbWebMaS0VuG/sxNNaKllsjTN
	mjl5Vz0Bi4pfPXTifjzFTvQaQdjo5Mfu8drg5r9WqQlLebe5+2iqa+BeZrE7bRqr
	/8kphH7q3XVq+/kjPyvvFzEFfx5Tu7P0RY6mbQdwAIFb0h45J/fKBIqWTIsdv7hn
	Ily3egXR4sr7YkV4kBb7qPtzDviX8EwRWPEjGALyuQIIY15eJlDVec2D0u+C+84i
	O6XYZ+X7z5zkxPXFFv+JdAmYE4NC4PIpJlT91BcHgw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42sbtn852v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 05:24:50 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A85Onal006569;
	Fri, 8 Nov 2024 05:24:49 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42sbtn852s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 05:24:49 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A84CN0A008436;
	Fri, 8 Nov 2024 05:24:49 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42nywme494-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 05:24:49 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A85Ombm14615130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Nov 2024 05:24:48 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB83B58055;
	Fri,  8 Nov 2024 05:24:48 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4618758059;
	Fri,  8 Nov 2024 05:24:44 +0000 (GMT)
Received: from [9.43.44.118] (unknown [9.43.44.118])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  8 Nov 2024 05:24:43 +0000 (GMT)
Message-ID: <375850de-155a-40cb-819b-fe21733e3cb0@linux.ibm.com>
Date: Fri, 8 Nov 2024 10:54:41 +0530
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
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        Gautam Menghani <gautam@linux.ibm.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.12-6 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qlmytOBgm93fXFUNNRjmMKdjexAbhhi6
X-Proofpoint-GUID: dKW-ba3m0cRkCPm3jfC0UtTJOKVhOxA3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 mlxlogscore=674 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411080038
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull a powerpc fix for 6.12:

The following changes since commit cf8989d20d64ad702a6210c11a0347ebf3852aa7:

  powerpc/powernv: Free name on error in opal_event_init() (2024-10-16 09:26:50 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.12-6

for you to fetch changes up to a373830f96db288a3eb43a8692b6bcd0bd88dfe1:

  KVM: PPC: Book3S HV: Mask off LPCR_MER for a vCPU before running it to avoid spurious interrupts (2024-11-06 11:36:09 +0530)

- ------------------------------------------------------------------
powerpc fixes for 6.12 #6

 - Fix spurious interrupts in Book3S HV Nested KVM.

Thanks to: Gautam Menghani.

- ------------------------------------------------------------------
Gautam Menghani (1):
      KVM: PPC: Book3S HV: Mask off LPCR_MER for a vCPU before running it to avoid spurious interrupts


 arch/powerpc/kvm/book3s_hv.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmctnxQACgkQpnEsdPSH
ZJQw/xAAn7YAlShylnKkc9vhAr0vEPT+4KqtH3J5ijmoJRPtkpPUQDQRhW3N6ZOx
IDDHMDuRZ6AiPChbLoc+6Q/VQqtzydwnxj2hN9IMhJ71Zjvr7HrSjfeE760jEKrR
1Bqpgs6b1Bdv1DrHATCfVxpLJ/NJ4TG00Q1UzvnzkdkNTF2K63apIKjEuv6N7Aap
Jf8UwonbdnPkzl3zY6ccJxIkxIH6k11Z4ILyez8h3La9IgYnJbXwjn1mym/RAZa0
vugUfh+ASDGq6FVn35FnDgY5ISUG1odiYnnEpSHvLdL2IFkLeHsSLdx2nbeo1eMa
DtudjfFlU36ZKlpnKUQ7IqzFGbTI+s9yMHY5Rbfx6u1af0rUuYwHtyy26xwSgLj+
gsxJpyVdNDvP8X+BHLqVcjJAgPjlmc8orE9ytFYC0dghahfpoFeHIhKeqAPV0X15
uMS9Zvyv+ZGmrfafO74kA3CVaAvxUVT66hMnIQ2Sp38ixLfnlaO6HQ4kXKvDdcuH
1M3pAnj4gOUhdIhwgAkHQErrMBV2Cot4exvJvuOlnEGCgLHDsb5sMIRB++56iuh8
P1DnQSpPpADL0Mje4+H947S2rrDml1zZIvN/gkUjk1tOrBg1x1x/tgLI4c3bOSz8
6RdJrw3Q3WbRYc2hUAlkxoegZS5Vz0SJi59cmTNf6BZLgSLQY5U=
=fRGx
-----END PGP SIGNATURE-----

