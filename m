Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACED85FB55
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 15:34:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L+ll0oIH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgbJR2LVbz3fQR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 01:34:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L+ll0oIH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgbHd0Xqhz2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 01:34:04 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41MEWA6j003869;
	Thu, 22 Feb 2024 14:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=SkW65BNKyUwWU0v4NRmdx4GQ+g+y60Q/zkRCnOS+nao=;
 b=L+ll0oIHN8Fy8iRxekw2HYocJVIYABKEhQFts/oAuPeMSaXsmRD4Nik1Ieoeusvwtbct
 firLHP+HVI2FCJGohUXX95AMhZLVFb/Mhbjxj1LSz4DvxBecqlSEYPgGK7oTsGxg1GDs
 Al1gra91CMUT+fbpMPD7nOPyIKBRy6Z4mvw6tQ4Awo42Ub4Ah5rvrcF5LnHiW9Xym0oB
 Z7z70pEG5dId/j76uVF9RM6IUs82Yx+1Rc3OMu/XwnmQPcjfYNrgqXd+HQQEBavLGcdq
 xY7TfHJoJlSqODdso4fZlPwVE1kRYMrlSdZ5Osr350basP5+gIl1zG0h3Akt1gxM823K dA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3we845g256-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 14:33:49 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41MEWR4k004668;
	Thu, 22 Feb 2024 14:33:49 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3we845g23u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 14:33:49 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41ME5wbp013470;
	Thu, 22 Feb 2024 14:33:48 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wb7h0pys2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 14:33:47 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41MEXgAJ14746164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Feb 2024 14:33:44 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 273A820043;
	Thu, 22 Feb 2024 14:33:42 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15F532004E;
	Thu, 22 Feb 2024 14:33:42 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 22 Feb 2024 14:33:42 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id D3921E0294; Thu, 22 Feb 2024 15:33:41 +0100 (CET)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2 RESEND 0/5] sched/vtime: vtime.h headers cleanup
Date: Thu, 22 Feb 2024 15:33:36 +0100
Message-Id: <cover.1708612016.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DWilcBPorEPdwtnR0sFiGCPVISGjb0bZ
X-Proofpoint-GUID: 9Lzv7XImVzxe76IoKrsKYYXS1zqCGiN-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_11,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=772 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402220116
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Frederic Weisbecker <frederic@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

There are no changes since the last post, just a re-send.

v2:

- patch 4: commit message reworded (Heiko)
- patch 5: vtime.h is removed from Kbuild scripts (PowerPC only) (Heiko)

v1:

Please find a small cleanup to vtime_task_switch() wiring.
I split it into smaller patches to allow separate PowerPC
vs s390 reviews. Otherwise patches 2+3 and 4+5 could have
been merged.

I tested it on s390 and compile-tested it on 32- and 64-bit
PowerPC and few other major architectures only, but it is
only of concern for CONFIG_VIRT_CPU_ACCOUNTING_NATIVE-capable
ones (AFAICT).

Thanks!

Alexander Gordeev (5):
  sched/vtime: remove confusing arch_vtime_task_switch() declaration
  sched/vtime: get rid of generic vtime_task_switch() implementation
  s390/vtime: remove unused __ARCH_HAS_VTIME_TASK_SWITCH leftover
  s390/irq,nmi: include <asm/vtime.h> header directly
  sched/vtime: do not include <asm/vtime.h> header

 arch/powerpc/include/asm/Kbuild    |  1 -
 arch/powerpc/include/asm/cputime.h | 13 -------------
 arch/powerpc/kernel/time.c         | 22 ++++++++++++++++++++++
 arch/s390/include/asm/vtime.h      |  2 --
 arch/s390/kernel/irq.c             |  1 +
 arch/s390/kernel/nmi.c             |  1 +
 include/asm-generic/vtime.h        |  1 -
 include/linux/vtime.h              |  5 -----
 kernel/sched/cputime.c             | 13 -------------
 9 files changed, 24 insertions(+), 35 deletions(-)
 delete mode 100644 include/asm-generic/vtime.h

-- 
2.40.1

