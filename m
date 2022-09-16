Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E80475BA6CD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 08:27:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTPJH56ygz3f2Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 16:27:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rxkFLE7v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rxkFLE7v;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTPDh2nZ9z2xjt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 16:24:35 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G6BlnR020883;
	Fri, 16 Sep 2022 06:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=8xB/PbRQTJytpDahw84/aETgtXA5lYQ+QCxi4G4zkuc=;
 b=rxkFLE7vSh8ZXenFgbqYWbCD6K4OMXY98/aIUJ937adGhvHJqPN7s8//ZghTHHinoNLd
 ELQsyc7dvJTlSrnh8jSX9KKLLCGRI+xKMampgGF0kC1N46LGWtUSxtttQNcmzR6kwXPC
 S9gI563c+lIsTQ9BWbaEr0HTXxoVm9ygcuyutV82ZhEutl+TZQofPMaFxvWQEsFbCIVw
 P91JVHT1lBbZDcSN6pf73S3AxraeMHyW6CR2BV6LO9kgxB8+gXrdCV+xYIDdym2p3YnZ
 ITim4D5KAifBgpDpch7ngSQ875OHQAC3yJUwTaUpq4vEWef9Wot/LpgPcaSQJ8/xbRaT uA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmknm0anp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 06:24:19 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28G6DWIj030281;
	Fri, 16 Sep 2022 06:24:18 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmknm0amx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 06:24:18 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G6LB7g028729;
	Fri, 16 Sep 2022 06:24:16 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma03ams.nl.ibm.com with ESMTP id 3jm918gjkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 06:24:15 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G6ODoe38797746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 06:24:13 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D04C52050;
	Fri, 16 Sep 2022 06:24:13 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id F2AFF5204F;
	Fri, 16 Sep 2022 06:24:12 +0000 (GMT)
Received: from beng-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1E0B26016C;
	Fri, 16 Sep 2022 16:24:07 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/6] Out-of-line static calls for powerpc64 ELF V2
Date: Fri, 16 Sep 2022 16:23:24 +1000
Message-Id: <20220916062330.430468-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EdzKYwiF6AID6FNTFWlCrcKz9tN6APhL
X-Proofpoint-GUID: unlqd9YbXYdBgVF2XjctxIRqL_xzNrzO
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 clxscore=1031 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160045
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

More context regarding the challenges with the ELF V2 ABI is in the RFC
https://lore.kernel.org/linuxppc-dev/20220901055823.152983-1-bgray@linux.ibm.com/

This resolves the stack issue in the RFC by marking the trampoline as not
preserving the TOC, so the linker will insert its own TOC saving trampoline +
restore the TOC when the target returns.

It is sub-optimal (a separate TOC saving trampoline is not necessary), but does
not require any additional support beyond what's given in the ABI (unlike the
other two suggestions in the RFC). Microbenchmarking shows a performance improvement
in kernel-kernel-kernel calls on a Power9 when the indirect branch predictor is disabled.
However the generic implementation performs better in every other case. And when
branch prediction is enabled the generic implementation behaves like the control cases.

    |    Case    |    Generic      |     Static      |
    |------------|-----------------|-----------------|
    | control_kk | 221536 calls/ms | 221443 calls/ms |  // control is direct call, no SC trampoline
    | control_mm | 221941 calls/ms | 221913 calls/ms |
    | kkk        |  89657 calls/ms | 177835 calls/ms |  // kernel caller -> kernel tramp -> kernel target
    | kkm        |  89835 calls/ms |  53853 calls/ms |  // kernel caller -> kernel tramp -> module target
    | kmk        | 101808 calls/ms |  52280 calls/ms |  // etc.
    | kmm        | 101973 calls/ms |  52347 calls/ms |
    | mkk        |  97621 calls/ms |  78044 calls/ms |
    | mkm        |  97738 calls/ms |  38370 calls/ms |
    | mmk        |  98839 calls/ms |  68436 calls/ms |
    | mmm        |  98967 calls/ms |  68511 calls/ms |

Using a noinline page-aligned target that adds 1 to a counter then runs 64 NOPs
to iron out some processor timing quirks. The target is called in a loop like

	while (!READ_ONCE(stop))
		static_call(bench_sc)(&counter);

Again page aligned. The benchmark is stopped by a timer.

The kernel trampoline's hardcoded TOC offset is done because importing
the asm constants header imports an unrelated macro definition that is the same as the
enum name it was generated from, which confuses the compiler when it reaches said enum
definition.


Benjamin Gray (6):
  powerpc/code-patching: Implement generic text patching function
  powerpc/module: Handle caller-saved TOC in module linker
  powerpc/module: Optimise nearby branches in ELF V2 ABI stub
  static_call: Move static call selftest to static_call_selftest.c
  powerpc/64: Add support for out-of-line static calls
  powerpc/64: Add tests for out-of-line static calls

 arch/powerpc/Kconfig                     |  22 +-
 arch/powerpc/include/asm/code-patching.h |   2 +
 arch/powerpc/include/asm/static_call.h   |  80 ++++++-
 arch/powerpc/kernel/Makefile             |   4 +-
 arch/powerpc/kernel/module_64.c          |  25 ++-
 arch/powerpc/kernel/static_call.c        | 203 ++++++++++++++++-
 arch/powerpc/kernel/static_call_test.c   | 263 +++++++++++++++++++++++
 arch/powerpc/lib/code-patching.c         | 135 ++++++++----
 kernel/Makefile                          |   1 +
 kernel/static_call_inline.c              |  43 ----
 kernel/static_call_selftest.c            |  41 ++++
 11 files changed, 713 insertions(+), 106 deletions(-)
 create mode 100644 arch/powerpc/kernel/static_call_test.c
 create mode 100644 kernel/static_call_selftest.c

--
2.37.3
