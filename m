Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD864B547F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 16:21:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jy7Gc2dKHz3bZT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 02:21:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R2d7Kt2U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=R2d7Kt2U; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jy7Fv5Gnnz3bTy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 02:20:34 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EE4hmJ009969; 
 Mon, 14 Feb 2022 15:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=fkrUmfPtt6zYPcLAlCBt3JXgVA+JKKKc7SEZHzMLDOM=;
 b=R2d7Kt2UArwcORU2EzATFwybq1li5NUpNiwpJTJoRXXdwYy7N0Wktbfgeqb2kfVkCu6Q
 2z7Mnz0hEvfdohgEgjWWIIEaDYAs0e+mDrl/eb41Rj1/U0tDwx+D+EtBzPrShfgzti9J
 znm6pi3nL8D0RAvg92LMGnTDoJBtPlDu79cCvYvi8OlrJ86DcosN9K1NW+MOL8Fyfz2Q
 6Y+KyGSbWXtRl29G0/k0CDnj4QF4LnVoyV3lUlr+V8Y3GgoQYmkxGBJZ+kubhjdkUENj
 OXFUuIpGGzThL+j+A3g8rivdCBKXUGLfMTfCzQqRgMwRunPzSqeG4smx4SVFkLOhpSBJ lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7c4e1bq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 15:20:05 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21EEtWhP029986;
 Mon, 14 Feb 2022 15:20:05 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7c4e1bny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 15:20:05 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EFD1f1020571;
 Mon, 14 Feb 2022 15:20:03 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3e645jdw7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 15:20:02 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21EFK0GI48365924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 15:20:00 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58A52A405E;
 Mon, 14 Feb 2022 15:20:00 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CB76A4055;
 Mon, 14 Feb 2022 15:19:59 +0000 (GMT)
Received: from localhost (unknown [9.43.124.167])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 15:19:59 +0000 (GMT)
Date: Mon, 14 Feb 2022 20:49:57 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 08/13] powerpc/ftrace: Prepare PPC64's ftrace_caller()
 for CONFIG_DYNAMIC_FTRACE_WITH_ARGS
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Jiri Kosina
 <jikos@kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Miroslav Benes <mbenes@suse.cz>, Ingo Molnar
 <mingo@redhat.com>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <850817333cc76593699032e8e9a70d8c36e1af1e.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <850817333cc76593699032e8e9a70d8c36e1af1e.1640017960.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1644851672.d8a13a7hsf.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Hmu2hYFU9gEsaZJi4w4TCpwYTGPH5jdQ
X-Proofpoint-ORIG-GUID: X2BX5tu4QyN2Hw7dSQafa7aVJYunyltG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_06,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140093
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

Hi Christophe,
Thanks for your work enabling DYNAMIC_FTRACE_WITH_ARGS on powerpc. Sorry=20
for the late review on this series, but I have a few comments below.


Christophe Leroy wrote:
> In order to implement CONFIG_DYNAMIC_FTRACE_WITH_ARGS, change ftrace_call=
er()
> to handle LIVEPATCH the same way as frace_caller_regs().
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../powerpc/kernel/trace/ftrace_64_mprofile.S | 25 ++++++++++++++-----
>  1 file changed, 19 insertions(+), 6 deletions(-)

I think we also need to save r1 into pt_regs so that the stack pointer=20
is available in the callbacks.

Other than that, a few minor nits below...

>=20
> diff --git a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S b/arch/powerp=
c/kernel/trace/ftrace_64_mprofile.S
> index d636fc755f60..f6f787819273 100644
> --- a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
> +++ b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
> @@ -172,14 +172,19 @@ _GLOBAL(ftrace_caller)
>  	addi	r3, r3, function_trace_op@toc@l
>  	ld	r5, 0(r3)
> =20
> +#ifdef CONFIG_LIVEPATCH_64
> +	SAVE_GPR(14, r1)
> +	mr	r14,r7		/* remember old NIP */
                    ^ add a space
> +#endif

Please add a blank line here, to match the formatting for the rest of=20
this file.

>  	/* Calculate ip from nip-4 into r3 for call below */
>  	subi    r3, r7, MCOUNT_INSN_SIZE
> =20
>  	/* Put the original return address in r4 as parent_ip */
> +	std	r0, _LINK(r1)
>  	mr	r4, r0
> =20
> -	/* Set pt_regs to NULL */
> -	li	r6, 0
> +	/* Load &pt_regs in r6 for call below */
> +	addi    r6, r1 ,STACK_FRAME_OVERHEAD
                      ^^ incorrect spacing
> =20
>  	/* ftrace_call(r3, r4, r5, r6) */
>  .globl ftrace_call
> @@ -189,6 +194,10 @@ ftrace_call:
> =20
>  	ld	r3, _NIP(r1)
>  	mtctr	r3

Another blank line here.

> +#ifdef CONFIG_LIVEPATCH_64
> +	cmpd	r14, r3		/* has NIP been altered? */
> +	REST_GPR(14, r1)
> +#endif
> =20
>  	/* Restore gprs */
>  	REST_GPRS(3, 10, r1)
> @@ -196,13 +205,17 @@ ftrace_call:
>  	/* Restore callee's TOC */
>  	ld	r2, 24(r1)
> =20
> +	/* Restore possibly modified LR */
> +	ld	r0, _LINK(r1)
> +	mtlr	r0
> +
>  	/* Pop our stack frame */
>  	addi	r1, r1, SWITCH_FRAME_SIZE
> =20
> -	/* Reload original LR */
> -	ld	r0, LRSAVE(r1)
> -	mtlr	r0
> -
> +#ifdef CONFIG_LIVEPATCH_64
> +        /* Based on the cmpd above, if the NIP was altered handle livepa=
tch */
> +	bne-	livepatch_handler
> +#endif

Here too.

>  	/* Handle function_graph or go back */
>  	b	ftrace_caller_common
> =20


- Naveen

