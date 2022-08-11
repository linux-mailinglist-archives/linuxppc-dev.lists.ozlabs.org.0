Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A992558FA85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 12:12:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3N0144r1z3bqv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 20:12:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TUBOIeJO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TUBOIeJO;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3MzL0w1cz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 20:11:41 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BA8WSc017728
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 10:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=FaAHhLcypxjlRs0c2tqGVcPKrQX3H+KLXwjGXW07YZs=;
 b=TUBOIeJOEfEb02nFq1y9AMzqyT/0hNN6vrVVeevBU8HhXt1HN4ZeVl6gjDsPSSBkvOrN
 KwfdCSJ43eBLlAG2YMSkgeIrKFOEEWUROnS0Qql8tbrb2NfR2XdLAzunrKDJ7tX4sna9
 6ZPL74cgA4RtaylYY+mYUyo6Hg7v8qfl754fGpLTBTrWmVqDPFhZCGiV4D4JPCMTXIg7
 zjTHtHOHPWt2o4rS1rsDt8iA6GT6kf33JY68HiK7p4NXfFv74TqtXT0005yxkfY85Egf
 Otj9SbjuxpZCObdtO+XI8/Qjs8PDnn9xILAJS+IqRvyJAQQ67yXbNjzL9cH+nb3AU6Dg fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvx59tx00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 10:11:39 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BA8Vln017552
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 10:11:38 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvx59twx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Aug 2022 10:11:38 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BA6nEC009842;
	Thu, 11 Aug 2022 10:11:36 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3huww2hvkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Aug 2022 10:11:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27BABYHe32637412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Aug 2022 10:11:34 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDE8AAE053;
	Thu, 11 Aug 2022 10:11:33 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C632AE045;
	Thu, 11 Aug 2022 10:11:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 11 Aug 2022 10:11:33 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7F085600EE;
	Thu, 11 Aug 2022 20:11:28 +1000 (AEST)
Message-ID: <462e3fe47fbd4a6d63c568572342bf14fa010e2c.camel@linux.ibm.com>
Subject: Re: [PATCH v2 11/14] powerpc/64s: Clear/restore caller gprs in
 syscall interrupt/return
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 11 Aug 2022 20:11:27 +1000
In-Reply-To: <20220725063111.120926-1-rmclure@linux.ibm.com>
References: <20220725063111.120926-1-rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Olgd9cydQ9QHMpAXPGdClhr2OxDfqHAW
X-Proofpoint-GUID: lANHRiimKsf17Bqgi79ch_o6Z238V5Em
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=542 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110028
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-07-25 at 16:31 +1000, Rohan McLure wrote:
> Clear user state in gprs (assign to zero) to reduce the influence of
> user
> registers on speculation within kernel syscall handlers. Clears occur
> at the very beginning of the sc and scv 0 interrupt handlers, with
> restores occurring following the execution of the syscall handler.
> 
> One function of syscall_exit_prepare is to determine when non-
> volatile
> regs must be restored, and it still serves that purpose on 32-bit.
> Use
> it now for determining where to find XER, CTR, CR.

I'm not sure exactly how syscall_exit_prepare comes into this?

> 
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Update summary
> ---
>  arch/powerpc/kernel/interrupt_64.S | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/interrupt_64.S
> b/arch/powerpc/kernel/interrupt_64.S
> index 3e8a811e09c4..34167cfa5d60 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -70,7 +70,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
>         ld      r2,PACATOC(r13)
>         mfcr    r12
>         li      r11,0
> -       /* Can we avoid saving r3-r8 in common case? */
> +       /* Save syscall parameters in r3-r8 */
>         std     r3,GPR3(r1)
>         std     r4,GPR4(r1)
>         std     r5,GPR5(r1)
> @@ -108,6 +108,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>          * but this is the best we can do.
>          */
>  
> +       /*
> +        * Zero user registers to prevent influencing speculative
> execution
> +        * state of kernel code.
> +        */
> +       NULLIFY_GPRS(5, 12)
> +       NULLIFY_NVGPRS()
> +
>         /* Calling convention has r3 = orig r0, r4 = regs */
>         mr      r3,r0
>         bl      system_call_exception
> @@ -138,6 +145,7 @@ BEGIN_FTR_SECTION
>         HMT_MEDIUM_LOW
>  END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  
> +       REST_NVGPRS(r1)
>         cmpdi   r3,0
>         bne     .Lsyscall_vectored_\name\()_restore_regs
>  
> @@ -180,7 +188,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>         ld      r4,_LINK(r1)
>         ld      r5,_XER(r1)
>  
> -       REST_NVGPRS(r1)
>         ld      r0,GPR0(r1)
>         mtcr    r2
>         mtctr   r3
> @@ -248,7 +255,7 @@ END_BTB_FLUSH_SECTION
>         ld      r2,PACATOC(r13)
>         mfcr    r12
>         li      r11,0
> -       /* Can we avoid saving r3-r8 in common case? */
> +       /* Save syscall parameters in r3-r8 */
>         std     r3,GPR3(r1)
>         std     r4,GPR4(r1)
>         std     r5,GPR5(r1)
> @@ -298,6 +305,13 @@ END_BTB_FLUSH_SECTION
>         wrteei  1
>  #endif
>  
> +       /*
> +        * Zero user registers to prevent influencing speculative
> execution
> +        * state of kernel code.
> +        */
> +       NULLIFY_GPRS(5, 12)
> +       NULLIFY_NVGPRS()
> +
>         /* Calling convention has r3 = orig r0, r4 = regs */
>         mr      r3,r0
>         bl      system_call_exception
> @@ -340,6 +354,7 @@ BEGIN_FTR_SECTION
>         stdcx.  r0,0,r1                 /* to clear the reservation
> */
>  END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
>  
> +       REST_NVGPRS(r1)
>         cmpdi   r3,0
>         bne     .Lsyscall_restore_regs
>         /* Zero volatile regs that may contain sensitive kernel data
> */
> @@ -367,7 +382,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  .Lsyscall_restore_regs:
>         ld      r3,_CTR(r1)
>         ld      r4,_XER(r1)
> -       REST_NVGPRS(r1)
>         mtctr   r3
>         mtspr   SPRN_XER,r4
>         REST_GPR(0, r1)

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

