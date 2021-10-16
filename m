Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ACC4302AD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 14:54:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWjlf4DG7z3cDK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 23:54:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oIB+/0gN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oIB+/0gN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWjkw0ckgz2yy3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 23:54:15 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19G750IC025282; 
 Sat, 16 Oct 2021 08:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=LeNjYmtBNwAW4Z0+uWRkmgIZKDeR35+n1RjPpsuKees=;
 b=oIB+/0gNbJ+FTlVV/RcQ2jfUAuLZWL8eyi7lwXdt29fmSqtbWm3WekcTiy5vAnlEFNAP
 Qxnuq1RnuEJuwe3eMVreF0CLMbLNG9UOs2vDE2pDjaPwX9vBU0ed0NQA6Xs7tu8UTbfk
 eLKFpOzickdiSw5rcpNOe0lLiejgpRyv+G+Eyoepv1zBbYSMOHxyf8AI13+8s3J9caQ1
 rC3lQU0vzU1wEPevLh48T361SvFdUF7D16lySlncuu7jD+HuHC6pBMYp9S4Ljt1ocYp1
 sNoEQ165IMCFAZy19F7kC12Dt0cg8qBPIcvWOPIOup8VInH0Ev571UzoygpqKyRS0YoU cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bqt1nmm8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Oct 2021 08:54:12 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19GCsChP001586;
 Sat, 16 Oct 2021 08:54:12 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bqt1nmm8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Oct 2021 08:54:12 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19GCpwua013007;
 Sat, 16 Oct 2021 12:54:11 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3bqpc9dpv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Oct 2021 12:54:11 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19GCsAXC17695368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 16 Oct 2021 12:54:10 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E766078060;
 Sat, 16 Oct 2021 12:54:09 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 382007805C;
 Sat, 16 Oct 2021 12:54:09 +0000 (GMT)
Received: from localhost (unknown [9.211.42.218])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Sat, 16 Oct 2021 12:54:08 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 17/52] KVM: PPC: Book3S HV: CTRL SPR does not require
 read-modify-write
In-Reply-To: <20211004160049.1338837-18-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
 <20211004160049.1338837-18-npiggin@gmail.com>
Date: Sat, 16 Oct 2021 09:54:06 -0300
Message-ID: <87wnmdw2oh.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -wlrPdCThThsoDuvXAfGv3NGK4vQKFH4
X-Proofpoint-GUID: wBMjiIObMqVLTk2Rx-NFAPhzD2Nve1x7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-16_04,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110160081
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Processors that support KVM HV do not require read-modify-write of
> the CTRL SPR to set/clear their thread's runlatch. Just write 1 or 0
> to it.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/kvm/book3s_hv.c            |  2 +-
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 15 ++++++---------
>  2 files changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index f0ad3fb2eabd..1c5b81bd02c1 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4058,7 +4058,7 @@ static void load_spr_state(struct kvm_vcpu *vcpu)
>  	 */
>
>  	if (!(vcpu->arch.ctrl & 1))
> -		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
> +		mtspr(SPRN_CTRLT, 0);
>  }
>
>  static void store_spr_state(struct kvm_vcpu *vcpu)
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index 7fa0df632f89..070e228b3c20 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -775,12 +775,11 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
>  	mtspr	SPRN_AMR,r5
>  	mtspr	SPRN_UAMOR,r6
>
> -	/* Restore state of CTRL run bit; assume 1 on entry */
> +	/* Restore state of CTRL run bit; the host currently has it set to 1 */
>  	lwz	r5,VCPU_CTRL(r4)
>  	andi.	r5,r5,1
>  	bne	4f
> -	mfspr	r6,SPRN_CTRLF
> -	clrrdi	r6,r6,1
> +	li	r6,0
>  	mtspr	SPRN_CTRLT,r6
>  4:
>  	/* Secondary threads wait for primary to have done partition switch */
> @@ -1203,12 +1202,12 @@ guest_bypass:
>  	stw	r0, VCPU_CPU(r9)
>  	stw	r0, VCPU_THREAD_CPU(r9)
>
> -	/* Save guest CTRL register, set runlatch to 1 */
> +	/* Save guest CTRL register, set runlatch to 1 if it was clear */
>  	mfspr	r6,SPRN_CTRLF
>  	stw	r6,VCPU_CTRL(r9)
>  	andi.	r0,r6,1
>  	bne	4f
> -	ori	r6,r6,1
> +	li	r6,1
>  	mtspr	SPRN_CTRLT,r6
>  4:
>  	/*
> @@ -2178,8 +2177,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_TM)
>  	 * Also clear the runlatch bit before napping.
>  	 */
>  kvm_do_nap:
> -	mfspr	r0, SPRN_CTRLF
> -	clrrdi	r0, r0, 1
> +	li	r0,0
>  	mtspr	SPRN_CTRLT, r0
>
>  	li	r0,1
> @@ -2198,8 +2196,7 @@ kvm_nap_sequence:		/* desired LPCR value in r5 */
>
>  	bl	isa206_idle_insn_mayloss
>
> -	mfspr	r0, SPRN_CTRLF
> -	ori	r0, r0, 1
> +	li	r0,1
>  	mtspr	SPRN_CTRLT, r0
>
>  	mtspr	SPRN_SRR1, r3
