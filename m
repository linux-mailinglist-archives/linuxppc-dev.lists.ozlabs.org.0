Return-Path: <linuxppc-dev+bounces-13340-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 556FDC0ED96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 16:14:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwH8n5x7yz3046;
	Tue, 28 Oct 2025 02:14:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761578041;
	cv=none; b=KTwNhY5BQ9IBb2in5hlYjkmWsTzdulDnqJzrkKwOuxC2KEaVcCPAM0/lTS4AJUAYa8abvg3otGo8ildU7NQC9IsP0two2VEk/q1z0pVjS27GAn8eMYUew7LsKqzzUZSnLk6d2UurF7jxGx7dy3Nt454FQ4qbHouipJ8LCdgWzLD7bAVyV4Kof7xTYJzN6GDc3zbdq/DihDkDrC0Wf4dfkFtuIu3u+m+SH+0WnRJs5CtnZUYwD/3Drloce/i5DgiGC608wBxZvFpgjnZKJ8iaqiVkj1qZaoPEpf8Unc1Vi/U6jqmgkxWRlN5oF1ZEKNMlJW79e8I+EoDvoAK94li4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761578041; c=relaxed/relaxed;
	bh=aR2ayyuUM/rmWHSC9ebKCgClcYSklGgivqSU2zcdpfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sj4ESAQcAVKSacAWwwCQxsjmviJ8c8OSb7ch+Y5IoNRkWM1A7c+J3sd6Ovr7aEn3jfXG6XYHJiuc8DprBHxJMvPyh4ommNyo9bNpa5Rf1palxzYlq+Qwh36fFG+7qyAEkoVreVsRDYl9nGRaWRxKEAemZ11OhHvRvz0RvvPetUy9UX4hy78uQFlglKqDmHQz81aIfoxa+VyslblkNMWF3KK9nAuHOryb4lM8YErgpQiSN+3AMHizxtdjxP+UVJc9/sqUGvRcbBvSxeI8pjD5BRhWrEXGlfI1omL0cnl4vZ3pjBy3ZBiZANowkUuPpuhC8+U/zONGjXjnzmrNdkAciw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hrE+nw81; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hrE+nw81;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwH8m5J3hz2yFW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 02:14:00 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59R9bGYG022311;
	Mon, 27 Oct 2025 15:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=aR2ayyuUM/rmWHSC9ebKCgClcYSklGgivqSU2zcdp
	fw=; b=hrE+nw81lyvQQhb2paUF9g91tidAdubF9+HX9FZZAsHpOwIDTjaUjdYR/
	TQyT4qay+PX3ToqQVHnxgTJO1JOQcK26bTA62wkOC2Rvs09+cuc6xLouXd440X+f
	bt7XjAue44t9aJ6N3kiEg2Ie+A5NAUaqa0srqJVnacM/pJyDMw1XFCirRXEd44PW
	S7Hj2bSzvRTX7PQANSMlr0xs/h6u/U+o9y4GzT1oML1eVvLr1OWXD5L/4gI7ZcW9
	OfGA9m+kILgnvKTTCTASwnTzUcsMVHSc8aEAfHIhBuA7LSJRjYoykaqHXKrNHMTj
	6Khj1qLDvMl5ByeWLGB/j9gqtLV7A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0kyt7j4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 15:13:50 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59REwFqf003818;
	Mon, 27 Oct 2025 15:13:50 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0kyt7j4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 15:13:50 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59REwITP022935;
	Mon, 27 Oct 2025 15:13:49 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a198xe8kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 15:13:49 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59RFDjVt56230314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Oct 2025 15:13:45 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 773512004B;
	Mon, 27 Oct 2025 15:13:45 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD29B20040;
	Mon, 27 Oct 2025 15:13:43 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Oct 2025 15:13:43 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: [PATCH 0/4] powerpc/kdump: Support high crashkernel reservation
Date: Mon, 27 Oct 2025 20:43:34 +0530
Message-ID: <20251027151338.819957-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
X-Proofpoint-ORIG-GUID: bt_x4Bxnc9tf4KI10m8gMWbmpBsMpfav
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAwMSBTYWx0ZWRfX6zVCIgZ3SUOR
 uLyKOt1TpqHq6kUyeV5a912gOIK5eTCuM3gx2swyM/UQJUteVtN68xhTmdOPU4FKJ2cPHNcmb7h
 Ipgtfoo8iaAQIrHlDxKHpDWX23rASIDfLN0UXW46b/evI1wAtcUcsmuIohxxXADJjZB8PchU2rv
 ru5/2cK2/PsN4XFQvqA5EtzBScP0g08d5aRwfFdapp3B/ms+d83IehHpthr4KSfvPsiI+sj/T/p
 tAAHeX+UGNkMdNvnUGEfvAEIKXuphsaRlSYvUCMPTeKjhlVM0UxL5Jny6bXhWzY7UMPQTpjceiD
 51I8TkNoSe66w5nvjT1AKrZZjdQvzJFxvhjQc2yfamKmZCMRNyY7m0WW+RBTkYKRCRo4srQ2Uzt
 HMRN/QGP0XLLpHx+ARUfkPval4Sbtg==
X-Proofpoint-GUID: zNjXU_ci3gOA3PRSPKxd7OWz2ZXLuaJ0
X-Authority-Analysis: v=2.4 cv=FaE6BZ+6 c=1 sm=1 tr=0 ts=68ff8c2e cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=Baha8rCX1pv6ZXSPr5UA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510250001
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add support for reserving crashkernel memory in higher address ranges
using the crashkernel=xxM,high command-line option.

With this feature, most of the crashkernel memory for kdump will be
reserved in high memory regions, while only a small portion (64 MB) will
be reserved in low memory for the kdump kernel. This helps free up low
memory for other components that require allocations in that region.

For example, if crashkernel=2G,high is specified, the kernel will reserve
2 GB of crashkernel memory near the end of system RAM and an additional
64 MB of low memory (below 1 GB) for RTAS to function properly.

Currently, this feature is supported only on PPC64 systems with 64-bit
RTAS instantiation and Radix MMU enabled.

Two critical changes were made to support this feature:

 - CPU feature discovery is now performed before crashkernel
   reservation. This ensures the MMU type is determined before reserving
   crashkernel memory. (Patch 01/04)

 - RTAS instantiation has been moved to 64-bit mode. (Patch 02/04)

Apply the following patch first, and then apply this patch series:
https://lore.kernel.org/all/20251024170118.297472-1-sourabhjain@linux.ibm.com/

Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>

Sourabh Jain (4):
  powerpc/mmu: do MMU type discovery before crashkernel reservation
  powerpc: move to 64-bit RTAS
  powerpc/kdump: consider high crashkernel memory if enabled
  powerpc/kdump: add support for high crashkernel reservation

 arch/powerpc/include/asm/book3s/64/mmu.h |  1 +
 arch/powerpc/include/asm/crash_reserve.h |  8 +++++
 arch/powerpc/include/asm/kexec.h         |  1 +
 arch/powerpc/include/asm/mmu.h           |  1 +
 arch/powerpc/include/asm/rtas.h          | 11 ++++++
 arch/powerpc/kernel/prom.c               | 28 ++++++++-------
 arch/powerpc/kernel/prom_init.c          | 26 +++++++++++---
 arch/powerpc/kernel/rtas.c               |  5 +++
 arch/powerpc/kernel/rtas_entry.S         | 17 ++++++++-
 arch/powerpc/kexec/core.c                | 45 +++++++++++++++++-------
 arch/powerpc/kexec/elf_64.c              | 10 ++++--
 arch/powerpc/kexec/file_load_64.c        |  5 +--
 arch/powerpc/kexec/ranges.c              | 24 +++++++++++--
 arch/powerpc/mm/init_64.c                | 27 ++++++++------
 14 files changed, 161 insertions(+), 48 deletions(-)

-- 
2.51.0


