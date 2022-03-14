Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CCA4D8A88
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 18:10:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHNMP0mQHz3bWT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 04:10:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EHzF+Xg5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EHzF+Xg5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHNLf3zRhz2yyf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 04:09:30 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EH0m2J029247
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 17:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : cc : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+BvEb+ziT//tyD4d3pvKybg7e1sG8fY8CMtcDw0rVFU=;
 b=EHzF+Xg5+9viwUY2RMXzrI5XeQaLaC4rDHBbNXaXb0p17hbNxtBOafMdHNZB4KtlmDwc
 8Kh5KUwMbOH+atn0xjsWNtnJR814feUD8FYXWgNLqRKxacZCgTq0V+asQIZOMeYakiC8
 4b/0vxubb83cFvRI/LnYlqzMuCSqykZxHho2vQt24QLrjd0OdEXREYDGATfZtq5fGF8o
 M0zL1Tl0kjg+xNqqs37mLv14lg4Yvr0JxsfxioR232cqv1UJIuvbeqK74EWGuApkbeJE
 vC+B7zjipUIcmTSUwr0dnBAaSIQqrO/1s0ktsnIyDzg2TYwbvbC7JRzOR1nPX6SDr5DW sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3et6cw5s2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 17:09:26 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EGkNJY031726
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 17:09:26 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3et6cw5s27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 17:09:26 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EGrBqf008533;
 Mon, 14 Mar 2022 17:09:24 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3erk58vquu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 17:09:24 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EH9L8r40370520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 17:09:22 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB41911D0D1;
 Mon, 14 Mar 2022 17:09:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1305911C648;
 Mon, 14 Mar 2022 17:09:19 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 17:09:15 +0000 (GMT)
Message-ID: <0c0f6c23-b73a-30b4-1995-21e1ec654de0@linux.ibm.com>
Date: Mon, 14 Mar 2022 18:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 08/14] powerpc/rtas: call enter_rtas in real-mode on 64-bit
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>
References: <20220308135047.478297-1-npiggin@gmail.com>
 <20220308135047.478297-9-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220308135047.478297-9-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: djslYedocR1-Tn2bP1K6_i7LUkY9EhsA
X-Proofpoint-GUID: cbz_7fDSFlzGRg-OcJKctCgaBqBC0w4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_12,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140104
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/03/2022, 14:50:41, Nicholas Piggin wrote:
> This moves MSR save/restore and some real-mode juggling out of asm and
> into C code, simplifying things.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/rtas.c       | 15 ++++++++++++---
>  arch/powerpc/kernel/rtas_entry.S | 32 +++++---------------------------
>  2 files changed, 17 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 6b5892d6a56b..87ede1877816 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -47,13 +47,22 @@
>  /* This is here deliberately so it's only used in this file */
>  void enter_rtas(unsigned long);
>  
> -static inline void do_enter_rtas(unsigned long args)
> +static noinline void do_enter_rtas(unsigned long args)
>  {
>  	BUG_ON(!irqs_disabled());
>  
> -	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
> +	if (IS_ENABLED(CONFIG_PPC64)) {
> +		unsigned long msr;
>  
> -	enter_rtas(args);
> +		hard_irq_disable();
> +
> +		msr = mfmsr();
> +		mtmsr(msr & ~(MSR_IR|MSR_DR));
> +		enter_rtas(args);
> +		mtmsr(msr);
> +	} else {
> +		enter_rtas(args);
> +	}
>  
>  	srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
>  }
> diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
> index 5f65ea4436c6..292551684bbd 100644
> --- a/arch/powerpc/kernel/rtas_entry.S
> +++ b/arch/powerpc/kernel/rtas_entry.S
> @@ -84,14 +84,11 @@ _GLOBAL(enter_rtas)
>  	li	r0,0
>  	mtcr	r0
>  
> -	mfmsr	r6
> -
> -	/* Unfortunately, the stack pointer and the MSR are also clobbered,
> -	 * so they are saved in the PACA which allows us to restore
> -	 * our original state after RTAS returns.
> +	/*
> +	 * The stack pointer is clobbered, so it is saved in the PACA which
> +	 * allows us to restore our original state after RTAS returns.
>  	 */
>  	std	r1,PACAR1(r13)
> -	std	r6,PACASAVEDMSR(r13)
>  
>  	/* Setup our real return addr */
>  	LOAD_REG_ADDR(r4,rtas_return_loc)
> @@ -100,7 +97,6 @@ _GLOBAL(enter_rtas)
>  
>  	LOAD_REG_IMMEDIATE(r6, MSR_ME)
>  
> -__enter_rtas:
>  	LOAD_REG_ADDR(r4, rtas)
>  	ld	r5,RTASENTRY(r4)	/* get the rtas->entry value */
>  	ld	r4,RTASBASE(r4)		/* get the rtas->base value */
> @@ -112,6 +108,7 @@ __enter_rtas:
>  	mtspr	SPRN_SRR1,r6
>  	RFI_TO_KERNEL
>  	b	.	/* prevent speculative execution */
> +_ASM_NOKPROBE_SYMBOL(enter_rtas)
>  
>  rtas_return_loc:
>  	FIXUP_ENDIAN
> @@ -127,29 +124,10 @@ rtas_return_loc:
>  	sync
>  	mtmsrd	r6

Since MSR plumbing is still needed in the asm, what is the benefit of doing
the real mode switching in the C code?

What if the MSR is saved in the PACA before switching to real mode, and
restored in rtas_return_loc?

>  
> -	/* relocation is off at this point */
>  	GET_PACA(r13)
>  
> -	bcl	20,31,$+4
> -0:	mflr	r3
> -	ld	r3,(1f-0b)(r3)		/* get &rtas_restore_regs */
> -
>  	ld	r1,PACAR1(r13)		/* Restore our SP */
> -	ld	r4,PACASAVEDMSR(r13)	/* Restore our MSR */
>  
> -	mtspr	SPRN_SRR0,r3
> -	mtspr	SPRN_SRR1,r4
> -	RFI_TO_KERNEL

rfid is not more called to restore MSR.
Noob question, is there any impact of using mtmsrd instead of rfid to
restore the MSR?

> -	b	.	/* prevent speculative execution */
> -_ASM_NOKPROBE_SYMBOL(enter_rtas)
> -_ASM_NOKPROBE_SYMBOL(__enter_rtas)
> -_ASM_NOKPROBE_SYMBOL(rtas_return_loc)
> -
> -	.align	3
> -1:	.8byte	rtas_restore_regs
> -
> -rtas_restore_regs:
> -	/* relocation is on at this point */
>  	REST_GPR(2, r1)			/* Restore the TOC */
>  	REST_NVGPRS(r1)			/* Restore the non-volatiles */
>  
> @@ -169,5 +147,5 @@ rtas_restore_regs:
>  
>  	mtlr	r0
>  	blr				/* return to caller */
> -
> +_ASM_NOKPROBE_SYMBOL(rtas_return_loc)
>  #endif /* CONFIG_PPC32 */

