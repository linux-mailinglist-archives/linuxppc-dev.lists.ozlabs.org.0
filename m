Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DECCC312EDD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 11:24:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ2Dz1vgSzDsWR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 21:24:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WoLX2tZP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZ2Bs4RNDzDr2l
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Feb 2021 21:22:12 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 118A6Yd1132591
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Feb 2021 05:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=aCKkTp8yOOhchjh0CiRzuPhfabWBCDJiHeQAzhtkpoA=;
 b=WoLX2tZPZEaODFAWChd+9eCDQL14DfzSCDj/eapcNcJm0YeOVT4myz/9v6UyWp+Dh2fg
 5iXq0fpwq4ZFz0BMkhqOYs9wXlzX1KyuQ1dEnWFqPJnxs85jUwTM16l7IQ1yxXZwDejk
 ZD0pa4DQVu/ddg0L/hn4hZZvwBVuKrgxEjBB+Stkc3pzJGKNJ0wlKe7vmmqD2xBOPdXd
 I1k3GvI2vvT9fCXVABeTNlcEqkwwMu/hHNaUqOW6w49wxDJZd9RFTjcCyVED/HUID/kc
 7NBA5d6912abY5hMbsV5XCq6ex2JWSjo6wU1HLV753Iv0Kkue8q1xqAjj0iFGS6ceT9t 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36k24u2dqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 05:22:08 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 118AERu9167092
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Feb 2021 05:22:08 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36k24u2dqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 05:22:07 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 118AGdL7014956;
 Mon, 8 Feb 2021 10:22:07 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 36hjr91k79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 10:22:06 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 118AM5Qo20644168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Feb 2021 10:22:05 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9586AC605A;
 Mon,  8 Feb 2021 10:22:05 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38481C6055;
 Mon,  8 Feb 2021 10:22:05 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.53.115])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Feb 2021 10:22:05 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id E5D9A2E2D72; Mon,  8 Feb 2021 15:34:11 +0530 (IST)
Date: Mon, 8 Feb 2021 15:34:11 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 07/42] powerpc/fsl_booke/32: CacheLockingException
 remove args
Message-ID: <20210208100411.GA18820@in.ibm.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-8-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210130130852.2952424-8-npiggin@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-08_03:2021-02-08,
 2021-02-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102080065
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
Reply-To: ego@linux.vnet.ibm.com
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 30, 2021 at 11:08:17PM +1000, Nicholas Piggin wrote:
> Like other interrupt handler conversions, switch to getting registers
> from the pt_regs argument.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/head_fsl_booke.S | 6 +++---
>  arch/powerpc/kernel/traps.c          | 5 +++--
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
> index fdd4d274c245..0d4d9a6fcca1 100644
> --- a/arch/powerpc/kernel/head_fsl_booke.S
> +++ b/arch/powerpc/kernel/head_fsl_booke.S
> @@ -364,12 +364,12 @@ interrupt_base:
>  	/* Data Storage Interrupt */
>  	START_EXCEPTION(DataStorage)
>  	NORMAL_EXCEPTION_PROLOG(DATA_STORAGE)
> -	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it, pass arg3 */
> +	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it3 */
                                                         ^^^^^^^^^^
Sorry for the nitpick.. Should be "/* Grab the ESR, save it */"


>  	stw	r5,_ESR(r11)
> -	mfspr	r4,SPRN_DEAR		/* Grab the DEAR, save it, pass arg2 */
> +	mfspr	r4,SPRN_DEAR		/* Grab the DEAR, save it */
> +	stw	r4, _DEAR(r11)
>  	andis.	r10,r5,(ESR_ILK|ESR_DLK)@h
>  	bne	1f
> -	stw	r4, _DEAR(r11)
>  	EXC_XFER_LITE(0x0300, handle_page_fault)
>  1:
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 3ec7b443fe6b..1c77b1a8f7c9 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -2062,9 +2062,10 @@ void altivec_assist_exception(struct pt_regs *regs)
>  #endif /* CONFIG_ALTIVEC */
> 
>  #ifdef CONFIG_FSL_BOOKE
> -void CacheLockingException(struct pt_regs *regs, unsigned long address,
> -			   unsigned long error_code)
> +void CacheLockingException(struct pt_regs *regs)
>  {
> +	unsigned long error_code = regs->dsisr;
> +
>  	/* We treat cache locking instructions from the user
>  	 * as priv ops, in the future we could try to do
>  	 * something smarter
> -- 
> 2.23.0
> 
