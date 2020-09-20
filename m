Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD4527128D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 07:57:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvH0p4rC3zDqyZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 15:57:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hA4TqKPB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvGz54TWnzDqtK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 15:56:17 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08K5VMOO147438; Sun, 20 Sep 2020 01:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=byGWq0MiFEGnb4aHSOTqVte4pU9dwPW4q3IeqYeWY9w=;
 b=hA4TqKPBtck2Le/2WVoyvqqU45f1cimE9C+GOH6UCJYcYx6RjfyGLzeBYoOIxHyvCs+k
 QofqYd104NZBevmAbLlHQPtygLQctFT0GuVMkmwrwu2AxJrfnjKRQvFAb9dpOPWIxW2s
 va/2Y1KXFg0chaQzbPCMvwSa8/XXXJsSWx+PYuWXeT9+kSphSbYUtJpUZbZhUX/tYcNE
 Y1WjeAFWBiKaGOLMKne/F8iggGrYP7nhJH5eVOBGuBFcKy7u/RqmMW1QLX7/DulwbTYr
 Ekz+RVa/oPFLLxfX0LzuOSJAHHHhTPmeOdBKalgr9EA4RjCSUCbiNtFUGX/aml3NRrtM WA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33p0x5gdfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Sep 2020 01:56:09 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08K5prMo004366;
 Sun, 20 Sep 2020 05:56:08 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 33n9m8f0tr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Sep 2020 05:56:08 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08K5u8Ti44761436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 20 Sep 2020 05:56:08 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C67F28059;
 Sun, 20 Sep 2020 05:56:08 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C388F28058;
 Sun, 20 Sep 2020 05:56:06 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.79.210.119])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun, 20 Sep 2020 05:56:06 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Gustavo Romero <gromero@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/tm: Save and restore AMR on treclaim and
 trechkpt
In-Reply-To: <20200919150025.9609-1-gromero@linux.ibm.com>
References: <20200919150025.9609-1-gromero@linux.ibm.com>
Date: Sun, 20 Sep 2020 11:26:01 +0530
Message-ID: <878sd5uh3i.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-20_01:2020-09-16,
 2020-09-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 mlxscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009200043
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
Cc: mikey@neuling.org, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gustavo Romero <gromero@linux.ibm.com> writes:

> Althought AMR is stashed in the checkpoint area, currently we don't save
> it to the per thread checkpoint struct after a treclaim and so we don't
> restore it either from that struct when we trechkpt. As a consequence when
> the transaction is later rolled back the kernel space AMR value when the
> trechkpt was done appears in userspace.
>
> That commit saves and restores AMR accordingly on treclaim and trechkpt.
> Since AMR value is also used in kernel space in other functions, it also
> takes care of stashing kernel live AMR into the stack before treclaim and
> before trechkpt, restoring it later, just before returning from tm_reclaim
> and __tm_recheckpoint.
>
> Is also fixes two nonrelated comments about CR and MSR.
>

Tested-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/processor.h |  1 +
>  arch/powerpc/kernel/asm-offsets.c    |  1 +
>  arch/powerpc/kernel/tm.S             | 35 ++++++++++++++++++++++++----
>  3 files changed, 33 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> index ed0d633ab5aa..9f4f6cc033ac 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -220,6 +220,7 @@ struct thread_struct {
>  	unsigned long	tm_tar;
>  	unsigned long	tm_ppr;
>  	unsigned long	tm_dscr;
> +	unsigned long   tm_amr;
>  
>  	/*
>  	 * Checkpointed FP and VSX 0-31 register set.
> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
> index 8711c2164b45..c2722ff36e98 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -176,6 +176,7 @@ int main(void)
>  	OFFSET(THREAD_TM_TAR, thread_struct, tm_tar);
>  	OFFSET(THREAD_TM_PPR, thread_struct, tm_ppr);
>  	OFFSET(THREAD_TM_DSCR, thread_struct, tm_dscr);
> +	OFFSET(THREAD_TM_AMR, thread_struct, tm_amr);
>  	OFFSET(PT_CKPT_REGS, thread_struct, ckpt_regs);
>  	OFFSET(THREAD_CKVRSTATE, thread_struct, ckvr_state.vr);
>  	OFFSET(THREAD_CKVRSAVE, thread_struct, ckvrsave);
> diff --git a/arch/powerpc/kernel/tm.S b/arch/powerpc/kernel/tm.S
> index 6ba0fdd1e7f8..2b91f233b05d 100644
> --- a/arch/powerpc/kernel/tm.S
> +++ b/arch/powerpc/kernel/tm.S
> @@ -122,6 +122,13 @@ _GLOBAL(tm_reclaim)
>  	std	r3, STK_PARAM(R3)(r1)
>  	SAVE_NVGPRS(r1)
>  
> +	/*
> +	 * Save kernel live AMR since it will be clobbered by treclaim
> +	 * but can be used elsewhere later in kernel space.
> +	 */
> +	mfspr	r3, SPRN_AMR
> +	std	r3, TM_FRAME_L1(r1)
> +
>  	/* We need to setup MSR for VSX register save instructions. */
>  	mfmsr	r14
>  	mr	r15, r14
> @@ -245,7 +252,7 @@ _GLOBAL(tm_reclaim)
>  	 * but is used in signal return to 'wind back' to the abort handler.
>  	 */
>  
> -	/* ******************** CR,LR,CCR,MSR ********** */
> +	/* ***************** CTR, LR, CR, XER ********** */
>  	mfctr	r3
>  	mflr	r4
>  	mfcr	r5
> @@ -256,7 +263,6 @@ _GLOBAL(tm_reclaim)
>  	std	r5, _CCR(r7)
>  	std	r6, _XER(r7)
>  
> -
>  	/* ******************** TAR, DSCR ********** */
>  	mfspr	r3, SPRN_TAR
>  	mfspr	r4, SPRN_DSCR
> @@ -264,6 +270,10 @@ _GLOBAL(tm_reclaim)
>  	std	r3, THREAD_TM_TAR(r12)
>  	std	r4, THREAD_TM_DSCR(r12)
>  
> +        /* ******************** AMR **************** */
> +        mfspr	r3, SPRN_AMR
> +        std	r3, THREAD_TM_AMR(r12)
> +
>  	/*
>  	 * MSR and flags: We don't change CRs, and we don't need to alter MSR.
>  	 */
> @@ -308,7 +318,9 @@ _GLOBAL(tm_reclaim)
>  	std	r3, THREAD_TM_TFHAR(r12)
>  	std	r4, THREAD_TM_TFIAR(r12)
>  
> -	/* AMR is checkpointed too, but is unsupported by Linux. */
> +	/* Restore kernel live AMR */
> +	ld	r8, TM_FRAME_L1(r1)
> +	mtspr	SPRN_AMR, r8
>  
>  	/* Restore original MSR/IRQ state & clear TM mode */
>  	ld	r14, TM_FRAME_L0(r1)		/* Orig MSR */
> @@ -355,6 +367,13 @@ _GLOBAL(__tm_recheckpoint)
>  	 */
>  	SAVE_NVGPRS(r1)
>  
> +	/*
> +	 * Save kernel live AMR since it will be clobbered for trechkpt
> +	 * but can be used elsewhere later in kernel space.
> +	 */
> +	mfspr	r8, SPRN_AMR
> +	std	r8, TM_FRAME_L0(r1)
> +
>  	/* Load complete register state from ts_ckpt* registers */
>  
>  	addi	r7, r3, PT_CKPT_REGS		/* Thread's ckpt_regs */
> @@ -404,7 +423,7 @@ _GLOBAL(__tm_recheckpoint)
>  
>  restore_gprs:
>  
> -	/* ******************** CR,LR,CCR,MSR ********** */
> +	/* ****************** CTR, LR, XER ************* */
>  	ld	r4, _CTR(r7)
>  	ld	r5, _LINK(r7)
>  	ld	r8, _XER(r7)
> @@ -417,6 +436,10 @@ restore_gprs:
>  	ld	r4, THREAD_TM_TAR(r3)
>  	mtspr	SPRN_TAR,	r4
>  
> +	/* ******************** AMR ******************** */
> +	ld	r4, THREAD_TM_AMR(r3)
> +	mtspr	SPRN_AMR, r4
> +
>  	/* Load up the PPR and DSCR in GPRs only at this stage */
>  	ld	r5, THREAD_TM_DSCR(r3)
>  	ld	r6, THREAD_TM_PPR(r3)
> @@ -509,6 +532,10 @@ restore_gprs:
>  	li	r4, MSR_RI
>  	mtmsrd	r4, 1
>  
> +	/* Restore kernel live AMR */
> +	ld	r8, TM_FRAME_L0(r1)
> +	mtspr	SPRN_AMR, r8
> +
>  	REST_NVGPRS(r1)
>  
>  	addi    r1, r1, TM_FRAME_SIZE
> -- 
> 2.25.1
