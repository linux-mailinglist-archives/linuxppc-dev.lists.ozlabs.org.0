Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 654C7504CC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 08:41:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhclW2LC3z3bdM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 16:41:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IzvW5Ok9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IzvW5Ok9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Khckk6w6lz2xSN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 16:40:30 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23I5WvHH007123; 
 Mon, 18 Apr 2022 06:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=E2Zn3AY9jysDVP1+aZfS54RO47VY1Tec/MLxakNq/V0=;
 b=IzvW5Ok9yWpGCx3yt21doL5RealkfYdv+X67MrWV/f2AcBvl5rEAHVqTmzHKNwkwUoHk
 wvyxWFWd1Bk7UnF9Cgn1C86G0bpaxq6Jr8jHd6iegBRaZvaK3h5bsXDiF7csJUxX5gbM
 lmfrYraacYsP4n/GmUbdGS9qdvtny4EivQi4JATnp3XULLniKHt2eXgA+cJcV+m1EyzK
 LWjgVLSqMpBoRnWIb+Uiv+356LcbRSjDV5/616eAvGfp0e27KbACSBYKEB1wVgjt9Yp7
 a2L2VdIleRKl7BWrn45EPQCXNtvVixL+QAksKxTTxXfDz6FMtkgQHKPAFG2yk3d9TZxe 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fg77hx1kk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 06:40:11 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23I6eBPD005441;
 Mon, 18 Apr 2022 06:40:11 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fg77hx1jt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 06:40:11 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23I6d201007638;
 Mon, 18 Apr 2022 06:40:09 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3ffn2hsvsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 06:40:09 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23I6eH9X45482248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Apr 2022 06:40:17 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2211442045;
 Mon, 18 Apr 2022 06:40:07 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D26D4203F;
 Mon, 18 Apr 2022 06:40:06 +0000 (GMT)
Received: from localhost (unknown [9.43.2.186])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Apr 2022 06:40:06 +0000 (GMT)
Date: Mon, 18 Apr 2022 12:10:04 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v1 08/22] powerpc/ftrace: Make __ftrace_make_{nop/call}()
 common to PPC32 and PPC64
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>,
 Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Steven Rostedt <rostedt@goodmis.org>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
 <fb60b19f154db8132a00c2df7aca7db3e85603b5.1648131740.git.christophe.leroy@csgroup.eu>
In-Reply-To: <fb60b19f154db8132a00c2df7aca7db3e85603b5.1648131740.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1650262952.h2adiu8czw.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZtEeHyqeNCRQxQEjOnsSbQ1pNk3Vxv9c
X-Proofpoint-ORIG-GUID: AR7z4CLw4NJSZkjawAleBSiPhNfPK8Q_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204180037
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
> Since c93d4f6ecf4b ("powerpc/ftrace: Add module_trampoline_target()
> for PPC32"), __ftrace_make_nop() for PPC32 is very similar to the
> one for PPC64.
>=20
> Same for __ftrace_make_call().
>=20
> Make them common.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/trace/ftrace.c | 108 +++--------------------------
>  1 file changed, 8 insertions(+), 100 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tra=
ce/ftrace.c
> index 1b05d33f96c6..2c7e42e439bb 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -114,7 +114,6 @@ static unsigned long find_bl_target(unsigned long ip,=
 ppc_inst_t op)
>  }
>=20
>  #ifdef CONFIG_MODULES
> -#ifdef CONFIG_PPC64
>  static int
>  __ftrace_make_nop(struct module *mod,
>  		  struct dyn_ftrace *rec, unsigned long addr)
> @@ -154,10 +153,11 @@ __ftrace_make_nop(struct module *mod,
>  		return -EINVAL;
>  	}
>=20
> -#ifdef CONFIG_MPROFILE_KERNEL
> -	/* When using -mkernel_profile there is no load to jump over */
> +	/* When using -mkernel_profile or PPC32 there is no load to jump over *=
/
                      -mprofile-kernel

Since you are modifying that line anyway ^^


>  	pop =3D ppc_inst(PPC_RAW_NOP());
>=20
> +#ifdef CONFIG_PPC64
> +#ifdef CONFIG_MPROFILE_KERNEL
>  	if (copy_inst_from_kernel_nofault(&op, (void *)(ip - 4))) {
>  		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
>  		return -EFAULT;
> @@ -201,6 +201,7 @@ __ftrace_make_nop(struct module *mod,
>  		return -EINVAL;
>  	}
>  #endif /* CONFIG_MPROFILE_KERNEL */
> +#endif /* PPC64 */
>=20
>  	if (patch_instruction((u32 *)ip, pop)) {
>  		pr_err("Patching NOP failed.\n");
> @@ -209,48 +210,6 @@ __ftrace_make_nop(struct module *mod,
>=20
>  	return 0;
>  }
> -
> -#else /* !PPC64 */
> -static int
> -__ftrace_make_nop(struct module *mod,
> -		  struct dyn_ftrace *rec, unsigned long addr)
> -{
> -	ppc_inst_t op;
> -	unsigned long ip =3D rec->ip;
> -	unsigned long tramp, ptr;
> -
> -	if (copy_from_kernel_nofault(&op, (void *)ip, MCOUNT_INSN_SIZE))
> -		return -EFAULT;
> -
> -	/* Make sure that that this is still a 24bit jump */
> -	if (!is_bl_op(op)) {
> -		pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
> -		return -EINVAL;
> -	}
> -
> -	/* lets find where the pointer goes */
> -	tramp =3D find_bl_target(ip, op);
> -
> -	/* Find where the trampoline jumps to */
> -	if (module_trampoline_target(mod, tramp, &ptr)) {
> -		pr_err("Failed to get trampoline target\n");
> -		return -EFAULT;
> -	}
> -
> -	if (ptr !=3D addr) {
> -		pr_err("Trampoline location %08lx does not match addr\n",
> -		       tramp);
> -		return -EINVAL;
> -	}
> -
> -	op =3D ppc_inst(PPC_RAW_NOP());
> -
> -	if (patch_instruction((u32 *)ip, op))
> -		return -EPERM;
> -
> -	return 0;
> -}
> -#endif /* PPC64 */
>  #endif /* CONFIG_MODULES */
>=20
>  static unsigned long find_ftrace_tramp(unsigned long ip)
> @@ -437,13 +396,12 @@ int ftrace_make_nop(struct module *mod,
>  }
>=20
>  #ifdef CONFIG_MODULES
> -#ifdef CONFIG_PPC64
>  /*
>   * Examine the existing instructions for __ftrace_make_call.
>   * They should effectively be a NOP, and follow formal constraints,
>   * depending on the ABI. Return false if they don't.
>   */
> -#ifndef CONFIG_MPROFILE_KERNEL
> +#ifndef CONFIG_DYNAMIC_FTRACE_WITH_REGS

It is better to gate this on PPC64_ELF_ABI_v1

>  static int
>  expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
>  {
> @@ -465,7 +423,7 @@ expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_i=
nst_t op1)
>  static int
>  expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
>  {
> -	/* look for patched "NOP" on ppc64 with -mprofile-kernel */
> +	/* look for patched "NOP" on ppc64 with -mprofile-kernel or ppc32 */
>  	if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP())))
>  		return 0;
>  	return 1;
> @@ -484,8 +442,10 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned =
long addr)
>  	if (copy_inst_from_kernel_nofault(op, ip))
>  		return -EFAULT;
>=20
> +#ifndef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>  	if (copy_inst_from_kernel_nofault(op + 1, ip + 4))
>  		return -EFAULT;
> +#endif

Here too...


- Naveen

