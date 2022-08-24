Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7D359F14E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 04:12:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC8kH0XlMz3fFk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 12:12:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TG3WT65W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TG3WT65W;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC8c52nTwz3c2s
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 12:07:00 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27O22Ifu014073;
	Wed, 24 Aug 2022 02:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=CSjwLn7MHRt1K6idFNpkHW4o9YMdsOKemrY/MvXSL9A=;
 b=TG3WT65W0GDcjuOozaqV+VBaWvciLNWc5vo9NK7sRLhgQz3jwgSsELgiLbrewVHCUMwF
 XJknFAj1otoWyDrAQxgqRJG/1rxF4RJ6XX6HGPz83MMXiZia8af5dbWCkkI+Ekgxu/4Y
 hLAr78zazLjSoQ6AOp41+5BANUhh4+KGKHStZ03OQpYFP6VdAIdVHcqhS/yAJgbO8ku8
 tbKmMD8+H6TGrHAHWbllUaO1EJuGRe4/yk+uXkJ8Um71ENk0UK8gAReCLJqHib9jMPpz
 gqZvUCEln+YpzyRT9Sp4zIin5DhWyhYq6TJlNjkLDkhptxgABeZgp6fSYu4dW2Ab6Ros ZA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j5ausr3dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:06:38 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27O26SAK020567;
	Wed, 24 Aug 2022 02:06:36 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03fra.de.ibm.com with ESMTP id 3j2q8939dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:06:36 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27O26Xjx18743590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Aug 2022 02:06:34 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0B50A4059;
	Wed, 24 Aug 2022 02:06:33 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2045CA4053;
	Wed, 24 Aug 2022 02:06:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 24 Aug 2022 02:06:33 +0000 (GMT)
Received: from civic.. (unknown [9.177.18.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9A3D0600A7;
	Wed, 24 Aug 2022 12:06:23 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 00/20] powerpc: Syscall wrapper and register clearing
Date: Wed, 24 Aug 2022 12:05:28 +1000
Message-Id: <20220824020548.62625-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HqyluymLeGErbie9CSCgFHoLkYf1bmiQ
X-Proofpoint-ORIG-GUID: HqyluymLeGErbie9CSCgFHoLkYf1bmiQ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_10,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 mlxscore=0 mlxlogscore=251
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208240005
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

V3 available here:

Link: https://lore.kernel.org/all/4C3A8815-67FF-41EB-A703-981920CA1201@linux.ibm.com/T/

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
parameter reorderings are however consistent with arm. A future patch
series will serve to modernise syscalls by providing generic
implementations featuring these reorderings.

The design of this syscall is very similar to the s390, x86 and arm64
implementations. See also Commit 4378a7d4be30 (arm64: implement syscall wrappers).
The motivation for this change is that it allows for the clearing of
register state when entering the kernel via through interrupt handlers
on 64-bit servers. This serves to reduce the influence of values in
registers carried over from the interrupted process, e.g. syscall
parameters from user space, or user state at the site of a pagefault.
All values in registers are saved and zeroized at the entry to an
interrupt handler and restored afterward. While this may sound like a
heavy-weight mitigation, many gprs are already saved and restored on
handling of an interrupt, and the mmap_bench benchmark on Power 9 guest,
repeatedly invoking the pagefault handler suggests at most ~0.8%
regression in performance. Realistic workloads are not constantly
producing interrupts, and so this does not indicate realistic slowdown.

Using wrapped syscalls yields to a performance improvement of ~5.6% on
the null_syscall benchmark on pseries guests, by removing the need for
system_call_exception to allocate its own stack frame. This amortises
the additional costs of saving and restoring non-volatile registers
(register clearing is cheap on super scalar platforms), and so the
final mitigation actually yields a net performance improvement of ~0.6%
on the null_syscall benchmark.

Patch Changelog:

 - Fix instances where NULLIFY_GPRS were still present
 - Minimise unrecoverable windows in entry_32.S between SRR0/1 restores
   and RFI
 - Remove all references to syscall symbols prior to introducing syscall
   wrapper.
 - Remove unnecessary duplication of syscall handlers with sys_... and
   powerpc_sys_... symbols.
 - Clear non-volatile registers on Book3E systems, as some of these
   systems feature hardware speculation, and we already unconditionally
   restore NVGPRS.

Rohan McLure (20):
  powerpc: Remove asmlinkage from syscall handler definitions
  powerpc: Use generic fallocate compatibility syscall
  powerpc/32: Remove powerpc select specialisation
  powerpc: Provide do_ppc64_personality helper
  powerpc: Remove direct call to personality syscall handler
  powerpc: Remove direct call to mmap2 syscall handlers
  powerpc: Adopt SYSCALL_DEFINE for arch-specific syscall handlers
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
  powerpc/64e: Clarify register saves and clears with
    {SAVE,ZEROIZE}_GPRS
  powerpc/64s: Fix comment on interrupt handler prologue
  powerpc/64s: Clear gprs on interrupt routine entry in Book3S
  powerpc/64e: Clear gprs on interrupt routine entry

 arch/powerpc/Kconfig                         |   1 +
 arch/powerpc/include/asm/compat.h            |   5 +
 arch/powerpc/include/asm/interrupt.h         |   3 +-
 arch/powerpc/include/asm/ppc_asm.h           |  22 +++
 arch/powerpc/include/asm/syscall.h           |  11 +-
 arch/powerpc/include/asm/syscall_wrapper.h   |  84 +++++++++++
 arch/powerpc/include/asm/syscalls.h          | 128 +++++++++++++----
 .../ppc32.h => include/asm/syscalls_32.h}    |   0
 arch/powerpc/include/asm/unistd.h            |   1 +
 arch/powerpc/kernel/entry_32.S               |  40 +++---
 arch/powerpc/kernel/exceptions-64e.S         |  31 ++--
 arch/powerpc/kernel/exceptions-64s.S         |  25 ++--
 arch/powerpc/kernel/interrupt_64.S           |  92 +++++-------
 arch/powerpc/kernel/signal_32.c              |   2 +-
 arch/powerpc/kernel/sys_ppc32.c              |  54 ++++---
 arch/powerpc/kernel/syscall.c                |  32 ++---
 arch/powerpc/kernel/syscalls.c               |  51 ++++---
 arch/powerpc/kernel/syscalls/syscall.tbl     |  24 ++--
 arch/powerpc/kernel/{systbl.S => systbl.c}   |  29 ++--
 arch/powerpc/kernel/vdso.c                   |   6 +-
 arch/powerpc/perf/callchain_32.c             |   2 +-
 arch/powerpc/platforms/cell/spu_callbacks.c  |   6 +-
 .../arch/powerpc/entry/syscalls/syscall.tbl  |  24 ++--
 23 files changed, 415 insertions(+), 258 deletions(-)
 create mode 100644 arch/powerpc/include/asm/syscall_wrapper.h
 rename arch/powerpc/{kernel/ppc32.h => include/asm/syscalls_32.h} (100%)
 rename arch/powerpc/kernel/{systbl.S => systbl.c} (55%)

-- 
2.34.1

