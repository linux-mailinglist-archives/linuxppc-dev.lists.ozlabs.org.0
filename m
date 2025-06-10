Return-Path: <linuxppc-dev+bounces-9234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE27DAD2BFE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 04:39:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGY071PGXz2xHT;
	Tue, 10 Jun 2025 12:39:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749523159;
	cv=none; b=GX7/tMLxF8PD5nZyaQ56cFtwyFzpGXTKhf4r6hSofQdxbIXfF8VLne1YnDyfvqJmxYmuqSUwS+6aPUbTZEcEs3lgBHz5BcTEn+0sFFOHAgWRihRj46ylWbZxyebg8cjf6iAOXRilX2ldNgfT3grLfgJehmDIiTj1GyHF9l9hs2xV6PacU8Ewl7EQQbCr5y2uXnxO5qFDZs598V1XkhCASEASNp+cySB3TYOtoZoVFkwIiXxAEkD3lVVmXv4j/zeH5UrxPuQSc6pFv4/ShEyIa/mcb45fAk60/kCzvlLle3QvEyBI0d8koOe6ylBEGe5QQmPU4wkfhEcOnpQxSQ/RjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749523159; c=relaxed/relaxed;
	bh=hRFjUx+dw3W9iLAWoYr0yzysCeYtA/KvlD5jwetnsSA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Epx5FP8ozehCJnyUN0mU/Dvj16iYip/lF/fXRFh46L+wTbB3hlk8+lDSlyo2IIp97ssHhzehWT2nviOXIJ/jpRPPI/SIYljiFo++3+I4w9gB5MV9j51C8xzea6LxydgdlrFLJVChp6xylhmba3VIcDXCu2LC9RlCx5pJD7Ge3NEgp9Bd5b1fBBbUNmgqPE+TZfzgdK/Ltet1Q8UmJC0PhEZx1iB3bccWaixpaS4bXRvhLFqazUn97Nn5Z5dgwyEt12IxWSN+1DkjtdgNMA3ZUBrVD/8OPUmLR6ULxAG8YWxNdE2bqeTQ8zyRRyaIZrj6mInNKfUwz+6uhpL75fLEzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OT4C18od; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OT4C18od;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGY062GTvz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 12:39:17 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559KmcNk015375;
	Tue, 10 Jun 2025 02:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=hRFjUx+dw3W9iLAWoYr0yzysCeYt
	A/KvlD5jwetnsSA=; b=OT4C18odtNmECT6z4nnpVen4M75QjLAowBJZJ9JKHpUD
	kAQyLxrkVPc7/M/5xBQTWirQc0vK1aJJ9QnJKnr7oqVq4vfOakGbZx8pe1JVXg3K
	NS/Ingklp3zsdQ++tfDkrJn8xlmAYwMqzIaxyCS/9HyaA/fnM8SuypNufxjEr/+U
	faje3+g+KamthBqbM2vBBKs9YhYcFaN2rQ+FBmmV6vHEigCnrL2VKg5pI5B5lBE3
	Nwp17BMKxlsbp+Mj+MytFdpHD87YJTajDHqQgGEdUGx1wcqmOoplxNp7WyJKmKWV
	9xxeEgOPb1ChkNsFynBdB0aQKdniLyxR8H0txZ/qoA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474hguaux1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 02:39:14 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55A2bCJP004406;
	Tue, 10 Jun 2025 02:39:14 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474hguauwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 02:39:14 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55A0H4YH028110;
	Tue, 10 Jun 2025 02:39:13 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47518m8aqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 02:39:13 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55A2dCro24969956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 02:39:12 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5322E58056;
	Tue, 10 Jun 2025 02:39:12 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAB9758050;
	Tue, 10 Jun 2025 02:39:08 +0000 (GMT)
Received: from [9.43.59.164] (unknown [9.43.59.164])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Jun 2025 02:39:08 +0000 (GMT)
Message-ID: <be959fb5-0cab-4a7a-890a-0ef4e9fc4d2a@linux.ibm.com>
Date: Tue, 10 Jun 2025 08:09:06 +0530
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
Cc: haren@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, ritesh.list@gmail.com,
        =?UTF-8?B?15nXldeg16rXnyDXkteo15nXoNeY15w=?= <yonatan02greental@gmail.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.16-2 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Pfr/hjhd c=1 sm=1 tr=0 ts=68479ad2 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=4KhVPFJXfovPVW0G7AQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: sqnQJ-oIpfqIOy9GH8XZnQUJm4A0Usbz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDAxNiBTYWx0ZWRfXzjdeFGWgPXN2 u1p3xREIFtW9rptqUYLmvV5M1yc1C2N014BMpvgXo0vT4KvlFCxiOjAxw2TVvhPxlCfwNCS+Lpm UYwDGMPGqq4EVMidYr8sDb+wC14kOafJQXRF4n59Xk1ckJakTWYr2SeyTCsCskV1qv5gCTMo+Jw
 KEa9xM9hPSzbARq1L/IVNsUCiu4t5ZouI3kU4WwgUkIetYdPwjQfTXrBWrf4WrxN/CTXBOEgOko iHf/xcWJlFXZKxY9oB2WvM7ikUyUx+KxM0JcICosPd4DZ315Y18Rr1dlywexAdxMPpMLybjqYe7 /H1WFBCLSLsHS+2S/BunR/6DUHzf/1vqcdJRfO+QjX02xYfoO/g97myk+VEGYWo2bFkLq0kIz2d
 +8/8ew4BZKc8JuzxQkyWlBwjWhSTFOfGZZcHTCXeJR9IwLNvJ2I4H3PCcRwnXtZq8pEC+I3L
X-Proofpoint-ORIG-GUID: vzHyflECsKsXXv8JG8I2VlKtIt993jAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_01,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=735
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100016
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc fixes for 6.16:

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.16-2

for you to fetch changes up to 0d67f0dee6c9176bc09a5482dd7346e3a0f14d0b:

  powerpc/vas: Return -EINVAL if the offset is non-zero in mmap() (2025-06-10 07:56:41 +0530)

- ------------------------------------------------------------------
powerpc fixes for 6.16 #2

 - Couple of fixes for out of bounds issues in memtrace and vas

Thanks to: Ritesh Harjani (IBM), Haren Myneni, Jonathan Greental

- ------------------------------------------------------------------
Haren Myneni (1):
      powerpc/vas: Return -EINVAL if the offset is non-zero in mmap()

Ritesh Harjani (IBM) (1):
      powerpc/powernv/memtrace: Fix out of bounds issue in memtrace mmap


 arch/powerpc/platforms/book3s/vas-api.c   | 9 +++++++++
 arch/powerpc/platforms/powernv/memtrace.c | 8 ++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmhHmhEACgkQpnEsdPSH
ZJRO6w//Wg+R/eJnGwTCHcemPS4Qxd+PhvMQsW+2Z7nPMA5I/5qG6ScIRD1L9dja
SS0qPwzKBXzOo36ohVev7t6F8It2vI0XgqOEphsesqMLej9y3F8mivQOBMXTfxWG
/1EL1E9ypMK0whYuInw6/PHGRN+KtXF1HHjvIppQ7oNVd7MvaSgOutMPeF3m1oKa
P/suie3uDqSpE8XJSQkghNnk44isU9UpncYbLwy2mnG8N5mXGHVjmIiU5lGYydVO
hnLjzHsZunPBZZ4FKKqTZuT1NiKvRACaKu0l5s7hc/vXmv6U9qCMYpMcU06Cdti0
Bc+hgXLNDyf+BZsElL/TRifDMYJIK0F8uUMTYOb8KatvArXqHmNQObfUSxYRJaJE
u0/c82NMrOLJuB1PAU2nlGtZXf2JVPYcrSg4cMoGQ+mllRoJAjGLXZZ1Kvf6134p
UjI8QrYgtNmljd/qyAhlXpvpAjlmJdXLPYhtGrHxIH0w9EqD9Opvcnb3v+AoyeJd
ujsTRMRtgFealv+zovoBRAuRAFYEVrSValwnd03ziDTKHEa8iEYFeCAYwQHUWB2t
vSjxQTqpFnZS8O1pES3G05vFf81Djkzs1BxsnJlvZQKm1+keUu12L/2lb33ZMrq3
wo9mYrGolW6rPVQKx5kGqxg4GgqBRkh+UocAWeT1tXTUJyMStp0=
=Gm1F
-----END PGP SIGNATURE-----

