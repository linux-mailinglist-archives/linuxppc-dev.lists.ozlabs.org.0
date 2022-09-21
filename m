Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 117305BF6D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 08:57:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXTkd6whrz3c8x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 16:57:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kNsQ7HIS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kNsQ7HIS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTjz73Fqz2xZ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:57:11 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L6iPIf029932;
	Wed, 21 Sep 2022 06:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=dpqes4UyNrweWsLX3/AN/wZ1sCiSJNQhwZorPVhSIVY=;
 b=kNsQ7HISqDk+eFhvu8fFaYejj5wMlautAv1vFe6x8E5LpE5Sdj6zf5v8MEQraWwq+sYO
 0sj0ZP9v/KbvolAd9I1pfXEuqsIA0Vlk3754S9porJZuH7MW+wcjrYAdI7/IbfsrLZ+z
 H7soRTNrYbY0nGnir2Pqw8KI1Ps4HATh7wISW9gSmVoIPF/gYaz0aUNQC8ICqu5vih0b
 85dOvppA2xYsixwdUWP79Nfjxy6S1aXONLWsKDBhIdCOzIX7jlSghAR9pTUJiUpJS0SA
 WY3Ut5hel25N5DGL97RGsRXCRcKUo3+EUCilkQ3Ere/qQD0aNwFBJbU4ISUjOaCb3QXz aA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqwkv8a2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:57:05 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L6rDf2025058;
	Wed, 21 Sep 2022 06:57:03 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03ams.nl.ibm.com with ESMTP id 3jn5v94ugu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:57:03 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L6v0SD25166198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 06:57:01 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC6E3A4054;
	Wed, 21 Sep 2022 06:57:00 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D839A405B;
	Wed, 21 Sep 2022 06:57:00 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 06:57:00 +0000 (GMT)
Received: from civic.. (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2825A60060;
	Wed, 21 Sep 2022 16:56:56 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 00/25] powerpc: Syscall wrapper and register clearing
Date: Wed, 21 Sep 2022 16:55:40 +1000
Message-Id: <20220921065605.1051927-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mK_YRZypfdUcPqFVwNtRawWm7X-clpOf
X-Proofpoint-ORIG-GUID: mK_YRZypfdUcPqFVwNtRawWm7X-clpOf
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_03,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=756 mlxscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210043
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

V5 available here:

Link: https://lore.kernel.org/all/20220916053300.786330-2-rmclure@linux.ibm.com/T/

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

The clearing of general purpose registers on interrupts other than
syscalls is enabled by default only on Book3E 64-bit systems (where the
mitigation is inexpensive), but available to other 64-bit systems via
the INTERRUPT_SANITIZE_REGISTERS Kconfig option. This mitigation is
optional, as the speculation influence of interrupts is likely less than
that of syscalls.

Patch Changelog:

 - Clears and restores of NVGPRS that depend on either SANITIZE or
   !SANITIZE have convenience macros.
 - Split syscall wrapper patch with change to system_call_exception
   calling convention.
 - In 64e, exchange misleading REST_GPRS(0, 1, r1) to clearly restore
   r0 first and avoid clobbering the stack pointer.
 - Remove extraneous clears of the high-order words of syscall
   parameters, which is now redundant thanks to use of
   COMPAT_SYSCALL_DEFINE everywhere.

Rohan McLure (25):
  powerpc: Remove asmlinkage from syscall handler definitions
  powerpc: Save caller r3 prior to system_call_exception
  powerpc: Add ZEROIZE_GPRS macros for register clears
  powerpc/64s: Use {ZEROIZE,SAVE,REST}_GPRS macros in sc, scv 0 handlers
  powerpc/32: Clarify interrupt restores with REST_GPR macro in
    entry_32.S
  powerpc/64e: Clarify register saves and clears with
    {SAVE,ZEROIZE}_GPRS
  powerpc/64s: Fix comment on interrupt handler prologue
  powerpc: Fix fallocate and fadvise64_64 compat parameter combination
  asm-generic: compat: Support BE for long long args in 32-bit ABIs
  powerpc: Use generic fallocate compatibility syscall
  powerpc/32: Remove powerpc select specialisation
  powerpc: Remove direct call to personality syscall handler
  powerpc: Remove direct call to mmap2 syscall handlers
  powerpc: Provide do_ppc64_personality helper
  powerpc: Adopt SYSCALL_DEFINE for arch-specific syscall handlers
  powerpc: Include all arch-specific syscall prototypes
  powerpc: Enable compile-time check for syscall handlers
  powerpc: Use common syscall handler type
  powerpc: Remove high-order word clearing on compat syscall entry
  powerpc: Change system_call_exception calling convention
  powerpc: Provide syscall wrapper
  powerpc/64s: Clear user GPRs in syscall interrupt entry
  powerpc/64: Add INTERRUPT_SANITIZE_REGISTERS Kconfig
  powerpc/64s: Clear gprs on interrupt routine entry in Book3S
  powerpc/64e: Clear gprs on interrupt routine entry on Book3E

 arch/powerpc/Kconfig                         |  10 ++
 arch/powerpc/include/asm/interrupt.h         |   3 +-
 arch/powerpc/include/asm/ppc_asm.h           |  22 +++
 arch/powerpc/include/asm/syscall.h           |  11 +-
 arch/powerpc/include/asm/syscall_wrapper.h   |  84 ++++++++++
 arch/powerpc/include/asm/syscalls.h          | 148 +++++++++++++----
 .../ppc32.h => include/asm/syscalls_32.h}    |   0
 arch/powerpc/include/asm/unistd.h            |   1 +
 arch/powerpc/kernel/entry_32.S               |  40 ++---
 arch/powerpc/kernel/exceptions-64e.S         |  36 ++--
 arch/powerpc/kernel/exceptions-64s.S         |  51 ++++--
 arch/powerpc/kernel/interrupt_64.S           |  97 ++++++-----
 arch/powerpc/kernel/signal_32.c              |   2 +-
 arch/powerpc/kernel/sys_ppc32.c              |  66 +++-----
 arch/powerpc/kernel/syscall.c                |  28 +---
 arch/powerpc/kernel/syscalls.c               |  61 ++++---
 arch/powerpc/kernel/syscalls/syscall.tbl     |  24 +--
 arch/powerpc/kernel/systbl.S                 |  41 -----
 arch/powerpc/kernel/systbl.c                 |  47 ++++++
 arch/powerpc/kernel/vdso.c                   |   6 +-
 arch/powerpc/perf/callchain_32.c             |   2 +-
 arch/powerpc/platforms/cell/spu_callbacks.c  |   6 +-
 include/asm-generic/compat.h                 |   9 +-
 .../arch/powerpc/entry/syscalls/syscall.tbl  |  24 +--
 24 files changed, 525 insertions(+), 294 deletions(-)
 create mode 100644 arch/powerpc/include/asm/syscall_wrapper.h
 rename arch/powerpc/{kernel/ppc32.h => include/asm/syscalls_32.h} (100%)
 delete mode 100644 arch/powerpc/kernel/systbl.S
 create mode 100644 arch/powerpc/kernel/systbl.c

-- 
2.34.1

