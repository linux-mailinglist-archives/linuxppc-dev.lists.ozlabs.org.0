Return-Path: <linuxppc-dev+bounces-10889-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B1AB2392F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 21:41:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1hhM2b2wz2xQ5;
	Wed, 13 Aug 2025 05:41:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755027683;
	cv=none; b=lM9qympvmjK/rfdRK3XAvsgKnCRm9tUyzARREKMDH+4UbjGnYVZuaE/kQChnT1V9dbDnERvGkyn63+75VzdJ3HlpJePZHQXKu8mLh1urjA/oNRi5BiDi7x+djBHVJuR5eJvmR6eol+s99iyAYhnBO7WDSuWdgXfMW8nOdMJbZCOOQDp1H7IJdf8UWb1NQ5YDOCjeC6yXBWXuLwI7HBPX8CbOpG8RTPnQgMVaeslz4JfW6URtX1eodmxPEY5K4cOXBcOVP/1YENRynema6Cs3j6ViYQ4Pgr0Zm11RhJSuyZ0l4jHE5zRO1mzDCKJASMFHErjt8W1eCZTnCVgGhiLPqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755027683; c=relaxed/relaxed;
	bh=HIocEmmHknV3Er6oSMrKwEyHDubnFR8xwjgJ/fmkaLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dynmw9Dd7VtuI3YSjT31N4UOiC+IY8etgxt2Lh01/cqHpk6Oi1X0g3oC5I9Sis2dNDX8BvPHB0YiRT/LrAS/JJBD0CDolU0G2FOpRjaYy27UOpMVrXqGBaEfu6sI7KeAqxaohky69c5qwZtZoUUt3IyJfOLfHpLkz8KxqNUsRKCFMw+HBU7C7IR0bGIGiXp1kQRozXPGXSgYgoh9gnbU4MCYfuCQN4QkDOuZRPgT5SofkbUSJdDVe2c+SIzjKFnNCrcLD5KLAClqqYyXhHY0xk6v2GN25ialobQcfuDZdTuKsaP1mxh27TPC4Myq0cJ25TsjnWxBwsR47iEVMvEjjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PWsery8i; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=akrowiak@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PWsery8i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=akrowiak@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1hhL31Hlz2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 05:41:22 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDXi2O022984;
	Tue, 12 Aug 2025 19:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HIocEm
	mHknV3Er6oSMrKwEyHDubnFR8xwjgJ/fmkaLs=; b=PWsery8i4EluNXh5/CUQX1
	4EsQwKeUF/aCgjzawxt4iKeo308Veh3x0D+Mre7QNNCfk3rnoWzgwKZ8TObpu2k8
	AYhuz1Bw7mx18Wkxv7BTqdfDDqT+jcIP1vQheD2uj6Pnz8kdo1oGVQqcq3MmIxMj
	WZyt3q8qTe+ZlyBhor+hxle3qiFHboPvtiNuvqAKpawLBx7UlRPIbf1Q1CYoSDDO
	BQikAFk2AR05hI/zbu5n4fLdajUOlqfINghC44riC7oC3mFPHEAmM0TfSBIWkiiV
	j1+9wIltM1JesoQJM1bN+kbftKZauILLFxVMQtJHdQl30kkQqcb5+l22m+m57e5w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48duru8kft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 19:40:53 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57CJea2W000805;
	Tue, 12 Aug 2025 19:40:53 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48duru8kfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 19:40:53 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CIj6Jv017600;
	Tue, 12 Aug 2025 19:40:51 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48ekc3krr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 19:40:51 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57CJeoKC31654170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Aug 2025 19:40:50 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2701758055;
	Tue, 12 Aug 2025 19:40:50 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 288D55804B;
	Tue, 12 Aug 2025 19:40:47 +0000 (GMT)
Received: from [9.61.88.156] (unknown [9.61.88.156])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Aug 2025 19:40:47 +0000 (GMT)
Message-ID: <459f6b6f-4c51-492f-a137-637bb61d17bd@linux.ibm.com>
Date: Tue, 12 Aug 2025 15:40:46 -0400
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] KVM: s390/vfio-ap: Use kvm_is_gpa_in_memslot()
 instead of open coded equivalent
To: Sean Christopherson <seanjc@google.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Andy Lutomirski
 <luto@kernel.org>, Xin Li <xin@zytor.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Kirill A. Shutemov" <kas@kernel.org>,
        Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Holger Dengler <dengler@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-sgx@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev,
        linux-s390@vger.kernel.org
References: <20250729174238.593070-1-seanjc@google.com>
 <20250729174238.593070-2-seanjc@google.com>
Content-Language: en-US
From: Anthony Krowiak <akrowiak@linux.ibm.com>
In-Reply-To: <20250729174238.593070-2-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wUyLy7r54uq5s4N33KjtyxxIF6IG3KA9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE4NiBTYWx0ZWRfX7aP/l7ZcVtZa
 dZX9+xrlp4zkFuGVW4392P+pol6seqW/hahqEiQqy5LqXmJIftaeIAqDiK6lxM08bCcVJRcLLS9
 ON2guFIKLHia+Q7PMxonf8VSge5GnRjyY+1rMpAybUP2cAGqNwT+R1ifllolXCTsDJOHI4FQp9q
 /DKo36tMXVC/xVIEGIeOVRnGqt2DCHyaBP9vFHFeNCPpFbLVXEdIXt1isSmG/aUmAsqqYSNkqzq
 jXASDGRHh3KryL9EGDcD1vu3eW2VGvuMiovWzjjmO6J8d6oE6clCyLvuLbf2Uvw8wJSNDkm6hh/
 sE1YPL1lgeMCkjw/iqJO933TO4RUCTm+R3Gi70kvErflhOFpG3+J2MNomx960M1O6hVLlnKSEpJ
 EZAAblAxhsKNGkn+v8tAv1QyuzdhnrlXxv/x/ezGWnM72keyIESm9hZybrHQYh2UjwixLv1X
X-Authority-Analysis: v=2.4 cv=QtNe3Uyd c=1 sm=1 tr=0 ts=689b98c5 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=1XWaLZrsAAAA:8 a=VnNF1IyMAAAA:8
 a=WMn4R6eJaF8VgN3aVUEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: PGtZzgNN4fjfj6Pu373XoqOssQ1e8xOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011
 mlxlogscore=999 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 phishscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120186
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 7/29/25 1:42 PM, Sean Christopherson wrote:
> Use kvm_is_gpa_in_memslot() to check the validity of the notification
> indicator byte address instead of open coding equivalent logic in the VFIO
> AP driver.
>
> Opportunistically use a dedicated wrapper that exists and is exported
> expressly for the VFIO AP module.  kvm_is_gpa_in_memslot() is generally
> unsuitable for use outside of KVM; other drivers typically shouldn't rely
> on KVM's memslots, and using the API requires kvm->srcu (or slots_lock) to
> be held for the entire duration of the usage, e.g. to avoid TOCTOU bugs.
> handle_pqap() is a bit of a special case, as it's explicitly invoked from
> KVM with kvm->srcu already held, and the VFIO AP driver is in many ways an
> extension of KVM that happens to live in a separate module.
>
> Providing a dedicated API for the VFIO AP driver will allow restricting
> the vast majority of generic KVM's exports to KVM submodules (e.g. to x86's
> kvm-{amd,intel}.ko vendor mdoules).
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Acked-by: Anthony Krowiak <akrowiak@linux.ibm.com>

I only reviewed this patch in the series.

> ---
>   arch/s390/include/asm/kvm_host.h  | 2 ++
>   arch/s390/kvm/priv.c              | 8 ++++++++
>   drivers/s390/crypto/vfio_ap_ops.c | 2 +-
>   3 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
> index cb89e54ada25..449bc34e7cc3 100644
> --- a/arch/s390/include/asm/kvm_host.h
> +++ b/arch/s390/include/asm/kvm_host.h
> @@ -719,6 +719,8 @@ bool kvm_s390_pv_cpu_is_protected(struct kvm_vcpu *vcpu);
>   extern int kvm_s390_gisc_register(struct kvm *kvm, u32 gisc);
>   extern int kvm_s390_gisc_unregister(struct kvm *kvm, u32 gisc);
>   
> +bool kvm_s390_is_gpa_in_memslot(struct kvm *kvm, gpa_t gpa);
> +
>   static inline void kvm_arch_free_memslot(struct kvm *kvm,
>   					 struct kvm_memory_slot *slot) {}
>   static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
> diff --git a/arch/s390/kvm/priv.c b/arch/s390/kvm/priv.c
> index 9253c70897a8..7773e1e323bc 100644
> --- a/arch/s390/kvm/priv.c
> +++ b/arch/s390/kvm/priv.c
> @@ -605,6 +605,14 @@ static int handle_io_inst(struct kvm_vcpu *vcpu)
>   	}
>   }
>   
> +#if IS_ENABLED(CONFIG_VFIO_AP)
> +bool kvm_s390_is_gpa_in_memslot(struct kvm *kvm, gpa_t gpa)
> +{
> +	return kvm_is_gpa_in_memslot(kvm, gpa);
> +}
> +EXPORT_SYMBOL_GPL_FOR_MODULES(kvm_s390_is_gpa_in_memslot, "vfio_ap");
> +#endif
> +
>   /*
>    * handle_pqap: Handling pqap interception
>    * @vcpu: the vcpu having issue the pqap instruction
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
> index 766557547f83..eb5ff49f6fe7 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -354,7 +354,7 @@ static int vfio_ap_validate_nib(struct kvm_vcpu *vcpu, dma_addr_t *nib)
>   
>   	if (!*nib)
>   		return -EINVAL;
> -	if (kvm_is_error_hva(gfn_to_hva(vcpu->kvm, *nib >> PAGE_SHIFT)))
> +	if (!kvm_s390_is_gpa_in_memslot(vcpu->kvm, *nib))
>   		return -EINVAL;
>   
>   	return 0;


