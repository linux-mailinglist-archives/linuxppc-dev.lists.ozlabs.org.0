Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B0735ABE7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 10:32:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHSsg3272z3c01
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 18:32:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256 header.s=1a1hai header.b=H6+xypT/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=me.com
 (client-ip=17.58.6.48; helo=pv50p00im-hyfv10021501.me.com;
 envelope-from=sxwjean@me.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256
 header.s=1a1hai header.b=H6+xypT/; dkim-atps=neutral
Received: from pv50p00im-hyfv10021501.me.com (pv50p00im-hyfv10021501.me.com
 [17.58.6.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHSs94rJyz30Dr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Apr 2021 18:31:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1618043495; bh=cfgftSXJmVCqAi+8gmCFQtOOnBSSZlx1p3Gs4EutkF4=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=H6+xypT/vssjznBIsxAJhFd79hOBP4rofUpIK6Ct4EDgq7r1/QiPZ1dzVzUKSCRwP
 OVNBsuBv35LoPBucJ5DDqwXCgza5WXGUY+bYvavJLGNGuZsG4ZKYatIugQjYT5Zw23
 QbKAIdCnSBYJhVK6tVpFOlQ4Dny4OmOvYeeHozds4ZZLlE+1FElgL1gl3m0CXwFU+M
 fifmvBn3AVssJYLEzNlIepQCMSbQ0K6CShCmgIiVLM3qDULhOMgN4gjrYBoECEBQQI
 6h8wwzIvMUmfQLlcXwHu7qT1uuEp//RA249P52WzRdpxzX/gzl33Jl4j/sKMhLOHWU
 QZa1ApJ7AOaxg==
Received: from 192.168.1.3 (unknown [120.245.2.39])
 by pv50p00im-hyfv10021501.me.com (Postfix) with ESMTPSA id C9B69B4026F;
 Sat, 10 Apr 2021 08:31:28 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v3] powerpc/traps: Enhance readability for trap types
From: Xiongwei Song <sxwjean@me.com>
In-Reply-To: <70ece993-12bd-335c-d246-914564eb51dd@csgroup.eu>
Date: Sat, 10 Apr 2021 16:31:25 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <D7E3FD58-D69B-484C-99E4-F3082890E485@me.com>
References: <20210408140750.26832-1-sxwjean@me.com>
 <70ece993-12bd-335c-d246-914564eb51dd@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-10_04:2021-04-09,
 2021-04-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=-2147483648 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2104100064
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
Cc: pmladek@suse.com, peterz@infradead.org, linux-kernel@vger.kernel.org,
 paulus@samba.org, kan.liang@linux.intel.com, mikey@neuling.org,
 maddy@linux.ibm.com, haren@linux.ibm.com, aik@ozlabs.ru, kjain@linux.ibm.com,
 ravi.bangoria@linux.ibm.com, john.ogness@linutronix.de, alistair@popple.id.au,
 npiggin@gmail.com, jniethe5@gmail.com, atrajeev@linux.vnet.ibm.com,
 Xiongwei Song <sxwjean@gmail.com>, oleg@redhat.com, aneesh.kumar@linux.ibm.com,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On Apr 10, 2021, at 12:14 AM, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>=20
>=20
>=20
> Le 08/04/2021 =C3=A0 16:07, Xiongwei Song a =C3=A9crit :
>> From: Xiongwei Song <sxwjean@gmail.com>
>> Create a new header named traps.h, define macros to list ppc =
interrupt
>> types in traps.h, replace the reference of the trap hex values with =
these
>> macros.
>> Referred the hex number in arch/powerpc/kernel/exceptions-64e.S,
>> arch/powerpc/kernel/exceptions-64s.S and
>> arch/powerpc/include/asm/kvm_asm.h.
>> v2-v3:
>> Correct the prefix of trap macros with INTERRUPT_, the previous =
prefix
>> is TRAP_, which is not precise. This is suggested by Segher =
Boessenkool
>> and Nicholas Piggin.
>> v1-v2:
>> Define more trap macros to replace more trap hexs in code, not just =
for
>> the __show_regs function. This is suggested by Christophe Leroy.
>> Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
>> ---
>>  arch/powerpc/include/asm/interrupt.h  |  9 +++++---
>>  arch/powerpc/include/asm/ptrace.h     |  3 ++-
>>  arch/powerpc/include/asm/traps.h      | 32 =
+++++++++++++++++++++++++++
>>  arch/powerpc/kernel/interrupt.c       |  3 ++-
>>  arch/powerpc/kernel/process.c         |  5 ++++-
>>  arch/powerpc/mm/book3s64/hash_utils.c |  5 +++--
>>  arch/powerpc/mm/fault.c               | 21 +++++++++++-------
>>  arch/powerpc/perf/core-book3s.c       |  5 +++--
>>  arch/powerpc/xmon/xmon.c              | 16 +++++++++++---
>>  9 files changed, 78 insertions(+), 21 deletions(-)
>>  create mode 100644 arch/powerpc/include/asm/traps.h
>> diff --git a/arch/powerpc/include/asm/interrupt.h =
b/arch/powerpc/include/asm/interrupt.h
>> index 7c633896d758..5ce9898bc9a6 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -8,6 +8,7 @@
>>  #include <asm/ftrace.h>
>>  #include <asm/kprobes.h>
>>  #include <asm/runlatch.h>
>> +#include <asm/traps.h>
>>    struct interrupt_state {
>>  #ifdef CONFIG_PPC_BOOK3E_64
>> @@ -59,7 +60,7 @@ static inline void interrupt_enter_prepare(struct =
pt_regs *regs, struct interrup
>>  		 * CT_WARN_ON comes here via program_check_exception,
>>  		 * so avoid recursion.
>>  		 */
>> -		if (TRAP(regs) !=3D 0x700)
>> +		if (TRAP(regs) !=3D INTERRUPT_PROGRAM)
>>  			CT_WARN_ON(ct_state() !=3D CONTEXT_KERNEL);
>>  	}
>>  #endif
>> @@ -156,7 +157,8 @@ static inline void =
interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
>>  	/* Don't do any per-CPU operations until interrupt state is =
fixed */
>>  #endif
>>  	/* Allow DEC and PMI to be traced when they are soft-NMI */
>> -	if (TRAP(regs) !=3D 0x900 && TRAP(regs) !=3D 0xf00 && TRAP(regs) =
!=3D 0x260) {
>> +	if (TRAP(regs) !=3D INTERRUPT_DECREMENTER &&
>> +	    TRAP(regs) !=3D INTERRUPT_PERFMON) {
>=20
> I think too long names hinder readability, see later for suggestions.
>=20
>>  		state->ftrace_enabled =3D this_cpu_get_ftrace_enabled();
>>  		this_cpu_set_ftrace_enabled(0);
>>  	}
>> @@ -180,7 +182,8 @@ static inline void =
interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
>>  		nmi_exit();
>>    #ifdef CONFIG_PPC64
>> -	if (TRAP(regs) !=3D 0x900 && TRAP(regs) !=3D 0xf00 && TRAP(regs) =
!=3D 0x260)
>> +	if (TRAP(regs) !=3D INTERRUPT_DECREMENTER &&
>> +	    TRAP(regs) !=3D INTERRUPT_PERFMON)
>>  		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
>>    #ifdef CONFIG_PPC_BOOK3S_64
>> diff --git a/arch/powerpc/include/asm/ptrace.h =
b/arch/powerpc/include/asm/ptrace.h
>> index f10498e1b3f6..7a17e0365d43 100644
>> --- a/arch/powerpc/include/asm/ptrace.h
>> +++ b/arch/powerpc/include/asm/ptrace.h
>> @@ -21,6 +21,7 @@
>>    #include <uapi/asm/ptrace.h>
>>  #include <asm/asm-const.h>
>> +#include <asm/traps.h>
>>    #ifndef __ASSEMBLY__
>>  struct pt_regs
>> @@ -237,7 +238,7 @@ static inline bool trap_is_unsupported_scv(struct =
pt_regs *regs)
>>    static inline bool trap_is_syscall(struct pt_regs *regs)
>>  {
>> -	return (trap_is_scv(regs) || TRAP(regs) =3D=3D 0xc00);
>> +	return (trap_is_scv(regs) || TRAP(regs) =3D=3D =
INTERRUPT_SYSCALL);
>>  }
>>    static inline bool trap_norestart(struct pt_regs *regs)
>> diff --git a/arch/powerpc/include/asm/traps.h =
b/arch/powerpc/include/asm/traps.h
>> new file mode 100644
>> index 000000000000..cb416a17097c
>> --- /dev/null
>> +++ b/arch/powerpc/include/asm/traps.h
>> @@ -0,0 +1,32 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_PPC_TRAPS_H
>> +#define _ASM_PPC_TRAPS_H
>> +
>> +#if defined(CONFIG_BOOKE) || defined(CONFIG_4xx)
>> +#define INTERRUPT_MACHINE_CHECK   0x000
>=20
> I'd prefer shorted names in order to not be obliged to split lines.
> Here are some suggestions:
>=20
> INT_MCE
>=20
>> +#define INTERRUPT_CRITICAL_INPUT  0x100
>=20
> INT_CRIT
>=20
>> +#define INTERRUPT_ALTIVEC_UNAVAIL 0x200
>> +#define INTERRUPT_PERFMON         0x260
>=20
> INT_PERF
>=20
>> +#define INTERRUPT_DOORBELL        0x280
>> +#define INTERRUPT_DEBUG           0xd00
>> +#elif defined(CONFIG_PPC_BOOK3S)
>> +#define INTERRUPT_SYSTEM_RESET    0x100
>=20
> INT_SRESET
>=20
>> +#define INTERRUPT_MACHINE_CHECK   0x200
>=20
> INT_MCE
>=20
>> +#define INTERRUPT_DATA_SEGMENT    0x380
>=20
> INT_DSEG
>=20
>> +#define INTERRUPT_INST_SEGMENT    0x480
>=20
> INT_ISEG
>=20
>> +#define INTERRUPT_DOORBELL        0xa00
>=20
> INT_DBELL
>=20
>> +#define INTERRUPT_TRACE           0xd00
>=20
> INT_TRACE
>=20
>> +#define INTERRUPT_H_DATA_STORAGE  0xe00
>> +#define INTERRUPT_PERFMON         0xf00
>=20
> INT_PERF
>=20
>> +#define INTERRUPT_H_FAC_UNAVAIL   0xf80
>> +#endif
>> +
>> +#define INTERRUPT_DATA_STORAGE    0x300
>=20
> INT_DSI
>=20
>> +#define INTERRUPT_INST_STORAGE    0x400
>=20
> INT_ISI
>=20
>> +#define INTERRUPT_ALIGNMENT       0x600
>=20
> INT_ALIGN
>=20
>> +#define INTERRUPT_PROGRAM         0x700
>=20
> INT_PROG
>=20
>> +#define INTERRUPT_FP_UNAVAIL      0x800
>=20
> INT_FP_UNAVAIL
>=20
>> +#define INTERRUPT_DECREMENTER     0x900
>=20
> INT_DEC
>=20
>> +#define INTERRUPT_SYSCALL         0xc00
>=20
> INT_SYSCALL
>=20
>=20
>> +
>> +#endif /* _ASM_PPC_TRAPS_H */
>=20
> ...
>=20
>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>> index 0c0b1c2cfb49..641b3feef7ee 100644
>> --- a/arch/powerpc/mm/fault.c
>> +++ b/arch/powerpc/mm/fault.c
>> @@ -44,6 +44,7 @@
>>  #include <asm/debug.h>
>>  #include <asm/kup.h>
>>  #include <asm/inst.h>
>> +#include <asm/traps.h>
>>      /*
>> @@ -197,7 +198,7 @@ static int mm_fault_error(struct pt_regs *regs, =
unsigned long addr,
>>  static bool bad_kernel_fault(struct pt_regs *regs, unsigned long =
error_code,
>>  			     unsigned long address, bool is_write)
>>  {
>> -	int is_exec =3D TRAP(regs) =3D=3D 0x400;
>> +	int is_exec =3D TRAP(regs) =3D=3D INTERRUPT_INST_STORAGE;
>>    	/* NX faults set DSISR_PROTFAULT on the 8xx, DSISR_NOEXEC_OR_G =
on others */
>>  	if (is_exec && (error_code & (DSISR_NOEXEC_OR_G | DSISR_KEYFAULT =
|
>> @@ -391,7 +392,7 @@ static int ___do_page_fault(struct pt_regs *regs, =
unsigned long address,
>>  	struct vm_area_struct * vma;
>>  	struct mm_struct *mm =3D current->mm;
>>  	unsigned int flags =3D FAULT_FLAG_DEFAULT;
>> - 	int is_exec =3D TRAP(regs) =3D=3D 0x400;
>> +	int is_exec =3D TRAP(regs) =3D=3D INTERRUPT_INST_STORAGE;
>>  	int is_user =3D user_mode(regs);
>>  	int is_write =3D page_fault_is_write(error_code);
>>  	vm_fault_t fault, major =3D 0;
>> @@ -588,20 +589,24 @@ void __bad_page_fault(struct pt_regs *regs, int =
sig)
>>  	/* kernel has accessed a bad area */
>>    	switch (TRAP(regs)) {
>> -	case 0x300:
>> -	case 0x380:
>> -	case 0xe00:
>> +	case INTERRUPT_DATA_STORAGE:
>> +#ifdef CONFIG_PPC_BOOK3S
>> +	case INTERRUPT_DATA_SEGMENT:
>> +	case INTERRUPT_H_DATA_STORAGE:
>> +#endif
>=20
> It would be better to avoid #ifdefs when none where necessary before.
>=20
>=20
>>  		pr_alert("BUG: %s on %s at 0x%08lx\n",
>>  			 regs->dar < PAGE_SIZE ? "Kernel NULL pointer =
dereference" :
>>  			 "Unable to handle kernel data access",
>>  			 is_write ? "write" : "read", regs->dar);
>>  		break;
>> -	case 0x400:
>> -	case 0x480:
>> +	case INTERRUPT_INST_STORAGE:
>> +#ifdef CONFIG_PPC_BOOK3S
>> +	case INTERRUPT_INST_SEGMENT:
>> +#endif
>=20
> It would be better to avoid #ifdefs when none where necessary before.
>=20
Good point. Will delete them.

Regards,
Xiongwei

>=20
>=20
>>  		pr_alert("BUG: Unable to handle kernel instruction =
fetch%s",
>>  			 regs->nip < PAGE_SIZE ? " (NULL pointer?)\n" : =
"\n");
>>  		break;
>> -	case 0x600:
>> +	case INTERRUPT_ALIGNMENT:
>>  		pr_alert("BUG: Unable to handle kernel unaligned access =
at 0x%08lx\n",
>>  			 regs->dar);
>>  		break;
>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>> index 766f064f00fb..6e34f5bba232 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -17,6 +17,7 @@
>>  #include <asm/firmware.h>
>>  #include <asm/ptrace.h>
>>  #include <asm/code-patching.h>
>> +#include <asm/traps.h>
>>    #ifdef CONFIG_PPC64
>>  #include "internal.h"
>> @@ -168,7 +169,7 @@ static bool regs_use_siar(struct pt_regs *regs)
>>  	 * they have not been setup using perf_read_regs() and so =
regs->result
>>  	 * is something random.
>>  	 */
>> -	return ((TRAP(regs) =3D=3D 0xf00) && regs->result);
>> +	return ((TRAP(regs) =3D=3D INTERRUPT_PERFMON) && regs->result);
>>  }
>>    /*
>> @@ -347,7 +348,7 @@ static inline void perf_read_regs(struct pt_regs =
*regs)
>>  	 * hypervisor samples as well as samples in the kernel with
>>  	 * interrupts off hence the userspace check.
>>  	 */
>> -	if (TRAP(regs) !=3D 0xf00)
>> +	if (TRAP(regs) !=3D INTERRUPT_PERFMON)
>>  		use_siar =3D 0;
>>  	else if ((ppmu->flags & PPMU_NO_SIAR))
>>  		use_siar =3D 0;
>> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
>> index bf7d69625a2e..2a4f99e64bf3 100644
>> --- a/arch/powerpc/xmon/xmon.c
>> +++ b/arch/powerpc/xmon/xmon.c
>> @@ -54,6 +54,7 @@
>>  #include <asm/code-patching.h>
>>  #include <asm/sections.h>
>>  #include <asm/inst.h>
>> +#include <asm/traps.h>
>>    #ifdef CONFIG_PPC64
>>  #include <asm/hvcall.h>
>> @@ -1769,7 +1770,12 @@ static void excprint(struct pt_regs *fp)
>>  	printf("    sp: %lx\n", fp->gpr[1]);
>>  	printf("   msr: %lx\n", fp->msr);
>>  -	if (trap =3D=3D 0x300 || trap =3D=3D 0x380 || trap =3D=3D 0x600 =
|| trap =3D=3D 0x200) {
>> +	if (trap =3D=3D INTERRUPT_DATA_STORAGE ||
>> +#ifdef CONFIG_PPC_BOOK3S
>> +	    trap =3D=3D INTERRUPT_DATA_SEGMENT ||
>> +#endif
> It would be better to avoid #ifdefs when none where necessary before.
>=20
> And an #ifdef in the middle of a code line is awful for readability =
and maintainability.
>=20
>> +	    trap =3D=3D INTERRUPT_ALIGNMENT ||
>> +	    trap =3D=3D INTERRUPT_MACHINE_CHECK) {
>>  		printf("   dar: %lx\n", fp->dar);
>>  		if (trap !=3D 0x380)
>>  			printf(" dsisr: %lx\n", fp->dsisr);
>> @@ -1785,7 +1791,7 @@ static void excprint(struct pt_regs *fp)
>>  		       current->pid, current->comm);
>>  	}
>>  -	if (trap =3D=3D 0x700)
>> +	if (trap =3D=3D INTERRUPT_PROGRAM)
>>  		print_bug_trap(fp);
>>    	printf(linux_banner);
>> @@ -1846,7 +1852,11 @@ static void prregs(struct pt_regs *fp)
>>  	printf("ctr =3D "REG"   xer =3D "REG"   trap =3D %4lx\n",
>>  	       fp->ctr, fp->xer, fp->trap);
>>  	trap =3D TRAP(fp);
>> -	if (trap =3D=3D 0x300 || trap =3D=3D 0x380 || trap =3D=3D 0x600)
>> +	if (trap =3D=3D INTERRUPT_DATA_STORAGE ||
>> +#ifdef CONFIG_PPC_BOOK3S
>> +	    trap =3D=3D INTERRUPT_DATA_SEGMENT ||
>> +#endif
>> +	    trap =3D=3D INTERRUPT_ALIGNMENT)
>=20
> It would be better to avoid #ifdefs when none where necessary before.
>=20
> And an #ifdef in the middle of a code line is awful for readability =
and maintainability.
>=20
>=20
>>  		printf("dar =3D "REG"   dsisr =3D %.8lx\n", fp->dar, =
fp->dsisr);
>>  }
>> =20

