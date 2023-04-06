Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B086D8E5F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 06:35:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsTFR2C0vz3fVM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 14:35:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JpBUE8er;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JpBUE8er;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsTCZ0SYVz3f4N
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 14:33:45 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3362sm5l033583
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=hcYu43ptG4u8QncywFWdXiGNISgFwoORGXh6DSLgEaE=;
 b=JpBUE8erDS4Pe4rlntW9XTy5YR04mJz1OA96HC+ybMLlz973MzmQACfIpSaedrcgPt3o
 fSB1jgusCnBTFC2JEJYHAanqZl34LCkd4rg4tgsVF13HvH+pUKLdxHMk3RMDJ4qz5MeQ
 8BrMFnwh2/9Jcjph93BtCZJOlpLJm+sBFl96AWZA1FCWSbg1GJZMpA8pKUeJrghoaPCo
 cSSUMWCC+LX/JIp84NzEaN6fmznU/6smEgxmh0mvALyCAMxZRtv1O+FkMxnt0REftLuk
 WinBGRqjt6PtjsNZ44CM/NIOj9mt/UPcjSbtn6KPoKOfmtrGu/cwLAz+bCTdWJOFCX7E Zw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ps7n3xfj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 04:33:42 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33622Wac013581
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:40 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3ppbvfty7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 04:33:40 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3364XcCd7340710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:38 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 529232004B
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:38 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C71902004D
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:37 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 16EA960151;
	Thu,  6 Apr 2023 14:33:36 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/7] Update DSCR tests
Date: Thu,  6 Apr 2023 14:33:13 +1000
Message-Id: <20230406043320.125138-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4F55BFiVXkUnvPdT4x2EVBF5dar2hRgf
X-Proofpoint-ORIG-GUID: 4F55BFiVXkUnvPdT4x2EVBF5dar2hRgf
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=990 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304060039
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

The randomness based DSCR tests currently have a low probability of doing
any writes to the DSCR, making them inefficient in uncovering bugs.

This series adds lockstep variants to these RNG tests, to ensure the happy
path is always tested, and improves the randomness and size of the RNG
tests.

It also removes many iterations of the sysfs DSCR test, allowing the default
timeout to be re-enabled.

v2:	* Pull bind_to_cpu() out to utils.c and allow an automatically
	  determined CPU selection.

Previous versions:
v1: https://lore.kernel.org/all/20230307005515.174362-1-bgray@linux.ibm.com/

Benjamin Gray (7):
  selftests/powerpc/dscr: Correct typos
  selftests/powerpc: Move bind_to_cpu() to utils.h
  selftests/powerpc: Allow bind_to_cpu() to automatically pick CPU
  selftests/powerpc/dscr: Add lockstep test cases to DSCR explicit tests
  selftests/powerpc/dscr: Improve DSCR explicit random test case
  selftests/powerpc/dscr: Speed up DSCR sysfs tests
  selftests/powerpc/dscr: Restore timeout to DSCR selftests

 tools/testing/selftests/powerpc/dscr/Makefile |   3 +-
 tools/testing/selftests/powerpc/dscr/dscr.h   |   4 -
 .../powerpc/dscr/dscr_default_test.c          | 207 +++++++++++-------
 .../powerpc/dscr/dscr_explicit_test.c         | 169 +++++++++++---
 .../powerpc/dscr/dscr_inherit_test.c          |   4 +-
 .../selftests/powerpc/dscr/dscr_sysfs_test.c  |  11 +-
 .../selftests/powerpc/dscr/dscr_user_test.c   |   4 +-
 tools/testing/selftests/powerpc/dscr/settings |   1 -
 .../testing/selftests/powerpc/include/utils.h |   3 +
 .../pmu/ebb/cpu_event_pinned_vs_ebb_test.c    |   3 +-
 .../powerpc/pmu/ebb/cpu_event_vs_ebb_test.c   |   3 +-
 .../powerpc/pmu/ebb/ebb_vs_cpu_event_test.c   |   3 +-
 .../powerpc/pmu/ebb/multi_ebb_procs_test.c    |   6 +-
 tools/testing/selftests/powerpc/pmu/lib.c     |  19 +-
 tools/testing/selftests/powerpc/pmu/lib.h     |   1 -
 tools/testing/selftests/powerpc/utils.c       |  23 ++
 16 files changed, 303 insertions(+), 161 deletions(-)
 delete mode 100644 tools/testing/selftests/powerpc/dscr/settings

--
2.39.2
