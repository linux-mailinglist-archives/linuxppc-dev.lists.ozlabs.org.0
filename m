Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE215BF4EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 05:45:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXPSz1w0Kz3c7D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 13:45:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OSUL0U5i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OSUL0U5i;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXPSC2ddLz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 13:44:59 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L3fT1r004296
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 03:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=IgX71mgia3SWFzzuPB6cKTV9AKAx4wwmzq7Q4ccJ7zc=;
 b=OSUL0U5iExvA+BMmh7W5lne1XJ7PlJpmTanfuiq5M/kYvdNqkPqq0vCAAyyVp/YGom6o
 Nk36wl2IfzP+EvLLj8X+0xHVnRbYUf9dhFK0SYRowaHY/lX/hS2WiiOM9S9aKlKXxyxR
 hxl1mR+dQYPlGbG2chA9EHbFqGU8Kwdn9irr2JWp0FyIYEt7IOer3flZ9KhMZnzWo+Gg
 Dnsgmk7Hlizc35MMqbVbOCkVKMnCJaT5jXsFj0waXdXl9AAHjF6+iVVlE2zjWSX0YLbH
 dVLT52MMTwZJyrbty/rm1do9ETHY0MdREXWkDLHgwIQDcn2Xov+WxDRWEGhYhVFPofCd aA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqtx7820c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 03:44:56 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28L3iJnc016207
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 03:44:55 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqtx781ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 03:44:55 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L3ZjLZ012122;
	Wed, 21 Sep 2022 03:44:53 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3jn5gj4n0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 03:44:53 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L3epKV48300498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 03:40:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D38911C04A;
	Wed, 21 Sep 2022 03:44:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A2CE11C04C;
	Wed, 21 Sep 2022 03:44:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 03:44:50 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C8E9060060;
	Wed, 21 Sep 2022 13:44:39 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 19/23] powerpc: Provide syscall wrapper
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <CN0UVJJI9V56.Z4K9YRD4OKEM@bobo>
Date: Wed, 21 Sep 2022 13:44:33 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <8E763FCB-0592-487A-9585-D5F65782DBBC@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-20-rmclure@linux.ibm.com>
 <CN0UVJJI9V56.Z4K9YRD4OKEM@bobo>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pLpwNGwDC9Gr6QZ-cnMgZR9X4Are8YcD
X-Proofpoint-GUID: q4-yLnv6mGEaXWzrrnH3njEZUoalPsx7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_02,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=809 mlxscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210021
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
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 20 Sep 2022, at 11:59 am, Nicholas Piggin <npiggin@gmail.com> =
wrote:
>=20
> On Fri Sep 16, 2022 at 3:32 PM AEST, Rohan McLure wrote:
>> Implement syscall wrapper as per s390, x86, arm64. When enabled
>> cause handlers to accept parameters from a stack frame rather than
>> from user scratch register state. This allows for user registers to =
be
>> safely cleared in order to reduce caller influence on speculation
>> within syscall routine. The wrapper is a macro that emits syscall
>> handler symbols that call into the target handler, obtaining its
>> parameters from a struct pt_regs on the stack.
>>=20
>> As registers are already saved to the stack prior to calling
>> system_call_exception, it appears that this function is executed more
>> efficiently with the new stack-pointer convention than with =
parameters
>> passed by registers, avoiding the allocation of a stack frame for =
this
>> method. On a 32-bit system, we see >20% performance increases on the
>> null_syscall microbenchmark, and on a Power 8 the performance gains
>> amortise the cost of clearing and restoring registers which is
>> implemented at the end of this series, seeing final result of ~5.6%
>> performance improvement on null_syscall.
>>=20
>> Syscalls are wrapped in this fashion on all platforms except for the
>> Cell processor as this commit does not provide SPU support. This can =
be
>> quickly fixed in a successive patch, but requires spu_sys_callback to
>> allocate a pt_regs structure to satisfy the wrapped calling =
convention.
>>=20
>> Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
>> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> V1 -> V2: Generate prototypes for symbols produced by the wrapper.
>> V2 -> V3: Rebased to remove conflict with 1547db7d1f44
>> ("powerpc: Move system_call_exception() to syscall.c"). Also remove =
copy
>> from gpr3 save slot on stackframe to orig_r3's slot. Fix whitespace =
with
>> preprocessor defines in system_call_exception.
>> V4 -> V5: Move systbl.c syscall wrapper support to this patch. Swap
>> calling convention for system_call_exception to be (&regs, r0)
>> ---
>> arch/powerpc/Kconfig                       |  1 +
>> arch/powerpc/include/asm/interrupt.h       |  3 +-
>> arch/powerpc/include/asm/syscall.h         |  4 +
>> arch/powerpc/include/asm/syscall_wrapper.h | 84 ++++++++++++++++++++
>> arch/powerpc/include/asm/syscalls.h        | 30 ++++++-
>> arch/powerpc/kernel/entry_32.S             |  6 +-
>> arch/powerpc/kernel/interrupt_64.S         | 28 +++++--
>> arch/powerpc/kernel/syscall.c              | 31 +++-----
>=20
> Ah, this is where it went :)
>=20
> I wouldn't normally mind except the previous patch might break the
> build because it uses the same name, will it?
>=20
> This *could* be two patches, one to change system_call_exception API,
> the next to add the wrapper.
>=20
>> arch/powerpc/kernel/systbl.c               |  8 ++
>> arch/powerpc/kernel/vdso.c                 |  2 +
>> 10 files changed, 164 insertions(+), 33 deletions(-)
>>=20
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 4c466acdc70d..ef6c83e79c9b 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -137,6 +137,7 @@ config PPC
>> 	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC_BOOK3S || =
PPC_8xx || 40x) && !HIBERNATION
>> 	select ARCH_HAS_STRICT_KERNEL_RWX	if FSL_BOOKE && =
!HIBERNATION && !RANDOMIZE_BASE
>> 	select ARCH_HAS_STRICT_MODULE_RWX	if =
ARCH_HAS_STRICT_KERNEL_RWX
>> +	select ARCH_HAS_SYSCALL_WRAPPER		if !SPU_BASE
>> 	select ARCH_HAS_TICK_BROADCAST		if =
GENERIC_CLOCKEVENTS_BROADCAST
>> 	select ARCH_HAS_UACCESS_FLUSHCACHE
>> 	select ARCH_HAS_UBSAN_SANITIZE_ALL
>> diff --git a/arch/powerpc/include/asm/interrupt.h =
b/arch/powerpc/include/asm/interrupt.h
>> index 8069dbc4b8d1..48eec9cd1429 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -665,8 +665,7 @@ static inline void =
interrupt_cond_local_irq_enable(struct pt_regs *regs)
>> 		local_irq_enable();
>> }
>>=20
>> -long system_call_exception(long r3, long r4, long r5, long r6, long =
r7, long r8,
>> -			   unsigned long r0, struct pt_regs *regs);
>> +long system_call_exception(struct pt_regs *regs, unsigned long r0);
>> notrace unsigned long syscall_exit_prepare(unsigned long r3, struct =
pt_regs *regs, long scv);
>> notrace unsigned long interrupt_exit_user_prepare(struct pt_regs =
*regs);
>> notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs =
*regs);
>> diff --git a/arch/powerpc/include/asm/syscall.h =
b/arch/powerpc/include/asm/syscall.h
>> index d2a8dfd5de33..3dd36c5e334a 100644
>> --- a/arch/powerpc/include/asm/syscall.h
>> +++ b/arch/powerpc/include/asm/syscall.h
>> @@ -14,8 +14,12 @@
>> #include <linux/sched.h>
>> #include <linux/thread_info.h>
>>=20
>> +#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
>> +typedef long (*syscall_fn)(const struct pt_regs *);
>> +#else
>> typedef long (*syscall_fn)(unsigned long, unsigned long, unsigned =
long,
>> 			   unsigned long, unsigned long, unsigned long);
>> +#endif
>>=20
>> /* ftrace syscalls requires exporting the sys_call_table */
>> extern const syscall_fn sys_call_table[];
>> diff --git a/arch/powerpc/include/asm/syscall_wrapper.h =
b/arch/powerpc/include/asm/syscall_wrapper.h
>> new file mode 100644
>> index 000000000000..91bcfa40f740
>> --- /dev/null
>> +++ b/arch/powerpc/include/asm/syscall_wrapper.h
>> @@ -0,0 +1,84 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * syscall_wrapper.h - powerpc specific wrappers to syscall =
definitions
>> + *
>> + * Based on arch/{x86,arm64}/include/asm/syscall_wrapper.h
>> + */
>> +
>> +#ifndef __ASM_SYSCALL_WRAPPER_H
>> +#define __ASM_SYSCALL_WRAPPER_H
>> +
>> +struct pt_regs;
>> +
>> +#define SC_POWERPC_REGS_TO_ARGS(x, ...)				=
\
>> +	__MAP(x,__SC_ARGS					\
>> +	      ,,regs->gpr[3],,regs->gpr[4],,regs->gpr[5]	\
>> +	      ,,regs->gpr[6],,regs->gpr[7],,regs->gpr[8])
>> +
>> +#ifdef CONFIG_COMPAT
>> +
>> +#define COMPAT_SYSCALL_DEFINEx(x, name, ...)				=
		\
>> +	long __powerpc_compat_sys##name(const struct pt_regs *regs);		=
	\
>> +	ALLOW_ERROR_INJECTION(__powerpc_compat_sys##name, ERRNO);		=
	\
>> +	static long =
__se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
>> +	static inline long =
__do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
>> +	long __powerpc_compat_sys##name(const struct pt_regs *regs)		=
	\
>> +	{									=
	\
>> +		return =
__se_compat_sys##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__));	\
>> +	}									=
	\
>> +	static long =
__se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		\
>> +	{									=
	\
>> +		return =
__do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_ARGS__));	\
>> +	}									=
	\
>> +	static inline long =
__do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
>> +
>> +#define COMPAT_SYSCALL_DEFINE0(sname)					=
	\
>> +	long __powerpc_compat_sys_##sname(const struct pt_regs =
*__unused);	\
>> +	ALLOW_ERROR_INJECTION(__powerpc_compat_sys_##sname, ERRNO);		=
\
>> +	long __powerpc_compat_sys_##sname(const struct pt_regs =
*__unused)
>> +
>> +#define COND_SYSCALL_COMPAT(name)						=
\
>> +	long __powerpc_compat_sys_##name(const struct pt_regs *regs);		=
\
>> +	long __weak __powerpc_compat_sys_##name(const struct pt_regs =
*regs)	\
>> +	{									=
\
>> +		return sys_ni_syscall();					=
\
>> +	}
>> +#define COMPAT_SYS_NI(name) \
>> +	SYSCALL_ALIAS(__powerpc_compat_sys_##name, sys_ni_posix_timers);
>> +
>> +#endif /* CONFIG_COMPAT */
>> +
>> +#define __SYSCALL_DEFINEx(x, name, ...)					=
	\
>> +	long __powerpc_sys##name(const struct pt_regs *regs);			=
\
>> +	ALLOW_ERROR_INJECTION(__powerpc_sys##name, ERRNO);			=
\
>> +	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		=
\
>> +	static inline long =
__do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
>> +	long __powerpc_sys##name(const struct pt_regs *regs)			=
\
>> +	{									=
\
>> +		return =
__se_sys##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__));	\
>> +	}									=
\
>> +	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		=
\
>> +	{									=
\
>> +		long ret =3D =
__do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));	\
>> +		__MAP(x,__SC_TEST,__VA_ARGS__);					=
\
>> +		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));		=
\
>> +		return ret;							=
\
>> +	}									=
\
>> +	static inline long =
__do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
>> +
>> +#define SYSCALL_DEFINE0(sname)						=
	\
>> +	SYSCALL_METADATA(_##sname, 0);						=
\
>> +	long __powerpc_sys_##sname(const struct pt_regs *__unused);		=
\
>> +	ALLOW_ERROR_INJECTION(__powerpc_sys_##sname, ERRNO);			=
\
>> +	long __powerpc_sys_##sname(const struct pt_regs *__unused)
>> +
>> +#define COND_SYSCALL(name)							=
\
>> +	long __powerpc_sys_##name(const struct pt_regs *regs);			=
\
>> +	long __weak __powerpc_sys_##name(const struct pt_regs *regs)		=
\
>> +	{									=
\
>> +		return sys_ni_syscall();					=
\
>> +	}
>> +
>> +#define SYS_NI(name) SYSCALL_ALIAS(__powerpc_sys_##name, =
sys_ni_posix_timers);
>> +
>> +#endif /* __ASM_SYSCALL_WRAPPER_H */
>> diff --git a/arch/powerpc/include/asm/syscalls.h =
b/arch/powerpc/include/asm/syscalls.h
>> index cc87168d6ecb..1ecdf6c071f6 100644
>> --- a/arch/powerpc/include/asm/syscalls.h
>> +++ b/arch/powerpc/include/asm/syscalls.h
>> @@ -15,6 +15,12 @@
>> #include <asm/unistd.h>
>> #include <asm/ucontext.h>
>>=20
>> +#ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
>> +long sys_ni_syscall(void);
>> +#else
>> +long sys_ni_syscall(const struct pt_regs *regs);
>> +#endif
>> +
>> struct rtas_args;
>>=20
>> /*
>> @@ -29,12 +35,12 @@ struct rtas_args;
>> #define merge_64(high, low) ((u64)high << 32) | low
>> #endif
>>=20
>> -long sys_ni_syscall(void);
>> -
>> /*
>>  * PowerPC architecture-specific syscalls
>>  */
>>=20
>> +#ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
>> +
>> long sys_rtas(struct rtas_args __user *uargs);
>>=20
>> #ifdef CONFIG_PPC64
>> @@ -114,5 +120,25 @@ long sys_ppc_fadvise64_64(int fd, int advice,
>> 			  u32 len_high, u32 len_low);
>> #endif
>>=20
>> +#else
>> +
>> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, =
native)
>> +#define __SYSCALL(nr, entry) \
>> +	long __powerpc_##entry(const struct pt_regs *regs);
>> +
>> +#ifdef CONFIG_PPC64
>> +#include <asm/syscall_table_64.h>
>> +#else
>> +#include <asm/syscall_table_32.h>
>> +#endif /* CONFIG_PPC64 */
>> +
>> +#ifdef CONFIG_COMPAT
>> +#undef __SYSCALL_WITH_COMPAT
>> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, =
compat)
>> +#include <asm/syscall_table_32.h>
>> +#endif /* CONFIG_COMPAT */
>> +
>> +#endif /* CONFIG_ARCH_HAS_SYSCALL_WRAPPER */
>> +
>> #endif /* __KERNEL__ */
>> #endif /* __ASM_POWERPC_SYSCALLS_H */
>> diff --git a/arch/powerpc/kernel/entry_32.S =
b/arch/powerpc/kernel/entry_32.S
>> index e4b694cebc44..96782aa72083 100644
>> --- a/arch/powerpc/kernel/entry_32.S
>> +++ b/arch/powerpc/kernel/entry_32.S
>> @@ -122,9 +122,9 @@ transfer_to_syscall:
>> 	SAVE_NVGPRS(r1)
>> 	kuep_lock
>>=20
>> -	/* Calling convention has r9 =3D orig r0, r10 =3D regs */
>> -	addi	r10,r1,STACK_FRAME_OVERHEAD
>> -	mr	r9,r0
>> +	/* Calling convention has r3 =3D regs, r4 =3D orig r0 */
>> +	addi	r3,r1,STACK_FRAME_OVERHEAD
>> +	mr	r4,r0
>> 	bl	system_call_exception
>>=20
>> ret_from_syscall:
>> diff --git a/arch/powerpc/kernel/interrupt_64.S =
b/arch/powerpc/kernel/interrupt_64.S
>> index 7d92a7a54727..16a1b44088e7 100644
>> --- a/arch/powerpc/kernel/interrupt_64.S
>> +++ b/arch/powerpc/kernel/interrupt_64.S
>> @@ -87,9 +87,11 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
>> 	std	r11,_TRAP(r1)
>> 	std	r12,_CCR(r1)
>> 	std	r3,ORIG_GPR3(r1)
>> -	addi	r10,r1,STACK_FRAME_OVERHEAD
>> +	/* Calling convention has r3 =3D regs, r4 =3D orig r0 */
>> +	addi	r3,r1,STACK_FRAME_OVERHEAD
>> +	mr	r4,r0
>> 	ld	r11,exception_marker@toc(r2)
>> -	std	r11,-16(r10)		/* "regshere" marker */
>> +	std	r11,-16(r3)		/* "regshere" marker */
>>=20
>> BEGIN_FTR_SECTION
>> 	HMT_MEDIUM
>=20
> I think the asm adjustments look okay. Should get a Christophe ack for
> the 32-bit at least though :)
>=20
>> @@ -104,8 +106,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>> 	 * but this is the best we can do.
>> 	 */
>>=20
>> -	/* Calling convention has r9 =3D orig r0, r10 =3D regs */
>> -	mr	r9,r0
>> +	/*
>> +	 * Zero user registers to prevent influencing speculative =
execution
>> +	 * state of kernel code.
>> +	 */
>> +	ZEROIZE_GPRS(5, 12)
>> +	ZEROIZE_NVGPRS()
>> 	bl	system_call_exception
>>=20
>> .Lsyscall_vectored_\name\()_exit:
>=20
> Did this and the below hunk belong in a later patch?
>=20
>> @@ -260,9 +266,11 @@ END_BTB_FLUSH_SECTION
>> 	std	r11,_TRAP(r1)
>> 	std	r12,_CCR(r1)
>> 	std	r3,ORIG_GPR3(r1)
>> -	addi	r10,r1,STACK_FRAME_OVERHEAD
>> +	/* Calling convention has r3 =3D regs, r4 =3D orig r0 */
>> +	addi	r3,r1,STACK_FRAME_OVERHEAD
>> +	mr	r4,r0
>> 	ld	r11,exception_marker@toc(r2)
>> -	std	r11,-16(r10)		/* "regshere" marker */
>> +	std	r11,-16(r3)		/* "regshere" marker */
>>=20
>> #ifdef CONFIG_PPC_BOOK3S
>> 	li	r11,1
>> @@ -283,8 +291,12 @@ END_BTB_FLUSH_SECTION
>> 	wrteei	1
>> #endif
>>=20
>> -	/* Calling convention has r9 =3D orig r0, r10 =3D regs */
>> -	mr	r9,r0
>> +	/*
>> +	 * Zero user registers to prevent influencing speculative =
execution
>> +	 * state of kernel code.
>> +	 */
>> +	ZEROIZE_GPRS(5, 12)
>> +	ZEROIZE_NVGPRS()
>> 	bl	system_call_exception
>>=20
>> .Lsyscall_exit:
>> diff --git a/arch/powerpc/kernel/syscall.c =
b/arch/powerpc/kernel/syscall.c
>> index 64102a64fd84..2f4dd7f0d819 100644
>> --- a/arch/powerpc/kernel/syscall.c
>> +++ b/arch/powerpc/kernel/syscall.c
>> @@ -12,12 +12,8 @@
>> #include <asm/unistd.h>
>>=20
>>=20
>> -typedef long (*syscall_fn)(long, long, long, long, long, long);
>> -
>> /* Has to run notrace because it is entered not completely =
"reconciled" */
>> -notrace long system_call_exception(long r3, long r4, long r5,
>> -				   long r6, long r7, long r8,
>> -				   unsigned long r0, struct pt_regs =
*regs)
>> +notrace long system_call_exception(struct pt_regs *regs, unsigned =
long r0)
>> {
>> 	long ret;
>> 	syscall_fn f;
>> @@ -138,12 +134,6 @@ notrace long system_call_exception(long r3, long =
r4, long r5,
>> 		r0 =3D do_syscall_trace_enter(regs);
>> 		if (unlikely(r0 >=3D NR_syscalls))
>> 			return regs->gpr[3];
>> -		r3 =3D regs->gpr[3];
>> -		r4 =3D regs->gpr[4];
>> -		r5 =3D regs->gpr[5];
>> -		r6 =3D regs->gpr[6];
>> -		r7 =3D regs->gpr[7];
>> -		r8 =3D regs->gpr[8];
>>=20
>> 	} else if (unlikely(r0 >=3D NR_syscalls)) {
>> 		if (unlikely(trap_is_unsupported_scv(regs))) {
>> @@ -160,18 +150,23 @@ notrace long system_call_exception(long r3, =
long r4, long r5,
>> 	if (unlikely(is_compat_task())) {
>> 		f =3D (void *)compat_sys_call_table[r0];
>>=20
>> -		r3 &=3D 0x00000000ffffffffULL;
>> -		r4 &=3D 0x00000000ffffffffULL;
>> -		r5 &=3D 0x00000000ffffffffULL;
>> -		r6 &=3D 0x00000000ffffffffULL;
>> -		r7 &=3D 0x00000000ffffffffULL;
>> -		r8 &=3D 0x00000000ffffffffULL;
>> +		regs->gpr[3] &=3D 0x00000000ffffffffULL;
>> +		regs->gpr[4] &=3D 0x00000000ffffffffULL;
>> +		regs->gpr[5] &=3D 0x00000000ffffffffULL;
>> +		regs->gpr[6] &=3D 0x00000000ffffffffULL;
>> +		regs->gpr[7] &=3D 0x00000000ffffffffULL;
>> +		regs->gpr[8] &=3D 0x00000000ffffffffULL;
>=20
> This (possibly) changes regs->gpr values on the interrupt stack frame.
>=20
> I suppose that's going to be okay.  Aside from debugging and tracing
> stuff, could it cause slight differences to how signals are delivered?
>=20
> Why do we actually do this anyway? Could we get rid of it (or relegate
> it to !WRAPPER case)?

Seems from the dissassembly that COMPAT_SYSCALL_DEFINEx supplied from
either asm/syscall_wrapper.h or linux/compat.h issue casts to the
type specified in the signature of the compat handler. In which case,
after the patch which expresses all such handlers with =
COMPAT_SYSCALL_DEFINE,
we should be able to get rid of these high-order word clears.

The casting macro used in each case is as follows:
#define __SC_DELOUSE(t,v) ((__force t)(unsigned long)(v))

>=20
> Thanks,
> Nick
>=20
>>=20
>> 	} else {
>> 		f =3D (void *)sys_call_table[r0];
>> 	}
>>=20
>> -	ret =3D f(r3, r4, r5, r6, r7, r8);
>> +#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
>> +	ret =3D f(regs);
>> +#else
>> +	ret =3D f(regs->gpr[3], regs->gpr[4], regs->gpr[5],
>> +		regs->gpr[6], regs->gpr[7], regs->gpr[8]);
>> +#endif
>>=20
>> 	/*
>> 	 * Ultimately, this value will get limited by =
KSTACK_OFFSET_MAX(),
>> diff --git a/arch/powerpc/kernel/systbl.c =
b/arch/powerpc/kernel/systbl.c
>> index e5d419822b4e..cb05e302ea58 100644
>> --- a/arch/powerpc/kernel/systbl.c
>> +++ b/arch/powerpc/kernel/systbl.c
>> @@ -15,8 +15,16 @@
>> #include <asm/unistd.h>
>> #include <asm/syscalls.h>
>>=20
>> +#undef __SYSCALL_WITH_COMPAT
>> #define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr, entry)
>> +
>> +#undef __SYSCALL
>> +#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
>> +#define __SYSCALL(nr, entry) [nr] =3D __powerpc_##entry,
>> +#define __powerpc_sys_ni_syscall	sys_ni_syscall
>> +#else
>> #define __SYSCALL(nr, entry) [nr] =3D (void *) entry,
>> +#endif
>>=20
>> const syscall_fn sys_call_table[] =3D {
>> #ifdef CONFIG_PPC64
>> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
>> index fcca06d200d3..e1f36fd61db3 100644
>> --- a/arch/powerpc/kernel/vdso.c
>> +++ b/arch/powerpc/kernel/vdso.c
>> @@ -39,6 +39,8 @@
>> extern char vdso32_start, vdso32_end;
>> extern char vdso64_start, vdso64_end;
>>=20
>> +long sys_ni_syscall(void);
>> +
>> /*
>>  * The vdso data page (aka. systemcfg for old ppc64 fans) is here.
>>  * Once the early boot kernel code no longer needs to muck around
>> --=20
>> 2.34.1

