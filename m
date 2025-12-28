Return-Path: <linuxppc-dev+bounces-15042-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0393CCE4865
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Dec 2025 04:13:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4df4F321tBz2yF1;
	Sun, 28 Dec 2025 14:13:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766891623;
	cv=none; b=EOm5Lz6zr3bT3M22WURr4vlXS3CET4D8jfRw3H9/ewP/BECf1ubbvX2M4ibkDs6vPCn6GCMo9n0JVfLhpE/CzpLAAuVgP5MCbkY9BbQ9NygpPL+7ghSqkSYqnV8fyfqqlbucmJkueprhEriXyV0KkRBU1KF3ZW3APeF48EMBq+pryk3R6bABToDo0+fBUdWU4hqjHM6fpWXL9DjzEYPbvbTOSEdhzJqMCwAuFl6XixiDySZuRedb+oBmUBzsOGGpKmfZYMssUDxoxAn4ozvrruMmLom61fGBfTgMM9jTUSbTkTnyZQqo+el2PIHOcUTVkdFygOyR6F4cY75vfQU9Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766891623; c=relaxed/relaxed;
	bh=bTCkb7KATtlowPKZP21aQrEHLXo95miDY2Ls6w/uqzY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=I+qjGbQenQ6Pzr0LRtx3Nsa4J/q4p/BjUKjQf66xjUIBwlsXqaQ/E+gDifb+0n+jiJsVucddNurWRZWwNdD+y8UPqd7Lr3gGQr24pYIVJ9vzmT/GRxCmUjAtFsrff6Z7iJ2GHpctQuZ6WjZwXXX4awAAsl5t2PlyPLFrmxzoj2EqRXIW4xvfqb9LcntvoGh0wxyxzXX/DxOp2BW76oXsjhg3b12/aZzSaDL/Nhs9RK+NTOPvKjJHqsZ8IZYUMgNEK9IzjgFyY5zAt4km0fSapFVbIvHqnJL0HXoAA2+kVB3wrO/qPOnco2wgnAAOEbfnyUmZ5QNKa5DxhX7bPGKNXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lnI4WHMm; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lnI4WHMm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4df4F163R6z2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Dec 2025 14:13:41 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BS0rkE6008354;
	Sun, 28 Dec 2025 03:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=bTCkb7KATtlowPKZP21aQrEHLXo9
	5miDY2Ls6w/uqzY=; b=lnI4WHMmfTRGzY/CwJXArCooFdPui+e2uLlvYQx0LW8Y
	kx/oNQ+THymKfede7xMvBpel08xE7VKfadv1qS1/KCrUiHMxsEAAq6scjCxW7u/K
	cNtjznoNa3dB2STHeomaS8SM7SwQnbrMCAnZKAJV4+7RlGTI338goOzfv+pmURoi
	41Y8xTso66I/uG6yOomdAdV9uuKcdJO0Ycy0+E1uY22nuFcY4OVCGLH8XtcW6pxR
	O2PJV+jQY4ld8HkNowuDlNbWJf2HXRFEa0zxOvUVCvmK6lG3PlSUREAodShcTEcv
	THqjKYi7A2xP2IpTnXyN6jT4kxm7ytMGVkfs4aQnuQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba73vje44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Dec 2025 03:13:17 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BS3DGCm016214;
	Sun, 28 Dec 2025 03:13:16 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba73vje42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Dec 2025 03:13:16 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BS1JOiv026066;
	Sun, 28 Dec 2025 03:13:15 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4batsn08ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Dec 2025 03:13:15 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BS3DEbZ23397092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 28 Dec 2025 03:13:14 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 331AC58059;
	Sun, 28 Dec 2025 03:13:14 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D31BD58058;
	Sun, 28 Dec 2025 03:13:08 +0000 (GMT)
Received: from [9.124.211.103] (unknown [9.124.211.103])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 28 Dec 2025 03:13:08 +0000 (GMT)
Message-ID: <4c4d93f6-efcf-4195-8f6a-1954b227d81d@linux.ibm.com>
Date: Sun, 28 Dec 2025 08:43:06 +0530
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
Cc: aboorvad@linux.ibm.com, chleroy@kernel.org, christophe.leroy@csgroup.eu,
        fthain@linux-m68k.org, joe.lawrence@redhat.com, jstancek@redhat.com,
        krishnagopi487@gmail.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, naveen@kernel.org,
        npiggin@gmail.com, nysal@linux.ibm.com
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.19-2 tag
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IZSUJs0MiIQ9nRgdBiSvsmDeO2Xhx-Pu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAyNSBTYWx0ZWRfX+tIQ5sekfsUG
 IFDVGtPcvHeWs73QzjScrsMgCdtgrjAzTewqXgje5A6qqzGFv6e1m6BfWSqSblUh+GHzFxTSdXW
 IwU7DzoNXw3BNaJ5hQANMi8TmStU+tb7rpTraE8Cm7GMv6ZVvaX2ssHNS8oFAHYuz174LH2lQWd
 WeiqZ6P0mTkRnDdRYNEUSYp+YhjZz7JuQ+fU2CAevSZqIp+Hyepyc4DhZalKY9sB3iool/JraXG
 6Dssaexf38nUpSE1PECdr5w9idrz3IqjrPWFannrYn8HCZul+6eeqgnmrqKvNjHeEQmtBnNmfNn
 LvTGZf5uqCTaD5wGHo8rXJLgn9ZNlHyN1KKDfkazkUHKGACGYVDTD3dULC4/HajQnz9n5e2LCjv
 1xAiMmSIty5+HXiZCtfc6XbfWpaNJcRXya8upoI/v1Ny8wXniXwlQWKKpn6wsjiGW0YFC/5qBbH
 1BnpfFERg/BQX9Ylyiw==
X-Authority-Analysis: v=2.4 cv=fobRpV4f c=1 sm=1 tr=0 ts=6950a04d cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=-7xwBA7kt0Eq77gYiToA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 1u4qXVhLyjFBsEglGWaX9WhDqBPgu7R_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2512280025
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi Linus,

Please pull powerpc fixes for 6.19:

The following changes since commit 9448598b22c50c8a5bb77a9103e2d49f134c9578:

   Linux 6.19-rc2 (2025-12-21 15:52:04 -0800)

are available in the git repository at:

https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git 
tags/powerpc-6.19-2

for you to fetch changes up to 608328ba5b0619cbc28b409296b5e3840bcb97b6:

   powerpc/32: Restore disabling of interrupts at interrupt/syscall exit 
(2025-12-22 18:25:07 +0530)

- ------------------------------------------------------------------
powerpc fixes for 6.19 #2

  - Fix for kexec warning due to SMT disable or partial SMT enabled
  - Handle font bitmap pointer with reloc_offset to fix boot crash
  - Fix to enable cpuidle state for Power11
  - Couple of misc fixes

Thanks to: Aboorva Devarajan, Aditya Bodkhe, Cedar Maxwell, Christian 
Zigotzky, Christophe Leroy, Christophe Leroy (CS GROUP), Finn Thain, 
Gopi Krishna Menon, Guenter Roeck, Jan Stancek, Joe Lawrence, Josh 
Poimboeuf, Justin M. Forbes, Madadi Vineeth Reddy, Naveen N Rao (AMD), 
Nysal Jan K.A., Sachin P Bappalige, Samir M, Sourabh Jain, Srikar 
Dronamraju, Stan Johnson

- ------------------------------------------------------------------
Aboorva Devarajan (1):
       powerpc/powernv: Enable cpuidle state detection for POWER11

Christophe Leroy (CS GROUP) (1):
       powerpc/32: Restore disabling of interrupts at interrupt/syscall exit

Finn Thain (1):
       powerpc: Add reloc_offset() to font bitmap pointer used for 
bootx_printf()

Gopi Krishna Menon (1):
       selftests/powerpc/pmu/: Add check_extended_reg_test to .gitignore

Jan Stancek (1):
       powerpc/tools: drop `-o pipefail` in gcc check scripts

Nysal Jan K.A. (1):
       powerpc/kexec: Enable SMT before waking offline CPUs


  arch/powerpc/include/asm/hw_irq.h  |  2 +-
  arch/powerpc/include/asm/reg.h |  1 +
  arch/powerpc/kernel/btext.c  |  3 ++-
  arch/powerpc/kernel/entry_32.S                                | 15 
---------------
  arch/powerpc/kernel/interrupt.c  |  5 ++++-
  arch/powerpc/kexec/core_64.c                                  | 19 
+++++++++++++++++++
  arch/powerpc/platforms/powernv/idle.c  |  9 +++++----
  arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh  |  1 -
  arch/powerpc/tools/gcc-check-mprofile-kernel.sh  |  1 -
  tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore |  1 +
  10 files changed, 33 insertions(+), 24 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmlQn60ACgkQpnEsdPSH
ZJR/Sw/8DiY43o+/FAU3RWwi9Nh2wrvMaNbN/9hWu2UnHMGNnKTgDd19NHW4LWmh
C7kBPCNqyePEjPbqT99JiRCkTQkrGasi/jpWjUSNDURcm3dS+MasL0En21KQV3X6
GVpwjLPpEzDTajliKiAh+UFkMECSeh1kxmm3k77nU8sxg/fshB6sjymnW0R9M+Wf
vB3C+w6xZYHqIHiGXeo2IDAi/cAH+KKmyXyWmnrm5FAJyOYMDC73xqxYz+wvkSvu
M4mabXl80cPMqinhghwHpC545ok41SccgVAPoFDYt+d4r9JJXfy3PsCI4Od8vw9W
FqBsKIosYTikULilqBavPRU51gSux3adeC2l9v+vEzUpLmb7WNMkLw+WLCbJjkPR
n+q4psJLTKt5FKBStZA9ZWDQc43cgSzH/JSmPFhdzH2ChT6HRSfO/NimDrNcMKHu
NicwVHpm9jkEvkv36WZkFbbk5jHgn6vcivDZf5HA4ipvZ2gIIhtuI7vnBhbxBIvZ
2cteL41s1Xl+3CDPkL3kL4qzaBUXmU04+8t/eHMaumWEK7mP7uT7N0BrM2Y2J+9j
wVwGx5x43XgyEitokybblatPl59TTL3c4TfzvhFJfwUFu0BOHXpci5h6aqlgs+3D
MSmZ275FPB2kuo9dsBDYutFvWq3ZmTvoykGpXcUK8NbFarInk7A=
=d8CF
-----END PGP SIGNATURE-----


