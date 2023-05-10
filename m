Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8856FD44A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 05:32:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGLFJ45zsz3fKp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 13:32:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EpmJEFGv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EpmJEFGv;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGLDP4T9Dz2yw0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 13:31:49 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A3TBGk012672;
	Wed, 10 May 2023 03:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=6rzmRzRwhG/Ihe2CoGIzaYU+hlxx1aILaAwfuuryg+I=;
 b=EpmJEFGvJRfqVI5JPuJm/2L2RuKQP57YY3ZSEcwzRJ57D9I47lppz0efN4IMi0FDI0gm
 qBzNU3LSbHeKurzPcA3jn+oD9TpU8horthBOzTWUkcQlsEqR7E7D9oiHG3dr4+w5ig2r
 BdRZCUr6YLk4raPnFIiOeHeRp42xp5ok+98jr0ufLVJOzHWH0K8dXYA/RyGrLDfbkyyB
 Ihj6kKbQ/gycx20mmMG4aqiOYUyLDYJgiVXR/nunFonBxoOKp6WgiibY6f/ev8eL1u+e
 ptimLm5TeqUG7Rg8ezIEbstRkbFd4qxsODg3DzidamO/aMIh/SG6pUnZj8PSwcIZ0Hee Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg29wsp6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:39 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34A3VcRa019245;
	Wed, 10 May 2023 03:31:39 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg29wsp62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:38 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34A2Yud2011219;
	Wed, 10 May 2023 03:31:36 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3qf7nh0s7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 03:31:36 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34A3VYXU31130262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 May 2023 03:31:34 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0189B20043;
	Wed, 10 May 2023 03:31:34 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0003820040;
	Wed, 10 May 2023 03:31:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 May 2023 03:31:32 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id ECE536033D;
	Wed, 10 May 2023 13:31:29 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/11] powerpc: KCSAN fix warnings and mark accesses
Date: Wed, 10 May 2023 13:31:06 +1000
Message-Id: <20230510033117.1395895-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 57csaGUQmgUSdWflW9ENuMseSiBnvD5O
X-Proofpoint-ORIG-GUID: Gx6qb23OQNYSqsHVkOLhOpS_0hNTRhtj
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=933
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305100021
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: arnd@arndb.de, gautam@linux.ibm.com, npiggin@gmail.com, Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

v1 of this patch series available here:
Link: https://lore.kernel.org/linuxppc-dev/20230508020120.218494-1-rmclure@linux.ibm.com/

The KCSAN sanitiser notifies programmers of instances where unmarked
accesses to shared state has lead to a data race, or when the compiler
has liberty to reorder an unmarked access and so generate a data race.
This patch series deals with benign data races, which nonetheless need
annotation in order to ensure the correctness of the emitted code.

In keeping with the principles given in
tools/memory-model/Documentation/access-marking.txt, racing reads of
shared state for purely diagnostic/debug purposes are annotated with
data_race, while reads/writes that are examples of intention polling of
shared variables are performed with READ_ONCE, WRITE_ONCE.

These changes remove the majority of warnings observable on pseries and
powernv, where for development, I was able to narrow down to only power
relevant bugs by temporarily disabling sanitisation for all other files.
Future patch series will deal with the subtler bugs which persist under
this configuration.

KCSAN races addressed:
 - qspinlock: assignign of qnode->locked and polling
 - check_return_regs_valid [h]srr_valid
 - arch_cpu_idle idle callback
 - powernv idle_state paca entry (polling the bit-lock is viewed by
   KCSAN as asynchronous access to the fields it protects)
 - Asynchronous access to irq_data->hwirq
 - Opal asynchronous event handling
 - IPIs

Miscellaneous other changes:

 - Annotate the asm-generic/mmiowb code, which riscv and powerpc each
   consume
 - Update usages of qnode->locked in powerpc's qspinlock interpretation
   to reflect the comment beside this field

v2:
 - Match READ_ONCE with WRITE_ONCE and vice versa where required
 - In arch/powerpc/lib/qspinlock.c, use kcsan_release() to notify KCSAN
   of locked being assigned prior to publish, and remove extraneous
   compiler barrier (publish_tail_cpu features memory clobber).
 - Keep polarity for locked variable in qspinlock
 - Remove extraneous READ_ONCE in mmiowb()
 - Use data_race() for power_save callback to remove instrumentation, as
   there is no real data race

Rohan McLure (11):
  powerpc: qspinlock: Mark accesses to qnode lock checks
  powerpc: qspinlock: Enforce qnode writes prior to publishing to queue
  asm-generic/mmiowb: Mark accesses to fix KCSAN warnings
  powerpc: Mark [h]ssr_valid accesses in check_return_regs_valid
  powerpc: Mark accesses to power_save callback in arch_cpu_idle
  powerpc: powernv: Fix KCSAN datarace warnings on idle_state contention
  powerpc: Annotate accesses to ipi message flags
  powerpc: Mark writes registering ipi to host cpu through kvm and
    polling
  powerpc: powernv: Annotate data races in opal events
  powerpc: powernv: Annotate asynchronous access to opal tokens
  powerpc: Mark asynchronous accesses to irq_data

 arch/powerpc/include/asm/kvm_ppc.h            |  4 ++--
 arch/powerpc/include/asm/paca.h               |  1 +
 arch/powerpc/include/asm/ptrace.h             |  4 ++--
 arch/powerpc/kernel/idle.c                    |  9 ++++++---
 arch/powerpc/kernel/interrupt.c               | 14 ++++++--------
 arch/powerpc/kernel/irq.c                     |  2 +-
 arch/powerpc/kernel/smp.c                     |  4 ++--
 arch/powerpc/kvm/book3s_hv_builtin.c          |  4 ++--
 arch/powerpc/lib/qspinlock.c                  | 11 +++++++++--
 arch/powerpc/platforms/powernv/idle.c         | 16 +++++++++-------
 arch/powerpc/platforms/powernv/opal-async.c   |  6 +++---
 arch/powerpc/platforms/powernv/opal-irqchip.c |  6 +++---
 arch/powerpc/platforms/powernv/pci-ioda.c     | 12 ++++++------
 include/asm-generic/mmiowb.h                  | 14 +++++++++-----
 include/linux/irq.h                           |  2 +-
 kernel/irq/irqdomain.c                        |  4 ++--
 16 files changed, 64 insertions(+), 49 deletions(-)

-- 
2.37.2

