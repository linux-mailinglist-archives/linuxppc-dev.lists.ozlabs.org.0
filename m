Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0FA5993A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 05:42:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M86yn3402z3f8H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 13:42:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=efHT+eA7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=efHT+eA7;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M86vM51ltz3c7r
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 13:39:42 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J3QXLV011184;
	Fri, 19 Aug 2022 03:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=tRWvWHqnx7LKrcarOkTXFnYk2zErqcuNfK1FG8BzPdk=;
 b=efHT+eA7JnnMuGnZncirzCOnSmX9EOy+YqgHjkYeXkS1QUh/eUNiKfvH3OoJiACRX8JZ
 UmBd9wc9NABixcB9WrwEi9qCUBY6/EOzoa4amtppRjfvSmOG033yTdem7fMgh8FbXnkA
 66E7zJ7cgJ/sjanLM1iuaRWLY8Ur7iaNmXyYlSC2QND0gzfslgiCAjcy5f0nU8lFt4X3
 VB+cUD9zHIuTk8JzvosDOJkbKEvmj+PLNb6plSvLosL2doWHmJfccMEdjiAkJ2kfM05N
 J1bkOxa/ChZ4CPsG2n8WNC1eTc8cB5cPmF47mW5bGl7bsfl5sjv4/uPSbCF8FE0ieplS Vg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j22m68ajc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:36 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27J3bP7M017596;
	Fri, 19 Aug 2022 03:39:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3hx37jeqfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:34 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27J3agni34210056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Aug 2022 03:36:42 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB30FA4051;
	Fri, 19 Aug 2022 03:39:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B881A4040;
	Fri, 19 Aug 2022 03:39:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 19 Aug 2022 03:39:31 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2D3F6600F5;
	Fri, 19 Aug 2022 13:39:24 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 00/18] powerpc: Syscall wrapper and register clearing
Date: Fri, 19 Aug 2022 13:37:48 +1000
Message-Id: <20220819033806.162054-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eJmcb0U8zmIhr00a9J9Jt4olotEwvHKS
X-Proofpoint-ORIG-GUID: eJmcb0U8zmIhr00a9J9Jt4olotEwvHKS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 phishscore=0 mlxlogscore=423
 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190013
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

V2 available here:

Link: https://lore.kernel.org/all/20220725062039.117425-1-rmclure@linux.ibm.com/

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

 - Rename NULLIFY_GPRS macros to ZEROIZE_GPRS
 - Clear up entry_32.S with new macros
 - Acknowledge system_call_exception move to syscall.c
 - Save caller r3 for system calls in interrupt handlers rather than in
   system_call_exception
 - Remove asmlinkage from arch/powerpc
 - Rearrange patches, realign changes to their relevant patches

Rohan McLure (18):
  powerpc: Remove asmlinkage from syscall handler definitions
  powerpc: Use generic fallocate compatibility syscall
  powerpc/32: Remove powerpc select specialisation
  powerpc: Provide do_ppc64_personality helper
  powerpc: Adopt SYSCALL_DEFINE for arch-specific syscall handlers
  powerpc: Remove direct call to personality syscall handler
  powerpc: Remove direct call to mmap2 syscall handlers
  powerpc: Include all arch-specific syscall prototypes
  powerpc: Enable compile-time check for syscall handlers
  powerpc: Use common syscall handler type
  powerpc: Add ZEROIZE_GPRS macros for register clears
  Revert "powerpc/syscall: Save r3 in regs->orig_r3"
  powerpc: Provide syscall wrapper
  powerpc/64s: Clear/restore caller gprs in syscall interrupt/return
  powerpc/64s: Use {ZEROIZE,SAVE,REST}_GPRS macros in sc, scv 0 handlers
  powerpc/32: Clarify interrupt restores with REST_GPR macro in
    entry_32.S
  powerpc/64s: Fix comment on interrupt handler prologue
  powerpc/64s: Clear gprs on interrupt routine entry

 arch/powerpc/Kconfig                         |   1 +
 arch/powerpc/include/asm/compat.h            |   5 +
 arch/powerpc/include/asm/interrupt.h         |   3 +-
 arch/powerpc/include/asm/ppc_asm.h           |  22 +++
 arch/powerpc/include/asm/syscall.h           |  11 +-
 arch/powerpc/include/asm/syscall_wrapper.h   |  94 ++++++++++++
 arch/powerpc/include/asm/syscalls.h          | 128 +++++++++++++----
 .../ppc32.h => include/asm/syscalls_32.h}    |   0
 arch/powerpc/include/asm/unistd.h            |   1 +
 arch/powerpc/kernel/entry_32.S               |  42 +++---
 arch/powerpc/kernel/exceptions-64s.S         |  23 ++-
 arch/powerpc/kernel/interrupt_64.S           |  92 +++++-------
 arch/powerpc/kernel/signal_32.c              |   2 +-
 arch/powerpc/kernel/sys_ppc32.c              |  54 ++++---
 arch/powerpc/kernel/syscall.c                |  32 ++---
 arch/powerpc/kernel/syscalls.c               |  50 ++++---
 arch/powerpc/kernel/syscalls/syscall.tbl     |  24 ++--
 arch/powerpc/kernel/{systbl.S => systbl.c}   |  29 ++--
 arch/powerpc/kernel/vdso.c                   |   6 +-
 arch/powerpc/perf/callchain_32.c             |   2 +-
 arch/powerpc/platforms/cell/spu_callbacks.c  |   6 +-
 .../arch/powerpc/entry/syscalls/syscall.tbl  |  24 ++--
 22 files changed, 409 insertions(+), 242 deletions(-)
 create mode 100644 arch/powerpc/include/asm/syscall_wrapper.h
 rename arch/powerpc/{kernel/ppc32.h => include/asm/syscalls_32.h} (100%)
 rename arch/powerpc/kernel/{systbl.S => systbl.c} (55%)

-- 
2.34.1

