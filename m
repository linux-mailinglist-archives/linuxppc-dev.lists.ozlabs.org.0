Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E69685E89
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 05:36:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P68JC2w59z3cMP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 15:36:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JRjyiCd1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JRjyiCd1;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P68HF6FvYz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 15:35:37 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3113lGAI006656;
	Wed, 1 Feb 2023 04:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=zddutLsK6Bo1+W6BDJK2gLIhTZE8yUGy01iMI8s1IlI=;
 b=JRjyiCd1VwE4icB4iOMJSxjjF08WNAQnRt0K9aPKOpo//B5ASjcks2aqlgXrTRTUUL6/
 +95XUaqBGZONQP2slXCmu0w0QcwEOKp8DHd+2FZHsKO/qmbIzjAPdHnbvo1w0NHqJrIa
 XFO0twVekutM6gno2wvlQ3/qzL0exNXwYQUqXNKeGNe4k/xOLU96nfpXQYdUKn7gHgGV
 Pe+sMNfIwSe7ckYf3+3JlblwwcS9sNUulJ92445Fj+jqmtemoXvn4qYtADIiPxAwwgDV
 KOtLsrOwhtjIVoWhRy5Ty5vFrC3OgbHM+ZxEiwMINCyc0zhEJ5ByyusSUlTXuIpCCrzx MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfgfq0rrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 04:35:30 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3114VGhn024649;
	Wed, 1 Feb 2023 04:35:30 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfgfq0rre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 04:35:29 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VE7lao014953;
	Wed, 1 Feb 2023 04:35:27 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3ncvttv9dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 04:35:27 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3114ZPG049676576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 04:35:25 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2705A20040;
	Wed,  1 Feb 2023 04:35:25 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DF8C20043;
	Wed,  1 Feb 2023 04:35:24 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 04:35:24 +0000 (GMT)
Received: from civic.. (unknown [9.177.78.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BA9CE60112;
	Wed,  1 Feb 2023 15:35:17 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/5] powerpc: Add KCSAN support
Date: Wed,  1 Feb 2023 15:34:33 +1100
Message-Id: <20230201043438.1301212-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6-OwwKzi2guKQJoW7IVQOmEH0dL_so3e
X-Proofpoint-ORIG-GUID: kkGYPWGD4la1GNMokHNrdqA3fls7LCHf
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_02,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 spamscore=0 mlxlogscore=720 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302010037
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

Add Kernel Concurrency Sanitiser support for powerpc. Doing so involves
exclusion of a number of compilation units from instrumentation, as was
done with KASAN.

KCSAN uses watchpoints on memory accesses to enforce the semantics of
the Linux kernel memory model, notifying the user of observed data races
which have not been declared to be intended in source through the
data_race() macro, in order to remove false positives.

A number of such race conditions are identified. This patch series
provides support for the instrumentation, with bug fixes as well as
removal of false positives to be issued in future patches.

v2: Implement __smp_mb() in terms of __mb() to avoid multiple calls to
kcsan_mb().

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

