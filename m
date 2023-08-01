Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE5E76A62D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 03:19:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H1zTaKsR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFHLx6qTFz3bhc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 11:19:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H1zTaKsR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFHL32xQbz2ypx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 11:18:19 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3711GLjF024338
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=lGQavIBkbsScTWDmJq0gmISAykaCFNN7x8Ub3hkylAs=;
 b=H1zTaKsRiHTaIYee3Ly+hdgp9HlUqsiVR8FJ0WJvQe55CXUd0JE/mya+IDKB1Zqk/K/B
 wEH1JkxXJG9B6/f/fwGOH/6VHKmMnmti1zKdFyw+YRtclNKFJXFaihAjOqqelsQLOlQV
 r/GdKJreFAhXy20MhtyGj3Ha3kUjg01K5gRxkEKhw/50R8HStR7BtxsJy8JbbrNWMcdu
 HvVgtPZUI5dQUTx01EjTWbyl69k9hzLsDOxUIbFN64sOlgiAZ/9dqJKo4hQAZ/XMcQPX
 Joc5qrICqqWYzd19HkyEbnm78yao42IxEjwx+S1oPNnLxFyOlHuy3hSAYzOmAKxSaS/c 6w== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6qw30p0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 01:18:15 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36VNtVLR017157
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:14 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5fajfag0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 01:18:14 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3711IC4h44565162
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:12 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 533A92004B
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:12 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7D9020040
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:11 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C0E7760460;
	Tue,  1 Aug 2023 11:18:04 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/7] Rework perf and ptrace watchpoint tracking
Date: Tue,  1 Aug 2023 11:17:37 +1000
Message-ID: <20230801011744.153973-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bKkTb13J2WLdvX8S7jLfaeTSw0jJoRjm
X-Proofpoint-ORIG-GUID: bKkTb13J2WLdvX8S7jLfaeTSw0jJoRjm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_18,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=911 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308010008
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Syzkaller triggered a null pointer dereference in the
arch_unregister_hw_breakpoint() hook. This is due to accessing
the bp->ctx->task field changing to -1 while we iterate the breakpoints.

This series refactors the breakpoint tracking logic to remove the
dependency on bp->ctx entirely. It also simplifies handling of ptrace and
perf breakpoints, making insertion less restrictive. 

If merged, it allows several arch hooks that PowerPC was the sole user of
to be removed.

Benjamin Gray (7):
  powerpc/watchpoints: Explain thread_change_pc() more
  powerpc/watchpoints: Don't track info persistently
  powerpc/watchpoints: Track perf single step directly on the breakpoint
  powerpc/watchpoints: Simplify watchpoint reinsertion
  powerpc/watchpoints: Remove ptrace/perf exclusion tracking
  selftests/powerpc/ptrace: Update ptrace-perf watchpoint selftest
  perf/hw_breakpoint: Remove arch breakpoint hooks

 arch/powerpc/include/asm/hw_breakpoint.h      |    1 +
 arch/powerpc/include/asm/processor.h          |    5 -
 arch/powerpc/kernel/hw_breakpoint.c           |  388 +-----
 include/linux/hw_breakpoint.h                 |    3 -
 kernel/events/hw_breakpoint.c                 |   28 -
 .../testing/selftests/powerpc/ptrace/Makefile |    1 +
 .../powerpc/ptrace/ptrace-perf-asm.S          |   33 +
 .../powerpc/ptrace/ptrace-perf-hwbreak.c      | 1104 +++++++----------
 8 files changed, 537 insertions(+), 1026 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/ptrace/ptrace-perf-asm.S
 rewrite tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c (93%)

-- 
2.41.0
