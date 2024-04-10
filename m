Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E792F89FB48
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 17:14:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RBNh+tqa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF5wD5Bymz3vm3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 01:14:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RBNh+tqa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF5qq0Gmbz3vYG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 01:10:46 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43AF76LJ019812;
	Wed, 10 Apr 2024 15:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=S7Sh61Dwbw08Hj8QqXjKFpfPZZqM0K8Q6t/Sk/b6f4Y=;
 b=RBNh+tqaPKTIhKRa+KG5KVN8s36DSZb74fobi7BHt6HaQooIAqn/PnkXtM8BFDHjTW+T
 9Oe7e3W0pDJfG2AND0nSgmRwdo8D2aLCqQefluGkBM4m60b/Xvjk9mbd9+jKsgyYV2+w
 5FkVXCrQYAWjxIPBhKwF0Q+sSUwCop+qt7zi3kJBvvqlHJQa3qBjPZXmiolZNWRbKcdN
 T4+N/BMWsK/adOJnp3scBxfQIr7K/XywKizk6fCJK6s6IB0XFLJFRl51fxKxttjZ+OaV
 WT5jo+MQ6BycbKjoYZrj6u2Q5HzOZNrsemRJBGbHnfW8VAeGmLgM/M1pFcVm00xc6GuC GA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xdw4n806d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 15:09:56 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43AF9uAj023241;
	Wed, 10 Apr 2024 15:09:56 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xdw4n806a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 15:09:56 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43ACSJid016982;
	Wed, 10 Apr 2024 15:09:55 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xbke2n0jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 15:09:54 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43AF9nam48562646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Apr 2024 15:09:51 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 265842004F;
	Wed, 10 Apr 2024 15:09:49 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 125DF2004B;
	Wed, 10 Apr 2024 15:09:49 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 10 Apr 2024 15:09:49 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id CA30CE0301; Wed, 10 Apr 2024 17:09:48 +0200 (CEST)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 RESEND 0/5] sched/vtime: vtime.h headers cleanup
Date: Wed, 10 Apr 2024 17:09:43 +0200
Message-Id: <cover.1712760275.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 43tJPVhQ1qfmHz2XICzEeDqIzqiN8NXK
X-Proofpoint-ORIG-GUID: iPRydWYHzjU6SLaIr79RnupfQ4DzWgiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxlogscore=787 bulkscore=0 impostorscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404100109
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Heiko Carstens <hca@linux.ibm.com>
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

