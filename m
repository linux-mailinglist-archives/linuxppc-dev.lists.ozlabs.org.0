Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E341981F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 19:12:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rfD467KhzDqfy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 04:12:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rf6k1z7NzDqfp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 04:08:14 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02UH4J8E067647
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 13:08:11 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3022nmh6fr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 13:08:11 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Mon, 30 Mar 2020 18:08:03 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 30 Mar 2020 18:07:59 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02UH71LE36110660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Mar 2020 17:07:01 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7410352050;
 Mon, 30 Mar 2020 17:08:04 +0000 (GMT)
Received: from localhost (unknown [9.85.126.25])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 16C655204F;
 Mon, 30 Mar 2020 17:08:03 +0000 (GMT)
Date: Mon, 30 Mar 2020 22:38:02 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 10/12] powerpc/entry32: Blacklist exception entry points
 for kprobe.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <dff05b59a161434a546010507000816750073f28.1585474724.git.christophe.leroy@c-s.fr>
 <aea027844b12fcbc29ea78d26c5848a6794d1688.1585474724.git.christophe.leroy@c-s.fr>
In-Reply-To: <aea027844b12fcbc29ea78d26c5848a6794d1688.1585474724.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20033017-0012-0000-0000-0000039B1080
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033017-0013-0000-0000-000021D8194E
Message-Id: <1585588031.jvow7mwq4x.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-30_07:2020-03-30,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003300153
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
> kprobe does not handle events happening in real mode.
>=20
> As exception entry points are running with MMU disabled,
> blacklist them.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/kernel/entry_32.S | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_3=
2.S
> index 94f78c03cb79..9a1a45d6038a 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -51,6 +51,7 @@ mcheck_transfer_to_handler:
>  	mfspr	r0,SPRN_DSRR1
>  	stw	r0,_DSRR1(r11)
>  	/* fall through */
> +_ASM_NOKPROBE_SYMBOL(mcheck_transfer_to_handler)
>=20
>  	.globl	debug_transfer_to_handler
>  debug_transfer_to_handler:
> @@ -59,6 +60,7 @@ debug_transfer_to_handler:
>  	mfspr	r0,SPRN_CSRR1
>  	stw	r0,_CSRR1(r11)
>  	/* fall through */
> +_ASM_NOKPROBE_SYMBOL(debug_transfer_to_handler)
>=20
>  	.globl	crit_transfer_to_handler
>  crit_transfer_to_handler:
> @@ -94,6 +96,7 @@ crit_transfer_to_handler:
>  	rlwinm	r0,r1,0,0,(31 - THREAD_SHIFT)
>  	stw	r0,KSP_LIMIT(r8)
>  	/* fall through */
> +_ASM_NOKPROBE_SYMBOL(crit_transfer_to_handler)
>  #endif
>=20
>  #ifdef CONFIG_40x
> @@ -115,6 +118,7 @@ crit_transfer_to_handler:
>  	rlwinm	r0,r1,0,0,(31 - THREAD_SHIFT)
>  	stw	r0,KSP_LIMIT(r8)
>  	/* fall through */
> +_ASM_NOKPROBE_SYMBOL(crit_transfer_to_handler)
>  #endif
>=20
>  /*
> @@ -127,6 +131,7 @@ crit_transfer_to_handler:
>  	.globl	transfer_to_handler_full
>  transfer_to_handler_full:
>  	SAVE_NVGPRS(r11)
> +_ASM_NOKPROBE_SYMBOL(transfer_to_handler_full)
>  	/* fall through */
>=20
>  	.globl	transfer_to_handler
> @@ -286,6 +291,8 @@ reenable_mmu:
>  	lwz	r2, GPR2(r11)
>  	b	fast_exception_return
>  #endif
> +_ASM_NOKPROBE_SYMBOL(transfer_to_handler)
> +_ASM_NOKPROBE_SYMBOL(transfer_to_handler_cont)

These are added after 'reenable_mmu', which is itself not blacklisted. =20
Is that intentional?


- Naveen

