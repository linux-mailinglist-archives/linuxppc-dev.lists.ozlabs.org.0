Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA9A4D87DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 16:13:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHKmV4xMtz30Km
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 02:13:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aWBMQGl9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aWBMQGl9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHKll6SfWz2xF0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 02:12:35 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EEcX9G000611
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 15:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6aTPU6zTkiDWjgcrjAIRy1+6HDouchjoWJwWhg0aDJw=;
 b=aWBMQGl98qBNZhhBxiuq70ygytJa2vQ0xLXO/pyflZHBirRLTpzIEUPiG0Xoqo5z6rvs
 jeUP3/C62s99ToLZLk6MatRrRFuQl03uPyrAQsqQrs7pGC4CdM51Fh7mb4lJt0mZCQxG
 FMMyV1CTr/MlLurG+qBVPKajYDHc/lSUcLsmGhWTov3dyP862kRB1wc/FNlswA+6Xw2Y
 6jGjZ9tSO++ZsviIxD5p3jSD++IWTX01HZY7w95OH7u2TkvCVITytqisEr7lN8KyJYtc
 8SelcYEQcdrtKjnLUzFAv58pxl/7xuYNoJ7qdtxRcn3bSasS4HXwazlAZ5lNfq0VwqTw VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6aduk82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 15:12:28 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EDn17N016819
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 15:12:27 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6aduk6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 15:12:27 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EF9Bdg017206;
 Mon, 14 Mar 2022 15:12:25 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3erk58vf2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 15:12:25 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EFCMob41943300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 15:12:22 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB9B611C219;
 Mon, 14 Mar 2022 15:12:21 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C311111C283;
 Mon, 14 Mar 2022 15:12:21 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 15:12:21 +0000 (GMT)
Message-ID: <444c41a2-ad32-98df-c287-fc5419109656@linux.ibm.com>
Date: Mon, 14 Mar 2022 16:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 04/14] powerpc/rtas: Call enter_rtas with MSR[EE] disabled
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20220308135047.478297-1-npiggin@gmail.com>
 <20220308135047.478297-5-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220308135047.478297-5-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GfioylwiAZHbZsXh5kt0afgLk8FOvkJq
X-Proofpoint-GUID: gwE872l3_QbpFeLG2cLNRgODzYme0gGw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_11,2022-03-14_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140095
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/03/2022, 14:50:37, Nicholas Piggin wrote:
> Disable MSR[EE] in C code rather than asm.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

FWIW,
Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

> ---
>  arch/powerpc/kernel/rtas.c       |  4 ++++
>  arch/powerpc/kernel/rtas_entry.S | 17 +----------------
>  2 files changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 733e6ef36758..6b5892d6a56b 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -49,6 +49,10 @@ void enter_rtas(unsigned long);
>  
>  static inline void do_enter_rtas(unsigned long args)
>  {
> +	BUG_ON(!irqs_disabled());
> +
> +	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
> +
>  	enter_rtas(args);
>  
>  	srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
> diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
> index 6fa10eb49a9c..45fa661c2ff6 100644
> --- a/arch/powerpc/kernel/rtas_entry.S
> +++ b/arch/powerpc/kernel/rtas_entry.S
> @@ -24,8 +24,6 @@ _GLOBAL(enter_rtas)
>  	lwz	r4,RTASBASE(r4)
>  	mfmsr	r9
>  	stw	r9,8(r1)
> -	LOAD_REG_IMMEDIATE(r0,MSR_KERNEL)
> -	mtmsr	r0	/* disable interrupts so SRR0/1 don't get trashed */
>  	li	r9,MSR_KERNEL & ~(MSR_IR|MSR_DR)
>  	mtlr	r6
>  	stw	r1, THREAD + RTAS_SP(r2)
> @@ -87,20 +85,7 @@ _GLOBAL(enter_rtas)
>  	li	r0,0
>  	mtcr	r0
>  
> -#ifdef CONFIG_BUG
> -	/* There is no way it is acceptable to get here with interrupts enabled,
> -	 * check it with the asm equivalent of WARN_ON
> -	 */
> -	lbz	r0,PACAIRQSOFTMASK(r13)
> -1:	tdeqi	r0,IRQS_ENABLED
> -	EMIT_WARN_ENTRY 1b,__FILE__,__LINE__,BUGFLAG_WARNING
> -#endif
> -
> -	/* Hard-disable interrupts */
>  	mfmsr	r6
> -	rldicl	r7,r6,48,1
> -	rotldi	r7,r7,16
> -	mtmsrd	r7,1
>  
>  	/* Unfortunately, the stack pointer and the MSR are also clobbered,
>  	 * so they are saved in the PACA which allows us to restore
> @@ -124,7 +109,7 @@ _GLOBAL(enter_rtas)
>  	andc	r6,r0,r9
>  
>  __enter_rtas:
> -	sync				/* disable interrupts so SRR0/1 */
> +	sync				/* disable RI so SRR0/1 */
>  	mtmsrd	r0			/* don't get trashed */
>  
>  	LOAD_REG_ADDR(r4, rtas)

