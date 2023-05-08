Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E56876F9D9B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 04:06:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF4RN5wJDz3fd8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 12:06:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eR8pR8sp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eR8pR8sp;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF4Kb2kqFz3bnM
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 12:01:54 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34812O13006312;
	Mon, 8 May 2023 02:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=x9uuPBJFilS31tosmm2mdjLQ5XgEN04iQ5KIDsTOqvo=;
 b=eR8pR8sp9EyoO4JFfeLVOOtKeqt6NjC2ZiRiodtpxElBcsyJjyPEAOsvGHiIP+EVfxxK
 rvNbMUpD/NyLvIiT4qyhm4QidSUSgZRclBsYZIQ4eZyDAYqgUmSLdLCU1CVTsbqYebRr
 s84E3fyE3InS226N1GTTD1oGM7IDfAzLfeh0nnEV+Oly0ommMCn/Td0W0308miBOXgPo
 XjdhplKRja/MZJW1HbsBLKbY3eG33uXeiw1Vo8oORQ+bTvoItOwBUlsXfi/EgKljz1d8
 3/5YjfurPaxZ1BWhH42bIJQeVHVATz6vCwevvI7acYahme1vBLtR/cYBebk9ZXKhwhoa IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qdka0vts8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:43 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3481vgmL017511;
	Mon, 8 May 2023 02:01:42 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qdka0vtrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:42 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3481LCMu031979;
	Mon, 8 May 2023 02:01:40 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3qdeh6gpe6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:40 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34821cls16777892
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 May 2023 02:01:38 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35E0B20043;
	Mon,  8 May 2023 02:01:38 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC3C120040;
	Mon,  8 May 2023 02:01:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 May 2023 02:01:37 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3C18E602FD;
	Mon,  8 May 2023 12:01:35 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/12] powerpc: KCSAN fix warnings and mark accesses
Date: Mon,  8 May 2023 12:01:08 +1000
Message-Id: <20230508020120.218494-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hp0g-rN96GefQpMi6kfE40B9Co_jM1eT
X-Proofpoint-ORIG-GUID: oQ-NKmIBt0yqzhTzlYISOasuBf0XiX2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-07_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxlogscore=989
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305080009
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

Rohan McLure (12):
  powerpc: qspinlock: Fix qnode->locked value interpretation
  powerpc: qspinlock: Mark accesses to qnode lock checks
  powerpc: qspinlock: Enforce qnode writes prior to publishing to queue
  asm-generic/mmiowb: Mark accesses to fix KCSAN warnings
  powerpc: Mark [h]ssr_valid accesses in check_return_regs_valid
  powerpc: Mark accesses to power_save callback in arch_cpu_idle
  powerpc: powernv: Fix KCSAN datarace warnings on idle_state contention
  powerpc: Annotate accesses to ipi message flags
  powerpc: Mark writes registering ipi to host cpu through kvm
  powerpc: powernv: Annotate data races in opal events
  powerpc: powernv: Annotate asynchronous access to opal tokens
  powerpc: Mark asynchronous accesses to irq_data

 arch/powerpc/include/asm/kvm_ppc.h            |  4 ++--
 arch/powerpc/include/asm/paca.h               |  1 +
 arch/powerpc/include/asm/ptrace.h             |  4 ++--
 arch/powerpc/kernel/idle.c                    |  6 ++++--
 arch/powerpc/kernel/interrupt.c               | 14 ++++++-------
 arch/powerpc/kernel/irq.c                     |  2 +-
 arch/powerpc/kernel/smp.c                     |  2 +-
 arch/powerpc/lib/qspinlock.c                  | 14 ++++++++-----
 arch/powerpc/platforms/powernv/idle.c         | 20 ++++++++++---------
 arch/powerpc/platforms/powernv/opal-async.c   |  6 +++---
 arch/powerpc/platforms/powernv/opal-irqchip.c |  6 +++---
 arch/powerpc/platforms/powernv/pci-ioda.c     | 12 +++++------
 include/asm-generic/mmiowb.h                  | 17 ++++++++++------
 include/linux/irq.h                           |  2 +-
 kernel/irq/irqdomain.c                        |  4 ++--
 15 files changed, 63 insertions(+), 51 deletions(-)

-- 
2.37.2

