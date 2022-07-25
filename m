Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5615957F955
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 08:21:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrqgm1Pj5z3blS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 16:21:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DYqLs3Xb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DYqLs3Xb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lrqg0140Jz302S
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 16:20:59 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26P6C1sF008812;
	Mon, 25 Jul 2022 06:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=xeE34PAeit9y6589ogxPk+MTEaOr+zyUDz5AIzKfi2g=;
 b=DYqLs3Xbjmq2+/GXVbBdvVtA3RHAUu/jPS4cUDVclVZz29J01+XtJkcy+teilL8nOjY5
 8g8rjLglbQDimZzR+UGiorYeX+rpvxVT7umoyXqZ6UsAUwvJgfY8OOeIjZ8wfWon8XBj
 dXJy/YKfcGArcHPpgEynBGe/pzLtKSE0FDTWxHRitpxp5nds1v98claSHHHZ1mPmZCjY
 VRQQol2psPqn+BPnPwoCTD9zt3NvqqSrJlhCxoAhXb4ojOmZEqUONh23IHEsNO8j0hxg
 Um/LaOoHxh8Guq4F+ccnTgiE5+twKnwHTssfFyH7iRHdlIP1lm7vMJlOtW5druKY2Ohz Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnpp8778-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:20:52 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26P6FINR026230;
	Mon, 25 Jul 2022 06:20:52 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnpp876f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:20:51 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26P65HUo019256;
	Mon, 25 Jul 2022 06:20:49 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3hg96whyqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:20:49 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26P6L0Fm29098302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Jul 2022 06:21:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DACC611C050;
	Mon, 25 Jul 2022 06:20:46 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 185A811C04A;
	Mon, 25 Jul 2022 06:20:45 +0000 (GMT)
Received: from civic.. (unknown [9.192.255.53])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 25 Jul 2022 06:20:44 +0000 (GMT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/14] powerpc: Syscall wrapper and register clearing
Date: Mon, 25 Jul 2022 16:20:25 +1000
Message-Id: <20220725062039.117425-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gHxdOH-9ibgYHH7bZSqO1jqSQy57_Nzt
X-Proofpoint-ORIG-GUID: Wy05Xc1BDG2OulUXHD37rHInU2dawJoG
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=336 bulkscore=0 clxscore=1011 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250026
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

V1 available here:

Link: https://lore.kernel.org/all/20220601054850.250287-1-rmclure@linux.ibm.com/

Implement a syscall wrapper, causing arguments to handlers to be passed
via a struct pt_regs on the stack. The syscall wrapper is implemented
for all platforms other than the Cell processor, from which SPUs expect
the ability to directly call syscall handler symbols with the regular
in-register calling convention.

Adopting syscall wrappers requires redefinition of architecture-specific
syscalls and compatibility syscalls to use the SYSCALL_DEFINE and
COMPAT_SYSCALL_DEFINE macros, as well as removal of direct-references to
the emitted syscall-handler symbols from within the kernel. This work
lead to the following modernisations of powerpc's syscall handlers:

 - Replace syscall 82 semantics with sys_old_select and remove
   ppc_select handler, which features direct call to both sys_old_select
   and sys_select.
 - Use a generic fallocate compatibility syscall

Replace asm implementation of syscall table with C implementation for
more compile-time checks.

Many compatibility syscalls are candidates to be removed in favour of
generically defined handlers, but exhibit different parameter orderings
and numberings due to 32-bit ABI support for 64-bit parameters. The
paramater reorderings are however consistent with arm. A future patch
series will serve to modernise syscalls by providing generic
implementations featuring these reorderings.

The design of this syscall is very similar to the s390, x86 and arm64
implementations. See also Commit 4378a7d4be30 (arm64: implement syscall wrappers).
The motivation for this change is that it allows for the clearing of
register state when entering the kernel via through interrupt handlers
on 64-bit servers. This serves to reduce the influence of values in
registers carried over from the interrupted process, e.g. syscall
parameters from user space, or user state at the site of a pagefault.
All values in registers are saved and nullified (assigned to zero) at
the entry to an interrupt handler and restored afterward. While this may
sound like a heavy-weight mitigation, many gprs are already saved and
restored on handling of an interrupt, and the mmap_bench benchmark on
Power 9 guest, repeatedly invoking the pagefault handler suggests at most
~0.8% regression in performance. Realistic workloads are not constantly
producing interrupts, and so this does not indicate realistic slowdown.

Using wrapped syscalls yields to a performance improvement of ~5.6% on
the null_syscall benchmark on pseries guests, by removing the need for
system_call_exception to allocate its own stack frame. This amortises
the additional costs of saving and restoring non-volatile registers
(register clearing is cheap on super scalar platforms), and so the
final mitigation actually yields a net performance improvement of ~0.6%
on the null_syscall benchmark.

Patch Changelog:

 - Explicitly specify that register saving/clearing/restoring effects
   only 64bit server platforms (Book 3s/64s)
 - Wrap all syscall definitions in one of SYSCALL_DEFINE or
   COMPAT_SYSCALL_DEFINE
 - Emit prototypes for wrapped syscall handlers
 - Convert systbl.S to a C file
 - Use generic implementation of fallocate compatibility syscall
 - Assign generic old_select semantics to syscall #82
 - Move ppc32.h header to include/asm/
 - Include benchmark results for both DSI and null syscalls

Rohan McLure (14):
  powerpc: Adopt SYSCALL_DEFINE for arch-specific syscall handlers
  powerpc: Remove direct call to personality syscall handler
  powerpc: Remove direct call to mmap2 syscall handlers
  powerpc/32: Remove powerpc select specialisation
  powerpc: Use generic fallocate compatibility syscall
  powerpc: Include all arch-specific syscall prototypes
  powerpc: Enable compile-time check for syscall handlers
  powerpc: Use common syscall handler type
  powerpc: Add NULLIFY_GPRS macros for register clears
  powerpc: Provide syscall wrapper
  powerpc/64s: Clear/restore caller gprs in syscall interrupt/return
  powerpc/64s: Use {NULLIFY,SAVE,REST}_GPRS macros in sc, scv 0 handlers
  powerpc/64s: Fix comment on interrupt handler prologue
  powerpc/64s: Clear gprs on interrupt routine entry

 arch/powerpc/Kconfig                                |   1 +
 arch/powerpc/include/asm/compat.h                   |   5 +
 arch/powerpc/include/asm/interrupt.h                |   3 +-
 arch/powerpc/{kernel => include/asm}/ppc32.h        |   0
 arch/powerpc/include/asm/ppc_asm.h                  |  22 +++
 arch/powerpc/include/asm/syscall.h                  |  11 +-
 arch/powerpc/include/asm/syscall_wrapper.h          |  94 ++++++++++++
 arch/powerpc/include/asm/syscalls.h                 | 128 +++++++++++++----
 arch/powerpc/include/asm/unistd.h                   |   1 +
 arch/powerpc/kernel/asm-offsets.c                   |   1 +
 arch/powerpc/kernel/entry_32.S                      |   6 +-
 arch/powerpc/kernel/exceptions-64s.S                |  23 ++-
 arch/powerpc/kernel/interrupt.c                     |  33 ++---
 arch/powerpc/kernel/interrupt_64.S                  |  90 +++++-------
 arch/powerpc/kernel/signal_32.c                     |   2 +-
 arch/powerpc/kernel/sys_ppc32.c                     |  54 ++++---
 arch/powerpc/kernel/syscalls.c                      |  50 ++++---
 arch/powerpc/kernel/syscalls/syscall.tbl            |  24 ++--
 arch/powerpc/kernel/{systbl.S => systbl.c}          |  29 ++--
 arch/powerpc/kernel/vdso.c                          |   6 +-
 arch/powerpc/perf/callchain_32.c                    |   2 +-
 arch/powerpc/platforms/cell/spu_callbacks.c         |   8 +-
 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl  |  24 ++--
 23 files changed, 397 insertions(+), 220 deletions(-)
 rename arch/powerpc/{kernel => include/asm}/ppc32.h (100%)
 create mode 100644 arch/powerpc/include/asm/syscall_wrapper.h
 rename arch/powerpc/kernel/{systbl.S => systbl.c} (55%)

-- 
2.34.1

