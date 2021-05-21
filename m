Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 317DB38C007
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 08:50:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmcgM1gF7z2y88
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 16:50:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k/i2Nm0O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k/i2Nm0O; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmcfb3Fxbz2xvZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 16:49:42 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L6YFmR106565; Fri, 21 May 2021 02:49:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=fhRc3BkXCs3ZqMsO26JgcfxuYISciLEocDO32kiLUWQ=;
 b=k/i2Nm0Oi9o8kGP8g7Uuzye/y397+fbwTLGXeZWkjlmInePly0qwchqcLZrC6c5a1Wtn
 VkgR3lNKCmfCZPWCHJx9dJIiEtgejv6VoRcfwGp8jvytNLRcOfg/yoiKflHGWU3b5VHe
 yKcNEb8mSfSkuXRUkXH2bJ3B0egnLsn7l0s+jcO+S8ZHNAu8cQ3WtsU5agmBPhAj03J+
 ASPonm5kg85EWnxjExIid8fIMBolQCVQpp57xIGcw5LqfDTlV7j8I88ZzrVOLMKSes8H
 n9sqizXMHniMUW1qoqbwRZ9XT3OBmCSfVugEIgErLJwBFT2ZvDUQQrzNzgntIwAmL/X2 Kg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p7pkrbuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 02:49:09 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L6mrrq013764;
 Fri, 21 May 2021 06:49:06 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 38j5x7u06n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 06:49:06 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L6n4bD24248738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 06:49:04 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 628464204D;
 Fri, 21 May 2021 06:49:04 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50D5E4204B;
 Fri, 21 May 2021 06:49:01 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.85.72.15])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 06:49:00 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michal Suchanek <msuchanek@suse.de>, Torsten Duwe <duwe@suse.de>
Subject: [RFC PATCH 0/6] powerpc: Stack tracer fixes
Date: Fri, 21 May 2021 12:18:35 +0530
Message-Id: <cover.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EAPLSbJ8WZVe1n9DKp4hOH65WZwc9nj8
X-Proofpoint-ORIG-GUID: EAPLSbJ8WZVe1n9DKp4hOH65WZwc9nj8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210043
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While the stack tracer worked fine with ppc64 ELFv1 ABI, it was never 
ported/enabled to run properly with ppc64 ELFv2 ABI, -mprofile-kernel in 
particular. The primary issue is that the call to ftrace happens before 
a function sets up its own stackframe. Due to this, the traced function 
never shows up in the stack trace. This produces confusing results, 
especially with the stack trace filter and is evident with the selftest 
failure. This is also an issue on ppc32.

The first two commits add support to the stack tracer for powerpc. This 
support utilizes the powerpc ABI to produce reliable stack traces, as 
well as to determine stackframe sizes.

Patches 3, 4 and 6 add support for decoding the traced function name in 
various stack traces and to show the same.

Patch 5 makes this change for livepatching and I am a bit unsure of this 
change. More details in patch 5.

- Naveen


Naveen N. Rao (6):
  trace/stack: Move code to save the stack trace into a separate
    function
  powerpc/trace: Add support for stack tracer
  powerpc: Indicate traced function name in show_stack()
  powerpc/perf: Include traced function in the callchain
  powerpc/stacktrace: Include ftraced function in
    arch_stack_walk_reliable()
  powerpc/stacktrace: Include ftraced function in arch_stack_walk()

 arch/powerpc/include/asm/ftrace.h  | 18 ++++++
 arch/powerpc/kernel/process.c      |  3 +
 arch/powerpc/kernel/stacktrace.c   |  8 +++
 arch/powerpc/kernel/trace/ftrace.c | 70 +++++++++++++++++++++
 arch/powerpc/perf/callchain.c      |  5 ++
 include/linux/ftrace.h             |  8 +++
 kernel/trace/trace_stack.c         | 98 ++++++++++++++++--------------
 7 files changed, 164 insertions(+), 46 deletions(-)


base-commit: 258eb1f3aaa9face35e613c229c1337263491ea0
-- 
2.30.2

