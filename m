Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E4D199C8E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 19:08:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sG4H4PxHzDqNs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 04:08:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sG1D0pkyzDqB3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 04:05:35 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VH1sL8070347
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 13:05:32 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 303ymk9vc9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 13:05:31 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Tue, 31 Mar 2020 18:05:23 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 31 Mar 2020 18:05:19 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02VH5P0960096676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Mar 2020 17:05:25 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23F0AA405B;
 Tue, 31 Mar 2020 17:05:25 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2D99A4054;
 Tue, 31 Mar 2020 17:05:24 +0000 (GMT)
Received: from localhost (unknown [9.85.74.140])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 31 Mar 2020 17:05:24 +0000 (GMT)
Date: Tue, 31 Mar 2020 22:35:22 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 10/12] powerpc/entry32: Blacklist exception entry
 points for kprobe.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <1ae02b6637b87fc5aaa1d5012c3e2cb30e62b4a3.1585670437.git.christophe.leroy@c-s.fr>
 <f61ac599855e674ebb592464d0ea32a3ba9c6644.1585670437.git.christophe.leroy@c-s.fr>
In-Reply-To: <f61ac599855e674ebb592464d0ea32a3ba9c6644.1585670437.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20033117-0012-0000-0000-0000039BBCE3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033117-0013-0000-0000-000021D8C9C2
Message-Id: <1585673757.0rkxmweypy.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_05:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310145
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
> The handling of TLF_NAPPING and TLF_SLEEPING is moved before the
> CONFIG_TRACE_IRQFLAGS which contains 'reenable_mmu' because from there
> kprobe will be possible as the kernel will run with MMU enabled.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
> v2: Moved TLF_NAPPING and TLF_SLEEPING handling
> ---
>  arch/powerpc/kernel/entry_32.S | 37 ++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 15 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_3=
2.S
> index 94f78c03cb79..215aa3a6d4f7 100644
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
> @@ -227,6 +232,23 @@ transfer_to_handler_cont:
>  	SYNC
>  	RFI				/* jump to handler, enable MMU */
>=20
> +#if defined (CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
> +4:	rlwinm	r12,r12,0,~_TLF_NAPPING
> +	stw	r12,TI_LOCAL_FLAGS(r2)
> +	b	power_save_ppc32_restore
> +
> +7:	rlwinm	r12,r12,0,~_TLF_SLEEPING
> +	stw	r12,TI_LOCAL_FLAGS(r2)
> +	lwz	r9,_MSR(r11)		/* if sleeping, clear MSR.EE */
> +	rlwinm	r9,r9,0,~MSR_EE
> +	lwz	r12,_LINK(r11)		/* and return to address in LR */
> +	kuap_restore r11, r2, r3, r4, r5
> +	lwz	r2, GPR2(r11)
> +	b	fast_exception_return
> +#endif
> +_ASM_NOKPROBE_SYMBOL(transfer_to_handler)
> +_ASM_NOKPROBE_SYMBOL(transfer_to_handler_cont)
> +

A very minor nit is that the above NOKPROBE annotation actually covers=20
the block of code below between the label '1:' till 'reenable_mmu', but=20
isn't obvious from the code. Splitting off 'reenable_mmu' would have=20
made that clear.

You don't have to fix that though -- a kprobe still won't be allowed=20
there and anyone interested should be able to look up this mail chain.


- Naveen

