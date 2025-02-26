Return-Path: <linuxppc-dev+bounces-6479-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AB0A45438
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 04:59:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2ghl5XMnz309h;
	Wed, 26 Feb 2025 14:59:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740542375;
	cv=none; b=PpRQDW6WP7FQ46hsYa4FyHc4qsDbVDzmB++SD1+0AwTIIaGo/P3vT8AJvkuidTw+B9mmjK88jHMZZoCpVF7zQmlqmYBWTGVOkj0sqOFpKYGImEMF6ZnDXLfX3lX6x3YhC3HPw++xhngwIMW3LvDjKaV4MfKGUICYdl3uyOhJ0aJPkwD/Hc3/Kccbnj79FYF81EuXsEDDj/dCVzi1gzGfmIJDhf48iJeDIL/03fgA4VGuplghMDY5rKcNZ3+EEegA7FNRVcKcL586GC6aUdawbuWo6XCd5FD9fKyRoALs1k2peL/7FHKo7RglHISZOYit/4rU38gmJINpIrVhKXae/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740542375; c=relaxed/relaxed;
	bh=lbb2EYaTqrYLW/hbRhQ7MvoeKzpm8rT2BSNrqeTkGZc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=M1NimaPjiiMiNs3AFvDnmsuQMzYjgjEmnO7V7ueI+9Q+U+r4qvsX4O9kXY6smyuN6dKpyFulpN3sjrn6qpOxXLrd+uJNDOTGyAwEhhgdruS+gQYgrCaLfJoZFUWVh1b/LTHc2rEzh0dsuyG4Lu7D2zG/WZbx4y9Pq7xoZ5catrImO2gou6m5PzbIm8huXg2fyz2djzaP4cN6p3tqPLXBSatU0olyiNviYOFBoWNagGRYq84nzeTLmbfqMdYfUTMjQKS8zg2VpSwofJh7eyhtVlGx5+YkKIKX89YPiUlGBc6BBTqjdRfNRtUKIOi0sZJ/gY7AvSMlQtTvkFY2XyJNpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ITac/vdw; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ITac/vdw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2ghk5W8Hz3028
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 14:59:34 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q1kqMD028572;
	Wed, 26 Feb 2025 03:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=lbb2EYaTqrYLW/hbRhQ7MvoeKzpm
	8rT2BSNrqeTkGZc=; b=ITac/vdweHEqKLHUFprLC0DoifcdK2JatGG02ZwLT6B2
	7YsNXlvQqQgCQAQgJ6Z/gEMOKyo9ojkHylfHmijgXYNAxKKfMHej3oSP+4YpsV6l
	D2i1jDxAUWne+OG0uRqvW1bpOIvUGkBKt9VqcjxZACZV0tPA8g3vcYX15sxnU+xi
	sB/eZVfxWN+Tw5jysFUm+r6RXuWdBPSUIA+pP9k7SQRRN1TMaFhBObY9a+gT/rop
	FGMoYXh5O3plMJMgmHZpJl1POhKNkGn6gD2tcM62DN8TfN9UYJjh0C4iKmRtLPjw
	+u26Qjwl9K1IROSy3tHiAPURgw8JwvYGdSHV5JzsGw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451q5m8xug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 03:59:18 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51Q3xIQ2023050;
	Wed, 26 Feb 2025 03:59:18 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451q5m8xtt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 03:59:18 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q08TD6026354;
	Wed, 26 Feb 2025 03:59:02 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44yswngma6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 03:59:02 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51Q3x2CD21234144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 03:59:02 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A0245805F;
	Wed, 26 Feb 2025 03:59:02 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E9D4658043;
	Wed, 26 Feb 2025 03:58:55 +0000 (GMT)
Received: from [9.43.65.188] (unknown [9.43.65.188])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Feb 2025 03:58:55 +0000 (GMT)
Message-ID: <8ce77d4d-cd19-472b-a526-0c80feb2b028@linux.ibm.com>
Date: Wed, 26 Feb 2025 09:28:52 +0530
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>,
        Bagas Sanjaya
 <bagasdotme@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.14-4 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0y8MZNw5xkoeLVax816qcmv3mZpeSElb
X-Proofpoint-ORIG-GUID: SZz9kxXELDzWkYv7JjrGO4rsdSsu0lR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=679 mlxscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260029
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc fix for 6.14:

The following changes since commit d262a192d38e527faa5984629aabda2e0d1c4f54:

  powerpc/code-patching: Fix KASAN hit by not flagging text patching area as VM_ALLOC (2025-02-12 14:38:13 +0530)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.14-4

for you to fetch changes up to eff2eb592efd73f00590d578c3d6021f604df62c:

  cxl: Fix cross-reference in documentation and add deprecation warning (2025-02-19 13:33:58 +0530)

- ------------------------------------------------------------------
powerpc fix for 6.14 #4

 - Fix for cross-reference in documentation and deprecation warning

Thanks to: Andrew Donnellan, Bagas Sanjaya

- ------------------------------------------------------------------
Andrew Donnellan (1):
      cxl: Fix cross-reference in documentation and add deprecation warning


 Documentation/arch/powerpc/cxl.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAme+kI4ACgkQpnEsdPSH
ZJTRHg//cAiqHzzrYX9jErT/3QGrvjRLIUUSlZxXKnS1pObH1IjryIR+KXVh6Jsh
IKuKRFtWGIiffX829hd7kwfVQ15T5iK0dIR4q2kFxWf4x6Znd1AUyVjrUTiGzs/R
iP3JMItipD/q3uFfdJR/Dy0H4oV8/F+53g++m9EteZErBLvYjutq53mq9d40Teiw
K+n21GVToZ5sHafILA9wRrj1MzkWhzFqZl84s9SV2ReBCTYSx2KixWXWFNLf4dvJ
ynFPJIka1x3IZB4Lv6GlwxgRkUT3YMSrcMEKd4s2kWrPRxTBKd4Rvo6OjoGWleV8
C7IunJtSABJDXuSAKq6S0cF0cvDbs6E8nMJEXjYwFKgNL0OWVBa38YEsSuVXndcy
YdROZtHEjx9vNK+APpLZSaDD6TcShqCICgSccWSLFKssdsL0//ZRn7M1VKsqJ2La
3RvXl5I1Uf7hxGAE/O4nfATW0SrYNUrXU4b4uSAnEBGzDI6Ot73XE+UXEao4y2bH
c97IthhClqW3WD+mV/+3jFArK6QatEls4lsK6TqKYLdTjfaLTHdzs/SYkt9SYT1u
XMfhDy5eg5WjjyxAQGbhuF+yu/Ljws+uRuALIalGpLCL/KFI8wsaaOYBKRLtt4Yl
gSdsNDRFP4AJFZVwEM1ypC/xQ0uSU76LSsdcareljrzkrgiDi/8=
=7YO9
-----END PGP SIGNATURE-----

