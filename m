Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 438F460F3B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 08:18:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ghNH4NWwzDqgW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 16:18:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="nAqIS92D"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ghLZ5G5rzDqJk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 16:16:38 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45ghLV1wntz9vBn0;
 Sat,  6 Jul 2019 08:16:34 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=nAqIS92D; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id u59tyzIwNZ2w; Sat,  6 Jul 2019 08:16:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45ghLT6T83z9vBmy;
 Sat,  6 Jul 2019 08:16:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1562393793; bh=87FasOyxsTxIuv9NH7ZiyrDO2hrT58Jl1uflnElVoAI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nAqIS92DK66SFdQsLIa12ENMmUNwc3oeFme5bCPcVwoq1T4hn+rDuyFsZOVTg10f5
 HLJQCNnxpfI8SWNLo3CA4oZMK9uExZeUJfMaxrmOiZRy6t5t8WbZjod22YOh5PGRVv
 48RBkVuXB/CaAKdHBKC7Eju46I2OHmb3VANCSnu0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C06628B768;
 Sat,  6 Jul 2019 08:16:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CcOcoItw1Sku; Sat,  6 Jul 2019 08:16:34 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1BB608B74C;
 Sat,  6 Jul 2019 08:16:34 +0200 (CEST)
Subject: Re: [v3 5/7] powerpc/memcpy_mcsafe: return remaining bytes
To: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20190705212647.21750-1-santosh@fossix.org>
 <20190705212647.21750-6-santosh@fossix.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <af253c4d-8f0a-faba-77d7-3140358034f7@c-s.fr>
Date: Sat, 6 Jul 2019 08:16:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705212647.21750-6-santosh@fossix.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/07/2019 à 23:26, Santosh Sivaraj a écrit :
> memcpy_mcsafe currently return -EFAULT on a machine check exception, change
> it to return the remaining bytes that needs to be copied, so that machine
> check safe copy_to_user can maintain the same behavior as copy_to_user.

AFAIU, this behaviour is the expected behaviour for memcpy_mcsafe(). Why 
implement a different behaviour in patch 3 and then change it here. 
Can't memcpy_mcsafe() return remaining bytes as expected from patch 3 ?

Christophe

> 
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> ---
>   arch/powerpc/lib/memcpy_mcsafe_64.S | 142 ++++++++++++++++------------
>   1 file changed, 83 insertions(+), 59 deletions(-)
> 
> diff --git a/arch/powerpc/lib/memcpy_mcsafe_64.S b/arch/powerpc/lib/memcpy_mcsafe_64.S
> index 50f865db0338..4d8a3d315992 100644
> --- a/arch/powerpc/lib/memcpy_mcsafe_64.S
> +++ b/arch/powerpc/lib/memcpy_mcsafe_64.S
> @@ -30,11 +30,25 @@
>   	ld	r14,STK_REG(R14)(r1)
>   	addi	r1,r1,STACKFRAMESIZE
>   .Ldo_err1:
> -	li	r3,-EFAULT
> +	/* Do a byte by byte copy to get the exact remaining size */
> +	mtctr	r7
> +100:	EX_TABLE(100b, .Ldone)
> +46:
> +err1;	lbz	r0,0(r4)
> +	addi	r4,r4,1
> +err1;	stb	r0,0(r3)
> +	addi	r3,r3,1
> +	bdnz	46b
> +	li	r3,0
> +	blr
> +
> +.Ldone:
> +	mfctr	r3
>   	blr
>   
>   
>   _GLOBAL(memcpy_mcsafe)
> +	mr	r7,r5
>   	cmpldi	r5,16
>   	blt	.Lshort_copy
>   
> @@ -49,18 +63,21 @@ err1;	lbz	r0,0(r4)
>   	addi	r4,r4,1
>   err1;	stb	r0,0(r3)
>   	addi	r3,r3,1
> +	subi	r7,r7,1
>   
>   1:	bf	cr7*4+2,2f
>   err1;	lhz	r0,0(r4)
>   	addi	r4,r4,2
>   err1;	sth	r0,0(r3)
>   	addi	r3,r3,2
> +	subi	r7,r7,2
>   
>   2:	bf	cr7*4+1,3f
>   err1;	lwz	r0,0(r4)
>   	addi	r4,r4,4
>   err1;	stw	r0,0(r3)
>   	addi	r3,r3,4
> +	subi	r7,r7,4
>   
>   3:	sub	r5,r5,r6
>   	cmpldi	r5,128
> @@ -87,43 +104,69 @@ err1;	stw	r0,0(r3)
>   4:
>   err2;	ld	r0,0(r4)
>   err2;	ld	r6,8(r4)
> -err2;	ld	r7,16(r4)
> -err2;	ld	r8,24(r4)
> -err2;	ld	r9,32(r4)
> -err2;	ld	r10,40(r4)
> -err2;	ld	r11,48(r4)
> -err2;	ld	r12,56(r4)
> -err2;	ld	r14,64(r4)
> -err2;	ld	r15,72(r4)
> -err2;	ld	r16,80(r4)
> -err2;	ld	r17,88(r4)
> -err2;	ld	r18,96(r4)
> -err2;	ld	r19,104(r4)
> -err2;	ld	r20,112(r4)
> -err2;	ld	r21,120(r4)
> +err2;	ld	r8,16(r4)
> +err2;	ld	r9,24(r4)
> +err2;	ld	r10,32(r4)
> +err2;	ld	r11,40(r4)
> +err2;	ld	r12,48(r4)
> +err2;	ld	r14,56(r4)
> +err2;	ld	r15,64(r4)
> +err2;	ld	r16,72(r4)
> +err2;	ld	r17,80(r4)
> +err2;	ld	r18,88(r4)
> +err2;	ld	r19,96(r4)
> +err2;	ld	r20,104(r4)
> +err2;	ld	r21,112(r4)
> +err2;	ld	r22,120(r4)
>   	addi	r4,r4,128
>   err2;	std	r0,0(r3)
>   err2;	std	r6,8(r3)
> -err2;	std	r7,16(r3)
> -err2;	std	r8,24(r3)
> -err2;	std	r9,32(r3)
> -err2;	std	r10,40(r3)
> -err2;	std	r11,48(r3)
> -err2;	std	r12,56(r3)
> -err2;	std	r14,64(r3)
> -err2;	std	r15,72(r3)
> -err2;	std	r16,80(r3)
> -err2;	std	r17,88(r3)
> -err2;	std	r18,96(r3)
> -err2;	std	r19,104(r3)
> -err2;	std	r20,112(r3)
> -err2;	std	r21,120(r3)
> +err2;	std	r8,16(r3)
> +err2;	std	r9,24(r3)
> +err2;	std	r10,32(r3)
> +err2;	std	r11,40(r3)
> +err2;	std	r12,48(r3)
> +err2;	std	r14,56(r3)
> +err2;	std	r15,64(r3)
> +err2;	std	r16,72(r3)
> +err2;	std	r17,80(r3)
> +err2;	std	r18,88(r3)
> +err2;	std	r19,96(r3)
> +err2;	std	r20,104(r3)
> +err2;	std	r21,112(r3)
> +err2;	std	r22,120(r3)
>   	addi	r3,r3,128
> +	subi	r7,r7,128
>   	bdnz	4b
>   
>   	clrldi	r5,r5,(64-7)
>   
> -	ld	r14,STK_REG(R14)(r1)
> +	/* Up to 127B to go */
> +5:	srdi	r6,r5,4
> +	mtocrf	0x01,r6
> +
> +6:	bf	cr7*4+1,7f
> +err2;	ld	r0,0(r4)
> +err2;	ld	r6,8(r4)
> +err2;	ld	r8,16(r4)
> +err2;	ld	r9,24(r4)
> +err2;	ld	r10,32(r4)
> +err2;	ld	r11,40(r4)
> +err2;	ld	r12,48(r4)
> +err2;	ld	r14,56(r4)
> +	addi	r4,r4,64
> +err2;	std	r0,0(r3)
> +err2;	std	r6,8(r3)
> +err2;	std	r8,16(r3)
> +err2;	std	r9,24(r3)
> +err2;	std	r10,32(r3)
> +err2;	std	r11,40(r3)
> +err2;	std	r12,48(r3)
> +err2;	std	r14,56(r3)
> +	addi	r3,r3,64
> +	subi	r7,r7,64
> +
> +7:	ld	r14,STK_REG(R14)(r1)
>   	ld	r15,STK_REG(R15)(r1)
>   	ld	r16,STK_REG(R16)(r1)
>   	ld	r17,STK_REG(R17)(r1)
> @@ -134,42 +177,19 @@ err2;	std	r21,120(r3)
>   	ld	r22,STK_REG(R22)(r1)
>   	addi	r1,r1,STACKFRAMESIZE
>   
> -	/* Up to 127B to go */
> -5:	srdi	r6,r5,4
> -	mtocrf	0x01,r6
> -
> -6:	bf	cr7*4+1,7f
> -err1;	ld	r0,0(r4)
> -err1;	ld	r6,8(r4)
> -err1;	ld	r7,16(r4)
> -err1;	ld	r8,24(r4)
> -err1;	ld	r9,32(r4)
> -err1;	ld	r10,40(r4)
> -err1;	ld	r11,48(r4)
> -err1;	ld	r12,56(r4)
> -	addi	r4,r4,64
> -err1;	std	r0,0(r3)
> -err1;	std	r6,8(r3)
> -err1;	std	r7,16(r3)
> -err1;	std	r8,24(r3)
> -err1;	std	r9,32(r3)
> -err1;	std	r10,40(r3)
> -err1;	std	r11,48(r3)
> -err1;	std	r12,56(r3)
> -	addi	r3,r3,64
> -
>   	/* Up to 63B to go */
> -7:	bf	cr7*4+2,8f
> +	bf	cr7*4+2,8f
>   err1;	ld	r0,0(r4)
>   err1;	ld	r6,8(r4)
> -err1;	ld	r7,16(r4)
> -err1;	ld	r8,24(r4)
> +err1;	ld	r8,16(r4)
> +err1;	ld	r9,24(r4)
>   	addi	r4,r4,32
>   err1;	std	r0,0(r3)
>   err1;	std	r6,8(r3)
> -err1;	std	r7,16(r3)
> -err1;	std	r8,24(r3)
> +err1;	std	r8,16(r3)
> +err1;	std	r9,24(r3)
>   	addi	r3,r3,32
> +	subi	r7,r7,32
>   
>   	/* Up to 31B to go */
>   8:	bf	cr7*4+3,9f
> @@ -179,6 +199,7 @@ err1;	ld	r6,8(r4)
>   err1;	std	r0,0(r3)
>   err1;	std	r6,8(r3)
>   	addi	r3,r3,16
> +	subi	r7,r7,16
>   
>   9:	clrldi	r5,r5,(64-4)
>   
> @@ -192,18 +213,21 @@ err1;	lwz	r6,4(r4)
>   err1;	stw	r0,0(r3)
>   err1;	stw	r6,4(r3)
>   	addi	r3,r3,8
> +	subi	r7,r7,8
>   
>   12:	bf	cr7*4+1,13f
>   err1;	lwz	r0,0(r4)
>   	addi	r4,r4,4
>   err1;	stw	r0,0(r3)
>   	addi	r3,r3,4
> +	subi	r7,r7,4
>   
>   13:	bf	cr7*4+2,14f
>   err1;	lhz	r0,0(r4)
>   	addi	r4,r4,2
>   err1;	sth	r0,0(r3)
>   	addi	r3,r3,2
> +	subi	r7,r7,2
>   
>   14:	bf	cr7*4+3,15f
>   err1;	lbz	r0,0(r4)
> 
