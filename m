Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CD7685C0F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 01:18:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P62ZC6msZz3cdc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 11:18:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RI7uLn2F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RI7uLn2F;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P62YF2xW6z3045
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 11:17:20 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3110AShK018642;
	Wed, 1 Feb 2023 00:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=BQtc1YEZQK77m7/RZAfMpsNWtEG3PM+iL8btat6rATQ=;
 b=RI7uLn2FMwfkMzX/AUhAtXN1OQd3mfur//mRLpLvykS7Im+yL08MQLqY32iaqD29njHO
 e842Nn7SX02wYqn1LV3G1Yh9l9geCl5Pwov+hhLnXjBoE5AILICnDpEKZVDe/T3REWaZ
 sKPFDa9IuNJQ6XtIvoEokFwS+3x7yOPR38DEW5q2ExmLnGIGXUP01voSDEhlEUZzUqIl
 Rh0KjKfgaBot0uY1KxPk0mGQhBEp84q/ChJXRx0Nh6s1as6htvsXlSDH5f5NPGJMCsbO
 p9rG92uel9U8GrEZXNu2KjWxUukx964pNEObF+BQLpCRAHYdZ1Uu2GOCdJraZ9zrZBHs sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfag0bvm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 00:17:13 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3110DNdc015860;
	Wed, 1 Feb 2023 00:17:13 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfag0bvkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 00:17:13 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VDArjt013356;
	Wed, 1 Feb 2023 00:17:11 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtyc39k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 00:17:10 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3110H8op41681264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 00:17:08 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83CB22004F;
	Wed,  1 Feb 2023 00:17:08 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04EC32004B;
	Wed,  1 Feb 2023 00:17:08 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 00:17:07 +0000 (GMT)
Received: from civic.. (unknown [9.177.19.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8ADFA60217;
	Wed,  1 Feb 2023 11:16:59 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/5] powerpc: Add KCSAN support
Date: Wed,  1 Feb 2023 11:16:42 +1100
Message-Id: <20230201001642.1278930-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dqg4mgg31gMTtCURtbpme_Wexlg2Kv7c
X-Proofpoint-ORIG-GUID: Rcj1OB-rEhb2Wnry5US8DDHaJx5wrGkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=752 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301310206
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

Rohan McLure (5):
  powerpc: kcsan: Add exclusions from instrumentation
  powerpc: kcsan: Exclude udelay to prevent recursive instrumentation
  powerpc: kcsan: Memory barriers semantics
  powerpc: kcsan: Prevent recursive instrumentation with IRQ
    save/restores
  powerpc: kcsan: Add KCSAN Support

 arch/powerpc/Kconfig               |  1 +
 arch/powerpc/include/asm/barrier.h | 10 +++++-----
 arch/powerpc/kernel/Makefile       | 10 ++++++++++
 arch/powerpc/kernel/irq_64.c       |  6 +++---
 arch/powerpc/kernel/time.c         |  4 ++--
 arch/powerpc/kernel/trace/Makefile |  1 +
 arch/powerpc/kernel/vdso/Makefile  |  1 +
 arch/powerpc/lib/Makefile          |  2 ++
 arch/powerpc/purgatory/Makefile    |  1 +
 arch/powerpc/xmon/Makefile         |  1 +
 10 files changed, 27 insertions(+), 10 deletions(-)

-- 
2.37.2

