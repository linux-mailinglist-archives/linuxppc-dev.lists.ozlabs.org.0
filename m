Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F9326F4F9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 06:22:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt0zz63mbzDqlZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 14:22:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=C1bdNv4Y; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt0y35Jn8zDqCb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 14:20:59 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08I431Ab019480; Fri, 18 Sep 2020 00:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KC3wX+tCMJqDlR5v8hmE2MWfl6lTT7QZwJhTbXVOBYo=;
 b=C1bdNv4YMvajgnsMgGEBa2A+I4CxFPBtBMdZbDf/5BU99QU1otjNbTu2tKqkLO810kZn
 Fq97o/DMy8WFMaPwoLJDbCcVASKAoMnxpoYnuAhW6N3vwLkH6QbbhY6BNX3+m4OAWG16
 A5iAuNV5OiCNc0odAXTNtW1SD91M8LC/7K/dahtHzULs01doqO8DVFoDQ1b/lR4zG2TZ
 QtUaKJvuhHFWV5N9geKogRMt18RO6f7cPpDxHy9iVVQ9YqLmQNgNWijYyQrqldxGdPaf
 eMDKDpGFshXs/F1e1YQKolZbPG0w90OrBmMhXvx0e0pb3qfcSjEGetV4VBltbtT0xJN3 hQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33mmqv18tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 00:20:53 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08I4HYTZ010586;
 Fri, 18 Sep 2020 04:20:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 33k5v99ecs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 04:20:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08I4Kmlb28049666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Sep 2020 04:20:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2431FA4060;
 Fri, 18 Sep 2020 04:20:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C2E4A4054;
 Fri, 18 Sep 2020 04:20:48 +0000 (GMT)
Received: from [9.85.74.160] (unknown [9.85.74.160])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Sep 2020 04:20:47 +0000 (GMT)
Subject: Re: [PATCH] powerpc/tm: Save and restore AMR on treclaim and trechkpt
To: Gustavo Romero <gromero@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20200918040536.9046-1-gromero@linux.ibm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <3e0e8771-68e1-21db-c255-db1c84d61b7a@linux.ibm.com>
Date: Fri, 18 Sep 2020 09:50:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200918040536.9046-1-gromero@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_02:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011
 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009180032
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
Cc: mikey@neuling.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/18/20 9:35 AM, Gustavo Romero wrote:
> Althought AMR is stashed on the checkpoint area, currently we don't save
> it to the per thread checkpoint struct after a treclaim and so we don't
> restore it either from that struct when we trechkpt. As a consequence when
> the transaction is later rolled back kernel space AMR value when the
> trechkpt was done appears in userspace.
> 
> That commit saves and restores AMR accordingly on treclaim and trechkpt.
> Since AMR value is also used in kernel space in other functions, it also
> takes care of stashing kernel live AMR into PACA before treclaim and before
> trechkpt, restoring it later, just before returning from tm_reclaim and
> __tm_recheckpoint.
> 
> Is also fixes two nonrelated comments about CR and MSR.
> 
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/paca.h      |  1 +
>   arch/powerpc/include/asm/processor.h |  1 +
>   arch/powerpc/kernel/asm-offsets.c    |  2 ++
>   arch/powerpc/kernel/tm.S             | 31 +++++++++++++++++++++++-----
>   4 files changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
> index 9454d29ff4b4..44c605181529 100644
> --- a/arch/powerpc/include/asm/paca.h
> +++ b/arch/powerpc/include/asm/paca.h
> @@ -179,6 +179,7 @@ struct paca_struct {
>   	u64 sprg_vdso;			/* Saved user-visible sprg */
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   	u64 tm_scratch;                 /* TM scratch area for reclaim */
> +	u64 tm_amr;			/* Saved Kernel AMR for treclaim/trechkpt */
>   #endif
>   
>   #ifdef CONFIG_PPC_POWERNV
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> index ed0d633ab5aa..9f4f6cc033ac 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -220,6 +220,7 @@ struct thread_struct {
>   	unsigned long	tm_tar;
>   	unsigned long	tm_ppr;
>   	unsigned long	tm_dscr;
> +	unsigned long   tm_amr;
>   
>   	/*
>   	 * Checkpointed FP and VSX 0-31 register set.
> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
> index 8711c2164b45..cf1a6d68a91f 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -170,12 +170,14 @@ int main(void)
>   
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   	OFFSET(PACATMSCRATCH, paca_struct, tm_scratch);
> +	OFFSET(PACATMAMR, paca_struct, tm_amr);
>   	OFFSET(THREAD_TM_TFHAR, thread_struct, tm_tfhar);
>   	OFFSET(THREAD_TM_TEXASR, thread_struct, tm_texasr);
>   	OFFSET(THREAD_TM_TFIAR, thread_struct, tm_tfiar);
>   	OFFSET(THREAD_TM_TAR, thread_struct, tm_tar);
>   	OFFSET(THREAD_TM_PPR, thread_struct, tm_ppr);
>   	OFFSET(THREAD_TM_DSCR, thread_struct, tm_dscr);
> +	OFFSET(THREAD_TM_AMR, thread_struct, tm_amr);
>   	OFFSET(PT_CKPT_REGS, thread_struct, ckpt_regs);
>   	OFFSET(THREAD_CKVRSTATE, thread_struct, ckvr_state.vr);
>   	OFFSET(THREAD_CKVRSAVE, thread_struct, ckvrsave);
> diff --git a/arch/powerpc/kernel/tm.S b/arch/powerpc/kernel/tm.S
> index 6ba0fdd1e7f8..e178ddb43619 100644
> --- a/arch/powerpc/kernel/tm.S
> +++ b/arch/powerpc/kernel/tm.S
> @@ -152,6 +152,10 @@ _GLOBAL(tm_reclaim)
>   	li	r5, 0
>   	mtmsrd	r5, 1
>   
> +        /* Save AMR since it's used elsewhere in kernel space */
> +	mfspr	r8, SPRN_AMR
> +	std	r8, PACATMAMR(r13)


Can we save this in stack instead of PACA?


> +
>   	/*
>   	 * BE CAREFUL HERE:
>   	 * At this point we can't take an SLB miss since we have MSR_RI
> @@ -245,7 +249,7 @@ _GLOBAL(tm_reclaim)
>   	 * but is used in signal return to 'wind back' to the abort handler.
>   	 */
>   
> -	/* ******************** CR,LR,CCR,MSR ********** */
> +	/* ***************** CTR, LR, CR, XER ********** */
>   	mfctr	r3
>   	mflr	r4
>   	mfcr	r5
> @@ -256,7 +260,6 @@ _GLOBAL(tm_reclaim)
>   	std	r5, _CCR(r7)
>   	std	r6, _XER(r7)
>   
> -
>   	/* ******************** TAR, DSCR ********** */
>   	mfspr	r3, SPRN_TAR
>   	mfspr	r4, SPRN_DSCR
> @@ -264,6 +267,10 @@ _GLOBAL(tm_reclaim)
>   	std	r3, THREAD_TM_TAR(r12)
>   	std	r4, THREAD_TM_DSCR(r12)
>   
> +        /* ******************** AMR **************** */
> +        mfspr	r3, SPRN_AMR
> +        std	r3, THREAD_TM_AMR(r12)
> +
>   	/*
>   	 * MSR and flags: We don't change CRs, and we don't need to alter MSR.
>   	 */
> @@ -308,8 +315,6 @@ _GLOBAL(tm_reclaim)
>   	std	r3, THREAD_TM_TFHAR(r12)
>   	std	r4, THREAD_TM_TFIAR(r12)
>   
> -	/* AMR is checkpointed too, but is unsupported by Linux. */
> -
>   	/* Restore original MSR/IRQ state & clear TM mode */
>   	ld	r14, TM_FRAME_L0(r1)		/* Orig MSR */
>   
> @@ -330,6 +335,10 @@ _GLOBAL(tm_reclaim)
>   	ld	r0, PACA_DSCR_DEFAULT(r13)
>   	mtspr	SPRN_DSCR, r0
>   
> +        /* Restore kernel saved AMR */
> +	ld	r4, PACATMAMR(r13)
> +	mtspr	SPRN_AMR, r4
> +
>   	blr
>   
>   
> @@ -355,6 +364,10 @@ _GLOBAL(__tm_recheckpoint)
>   	 */
>   	SAVE_NVGPRS(r1)
>   
> +	/* Save kernel AMR since it's used elsewhare in kernel space */
> +	mfspr	r8, SPRN_AMR
> +	std	r8, PACATMAMR(r13)
> +
>   	/* Load complete register state from ts_ckpt* registers */
>   
>   	addi	r7, r3, PT_CKPT_REGS		/* Thread's ckpt_regs */
> @@ -404,7 +417,7 @@ _GLOBAL(__tm_recheckpoint)
>   
>   restore_gprs:
>   
> -	/* ******************** CR,LR,CCR,MSR ********** */
> +	/* ****************** CTR, LR, XER ************* */
>   	ld	r4, _CTR(r7)
>   	ld	r5, _LINK(r7)
>   	ld	r8, _XER(r7)
> @@ -417,6 +430,10 @@ restore_gprs:
>   	ld	r4, THREAD_TM_TAR(r3)
>   	mtspr	SPRN_TAR,	r4
>   
> +	/* ******************** AMR ******************** */
> +	ld	r4, THREAD_TM_AMR(r3)
> +	mtspr	SPRN_AMR, r4
> +
>   	/* Load up the PPR and DSCR in GPRs only at this stage */
>   	ld	r5, THREAD_TM_DSCR(r3)
>   	ld	r6, THREAD_TM_PPR(r3)
> @@ -522,6 +539,10 @@ restore_gprs:
>   	ld	r0, PACA_DSCR_DEFAULT(r13)
>   	mtspr	SPRN_DSCR, r0
>   
> +	/* Restore kernel saved AMR */
> +	ld	r4, PACATMAMR(r13)
> +	mtspr	SPRN_AMR, r4
> +
>   	blr
>   
>   	/* ****************************************************************** */
> 

