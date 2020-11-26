Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCF42C5BB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 19:13:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Chm8G1ZqLzDrPq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 05:13:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CLAD617F; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chm4V2MGVzDrMy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 05:09:45 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQI2R5D010721; Thu, 26 Nov 2020 13:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=GkXeqL17xR8dq2eMis8ZuSHWSqLLqoclDTnnUCoHGhk=;
 b=CLAD617FpL3Z2qZXFij8btKgri5W7sHj6YpjdedQsmj2b3IF7DV7z0IZFTk06W/sKSoy
 VR+30JmHZ2YuZGIcto5pvusAbAnGorwHLs/2Df12HmOKhKAWW2jhpg2JqIrOsCDd5Z28
 NsCGNCX4JamsWaVa7jIkIrjk0HmILwflQwRxGODJCaofLjehXJ6k5Xg1gl9gx+C4Uts5
 A/Dago0tFHYl60YY3bKegBV2DOEWpz0haNPeQOJcKT4qj2zmbfITlZt2V8xMy4C3eeQJ
 hJhHMlWyINSp9IOKeBU5pICQTT2jyoFoCoE2WoPs2ZAPSHcp5AknqB1RF/AHmbxRhcsn qg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352ccerhxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 13:09:13 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQI7D9K002582;
 Thu, 26 Nov 2020 18:09:11 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 351pca0p12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 18:09:11 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AQI98iG56033598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 18:09:08 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A13C1A405C;
 Thu, 26 Nov 2020 18:09:08 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3082EA405B;
 Thu, 26 Nov 2020 18:09:06 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.81.45])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 18:09:05 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [RFC PATCH 00/14] powerpc64: Add support for ftrace direct calls
Date: Thu, 26 Nov 2020 23:38:37 +0530
Message-Id: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_08:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1011 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260108
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

This series adds support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS for 
powerpc64le.

This is mostly working fine for me, except for a soft lockup I see with 
the ftrace direct selftest. It happens when irqsoff tracer is being 
tested with the ftrace direct modules. This appears to be an existing 
upstream issue since I am able to reproduce the lockup without these 
patches. I will be looking into that to see if I can figure out the 
cause of those lockups.

In the meantime, I would appreciate a review of these patches.


- Naveen


Naveen N. Rao (14):
  ftrace: Fix updating FTRACE_FL_TRAMP
  ftrace: Fix DYNAMIC_FTRACE_WITH_DIRECT_CALLS dependency
  ftrace: Fix cleanup in error path of register_ftrace_direct()
  ftrace: Remove ftrace_find_direct_func()
  ftrace: Add architectural helpers for [un]register_ftrace_direct()
  powerpc: Add support for CONFIG_HAVE_FUNCTION_ARG_ACCESS_API
  powerpc/ftrace: Remove dead code
  powerpc/ftrace: Use FTRACE_REGS_ADDR to identify the correct ftrace
    trampoline
  powerpc/ftrace: Use a hash table for tracking ftrace stubs
  powerpc/ftrace: Drop assumptions about ftrace trampoline target
  powerpc/ftrace: Use GPR save/restore macros in ftrace_graph_caller()
  powerpc/ftrace: Drop saving LR to stack save area for -mprofile-kernel
  powerpc/ftrace: Add support for register_ftrace_direct() for
    MPROFILE_KERNEL
  samples/ftrace: Add powerpc support for ftrace direct samples

 arch/powerpc/Kconfig                          |   2 +
 arch/powerpc/include/asm/ftrace.h             |  14 +
 arch/powerpc/include/asm/ptrace.h             |  31 ++
 arch/powerpc/kernel/trace/ftrace.c            | 314 +++++++++++++-----
 .../powerpc/kernel/trace/ftrace_64_mprofile.S |  70 ++--
 include/linux/ftrace.h                        |   7 +-
 kernel/trace/Kconfig                          |   2 +-
 kernel/trace/ftrace.c                         | 130 +++-----
 samples/Kconfig                               |   2 +-
 samples/ftrace/ftrace-direct-modify.c         |  58 ++++
 samples/ftrace/ftrace-direct-too.c            |  48 ++-
 samples/ftrace/ftrace-direct.c                |  45 ++-
 12 files changed, 519 insertions(+), 204 deletions(-)


base-commit: 4c202167192a77481310a3cacae9f12618b92216
-- 
2.25.4

