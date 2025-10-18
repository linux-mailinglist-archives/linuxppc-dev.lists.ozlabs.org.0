Return-Path: <linuxppc-dev+bounces-13041-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C140FBECDC3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Oct 2025 12:52:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cpdnQ0zFyz3chv;
	Sat, 18 Oct 2025 21:52:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760784761;
	cv=none; b=h4ZeW0uFpm9S/HUx1idXf0zm+x+wPPpZ3FWWsVD6bsjM+itZ0e6HPtUR+40uQ4XmnUHVKnUwkC2YEAr/0lNFgBKvXC0U/f3EVNBJaL95fl4iSiA015hRpiDPS+acGSoEM11Rl2/BsX0UEdeabkU4BM4IteorwXp3NI+xVCXnvkoezM7TjBy5remduD35eVzHKsqpB/aMDynJQ2acTA31ldIhf1nAhhL10CddGDCylF3AfdWV3xN/Azxg3P2QfVNHtgcQOmk7mjtLr9TEWuLiZWU2kgXKYcdx1E0PqfRSCTu2EagrTCCjgfeUoDR5JU7/tmGLQzBBOFqworb+2A1auQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760784761; c=relaxed/relaxed;
	bh=C1IXXIVI+qc2ZoBDtS/sS2hORm5FCbP8jmteSaNehxk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=DhJf000ko58LsdQt9fMiyFGzcTAV8I8aqpx2BvGlLnpjyWJYIPiphviNDFsTQU/I5tCgT14VktG7RWyFrXbqLIukOa9UbiVUpeRxdTdI7LQyPm8j5XxAoiSPt3iKaj+0CgRFZjlh/auHWLB1SceV4BBO0F2X9PjSAPv+pqX+w1GxfJg3hrvgDBqrf07dfwfD0UZAWrPl6AeCG/nZjRbrb8xMw/fXMaXEiez2S1lo1nT4HK/V0KWZB6oXVcCajIbvA6PO9bzKTvoUQjQ/tR6+h+dVqUy+8URyD+3esjcXLP3orMqzxff8z3YO3gXjZHf+qmhe3BU2zOrI50zXbbqq0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NKqYwDA9; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NKqYwDA9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cpdnN5R12z3cgQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Oct 2025 21:52:40 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59I5QNRS003184;
	Sat, 18 Oct 2025 10:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=C1IXXIVI+qc2ZoBDtS/sS2hORm5F
	CbP8jmteSaNehxk=; b=NKqYwDA9j5wGDT+Sd1jJ3LmdubhW8/jPR0etfbwH/Uae
	KcYk55OLpIT/aOyHeGzec1I7MHIntwymoeEH52auqqmjdfcSEOa/iQg52XKZMsvm
	2/G7CBRzyyDApmfIzyjN61oCP2n1keZY37rzHDg2ZvLDM/D/WFpi7gbqXKHxCmj3
	SPjKjh5/q4xaDTSUTVA85mvyHe7XGVnO0e8p9GNWCIrxYVOYt0oNMA1yGmZ4va53
	/3x529EEPMRf8wmNfkifQjTh6mHJOY5M8mpcom8ufmGy9UFQueOW9ZgyDKfIpCPr
	DMWFfOBzvLxgBXbt2Kv415V/GReCGbaI2Nnw14hmaw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v30v9308-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Oct 2025 10:52:04 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59IAq4GM008083;
	Sat, 18 Oct 2025 10:52:04 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v30v9306-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Oct 2025 10:52:04 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59I97PTE003618;
	Sat, 18 Oct 2025 10:52:03 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49r1xyhrpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Oct 2025 10:52:03 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59IAq0V151642770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 18 Oct 2025 10:52:00 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C9AE20043;
	Sat, 18 Oct 2025 10:52:00 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F21A20040;
	Sat, 18 Oct 2025 10:51:58 +0000 (GMT)
Received: from [9.43.12.243] (unknown [9.43.12.243])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat, 18 Oct 2025 10:51:58 +0000 (GMT)
Message-ID: <2de37987-076d-42c5-9597-0ef374f37e08@linux.ibm.com>
Date: Sat, 18 Oct 2025 16:21:56 +0530
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
Cc: ajd@linux.ibm.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au, namcao@linutronix.de, naveen@kernel.org,
        npiggin@gmail.com, sourabhjain@linux.ibm.com
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.18-2 tag
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PlltkriSGiJHr3eJaZe18xgf69w9bGQ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfXz9NIxfzG8YPS
 Cbj1AADVWibLflO3fwARyR044PohokSI9dV+4WdtJ/9BiGKMan3Oa5T7SgSUqHNDOZAmWSdYca8
 vLAL8n4AvWjyAmB9T+X1TwPKB0KvM7gsJ78ApdHuXfTDFlxSLD4LR1xRvaUNo3JLl7/RKM+P5n4
 wumNBeI8WO9oAEQ7Js9ISaF0BwD2PMblBK41nbI8VbTetdk3S0vIoxhkRx3WjL9XUHr3X7xMPqL
 iBDCyheVBt+4pbTBWa6esSpXWm0FJLTlX/JVY8j29sgekIx27x0/vydJyUZO7bk4GyvTCSXxseo
 c9V4gBicZJLxYR08Tgjsqqzpoo8szbH+QJHaAwIdrGPMIMTrV3ZrjKc1zStePuipMSMvfqlTFTh
 34eBIelJPaUOeI/aIhvc49fs0RTa8A==
X-Authority-Analysis: v=2.4 cv=MIJtWcZl c=1 sm=1 tr=0 ts=68f37154 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=jJ4fPYr-ll4d2aWJJawA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: IKZymoTlt8rX0rXkbq3wJdCDYTqA3cGD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi Linus,

Please pull powerpc fixes for 6.18:

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the git repository at:

https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git 
tags/powerpc-6.18-2

for you to fetch changes up to 0843ba458439f38efdc14aa359c14ad0127edb01:

   powerpc/fadump: skip parameter area allocation when fadump is 
disabled (2025-10-13 09:41:31 +0530)

- ------------------------------------------------------------------
powerpc fixes for 6.18 #2

  - Fix to handle NULL pointer dereference at irq domain teardown
  - Fix for handling extraction of struct xive_irq_data
  - Fix to skip parameter area allocation when fadump disabled

Thanks to: Ganesh Goudar, Hari Bathini, Nam Cao, Ritesh Harjani (IBM) 
Sourabh Jain, Venkat Rao Bagalkote,

- ------------------------------------------------------------------
Nam Cao (2):
       powerpc/pseries/msi: Fix NULL pointer dereference at irq domain 
teardown
       powerpc, ocxl: Fix extraction of struct xive_irq_data

Sourabh Jain (1):
       powerpc/fadump: skip parameter area allocation when fadump is 
disabled


  arch/powerpc/kernel/fadump.c         |  3 +++
  arch/powerpc/kvm/book3s_xive.c       | 12 ++++--------
  arch/powerpc/platforms/powernv/vas.c |  2 +-
  arch/powerpc/platforms/pseries/msi.c |  3 +--
  arch/powerpc/sysdev/xive/common.c    |  2 +-
  drivers/misc/ocxl/afu_irq.c          |  2 +-
  6 files changed, 11 insertions(+), 13 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmjzb88ACgkQpnEsdPSH
ZJQVzQ//dleWxaoTyBWXOmES675XjSF2jy4vHCF73+xlp7zGuQ0XTyKPvqzQxUvT
ZG5fbVDeZA12sMU+6gtEa9WKAvI0xjk2OYoFs3Q1baoKyCYYL1v5NOzH7P/B2rw0
0jopt+LnCPzSGxJbcrCzrfvo3e8U2gTBXlssYa/hdNb3QiaF08Gxg66Yj+PNwmZC
dPumXXEvMO+wf0o9NFAMwlPRWLtLTtwET7jT64l0i2VMeClnq9sq3QpCzfBxHCGA
9jrDuEI8m2bJ175zLzZd9gNFlM9OGfAUTFhPMr7D6HIUsBAj9cyoF8yAe0CM2hIF
2ZfAkr+/8akobXB5IPL8sjth1sxUhDAVYrUfQ+L1MDFgqEdnNfDiP25jDdz4L3o3
zboUiHTXb2thVgTQTJNKHgkGQvKbj/mv+6ewJdpsut3UCXU91yCiE/cntCSRb0tw
fysnMZ3HLpe8c9PnhbyW5VMnBMo/rRzzaPRXxOnJ9wWJ0nsLOBvxjxbHnSmZ/6Hz
P7BepcEBFckBcLRdzeDWT3/Y1j2ZJhQl03F6exhZv8ePwS9o0uo3ThfBjxrGPh2v
8IDq1fvgIR+uWgXkl4Ap4kKfuk7xjlrqHFcYmXlx08WfjYrz9oejDGWM9qQn0/oO
6XOTrAxaBlyYJsE2IPE1sLQoQuC3BuN/coBeoTGuihmsPXw2+NM=
=pqn/
-----END PGP SIGNATURE-----

