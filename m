Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 955CF5A8E96
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 08:46:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJBQV3jbBz3bxp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 16:46:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g9e+ua8Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g9e+ua8Y;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJ9Ml00gKz303D
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 15:58:42 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2815cBLn018998;
	Thu, 1 Sep 2022 05:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=O7en3yKEGh5zymHq6DKQ1SQ8wiDWgu8VU9gvx5FDaLI=;
 b=g9e+ua8YC/6kbhdH2YmFeksoYvkvHmF7Rjvo2dhm8MZRtxUFm1vlGi5YHWJqBli9Ktlq
 ZvvULEBTKW+vpx/KYxno5Y4cYuMP+auXPiU3prCiVOr3FxHtNrJ3jr/Z/CozWZwYMWj4
 CuNDfEhKbhkS/1YYkqqCQVs7czfgbdiVtGoKTtud6mNNFF+nD7JRD8fVMbUzIk5ffE2V
 4yfB0uQpmRA/rT+E4yK0GAcQZV0/mRpJO7Kp3AlKUS4bJWJU+cs/ptBTdZD4K3PhQsJK
 muOMDI+1kJrmm0AJoy0bMn5Knbu74LshIRXKd2Y5fD30hKQpLzq4BFKd3jm+ild0nNmy Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3japchsa23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 05:58:37 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2815kFd0025250;
	Thu, 1 Sep 2022 05:58:36 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3japchsa15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 05:58:36 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2815q973022095;
	Thu, 1 Sep 2022 05:58:34 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3j7ahj68w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 05:58:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2815wVjl40829416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Sep 2022 05:58:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD90F4C04E;
	Thu,  1 Sep 2022 05:58:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F18A4C046;
	Thu,  1 Sep 2022 05:58:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  1 Sep 2022 05:58:31 +0000 (GMT)
Received: from beng-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0234B602C3;
	Thu,  1 Sep 2022 15:58:25 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/4] Out-of-line static calls for powerpc64 ELF V2
Date: Thu,  1 Sep 2022 15:58:19 +1000
Message-Id: <20220901055823.152983-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MVXvbocnfNw7uc87n0pa1ZXDQFMoUhX2
X-Proofpoint-ORIG-GUID: 04acWdUvDb8SfWLFZQt5YScDEdwhBZ-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_03,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010022
X-Mailman-Approved-At: Thu, 01 Sep 2022 16:45:35 +1000
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
Cc: christophe.leroy@c-s.fr, Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

WIP implementation of out-of-line static calls for PowerPC 64-bit ELF V2 ABI.
Static calls patch an indirect branch into a direct branch at runtime.
Out-of-line specifically has a caller directly call a trampoline, and
the trampoline gets patched to directly call the target. This current
implementation has a known issue described in detail below, and is
presented here for any comments or suggestions.

64-bit ELF V2 specifies a table of contents (TOC) pointer stored in r2.
Functions that use a TOC can use it to perform various operations
relative to its value. When the caller and target use different TOCs,
the static call implementation must ensure the TOC is kept consistent
so that neither tries to use the other's TOC.

However, while the trampoline can change the caller's TOC to the target's
TOC, it cannot restore the caller's TOC when the target returns. For the
trampoline to do this would require the target to return to the trampoline,
and so the return address back to the caller would need to be saved to
the stack. But the trampoline cannot move the stack because the target
may be expecting parameters relative to the stack pointer (when registers
are insufficient or varargs are used). And as static calls are usable in
generic code, there can be no arch-specific restrictions on parameters
that would sidestep this issue.

Normally the TOC change issue is resolved by the caller, which will save
and restore its TOC if necessary. For static calls though the caller
sees the trampoline as a local function, so assumes it does not change
the TOC and treats r2 as nonvolatile (no save & restore added).

This is a simialar problem to that faced by livepatch. Static calls may have
a few more options though, because the call is performed through a
`static_call` macro, allowing annotation and insertion of inline assembly
at every callsite.

I can think of several possible solutions, but they are relatively complex:

1. Patching the callsites at runtime, as is done for inline static calls.
    This also requires some inline assembly to save `r2` to the TOC pointer
    Doubleword slot on the stack before each static call, as the caller may
    not have done so in its prologue. It should be easy to add though, because
    static calls are invoked through the `static_call` macro that can be
    modified appropriately. The runtime patching then modifies the trailing
    function call `nop` to restore this r2 value.

    The patching itself can probably be done at compile time at kernel callsites.

2. Use the livepatch stack method of growing the base of the stack backwards.
    I haven't looked too closely at the implementation though, especially
    regarding how much room is available.

    The benefit of this method is that there can be zero overhead when the
    trampoline and target share a TOC. So the trampoline in kernel-only
    calls can still just be a single direct branch.

3. Remove the local entry point from the trampoline. This makes the trampoline
    less efficient, as it cannot assume r2 to be correct, but should at least
    cause the caller to automatically save and restore r2 without manual patching.
    From the ABI manual:

    > 2.2.1. Function Call Linkage Protocols
    >   A function that uses a TOC pointer always has a separate local entry point
    >   [...], and preserves r2 when called via its local entry point.
    >
    > 2.2.2.1. Register Roles
    >   (a) Register r2 is nonvolatile with respect to calls between functions
    >       in the same compilation unit, except under the conditions in footnote (b)
    >   (b) Register r2 is volatile and available for use in a function that does not
    >       use a TOC pointer and that does not guarantee that it preserves r2.

    So not having a local entry point implies not using a TOC pointer, which
    implies r2 is volatile if the trampoline does not guarantee that it preserves
    r2. However experimenting with such a trampoline showed the caller still did
    not preserve its TOC when necessary, even when the trampoline used instructions
    that wrote to r2. Possibly there's an attribute that can be used to mark the
    necessary info, but I could not find one.


Benjamin Gray (3):
  static_call: Move static call selftest to static_call.c
  powerpc/64: Add support for out-of-line static calls
  powerpc/64: Add tests for out-of-line static calls

Russell Currey (1):
  powerpc/code-patching: add patch_memory() for writing RO text

 arch/powerpc/Kconfig                     |  23 +-
 arch/powerpc/include/asm/code-patching.h |   2 +
 arch/powerpc/include/asm/static_call.h   |  45 +++-
 arch/powerpc/kernel/Makefile             |   4 +-
 arch/powerpc/kernel/static_call.c        | 184 +++++++++++++++-
 arch/powerpc/kernel/static_call_test.c   | 257 +++++++++++++++++++++++
 arch/powerpc/lib/code-patching.c         |  65 ++++++
 kernel/static_call.c                     |  43 ++++
 kernel/static_call_inline.c              |  43 ----
 9 files changed, 613 insertions(+), 53 deletions(-)
 create mode 100644 arch/powerpc/kernel/static_call_test.c


base-commit: c5e4d5e99162ba8025d58a3af7ad103f155d2df7
--
2.37.2
