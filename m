Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 381604D8AA6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 18:18:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHNXm1BXBz30L1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 04:18:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=to0p+yg9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=to0p+yg9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHNX22HBcz2ynk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 04:17:37 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EEba1t004498
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 17:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7G2Yt6aP4F6rOeUX+uIhZ9uwrL5Q3Wl9ZwhEedis0YA=;
 b=to0p+yg9wzDM6zDxdpGdDHfEuXOqfJ0H48AtFXCNdZh1MGvpZgD+g7Z3w37GwigewCzh
 RzZPQ0k2RMRu/V0pqDiOF6vJ+1TVaQsWn3K41Tkkj/3F6QC83IUJiSzuYn7gbGEj5Ncu
 B1eVg/nherCKKDSxKT03QN8edS9ko+OLLv4GSOaSJl9vecqcbKsnYbOanjzVniv2X5+L
 +uUjt2phpu5h0A/4Ax2nszX0xRxfvUxF5V+sEhjkZfRTfVeCa0xeJJHSmLdhGQWXEdzP
 OZiRTa3eutQ6IhGhcMhB/Yqjmc/O//z3Sd5wQpU8I8/ogG7U89Qt15KIypTFN1+Vb22r 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6a6x8f6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 17:17:34 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EGFqee025626
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 17:17:34 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6a6x8em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 17:17:34 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EHDEk9014626;
 Mon, 14 Mar 2022 17:17:32 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3erk58m13f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 17:17:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EHHTvj57344330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 17:17:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77D5D11DF28;
 Mon, 14 Mar 2022 17:17:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5507911DF0E;
 Mon, 14 Mar 2022 17:17:29 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 17:17:29 +0000 (GMT)
Message-ID: <6fbd4cf7-53c9-0f68-e84e-b9d701a46863@linux.ibm.com>
Date: Mon, 14 Mar 2022 18:17:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 09/14] powerpc/rtas: Leave MSR[RI] enabled over RTAS call
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20220308135047.478297-1-npiggin@gmail.com>
 <20220308135047.478297-10-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220308135047.478297-10-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RFKvKzFZ-v1uI8UiaSOl4fdk_dVLN6p_
X-Proofpoint-ORIG-GUID: eQqxprgcQt1HtjqI406VF9EaqF3xkAA2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_12,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/03/2022, 14:50:42, Nicholas Piggin wrote:
> PAPR specifies that RTAS may be called with MSR[RI] enabled if the
> calling context is recoverable, and RTAS will manage RI as necessary.
> Call the rtas entry point with RI enabled, and add a check to ensure
> the caller has RI enabled.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/rtas.c       |  1 +
>  arch/powerpc/kernel/rtas_entry.S | 13 +++----------
>  2 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 87ede1877816..fece066115f0 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -57,6 +57,7 @@ static noinline void do_enter_rtas(unsigned long args)
>  		hard_irq_disable();
>  
>  		msr = mfmsr();
> +		BUG_ON(!(msr & MSR_RI));
>  		mtmsr(msr & ~(MSR_IR|MSR_DR));
>  		enter_rtas(args);
>  		mtmsr(msr);
> diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
> index 292551684bbd..72b27b14ccc9 100644
> --- a/arch/powerpc/kernel/rtas_entry.S
> +++ b/arch/powerpc/kernel/rtas_entry.S
> @@ -95,7 +95,7 @@ _GLOBAL(enter_rtas)
>  	clrldi	r4,r4,2			/* convert to realmode address */
>  	mtlr	r4
>  
> -	LOAD_REG_IMMEDIATE(r6, MSR_ME)
> +	LOAD_REG_IMMEDIATE(r6, MSR_ME|MSR_RI)
>  
>  	LOAD_REG_ADDR(r4, rtas)
>  	ld	r5,RTASENTRY(r4)	/* get the rtas->entry value */
> @@ -113,15 +113,8 @@ _ASM_NOKPROBE_SYMBOL(enter_rtas)
>  rtas_return_loc:
>  	FIXUP_ENDIAN
>  
> -	/*
> -	 * Clear RI and set SF before anything.
> -	 */
> -	mfmsr	r6
> -	li	r0,MSR_RI
> -	andc	r6,r6,r0
> -	sldi	r0,r0,(MSR_SF_LG - MSR_RI_LG)
> -	or	r6,r6,r0
> -	sync
> +	/* Set SF before anything. */
> +	LOAD_REG_IMMEDIATE(r6, MSR_KERNEL & ~(MSR_IR|MSR_DR))

I guess we cannot directly load a MSR value stored in the PACA at that
time, isn't it?

>  	mtmsrd	r6
>  
>  	GET_PACA(r13)

