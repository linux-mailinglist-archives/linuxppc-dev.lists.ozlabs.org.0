Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC4F3E3086
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 22:45:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhHYw1Gg4z3dGb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 06:45:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j95/E9up;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j95/E9up; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhHYP09yNz3cLc
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 06:45:28 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176KXnDq162323; Fri, 6 Aug 2021 16:45:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=NlG+se/XKTSFl4tDG+yNmXD9GEls7/ctq2cRzIYOnuM=;
 b=j95/E9upaWqPDjhnTl1H1F6XiRA2bMKnOIvByKLCEzJ5/KFVoJM5VojLHSg19E8zCZVX
 QcsNzeEz+IbBd/Q5X1esO1USAEBsKZLkUWFDqtCNhV+2H0bad+EWnokW9M3tkWgRtlI3
 CosoGu1cedsys4tplaBobn45hpIXrJQPa7PO0tSMfJo7bx6AmAGYPmWzv2ELs/095gU8
 8ZYYIz5CLk1bbR23DydRtiw/IT4SUiSJRQiVk2U8AbR7sKH2gEpdQlXOJvs/knz0eP3W
 mkz2vJTapRuKI+7Oud1XYwAOq4Bn3k/Xkyg1EpTIvmmQwW3VFvudM/I6AlCKBL4F/bDt 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a8m9v5qpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 16:45:24 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 176KYPW4166983;
 Fri, 6 Aug 2021 16:45:24 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a8m9v5qpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 16:45:24 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 176KcJY4025484;
 Fri, 6 Aug 2021 20:45:23 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 3a8mqa53f7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 20:45:23 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 176KjMAD30474676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Aug 2021 20:45:22 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CA867805F;
 Fri,  6 Aug 2021 20:45:22 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E203578068;
 Fri,  6 Aug 2021 20:45:21 +0000 (GMT)
Received: from localhost (unknown [9.211.46.8])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  6 Aug 2021 20:45:21 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v1 30/55] KVM: PPC: Book3S HV P9: Only execute mtSPR if
 the value changed
In-Reply-To: <20210726035036.739609-31-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
 <20210726035036.739609-31-npiggin@gmail.com>
Date: Fri, 06 Aug 2021 17:45:19 -0300
Message-ID: <875ywiti8w.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ii6_keZEddzMnVM3hyJcfgfhdmU3fP5O
X-Proofpoint-ORIG-GUID: J4j74svicpsIxTuWIkpJ0Jwk4Xr98E9N
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_06:2021-08-06,
 2021-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108060136
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Keep better track of the current SPR value in places where
> they are to be loaded with a new context, to reduce expensive
> mtSPR operations.
>
> -73 cycles (7354) POWER9 virt-mode NULL hcall
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/kvm/book3s_hv.c | 64 ++++++++++++++++++++++--------------
>  1 file changed, 39 insertions(+), 25 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 0d97138e6fa4..56429b53f4dc 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4009,19 +4009,28 @@ static void switch_pmu_to_host(struct kvm_vcpu *vcpu,
>  	}
>  }
>
> -static void load_spr_state(struct kvm_vcpu *vcpu)
> +static void load_spr_state(struct kvm_vcpu *vcpu,
> +				struct p9_host_os_sprs *host_os_sprs)
>  {
> -	mtspr(SPRN_DSCR, vcpu->arch.dscr);
> -	mtspr(SPRN_IAMR, vcpu->arch.iamr);
> -	mtspr(SPRN_PSPB, vcpu->arch.pspb);
> -	mtspr(SPRN_FSCR, vcpu->arch.fscr);
>  	mtspr(SPRN_TAR, vcpu->arch.tar);
>  	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
>  	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
>  	mtspr(SPRN_BESCR, vcpu->arch.bescr);
> -	mtspr(SPRN_TIDR, vcpu->arch.tid);
> -	mtspr(SPRN_AMR, vcpu->arch.amr);
> -	mtspr(SPRN_UAMOR, vcpu->arch.uamor);
> +
> +	if (!cpu_has_feature(CPU_FTR_ARCH_31))
> +		mtspr(SPRN_TIDR, vcpu->arch.tid);
> +	if (host_os_sprs->iamr != vcpu->arch.iamr)
> +		mtspr(SPRN_IAMR, vcpu->arch.iamr);
> +	if (host_os_sprs->amr != vcpu->arch.amr)
> +		mtspr(SPRN_AMR, vcpu->arch.amr);
> +	if (vcpu->arch.uamor != 0)
> +		mtspr(SPRN_UAMOR, vcpu->arch.uamor);
> +	if (host_os_sprs->fscr != vcpu->arch.fscr)
> +		mtspr(SPRN_FSCR, vcpu->arch.fscr);
> +	if (host_os_sprs->dscr != vcpu->arch.dscr)
> +		mtspr(SPRN_DSCR, vcpu->arch.dscr);
> +	if (vcpu->arch.pspb != 0)
> +		mtspr(SPRN_PSPB, vcpu->arch.pspb);
>
>  	/*
>  	 * DAR, DSISR, and for nested HV, SPRGs must be set with MSR[RI]
> @@ -4036,28 +4045,31 @@ static void load_spr_state(struct kvm_vcpu *vcpu)
>
>  static void store_spr_state(struct kvm_vcpu *vcpu)
>  {
> -	vcpu->arch.ctrl = mfspr(SPRN_CTRLF);
> -
> -	vcpu->arch.iamr = mfspr(SPRN_IAMR);
> -	vcpu->arch.pspb = mfspr(SPRN_PSPB);
> -	vcpu->arch.fscr = mfspr(SPRN_FSCR);
>  	vcpu->arch.tar = mfspr(SPRN_TAR);
>  	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
>  	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
>  	vcpu->arch.bescr = mfspr(SPRN_BESCR);
> -	vcpu->arch.tid = mfspr(SPRN_TIDR);
> +
> +	if (!cpu_has_feature(CPU_FTR_ARCH_31))
> +		vcpu->arch.tid = mfspr(SPRN_TIDR);
> +	vcpu->arch.iamr = mfspr(SPRN_IAMR);
>  	vcpu->arch.amr = mfspr(SPRN_AMR);
>  	vcpu->arch.uamor = mfspr(SPRN_UAMOR);
> +	vcpu->arch.fscr = mfspr(SPRN_FSCR);
>  	vcpu->arch.dscr = mfspr(SPRN_DSCR);
> +	vcpu->arch.pspb = mfspr(SPRN_PSPB);
> +
> +	vcpu->arch.ctrl = mfspr(SPRN_CTRLF);
>  }
>
>  static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
>  {
> -	host_os_sprs->dscr = mfspr(SPRN_DSCR);
> -	host_os_sprs->tidr = mfspr(SPRN_TIDR);
> +	if (!cpu_has_feature(CPU_FTR_ARCH_31))
> +		host_os_sprs->tidr = mfspr(SPRN_TIDR);
>  	host_os_sprs->iamr = mfspr(SPRN_IAMR);
>  	host_os_sprs->amr = mfspr(SPRN_AMR);
>  	host_os_sprs->fscr = mfspr(SPRN_FSCR);
> +	host_os_sprs->dscr = mfspr(SPRN_DSCR);
>  }
>
>  /* vcpu guest regs must already be saved */
> @@ -4066,18 +4078,20 @@ static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
>  {
>  	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
>
> -	mtspr(SPRN_PSPB, 0);
> -	mtspr(SPRN_UAMOR, 0);
> -
> -	mtspr(SPRN_DSCR, host_os_sprs->dscr);
> -	mtspr(SPRN_TIDR, host_os_sprs->tidr);
> -	mtspr(SPRN_IAMR, host_os_sprs->iamr);
> -
> +	if (!cpu_has_feature(CPU_FTR_ARCH_31))
> +		mtspr(SPRN_TIDR, host_os_sprs->tidr);
> +	if (host_os_sprs->iamr != vcpu->arch.iamr)
> +		mtspr(SPRN_IAMR, host_os_sprs->iamr);
> +	if (vcpu->arch.uamor != 0)
> +		mtspr(SPRN_UAMOR, 0);
>  	if (host_os_sprs->amr != vcpu->arch.amr)
>  		mtspr(SPRN_AMR, host_os_sprs->amr);
> -
>  	if (host_os_sprs->fscr != vcpu->arch.fscr)
>  		mtspr(SPRN_FSCR, host_os_sprs->fscr);
> +	if (host_os_sprs->dscr != vcpu->arch.dscr)
> +		mtspr(SPRN_DSCR, host_os_sprs->dscr);
> +	if (vcpu->arch.pspb != 0)
> +		mtspr(SPRN_PSPB, 0);
>
>  	/* Save guest CTRL register, set runlatch to 1 */
>  	if (!(vcpu->arch.ctrl & 1))
> @@ -4169,7 +4183,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  #endif
>  	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
>
> -	load_spr_state(vcpu);
> +	load_spr_state(vcpu, &host_os_sprs);
>
>  	if (kvmhv_on_pseries()) {
>  		/*
