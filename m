Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9488E4DC2FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 10:37:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK29v3td6z30Ml
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 20:37:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c1090k4K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=c1090k4K; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK29663ZNz2xXZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 20:36:58 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22H9NVVb006739
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 09:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : cc : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=cHwC3gOTe9nYp0cQqwgGZvuSfiJzhJgzjdf1HJ94Y30=;
 b=c1090k4KX7c4GQM2bEmei08loKPv0T1s+xt6Ugojwrbh/+5+BCp3pKi29CwYe/AQdZR8
 uA6nDqTntW5UoWXIayiSJigROoZn1NwnYA7S72Jlj4IUhWRd4VB/puSXhot86pN2yPa6
 z1OjP3KNDYoH8EJGKGa4ogir/XswGY9TlSEIF4IPxhy+ijSsPKpYYb8AIrXps6ePOIWd
 J+7YcQEhgf9pdIfqNlhL+aaLqdg0oLnGvCZO03K1oRJoDWuF5L+HS0dzk1JPD9wlUBwV
 hwgTURCMHFtjdm6sY+vu+YbTsOUKVWxnbksC2cAMQnekatCjDr9yJp5df7bMlLRWqRyW 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev2am074s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 09:36:53 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22H9PKax013500
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 09:36:53 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev2am0747-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 09:36:53 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22H9Wapq030567;
 Thu, 17 Mar 2022 09:36:51 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3erjshsbxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 09:36:50 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22H9alPv58851804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Mar 2022 09:36:47 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81F1052050;
 Thu, 17 Mar 2022 09:36:47 +0000 (GMT)
Received: from [9.145.66.50] (unknown [9.145.66.50])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 57CA15204F;
 Thu, 17 Mar 2022 09:36:47 +0000 (GMT)
Message-ID: <8127f55c-c8d9-9151-d7bd-4ca312e079c7@linux.ibm.com>
Date: Thu, 17 Mar 2022 10:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 08/14] powerpc/rtas: call enter_rtas in real-mode on 64-bit
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20220308135047.478297-1-npiggin@gmail.com>
 <20220308135047.478297-9-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220308135047.478297-9-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: s8hQUeoNMnEwok5oeIwnINSV_1SnHuWb
X-Proofpoint-GUID: HHP67G4pYmkNfNISeLt96NHPkHT6iuNn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-17_03,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203170056
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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

Further test done on top this series shows that switching MSR_DR off before
entering enter_rtas() is generating DSI when accessing the stack in
enter_rtas(). This may happen if the task stack is mapped beyond the VRMA.

Furthermore, there is no real need to run enter_rtas() in real mode (IR and
DR unset) because the MSR will be set to real mode when doing rfid, see below.

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

rfid will load the MSR with the value stored in SRR1 (formely r6) and so
switch to the real mode. This why there is no need to switch earlier in
real mode.

>  	b	.	/* prevent speculative execution */
> +_ASM_NOKPROBE_SYMBOL(enter_rtas)
>  
>  rtas_return_loc:
>  	FIXUP_ENDIAN
> @@ -127,29 +124,10 @@ rtas_return_loc:
>  	sync
>  	mtmsrd	r6
>  
> -	/* relocation is off at this point */>  	GET_PACA(r13)
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
This was turning on MSR_DR and MSR_IR so rtas_restore() could access the
stack even if it is beyond the VRMA.

That patch is breaking this and generating panic when task's stack are
below VRMA.

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

