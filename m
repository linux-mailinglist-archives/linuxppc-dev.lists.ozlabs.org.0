Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB7C7604BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:34:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HGc32NGf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R901P0skMz3bnx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 11:34:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HGc32NGf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8zFy5sZnz2ytq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 10:59:50 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36P0sT7o014889
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=F2qUX2wWu8Ape/YSw144FFjOzFWRsCmiZBqInXPX/b8=;
 b=HGc32NGfXkc05TcLDwv3oJki+5yTNzTrVR+vPblVHTyUsIOLrYcP2eY7U1O1h9KZHIUs
 lqiRcn8B88ju7pHuoUn1EfZJOEYD35gGBRAWR9CV9Et6UL9PNGPqKuo0feGlsRiVBZ2c
 j1AHbLeIAFIkwLzLEALlAgrHQwE4nnx6N4cK71KiIzOloXS/UPn3mHKXFhwrb/36b2Mi
 qFw3FlE2hEWF4/KkVOFV040IEvqPKLqhM9o3FeEdkFg8bUn5dPgjCsZPMWedtDQ7N5jL
 EDND6eXz7Dw5rNvLjqsycKL16H0zkHF74Gy6lH9ENDblHw6F6rLpW6CozhaWML6iuAeO 9g== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s248yr2j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:47 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36OMjZop002079
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:46 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0temqsc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:46 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36P0xiFW15598150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:44 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65AED20043
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:44 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC03D20040
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:43 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2DD73600A7;
	Tue, 25 Jul 2023 10:59:41 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 0/4] Improve ptrace selftest usability
Date: Tue, 25 Jul 2023 10:58:37 +1000
Message-ID: <20230725005841.28854-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nS11MeWvCrVkN0Ojh2R0PSdbx8Nsc1z1
X-Proofpoint-ORIG-GUID: nS11MeWvCrVkN0Ojh2R0PSdbx8Nsc1z1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_18,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=737 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250003
X-Mailman-Approved-At: Tue, 25 Jul 2023 11:33:14 +1000
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

While trying to test changes to the breakpoint implementation in the kernel, I
tried to run the ptrace tests and met many unexplained skips and failures.

This series addresses the pain points of trying to run these tests and learn
what they are doing.

Benjamin Gray (4):
  Documentation/powerpc: Fix ptrace request names
  selftests/powerpc/ptrace: Explain why tests are skipped
  selftests/powerpc/ptrace: Fix typo in pid_max search error
  selftests/powerpc/ptrace: Declare test temporary variables as volatile

 Documentation/powerpc/ptrace.rst              |  8 +++---
 .../testing/selftests/powerpc/ptrace/child.h  |  4 +--
 .../selftests/powerpc/ptrace/core-pkey.c      |  2 +-
 .../selftests/powerpc/ptrace/perf-hwbreak.c   |  2 +-
 .../selftests/powerpc/ptrace/ptrace-hwbreak.c | 26 +++++++++----------
 .../powerpc/ptrace/ptrace-perf-hwbreak.c      |  6 ++---
 .../selftests/powerpc/ptrace/ptrace-pkey.c    |  2 +-
 .../selftests/powerpc/ptrace/ptrace-tar.c     |  2 +-
 .../selftests/powerpc/ptrace/ptrace-tm-gpr.c  |  4 +--
 .../powerpc/ptrace/ptrace-tm-spd-gpr.c        |  4 +--
 .../powerpc/ptrace/ptrace-tm-spd-tar.c        |  4 +--
 .../powerpc/ptrace/ptrace-tm-spd-vsx.c        |  4 +--
 .../selftests/powerpc/ptrace/ptrace-tm-spr.c  |  4 +--
 .../selftests/powerpc/ptrace/ptrace-tm-tar.c  |  4 +--
 .../selftests/powerpc/ptrace/ptrace-tm-vsx.c  |  4 +--
 .../selftests/powerpc/ptrace/ptrace-vsx.c     |  2 +-
 16 files changed, 41 insertions(+), 41 deletions(-)

--
2.41.0
