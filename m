Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B75D8A81FE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 13:24:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Px6RqiZX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKJTZ6wClz3vbH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 21:24:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Px6RqiZX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKJSq0r2Gz3cGb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 21:23:54 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43HBDq2q001931;
	Wed, 17 Apr 2024 11:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ixJ+K9mcuhU/x84Y2BeIzwA8gVtPotuEZnhuCe9lBPk=;
 b=Px6RqiZXsTQgYmd/nvR+gftFEnpmEX+xsNDuPED2wkP5CxcK60p2xscShLQgpKVOSVwo
 9xD90RSgB2TF4G7XttjPvjEJMHV6P5ATEYRticxU4LxJcYTeepwtj/NBAbXvqSJ6IAHH
 4T+1l1Xt/vh+pGhso50buKcch9y/CpNVnOP1aA9Km+ip8Vux5C9U1kkZ/eM8otAQalAh
 kUA68VyW/rZCat/hqWp5SW7aCJx54o1O0liAd+S90PSS2Fm3mbiZb/0o+1gLhwy1BvmX
 uUGtM6+ATCF9sVUFvzRHU1yNqRb4HGBGmCaEuGYQaX9mp3yDKhyhGDOatSG9/BTi0jqE eA== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xjdbag0uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:23:49 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43H87sO4027292;
	Wed, 17 Apr 2024 11:23:48 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xg4s043sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:23:47 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43HBNh5c51577098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Apr 2024 11:23:46 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E489A2005A;
	Wed, 17 Apr 2024 11:23:43 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74D9820049;
	Wed, 17 Apr 2024 11:23:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Apr 2024 11:23:43 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.36.21.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 55ED86033D;
	Wed, 17 Apr 2024 21:23:37 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 0/9] Add dynamic DEXCR support
Date: Wed, 17 Apr 2024 21:23:16 +1000
Message-ID: <20240417112325.728010-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0V6Sjq23wJjOUy23NLBRFMcMjaCVjy0D
X-Proofpoint-ORIG-GUID: 0V6Sjq23wJjOUy23NLBRFMcMjaCVjy0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404170078
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

Adds support for a process to change its DEXCR value. The implementation is
somewhat conservative; SBHE (speculative branch hint enable) is not exposed
as an editable aspect because its effects can bleed over to other threads.

As explained in the third patch, this series changes the reset/inherit
behaviour on exec. Previously there was a bitmask that tracked which aspects
to copy from the current state vs resetting to a fixed default. This
allows unprivileged processes to disable ROP protection for setuid binaries
though, and is generally a weird interface to work with. The actual intent
(and new implementation) tracks the exec value as an independent value that
doesn't use the parent's DEXCR at all. The parent can control this reset value
separately to its own DEXCR value.

The other interesting part is the prctl interface. I've made the _SET, _CLEAR,
_SET_ONEXEC, and _CLEAR_ONEXEC controls each a separate flag. This makes it
easier to re-use with the getter prctl, as opposed to making set/clear a boolean
value with a separate flag for if it's 'on-exec'. With separate flags you can
return both the current and on-exec state in the getter in the same way you'd
prepare it for the setter.

There are still more features that can be added. A global switch to disable
ROP protection could be useful as an option to prevent performance degradation.
Also a prctl to randomise the hash key could be useful for when userspace knows
a fork is not going to run any parent hashes. These features could be added in
a future series (or the next version of this one :) ) though.

Benjamin Gray (9):
  selftests/powerpc/dexcr: Add -no-pie to hashchk tests
  powerpc/dexcr: Track the DEXCR per-process
  powerpc/dexcr: Reset DEXCR value across exec
  powerpc/dexcr: Add DEXCR prctl interface
  selftests/powerpc/dexcr: Add DEXCR prctl interface test
  selftests/powerpc/dexcr: Attempt to enable NPHIE in hashchk selftest
  selftests/powerpc/dexcr: Add DEXCR config details to lsdexcr
  selftests/powerpc/dexcr: Add chdexcr utility
  Documentation: Document PowerPC kernel dynamic DEXCR interface

 Documentation/arch/powerpc/dexcr.rst          | 141 +++++++++++-
 arch/powerpc/include/asm/processor.h          |  13 +-
 arch/powerpc/kernel/Makefile                  |   1 +
 arch/powerpc/kernel/dexcr.c                   | 120 ++++++++++
 arch/powerpc/kernel/process.c                 |  17 ++
 arch/powerpc/kernel/ptrace/ptrace-view.c      |   7 +-
 include/uapi/linux/prctl.h                    |  16 ++
 kernel/sys.c                                  |  16 ++
 .../selftests/powerpc/dexcr/.gitignore        |   2 +
 .../testing/selftests/powerpc/dexcr/Makefile  |   8 +-
 .../testing/selftests/powerpc/dexcr/chdexcr.c | 110 +++++++++
 tools/testing/selftests/powerpc/dexcr/dexcr.c |  40 ++++
 tools/testing/selftests/powerpc/dexcr/dexcr.h |  57 +++++
 .../selftests/powerpc/dexcr/dexcr_test.c      | 213 ++++++++++++++++++
 .../selftests/powerpc/dexcr/hashchk_test.c    |   8 +-
 .../testing/selftests/powerpc/dexcr/lsdexcr.c | 103 ++++++---
 16 files changed, 823 insertions(+), 49 deletions(-)
 create mode 100644 arch/powerpc/kernel/dexcr.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/chdexcr.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr_test.c

--
2.44.0

