Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B84FD4CB5A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 11:55:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Txy95yRCzDrCs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 19:55:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mahesh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TxwN6jfyzDr2h
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 19:53:40 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5K9rLPn138681
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 05:53:38 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t84um738p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 05:53:37 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Thu, 20 Jun 2019 10:53:36 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Jun 2019 10:53:34 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5K9rXMa36241526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jun 2019 09:53:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD4CC11C050;
 Thu, 20 Jun 2019 09:53:32 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FADD11C06C;
 Thu, 20 Jun 2019 09:53:32 +0000 (GMT)
Received: from in.ibm.com (unknown [9.102.0.246])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 20 Jun 2019 09:53:32 +0000 (GMT)
Date: Thu, 20 Jun 2019 15:23:29 +0530
From: Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 43/52] powerpc/64s/exception: machine check early only
 runs in HV mode
References: <20190620051459.29573-1-npiggin@gmail.com>
 <20190620051459.29573-44-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620051459.29573-44-npiggin@gmail.com>
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
x-cbid: 19062009-0008-0000-0000-000002F57331
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062009-0009-0000-0000-000022629346
Message-Id: <20190620095329.rvrwxgtjsgkc4k5t@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-20_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906200073
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
Reply-To: mahesh@linux.vnet.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-06-20 15:14:50 Thu, Nicholas Piggin wrote:
> machine_check_common_early and machine_check_handle_early only run in
> HVMODE. Remove dead code.

That's not true. For pseries guest with FWNMI enabled hypervisor,
machine_check_common_early gets called in non-HV mode as well.

   machine_check_fwnmi
     machine_check_common_early
       machine_check_handle_early
         machine_check_early
           pseries_machine_check_realmode

Thanks,
-Mahesh.

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/exceptions-64s.S | 38 +++++-----------------------
>  1 file changed, 6 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index b12755a4f884..f3362adc99e6 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -1014,10 +1014,7 @@ TRAMP_REAL_BEGIN(machine_check_common_early)
>  	/* Save r9 through r13 from EXMC save area to stack frame. */
>  	EXCEPTION_PROLOG_COMMON_2(PACA_EXMC)
>  	mfmsr	r11			/* get MSR value */
> -BEGIN_FTR_SECTION
> -	ori	r11,r11,MSR_ME		/* turn on ME bit */
> -END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
> -	ori	r11,r11,MSR_RI		/* turn on RI bit */
> +	ori	r11,r11,MSR_ME|MSR_RI	/* turn on ME, RI */
>  	LOAD_HANDLER(r12, machine_check_handle_early)
>  1:	mtspr	SPRN_SRR0,r12
>  	mtspr	SPRN_SRR1,r11
> @@ -1124,11 +1121,8 @@ EXC_COMMON_BEGIN(machine_check_handle_early)
>  	bl	machine_check_early
>  	std	r3,RESULT(r1)	/* Save result */
>  	ld	r12,_MSR(r1)
> -BEGIN_FTR_SECTION
> -	b	4f
> -END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
> 
> -#ifdef	CONFIG_PPC_P7_NAP
> +#ifdef CONFIG_PPC_P7_NAP
>  	/*
>  	 * Check if thread was in power saving mode. We come here when any
>  	 * of the following is true:
> @@ -1141,7 +1135,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
>  BEGIN_FTR_SECTION
>  	rlwinm.	r11,r12,47-31,30,31
>  	bne	machine_check_idle_common
> -END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
> +END_FTR_SECTION_IFSET(CPU_FTR_ARCH_206)
>  #endif
> 
>  	/*
> @@ -1150,12 +1144,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
>  	 */
>  	rldicl.	r11,r12,4,63		/* See if MC hit while in HV mode. */
>  	beq	5f
> -4:	andi.	r11,r12,MSR_PR		/* See if coming from user. */
> +	andi.	r11,r12,MSR_PR		/* See if coming from user. */
>  	bne	9f			/* continue in V mode if we are. */
> 
>  5:
>  #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
> -BEGIN_FTR_SECTION
>  	/*
>  	 * We are coming from kernel context. Check if we are coming from
>  	 * guest. if yes, then we can continue. We will fall through
> @@ -1164,7 +1157,6 @@ BEGIN_FTR_SECTION
>  	lbz	r11,HSTATE_IN_GUEST(r13)
>  	cmpwi	r11,0			/* Check if coming from guest */
>  	bne	9f			/* continue if we are. */
> -END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
>  #endif
>  	/*
>  	 * At this point we are not sure about what context we come from.
> @@ -1199,7 +1191,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
>  	cmpdi	r3,0		/* see if we handled MCE successfully */
> 
>  	beq	1b		/* if !handled then panic */
> -BEGIN_FTR_SECTION
> +
>  	/*
>  	 * Return from MC interrupt.
>  	 * Queue up the MCE event so that we can log it later, while
> @@ -1208,18 +1200,7 @@ BEGIN_FTR_SECTION
>  	bl	machine_check_queue_event
>  	MACHINE_CHECK_HANDLER_WINDUP
>  	RFI_TO_USER_OR_KERNEL
> -FTR_SECTION_ELSE
> -	/*
> -	 * pSeries: Return from MC interrupt. Before that stay on emergency
> -	 * stack and call machine_check_exception to log the MCE event.
> -	 */
> -	LOAD_HANDLER(r10,mce_return)
> -	mtspr	SPRN_SRR0,r10
> -	ld	r10,PACAKMSR(r13)
> -	mtspr	SPRN_SRR1,r10
> -	RFI_TO_KERNEL
> -	b	.
> -ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
> +
>  9:
>  	/* Deliver the machine check to host kernel in V mode. */
>  	MACHINE_CHECK_HANDLER_WINDUP
> @@ -1238,13 +1219,6 @@ EXC_COMMON_BEGIN(unrecover_mce)
>  	bl	unrecoverable_exception
>  	b	1b
> 
> -EXC_COMMON_BEGIN(mce_return)
> -	/* Invoke machine_check_exception to print MCE event and return. */
> -	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	bl	machine_check_exception
> -	MACHINE_CHECK_HANDLER_WINDUP
> -	RFI_TO_KERNEL
> -	b	.
> 
>  EXC_REAL_BEGIN(data_access, 0x300, 0x80)
>  	EXCEPTION_PROLOG_0 PACA_EXGEN
> -- 
> 2.20.1
> 

-- 
Mahesh J Salgaonkar

