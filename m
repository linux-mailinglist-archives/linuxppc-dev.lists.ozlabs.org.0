Return-Path: <linuxppc-dev+bounces-7054-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA6AA61049
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 12:45:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDjH42qlSz3cVy;
	Fri, 14 Mar 2025 22:45:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741952736;
	cv=none; b=JA392JwpGJKvfN8x+xBn1AZrp+trvbdmz9E9LL7HX8zZR52+dwT22nhRwFqdr3y+zlf3epBfUe0V4Y8YgTZiuCm5kEOWcq/W0U/O+I8SlVbkxRhaNt95+1pYQ9ncgbMbhFFJiTgdh/S370hlzMsyAC9gsbxdzmcQlKDaXtPz/DgzNkJ9sFu9mQGyixnkMDn9KT3fhq2qBBNfx/CLXvfr5zMmaVzBstxF79XtZk9QjGZEKHeBsG5BilcF1bPh0KtlE+Px10OfFdb0KOlg8YyHMvFQNUQq9rmY4MhSBus6tXqFUr+hf/XHz4WzMC1MC5y79Nj7q2xP3WotGnZvl3Ehlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741952736; c=relaxed/relaxed;
	bh=a4eygYsgH6xm9j1ChXbxlbPu3rkyFVZVTKzeR/0lq0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jEqaE/3OyLBYS5bh4uF8i+Ic9f0A19Pv62XoKzjAGG0v5flFYuIMrlmfwKTWcnrBUd9aOcPap+vxxbf6GDIrbZX3WLMZvCThVLkeB4396B4pcZ+inX8aZbnyklJX2YRUo987arOtFiJQdW9hc+IOo8XSZNtrgcXt1Jablb3im7fDvukUgNDfHul8LNv2CSO2T3wM2saLoR1TqlQMtF8CnXODspDFFq1Rr0LDg9a3WrEUUu1aGaLWzFp6+p+INqSscKdy+1OdKT9npojk9oXyMsjvSi9rUANGUOlnz3qlJGC/vyRji5BBKzN8H7dqz/WBKAd+qbOoyjLT2V6vvsneWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tlb/aZpm; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tlb/aZpm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDjH30sZzz30gC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 22:45:34 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EBWM4E007346;
	Fri, 14 Mar 2025 11:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=a4eygYsgH6xm9j1ChXbxlbPu3rkyFVZVTKzeR/0lq
	0s=; b=tlb/aZpmlthnowGS0PNnQfnS9cB+hM04WDklSxCXyYlMkG6c5X6NyxoNm
	D5UJ4Z/WSOTny8sXP9LIzOCiRTjm9ZIBLSioJ6Z5/qnpVGnhJjQ43g15BBIFjgCS
	ka3kwGsBmTpU1rCfRKCGQF6wvS9wxVA6H7YjbBTpdRMWBmzYp/DzLYgkQSTyZMMI
	N66k+TCSr3pmZ+yLYDMuDubFYlZhoQdz6E2wla+2d89abrzUGz1uep2xJtefcMMo
	xrtdiFIKq38IEH4/kH6bmV+dLPClm6qXeUzneUTAnv77Ik0aN2U+cL/VU2Xc8wux
	XrGjvLrJRB/7YLrNMKvVZeHBp2GiA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6s5b9m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 11:45:21 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52EBh9Q5023801;
	Fri, 14 Mar 2025 11:45:21 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6s5b9m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 11:45:21 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E8qbev003127;
	Fri, 14 Mar 2025 11:45:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atstxqca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 11:45:20 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52EBjHFV11600278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 11:45:17 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E536A20040;
	Fri, 14 Mar 2025 11:45:16 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77FB62004D;
	Fri, 14 Mar 2025 11:45:13 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.22.126])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 11:45:13 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, fbarrat@linux.ibm.com,
        ajd@linux.ibm.com, mahesh@linux.ibm.com, oohall@gmail.com,
        hbathini@linux.ibm.com, dhowells@redhat.com, haren@linux.ibm.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] powerpc: use lock guards for mutex Set 1
Date: Fri, 14 Mar 2025 17:14:56 +0530
Message-ID: <20250314114502.2083434-1-sshegde@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lQBN-gJFQBdMZA5nDmDmNRwgD7dTPS11
X-Proofpoint-ORIG-GUID: QTQFsMH0n01PuCdtn-ytwrnZaQI54Aph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=997 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2503140091
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This is an effort to make the code simpler by making use of lock
guards which were introduced in [1], which works by using __cleanup 
attributes. More details in v1 cover letter

This series aims mainly at simplifying code around mutex with goto
statements. If it makes sense, there are more code simplification which 
can done for preempt, rcu, spinlock as well. Even for mutex, there is
more which could be done. Even there are usecases for kfree which could
use the new __free infra. 

Please review. Code is compile/boot tested except for powernv. 
Have kept the patches separate for easier bisect. Let me if they should
be combined into one. Commit message is same for all. 

[1]: https://lkml.kernel.org/r/20230612093537.614161713%40infradead.org
v1: https://lore.kernel.org/all/20250314054544.1998928-1-sshegde@linux.ibm.com/#t

v1->v2:
- Fix changelog of powernv (Andrew Donnellan)
- use scoped_guard in couple of places to avoid holding mutex
  un-necessarily (Peter Zijlstra)

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
 arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c |  8 +--
 6 files changed, 48 insertions(+), 99 deletions(-)

-- 
2.39.3


