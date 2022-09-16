Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 364FF5BA68E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 07:59:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTNgY73j6z3cdM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:59:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KWm+1vGH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KWm+1vGH;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTNfw6V5xz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 15:58:48 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G5vg2I002042;
	Fri, 16 Sep 2022 05:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=LjkEjE5HZxxT5BThx7yeGuF0UjzHxuu/Gzv1LKi4csM=;
 b=KWm+1vGHfZq8p3XTg95/JiEH1otUa835iRLsXjkHCTKmupm6TGofzQfeChs6JD7izSqy
 s+fZcdojLKGqVdDlVhfHRxp1uGrBCG2xib3WpKV+XdAoj3ial631K9Yxdtb49DXbuNsq
 ArSIhQYXGcA/cn4vsQwxMYHf+y43pHwXEC9D7WLVVMyASJ/b2ykoo0QkqicJHy+Yedk8
 /KNs28pY0HHD+YPsUKZzWSEQ4rljjqitGbrYMtXFrlz5Rkw0eoge6Q34YUzesTeke4HB
 2MhEvD6aO3XPH6vrr0iQvtcgDjr+nbPMvofmkex0wiWgiUqo/Y7wfyCYfQWa/yaVdgfV Lg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmkf380ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:58:42 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G5pKFg007704;
	Fri, 16 Sep 2022 05:58:40 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma05fra.de.ibm.com with ESMTP id 3jm91crd7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:58:40 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G5wcKJ38535486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 05:58:38 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65D06AE045;
	Fri, 16 Sep 2022 05:58:38 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC81EAE04D;
	Fri, 16 Sep 2022 05:58:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 05:58:37 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8DA62600EE;
	Fri, 16 Sep 2022 15:58:36 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 00/23] powerpc: Syscall wrapper and register clearing
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <20220916053300.786330-1-rmclure@linux.ibm.com>
Date: Fri, 16 Sep 2022 15:58:34 +1000
Message-Id: <39B65F8C-D0B2-4AA8-8AA4-A66931215980@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5tMp25aLYfbo7y71rTAkGccyIXCc5qIP
X-Proofpoint-ORIG-GUID: 5tMp25aLYfbo7y71rTAkGccyIXCc5qIP
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=692 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160041
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On 16 Sep 2022, at 3:32 pm, Rohan McLure <rmclure@linux.ibm.com> wrote:
>=20
> V4 available here:
>=20
> Link: https://lore.kernel.org/all/20220824020548.62625-1-rmclure@linux.ib=
m.com/
>=20
> Implement a syscall wrapper, causing arguments to handlers to be passed
> via a struct pt_regs on the stack. The syscall wrapper is implemented
> for all platforms other than the Cell processor, from which SPUs expect
> the ability to directly call syscall handler symbols with the regular
> in-register calling convention.
>=20
> Adopting syscall wrappers requires redefinition of architecture-specific
> syscalls and compatibility syscalls to use the SYSCALL_DEFINE and
> COMPAT_SYSCALL_DEFINE macros, as well as removal of direct-references to
> the emitted syscall-handler symbols from within the kernel. This work
> lead to the following modernisations of powerpc's syscall handlers:
>=20
> - Replace syscall 82 semantics with sys_old_select and remove
>   ppc_select handler, which features direct call to both sys_old_select
>   and sys_select.
> - Use a generic fallocate compatibility syscall
>=20
> Replace asm implementation of syscall table with C implementation for
> more compile-time checks.
>=20
> Many compatibility syscalls are candidates to be removed in favour of
> generically defined handlers, but exhibit different parameter orderings
> and numberings due to 32-bit ABI support for 64-bit parameters. The
> parameter reorderings are however consistent with arm. A future patch
> series will serve to modernise syscalls by providing generic
> implementations featuring these reorderings.
>=20
> The design of this syscall is very similar to the s390, x86 and arm64
> implementations. See also Commit 4378a7d4be30 (arm64: implement syscall w=
rappers).
> The motivation for this change is that it allows for the clearing of
> register state when entering the kernel via through interrupt handlers
> on 64-bit servers. This serves to reduce the influence of values in
> registers carried over from the interrupted process, e.g. syscall
> parameters from user space, or user state at the site of a pagefault.
> All values in registers are saved and zeroized at the entry to an
> interrupt handler and restored afterward. While this may sound like a
> heavy-weight mitigation, many gprs are already saved and restored on
> handling of an interrupt, and the mmap_bench benchmark on Power 9 guest,
> repeatedly invoking the pagefault handler suggests at most ~0.8%
> regression in performance. Realistic workloads are not constantly
> producing interrupts, and so this does not indicate realistic slowdown.
>=20
> Using wrapped syscalls yields to a performance improvement of ~5.6% on
> the null_syscall benchmark on pseries guests, by removing the need for
> system_call_exception to allocate its own stack frame. This amortises
> the additional costs of saving and restoring non-volatile registers
> (register clearing is cheap on super scalar platforms), and so the
> final mitigation actually yields a net performance improvement of ~0.6%
> on the null_syscall benchmark.
>=20
> The clearing of general purpose registers on interrupts other than
> syscalls is enabled by default only on Book3E 64-bit systems (where the
> mitigation is inexpensive), but available to other 64-bit systems via
> the INTERRUPT_SANITIZE_REGISTERS Kconfig option. This mitigation is
> optional, as the speculation influence of interrupts is likely less than
> that of syscalls.
>=20
> Patch Changelog:
>=20
> - Format orig_r3 handling as its own patch rather than just a revert.
> - Provide asm-generic BE implementation of long-long munging syscall
>   compatiblity arguments.
> - Syscall #82 now refers to generic sys_old_select or
>   comptat_sys_old_select.
> - Drop 'inline' on static helper functions for mmap, personality.
> - Remove arch-specific sys fallocate implementation that was meant to
>   have been removed in V2.
> - Remove references to syscall wrapper until it is introduced.
> - Rearrange patch series so the last five patches are syscall wrapper >
>   syscall register clears > interrupt register clears.
> - Whether non-syscall interrupts should clear registers is now
>   configurable by INTERRUPT_SANITIZE_REGISTERS.
>=20
> Rohan McLure (23):
>  powerpc: Remove asmlinkage from syscall handler definitions
>  powerpc: Save caller r3 prior to system_call_exception
>  powerpc: Add ZEROIZE_GPRS macros for register clears
>  powerpc/64s: Use {ZEROIZE,SAVE,REST}_GPRS macros in sc, scv 0 handlers
>  powerpc/32: Clarify interrupt restores with REST_GPR macro in
>    entry_32.S
>  powerpc/64e: Clarify register saves and clears with
>    {SAVE,ZEROIZE}_GPRS
>  powerpc/64s: Fix comment on interrupt handler prologue
>  powerpc: Fix fallocate and fadvise64_64 compat parameter combination
>  asm-generic: compat: Support BE for long long args in 32-bit ABIs
>  powerpc: Use generic fallocate compatibility syscall
>  powerpc/32: Remove powerpc select specialisation
>  powerpc: Remove direct call to personality syscall handler
>  powerpc: Remove direct call to mmap2 syscall handlers
>  powerpc: Provide do_ppc64_personality helper
>  powerpc: Adopt SYSCALL_DEFINE for arch-specific syscall handlers
>  powerpc: Include all arch-specific syscall prototypes
>  powerpc: Enable compile-time check for syscall handlers
>  powerpc: Use common syscall handler type
>  powerpc: Provide syscall wrapper
>  powerpc/64s: Clear/restore caller gprs in syscall interrupt/return
>  powerpc/64: Add INTERRUPT_SANITIZE_REGISTERS Kconfig
>  powerpc/64s: Clear gprs on interrupt routine entry in Book3S
>  powerpc/64e: Clear gprs on interrupt routine entry on Book3E
>=20
> arch/powerpc/Kconfig                         |  10 ++
> arch/powerpc/include/asm/interrupt.h         |   3 +-
> arch/powerpc/include/asm/ppc_asm.h           |  22 +++
> arch/powerpc/include/asm/syscall.h           |  11 +-
> arch/powerpc/include/asm/syscall_wrapper.h   |  84 ++++++++++
> arch/powerpc/include/asm/syscalls.h          | 148 +++++++++++++----
> .../ppc32.h =3D> include/asm/syscalls_32.h}    |   0
> arch/powerpc/include/asm/unistd.h            |   1 +
> arch/powerpc/kernel/entry_32.S               |  40 ++---
> arch/powerpc/kernel/exceptions-64e.S         |  35 ++--
> arch/powerpc/kernel/exceptions-64s.S         |  41 ++++-
> arch/powerpc/kernel/interrupt_64.S           |  92 +++++-----
> arch/powerpc/kernel/signal_32.c              |   2 +-
> arch/powerpc/kernel/sys_ppc32.c              |  66 +++-----
> arch/powerpc/kernel/syscall.c                |  32 ++--
> arch/powerpc/kernel/syscalls.c               |  61 ++++---
> arch/powerpc/kernel/syscalls/syscall.tbl     |  24 +--
> arch/powerpc/kernel/{systbl.S =3D> systbl.c}   |  30 ++--
> arch/powerpc/kernel/vdso.c                   |   6 +-
> arch/powerpc/perf/callchain_32.c             |   2 +-
> arch/powerpc/platforms/cell/spu_callbacks.c  |   6 +-
> include/asm-generic/compat.h                 |   9 +-
> .../arch/powerpc/entry/syscalls/syscall.tbl  |  24 +--
> 23 files changed, 491 insertions(+), 258 deletions(-)
> create mode 100644 arch/powerpc/include/asm/syscall_wrapper.h
> rename arch/powerpc/{kernel/ppc32.h =3D> include/asm/syscalls_32.h} (100%)
> rename arch/powerpc/kernel/{systbl.S =3D> systbl.c} (55%)
>=20
> --=20
> 2.34.1
>=20

Apologies. This is in fact V5. I can resend if anyone needs me to.

Rohan=
