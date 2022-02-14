Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B30DA4B591D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 18:53:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyBdv1db4z3cHS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 04:53:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fewXgRXs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fewXgRXs; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyBd63scKz3bYq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 04:52:25 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EFhdPB012468; 
 Mon, 14 Feb 2022 17:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=fRPquwuW8qfyOuoD5PevBKzhtO7/iuKYb7YoEXWc2zY=;
 b=fewXgRXsLQhcvs481DRc1VIa9vX7Qv/66B8bzHiTZD6FMUQsCJvPf5vAIFdg0p/5v7C1
 cC8JVZpL9RygXWZqlrRAGFRONPbaDv/2/9j5rl0ndWMthOIx/MEUuZOOHYP5CJezRF37
 WdZAf3SokDrXknfATw/tXmqIzalzviV3VVMR57KQOwIJi0MOLk6BAn4EhD4g+Y9mFzXG
 iefN5h1XiTAN27jk68GWZGcj8PqngOWovnZyHvzEGAJuQKx2otf8uT6VrdNoOqJnkoQe
 mdzvqadb8ESqn2RUjsezCPvj1s+J2uvDNotim4DoJwqJ9DPj62rUMsEo0+ZztwRuNkAW dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7c4e5a24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 17:52:03 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21EHmYgb024211;
 Mon, 14 Feb 2022 17:52:03 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7c4e5a1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 17:52:03 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EHbtVT026816;
 Mon, 14 Feb 2022 17:52:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64h9qrpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 17:52:01 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21EHfeTi46137692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 17:41:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1890DA4065;
 Mon, 14 Feb 2022 17:51:59 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1017A4060;
 Mon, 14 Feb 2022 17:51:58 +0000 (GMT)
Received: from localhost (unknown [9.43.124.167])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 17:51:58 +0000 (GMT)
Date: Mon, 14 Feb 2022 23:21:56 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 12/13] powerpc/ftrace: Prepare ftrace_64_mprofile.S for
 reuse by PPC32
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Jiri Kosina
 <jikos@kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Miroslav Benes <mbenes@suse.cz>, Ingo Molnar
 <mingo@redhat.com>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <82a732915dc71ee766e31809350939331944006d.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <82a732915dc71ee766e31809350939331944006d.1640017960.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1644860537.hyunv1mld0.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HHrAwynjC0tZxVMXEag7CCqPQklgAug1
X-Proofpoint-ORIG-GUID: 0pFoWuFbKJHIjrYfR2q_vw0OCvLFxAEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_07,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140104
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
Cc: "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
> PPC64 mprofile versions and PPC32 are very similar.
>=20
> Modify PPC64 version so that if can be reused for PPC32.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../powerpc/kernel/trace/ftrace_64_mprofile.S | 73 +++++++++++++------
>  1 file changed, 51 insertions(+), 22 deletions(-)

While I agree that ppc32 and -mprofile-kernel ftrace code are very=20
similar, I think this patch adds way too many #ifdefs. IMHO, this
makes the resultant code quite difficult to follow.


- Naveen

>=20
> diff --git a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S b/arch/powerp=
c/kernel/trace/ftrace_64_mprofile.S
> index 6071e0122797..56da60e98327 100644
> --- a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
> +++ b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
> @@ -34,13 +34,16 @@
>   */
>  _GLOBAL(ftrace_regs_caller)
>  	/* Save the original return address in A's stack frame */
> -	std	r0,LRSAVE(r1)
> +#ifdef CONFIG_MPROFILE_KERNEL
> +	PPC_STL	r0,LRSAVE(r1)
> +#endif
> =20
>  	/* Create our stack frame + pt_regs */
> -	stdu	r1,-SWITCH_FRAME_SIZE(r1)
> +	PPC_STLU	r1,-SWITCH_FRAME_SIZE(r1)
> =20
>  	/* Save all gprs to pt_regs */
>  	SAVE_GPR(0, r1)
> +#ifdef CONFIG_PPC64
>  	SAVE_GPRS(2, 11, r1)
> =20
>  	/* Ok to continue? */
> @@ -49,10 +52,13 @@ _GLOBAL(ftrace_regs_caller)
>  	beq	ftrace_no_trace
> =20
>  	SAVE_GPRS(12, 31, r1)
> +#else
> +	stmw	r2, GPR2(r1)
> +#endif
> =20
>  	/* Save previous stack pointer (r1) */
>  	addi	r8, r1, SWITCH_FRAME_SIZE
> -	std	r8, GPR1(r1)
> +	PPC_STL	r8, GPR1(r1)
> =20
>  	/* Load special regs for save below */
>  	mfmsr   r8
> @@ -63,10 +69,11 @@ _GLOBAL(ftrace_regs_caller)
>  	/* Get the _mcount() call site out of LR */
>  	mflr	r7
>  	/* Save it as pt_regs->nip */
> -	std     r7, _NIP(r1)
> +	PPC_STL	r7, _NIP(r1)
>  	/* Save the read LR in pt_regs->link */
> -	std     r0, _LINK(r1)
> +	PPC_STL	r0, _LINK(r1)
> =20
> +#ifdef CONFIG_PPC64
>  	/* Save callee's TOC in the ABI compliant location */
>  	std	r2, 24(r1)
>  	ld	r2,PACATOC(r13)	/* get kernel TOC in r2 */
> @@ -74,8 +81,12 @@ _GLOBAL(ftrace_regs_caller)
>  	addis	r3,r2,function_trace_op@toc@ha
>  	addi	r3,r3,function_trace_op@toc@l
>  	ld	r5,0(r3)
> +#else
> +	lis	r3,function_trace_op@ha
> +	lwz	r5,function_trace_op@l(r3)
> +#endif
> =20
> -#ifdef CONFIG_LIVEPATCH
> +#ifdef CONFIG_LIVEPATCH_64
>  	mr	r14,r7		/* remember old NIP */
>  #endif
>  	/* Calculate ip from nip-4 into r3 for call below */
> @@ -85,10 +96,10 @@ _GLOBAL(ftrace_regs_caller)
>  	mr	r4, r0
> =20
>  	/* Save special regs */
> -	std     r8, _MSR(r1)
> -	std     r9, _CTR(r1)
> -	std     r10, _XER(r1)
> -	std     r11, _CCR(r1)
> +	PPC_STL	r8, _MSR(r1)
> +	PPC_STL	r9, _CTR(r1)
> +	PPC_STL	r10, _XER(r1)
> +	PPC_STL	r11, _CCR(r1)
> =20
>  	/* Load &pt_regs in r6 for call below */
>  	addi    r6, r1 ,STACK_FRAME_OVERHEAD
> @@ -100,27 +111,32 @@ ftrace_regs_call:
>  	nop
> =20
>  	/* Load ctr with the possibly modified NIP */
> -	ld	r3, _NIP(r1)
> +	PPC_LL	r3, _NIP(r1)
>  	mtctr	r3
> -#ifdef CONFIG_LIVEPATCH
> +#ifdef CONFIG_LIVEPATCH_64
>  	cmpd	r14, r3		/* has NIP been altered? */
>  #endif
> =20
>  	/* Restore gprs */
> -	REST_GPR(0, r1)
> +#ifdef CONFIG_PPC64
>  	REST_GPRS(2, 31, r1)
> +#else
> +	lmw	r2, GPR2(r1)
> +#endif
> =20
>  	/* Restore possibly modified LR */
> -	ld	r0, _LINK(r1)
> +	PPC_LL	r0, _LINK(r1)
>  	mtlr	r0
> =20
> +#ifdef CONFIG_PPC64
>  	/* Restore callee's TOC */
>  	ld	r2, 24(r1)
> +#endif
> =20
>  	/* Pop our stack frame */
>  	addi r1, r1, SWITCH_FRAME_SIZE
> =20
> -#ifdef CONFIG_LIVEPATCH
> +#ifdef CONFIG_LIVEPATCH_64
>          /* Based on the cmpd above, if the NIP was altered handle livepa=
tch */
>  	bne-	livepatch_handler
>  #endif
> @@ -129,6 +145,7 @@ ftrace_regs_call:
>  _GLOBAL(ftrace_stub)
>  	blr
> =20
> +#ifdef CONFIG_PPC64
>  ftrace_no_trace:
>  	mflr	r3
>  	mtctr	r3
> @@ -136,25 +153,31 @@ ftrace_no_trace:
>  	addi	r1, r1, SWITCH_FRAME_SIZE
>  	mtlr	r0
>  	bctr
> +#endif
> =20
>  _GLOBAL(ftrace_caller)
>  	/* Save the original return address in A's stack frame */
> -	std	r0, LRSAVE(r1)
> +#ifdef CONFIG_MPROFILE_KERNEL
> +	PPC_STL	r0, LRSAVE(r1)
> +#endif
> =20
>  	/* Create our stack frame + pt_regs */
> -	stdu	r1, -SWITCH_FRAME_SIZE(r1)
> +	PPC_STLU	r1, -SWITCH_FRAME_SIZE(r1)
> =20
>  	/* Save all gprs to pt_regs */
>  	SAVE_GPRS(3, 10, r1)
> =20
> +#ifdef CONFIG_PPC64
>  	lbz	r3, PACA_FTRACE_ENABLED(r13)
>  	cmpdi	r3, 0
>  	beq	ftrace_no_trace
> +#endif
> =20
>  	/* Get the _mcount() call site out of LR */
>  	mflr	r7
> -	std     r7, _NIP(r1)
> +	PPC_STL     r7, _NIP(r1)
> =20
> +#ifdef CONFIG_PPC64
>  	/* Save callee's TOC in the ABI compliant location */
>  	std	r2, 24(r1)
>  	ld	r2, PACATOC(r13)	/* get kernel TOC in r2 */
> @@ -162,6 +185,10 @@ _GLOBAL(ftrace_caller)
>  	addis	r3, r2, function_trace_op@toc@ha
>  	addi	r3, r3, function_trace_op@toc@l
>  	ld	r5, 0(r3)
> +#else
> +	lis	r3,function_trace_op@ha
> +	lwz	r5,function_trace_op@l(r3)
> +#endif
> =20
>  #ifdef CONFIG_LIVEPATCH_64
>  	SAVE_GPR(14, r1)
> @@ -171,7 +198,7 @@ _GLOBAL(ftrace_caller)
>  	subi    r3, r7, MCOUNT_INSN_SIZE
> =20
>  	/* Put the original return address in r4 as parent_ip */
> -	std	r0, _LINK(r1)
> +	PPC_STL	r0, _LINK(r1)
>  	mr	r4, r0
> =20
>  	/* Load &pt_regs in r6 for call below */
> @@ -183,7 +210,7 @@ ftrace_call:
>  	bl	ftrace_stub
>  	nop
> =20
> -	ld	r3, _NIP(r1)
> +	PPC_LL	r3, _NIP(r1)
>  	mtctr	r3
>  #ifdef CONFIG_LIVEPATCH_64
>  	cmpd	r14, r3		/* has NIP been altered? */
> @@ -193,11 +220,13 @@ ftrace_call:
>  	/* Restore gprs */
>  	REST_GPRS(3, 10, r1)
> =20
> +#ifdef CONFIG_PPC64
>  	/* Restore callee's TOC */
>  	ld	r2, 24(r1)
> +#endif
> =20
>  	/* Restore possibly modified LR */
> -	ld	r0, _LINK(r1)
> +	PPC_LL	r0, _LINK(r1)
>  	mtlr	r0
> =20
>  	/* Pop our stack frame */
> @@ -209,7 +238,7 @@ ftrace_call:
>  #endif
>  	bctr			/* jump after _mcount site */
> =20
> -#ifdef CONFIG_LIVEPATCH
> +#ifdef CONFIG_LIVEPATCH_64
>  	/*
>  	 * This function runs in the mcount context, between two functions. As
>  	 * such it can only clobber registers which are volatile and used in
> --=20
> 2.33.1
>=20
