Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 138B953C364
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 05:32:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDpNN4q1hz3bY6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 13:32:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MKyZtm5b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MKyZtm5b;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDpMb1hGNz3bY6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 13:31:38 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2532c5uD029986;
	Fri, 3 Jun 2022 03:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=r/eDPhrdP6aGES5XW7PRbeK/Mlj1DTqnfYRvGkyClGo=;
 b=MKyZtm5bBVCuFtMxH2WG7v7gfeHPYa5nhpGRTROi3o2cHQbh9oFV6sab5TAzaZIvnThv
 p+KM9qC2Kbf2lCukN5igpzqnwtZMyJ7avOhOhlrOcXdBVcSr9SlyfkCIq3q4bsTOURU2
 UNpL4NQ3hdswurbirVJ70a6lxWQ9FpYwfQZ/dKj2pU0K44tNrQg5WXITE+nC/955Kman
 usgGDSu3W41nR9xev4eH7g5MktRqwmX7GGInfjtVLvXVyJmGVMqtBwUPlE1y17UAyVxL
 mowgHJ17b7LPnPHq8iZVg5Sw1K/JCM5l1sdAXWhen9ZQdraqEjPjmDRNa9hp7fjDoxaK XA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gf2ab7m72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jun 2022 03:31:32 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2533RJgH002546;
	Fri, 3 Jun 2022 03:31:31 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gf2ab7m6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jun 2022 03:31:31 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2533Lxpc028797;
	Fri, 3 Jun 2022 03:31:29 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma01fra.de.ibm.com with ESMTP id 3gbcakny8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jun 2022 03:31:29 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2533VR2944696016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jun 2022 03:31:27 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 521E74C04A;
	Fri,  3 Jun 2022 03:31:27 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 971AC4C040;
	Fri,  3 Jun 2022 03:31:24 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.84.185.2])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Fri,  3 Jun 2022 03:31:24 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 2/6] powerpc: Provide syscall wrapper
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <d5a2d52a-a74b-3df8-8772-f37d61d47641@csgroup.eu>
Date: Fri, 3 Jun 2022 13:24:46 +1000
Message-Id: <4900183A-EABD-427D-A930-F2D44DD59C94@linux.ibm.com>
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
 <20220601054850.250287-2-rmclure@linux.ibm.com>
 <d5a2d52a-a74b-3df8-8772-f37d61d47641@csgroup.eu>
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2F_ZtTj9rjSXssNvsouibBtCeHRqFE28
X-Proofpoint-GUID: lRBVGoyiJKrEsIVOmzSn1Kd9zPEe2_Y-
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-03_01,2022-06-02_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 mlxlogscore=854
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206030011
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for your comment. I comment briefly here on how files like
arch/powerpc/kernel/syscalls.c implement ppc specialisations of=20
various syscalls, with implementations that themselves call syscall
symbols.

>> For platforms supporting this syscall wrapper, emit symbols with usual
>> in-register parameters (`sys...`) to support calls to syscall handlers
>> from within the kernel.


The implementation of ppc_personality can be immediately reworked to
call ksys_personality, but I can=E2=80=99t do the same for sys_old_select f=
or
example, which is required to implement ppc_select. As such we emit both=20
symbols (sys_... and __powerpc...) so that ppc implementations can=20
efficiently call other implementations without needing to allocate
another pt_regs onto the stack.

This does admittedly introduce some code bloat into the binary. I see
a couple ways of fixing this:
1. Remove all calls to syscall implementations via sys_... symbols from
   within the kernel.
2. Restrict which syscall implementations receive a sys_... symbol to
   limit the number of duplicated functions.

Do you have any suggestions on how I might fix this?=20

> On 2 Jun 2022, at 12:33 am, Christophe Leroy <christophe.leroy@csgroup.eu=
> wrote:
>=20
>=20
>=20
> Le 01/06/2022 =C3=A0 07:48, Rohan McLure a =C3=A9crit :
>> [Vous ne recevez pas souvent de courriers de la part de rmclure@linux.ib=
m.com. D=C3=A9couvrez pourquoi cela peut =C3=AAtre important =C3=A0 l'adres=
se https://aka.ms/LearnAboutSenderIdentification.]
>>=20
>> Syscall wrapper implemented as per s390, x86, arm64, providing the
>> option for gprs to be cleared on entry to the kernel, reducing caller
>> influence influence on speculation within syscall routine. The wrapper
>> is a macro that emits syscall handler implementations with parameters
>> passed by stack pointer.
>>=20
>> For platforms supporting this syscall wrapper, emit symbols with usual
>> in-register parameters (`sys...`) to support calls to syscall handlers
>> from within the kernel.
>>=20
>> Syscalls are wrapped on all platforms except Cell processor. SPUs require
>> access syscall prototypes which are omitted with ARCH_HAS_SYSCALL_WRAPPER
>> enabled.
>>=20
>=20
> Also wondering why I get duplicated syscall functions. Shouldn't the=20
> sys_ ones go away once we implement the __powerpc_sys_ ones ?
>=20
> c001e9a0 <sys_fork>:
> c001e9a0:	94 21 ff b0 	stwu    r1,-80(r1)
> c001e9a4:	7c 08 02 a6 	mflr    r0
> c001e9a8:	38 a0 00 40 	li      r5,64
> c001e9ac:	38 80 00 00 	li      r4,0
> c001e9b0:	38 61 00 08 	addi    r3,r1,8
> c001e9b4:	90 01 00 54 	stw     r0,84(r1)
> c001e9b8:	4b ff 6d 55 	bl      c001570c <memset>
> c001e9bc:	38 61 00 08 	addi    r3,r1,8
> c001e9c0:	39 20 00 11 	li      r9,17
> c001e9c4:	91 21 00 1c 	stw     r9,28(r1)
> c001e9c8:	4b ff fb 31 	bl      c001e4f8 <kernel_clone>
> c001e9cc:	80 01 00 54 	lwz     r0,84(r1)
> c001e9d0:	38 21 00 50 	addi    r1,r1,80
> c001e9d4:	7c 08 03 a6 	mtlr    r0
> c001e9d8:	4e 80 00 20 	blr
>=20
> c001e9dc <__powerpc_sys_fork>:
> c001e9dc:	94 21 ff b0 	stwu    r1,-80(r1)
> c001e9e0:	7c 08 02 a6 	mflr    r0
> c001e9e4:	38 a0 00 40 	li      r5,64
> c001e9e8:	38 80 00 00 	li      r4,0
> c001e9ec:	38 61 00 08 	addi    r3,r1,8
> c001e9f0:	90 01 00 54 	stw     r0,84(r1)
> c001e9f4:	4b ff 6d 19 	bl      c001570c <memset>
> c001e9f8:	38 61 00 08 	addi    r3,r1,8
> c001e9fc:	39 20 00 11 	li      r9,17
> c001ea00:	91 21 00 1c 	stw     r9,28(r1)
> c001ea04:	4b ff fa f5 	bl      c001e4f8 <kernel_clone>
> c001ea08:	80 01 00 54 	lwz     r0,84(r1)
> c001ea0c:	38 21 00 50 	addi    r1,r1,80
> c001ea10:	7c 08 03 a6 	mtlr    r0
> c001ea14:	4e 80 00 20 	blr
>=20
> c001ea18 <sys_vfork>:
> c001ea18:	94 21 ff b0 	stwu    r1,-80(r1)
> c001ea1c:	7c 08 02 a6 	mflr    r0
> c001ea20:	38 a0 00 38 	li      r5,56
> c001ea24:	38 80 00 00 	li      r4,0
> c001ea28:	38 61 00 10 	addi    r3,r1,16
> c001ea2c:	90 01 00 54 	stw     r0,84(r1)
> c001ea30:	4b ff 6c dd 	bl      c001570c <memset>
> c001ea34:	38 61 00 08 	addi    r3,r1,8
> c001ea38:	39 40 00 00 	li      r10,0
> c001ea3c:	39 60 41 00 	li      r11,16640
> c001ea40:	39 20 00 11 	li      r9,17
> c001ea44:	91 41 00 08 	stw     r10,8(r1)
> c001ea48:	91 61 00 0c 	stw     r11,12(r1)
> c001ea4c:	91 21 00 1c 	stw     r9,28(r1)
> c001ea50:	4b ff fa a9 	bl      c001e4f8 <kernel_clone>
> c001ea54:	80 01 00 54 	lwz     r0,84(r1)
> c001ea58:	38 21 00 50 	addi    r1,r1,80
> c001ea5c:	7c 08 03 a6 	mtlr    r0
> c001ea60:	4e 80 00 20 	blr
>=20
> c001ea64 <__powerpc_sys_vfork>:
> c001ea64:	94 21 ff b0 	stwu    r1,-80(r1)
> c001ea68:	7c 08 02 a6 	mflr    r0
> c001ea6c:	38 a0 00 38 	li      r5,56
> c001ea70:	38 80 00 00 	li      r4,0
> c001ea74:	38 61 00 10 	addi    r3,r1,16
> c001ea78:	90 01 00 54 	stw     r0,84(r1)
> c001ea7c:	4b ff 6c 91 	bl      c001570c <memset>
> c001ea80:	38 61 00 08 	addi    r3,r1,8
> c001ea84:	39 40 00 00 	li      r10,0
> c001ea88:	39 60 41 00 	li      r11,16640
> c001ea8c:	39 20 00 11 	li      r9,17
> c001ea90:	91 41 00 08 	stw     r10,8(r1)
> c001ea94:	91 61 00 0c 	stw     r11,12(r1)
> c001ea98:	91 21 00 1c 	stw     r9,28(r1)
> c001ea9c:	4b ff fa 5d 	bl      c001e4f8 <kernel_clone>
> c001eaa0:	80 01 00 54 	lwz     r0,84(r1)
> c001eaa4:	38 21 00 50 	addi    r1,r1,80
> c001eaa8:	7c 08 03 a6 	mtlr    r0
> c001eaac:	4e 80 00 20 	blr
>=20
>=20
>=20
> Christophe
>=20
>=20
>> Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
>> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> arch/powerpc/Kconfig | 1 +
>> arch/powerpc/include/asm/interrupt.h | 3 +-
>> arch/powerpc/include/asm/syscall_wrapper.h | 92 ++++++++++++++++++++++
>> arch/powerpc/include/asm/syscalls.h | 83 +++++++++++++------
>> arch/powerpc/kernel/entry_32.S | 6 +-
>> arch/powerpc/kernel/interrupt.c | 35 ++++----
>> arch/powerpc/kernel/interrupt_64.S | 30 +++----
>> arch/powerpc/kernel/sys_ppc32.c | 50 +++++++-----
>> arch/powerpc/kernel/syscalls.c | 19 +++--
>> arch/powerpc/kernel/systbl.S | 21 +++++
>> arch/powerpc/kernel/vdso.c | 2 +
>> 11 files changed, 255 insertions(+), 87 deletions(-)
>> create mode 100644 arch/powerpc/include/asm/syscall_wrapper.h
>>=20
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 174edabb74fa..e58287a70061 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -137,6 +137,7 @@ config PPC
>> select ARCH_HAS_STRICT_KERNEL_RWX if (PPC_BOOK3S || PPC_8xx || 40x) && !=
HIBERNATION
>> select ARCH_HAS_STRICT_KERNEL_RWX if FSL_BOOKE && !HIBERNATION && !RANDO=
MIZE_BASE
>> select ARCH_HAS_STRICT_MODULE_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>> + select ARCH_HAS_SYSCALL_WRAPPER if !SPU_BASE
>> select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>> select ARCH_HAS_UACCESS_FLUSHCACHE
>> select ARCH_HAS_UBSAN_SANITIZE_ALL
>> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include=
/asm/interrupt.h
>> index f964ef5c57d8..8e8949e4db7a 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -636,8 +636,7 @@ static inline void interrupt_cond_local_irq_enable(s=
truct pt_regs *regs)
>> local_irq_enable();
>> }
>>=20
>> -long system_call_exception(long r3, long r4, long r5, long r6, long r7,=
 long r8,
>> - unsigned long r0, struct pt_regs *regs);
>> +long system_call_exception(unsigned long r0, struct pt_regs *regs);
>> notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_r=
egs *regs, long scv);
>> notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs);
>> notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs=
);
>> diff --git a/arch/powerpc/include/asm/syscall_wrapper.h b/arch/powerpc/i=
nclude/asm/syscall_wrapper.h
>> new file mode 100644
>> index 000000000000..23da22b081e4
>> --- /dev/null
>> +++ b/arch/powerpc/include/asm/syscall_wrapper.h
>> @@ -0,0 +1,92 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * syscall_wrapper.h - powerpc specific wrappers to syscall definitions
>> + *
>> + * Based on arch/{x86,arm64}/include/asm/syscall_wrapper.h
>> + */
>> +
>> +#ifndef __ASM_SYSCALL_WRAPPER_H
>> +#define __ASM_SYSCALL_WRAPPER_H
>> +
>> +struct pt_regs;
>> +
>> +#define SC_POWERPC_REGS_TO_ARGS(x, ...) \
>> + __MAP(x,__SC_ARGS \
>> + ,,regs->gpr[3],,regs->gpr[4],,regs->gpr[5] \
>> + ,,regs->gpr[6],,regs->gpr[7],,regs->gpr[8])
>> +
>> +#ifdef CONFIG_COMPAT
>> +
>> +#define COMPAT_SYSCALL_DEFINEx(x, name, ...) \
>> + asmlinkage long __powerpc_compat_sys##name(const struct pt_regs *regs)=
; \
>> + ALLOW_ERROR_INJECTION(__powerpc_compat_sys##name, ERRNO); \
>> + static long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__)); \
>> + static inline long __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__=
)); \
>> + asmlinkage long __powerpc_compat_sys##name(const struct pt_regs *regs)=
 \
>> + { \
>> + return __se_compat_sys##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__)); \
>> + } \
>> + static long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__)) \
>> + { \
>> + return __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_ARGS__)); \
>> + } \
>> + static inline long __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__=
))
>> +
>> +#define COMPAT_SYSCALL_DEFINE0(sname) \
>> + asmlinkage long __powerpc_compat_sys_##sname(const struct pt_regs *__u=
nused); \
>> + ALLOW_ERROR_INJECTION(__powerpc_compat_sys_##sname, ERRNO); \
>> + asmlinkage long __powerpc_compat_sys_##sname(const struct pt_regs *__u=
nused)
>> +
>> +#define COND_SYSCALL_COMPAT(name) \
>> + asmlinkage long __weak __powerpc_compat_sys_##name(const struct pt_reg=
s *regs) \
>> + { \
>> + return sys_ni_syscall(); \
>> + }
>> +#define COMPAT_SYS_NI(name) \
>> + SYSCALL_ALIAS(__powerpc_compat_sys_##name, sys_ni_posix_timers);
>> +
>> +#endif /* CONFIG_COMPAT */
>> +
>> +#define __SYSCALL_DEFINEx(x, name, ...) \
>> + asmlinkage long __powerpc_sys##name(const struct pt_regs *regs); \
>> + ALLOW_ERROR_INJECTION(__powerpc_sys##name, ERRNO); \
>> + long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)); \
>> + static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__)); \
>> + static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)); \
>> + asmlinkage long __powerpc_sys##name(const struct pt_regs *regs) \
>> + { \
>> + return __se_sys##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__)); \
>> + } \
>> + long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)) \
>> + { \
>> + return __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__)); \
>> + } \
>> + static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__)) \
>> + { \
>> + long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__)); \
>> + __MAP(x,__SC_TEST,__VA_ARGS__); \
>> + __PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__)); \
>> + return ret; \
>> + } \
>> + static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
>> +
>> +#define SYSCALL_DEFINE0(sname) \
>> + SYSCALL_METADATA(_##sname, 0); \
>> + long sys_##name(void); \
>> + asmlinkage long __powerpc_sys_##sname(const struct pt_regs *__unused);=
 \
>> + ALLOW_ERROR_INJECTION(__powerpc_sys_##sname, ERRNO); \
>> + long sys_##sname(void) \
>> + { \
>> + return __powerpc_sys_##sname(NULL); \
>> + } \
>> + asmlinkage long __powerpc_sys_##sname(const struct pt_regs *__unused)
>> +
>> +#define COND_SYSCALL(name) \
>> + asmlinkage long __weak __powerpc_sys_##name(const struct pt_regs *regs=
) \
>> + { \
>> + return sys_ni_syscall(); \
>> + }
>> +
>> +#define SYS_NI(name) SYSCALL_ALIAS(__powerpc_sys_##name, sys_ni_posix_t=
imers);
>> +
>> +#endif /* __ASM_SYSCALL_WRAPPER_H */
>> diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/=
asm/syscalls.h
>> index a2b13e55254f..75d8e1822caf 100644
>> --- a/arch/powerpc/include/asm/syscalls.h
>> +++ b/arch/powerpc/include/asm/syscalls.h
>> @@ -8,14 +8,47 @@
>> #include <linux/types.h>
>> #include <linux/compat.h>
>>=20
>> +/*
>> + * For PowerPC specific syscall implementations, wrapper takes exact na=
me and
>> + * return type for a given function.
>> + */
>> +
>> +#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
>> +#define PPC_SYSCALL_DEFINE(x, type, name, ...) \
>> + asmlinkage type __powerpc_##name(const struct pt_regs *regs); \
>> + ALLOW_ERROR_INJECTION(__powerpc_##name, ERRNO); \
>> + type sys_##name(__MAP(x,__SC_DECL,__VA_ARGS__)); \
>> + static type __se_##name(__MAP(x,__SC_LONG,__VA_ARGS__)); \
>> + static inline type __do_##name(__MAP(x,__SC_DECL,__VA_ARGS__)); \
>> + asmlinkage type __powerpc_##name(const struct pt_regs *regs) \
>> + { \
>> + return __se_##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__)); \
>> + } \
>> + type sys_##name(__MAP(x,__SC_DECL,__VA_ARGS__)) \
>> + { \
>> + return __do_##name(__MAP(x,__SC_CAST,__VA_ARGS__)); \
>> + } \
>> + static type __se_##name(__MAP(x,__SC_LONG,__VA_ARGS__)) \
>> + { \
>> + type ret =3D __do_##name(__MAP(x,__SC_CAST,__VA_ARGS__)); \
>> + __MAP(x,__SC_TEST,__VA_ARGS__); \
>> + __PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__)); \
>> + return ret; \
>> + } \
>> + static inline type __do_##name(__MAP(x,__SC_DECL,__VA_ARGS__))
>> +#else
>> +#define PPC_SYSCALL_DEFINE(x, type, name, ...) \
>> + type name(__MAP(x,__SC_DECL,__VA_ARGS__))
>> +#endif
>> +
>> struct rtas_args;
>>=20
>> asmlinkage long sys_mmap(unsigned long addr, size_t len,
>> - unsigned long prot, unsigned long flags,
>> - unsigned long fd, off_t offset);
>> + unsigned long prot, unsigned long flags,
>> + unsigned long fd, off_t offset);
>> asmlinkage long sys_mmap2(unsigned long addr, size_t len,
>> - unsigned long prot, unsigned long flags,
>> - unsigned long fd, unsigned long pgoff);
>> + unsigned long prot, unsigned long flags,
>> + unsigned long fd, unsigned long pgoff);
>> asmlinkage long ppc64_personality(unsigned long personality);
>> asmlinkage long sys_rtas(struct rtas_args __user *uargs);
>> int ppc_select(int n, fd_set __user *inp, fd_set __user *outp,
>> @@ -24,32 +57,38 @@ long ppc_fadvise64_64(int fd, int advice, u32 offset=
_high, u32 offset_low,
>> u32 len_high, u32 len_low);
>>=20
>> #ifdef CONFIG_COMPAT
>> -unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
>> - unsigned long prot, unsigned long flags,
>> - unsigned long fd, unsigned long pgoff);
>> +asmlinkage unsigned long compat_sys_mmap2(unsigned long addr, size_t le=
n,
>> + unsigned long prot, unsigned long flags,
>> + unsigned long fd, unsigned long pgoff);
>>=20
>> -compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, c=
ompat_size_t count,
>> - u32 reg6, u32 pos1, u32 pos2);
>> +asmlinkage compat_ssize_t compat_sys_pread64(unsigned int fd, char __us=
er *ubuf,
>> + compat_size_t count,
>> + u32 reg6, u32 pos1, u32 pos2);
>>=20
>> -compat_ssize_t compat_sys_pwrite64(unsigned int fd, const char __user *=
ubuf, compat_size_t count,
>> - u32 reg6, u32 pos1, u32 pos2);
>> +asmlinkage compat_ssize_t compat_sys_pwrite64(unsigned int fd, const ch=
ar __user *ubuf,
>> + compat_size_t count,
>> + u32 reg6, u32 pos1, u32 pos2);
>>=20
>> -compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1, u32 of=
fset2, u32 count);
>> +asmlinkage compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offs=
et1,
>> + u32 offset2, u32 count);
>>=20
>> -int compat_sys_truncate64(const char __user *path, u32 reg4,
>> - unsigned long len1, unsigned long len2);
>> +asmlinkage int compat_sys_truncate64(const char __user *path, u32 reg4,
>> + unsigned long len1, unsigned long len2);
>>=20
>> -long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2, u=
32 len1, u32 len2);
>> +asmlinkage long compat_sys_fallocate(int fd, int mode, u32 offset1,
>> + u32 offset2, u32 len1, u32 len2);
>>=20
>> -int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len=
1,
>> - unsigned long len2);
>> +asmlinkage int compat_sys_ftruncate64(unsigned int fd, u32 reg4,
>> + unsigned long len1, unsigned long len2);
>>=20
>> -long ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
>> - size_t len, int advice);
>> +asmlinkage long ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 of=
fset2,
>> + size_t len, int advice);
>>=20
>> -long compat_sys_sync_file_range2(int fd, unsigned int flags,
>> - unsigned int offset1, unsigned int offset2,
>> - unsigned int nbytes1, unsigned int nbytes2);
>> +asmlinkage long compat_sys_sync_file_range2(int fd, unsigned int flags,
>> + unsigned int offset1,
>> + unsigned int offset2,
>> + unsigned int nbytes1,
>> + unsigned int nbytes2);
>> #endif
>>=20
>> #endif /* __KERNEL__ */
>> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_=
32.S
>> index 7748c278d13c..2343c577b971 100644
>> --- a/arch/powerpc/kernel/entry_32.S
>> +++ b/arch/powerpc/kernel/entry_32.S
>> @@ -121,9 +121,9 @@ transfer_to_syscall:
>> SAVE_NVGPRS(r1)
>> kuep_lock
>>=20
>> - /* Calling convention has r9 =3D orig r0, r10 =3D regs */
>> - addi r10,r1,STACK_FRAME_OVERHEAD
>> - mr r9,r0
>> + /* Calling convention has r3 =3D orig r0, r4 =3D regs */
>> + addi r4,r1,STACK_FRAME_OVERHEAD
>> + mr r3,r0
>> bl system_call_exception
>>=20
>> ret_from_syscall:
>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/inter=
rupt.c
>> index 784ea3289c84..a38329ede1a1 100644
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -24,7 +24,11 @@
>> unsigned long global_dbcr0[NR_CPUS];
>> #endif
>>=20
>> +#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
>> +typedef long (*syscall_fn)(struct pt_regs *);
>> +#else
>> typedef long (*syscall_fn)(long, long, long, long, long, long);
>> +#endif
>>=20
>> #ifdef CONFIG_PPC_BOOK3S_64
>> DEFINE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
>> @@ -74,15 +78,13 @@ static notrace __always_inline bool prep_irq_for_ena=
bled_exit(bool restartable)
>> }
>>=20
>> /* Has to run notrace because it is entered not completely "reconciled" =
*/
>> -notrace long system_call_exception(long r3, long r4, long r5,
>> - long r6, long r7, long r8,
>> - unsigned long r0, struct pt_regs *regs)
>> +notrace long system_call_exception(unsigned long r0, struct pt_regs *re=
gs)
>> {
>> syscall_fn f;
>>=20
>> kuap_lock();
>>=20
>> - regs->orig_gpr3 =3D r3;
>> + regs->orig_gpr3 =3D regs->gpr[3];
>>=20
>> if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>> BUG_ON(irq_soft_mask_return() !=3D IRQS_ALL_DISABLED);
>> @@ -196,12 +198,6 @@ notrace long system_call_exception(long r3, long r4=
, long r5,
>> r0 =3D do_syscall_trace_enter(regs);
>> if (unlikely(r0 >=3D NR_syscalls))
>> return regs->gpr[3];
>> - r3 =3D regs->gpr[3];
>> - r4 =3D regs->gpr[4];
>> - r5 =3D regs->gpr[5];
>> - r6 =3D regs->gpr[6];
>> - r7 =3D regs->gpr[7];
>> - r8 =3D regs->gpr[8];
>>=20
>> } else if (unlikely(r0 >=3D NR_syscalls)) {
>> if (unlikely(trap_is_unsupported_scv(regs))) {
>> @@ -218,18 +214,23 @@ notrace long system_call_exception(long r3, long r=
4, long r5,
>> if (unlikely(is_compat_task())) {
>> f =3D (void *)compat_sys_call_table[r0];
>>=20
>> - r3 &=3D 0x00000000ffffffffULL;
>> - r4 &=3D 0x00000000ffffffffULL;
>> - r5 &=3D 0x00000000ffffffffULL;
>> - r6 &=3D 0x00000000ffffffffULL;
>> - r7 &=3D 0x00000000ffffffffULL;
>> - r8 &=3D 0x00000000ffffffffULL;
>> + regs->gpr[3] &=3D 0x00000000ffffffffULL;
>> + regs->gpr[4] &=3D 0x00000000ffffffffULL;
>> + regs->gpr[5] &=3D 0x00000000ffffffffULL;
>> + regs->gpr[6] &=3D 0x00000000ffffffffULL;
>> + regs->gpr[7] &=3D 0x00000000ffffffffULL;
>> + regs->gpr[8] &=3D 0x00000000ffffffffULL;
>>=20
>> } else {
>> f =3D (void *)sys_call_table[r0];
>> }
>>=20
>> - return f(r3, r4, r5, r6, r7, r8);
>> + #ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
>> + return f(regs);
>> + #else
>> + return f(regs->gpr[3], regs->gpr[4], regs->gpr[5],
>> + regs->gpr[6], regs->gpr[7], regs->gpr[8]);
>> + #endif
>> }
>>=20
>> static notrace void booke_load_dbcr0(void)
>> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/in=
terrupt_64.S
>> index 7bab2d7de372..b11c2bd84827 100644
>> --- a/arch/powerpc/kernel/interrupt_64.S
>> +++ b/arch/powerpc/kernel/interrupt_64.S
>> @@ -91,9 +91,9 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
>> li r11,\trapnr
>> std r11,_TRAP(r1)
>> std r12,_CCR(r1)
>> - addi r10,r1,STACK_FRAME_OVERHEAD
>> + addi r4,r1,STACK_FRAME_OVERHEAD
>> ld r11,exception_marker@toc(r2)
>> - std r11,-16(r10) /* "regshere" marker */
>> + std r11,-16(r4) /* "regshere" marker */
>>=20
>> BEGIN_FTR_SECTION
>> HMT_MEDIUM
>> @@ -108,8 +108,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>> * but this is the best we can do.
>> */
>>=20
>> - /* Calling convention has r9 =3D orig r0, r10 =3D regs */
>> - mr r9,r0
>> + /* Calling convention has r3 =3D orig r0, r4 =3D regs */
>> + mr r3,r0
>> bl system_call_exception
>>=20
>> .Lsyscall_vectored_\name\()_exit:
>> @@ -285,9 +285,9 @@ END_BTB_FLUSH_SECTION
>> std r10,_LINK(r1)
>> std r11,_TRAP(r1)
>> std r12,_CCR(r1)
>> - addi r10,r1,STACK_FRAME_OVERHEAD
>> + addi r4,r1,STACK_FRAME_OVERHEAD
>> ld r11,exception_marker@toc(r2)
>> - std r11,-16(r10) /* "regshere" marker */
>> + std r11,-16(r4) /* "regshere" marker */
>>=20
>> #ifdef CONFIG_PPC_BOOK3S
>> li r11,1
>> @@ -308,8 +308,8 @@ END_BTB_FLUSH_SECTION
>> wrteei 1
>> #endif
>>=20
>> - /* Calling convention has r9 =3D orig r0, r10 =3D regs */
>> - mr r9,r0
>> + /* Calling convention has r3 =3D orig r0, r4 =3D regs */
>> + mr r3,r0
>> bl system_call_exception
>>=20
>> .Lsyscall_exit:
>> @@ -353,16 +353,8 @@ END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
>> cmpdi r3,0
>> bne .Lsyscall_restore_regs
>> /* Zero volatile regs that may contain sensitive kernel data */
>> - li r0,0
>> - li r4,0
>> - li r5,0
>> - li r6,0
>> - li r7,0
>> - li r8,0
>> - li r9,0
>> - li r10,0
>> - li r11,0
>> - li r12,0
>> + ZERO_GPR(0)
>> + ZERO_GPRS(4, 12)
>> mtctr r0
>> mtspr SPRN_XER,r0
>> .Lsyscall_restore_regs_cont:
>> @@ -388,7 +380,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>> REST_NVGPRS(r1)
>> mtctr r3
>> mtspr SPRN_XER,r4
>> - ld r0,GPR0(r1)
>> + REST_GPR(0, r1)
>> REST_GPRS(4, 12, r1)
>> b .Lsyscall_restore_regs_cont
>> .Lsyscall_rst_end:
>> diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_p=
pc32.c
>> index 16ff0399a257..aa7869dbef36 100644
>> --- a/arch/powerpc/kernel/sys_ppc32.c
>> +++ b/arch/powerpc/kernel/sys_ppc32.c
>> @@ -48,9 +48,10 @@
>> #include <asm/syscalls.h>
>> #include <asm/switch_to.h>
>>=20
>> -unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
>> - unsigned long prot, unsigned long flags,
>> - unsigned long fd, unsigned long pgoff)
>> +PPC_SYSCALL_DEFINE(6, unsigned long, compat_sys_mmap2,
>> + unsigned long, addr, size_t, len,
>> + unsigned long, prot, unsigned long, flags,
>> + unsigned long, fd, unsigned long, pgoff)
>> {
>> /* This should remain 12 even if PAGE_SIZE changes */
>> return sys_mmap(addr, len, prot, flags, fd, pgoff << 12);
>> @@ -68,52 +69,63 @@ unsigned long compat_sys_mmap2(unsigned long addr, s=
ize_t len,
>> #define merge_64(high, low) ((u64)high << 32) | low
>> #endif
>>=20
>> -compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, c=
ompat_size_t count,
>> - u32 reg6, u32 pos1, u32 pos2)
>> +PPC_SYSCALL_DEFINE(6, compat_ssize_t, compat_sys_pread64,
>> + unsigned int, fd,
>> + char __user *, ubuf, compat_size_t, count,
>> + u32, reg6, u32, pos1, u32, pos2)
>> {
>> return ksys_pread64(fd, ubuf, count, merge_64(pos1, pos2));
>> }
>>=20
>> -compat_ssize_t compat_sys_pwrite64(unsigned int fd, const char __user *=
ubuf, compat_size_t count,
>> - u32 reg6, u32 pos1, u32 pos2)
>> +PPC_SYSCALL_DEFINE(6, compat_ssize_t, compat_sys_pwrite64,
>> + unsigned int, fd,
>> + const char __user *, ubuf, compat_size_t, count,
>> + u32, reg6, u32, pos1, u32, pos2)
>> {
>> return ksys_pwrite64(fd, ubuf, count, merge_64(pos1, pos2));
>> }
>>=20
>> -compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1, u32 of=
fset2, u32 count)
>> +PPC_SYSCALL_DEFINE(5, compat_ssize_t, compat_sys_readahead,
>> + int, fd, u32, r4,
>> + u32, offset1, u32, offset2, u32, count)
>> {
>> return ksys_readahead(fd, merge_64(offset1, offset2), count);
>> }
>>=20
>> -asmlinkage int compat_sys_truncate64(const char __user * path, u32 reg4,
>> - unsigned long len1, unsigned long len2)
>> +PPC_SYSCALL_DEFINE(4, int, compat_sys_truncate64,
>> + const char __user *, path, u32, reg4,
>> + unsigned long, len1, unsigned long, len2)
>> {
>> return ksys_truncate(path, merge_64(len1, len2));
>> }
>>=20
>> -asmlinkage long compat_sys_fallocate(int fd, int mode, u32 offset1, u32=
 offset2,
>> - u32 len1, u32 len2)
>> +PPC_SYSCALL_DEFINE(6, long, compat_sys_fallocate,
>> + int, fd, int, mode, u32, offset1, u32, offset2,
>> + u32, len1, u32, len2)
>> {
>> return ksys_fallocate(fd, mode, ((loff_t)offset1 << 32) | offset2,
>> merge_64(len1, len2));
>> }
>>=20
>> -asmlinkage int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsign=
ed long len1,
>> - unsigned long len2)
>> +PPC_SYSCALL_DEFINE(4, int, compat_sys_ftruncate64,
>> + unsigned int, fd, u32, reg4, unsigned long, len1,
>> + unsigned long, len2)
>> {
>> return ksys_ftruncate(fd, merge_64(len1, len2));
>> }
>>=20
>> -long ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
>> - size_t len, int advice)
>> +PPC_SYSCALL_DEFINE(6, long, ppc32_fadvise64,
>> + int, fd, u32, unused, u32, offset1, u32, offset2,
>> + size_t, len, int, advice)
>> {
>> return ksys_fadvise64_64(fd, merge_64(offset1, offset2), len,
>> advice);
>> }
>>=20
>> -asmlinkage long compat_sys_sync_file_range2(int fd, unsigned int flags,
>> - unsigned offset1, unsigned offset2,
>> - unsigned nbytes1, unsigned nbytes2)
>> +PPC_SYSCALL_DEFINE(6, long, compat_sys_sync_file_range2, int, fd,
>> + unsigned int, flags,
>> + unsigned int, offset1, unsigned int, offset2,
>> + unsigned int, nbytes1, unsigned int, nbytes2)
>> {
>> loff_t offset =3D merge_64(offset1, offset2);
>> loff_t nbytes =3D merge_64(nbytes1, nbytes2);
>> diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscal=
ls.c
>> index c4f5b4ce926f..c64cdb5c4435 100644
>> --- a/arch/powerpc/kernel/syscalls.c
>> +++ b/arch/powerpc/kernel/syscalls.c
>> @@ -64,14 +64,20 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, l=
en,
>> }
>>=20
>> #ifdef CONFIG_PPC32
>> +asmlinkage long sys_old_select(struct sel_arg_struct __user *arg);
>> +asmlinkage long sys_select(int n, fd_set __user *inp, fd_set __user *ou=
tp,
>> + fd_set __user *exp,
>> + struct __kernel_old_timeval __user *tvp);
>> +
>> /*
>> * Due to some executables calling the wrong select we sometimes
>> * get wrong args. This determines how the args are being passed
>> * (a single ptr to them all args passed) then calls
>> * sys_select() with the appropriate args. -- Cort
>> */
>> -int
>> -ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __use=
r *exp, struct __kernel_old_timeval __user *tvp)
>> +PPC_SYSCALL_DEFINE(5, long, ppc_select,
>> + int, n, fd_set __user *, inp, fd_set __user *, outp,
>> + fd_set __user *, exp, struct __kernel_old_timeval __user *, tvp)
>> {
>> if ( (unsigned long)n >=3D 4096 )
>> return sys_old_select((void __user *)n);
>> @@ -81,7 +87,9 @@ ppc_select(int n, fd_set __user *inp, fd_set __user *o=
utp, fd_set __user *exp, s
>> #endif
>>=20
>> #ifdef CONFIG_PPC64
>> -long ppc64_personality(unsigned long personality)
>> +asmlinkage long sys_personality(unsigned int personality);
>> +
>> +PPC_SYSCALL_DEFINE(1, long, ppc64_personality, unsigned long, personali=
ty)
>> {
>> long ret;
>>=20
>> @@ -95,8 +103,9 @@ long ppc64_personality(unsigned long personality)
>> }
>> #endif
>>=20
>> -long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_l=
ow,
>> - u32 len_high, u32 len_low)
>> +PPC_SYSCALL_DEFINE(6, long, ppc_fadvise64_64,
>> + int, fd, int, advice, u32, offset_high, u32, offset_low,
>> + u32, len_high, u32, len_low)
>> {
>> return ksys_fadvise64_64(fd, (u64)offset_high << 32 | offset_low,
>> (u64)len_high << 32 | len_low, advice);
>> diff --git a/arch/powerpc/kernel/systbl.S b/arch/powerpc/kernel/systbl.S
>> index cb3358886203..70cc7120fce2 100644
>> --- a/arch/powerpc/kernel/systbl.S
>> +++ b/arch/powerpc/kernel/systbl.S
>> @@ -16,11 +16,32 @@
>>=20
>> #ifdef CONFIG_PPC64
>> .p2align 3
>> +#endif
>> +
>> +/* Where the syscall wrapper macro is used, handler functions expect pa=
rameters
>> + to reside on the stack. We still emit symbols with register-mapped
>> + parameters, which are distinguished by a prefix. */
>> +
>> +#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
>> +
>> +#define __powerpc_sys_ni_syscall sys_ni_syscall
>> +
>> +#ifdef CONFIG_PPC64
>> +#define __SYSCALL(nr, entry) .8byte __powerpc_##entry
>> +#else
>> +#define __SYSCALL(nr, entry) .long __powerpc_##entry
>> +#endif
>> +
>> +#else
>> +
>> +#ifdef CONFIG_PPC64
>> #define __SYSCALL(nr, entry) .8byte entry
>> #else
>> #define __SYSCALL(nr, entry) .long entry
>> #endif
>>=20
>> +#endif /* CONFIG_ARCH_HAS_SYSCALL_WRAPPER */
>> +
>> #define __SYSCALL_WITH_COMPAT(nr, native, compat) __SYSCALL(nr, native)
>> .globl sys_call_table
>> sys_call_table:
>> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
>> index 717f2c9a7573..dcf57c07dbad 100644
>> --- a/arch/powerpc/kernel/vdso.c
>> +++ b/arch/powerpc/kernel/vdso.c
>> @@ -40,6 +40,8 @@
>> extern char vdso32_start, vdso32_end;
>> extern char vdso64_start, vdso64_end;
>>=20
>> +asmlinkage long sys_ni_syscall(void);
>> +
>> /*
>> * The vdso data page (aka. systemcfg for old ppc64 fans) is here.
>> * Once the early boot kernel code no longer needs to muck around
>> --
>> 2.34.1

