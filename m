Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7333E68B420
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 03:21:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P993l1v0tz3f5x
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 13:21:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q4J0+DZu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q4J0+DZu;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P990j0CP3z3c7X
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 13:18:28 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 315LHKSX027818;
	Mon, 6 Feb 2023 02:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=kxo2T9dbN4vJvwloy1tdkvI4r06gKuctoQ2QIoonF40=;
 b=Q4J0+DZugE0VHeWLs93SrGFElTQTo/D7oR1ToHNiJe5nBK9UY/0KfWnMi7QPcj9FZP9S
 AVMBEng2T2Jc8u/9wFLpTzlFP6BKZdvarYjtEL4gLSeYTHabouf0dc2Ji5UOSesIZ5R0
 9QeA3O0IfhCI43lwqKt+LcLaaN3fUTg8X61X2TDTNw5359VavXyfTMz+DuaLt4bQzbZ4
 adG9gx/KEQcNdZZac1voV1e87PVO8/g4hYEKs+IDsJKVFAwC7jJDYhAVck3KLWc3KQvp
 ixF1N/Lqb34gudCnEr9d/vbpUekSnUAAGDQlpChh7Rwu5E3LHNIuJlutpDfsMzL23WdT UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nj0thkmum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 02:18:23 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3162E8qB032245;
	Mon, 6 Feb 2023 02:18:22 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nj0thkmu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 02:18:22 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3157OeR9006266;
	Mon, 6 Feb 2023 02:18:20 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3nhf06havk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 02:18:20 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3162IHVH51577292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Feb 2023 02:18:17 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD36F20040;
	Mon,  6 Feb 2023 02:18:17 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 291A620043;
	Mon,  6 Feb 2023 02:18:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Feb 2023 02:18:17 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5A75460060;
	Mon,  6 Feb 2023 13:18:14 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/5] powerpc: Add KCSAN support
Date: Mon,  6 Feb 2023 13:17:56 +1100
Message-Id: <20230206021801.105268-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lH5gGvrPHkjwdRBPSC4K6TxxQTWiP_ah
X-Proofpoint-ORIG-GUID: h920wgKDEQqNFa9PCBv2NFPPlDVm0x4W
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_02,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 mlxlogscore=606 adultscore=0 phishscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060018
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add Kernel Concurrency Sanitiser support for PPC64. Doing so involves
exclusion of a number of compilation units from instrumentation, as was
done with KASAN.

KCSAN uses watchpoints on memory accesses to enforce the semantics of
the Linux kernel memory model, notifying the user of observed data races
which have not been declared to be intended in source through the
data_race() macro, in order to remove false positives.

A number of such race conditions are identified. This patch series
provides support for the instrumentation, with bug fixes as well as
removal of false positives to be issued in future patches.

v3: Restrict support to PPC64 as kcsan code expects support for
__atomic* builtins for 64-bit atomic types.

v2: Implement __smp_mb() in terms of __mb() to avoid multiple calls to
kcsan_mb().
Link: https://lore.kernel.org/linuxppc-dev/20230201043438.1301212-4-rmclure@linux.ibm.com/

v1: https://lore.kernel.org/linuxppc-dev/20230131234859.1275125-1-rmclure@linux.ibm.com/

Rohan McLure (5):
  powerpc: kcsan: Add exclusions from instrumentation
  powerpc: kcsan: Exclude udelay to prevent recursive instrumentation
  powerpc: kcsan: Memory barriers semantics
  powerpc: kcsan: Prevent recursive instrumentation with IRQ
    save/restores
  powerpc: kcsan: Add KCSAN Support

 arch/powerpc/Kconfig               |  1 +
 arch/powerpc/include/asm/barrier.h | 12 ++++++------
 arch/powerpc/kernel/Makefile       | 10 ++++++++++
 arch/powerpc/kernel/irq_64.c       |  6 +++---
 arch/powerpc/kernel/time.c         |  4 ++--
 arch/powerpc/kernel/trace/Makefile |  1 +
 arch/powerpc/kernel/vdso/Makefile  |  1 +
 arch/powerpc/lib/Makefile          |  2 ++
 arch/powerpc/purgatory/Makefile    |  1 +
 arch/powerpc/xmon/Makefile         |  1 +
 10 files changed, 28 insertions(+), 11 deletions(-)

-- 
2.37.2

