Return-Path: <linuxppc-dev+bounces-8279-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD6FAA8D80
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 09:54:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrYh410xsz2yhb;
	Mon,  5 May 2025 17:54:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746431652;
	cv=none; b=hMIlqlevdjYsizXA7Fxyboa9nwsCojyNtUjysuM8bCwzouqG2ItS+SV6RgBmaWAgOnmuaUclJrBU/yLZe4aU+n3Cj3qDq9A5eQPKyGCm8d5ePl0NT06TD6JxSCiWrLo0LkvaWnKegHzLgAH7K4FzXLlRQT60w+l3wv0TltwuAvVPMkMspzuiZx2CxC+MUpS8UphQW26Uw4YPBd7zxMUMO0oe8Wtor5dtBqy/jw0ugHhOE+1Yi9pmaW2ZVJZg2L8Fawp0IH23CEudDjnu0H3yil0na8YSzUx+6yDu0vmxgDOLsSamfa0nruHo6K7JrkOkwvRT5YLnaQMSAzXWN48PkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746431652; c=relaxed/relaxed;
	bh=zSg6q4w8GFrHmnk6F9LccDvj3EB4lnCvHDLF5Aam14Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T2nFAgsS/F5QWcZ2vCjTbUMa9mlYA/USOS/s2aHItCbW0K8v9fPLzKa36m2oLIQAgrupuJfqYSniBlkSwKhAYhnXT7MsQ07TfD7znXcAihs1vYN8uXlQG/XKWf0kF6SlelVVsfRTZaEjns1DHhSAWoi1vK/mHjatLvNHIdcv9hAwQGWzE1iM+Td6pFhW0NNZLGwpPxEBQ5uYO5LDts+upHIpU9+tJormTELk2Umj6klr08SJTuLEt8F4prmhzrq15qrAvGHPudXolnSAhUw68jX/kDkDpXtf82PwbX9Ivhs5qAP+EhrLvE3Eik0kA8ZPyuu2BX1xHimI2jB4G/6+/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dbYKgmuD; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dbYKgmuD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrYh325X7z2ySV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 17:54:10 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544JrsS2015827;
	Mon, 5 May 2025 07:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=zSg6q4w8GFrHmnk6F9LccDvj3EB4lnCvHDLF5Aam1
	4Q=; b=dbYKgmuDo0/Bx7K0x2p1WFcICiL4CTxgVxgdWBGr4Nl3rLbWQORIT/b+i
	cAAaceF2qS0o56pMZBoSlgyNVBTkM3jJp1vUnYZeXATnJ6WwZtATrr81WtFfT1Ux
	KuRQ/yThw9hXoXuJpZayFa7uXlT3hsyD1HA/g1G8ezOJashJK1qVPz5oU8lfHoE3
	w6sfkQDn8j1pZf1osM2cyY2Pt8Em99qXrslmgPikCaPtP5/yiTlb9+6UweBFDRbm
	UbKxcf06syIQJg/CJBaDiRfpy8FoiJvP6672F2IexCbkes+1XLGvIcESXMuaB1/N
	zhm0COXBEW94zDZzQTofeKLZUUoHA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46e65hu99f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:53:57 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5457q4h4030120;
	Mon, 5 May 2025 07:53:56 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46e65hu99c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:53:56 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5453q8mV032252;
	Mon, 5 May 2025 07:53:55 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxymd4ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:53:55 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5457rp1n52625812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:53:51 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EAA22004B;
	Mon,  5 May 2025 07:53:51 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6665D20040;
	Mon,  5 May 2025 07:53:49 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 07:53:49 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, ajd@linux.ibm.com,
        mahesh@linux.ibm.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] powerpc: use lock guards for mutex Set 1
Date: Mon,  5 May 2025 13:23:27 +0530
Message-ID: <20250505075333.184463-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=UZ1RSLSN c=1 sm=1 tr=0 ts=68186e95 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=b4va75BfmSkk2aLqjCIA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: KT6QfzeeIRIZZpNqErV0zQOnHpaqG7ld
X-Proofpoint-ORIG-GUID: mPP586Orw0TUNq-3VMWGwsAiaqdRv-Dq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA3MCBTYWx0ZWRfX1ZOs1CfwDvIr 67777wiXn5ktsSRp65CiLX7MANBCq6HFRQIdoB04EMAzSU11uL7ZVf1YvJwPTyFeT0sFlLcH+yy xg0c7lN9GowoABYm/zB+E+XFx0Tqqz5cQMSuocFYFVYXFWYtICJ5lgeeBWMWylMGppSNh6gSz4H
 +QOtteJuQOMZ+JvrwnZCJbqS8t8G3iWw06GhnhY08NLiKIZ4HEVB1klw3TmOfx7KF3t1Zwji0zN zmCQFOO+KqIxLZVrGyRDWDXRFCII5LxqHjDQmY4VDV9QT0cSlAFK8tMzC9c9qG//qHGexKF+YUr OkbzFfxNOhHThV2lpyFsaNY2dsuSgD1nJF4R1j3vzwsxXA3BZ7dGsGxN9PCdUokl6roJKfSBJGQ
 sJelh9r1FNDAGK9RUURetUGcKO+Z8UwYKVxaNghUhnvOi/XlxbklHfVmtX2hV/Apr7dHTVSs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 mlxscore=0 mlxlogscore=843
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050070
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is an effort to make the code simpler by making use of lock
guards which were introduced in [1], which works by using __cleanup 
attributes. More details in v1 cover letter

v2->v3:
- Collects tags (Andrew Donnellan & Srikar Dronamraju)
- Address comments from Srikar Dronamraju 

v1->v2:
- Fix changelog of powernv (Andrew Donnellan)
- use scoped_guard in couple of places to avoid holding mutex
  un-necessarily (Peter Zijlstra)

[1]: https://lkml.kernel.org/r/20230612093537.614161713%40infradead.org
v1: https://lore.kernel.org/all/20250314054544.1998928-1-sshegde@linux.ibm.com/#t
v2: https://lore.kernel.org/all/20250314114502.2083434-1-sshegde@linux.ibm.com/

Shrikanth Hegde (6):
  powerpc: eeh: use lock guard for mutex
  powerpc: rtas: use lock guard for mutex
  powerpc: fadump: use lock guard for mutex
  powerpc: book3s: vas: use lock guard for mutex
  powerpc: powernv: ocxl: use lock guard for mutex
  powerpc: sysdev: use lock guard for mutex

 arch/powerpc/kernel/eeh.c                   | 20 +++----
 arch/powerpc/kernel/fadump.c                | 11 ++--
 arch/powerpc/kernel/rtas_flash.c            | 64 +++++++--------------
 arch/powerpc/platforms/book3s/vas-api.c     | 32 +++++------
 arch/powerpc/platforms/powernv/ocxl.c       | 12 +---
 arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c | 14 +----
 6 files changed, 50 insertions(+), 103 deletions(-)

-- 
2.39.3


