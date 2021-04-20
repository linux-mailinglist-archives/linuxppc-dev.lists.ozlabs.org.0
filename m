Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 710BF36529A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 08:52:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZB33JLBz3btS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 16:52:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M+wYIL5o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=M+wYIL5o; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZ9Y4bDgz2xZR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 16:52:01 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13K6YNCh057057; Tue, 20 Apr 2021 02:51:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=Aq0EqwwhBdEA9PLlFVdx4k5MFXzHdCnxje89AZeWel8=;
 b=M+wYIL5og5MPwMyNlsW3FM6XoXCd1+u+q5S7Ow41BXlPgc8pCkxQDw7mt9zulOCgl1wk
 IgUhIvobg254TK2a0Q4P4JhNSi2+07eCRAZQZehZEJXV/d0wYHsVOy9BuVrfuXszSIoM
 PnSAk7Hh37lvuGsDkcVHsxsCcRrZEtYYQh2XZkLb5bGD6h54rPNISZJ7f+/1uxH2z4nY
 Haa5zLcAmVgRT+Y+uU7Gth//IitBDjQW/H1HinT9GMd3woKnEve5K4LMZDjnSILIvoKM
 CVyQ5VO3WOkoUaC3trzJFNkNEXCOe3LTOM8AIFCwfhn3JK04Y05zCBv4s2FmbFrzDIOA 0Q== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 381qreb26f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 02:51:46 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13K6ifKJ002427;
 Tue, 20 Apr 2021 06:51:44 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 37yqa88tmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 06:51:44 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13K6pgiw31457642
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 06:51:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DBC511C058;
 Tue, 20 Apr 2021 06:51:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59E1F11C04C;
 Tue, 20 Apr 2021 06:51:41 +0000 (GMT)
Received: from localhost (unknown [9.85.73.109])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Apr 2021 06:51:41 +0000 (GMT)
Date: Tue, 20 Apr 2021 12:21:39 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v1 2/2] powerpc: Enable OPTPROBES on PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <e1723a06c5a26398ff03cb669ec99de2516045a9.1617701875.git.christophe.leroy@csgroup.eu>
 <28730d147adeaa6c2d0c98d0aa9e17e9e4bd043a.1617701875.git.christophe.leroy@csgroup.eu>
In-Reply-To: <28730d147adeaa6c2d0c98d0aa9e17e9e4bd043a.1617701875.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1618900760.son2fwciv1.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DlUI9WWvk8UzPSz_h9wQs6cua1lmYW8P
X-Proofpoint-ORIG-GUID: DlUI9WWvk8UzPSz_h9wQs6cua1lmYW8P
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_01:2021-04-19,
 2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200051
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
> For that, create a 32 bits version of patch_imm64_load_insns()
> and create a patch_imm_load_insns() which calls
> patch_imm32_load_insns() on PPC32 and patch_imm64_load_insns()
> on PPC64.
>=20
> Adapt optprobes_head.S for PPC32. Use PPC_LL/PPC_STL macros instead
> of raw ld/std, opt out things linked to paca and use stmw/lmw to
> save/restore registers.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/Kconfig                 |  2 +-
>  arch/powerpc/kernel/optprobes.c      | 24 +++++++++++++--
>  arch/powerpc/kernel/optprobes_head.S | 46 +++++++++++++++++++---------
>  3 files changed, 53 insertions(+), 19 deletions(-)

Thanks for adding support for ppc32. It is good to see that it works=20
without too many changes.

>=20
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index c1344c05226c..49b538e54efb 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -227,7 +227,7 @@ config PPC
>  	select HAVE_MOD_ARCH_SPECIFIC
>  	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
>  	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if PPC64 && PPC_BOOK3S && SMP
> -	select HAVE_OPTPROBES			if PPC64
> +	select HAVE_OPTPROBES
>  	select HAVE_PERF_EVENTS
>  	select HAVE_PERF_EVENTS_NMI		if PPC64
>  	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS=
_NMI && !HAVE_HARDLOCKUP_DETECTOR_ARCH
> diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optpro=
bes.c
> index 58fdb9f66e0f..cdf87086fa33 100644
> --- a/arch/powerpc/kernel/optprobes.c
> +++ b/arch/powerpc/kernel/optprobes.c
> @@ -141,11 +141,21 @@ void arch_remove_optimized_kprobe(struct optimized_=
kprobe *op)
>  	}
>  }
>=20
> +static void patch_imm32_load_insns(unsigned long val, int reg, kprobe_op=
code_t *addr)
> +{
> +	patch_instruction((struct ppc_inst *)addr,
> +			  ppc_inst(PPC_RAW_LIS(reg, IMM_H(val))));
> +	addr++;
> +
> +	patch_instruction((struct ppc_inst *)addr,
> +			  ppc_inst(PPC_RAW_ORI(reg, reg, IMM_L(val))));
> +}
> +
>  /*
>   * Generate instructions to load provided immediate 64-bit value
>   * to register 'reg' and patch these instructions at 'addr'.
>   */
> -static void patch_imm64_load_insns(unsigned long val, int reg, kprobe_op=
code_t *addr)
> +static void patch_imm64_load_insns(unsigned long long val, int reg, kpro=
be_opcode_t *addr)

Do you really need this?

>  {
>  	/* lis reg,(op)@highest */
>  	patch_instruction((struct ppc_inst *)addr,
> @@ -177,6 +187,14 @@ static void patch_imm64_load_insns(unsigned long val=
, int reg, kprobe_opcode_t *
>  				   ___PPC_RS(reg) | (val & 0xffff)));
>  }
>=20
> +static void patch_imm_load_insns(unsigned long val, int reg, kprobe_opco=
de_t *addr)
> +{
> +	if (IS_ENABLED(CONFIG_PPC64))
> +		patch_imm64_load_insns(val, reg, addr);
> +	else
> +		patch_imm32_load_insns(val, reg, addr);
> +}
> +
>  int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kp=
robe *p)
>  {
>  	struct ppc_inst branch_op_callback, branch_emulate_step, temp;
> @@ -230,7 +248,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kp=
robe *op, struct kprobe *p)
>  	 * Fixup the template with instructions to:
>  	 * 1. load the address of the actual probepoint
>  	 */
> -	patch_imm64_load_insns((unsigned long)op, 3, buff + TMPL_OP_IDX);
> +	patch_imm_load_insns((unsigned long)op, 3, buff + TMPL_OP_IDX);
>=20
>  	/*
>  	 * 2. branch to optimized_callback() and emulate_step()
> @@ -264,7 +282,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kp=
robe *op, struct kprobe *p)
>  	 * 3. load instruction to be emulated into relevant register, and
>  	 */
>  	temp =3D ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
> -	patch_imm64_load_insns(ppc_inst_as_ulong(temp), 4, buff + TMPL_INSN_IDX=
);
> +	patch_imm_load_insns(ppc_inst_as_ulong(temp), 4, buff + TMPL_INSN_IDX);
>=20
>  	/*
>  	 * 4. branch back from trampoline
> diff --git a/arch/powerpc/kernel/optprobes_head.S b/arch/powerpc/kernel/o=
ptprobes_head.S
> index ff8ba4d3824d..49f31e554573 100644
> --- a/arch/powerpc/kernel/optprobes_head.S
> +++ b/arch/powerpc/kernel/optprobes_head.S
> @@ -30,39 +30,47 @@ optinsn_slot:
>  	.global optprobe_template_entry
>  optprobe_template_entry:
>  	/* Create an in-memory pt_regs */
> -	stdu	r1,-INT_FRAME_SIZE(r1)
> +	PPC_STLU	r1,-INT_FRAME_SIZE(r1)
>  	SAVE_GPR(0,r1)
>  	/* Save the previous SP into stack */
>  	addi	r0,r1,INT_FRAME_SIZE
> -	std	r0,GPR1(r1)
> +	PPC_STL	r0,GPR1(r1)
> +#ifdef CONFIG_PPC64
>  	SAVE_10GPRS(2,r1)
>  	SAVE_10GPRS(12,r1)
>  	SAVE_10GPRS(22,r1)
> +#else
> +	stmw	r2, GPR2(r1)
> +#endif
>  	/* Save SPRS */
>  	mfmsr	r5
> -	std	r5,_MSR(r1)
> +	PPC_STL	r5,_MSR(r1)
>  	li	r5,0x700
> -	std	r5,_TRAP(r1)
> +	PPC_STL	r5,_TRAP(r1)
>  	li	r5,0
> -	std	r5,ORIG_GPR3(r1)
> -	std	r5,RESULT(r1)
> +	PPC_STL	r5,ORIG_GPR3(r1)
> +	PPC_STL	r5,RESULT(r1)
>  	mfctr	r5
> -	std	r5,_CTR(r1)
> +	PPC_STL	r5,_CTR(r1)
>  	mflr	r5
> -	std	r5,_LINK(r1)
> +	PPC_STL	r5,_LINK(r1)
>  	mfspr	r5,SPRN_XER
> -	std	r5,_XER(r1)
> +	PPC_STL	r5,_XER(r1)
>  	mfcr	r5
> -	std	r5,_CCR(r1)
> +	PPC_STL	r5,_CCR(r1)
> +#ifdef CONFIG_PPC64
>  	lbz     r5,PACAIRQSOFTMASK(r13)
>  	std     r5,SOFTE(r1)
> +#endif
>=20
>  	/*
>  	 * We may get here from a module, so load the kernel TOC in r2.
>  	 * The original TOC gets restored when pt_regs is restored
>  	 * further below.
>  	 */
> +#ifdef CONFIG_PPC64
>  	ld	r2,PACATOC(r13)
> +#endif

Are the ISA and ABI documents for ppc32 available publicly? I would have=20
thought that the TOC issues apply to ppc32 as well, but want to=20
understand why this isn't a problem there.

>=20
>  	.global optprobe_template_op_address
>  optprobe_template_op_address:
> @@ -72,9 +80,11 @@ optprobe_template_op_address:
>  	 */
>  	nop
>  	nop
> +#ifdef CONFIG_PPC64
>  	nop
>  	nop
>  	nop
> +#endif
>  	/* 2. pt_regs pointer in r4 */
>  	addi	r4,r1,STACK_FRAME_OVERHEAD
>=20
> @@ -94,9 +104,11 @@ optprobe_template_insn:
>  	/* 2, Pass instruction to be emulated in r4 */
>  	nop
>  	nop
> +#ifdef CONFIG_PPC64
>  	nop
>  	nop
>  	nop
> +#endif

It would be nice to put these behind a macro so as to avoid these #ifdef=20
blocks here, as well as with the register save/restore sequence.

- Naveen

