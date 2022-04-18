Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B639504D39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 09:40:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Khf3P0mn0z3bZp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 17:40:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KeDbAnS2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KeDbAnS2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Khf2c1vSLz2xt7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 17:39:19 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23I6KQXM025334; 
 Mon, 18 Apr 2022 07:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=SNgLfpe69QLtVVQ3QJ2iJ0rdiAHfaYYYlyUzcEE0+tw=;
 b=KeDbAnS22FHj0aVkYtlxd+7DQUMOV/4vZdz23uyk4TW6fTA9tHHWcD0FNtpLLum2197O
 a8/jwju0iboq/g3fMfytmoLPXAFncl+eOp6O/8jSyeN53jAMTiiufwoh6YFLZdKz2ROU
 Z/9zokylNg6af1bgRWvoFGOs3+u1gdKJXqeDISR9dMGznU7AeUhFUYyc6qgVVhXfsawa
 gMQo3BIaS3Cbm0wRFCc/HP5bBNuSse+BFhNa+J9dNZKloEWoIwdiBJKUi5NQ3Lanp/3H
 eC+HmYgMVVcV47DawQjEdNR7/XTesETnH9iyMK8eH1z7GeS98ALVBLJrnB42aMX4nk0L IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7cs6tks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 07:38:52 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23I7QH2I014456;
 Mon, 18 Apr 2022 07:38:51 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7cs6tk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 07:38:51 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23I7cnXj011129;
 Mon, 18 Apr 2022 07:38:49 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3ffne91ws2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 07:38:49 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23I7ckZS40698248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Apr 2022 07:38:46 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C1A452052;
 Mon, 18 Apr 2022 07:38:46 +0000 (GMT)
Received: from localhost (unknown [9.43.2.186])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EC7125204E;
 Mon, 18 Apr 2022 07:38:45 +0000 (GMT)
Date: Mon, 18 Apr 2022 13:08:44 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v1 13/22] powerpc/ftrace: Use PPC_RAW_xxx() macros instead
 of opencoding.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>,
 Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Steven Rostedt <rostedt@goodmis.org>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
 <bf3b854ca8f6f5abd29a7b2d9f74a7724fe35e33.1648131740.git.christophe.leroy@csgroup.eu>
In-Reply-To: <bf3b854ca8f6f5abd29a7b2d9f74a7724fe35e33.1648131740.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1650267275.b63dsc56ds.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: btr9vo6aSVtf_PD1FELqLw9mFP5BpH61
X-Proofpoint-ORIG-GUID: wzvMJFnmrfYNqmw3Ovjbhxjz_on_oWNV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=966 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204180045
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
> PPC_RAW_xxx() macros are self explanatory and less error prone
> than open coding.
>=20
> Use them in ftrace.c
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/ppc-opcode.h |  3 +++
>  arch/powerpc/kernel/trace/ftrace.c    | 32 +++++++++------------------
>  2 files changed, 14 insertions(+), 21 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include=
/asm/ppc-opcode.h
> index 82f1f0041c6f..281754aca0a3 100644
> --- a/arch/powerpc/include/asm/ppc-opcode.h
> +++ b/arch/powerpc/include/asm/ppc-opcode.h
> @@ -294,6 +294,8 @@
>  #define PPC_INST_BL			0x48000001
>  #define PPC_INST_BRANCH_COND		0x40800000
>=20
> +#define PPC_INST_OFFSET24_MASK		0x03fffffc

This corresponds to the LI field, per the ISA. See section 8.1.2/1.7:=20
'Instruction Fields'. Would it be better to name it PPC_INST_LI_MASK?

> +
>  /* Prefixes */
>  #define PPC_INST_LFS			0xc0000000
>  #define PPC_INST_STFS			0xd0000000
> @@ -572,6 +574,7 @@
>  #define PPC_RAW_EIEIO()			(0x7c0006ac)
>=20
>  #define PPC_RAW_BRANCH(addr)		(PPC_INST_BRANCH | ((addr) & 0x03fffffc))
> +#define PPC_RAW_BL(offset)		(0x48000001 | ((offset) & PPC_INST_OFFSET24_=
MASK))
>=20
>  /* Deal with instructions that older assemblers aren't aware of */
>  #define	PPC_BCCTR_FLUSH		stringify_in_c(.long PPC_INST_BCCTR_FLUSH)
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tra=
ce/ftrace.c
> index fdc0412c1d8a..afb1d12838c9 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -90,19 +90,19 @@ static int test_24bit_addr(unsigned long ip, unsigned=
 long addr)
>=20
>  static int is_bl_op(ppc_inst_t op)
>  {
> -	return (ppc_inst_val(op) & 0xfc000003) =3D=3D 0x48000001;
> +	return (ppc_inst_val(op) & ~PPC_INST_OFFSET24_MASK) =3D=3D PPC_RAW_BL(0=
);
>  }
>=20
>  static int is_b_op(ppc_inst_t op)
>  {
> -	return (ppc_inst_val(op) & 0xfc000003) =3D=3D 0x48000000;
> +	return (ppc_inst_val(op) & ~PPC_INST_OFFSET24_MASK) =3D=3D PPC_RAW_BRAN=
CH(0);
>  }
>=20
>  static unsigned long find_bl_target(unsigned long ip, ppc_inst_t op)
>  {
>  	int offset;
>=20
> -	offset =3D (ppc_inst_val(op) & 0x03fffffc);
> +	offset =3D (ppc_inst_val(op) & PPC_INST_OFFSET24_MASK);
>  	/* make it signed */
>  	if (offset & 0x02000000)
>  		offset |=3D 0xfe000000;
> @@ -182,7 +182,7 @@ __ftrace_make_nop(struct module *mod,
>  	 * Use a b +8 to jump over the load.
>  	 */
>=20
> -	pop =3D ppc_inst(PPC_INST_BRANCH | 8);	/* b +8 */
> +	pop =3D ppc_inst(PPC_RAW_BRANCH(8));	/* b +8 */
>=20
>  	/*
>  	 * Check what is in the next instruction. We can see ld r2,40(r1), but
> @@ -394,17 +394,8 @@ int ftrace_make_nop(struct module *mod,
>  static int
>  expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
>  {
> -	/*
> -	 * We expect to see:
> -	 *
> -	 * b +8
> -	 * ld r2,XX(r1)
> -	 *
> -	 * The load offset is different depending on the ABI. For simplicity
> -	 * just mask it out when doing the compare.
> -	 */
> -	if (!ppc_inst_equal(op0, ppc_inst(0x48000008)) ||
> -	    (ppc_inst_val(op1) & 0xffff0000) !=3D 0xe8410000)
> +	if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_BRANCH(8))) ||
> +	    !ppc_inst_equal(op1, ppc_inst(PPC_INST_LD_TOC)))

It would be good to move PPC_INST_LD_TOC to ppc-opcode.h

>  		return 0;
>  	return 1;
>  }
> @@ -412,7 +403,6 @@ expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_i=
nst_t op1)
>  static int
>  expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
>  {
> -	/* look for patched "NOP" on ppc64 with -mprofile-kernel or ppc32 */
>  	if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP())))
>  		return 0;
>  	return 1;
> @@ -738,11 +728,11 @@ int __init ftrace_dyn_arch_init(void)
>  	int i;
>  	unsigned int *tramp[] =3D { ftrace_tramp_text, ftrace_tramp_init };
>  	u32 stub_insns[] =3D {
> -		0xe98d0000 | PACATOC,	/* ld      r12,PACATOC(r13)	*/
> -		0x3d8c0000,		/* addis   r12,r12,<high>	*/
> -		0x398c0000,		/* addi    r12,r12,<low>	*/
> -		0x7d8903a6,		/* mtctr   r12			*/
> -		0x4e800420,		/* bctr				*/
> +		PPC_RAW_LD(_R12, _R13, PACATOC),
> +		PPC_RAW_ADDIS(_R12, _R12, 0),
> +		PPC_RAW_ADDIS(_R12, _R12, 0),

This should be PPC_RAW_ADDI.


- Naveen
