Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3175E99C4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:45:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbYCh6DtXz3c3B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:45:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KbCtZ0VO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KbCtZ0VO;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbYC3443dz2xHF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:44:31 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q4ZPBQ020587;
	Mon, 26 Sep 2022 06:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=mGoC3HlKwnBu2RBywdRw9Yxv7CIGcEJNoxirLZ31hpU=;
 b=KbCtZ0VOyMhlIxJOoUDQq2t6BnVhOlQ1vtlqQEp6qYDR3otnDjlMBvJgMR5sszXOak+a
 PGS5c6yusweJQ5lFyG3Fk4ymCOilVdl26bnqHzcFdlNA2PX619WD0eV6XAMqMgkW7g6U
 HeJ1YhsYMBz3NGyEt8oURfk3q6v2T7d/VSn+YUlarymYOh/c47v4Q+EGYG5bDNS+jHc5
 qDfJmEm95Vng4+KFhN3ANvurWVKL+zNZPJiRoUl3AR+e2QCfA0jzyA+cVSfaO06fyo5c
 aBGdCf1niIDvwsJyDq/4Xfc1whTlwXGOi47udeJTDBZi1Q74tarSwHR4ZqSbfBQhP5Lb Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtbwt45p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:44:00 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28Q6FGNZ008496;
	Mon, 26 Sep 2022 06:43:59 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtbwt45ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:43:59 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28Q6ZXmR023359;
	Mon, 26 Sep 2022 06:43:57 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06ams.nl.ibm.com with ESMTP id 3jss5j20ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:43:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28Q6ht4A6423250
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Sep 2022 06:43:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AC1DAE055;
	Mon, 26 Sep 2022 06:43:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD941AE051;
	Mon, 26 Sep 2022 06:43:54 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 26 Sep 2022 06:43:54 +0000 (GMT)
Received: from beng-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B807460213;
	Mon, 26 Sep 2022 16:43:43 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/6] Out-of-line static calls for powerpc64 ELF V2
Date: Mon, 26 Sep 2022 16:43:10 +1000
Message-Id: <20220926064316.765967-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FS1z1RnG712YiO5BtlEv2EqGqOCpdlZE
X-Proofpoint-ORIG-GUID: Y96Avo9mm1S4RIsRRlnkGMxFHx6kN_jy
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_04,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209260039
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
Cc: christophe.leroy@c-s.fr, ajd@linux.ibm.com, peterz@infradead.org, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, ardb@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implementation of out-of-line static calls for PowerPC 64-bit ELF V2 ABI.
Static calls patch an indirect branch into a direct branch at runtime.
Out-of-line specifically has a caller directly call a trampoline, and
the trampoline gets patched to directly call the target.

Previous version here:
https://lore.kernel.org/all/20220916062330.430468-1-bgray@linux.ibm.com/

I couldn't see a dedicated ftrace benchmark in the kernel, but my own
benchmarking showed no significant impact to ftrace activation.

The __patch_memory function is meant to be accessed through the size checking
patch_memory wrapper. I don't think there's a way to expose the macro without
also exposing __patch_memory though. I considered making the type an explicit
macro param, but using the value type seemed more ergonomic.

V2:
Mostly accounting for feedback from Christophe:
* Code patching rewritten
    - Rename to *_memory
    - Use __always_inline to get the compiler to realise it can
      collapse all the sub-functions
    - Pass data directly instead of through a pointer, elliding a redundant load
    - Flush the last byte of data too (technically redundant if an instrucion, but
      saves a conditional branch + the isync will be the bottleneck).
    - Handle a non-cohenrent icache, assume a coherent dcache
    - Handle when we don't assume a 64 byte icache on 64-bits
    - Flatten the poke address init and teardown
    - Check the data size in patch_memory at build time
      (inline function was suggested, but a macro makes checking
       based on the data type easier).
    - It builds now on 32 bit and without strict RWX
* Static call enabling is no longer configurable
* Refactored arch_static_call_transform to minimise casting
* Made the KUnit tests more robust (previously they changed non-volatile
  registers in the init hook, but that's incorrect because it returns to
  the KUnit framework before the test case is called).
* Some other minor refactoring in other patches


Benjamin Gray (6):
  powerpc/code-patching: Implement generic text patching function
  powerpc/module: Handle caller-saved TOC in module linker
  powerpc/module: Optimise nearby branches in ELF V2 ABI stub
  static_call: Move static call selftest to static_call_selftest.c
  powerpc/64: Add support for out-of-line static calls
  powerpc/64: Add tests for out-of-line static calls

 arch/powerpc/Kconfig                     |  12 +-
 arch/powerpc/include/asm/code-patching.h |   8 +
 arch/powerpc/include/asm/static_call.h   |  80 +++++++-
 arch/powerpc/kernel/Makefile             |   4 +-
 arch/powerpc/kernel/module_64.c          |  27 ++-
 arch/powerpc/kernel/static_call.c        | 151 +++++++++++++-
 arch/powerpc/kernel/static_call_test.c   | 251 +++++++++++++++++++++++
 arch/powerpc/kernel/static_call_test.h   |  56 +++++
 arch/powerpc/lib/code-patching.c         |  90 +++++---
 kernel/Makefile                          |   1 +
 kernel/static_call_inline.c              |  43 ----
 kernel/static_call_selftest.c            |  41 ++++
 12 files changed, 682 insertions(+), 82 deletions(-)
 create mode 100644 arch/powerpc/kernel/static_call_test.c
 create mode 100644 arch/powerpc/kernel/static_call_test.h
 create mode 100644 kernel/static_call_selftest.c


base-commit: 3d7a198cfdb47405cfb4a3ea523876569fe341e6
--
2.37.3
