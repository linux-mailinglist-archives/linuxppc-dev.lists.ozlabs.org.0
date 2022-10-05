Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD66A5F4F7C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 07:34:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mj3Cg0lNDz3c6D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 16:34:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k+kNpCul;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k+kNpCul;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mj3Bf4xL0z2yQg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 16:33:13 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2955JD2e029781;
	Wed, 5 Oct 2022 05:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Frr3gX55mVF2/9kmC1MXWTifkq5COecBq9nasdhIwNY=;
 b=k+kNpCulDkOG6G6DQ12R6QJ8UooAIkkuimH3lP3//s/r+ZRoyZ8/xCl73kjfxfSROYwi
 Llunzqz0e13DZmqFf/yt9tTu2XJubrJD+MlJWnIH66gS5MNtDqKg5Xne+rxqOdM2PutD
 0cAxK/NSZ4PjCc6IVbmIGxeGnEaQSi2rJrtirIGCcU37xkfN5oYRgud7VURDV0eX0AV4
 pQGEIRwuI4lPBfcjUPfmj2uHfp+ZWHkzbg93AdaH/++zZEXWin0c5FO477Za5IjV8OtS
 gkwOWoPHiQzrOGTG4+zDPaQNRWsmzUONmDKUAiYGAK/EX6Upa1G964G8EApWxwDmcnwS QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k0fsnjdc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Oct 2022 05:32:56 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2955RaYl002641;
	Wed, 5 Oct 2022 05:32:55 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k0fsnjdaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Oct 2022 05:32:55 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2955LZ7X016295;
	Wed, 5 Oct 2022 05:32:53 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03fra.de.ibm.com with ESMTP id 3jxd68uqmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Oct 2022 05:32:53 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2955WoGR7865052
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Oct 2022 05:32:51 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0F1C4C044;
	Wed,  5 Oct 2022 05:32:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 407A34C046;
	Wed,  5 Oct 2022 05:32:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  5 Oct 2022 05:32:50 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9871460219;
	Wed,  5 Oct 2022 16:32:46 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/6] Out-of-line static calls for powerpc64 ELF V2
Date: Wed,  5 Oct 2022 16:32:28 +1100
Message-Id: <20221005053234.29312-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8HN7LKZwE4PA-9sNj8uKoxYL1xoWcSsA
X-Proofpoint-GUID: Og0kDyq0Lyv5P_lCWEZL765L2VtJlz2O
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_09,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=841 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210050034
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
Cc: ajd@linux.ibm.com, peterz@infradead.org, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, ardb@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implementation of out-of-line static calls for PowerPC 64-bit ELF V2 ABI.
Static calls patch an indirect branch into a direct branch at runtime.
Out-of-line specifically has a caller directly call a trampoline, and
the trampoline gets patched to directly call the target.

Previous versions here:
V2: https://lore.kernel.org/all/20220926064316.765967-1-bgray@linux.ibm.com/
V1: https://lore.kernel.org/all/20220916062330.430468-1-bgray@linux.ibm.com/

Changed for V3:

[general]
* Rebased on top of
  https://lore.kernel.org/all/0df84a2eea551c1d000c34c36d0c1d23cbe26a97.1664289176.git.christophe.leroy@csgroup.eu/
  for removing the separate CONFIG_STRICT_KERNEL_RWX cases. Can rebase back onto next if necessary.
* Some some minor refactoring/style fixes throughout

[1/6]
* Code patching rewritten again
* This time it only adds support for what is needed:
        * int or long sized writes only
        * assumed within a cacheline (static call pointers are aligned
          for atomic updates, instructions are aligned anyway)
        * unconditional instruction syncing because non-instruction
          patching is not used in any performance sensitive paths
        * similarly, dword case is marked unlikely. ftrace activation is biggest
          performance concern, and it only uses non-prefixed instructions.
* Should be zero difference on 32-bit, minor differences on 64-bit
* Design doesn't need to be revisited unless specifically 1 or 2 byte
  patching is needed. Most such patches can be emulated by read-update-store
  of 4 bytes. Non-cacheline safe patches can be split similarly (they
  can't have atomicity requirements if they aren't aligned).

[3/6]
* Refactored to use patch_branch (thx Christophe)

[5/6]
* Required .localentry NAME, 1 directive guarded by toolchain version check
* Removed #ifdef's from static call implementation. Added sign_extend_long to
  support this.
* Fixed a bug in ppc_function_toc handling of lis case & made it more verbose
  to make such errors stand out more. New layout splits into calculating required
  values, and then applying them in two steps.

[6/6]
* Replaced SAVE_REGS/RESTORE_REGS macros with functions
* Reduced global register usage of tests
* Support running on 32-bit as well


Benjamin Gray (6):
  powerpc/code-patching: Implement generic text patching function
  powerpc/module: Handle caller-saved TOC in module linker
  powerpc/module: Optimise nearby branches in ELF V2 ABI stub
  static_call: Move static call selftest to static_call_selftest.c
  powerpc/64: Add support for out-of-line static calls
  powerpc: Add tests for out-of-line static calls

 arch/powerpc/Kconfig                     |  26 ++-
 arch/powerpc/include/asm/code-patching.h |  30 +++
 arch/powerpc/include/asm/static_call.h   |  80 ++++++-
 arch/powerpc/kernel/Makefile             |   4 +-
 arch/powerpc/kernel/module_64.c          |  26 ++-
 arch/powerpc/kernel/static_call.c        | 183 +++++++++++++++-
 arch/powerpc/kernel/static_call_test.c   | 263 +++++++++++++++++++++++
 arch/powerpc/kernel/static_call_test.h   |  56 +++++
 arch/powerpc/lib/code-patching.c         |  73 +++++--
 kernel/Makefile                          |   1 +
 kernel/static_call_inline.c              |  43 ----
 kernel/static_call_selftest.c            |  41 ++++
 12 files changed, 753 insertions(+), 73 deletions(-)
 create mode 100644 arch/powerpc/kernel/static_call_test.c
 create mode 100644 arch/powerpc/kernel/static_call_test.h
 create mode 100644 kernel/static_call_selftest.c


base-commit: 9a5e80596e50f1ab19fecb2d337e7ea3287ee083
--
2.37.3
