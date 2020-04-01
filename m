Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D3F19B3D8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 18:55:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sskc5cSCzDrBh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 03:55:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ssgC58NDzDqm6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 03:52:07 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031GWxf4107251
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Apr 2020 12:52:05 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304edx4w28-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 12:52:04 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 1 Apr 2020 17:51:46 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 17:51:44 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 031Got9Q41550286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 16:50:55 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D8CDA4053;
 Wed,  1 Apr 2020 16:51:59 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A88F4A4051;
 Wed,  1 Apr 2020 16:51:58 +0000 (GMT)
Received: from localhost (unknown [9.85.74.146])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 16:51:58 +0000 (GMT)
Date: Wed, 01 Apr 2020 22:21:55 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 3/4] powerpc ppc-opcode: move ppc instuction encoding
 from test_emulate_step
To: Balamuruhan S <bala24@linux.ibm.com>, mpe@ellerman.id.au
References: <20200320081837.1016820-1-bala24@linux.ibm.com>
 <20200320081837.1016820-4-bala24@linux.ibm.com>
In-Reply-To: <20200320081837.1016820-4-bala24@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20040116-0020-0000-0000-000003BFB805
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040116-0021-0000-0000-000022185F02
Message-Id: <1585759165.2r0pc78n07.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_01:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010135
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
Cc: jniethe5@gmail.com, linuxppc-dev@lists.ozlabs.org, sandipan@linux.ibm.com,
 paulus@samba.org, ravi.bangoria@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Balamuruhan S wrote:
> Few ppc instructions are encoded in test_emulate_step.c, consolidate them=
 to
> ppc-opcode.h, fix redefintion errors in bpf_jit caused due to this consol=
idation.
> Reuse the macros from ppc-opcode.h
>=20
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/ppc-opcode.h |  34 ++++++
>  arch/powerpc/lib/test_emulate_step.c  | 155 ++++++++++----------------
>  arch/powerpc/net/bpf_jit.h            |   8 --
>  arch/powerpc/net/bpf_jit32.h          |  10 +-
>  arch/powerpc/net/bpf_jit64.h          |   4 +-
>  arch/powerpc/net/bpf_jit_comp.c       |   2 +-
>  arch/powerpc/net/bpf_jit_comp64.c     |  14 +--
>  7 files changed, 105 insertions(+), 122 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include=
/asm/ppc-opcode.h
> index ea5e0f864b20..2ed8a285f1ec 100644
> --- a/arch/powerpc/include/asm/ppc-opcode.h
> +++ b/arch/powerpc/include/asm/ppc-opcode.h
> @@ -76,6 +76,9 @@
>  #define	__REGA0_R30	30
>  #define	__REGA0_R31	31
>=20
> +#define IMM_L(i)               ((uintptr_t)(i) & 0xffff)
> +#define IMM_DS(i)              ((uintptr_t)(i) & 0xfffc)
> +
>  /* opcode and xopcode for instructions */
>  #define OP_TRAP 3
>  #define OP_TRAP_64 2
> @@ -614,6 +617,37 @@
>  						___PPC_RA(vra) | \
>  						___PPC_RB(vrb) | __PPC_RC21)
>=20
> +#define PPC_ENCODE_LD(r, base, i)     (PPC_INST_LD | ___PPC_RT(r) |     =
      \
> +				___PPC_RA(base) | IMM_DS(i))
> +#define PPC_ENCODE_LWZ(r, base, i)    (PPC_INST_LWZ | ___PPC_RT(r) |    =
      \
> +				___PPC_RA(base) | IMM_L(i))
> +#define PPC_ENCODE_LWZX(t, a, b)      (PPC_INST_LWZX | ___PPC_RT(t) |   =
      \
> +				___PPC_RA(a) | ___PPC_RB(b))
> +#define PPC_ENCODE_STD(r, base, i)    (PPC_INST_STD | ___PPC_RS(r) |    =
      \
> +				___PPC_RA(base) | IMM_DS(i))
> +#define PPC_ENCODE_STDCX(s, a, b)     (PPC_INST_STDCX | ___PPC_RS(s) |  =
      \
> +				___PPC_RA(a) | ___PPC_RB(b))
> +#define PPC_ENCODE_LFSX(t, a, b)      (PPC_INST_LFSX | ___PPC_RT(t) |   =
      \
> +				___PPC_RA(a) | ___PPC_RB(b))
> +#define PPC_ENCODE_STFSX(s, a, b)     (PPC_INST_STFSX | ___PPC_RS(s) |  =
      \
> +				___PPC_RA(a) | ___PPC_RB(b))
> +#define PPC_ENCODE_LFDX(t, a, b)      (PPC_INST_LFDX | ___PPC_RT(t) |   =
      \
> +				___PPC_RA(a) | ___PPC_RB(b))
> +#define PPC_ENCODE_STFDX(s, a, b)     (PPC_INST_STFDX | ___PPC_RS(s) |  =
      \
> +				 ___PPC_RA(a) | ___PPC_RB(b))
> +#define PPC_ENCODE_LVX(t, a, b)       (PPC_INST_LVX | ___PPC_RT(t) |    =
      \
> +				___PPC_RA(a) | ___PPC_RB(b))
> +#define PPC_ENCODE_STVX(s, a, b)      (PPC_INST_STVX | ___PPC_RS(s) |   =
      \
> +				___PPC_RA(a) | ___PPC_RB(b))
> +#define PPC_ENCODE_ADD(t, a, b)       (PPC_INST_ADD | ___PPC_RT(t) |    =
      \
> +				___PPC_RA(a) | ___PPC_RB(b))
> +#define PPC_ENCODE_ADD_DOT(t, a, b)   (PPC_INST_ADD | ___PPC_RT(t) |    =
      \
> +				___PPC_RA(a) | ___PPC_RB(b) | 0x1)
> +#define PPC_ENCODE_ADDC(t, a, b)      (PPC_INST_ADDC | ___PPC_RT(t) |   =
      \
> +				___PPC_RA(a) | ___PPC_RB(b))
> +#define PPC_ENCODE_ADDC_DOT(t, a, b)  (PPC_INST_ADDC | ___PPC_RT(t) |   =
      \
> +				___PPC_RA(a) | ___PPC_RB(b) | 0x1)
> +
>  #define PPC_CP_ABORT        stringify_in_c(.long PPC_ENCODE_CP_ABORT)
>  #define PPC_COPY(a, b)      stringify_in_c(.long PPC_ENCODE_COPY(a, b))
>  #define PPC_DARN(t, l)      stringify_in_c(.long PPC_ENCODE_DARN(t, l))
> diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test=
_emulate_step.c
> index 53df4146dd32..45b485edfee1 100644
> --- a/arch/powerpc/lib/test_emulate_step.c
> +++ b/arch/powerpc/lib/test_emulate_step.c
> @@ -12,49 +12,6 @@
>  #include <asm/ppc-opcode.h>
>  #include <asm/code-patching.h>
>=20
> -#define IMM_L(i)		((uintptr_t)(i) & 0xffff)
> -#define IMM_DS(i)		((uintptr_t)(i) & 0xfffc)
> -
> -/*
> - * Defined with TEST_ prefix so it does not conflict with other
> - * definitions.
> - */
> -#define TEST_LD(r, base, i)	(PPC_INST_LD | ___PPC_RT(r) |		\
> -					___PPC_RA(base) | IMM_DS(i))
> -#define TEST_LWZ(r, base, i)	(PPC_INST_LWZ | ___PPC_RT(r) |		\
> -					___PPC_RA(base) | IMM_L(i))
> -#define TEST_LWZX(t, a, b)	(PPC_INST_LWZX | ___PPC_RT(t) |		\
> -					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_STD(r, base, i)	(PPC_INST_STD | ___PPC_RS(r) |		\
> -					___PPC_RA(base) | IMM_DS(i))
> -#define TEST_LDARX(t, a, b, eh)	(PPC_INST_LDARX | ___PPC_RT(t) |	\
> -					___PPC_RA(a) | ___PPC_RB(b) |	\
> -					__PPC_EH(eh))
> -#define TEST_STDCX(s, a, b)	(PPC_INST_STDCX | ___PPC_RS(s) |	\
> -					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_LFSX(t, a, b)	(PPC_INST_LFSX | ___PPC_RT(t) |		\
> -					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_STFSX(s, a, b)	(PPC_INST_STFSX | ___PPC_RS(s) |	\
> -					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_LFDX(t, a, b)	(PPC_INST_LFDX | ___PPC_RT(t) |		\
> -					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_STFDX(s, a, b)	(PPC_INST_STFDX | ___PPC_RS(s) |	\
> -					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_LVX(t, a, b)	(PPC_INST_LVX | ___PPC_RT(t) |		\
> -					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_STVX(s, a, b)	(PPC_INST_STVX | ___PPC_RS(s) |		\
> -					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_LXVD2X(s, a, b)	(PPC_INST_LXVD2X | VSX_XX1((s), R##a, R##b)=
)
> -#define TEST_STXVD2X(s, a, b)	(PPC_INST_STXVD2X | VSX_XX1((s), R##a, R##=
b))
> -#define TEST_ADD(t, a, b)	(PPC_INST_ADD | ___PPC_RT(t) |		\
> -					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_ADD_DOT(t, a, b)	(PPC_INST_ADD | ___PPC_RT(t) |		\
> -					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
> -#define TEST_ADDC(t, a, b)	(PPC_INST_ADDC | ___PPC_RT(t) |		\
> -					___PPC_RA(a) | ___PPC_RB(b))
> -#define TEST_ADDC_DOT(t, a, b)	(PPC_INST_ADDC | ___PPC_RT(t) |		\
> -					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
> -
>  #define MAX_SUBTESTS	16
>=20
>  #define IGNORE_GPR(n)	(0x1UL << (n))
> @@ -104,7 +61,7 @@ static void __init test_ld(void)
>  	regs.gpr[3] =3D (unsigned long) &a;
>=20
>  	/* ld r5, 0(r3) */
> -	stepped =3D emulate_step(&regs, TEST_LD(5, 3, 0));
> +	stepped =3D emulate_step(&regs, PPC_ENCODE_LD(5, 3, 0));
>=20
>  	if (stepped =3D=3D 1 && regs.gpr[5] =3D=3D a)
>  		show_result("ld", "PASS");
> @@ -122,7 +79,7 @@ static void __init test_lwz(void)
>  	regs.gpr[3] =3D (unsigned long) &a;
>=20
>  	/* lwz r5, 0(r3) */
> -	stepped =3D emulate_step(&regs, TEST_LWZ(5, 3, 0));
> +	stepped =3D emulate_step(&regs, PPC_ENCODE_LWZ(5, 3, 0));
>=20
>  	if (stepped =3D=3D 1 && regs.gpr[5] =3D=3D a)
>  		show_result("lwz", "PASS");
> @@ -142,7 +99,7 @@ static void __init test_lwzx(void)
>  	regs.gpr[5] =3D 0x8765;
>=20
>  	/* lwzx r5, r3, r4 */
> -	stepped =3D emulate_step(&regs, TEST_LWZX(5, 3, 4));
> +	stepped =3D emulate_step(&regs, PPC_ENCODE_LWZX(5, 3, 4));
>  	if (stepped =3D=3D 1 && regs.gpr[5] =3D=3D a[2])
>  		show_result("lwzx", "PASS");
>  	else
> @@ -160,7 +117,7 @@ static void __init test_std(void)
>  	regs.gpr[5] =3D 0x5678;
>=20
>  	/* std r5, 0(r3) */
> -	stepped =3D emulate_step(&regs, TEST_STD(5, 3, 0));
> +	stepped =3D emulate_step(&regs, PPC_ENCODE_STD(5, 3, 0));
>  	if (stepped =3D=3D 1 && regs.gpr[5] =3D=3D a)
>  		show_result("std", "PASS");
>  	else
> @@ -185,7 +142,7 @@ static void __init test_ldarx_stdcx(void)
>  	regs.gpr[5] =3D 0x5678;
>=20
>  	/* ldarx r5, r3, r4, 0 */
> -	stepped =3D emulate_step(&regs, TEST_LDARX(5, 3, 4, 0));
> +	stepped =3D emulate_step(&regs, PPC_ENCODE_LDARX(5, 3, 4, 0));
>=20
>  	/*
>  	 * Don't touch 'a' here. Touching 'a' can do Load/store
> @@ -203,7 +160,7 @@ static void __init test_ldarx_stdcx(void)
>  	regs.gpr[5] =3D 0x9ABC;
>=20
>  	/* stdcx. r5, r3, r4 */
> -	stepped =3D emulate_step(&regs, TEST_STDCX(5, 3, 4));
> +	stepped =3D emulate_step(&regs, PPC_ENCODE_STDCX(5, 3, 4));
>=20
>  	/*
>  	 * Two possible scenarios that indicates successful emulation
> @@ -243,7 +200,7 @@ static void __init test_lfsx_stfsx(void)
>  	regs.gpr[4] =3D 0;
>=20
>  	/* lfsx frt10, r3, r4 */
> -	stepped =3D emulate_step(&regs, TEST_LFSX(10, 3, 4));
> +	stepped =3D emulate_step(&regs, PPC_ENCODE_LFSX(10, 3, 4));
>=20
>  	if (stepped =3D=3D 1)
>  		show_result("lfsx", "PASS");
> @@ -256,7 +213,7 @@ static void __init test_lfsx_stfsx(void)
>  	c.a =3D 678.91;
>=20
>  	/* stfsx frs10, r3, r4 */
> -	stepped =3D emulate_step(&regs, TEST_STFSX(10, 3, 4));
> +	stepped =3D emulate_step(&regs, PPC_ENCODE_STFSX(10, 3, 4));
>=20
>  	if (stepped =3D=3D 1 && c.b =3D=3D cached_b)
>  		show_result("stfsx", "PASS");
> @@ -286,7 +243,7 @@ static void __init test_lfdx_stfdx(void)
>  	regs.gpr[4] =3D 0;
>=20
>  	/* lfdx frt10, r3, r4 */
> -	stepped =3D emulate_step(&regs, TEST_LFDX(10, 3, 4));
> +	stepped =3D emulate_step(&regs, PPC_ENCODE_LFDX(10, 3, 4));
>=20
>  	if (stepped =3D=3D 1)
>  		show_result("lfdx", "PASS");
> @@ -299,7 +256,7 @@ static void __init test_lfdx_stfdx(void)
>  	c.a =3D 987654.32;
>=20
>  	/* stfdx frs10, r3, r4 */
> -	stepped =3D emulate_step(&regs, TEST_STFDX(10, 3, 4));
> +	stepped =3D emulate_step(&regs, PPC_ENCODE_STFDX(10, 3, 4));
>=20
>  	if (stepped =3D=3D 1 && c.b =3D=3D cached_b)
>  		show_result("stfdx", "PASS");
> @@ -345,7 +302,7 @@ static void __init test_lvx_stvx(void)
>  	regs.gpr[4] =3D 0;
>=20
>  	/* lvx vrt10, r3, r4 */
> -	stepped =3D emulate_step(&regs, TEST_LVX(10, 3, 4));
> +	stepped =3D emulate_step(&regs, PPC_ENCODE_LVX(10, 3, 4));
>=20
>  	if (stepped =3D=3D 1)
>  		show_result("lvx", "PASS");
> @@ -361,7 +318,7 @@ static void __init test_lvx_stvx(void)
>  	c.b[3] =3D 498532;
>=20
>  	/* stvx vrs10, r3, r4 */
> -	stepped =3D emulate_step(&regs, TEST_STVX(10, 3, 4));
> +	stepped =3D emulate_step(&regs, PPC_ENCODE_STVX(10, 3, 4));
>=20
>  	if (stepped =3D=3D 1 && cached_b[0] =3D=3D c.b[0] && cached_b[1] =3D=3D=
 c.b[1] &&
>  	    cached_b[2] =3D=3D c.b[2] && cached_b[3] =3D=3D c.b[3])
> @@ -402,7 +359,7 @@ static void __init test_lxvd2x_stxvd2x(void)
>  	regs.gpr[4] =3D 0;
>=20
>  	/* lxvd2x vsr39, r3, r4 */
> -	stepped =3D emulate_step(&regs, TEST_LXVD2X(39, 3, 4));
> +	stepped =3D emulate_step(&regs, PPC_ENCODE_LXVD2X(39, R3, R4));
>=20
>  	if (stepped =3D=3D 1 && cpu_has_feature(CPU_FTR_VSX)) {
>  		show_result("lxvd2x", "PASS");
> @@ -422,7 +379,7 @@ static void __init test_lxvd2x_stxvd2x(void)
>  	c.b[3] =3D 4;
>=20
>  	/* stxvd2x vsr39, r3, r4 */
> -	stepped =3D emulate_step(&regs, TEST_STXVD2X(39, 3, 4));
> +	stepped =3D emulate_step(&regs, PPC_ENCODE_STXVD2X(39, R3, R4));
>=20
>  	if (stepped =3D=3D 1 && cached_b[0] =3D=3D c.b[0] && cached_b[1] =3D=3D=
 c.b[1] &&
>  	    cached_b[2] =3D=3D c.b[2] && cached_b[3] =3D=3D c.b[3] &&
> @@ -484,7 +441,7 @@ static struct compute_test compute_tests[] =3D {
>  		.subtests =3D {
>  			{
>  				.descr =3D "RA =3D LONG_MIN, RB =3D LONG_MIN",
> -				.instr =3D TEST_ADD(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D LONG_MIN,
>  					.gpr[22] =3D LONG_MIN,
> @@ -492,7 +449,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D LONG_MIN, RB =3D LONG_MAX",
> -				.instr =3D TEST_ADD(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D LONG_MIN,
>  					.gpr[22] =3D LONG_MAX,
> @@ -500,7 +457,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D LONG_MAX, RB =3D LONG_MAX",
> -				.instr =3D TEST_ADD(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D LONG_MAX,
>  					.gpr[22] =3D LONG_MAX,
> @@ -508,7 +465,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D ULONG_MAX, RB =3D ULONG_MAX",
> -				.instr =3D TEST_ADD(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D ULONG_MAX,
>  					.gpr[22] =3D ULONG_MAX,
> @@ -516,7 +473,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D ULONG_MAX, RB =3D 0x1",
> -				.instr =3D TEST_ADD(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D ULONG_MAX,
>  					.gpr[22] =3D 0x1,
> @@ -524,7 +481,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D INT_MIN, RB =3D INT_MIN",
> -				.instr =3D TEST_ADD(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D INT_MIN,
>  					.gpr[22] =3D INT_MIN,
> @@ -532,7 +489,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D INT_MIN, RB =3D INT_MAX",
> -				.instr =3D TEST_ADD(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D INT_MIN,
>  					.gpr[22] =3D INT_MAX,
> @@ -540,7 +497,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D INT_MAX, RB =3D INT_MAX",
> -				.instr =3D TEST_ADD(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D INT_MAX,
>  					.gpr[22] =3D INT_MAX,
> @@ -548,7 +505,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D UINT_MAX, RB =3D UINT_MAX",
> -				.instr =3D TEST_ADD(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D UINT_MAX,
>  					.gpr[22] =3D UINT_MAX,
> @@ -556,7 +513,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D UINT_MAX, RB =3D 0x1",
> -				.instr =3D TEST_ADD(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D UINT_MAX,
>  					.gpr[22] =3D 0x1,
> @@ -570,7 +527,7 @@ static struct compute_test compute_tests[] =3D {
>  			{
>  				.descr =3D "RA =3D LONG_MIN, RB =3D LONG_MIN",
>  				.flags =3D IGNORE_CCR,
> -				.instr =3D TEST_ADD_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D LONG_MIN,
>  					.gpr[22] =3D LONG_MIN,
> @@ -578,7 +535,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D LONG_MIN, RB =3D LONG_MAX",
> -				.instr =3D TEST_ADD_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D LONG_MIN,
>  					.gpr[22] =3D LONG_MAX,
> @@ -587,7 +544,7 @@ static struct compute_test compute_tests[] =3D {
>  			{
>  				.descr =3D "RA =3D LONG_MAX, RB =3D LONG_MAX",
>  				.flags =3D IGNORE_CCR,
> -				.instr =3D TEST_ADD_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D LONG_MAX,
>  					.gpr[22] =3D LONG_MAX,
> @@ -595,7 +552,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D ULONG_MAX, RB =3D ULONG_MAX",
> -				.instr =3D TEST_ADD_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D ULONG_MAX,
>  					.gpr[22] =3D ULONG_MAX,
> @@ -603,7 +560,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D ULONG_MAX, RB =3D 0x1",
> -				.instr =3D TEST_ADD_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D ULONG_MAX,
>  					.gpr[22] =3D 0x1,
> @@ -611,7 +568,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D INT_MIN, RB =3D INT_MIN",
> -				.instr =3D TEST_ADD_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D INT_MIN,
>  					.gpr[22] =3D INT_MIN,
> @@ -619,7 +576,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D INT_MIN, RB =3D INT_MAX",
> -				.instr =3D TEST_ADD_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D INT_MIN,
>  					.gpr[22] =3D INT_MAX,
> @@ -627,7 +584,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D INT_MAX, RB =3D INT_MAX",
> -				.instr =3D TEST_ADD_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D INT_MAX,
>  					.gpr[22] =3D INT_MAX,
> @@ -635,7 +592,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D UINT_MAX, RB =3D UINT_MAX",
> -				.instr =3D TEST_ADD_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D UINT_MAX,
>  					.gpr[22] =3D UINT_MAX,
> @@ -643,7 +600,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D UINT_MAX, RB =3D 0x1",
> -				.instr =3D TEST_ADD_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADD_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D UINT_MAX,
>  					.gpr[22] =3D 0x1,
> @@ -656,7 +613,7 @@ static struct compute_test compute_tests[] =3D {
>  		.subtests =3D {
>  			{
>  				.descr =3D "RA =3D LONG_MIN, RB =3D LONG_MIN",
> -				.instr =3D TEST_ADDC(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D LONG_MIN,
>  					.gpr[22] =3D LONG_MIN,
> @@ -664,7 +621,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D LONG_MIN, RB =3D LONG_MAX",
> -				.instr =3D TEST_ADDC(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D LONG_MIN,
>  					.gpr[22] =3D LONG_MAX,
> @@ -672,7 +629,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D LONG_MAX, RB =3D LONG_MAX",
> -				.instr =3D TEST_ADDC(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D LONG_MAX,
>  					.gpr[22] =3D LONG_MAX,
> @@ -680,7 +637,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D ULONG_MAX, RB =3D ULONG_MAX",
> -				.instr =3D TEST_ADDC(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D ULONG_MAX,
>  					.gpr[22] =3D ULONG_MAX,
> @@ -688,7 +645,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D ULONG_MAX, RB =3D 0x1",
> -				.instr =3D TEST_ADDC(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D ULONG_MAX,
>  					.gpr[22] =3D 0x1,
> @@ -696,7 +653,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D INT_MIN, RB =3D INT_MIN",
> -				.instr =3D TEST_ADDC(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D INT_MIN,
>  					.gpr[22] =3D INT_MIN,
> @@ -704,7 +661,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D INT_MIN, RB =3D INT_MAX",
> -				.instr =3D TEST_ADDC(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D INT_MIN,
>  					.gpr[22] =3D INT_MAX,
> @@ -712,7 +669,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D INT_MAX, RB =3D INT_MAX",
> -				.instr =3D TEST_ADDC(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D INT_MAX,
>  					.gpr[22] =3D INT_MAX,
> @@ -720,7 +677,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D UINT_MAX, RB =3D UINT_MAX",
> -				.instr =3D TEST_ADDC(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D UINT_MAX,
>  					.gpr[22] =3D UINT_MAX,
> @@ -728,7 +685,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D UINT_MAX, RB =3D 0x1",
> -				.instr =3D TEST_ADDC(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D UINT_MAX,
>  					.gpr[22] =3D 0x1,
> @@ -736,7 +693,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D LONG_MIN | INT_MIN, RB =3D LONG_MIN | INT_MIN",
> -				.instr =3D TEST_ADDC(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D LONG_MIN | (uint)INT_MIN,
>  					.gpr[22] =3D LONG_MIN | (uint)INT_MIN,
> @@ -750,7 +707,7 @@ static struct compute_test compute_tests[] =3D {
>  			{
>  				.descr =3D "RA =3D LONG_MIN, RB =3D LONG_MIN",
>  				.flags =3D IGNORE_CCR,
> -				.instr =3D TEST_ADDC_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D LONG_MIN,
>  					.gpr[22] =3D LONG_MIN,
> @@ -758,7 +715,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D LONG_MIN, RB =3D LONG_MAX",
> -				.instr =3D TEST_ADDC_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D LONG_MIN,
>  					.gpr[22] =3D LONG_MAX,
> @@ -767,7 +724,7 @@ static struct compute_test compute_tests[] =3D {
>  			{
>  				.descr =3D "RA =3D LONG_MAX, RB =3D LONG_MAX",
>  				.flags =3D IGNORE_CCR,
> -				.instr =3D TEST_ADDC_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D LONG_MAX,
>  					.gpr[22] =3D LONG_MAX,
> @@ -775,7 +732,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D ULONG_MAX, RB =3D ULONG_MAX",
> -				.instr =3D TEST_ADDC_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D ULONG_MAX,
>  					.gpr[22] =3D ULONG_MAX,
> @@ -783,7 +740,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D ULONG_MAX, RB =3D 0x1",
> -				.instr =3D TEST_ADDC_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D ULONG_MAX,
>  					.gpr[22] =3D 0x1,
> @@ -791,7 +748,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D INT_MIN, RB =3D INT_MIN",
> -				.instr =3D TEST_ADDC_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D INT_MIN,
>  					.gpr[22] =3D INT_MIN,
> @@ -799,7 +756,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D INT_MIN, RB =3D INT_MAX",
> -				.instr =3D TEST_ADDC_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D INT_MIN,
>  					.gpr[22] =3D INT_MAX,
> @@ -807,7 +764,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D INT_MAX, RB =3D INT_MAX",
> -				.instr =3D TEST_ADDC_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D INT_MAX,
>  					.gpr[22] =3D INT_MAX,
> @@ -815,7 +772,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D UINT_MAX, RB =3D UINT_MAX",
> -				.instr =3D TEST_ADDC_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D UINT_MAX,
>  					.gpr[22] =3D UINT_MAX,
> @@ -823,7 +780,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D UINT_MAX, RB =3D 0x1",
> -				.instr =3D TEST_ADDC_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D UINT_MAX,
>  					.gpr[22] =3D 0x1,
> @@ -831,7 +788,7 @@ static struct compute_test compute_tests[] =3D {
>  			},
>  			{
>  				.descr =3D "RA =3D LONG_MIN | INT_MIN, RB =3D LONG_MIN | INT_MIN",
> -				.instr =3D TEST_ADDC_DOT(20, 21, 22),
> +				.instr =3D PPC_ENCODE_ADDC_DOT(20, 21, 22),
>  				.regs =3D {
>  					.gpr[21] =3D LONG_MIN | (uint)INT_MIN,
>  					.gpr[22] =3D LONG_MIN | (uint)INT_MIN,
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 55d4377ccfae..fdb09e0e16c0 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -45,8 +45,6 @@
>  #define PPC_ADDIS(d, a, i)	EMIT(PPC_INST_ADDIS |			      \
>  				     ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
>  #define PPC_LIS(r, i)		PPC_ADDIS(r, 0, i)
> -#define PPC_STD(r, base, i)	EMIT(PPC_INST_STD | ___PPC_RS(r) |	      \
> -				     ___PPC_RA(base) | ((i) & 0xfffc))
>  #define PPC_STDX(r, base, b)	EMIT(PPC_INST_STDX | ___PPC_RS(r) |	      \
>  				     ___PPC_RA(base) | ___PPC_RB(b))
>  #define PPC_STDU(r, base, i)	EMIT(PPC_INST_STDU | ___PPC_RS(r) |	      \
> @@ -62,12 +60,8 @@
>=20
>  #define PPC_LBZ(r, base, i)	EMIT(PPC_INST_LBZ | ___PPC_RT(r) |	      \
>  				     ___PPC_RA(base) | IMM_L(i))
> -#define PPC_LD(r, base, i)	EMIT(PPC_INST_LD | ___PPC_RT(r) |	      \
> -				     ___PPC_RA(base) | ((i) & 0xfffc))
>  #define PPC_LDX(r, base, b)	EMIT(PPC_INST_LDX | ___PPC_RT(r) |	      \
>  				     ___PPC_RA(base) | ___PPC_RB(b))
> -#define PPC_LWZ(r, base, i)	EMIT(PPC_INST_LWZ | ___PPC_RT(r) |	      \
> -				     ___PPC_RA(base) | IMM_L(i))
>  #define PPC_LHZ(r, base, i)	EMIT(PPC_INST_LHZ | ___PPC_RT(r) |	      \
>  				     ___PPC_RA(base) | IMM_L(i))
>  #define PPC_LHBRX(r, base, b)	EMIT(PPC_INST_LHBRX | ___PPC_RT(r) |	     =
 \
> @@ -100,8 +94,6 @@
>=20
>  #define PPC_SUB(d, a, b)	EMIT(PPC_INST_SUB | ___PPC_RT(d) |	      \
>  				     ___PPC_RB(a) | ___PPC_RA(b))
> -#define PPC_ADD(d, a, b)	EMIT(PPC_INST_ADD | ___PPC_RT(d) |	      \
> -				     ___PPC_RA(a) | ___PPC_RB(b))
>  #define PPC_MULD(d, a, b)	EMIT(PPC_INST_MULLD | ___PPC_RT(d) |	      \
>  				     ___PPC_RA(a) | ___PPC_RB(b))
>  #define PPC_MULW(d, a, b)	EMIT(PPC_INST_MULLW | ___PPC_RT(d) |	      \
> diff --git a/arch/powerpc/net/bpf_jit32.h b/arch/powerpc/net/bpf_jit32.h
> index 4ec2a9f14f84..8a9f16a7262e 100644
> --- a/arch/powerpc/net/bpf_jit32.h
> +++ b/arch/powerpc/net/bpf_jit32.h
> @@ -76,13 +76,13 @@ DECLARE_LOAD_FUNC(sk_load_byte_msh);
>  		else {	PPC_ADDIS(r, base, IMM_HA(i));			      \
>  			PPC_LBZ(r, r, IMM_L(i)); } } while(0)
>=20
> -#define PPC_LD_OFFS(r, base, i) do { if ((i) < 32768) PPC_LD(r, base, i)=
;     \
> +#define _OFFS(r, base, i) do { if ((i) < 32768) EMIT(PPC_ENCODE_LD(r, ba=
se, i));     \
	   ^^^^^
Should be PPC_LD_OFFS. For the next version, please also build ppc32 and=20
booke codebase to confirm that your changes in those areas are fine.

PPC_ENCODE_* also looks quite verbose, so perhaps PPC_ENC_* might be=20
better. Otherwise, this patchset looks good to me and should help reuse=20
some of those macros, especially from the eBPF codebase.

Michael,
Can you let us know if this looks ok to you? Based on your feedback, we=20
will also update the eBPF codebase.


Thanks,
Naveen

