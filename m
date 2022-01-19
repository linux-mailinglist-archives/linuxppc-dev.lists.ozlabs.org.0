Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB74493F4C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 18:47:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfClY3DShz30NW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 04:47:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j3pedC0Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j3pedC0Z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfCkk68hwz303n
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 04:46:53 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JHjx1w010630; 
 Wed, 19 Jan 2022 17:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=lvl6HDgYIguMuowHKPJlfdYnyiGEdpvxcLcGwxkyQ+c=;
 b=j3pedC0ZlKl2uEdqr02uI5Oeh5zaP6TsNvcSJ2eMnx/CpZcd2Ylu8KsLgBESKjD4i40p
 59KA7z9W3TiB0bVh7yz0Vhna727t5m+Uc3rKYfsVEOJ8Ft/+aobZAX07RjWRMOvSVGLs
 +Ss8fesjTrd1dAgRcyqQ7AhdNvsl5blWVwsmDVmRuNr691eTKfWxiEtRjysbWDz2vAYp
 bFKoOFZEeSQJ5LcK5Nz8vhPnZMIpvG5O5NHaX2n7AHO56acCN4sno98pvEbWj0BWrUz1
 /jrt7UKomOHIbtmPKThN7/RFRJpzMSayYEI0YAwUwyk1BM1fAYCoHxouZ69HDyS1sc4V Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dpj7yr4f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 17:46:48 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20JHkgbY013213;
 Wed, 19 Jan 2022 17:46:47 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dpj7yr4ef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 17:46:47 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20JHhkro028712;
 Wed, 19 Jan 2022 17:46:46 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3dknhjs37n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 17:46:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20JHkh8Z30671110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 17:46:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3919A405B;
 Wed, 19 Jan 2022 17:46:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F3FEA4060;
 Wed, 19 Jan 2022 17:46:43 +0000 (GMT)
Received: from localhost (unknown [9.43.127.26])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Jan 2022 17:46:43 +0000 (GMT)
Date: Wed, 19 Jan 2022 23:16:42 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 1/2] powerpc/64: remove system call instruction
 emulation
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
References: <20220118055821.3065241-1-npiggin@gmail.com>
 <20220118055821.3065241-2-npiggin@gmail.com>
In-Reply-To: <20220118055821.3065241-2-npiggin@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/v0.16-1-g4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1642590222.n896duq2fq.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rhrnaZGcEq4FBzSkX-Dlt2T9gIeRW-xE
X-Proofpoint-ORIG-GUID: yDQHQFNnUsdRYwgX2UvfDhg7bpzejNUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-19_10,2022-01-19_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 mlxlogscore=999 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190099
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
Cc: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin wrote:
> emulate_step instruction emulation including sc instruction emulation
> initially appeared in xmon. It then emulation code was then moved into
> sstep.c where kprobes could use it too, and later hw_breakpoint and
> uprobes started to use it.
>=20
> Until uprobes, the only instruction emulation users were for kernel
> mode instructions.
>=20
> - xmon only steps / breaks on kernel addresses.
> - kprobes is kernel only.
> - hw_breakpoint only emulates kernel instructions, single steps user.
>=20
> At one point there was support for the kernel to execute sc
> instructions, although that is long removed and it's not clear whether
> there was any upstream instructions or this was used by out of tree
> modules. So system call emulation is not required by the above users.
>=20
> uprobes uses emulate_step and it appears possible to emulate sc
> instruction in userspace. This type of system call emulation is broken
> and it's not clear it ever worked well.
>=20
> The big complication is that userspace takes an interrupt to the kernel
> to emulate the instruction. The user->kernel interrupt sets up registers
> and interrupt stack frame expecting to return to userspace, then system
> call instruction emulation re-directs that stack frame to the kernel,
> early in the system call interrupt handler. This means the the interrupt
> return code takes the kernel->kernel restore path, which does not restore
> everything as the system call interrupt handler would expect coming from
> userspace. regs->iamr appears to get lost for example, because the
> kernel->kernel return does not restore the user iamr. Accounting such as
> irqflags tracing and CPU accounting does not get flipped back to user
> mode as the system call handler expects, so those appear to enter the
> kernel twice without returning to userspace.
>=20
> These things may be individually fixable with various complication, but
> it is a big complexity to support this just for uprobes.
>=20
> uprobes emulates the instruction rather than stepping for performance
> reasons. System calls instructions should not be a significant source
> of uprobes and already expensive, so skipping emulation should not be
> a significant problem.

I agree with that assessment, though I think we will need to disable=20
probing on 'sc'/'scv' instructions. Per the ISA, section 6.5.15 on=20
'Trace Interrupt', we can't single step a system call instruction:
    "Successful completion for an instruction means that the
    instruction caused no other interrupt and, if the thread
    is in Transactional state, did not cause the transaction
    to fail in such a way that the instruction did not com-
    plete (see Section 5.3.1 of Book II). Thus a Trace inter-
    rupt never occurs for a System Call or System Call
    Vectored instruction, or for a Trap instruction that traps,
    or for a dcbf that is executed in Transactional state.
    The instruction that causes a Trace interrupt is called
    the =E2=80=9Ctraced instruction=E2=80=9D."

I am not aware of any use case requiring probes on a system call=20
instruction, so I think we can disable probing on system call=20
instructions (patch further below).

>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/lib/sstep.c | 36 ------------------------------------
>  1 file changed, 36 deletions(-)
>=20
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index a94b0cd0bdc5..ee3bc45fb23b 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -15,9 +15,6 @@
>  #include <asm/cputable.h>
>  #include <asm/disassemble.h>
>=20
> -extern char system_call_common[];
> -extern char system_call_vectored_emulate[];
> -
>  #ifdef CONFIG_PPC64
>  /* Bits in SRR1 that are copied from MSR */
>  #define MSR_MASK	0xffffffff87c0ffffUL
> @@ -3650,39 +3647,6 @@ int emulate_step(struct pt_regs *regs, ppc_inst_t =
instr)
>  		goto instr_done;
>=20
>  #ifdef CONFIG_PPC64
> -	case SYSCALL:	/* sc */
> -		/*
> -		 * N.B. this uses knowledge about how the syscall
> -		 * entry code works.  If that is changed, this will
> -		 * need to be changed also.
> -		 */
> -		if (IS_ENABLED(CONFIG_PPC_FAST_ENDIAN_SWITCH) &&
> -				cpu_has_feature(CPU_FTR_REAL_LE) &&
> -				regs->gpr[0] =3D=3D 0x1ebe) {
> -			regs_set_return_msr(regs, regs->msr ^ MSR_LE);
> -			goto instr_done;
> -		}
> -		regs->gpr[9] =3D regs->gpr[13];
> -		regs->gpr[10] =3D MSR_KERNEL;
> -		regs->gpr[11] =3D regs->nip + 4;
> -		regs->gpr[12] =3D regs->msr & MSR_MASK;
> -		regs->gpr[13] =3D (unsigned long) get_paca();
> -		regs_set_return_ip(regs, (unsigned long) &system_call_common);
> -		regs_set_return_msr(regs, MSR_KERNEL);
> -		return 1;
> -
> -#ifdef CONFIG_PPC_BOOK3S_64
> -	case SYSCALL_VECTORED_0:	/* scv 0 */
> -		regs->gpr[9] =3D regs->gpr[13];
> -		regs->gpr[10] =3D MSR_KERNEL;
> -		regs->gpr[11] =3D regs->nip + 4;
> -		regs->gpr[12] =3D regs->msr & MSR_MASK;
> -		regs->gpr[13] =3D (unsigned long) get_paca();
> -		regs_set_return_ip(regs, (unsigned long) &system_call_vectored_emulate=
);
> -		regs_set_return_msr(regs, MSR_KERNEL);
> -		return 1;
> -#endif
> -

Given that we should not be probing syscall instructions, I think it is=20
better to return -1 for these two, similar to the RFI below. With that=20
change, for this patch:
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

>  	case RFI:
>  		return -1;
>  #endif


Thanks,
Naveen

--
[PATCH] powerpc/uprobes: Reject uprobe on a system call instruction

Per the ISA, a Trace interrupt is not generated for a system call
[vectored] instruction. Reject uprobes on such instructions as we are
not emulating a system call [vectored] instruction anymore.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 1 +
 arch/powerpc/kernel/uprobes.c         | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/a=
sm/ppc-opcode.h
index efad07081cc0e5..fedf843bcdddeb 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -411,6 +411,7 @@
 #define PPC_RAW_DCBFPS(a, b)		(0x7c0000ac | ___PPC_RA(a) | ___PPC_RB(b) | =
(4 << 21))
 #define PPC_RAW_DCBSTPS(a, b)		(0x7c0000ac | ___PPC_RA(a) | ___PPC_RB(b) |=
 (6 << 21))
 #define PPC_RAW_SC()			(0x44000002)
+#define PPC_RAW_SCV()			(0x44000001)
 #define PPC_RAW_SYNC()			(0x7c0004ac)
 #define PPC_RAW_ISYNC()			(0x4c00012c)
=20
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index c6975467d9ffdc..bedca31391d043 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -41,6 +41,12 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe=
,
 	if (addr & 0x03)
 		return -EINVAL;
=20
+	if (ppc_inst_val(ppc_inst_read(auprobe->insn)) =3D=3D PPC_RAW_SC() ||
+	    ppc_inst_val(ppc_inst_read(auprobe->insn)) =3D=3D PPC_RAW_SCV()) {
+		pr_info("Rejecting uprobe on system call instruction\n");
+		return -EINVAL;
+	}
+
 	if (cpu_has_feature(CPU_FTR_ARCH_31) &&
 	    ppc_inst_prefixed(ppc_inst_read(auprobe->insn)) &&
 	    (addr & 0x3f) =3D=3D 60) {

base-commit: 863a7c25c334ed368b4508fccae92d6bb61e71a4
--=20
2.34.1


