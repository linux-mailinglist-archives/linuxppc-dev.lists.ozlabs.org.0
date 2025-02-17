Return-Path: <linuxppc-dev+bounces-6262-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA3AA37F72
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 11:10:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxJLp65dRz2ytQ;
	Mon, 17 Feb 2025 21:10:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739787026;
	cv=none; b=KO1tx538nCshMt9Gp+Hg7nlkb1m1owi4/gZQii9FOS2f9wqtPCKTuGkR/VwOwy0RiIl6Nn1zq2+S0ZWpKSKIT9qFKpDhVhoOJmQFxu8J0KGjNWu8z/dhm/UjKzNHn4hFW4eANi31OluteD/ltz5VWngmKnkQbkjNlPzLdwftTRjiQOVJPbdIcgNvPNTNBd6s1Rj32fbHcKk5D3RkY+67dzBg7cU71E5RJeXbzyBQEBHuAhutJrAKUQfXXRf5lO5L91xl5tJ2a8SDCmpFjpG8CyFnVJ5E5oWq5Tpd2E8ck2HifhgJH/KL3QV1yQHm507xswg92zFjgiw3TriRlrofMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739787026; c=relaxed/relaxed;
	bh=6jHh/eg/sf7lgfStktsSnH72e62mzF8yRmqmIg5gknE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=TI01sdROP4OQrtoqiLIu6Ui0x+nZCYqlSES0dZYAVB+ibnXU7B5jILVtxPuNHpWBfM5LJHL+8tEthZp9+XHdNPgqDMy+wuZpVsAR6I2qRtgFvgJQ4koT4e4htk0dK8AXAwgQBbZrgy3zIeJBiQBAX0ha3TVJaSiLQfPx8Y26820W7soMZ2ZK0sq5JRtdmDwDumOfHXQbrP9iK5ZA0HovC4fff/hK1INo0HzWdRrip9ZmnlrVYfeiosyzqUA42bYkE3mRf6MqAMW9Ios18S74l6VOs8OOyDsmuPuPAXrxJwq6qKBM3zIQ0+uUAmlBwv+FJN57mOAI+6WxcTMIy9NKYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MlMZzFG/; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MlMZzFG/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxJLm6dLLz2ynj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 21:10:24 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51GLj4kX022143;
	Mon, 17 Feb 2025 10:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=6jHh/eg/sf7lgfStktsSnH72e62m
	zF8yRmqmIg5gknE=; b=MlMZzFG/+5D1DjTPP/+rafFKNnI8vydVyEIajJAZTDck
	juyeTzZVU2V6FeLMjjd44zAcWKxryyNAhAQWoIQsFKlBVEQ2fsh1PZvwQjyFGdj8
	IXQIRSr4ry1yrKzsTDA6lP1yYjvzbu/6iL7P7IkK3JsQSwHz6URplklr5bZXNBwR
	xWJPllTcO4JSfUE/XmiqH8qKEQvL33bCOynncaqJ4mQADYT1/PHPNOlzt8Rl370S
	kTwd6dPv5Jb7s0PGVAVEd9yUnj39g4gZABlFIrZjM2DFhXAOEiXa5Hn3tHf6cUat
	FHXgT9uBP5vPCca53fccZGfNnkuARloOMPfN3dHR8Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ujutkfj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 10:10:09 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51HA4Vm6007378;
	Mon, 17 Feb 2025 10:10:09 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ujutkfj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 10:10:09 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51H684u4024851;
	Mon, 17 Feb 2025 10:10:08 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44u7y1d7r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 10:10:08 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51HAA8EA27656818
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 10:10:08 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E56405805D;
	Mon, 17 Feb 2025 10:10:07 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48A815805A;
	Mon, 17 Feb 2025 10:10:03 +0000 (GMT)
Received: from [9.43.79.72] (unknown [9.43.79.72])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Feb 2025 10:10:02 +0000 (GMT)
Message-ID: <69e279d8-55f1-4196-b208-27487bb70dd4@linux.ibm.com>
Date: Mon, 17 Feb 2025 15:40:00 +0530
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
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Naveen N Rao <naveen@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.14-3 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GPVrRolAU3OOIHdfuEcsbo7CUaNMf6GT
X-Proofpoint-GUID: ZTnJ_PKjlrpf0bSvmQ-zA2Yerwm3cq_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=712
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170088
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull couple of powerpc fixes for 6.14:

The following changes since commit a64dcfb451e254085a7daee5fe51bf22959d52d3:

  Linux 6.14-rc2 (2025-02-09 12:45:03 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.14-3

for you to fetch changes up to d262a192d38e527faa5984629aabda2e0d1c4f54:

  powerpc/code-patching: Fix KASAN hit by not flagging text patching area as VM_ALLOC (2025-02-12 14:38:13 +0530)

- ------------------------------------------------------------------
powerpc fixes for 6.14 #3

 - Couple of patches to fix KASAN fail during boot
 - Fix to avoid warnings/errors when building with 4k page size

Thanks to: Christophe Leroy, Ritesh Harjani (IBM), Erhard Furtner

- ------------------------------------------------------------------
Christophe Leroy (3):
      powerpc/code-patching: Disable KASAN report during patching via temporary mm
      powerpc/64s: Rewrite __real_pte() and __rpte_to_hidx() as static inline
      powerpc/code-patching: Fix KASAN hit by not flagging text patching area as VM_ALLOC


 arch/powerpc/include/asm/book3s/64/hash-4k.h | 12 ++++++++++--
 arch/powerpc/lib/code-patching.c             |  4 +++-
 2 files changed, 13 insertions(+), 3 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmezCewACgkQpnEsdPSH
ZJR/SA//eL0vRKOOGIHZ1g/uvV4D0HbtsJUObG97tpZXoNirTypba1/qMRxyqghu
d4GKKesibMexUPEICxHyy6hJb7V5cfVTWCqOy1CZg2jVs3QVclxVifHJDcW4oW2D
yCoaT23cMjht47QKXSgmQTqUHgKhLzyb575iQfx8EMDUXMT8UEsXF7GekhISGPNq
JySzN2j4/1229gYni22ta24lzxWwfSZX8xNLrDQ8JuAa0+JqCA4Yh6PM2WMohmYj
Y+5GQIMz7UpuPkdfdcsjmg/pyyGI/dC0ZAof/x3nHkn1rZfJ+T/HSeV2Zt2Aq8mq
o/qb+KtA+H+8J97158pxQQ24loJ5AYmYy5qwV20DRJCJrU5VFMxow46ZBzl1c6sw
FZ/TO/Vjc8keAnJQgRaW6cr4a7ojTHxuj25h0etH+c2BjSu0XZhiLJYlqFW5pYIA
rCPiEk7IkAEz37jQpGREaxNxFiolHcKkl4A8+Tr0YC3Nr4lrSqcqsjpWA7pGhYTR
zikZUMPkqYJYJRXPeOrQreLiuZaZwRY9EpwKVMI8TCNhhSkFRSneQNVMcdaKM95T
R4xuOwgDfhVjyv+XMwqMHxuCyk7M8fZxK2ikslB23s2LmYWoB0rePG0MRuIcUk7L
hlboeCTGwmbt1E48APU3PtAoK5NedCoUcbA3Zb/gNRCXioeUFSg=
=cSvh
-----END PGP SIGNATURE-----

