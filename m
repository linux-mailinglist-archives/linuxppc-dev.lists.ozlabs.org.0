Return-Path: <linuxppc-dev+bounces-8064-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8BDA9E6D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 05:54:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zm8j73JgVz2yqN;
	Mon, 28 Apr 2025 13:54:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745812491;
	cv=none; b=EecF2Hs1QI37sIU6zmnbFRzR6DGVKXAh3vkUQVd9nT+dJSThjlMYjOTufkLfV0g1zKd2+vLi59TXBx9J43dMByK4giveOjmD1RjPkYzR24MI7c94iR6emZYRv3jJgklMz/tYPfXrDd+zyfIbSEdqwEGjPmULnPfCC4Ydd5jOc5VWhvvniJ9jBcl6sM/lx3sZC1mF6E0jjT+wpuQ5q55gfUNi0j4yYyNN8D6Hv3qSE1Y8dgdkgyLujaP56IGuUTRpoNffbZY3WDjqjzqaMFtsx/uMik/wCsqnXzO0JtwuG/aVMlmJvWinNROaLYu756R/nsrX56MxnHS0d6nVIFhbtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745812491; c=relaxed/relaxed;
	bh=S+KiLGU+7nMxaT2KmiAj4wN7JzZ3ErLRh3+hadDyNtc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=FblS0PsHjadZDgpAnyn5a0GXozfx+eL8vT7euW6F5lOvN7G5Ky8o9w5lh0m2VcQMp7XliT/XwfBnb+GB2m9MNQqoUna6ag2VvtGEj+sSq3gIeCdrEOGdvlVwskmRD8DlNYUTubql8pY16gBwUQrnmUsSAs10hEFOM07i9CzZZyI47kqFInWxMTwoKgP1Ba1JuJEgIL0XUlLHxFgn4iXQ1pYFf0AtZ3vpfYavRcZYeF0VFp24saNGvsKQCUrVeBAS+483LP8MEQJGAVM7638WmF0lwTyMHfin9K6XVdY9AOeBILRdx5OyEI/Kqnf/DrDYWFk19EZZENelOAD7qzfwSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O9Y4BRHn; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O9Y4BRHn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zm8j46Vlmz2ybR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 13:54:48 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53RLck61024782;
	Mon, 28 Apr 2025 03:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=S+KiLGU+7nMxaT2KmiAj4wN7JzZ3
	ErLRh3+hadDyNtc=; b=O9Y4BRHnQDIE84kH8QLf7aSyEZMxo1or8LZbyR/xd8eh
	fAzh1zNS4C4mW970YlNufXKY8yL97rp1M96J1Oy66rm0psJ7aHtvU2vj60BA9/mX
	N8j7AJK19gsWNEp/OuLzHpDDVh2grlVHPPxyQAWwPlUzy395cN8NstIY+0BQaBoY
	KoLGGBt+f1l4pny+QjYYCuflMuG0/1jy3N0a2Vqo533XSGnFoOeg5WbH3I6Ay4tD
	35sq9N9XzLKRLiaHvFE9RKUAP+05ffk/bDvIj3RH3WCoVlFTR5/8giFHYw90HL2P
	abEldHlACZPIwGj6QHHEJ5GHRXxfDxMc2tW0NVf/zw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469vp8gxfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 03:54:32 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53S3sVeK026056;
	Mon, 28 Apr 2025 03:54:31 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469vp8gxfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 03:54:31 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53S37cvK000666;
	Mon, 28 Apr 2025 03:54:30 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469atp4j0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 03:54:30 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53S3sTto55509296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 03:54:30 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDDF958052;
	Mon, 28 Apr 2025 03:54:29 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8299158060;
	Mon, 28 Apr 2025 03:54:22 +0000 (GMT)
Received: from [9.43.117.212] (unknown [9.43.117.212])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Apr 2025 03:54:21 +0000 (GMT)
Message-ID: <fb634e22-a820-4c14-a8a9-5cccb37bedce@linux.ibm.com>
Date: Mon, 28 Apr 2025 09:24:19 +0530
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
Cc: ailiop@suse.com, donettom@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, naveen@kernel.org,
        ritesh.list@gmail.com, Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.15-3 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDAyOSBTYWx0ZWRfX7xdwunm1QwZg Vfgj+J1sZjLkDYnXTjxVKkKBhgjLDf9DGjxjr40GLqYE1GwOKfYJGUtGCZ3frMWpxcB0XmiIgl7 ie8imAEf5nVoYJbNMnuudHKbIALLQCC+BMlXkLymCAvhqcgtptFUHNOtikiocCAq1lbmKZote2v
 K3hts+GuQTCL4s1SeUNb0c6JtI8Q3nqipsA6Nwmste1Hdw1/2YD6VT6zh9oDYslo7SLI7CZSJVr zMqVn+moMGgLOzn3M0G0pgMsvnIdYyum1VdnFgPy2JXfeZw6f2s0UH34ghwfNDI9DUvKJINhz1L RApGJDUdIlX7KnTYSqfitNOQ8Am3Vn8N/bnxm8CFVuyRbhzULppfK4BsCR+ORIdq8tJAr1hlY97
 tnDbXd7sH4W23B6PAzpeMw+3z7jeaGMYGjOo38jFGXonPxOxCuEM2vNw7nNgnxKqCb+g2RPT
X-Proofpoint-ORIG-GUID: S8t9cPkGIoz4hAzzEM0tQrb7UcW1mX8F
X-Authority-Analysis: v=2.4 cv=R80DGcRX c=1 sm=1 tr=0 ts=680efbf8 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=GKuaDfx8oOF3Qg2PvGAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: IjJTu9_gs4bPfVMiQatlDaP5dgp-yVks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 mlxlogscore=881 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280029
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull couple of powerpc fixes for 6.15:

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.15-3

for you to fetch changes up to e3f506b78d921e48a00d005bea5c45ec36a99240:

  powerpc/boot: Fix dash warning (2025-04-24 12:25:39 +0530)

- ------------------------------------------------------------------
powerpc fixes for 6.15 #3

 - fix to handle patchable function entries during module load
 - fix to align vmemmap start to page size
 - fixes to handle compilation errors and warnings

Thanks to: Anthony Iliopoulos, Donet Tom, Ritesh Harjani (IBM), Venkat Rao Bagalkote, Stephen Rothwell.

- ------------------------------------------------------------------
Anthony Iliopoulos (1):
      powerpc64/ftrace: fix module loading without patchable function entries

Donet Tom (1):
      book3s64/radix : Align section vmemmap start address to PAGE_SIZE

Madhavan Srinivasan (3):
      powerpc: Add check to select PPC_RADIX_BROADCAST_TLBIE
      powerpc/boot: Check for ld-option support
      powerpc/boot: Fix dash warning

Ritesh Harjani (IBM) (1):
      book3s64/radix: Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n


 arch/powerpc/boot/wrapper                |  6 ++----
 arch/powerpc/kernel/module_64.c          |  4 ----
 arch/powerpc/mm/book3s64/radix_pgtable.c | 20 +++++++++++++++++---
 arch/powerpc/platforms/powernv/Kconfig   |  2 +-
 arch/powerpc/platforms/pseries/Kconfig   |  2 +-
 5 files changed, 21 insertions(+), 13 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmgO+zUACgkQpnEsdPSH
ZJT8uxAAoQHq7IL2ktjFw2APvM1UQBx78eEdQCBY/jbnStu/g4U7usLfe13mm8yG
8FmwxnhMLMnvUPp+uxdT+Xk/DWLz2AMm9Lm5xcFLzNWy4X7a5U9O/bvygjNicOn0
TqS5jLlP5KZoTXVv8XL7/kuDv/gPfD0giL3tTsfzG2acNEHcd1ku53tUl0HP1S4O
TPrwrqpR1TdMlzv+R2/sFKWi3bOkYvDLj9nJ/S80uAehE+7iznQfQAev3n2rfz5h
ERYXteQahoeAVNrPt6H4ij86KP9c0F3GS8gddPn5GisPsUY22BTXsL1ZqpNBv5UV
sYsTRO2IfRq14UT7MKXvN0HKv4cC6iFI7UsiA9tn7o2kAwpLapqDKbF5gzn2LT+p
TXv8VKH8rEipHkG4GoT/VQKfIstYmHd44Y+eyg1cY+VG9e/S/rqgINKQAM0vD6ZA
brNiAUPKJBwEGA4DLwApYIzG8l8tO3YA/pLG/o8NOhRH36WNkz8d3B0qzLyLqOQ1
f9bjhOx4LTFhe6s3j9uKiPJWpFhadx4g0EdMvPkMiToCfbqYgqlfJze+2SvgDaLk
LvbElNfZxX6X94AUPo+xekdVqgQoHJ5fISIAmt4+8ebDqGXWsEMpByTz4CKTFPgo
DgvuGm09nmHncnFzNGWi72/NEAY1zDZz0bo+fgJzzDhj1d6LEyQ=
=vo6e
-----END PGP SIGNATURE-----

