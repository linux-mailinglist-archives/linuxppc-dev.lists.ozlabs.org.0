Return-Path: <linuxppc-dev+bounces-5684-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD45A21DED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 14:36:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjjqZ0lRXz30Sw;
	Thu, 30 Jan 2025 00:36:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738157802;
	cv=none; b=gGYmzMg0nUTQ+ZQG3X2hX6uA9mNi1vsq45DfwuZqM4DhRSTOHYcSQKouu4WVgyejcebu1OSZntHAC6omq+sZ+youUcVpfsMGbuwwtIg5dZjZMELEK0Q4vGJAM3IUVm4s3XeW7EMG/YCg4sdYPeomsXhu/S2ZuhF3O2lCYaeQm1uaoZu7pjIr21gclSzrEWv3+Y6ZYqVRaVMYChm8EZaduYbSuTVk4fOgSi5K38PL4NK2AjAHV9ZFqZ2KhlFQzhC+t6dwipWqTO96bSca7PwGLe7se9zNJwgEWBSPkBSPnfZ22QDWatzgN1fF5CbrQLiEbl2xP2U9sRdByQ6uYdtu5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738157802; c=relaxed/relaxed;
	bh=nJShszxgIZubv/wZimLZNt0afHZl3VqCm4EZ5sgEMgg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=gAQOdHsq1cUuck8O/z2tnX0WQ1tFLrGpnfeArPt+I1mugN3jmxQBsYfBAkOi0ocpk7O8KmKwM8XeJMP8p1JilUNHs/z1sggcaz687+8/dE/gbeu8vMv9NElD+svm9/+uFd+H7TeAIsfABar/KuqOG/CFczXT2hD4j1mohWRe6Y4D4zCKBIOOoIW4VDGSc/aHjrU/t6CENfslEmKRAaHWAveFmi4JkiLiHSbX+8qlnfuDuGSXQcCAf1cZzXd8NfPs+5ugEFSM8gjMkJBLL7hSg6GultIIqOoPRy6CmUo3OOxIjdb92ULr5Rwmp89/OwLQDh5phHx2puJZMJ/s4AALmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E54WTOsn; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E54WTOsn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjjqY0N5dz30Sv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 00:36:40 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2fNNn003254;
	Wed, 29 Jan 2025 13:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=nJShszxgIZubv/wZimLZNt0afHZl
	3VqCm4EZ5sgEMgg=; b=E54WTOsn31U9Ke+3e9rANZ4FHXbwsncZjvXhQgke70qT
	Q64g3PWI0f5+GFCO0s2MSQeIeh3yMulkSkUqa3FWJzwoba2y6X3VgqxqL/w52KAj
	vw1AfwpFl5xboy9C18wYngzijRTwPX/H8Bb0INWFLQBfIFeAqpYpzR+xAu3dnO39
	qdaaJCa+m5plnYfiVnR+6mG6+2+YEu0D15kdFHvfhN4+ediKmtRSfKzGqXzfQAHh
	uX9hLgBGLHBG3eGq2db/u41wBAJnjnoTfrvdiAxZfLX87l/qn93Ytxaj3gq0lX/3
	EElnv3+YR5K8SNCSHVuG3LLl688RHfsfa5dRG1r75Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44f22t4ug8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 13:36:25 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50TDXCJX006620;
	Wed, 29 Jan 2025 13:36:25 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44f22t4ug3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 13:36:25 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50TC5MWW003929;
	Wed, 29 Jan 2025 13:36:24 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44da9sgyqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 13:36:24 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50TDaMoY28771062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2025 13:36:23 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E262158052;
	Wed, 29 Jan 2025 13:36:22 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B731358045;
	Wed, 29 Jan 2025 13:36:19 +0000 (GMT)
Received: from [9.204.206.207] (unknown [9.204.206.207])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 29 Jan 2025 13:36:19 +0000 (GMT)
Message-ID: <776f5a39-c901-4565-aae6-448489d570bc@linux.ibm.com>
Date: Wed, 29 Jan 2025 19:06:18 +0530
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
        nnmlinux@linux.ibm.com, sbhat@linux.ibm.com,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.14-2 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nSZDsv-03pkUGMWmfeyu2OfJPjFi0aes
X-Proofpoint-ORIG-GUID: UAS8aAnPtnCviNt11aFt-IPAh2nbx6IW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 mlxlogscore=746 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290110
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull couple of powerpc fixes for 6.14:

The following changes since commit 2bf66e66d2e6feece6175ec09ec590a0a8563bdd:

  selftests/powerpc: Fix argument order to timer_sub() (2025-01-11 10:39:45 +0530)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.14-2

for you to fetch changes up to 17391cb2613b82f8c405570fea605af3255ff8d2:

  powerpc/pseries/iommu: Don't unset window if it was never set (2025-01-21 10:43:08 +0530)

- ------------------------------------------------------------------
powerpc fixes for 6.14 #2

 - Fix to handle PE state in pseries_eeh_get_state()
 - Handle unset of tce window if it was never set

Thanks to: Narayana Murty N, Ritesh Harjani (IBM), Shivaprasad G Bhat, Vaishnavi Bhat.

- ------------------------------------------------------------------
Narayana Murty N (1):
      powerpc/pseries/eeh: Fix get PE state translation

Shivaprasad G Bhat (1):
      powerpc/pseries/iommu: Don't unset window if it was never set


 arch/powerpc/platforms/pseries/eeh_pseries.c | 6 ++++--
 arch/powerpc/platforms/pseries/iommu.c       | 3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmeaLZoACgkQpnEsdPSH
ZJTlbRAAqJFHGgfELHJsJXwJMF7wvCAVoZqw2vQ9Me5d1l272QjmaVkHBOUqOYUT
wCZkxe4fIlisctQ4ImDRLPueDaBw0gF8i2a8hp20nBvxjE1JGWZNDypokgOq4903
23if7CxW56DBhHcSz9S9Y2zvcSBdNNcm0tuDdLrfAq6ff067EaPwGMZr/raOc6WF
JksXFjbtWxneinn+6bEkT63XHOmz9lNKcW6Hdn91Q+i/ZXOFC69A0tRYKptRogzU
RS4Ile80FRPpF82f2vxca4j/cNbUkPm6DxPTqpMCv3+M8HhHccqZxEKhk+LbdHRS
opFf7kJ79jH6f5F5QxVlnjypnydKzlHNTuCGz0AkQwuC/nrshVwMAlnRIYjE8cvY
GTnxTY4yUlDqcgJ7DQQ+qhmr6rp96WVjrQvDcp94Mahxy4skJ744U2ze2hZsVjX5
W9KKzejo4ufL0+EByi13FYzmBtOKdRTxgNINoE5tCxukrq9wtuTvPse4QmGqJJ9Z
HorS/VDXquLXq0OC4hPlxfRkqowLs5i9/gckoubT1guPykfhDiF5+rCFGZGDiXUk
CkqzsX/9YUBiO53JOYf9EbLJ0oo08CkZNl4Ye/6tEJ4Bd5PpMNiOAAprCN9ul1V5
qQA5niLYMwJShoHu0UwhuuJljZhQWdMczCe8maxU8gqphw56qpI=
=xEz8
-----END PGP SIGNATURE-----

