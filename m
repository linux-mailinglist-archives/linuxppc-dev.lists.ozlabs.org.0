Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D61A13B8941
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 21:42:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFWvV5R4Yz3083
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 05:42:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NCSYOEdr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NCSYOEdr; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFWv05k4lz2yMW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 05:41:48 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UJZ8Zq150208; Wed, 30 Jun 2021 15:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=UREYfItj4ktwJPiN5lgQ/+u/Yuv8JtWczF9v+DvGUkQ=;
 b=NCSYOEdrecTe71nlCyRdkX10yEfx9zXV6O26dgIxV+Xts16x/Lx3k/d5hwdGNDN3PM89
 pjpmRFEK7PvjsRX8xrlbubK4DSnmjTnJpxQR3Enk1tL5oTuSW6eKOHpKCJDurGVFsHUu
 yDUpWNnnh8YJGAS+PBvK2UABlrR2FhO9P4WD4gqW25khvLWGWK6NCgb7Wcj0K4r+v3kw
 iiwHHRWSIXX6/+RR28/ed1MFzHyf29A5XygK3PbrgPtK7g7Hx4QUKuKN04Ullg2717zH
 4sgQEEckp7UG68Kg+ThvaVTE39X06GDrr8Q5GXHXzVgKi+Box6cOIQvFTQ381WYE5nWl eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gvmkm7cy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 15:41:45 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15UJZKIB151223;
 Wed, 30 Jun 2021 15:41:45 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gvmkm7cr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 15:41:45 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15UJWPpt007283;
 Wed, 30 Jun 2021 19:41:44 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 39duvd9n90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 19:41:44 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15UJfinC30212552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:41:44 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17717AE015;
 Wed, 30 Jun 2021 19:41:44 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C21CAE012;
 Wed, 30 Jun 2021 19:41:43 +0000 (GMT)
Received: from localhost (unknown [9.211.127.242])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 30 Jun 2021 19:41:42 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [RFC PATCH 07/43] KVM: PPC: Book3S HV: POWER10 enable HAIL when
 running radix guests
In-Reply-To: <20210622105736.633352-8-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
 <20210622105736.633352-8-npiggin@gmail.com>
Date: Wed, 30 Jun 2021 16:41:40 -0300
Message-ID: <878s2r2l8r.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ce5oA2nd1OMFIAw7Hoa4Fhh1uLK9YYMn
X-Proofpoint-GUID: jpgS7y2wnVaaoUayAtXJGki2Lbg-Gk5T
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_08:2021-06-30,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300108
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

> HV interrupts may be taken with the MMU enabled when radix guests are
> running. Enable LPCR[HAIL] on ISA v3.1 processors for radix guests.
> Make this depend on the host LPCR[HAIL] being enabled. Currently that is
> always enabled, but having this test means any issue that might require
> LPCR[HAIL] to be disabled in the host will not have to be duplicated in
> KVM.
>
> -1380 cycles on P10 NULL hcall entry+exit
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/kvm/book3s_hv.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 36e1db48fccf..ed713f49fbd5 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4896,6 +4896,8 @@ static int kvmppc_hv_setup_htab_rma(struct kvm_vcpu *vcpu)
>   */
>  int kvmppc_switch_mmu_to_hpt(struct kvm *kvm)
>  {
> +	unsigned long lpcr, lpcr_mask;
> +
>  	if (nesting_enabled(kvm))
>  		kvmhv_release_all_nested(kvm);
>  	kvmppc_rmap_reset(kvm);
> @@ -4905,8 +4907,13 @@ int kvmppc_switch_mmu_to_hpt(struct kvm *kvm)
>  	kvm->arch.radix = 0;
>  	spin_unlock(&kvm->mmu_lock);
>  	kvmppc_free_radix(kvm);
> -	kvmppc_update_lpcr(kvm, LPCR_VPM1,
> -			   LPCR_VPM1 | LPCR_UPRT | LPCR_GTSE | LPCR_HR);
> +
> +	lpcr = LPCR_VPM1;
> +	lpcr_mask = LPCR_VPM1 | LPCR_UPRT | LPCR_GTSE | LPCR_HR;
> +	if (cpu_has_feature(CPU_FTR_ARCH_31))
> +		lpcr_mask |= LPCR_HAIL;
> +	kvmppc_update_lpcr(kvm, lpcr, lpcr_mask);
> +
>  	return 0;
>  }
>
> @@ -4916,6 +4923,7 @@ int kvmppc_switch_mmu_to_hpt(struct kvm *kvm)
>   */
>  int kvmppc_switch_mmu_to_radix(struct kvm *kvm)
>  {
> +	unsigned long lpcr, lpcr_mask;
>  	int err;
>
>  	err = kvmppc_init_vm_radix(kvm);
> @@ -4927,8 +4935,17 @@ int kvmppc_switch_mmu_to_radix(struct kvm *kvm)
>  	kvm->arch.radix = 1;
>  	spin_unlock(&kvm->mmu_lock);
>  	kvmppc_free_hpt(&kvm->arch.hpt);
> -	kvmppc_update_lpcr(kvm, LPCR_UPRT | LPCR_GTSE | LPCR_HR,
> -			   LPCR_VPM1 | LPCR_UPRT | LPCR_GTSE | LPCR_HR);
> +
> +	lpcr = LPCR_UPRT | LPCR_GTSE | LPCR_HR;
> +	lpcr_mask = LPCR_VPM1 | LPCR_UPRT | LPCR_GTSE | LPCR_HR;
> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +		lpcr_mask |= LPCR_HAIL;
> +		if (cpu_has_feature(CPU_FTR_HVMODE) &&
> +				(kvm->arch.host_lpcr & LPCR_HAIL))
> +			lpcr |= LPCR_HAIL;
> +	}
> +	kvmppc_update_lpcr(kvm, lpcr, lpcr_mask);
> +
>  	return 0;
>  }
>
> @@ -5092,6 +5109,10 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
>  		kvm->arch.mmu_ready = 1;
>  		lpcr &= ~LPCR_VPM1;
>  		lpcr |= LPCR_UPRT | LPCR_GTSE | LPCR_HR;
> +		if (cpu_has_feature(CPU_FTR_HVMODE) &&
> +		    cpu_has_feature(CPU_FTR_ARCH_31) &&
> +		    (kvm->arch.host_lpcr & LPCR_HAIL))
> +			lpcr |= LPCR_HAIL;
>  		ret = kvmppc_init_vm_radix(kvm);
>  		if (ret) {
>  			kvmppc_free_lpid(kvm->arch.lpid);
