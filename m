Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C84485280D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 05:48:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mg8vATsk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYpkR0h9mz3dWW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 15:48:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mg8vATsk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYpjf2fjYz3blb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 15:48:05 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41D4hSii012941;
	Tue, 13 Feb 2024 04:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0HdicIOmOtP7rJkNrHlMzx9aU9w09W2O6/JK5iajvv0=;
 b=mg8vATsk+f67y35NaCI7yOsEle5Sqb8c+mqrW4/Ho2xj68ZYTHyBjHHEfkZvF6AyyBWX
 ub0OrjmQFH5ehN3PsUtoJZhq7OYCsKzfZQQeg3KGP6f3SC1T8Yc+nF/iD8vOftMgyVt/
 0wyF3IDr5LCr32wSpGcPF1cCjqaaZc5fhNYsuNPqiUdOaxyH0tNcxRjAy0tOYLM0gSM6
 FZJEXTdOAresv3rtzifPo4yTWL3rl3Tp3oG6ety2ASZRIF8r41JZPak7EGCni8PyaB5g
 F/xylMHuNCTfyolNBoTDJmhG2q+u3a0czu9ZSkSFDqjzVqy1i3h/6CcNzv3WO1MCCdKR MA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w81n6g2yf-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 04:47:57 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41D3jGmJ032596;
	Tue, 13 Feb 2024 04:20:25 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6kftddmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 04:20:25 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41D4KLkj55509498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Feb 2024 04:20:23 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D88F20043;
	Tue, 13 Feb 2024 04:20:21 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2B0D2004D;
	Tue, 13 Feb 2024 04:20:20 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Feb 2024 04:20:20 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AE07C602C3;
	Tue, 13 Feb 2024 15:20:17 +1100 (AEDT)
Message-ID: <e2bc1806b2107b5a2eb4f287c92a42754cbee3c1.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/ftrace: Ignore ftrace locations in exit text
 sections
From: Benjamin Gray <bgray@linux.ibm.com>
To: Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 13 Feb 2024 15:20:17 +1100
In-Reply-To: <20240209075931.666935-1-naveen@kernel.org>
References: <20240209075931.666935-1-naveen@kernel.org>
Autocrypt: addr=bgray@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEYzuwexYJKwYBBAHaRw8BAQdAsgBYEqW6nNaL7i0B3z1RqyMl8ADupDef+5Sfe+JbzeC0I0JlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+iJMEExYKADsWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwewIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRB5xrdpFsvehCiCAP4g7CDkmsakpwv9QxU2D8dophyCIS8meDOQX4/83/sjHgEA5HWbUsbRCpVmeIgu0iNwhw3cmqhkv7ZkBGe3HhHaXg65Ay4EYzuwkREIAJjQ1EDAmLbOENucLy7VUzyNNCHkBirK/+FbjwOW7VIphc8zgsbZ26ZjIu5vC1NY7U7DpOvLAfR0g4+2QeKiQ8EEcuxLhif5X+jsekq0oSTVLcyNYXArJ3mhmV7jRhz8wBueMoXY/k+P3HCVLi4vzroJzN06Hrnmeu5ELlC4MbuvGRTvW751Y/o7gTa6hyyLb2P4pQ+sj/PuIn2Ly1RJPF839HVcOOERkjZ2QZNJnXEhlpfDD7LyRsy9Xm6MxGKRE5VsfjaO+Q8B6ByhXIy5/QK41AF1uSIPBfkZ8+AsBFw8Z87VGQ61tDdzi0U77IdYr98KsgRJ30vHInfKKdSj4csBALzNKjOFmp7dS8mefp3viouy4vWPla8+XZU6ZrRNtD8hB/9FsE7KVTdIBp4xqf6oN1ieTD7PNsQsBQWdDA/rg2bP7IJQkf4Pvn0yoATOFgqhQwadkwT7fwWAfk0YPEE+DPom1V3JwNM6wPaEJeNaMjleqTfAfauLaB9Sc+zJvN5cORrEjSL/0jfJBBdjW5j5BmdUDM1mGuBNVQhGlWHc/Rf7qokMoZAfYiPi/z44rB9zvNfb8t6sVNqHbC2fKRBn/0k8cZ9+qBEIj6vbkqUuih8xNDA+TU+FxPqJxyahqFv+LL9cfZelC0v3D
	mjW5LaBPOdGiiDE1w95Ri9HRK27S2dRZpyib9L4mkfYWPAF41mTudjKmVpgtBLO//rO+zmF04OMB/4sWJhLfvhq1CXULDqw5dcuIAIYwf2ughOtyAPFK1ViDcMO5X1bVpNAFO5m4VBpZvFDQ0j0JfqfVBdL68uH05W1/8dMj76RaWj5m0rLM5slY1FQUPddSU+ic9vaZhlDepjU3ZyI8fmioofNGHaxJq6uNTytKdj87kwDV6PQ4hmuGtY56C7JCgjp053sRJ6sXqgKBWfe4ZOJH17mQm+fws93byLoZvvz4Z3im0Rb0MlFo/WirNyhu+TmTNLpnzFUZfenoKrqAkZLY8u1iCFquhgqA321P+sfYew66DtwQmaoi2GKmF89y2enXXzjLNKfLDKkuVoKxFSPeizYqrLi22R9iO8EGBYKACAWIQQ9K5v9I+L06Hi4yOJ5xrdpFsvehAUCYzuwkQIbAgCBCRB5xrdpFsvehHYgBBkRCAAdFiEESFUlaLYscsf4Dt5gaavCcpI6D/8FAmM7sJEACgkQaavCcpI6D/95UgEAqfSj0QhCrYfazQiLDKJstrz3oIKFjhB6+FYMZqt+K1MA/2ioFtHbypeeWbsqYYRhRyTjAKcvE1NZGtH/YWLgkViUidoBAN6gFX/P+VWB77/w8S/BnPmnJx45wmphlkCL8ckOyopFAQCj9eWamHCl2DSaASMSuoZed6C6Gm0OFtuZh/r8K485BQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qH_JEAsKepCMaPe30ZVP5xJ-llxTklVG
X-Proofpoint-ORIG-GUID: qH_JEAsKepCMaPe30ZVP5xJ-llxTklVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_01,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 suspectscore=0 bulkscore=0 mlxlogscore=885 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402130034
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2024-02-09 at 13:29 +0530, Naveen N Rao wrote:
> Michael reported that we are seeing ftrace bug on bootup when KASAN
> is
> enabled, and if we are using -fpatchable-function-entry:
>=20
> =C2=A0=C2=A0=C2=A0 ftrace: allocating 47780 entries in 18 pages
> =C2=A0=C2=A0=C2=A0 ftrace-powerpc: 0xc0000000020b3d5c: No module provided=
 for non-
> kernel address
> =C2=A0=C2=A0=C2=A0 ------------[ ftrace bug ]------------
> =C2=A0=C2=A0=C2=A0 ftrace faulted on modifying
> =C2=A0=C2=A0=C2=A0 [<c0000000020b3d5c>] 0xc0000000020b3d5c
> =C2=A0=C2=A0=C2=A0 Initializing ftrace call sites
> =C2=A0=C2=A0=C2=A0 ftrace record flags: 0
> =C2=A0=C2=A0=C2=A0=C2=A0 (0)
> =C2=A0=C2=A0=C2=A0=C2=A0 expected tramp: c00000000008cef4
> =C2=A0=C2=A0=C2=A0 ------------[ cut here ]------------
> =C2=A0=C2=A0=C2=A0 WARNING: CPU: 0 PID: 0 at kernel/trace/ftrace.c:2180
> ftrace_bug+0x3c0/0x424
> =C2=A0=C2=A0=C2=A0 Modules linked in:
> =C2=A0=C2=A0=C2=A0 CPU: 0 PID: 0 Comm: swapper Not tainted 6.5.0-rc3-0012=
0-
> g0f71dcfb4aef #860
> =C2=A0=C2=A0=C2=A0 Hardware name: IBM pSeries (emulated by qemu) POWER9 (=
raw)
> 0x4e1202 0xf000005 of:SLOF,HEAD hv:linux,kvm pSeries
> =C2=A0=C2=A0=C2=A0 NIP:=C2=A0 c0000000003aa81c LR: c0000000003aa818 CTR: =
0000000000000000
> =C2=A0=C2=A0=C2=A0 REGS: c0000000033cfab0 TRAP: 0700=C2=A0=C2=A0 Not tain=
ted=C2=A0 (6.5.0-rc3-
> 00120-g0f71dcfb4aef)
> =C2=A0=C2=A0=C2=A0 MSR:=C2=A0 8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>=C2=
=A0 CR: 28028240=C2=A0
> XER: 00000000
> =C2=A0=C2=A0=C2=A0 CFAR: c0000000002781a8 IRQMASK: 3
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 NIP [c0000000003aa81c] ftrace_bug+0x3c0/0x424
> =C2=A0=C2=A0=C2=A0 LR [c0000000003aa818] ftrace_bug+0x3bc/0x424
> =C2=A0=C2=A0=C2=A0 Call Trace:
> =C2=A0=C2=A0=C2=A0=C2=A0 ftrace_bug+0x3bc/0x424 (unreliable)
> =C2=A0=C2=A0=C2=A0=C2=A0 ftrace_process_locs+0x5f4/0x8a0
> =C2=A0=C2=A0=C2=A0=C2=A0 ftrace_init+0xc0/0x1d0
> =C2=A0=C2=A0=C2=A0=C2=A0 start_kernel+0x1d8/0x484
>=20
> With CONFIG_FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY=3Dy and
> CONFIG_KASAN=3Dy, compiler emits nops in functions that it generates
> for
> registering and unregistering global variables (unlike with -pg and
> -mprofile-kernel where calls to _mcount() are not generated in those
> functions). Those functions then end up in INIT_TEXT and EXIT_TEXT
> respectively. We don't expect to see any profiled functions in
> EXIT_TEXT, so ftrace_init_nop() assumes that all addresses that
> aren't
> in the core kernel text belongs to a module. Since these functions do
> not match that criteria, we see the above bug.
>=20
> Address this by having ftrace ignore all locations in the text exit
> sections of vmlinux.
>=20
> Fixes: 0f71dcfb4aef ("powerpc/ftrace: Add support for -fpatchable-
> function-entry")
> Cc: stable@vger.kernel.org
> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> ---
> =C2=A0arch/powerpc/include/asm/ftrace.h=C2=A0=C2=A0 |=C2=A0 9 +--------
> =C2=A0arch/powerpc/include/asm/sections.h |=C2=A0 1 +
> =C2=A0arch/powerpc/kernel/trace/ftrace.c=C2=A0 | 12 ++++++++++++
> =C2=A0arch/powerpc/kernel/vmlinux.lds.S=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A04 files changed, 16 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/ftrace.h
> b/arch/powerpc/include/asm/ftrace.h
> index 1ebd2ca97f12..d6babd083202 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -20,14 +20,7 @@
> =C2=A0#ifndef __ASSEMBLY__
> =C2=A0extern void _mcount(void);
> =C2=A0
> -static inline unsigned long ftrace_call_adjust(unsigned long addr)
> -{
> -	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY))
> -		addr +=3D MCOUNT_INSN_SIZE;
> -
> -	return addr;
> -}
> -
> +unsigned long ftrace_call_adjust(unsigned long addr);
> =C2=A0unsigned long prepare_ftrace_return(unsigned long parent, unsigned
> long ip,
> =C2=A0				=C2=A0=C2=A0=C2=A0 unsigned long sp);
> =C2=A0
> diff --git a/arch/powerpc/include/asm/sections.h
> b/arch/powerpc/include/asm/sections.h
> index ea26665f82cf..d389dcecdb0b 100644
> --- a/arch/powerpc/include/asm/sections.h
> +++ b/arch/powerpc/include/asm/sections.h
> @@ -14,6 +14,7 @@ typedef struct func_desc func_desc_t;
> =C2=A0
> =C2=A0extern char __head_end[];
> =C2=A0extern char __srwx_boundary[];
> +extern char _sexittext[], _eexittext[];
> =C2=A0
> =C2=A0/* Patch sites */
> =C2=A0extern s32 patch__call_flush_branch_caches1;
> diff --git a/arch/powerpc/kernel/trace/ftrace.c
> b/arch/powerpc/kernel/trace/ftrace.c
> index 82010629cf88..b5efd8d7bc01 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -27,10 +27,22 @@
> =C2=A0#include <asm/ftrace.h>
> =C2=A0#include <asm/syscall.h>
> =C2=A0#include <asm/inst.h>
> +#include <asm/sections.h>
> =C2=A0
> =C2=A0#define	NUM_FTRACE_TRAMPS	2
> =C2=A0static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
> =C2=A0
> +unsigned long ftrace_call_adjust(unsigned long addr)
> +{
> +	if (addr >=3D (unsigned long)_sexittext && addr < (unsigned
> long)_eexittext)
> +		return 0;
> +
> +	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY))
> +		addr +=3D MCOUNT_INSN_SIZE;
> +
> +	return addr;
> +}
> +
> =C2=A0static ppc_inst_t ftrace_create_branch_inst(unsigned long ip,
> unsigned long addr, int link)
> =C2=A0{
> =C2=A0	ppc_inst_t op;
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S
> b/arch/powerpc/kernel/vmlinux.lds.S
> index 1c5970df3233..9c376ae6857d 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -281,7 +281,9 @@ SECTIONS
> =C2=A0	 * to deal with references from __bug_table
> =C2=A0	 */
> =C2=A0	.exit.text : AT(ADDR(.exit.text) - LOAD_OFFSET) {
> +		_sexittext =3D .;
> =C2=A0		EXIT_TEXT
> +		_eexittext =3D .;
> =C2=A0	}
> =C2=A0
> =C2=A0	. =3D ALIGN(PAGE_SIZE);
>=20
> base-commit: 4ef8376c466ae8b03e632dd8eca1e44315f7dd61

Reviewed-by: Benjamin Gray <bgray@linux.ibm.com>

Fixes what I assume is the same bug I was seeing for a while

[    0.000000][    T0] ftrace-powerpc: 0xc0000000030f4f38: No module provid=
ed for non-kernel address
[    0.000000][    T0] ------------[ ftrace bug ]------------
[    0.000000][    T0] ftrace faulted on modifying=20
[    0.000000][    T0] [<c0000000030f4f38>] _sub_D_65535_0+0xc/0x40
[    0.000000][    T0] Initializing ftrace call sites
[    0.000000][    T0] ftrace record flags: 0
[    0.000000][    T0]  (0)   =20
[    0.000000][    T0]  expected tramp: c0000000000a8548
[    0.000000][    T0] ------------[ cut here ]------------
[    0.000000][    T0] WARNING: CPU: 0 PID: 0 at kernel/trace/ftrace.c:2179=
 ftrace_bug+0x16c/0x3a0
[    0.000000][    T0] Modules linked in:
[    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 6.8.0-rc3-02=
361-g892886f9f5b7-dirty #11
[    0.000000][    T0] Hardware name: IBM pSeries (emulated by qemu) POWER9=
 (raw) 0x4e1202 0xf000005 of:SLOF,HEAD hv:linux,kvm pSeries
[    0.000000][    T0] NIP:  c00000000048a96c LR: c00000000048a968 CTR: 000=
0000000000000
[    0.000000][    T0] REGS: c000000004fa7ae0 TRAP: 0700   Not tainted  (6.=
8.0-rc3-02361-g892886f9f5b7-dirty)
[    0.000000][    T0] MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: =
28028440  XER: 00000000
[    0.000000][    T0] CFAR: c00000000031db34 IRQMASK: 3=20
[    0.000000][    T0] GPR00: c00000000048a968 c000000004fa7d80 c0000000026=
45600 0000000000000022=20
[    0.000000][    T0] GPR04: 0000000000000008 0000000000000001 c0000000003=
26dc4 0000000000000000=20
[    0.000000][    T0] GPR08: c000000002535600 0000000000000001 c0000000044=
0bee0 0000000048028444=20
[    0.000000][    T0] GPR12: 0000000000000000 c000000006250000 00000000000=
00000 0000000000000000=20
[    0.000000][    T0] GPR16: 0000000000000000 0000000000000003 00000000000=
00001 0000000000000000=20
[    0.000000][    T0] GPR20: c000000004fe8af8 c000000010030428 c0000000045=
b90c0 0000000000000000=20
[    0.000000][    T0] GPR24: 0000000000000000 c000000010030430 c0000000100=
30420 0000000000000000=20
[    0.000000][    T0] GPR28: c000000001dd9a40 c000000001dd8bc0 c0000000102=
a5b00 c0000000102a5b08=20
[    0.000000][    T0] NIP [c00000000048a96c] ftrace_bug+0x16c/0x3a0
[    0.000000][    T0] LR [c00000000048a968] ftrace_bug+0x168/0x3a0
[    0.000000][    T0] Call Trace:
[    0.000000][    T0] [c000000004fa7d80] [c00000000048a968] ftrace_bug+0x1=
68/0x3a0 (unreliable)
[    0.000000][    T0] [c000000004fa7e20] [c00000000048aeec] ftrace_process=
_locs+0x34c/0x780
[    0.000000][    T0] [c000000004fa7ec0] [c0000000030655c0] ftrace_init+0x=
c8/0x27c
[    0.000000][    T0] [c000000004fa7f40] [c00000000300d458] start_kernel+0=
x1bc/0x528
[    0.000000][    T0] [c000000004fa7fe0] [c00000000000eaa0] start_here_com=
mon+0x1c/0x20
[    0.000000][    T0] Code: 7fe3fb78 483a31e5 60000000 e93e0008 75290800 4=
0820150 7fc3f378 4bfffc95 7c641b78 387d0f40 4be93189 60000000 <0fe00000> 38=
2100a0 3d22fda6 39000001=20
[    0.000000][    T0] irq event stamp: 0
[    0.000000][    T0] hardirqs last  enabled at (0): [<0000000000000000>] =
0x0
[    0.000000][    T0] hardirqs last disabled at (0): [<0000000000000000>] =
0x0
[    0.000000][    T0] softirqs last  enabled at (0): [<0000000000000000>] =
0x0
[    0.000000][    T0] softirqs last disabled at (0): [<0000000000000000>] =
0x0
[    0.000000][    T0] ---[ end trace 0000000000000000 ]---


