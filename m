Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A379E504D5D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 10:00:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhfVm2dyDz3bd2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 18:00:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ViRaPF15;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ViRaPF15; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhfV23d3Sz2xSN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 17:59:38 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23I3NvRY008833; 
 Mon, 18 Apr 2022 07:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=5VXAVkLMdiRAvnu6UsBA33RTxwDxudhMyjKEXGud+nY=;
 b=ViRaPF156rq0vJpUbLZpLkCvy6tI+rguia4+E6vCcc2sS3Jk1lTl6nr19JunJB0aHGhf
 VlqX/63YmeGF+q6JypJ+RVHFKOpfIsDYlKe0UeHN4Z+GMiCJOrNWG3UjsZGRYEW7+2LK
 FAMPSw/OC5vPJr+4cXRMmkuElmnn+9vSC3U5cnXBv7/yKrqfSzxwnHptDc109BjBNLqh
 dd0DxVvRzlasdtEK9S+6xj2n/u+hIbuGHXzI+DSJm3rtQzaAjUHzN6wV+h85xlliRfUp
 NpLocSKLLkDKGFe7vJMuGGvgZmk4F7Ua16u1BMrqfZs1wc9qzH/QkhW3tFveX8rtbkU6 Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7vmxs6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 07:59:13 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23I7bvG4023451;
 Mon, 18 Apr 2022 07:59:13 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7vmxs62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 07:59:13 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23I7lU5O030132;
 Mon, 18 Apr 2022 07:59:10 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3ffn2htex4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 07:59:10 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23I7xIGe45416738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Apr 2022 07:59:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E9E652051;
 Mon, 18 Apr 2022 07:59:08 +0000 (GMT)
Received: from localhost (unknown [9.43.2.186])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id BD5A35204F;
 Mon, 18 Apr 2022 07:59:07 +0000 (GMT)
Date: Mon, 18 Apr 2022 13:29:06 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v1 16/22] powerpc/ftrace: Minimise number of #ifdefs
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>,
 Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Steven Rostedt <rostedt@goodmis.org>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
 <7ef4015badd5f1861cfc327a7641c84e0e5630ca.1648131740.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7ef4015badd5f1861cfc327a7641c84e0e5630ca.1648131740.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1650267933.ewyj9l63lo.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ajpjqq7weAvc-b88KW54bK1G566jtRwz
X-Proofpoint-GUID: Hu6_LPa22Hn4S1YFSzTSU07868K2i3T0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=756 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> A lot of #ifdefs can be replaced by IS_ENABLED()
>=20
> Do so.
>=20
> This requires to have kernel_toc_addr() defined at all time
> and PPC_INST_LD_TOC as well.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/code-patching.h |   2 -
>  arch/powerpc/include/asm/module.h        |   2 -
>  arch/powerpc/include/asm/sections.h      |  24 +--
>  arch/powerpc/kernel/trace/ftrace.c       | 201 ++++++++++++-----------
>  4 files changed, 113 insertions(+), 116 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/incl=
ude/asm/code-patching.h
> index 4260e89f62b1..071fcbec31c5 100644
> --- a/arch/powerpc/include/asm/code-patching.h
> +++ b/arch/powerpc/include/asm/code-patching.h
> @@ -217,7 +217,6 @@ static inline unsigned long ppc_kallsyms_lookup_name(=
const char *name)
>  	return addr;
>  }
>=20
> -#ifdef CONFIG_PPC64
>  /*
>   * Some instruction encodings commonly used in dynamic ftracing
>   * and function live patching.
> @@ -234,6 +233,5 @@ static inline unsigned long ppc_kallsyms_lookup_name(=
const char *name)
>=20
>  /* usually preceded by a mflr r0 */
>  #define PPC_INST_STD_LR		PPC_RAW_STD(_R0, _R1, PPC_LR_STKOFF)
> -#endif /* CONFIG_PPC64 */
>=20
>  #endif /* _ASM_POWERPC_CODE_PATCHING_H */
> diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm=
/module.h
> index e6f5963fd96e..700d7ecd9012 100644
> --- a/arch/powerpc/include/asm/module.h
> +++ b/arch/powerpc/include/asm/module.h
> @@ -41,9 +41,7 @@ struct mod_arch_specific {
>=20
>  #ifdef CONFIG_FUNCTION_TRACER
>  	unsigned long tramp;
> -#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>  	unsigned long tramp_regs;
> -#endif
>  #endif
>=20
>  	/* List of BUG addresses, source line numbers and filenames */
> diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/a=
sm/sections.h
> index 8be2c491c733..6980eaeb16fe 100644
> --- a/arch/powerpc/include/asm/sections.h
> +++ b/arch/powerpc/include/asm/sections.h
> @@ -29,18 +29,6 @@ extern char start_virt_trampolines[];
>  extern char end_virt_trampolines[];
>  #endif
>=20
> -/*
> - * This assumes the kernel is never compiled -mcmodel=3Dsmall or
> - * the total .toc is always less than 64k.
> - */
> -static inline unsigned long kernel_toc_addr(void)
> -{
> -	unsigned long toc_ptr;
> -
> -	asm volatile("mr %0, 2" : "=3Dr" (toc_ptr));
> -	return toc_ptr;
> -}
> -
>  static inline int overlaps_interrupt_vector_text(unsigned long start,
>  							unsigned long end)
>  {
> @@ -60,5 +48,17 @@ static inline int overlaps_kernel_text(unsigned long s=
tart, unsigned long end)
>=20
>  #endif
>=20
> +/*
> + * This assumes the kernel is never compiled -mcmodel=3Dsmall or
> + * the total .toc is always less than 64k.
> + */
> +static inline unsigned long kernel_toc_addr(void)
> +{
> +	unsigned long toc_ptr;
> +
> +	asm volatile("mr %0, 2" : "=3Dr" (toc_ptr));
> +	return toc_ptr;
> +}
> +
>  #endif /* __KERNEL__ */
>  #endif	/* _ASM_POWERPC_SECTIONS_H */
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tra=
ce/ftrace.c
> index ffedf8c82ea8..4dd30e396026 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -150,55 +150,55 @@ __ftrace_make_nop(struct module *mod,
>  		return -EINVAL;
>  	}
>=20
> -	/* When using -mkernel_profile or PPC32 there is no load to jump over *=
/
> -	pop =3D ppc_inst(PPC_RAW_NOP());
> +	if (IS_ENABLED(CONFIG_MPROFILE_KERNEL)) {
> +		/* When using -mkernel_profile or PPC32 there is no load to jump over =
*/
> +		pop =3D ppc_inst(PPC_RAW_NOP());

Why move this inside the if() statement? You can keep this out and drop=20
the else clause.

- Naveen
