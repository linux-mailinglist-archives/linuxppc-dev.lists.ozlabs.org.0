Return-Path: <linuxppc-dev+bounces-12411-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A59B87FFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 08:31:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSjMJ4lBgz30D3;
	Fri, 19 Sep 2025 16:31:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758263484;
	cv=none; b=esR2JFBgmYfaj/aarK/o3MRA0hazobJAJkd4+/ioFUm3t9btrTlFbW6DybAGQ335PdtqBY81woe/JN4A4d+Ihuh+rPjdMO0OA+kjoinLJCBJ60GfPyQR174ROv/4Y4jE8CvB6O4N1ZcvN8H7loYTjz0WBFjZwbP56P/sb1EZnQTOen0VecchFxonvqC0sgP1S/NwG/G70o6IvveOc7uEU2b5rBhu4R2tmBymsZ9nkh0zhL+ITkVTl7nrFMR4a1aOjraSpoUkdLuGwSKsY/P2uzMKAYUTYZ438sbFUzHca7XOJBiiNoLoIVPspavzFGSRDohf+b+A1/I6kuW3IfVrLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758263484; c=relaxed/relaxed;
	bh=AKXTRUMWL+ox9rBx/hXoJNoCYAi39BF6mftgBjv8suY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MrtZpftimmQyfEkjRSW1xu822rMXIMztkmC0s8GZiE5hZw8UQMIRXLC+a6diYRUO+curkH8USQQ5H2Z+aJRm2tSbExPYkuIkD3+suHfQq+pGHUuC8NKx/An9Tsg9iEBKbqGSTIVVZ9p+qphMVN8f2rDQ6Ey2Sc/oftlLt463i9Osu3LRjcccghpb6oPxEGcaVgrEvHVm/qiU/FdqPFa7W2QCfEp5gSnkNhVM5Gpe4RtgSmGB9OPWXjPlHOnTSApA/FRkdoUsjkgEot9dnB3MCStCaIyyiKv42T/KGjii/3mlrU2JvK3iNuI2MrIkEucYMWcuhvAQ4UIaQxY7u1Sp0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mk/ZD93M; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=borntraeger@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mk/ZD93M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=borntraeger@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSjMH3HRCz2yQH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 16:31:22 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J3KlCx011575;
	Fri, 19 Sep 2025 06:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=AKXTRU
	MWL+ox9rBx/hXoJNoCYAi39BF6mftgBjv8suY=; b=mk/ZD93Muag+UjLD7/ffZS
	3/OSHdlEixKtDxg/iE0cyOkIJCFgiBDaIfjhXRqvCJtAMWIO7cZhNGV0VDbNviv0
	4ays7a4m0fbTfLK5VkJ8IWgOaOrDymA+avDlUoTu6UqTFeIFbCGhJ57p9v7YvJwK
	XiLPV24xC/VBSbhFUebXwsOEnQqd3hKY95b6w2SPWjQsIjwfzoA78YSGBNIHovL0
	6o5WxXYt7UuiEW8C688Ty3YYJTx/AhjiI9J9cQmmBmHUXxzQa+y0N4M/pCJKWx/m
	MlakNlRQZnf1sAHkFsKgBf0wTVw5sZLWd7NpPrNRAuM1lnHuxWkGurnoVs5FdvQA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 497g4np9s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Sep 2025 06:31:18 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58J6VIPR025809;
	Fri, 19 Sep 2025 06:31:18 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 497g4np9rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Sep 2025 06:31:18 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58J30QR8009395;
	Fri, 19 Sep 2025 06:31:17 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 495nn3t8dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Sep 2025 06:31:17 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58J6VEei37880162
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Sep 2025 06:31:14 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2E0420043;
	Fri, 19 Sep 2025 06:31:13 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3138520040;
	Fri, 19 Sep 2025 06:31:13 +0000 (GMT)
Received: from [9.111.68.111] (unknown [9.111.68.111])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 19 Sep 2025 06:31:13 +0000 (GMT)
Message-ID: <d0c954dc-6961-4536-b103-d7fdf1afb313@linux.ibm.com>
Date: Fri, 19 Sep 2025 08:31:06 +0200
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
Subject: Re: [PATCH v2 1/5] KVM: s390/vfio-ap: Use kvm_is_gpa_in_memslot()
 instead of open coded equivalent
To: Sean Christopherson <seanjc@google.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Holger Dengler <dengler@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250919003303.1355064-1-seanjc@google.com>
 <20250919003303.1355064-2-seanjc@google.com>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20250919003303.1355064-2-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=MN5gmNZl c=1 sm=1 tr=0 ts=68ccf8b7 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=1XWaLZrsAAAA:8
 a=WMn4R6eJaF8VgN3aVUEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: md5iwfiyFe2OTejpXCjJPdxQmjbfiyb-
X-Proofpoint-ORIG-GUID: DXgSIvc5M_qRAWhURQ1HdkyzBqz_Qyoc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwNCBTYWx0ZWRfX/BVrxPcE3PG2
 qtrYAMokM4pZJJN97Ey//DXDj5ryel8jNsk3kaQAMcY4cvdBVgSqsLzhhuKOhCo6a9s1QjEHT8Z
 LxUZ+NcKDumMSiUjjlnyFpqwglBskTojSluoYSHV3BHtvAzX/1bBW0oyU4JmfjPGoKqLqS6VWWe
 +iPOybn8095kSdqUIUCner1Hq9z6pvyS4nzDuIl+c5gGG62dJGyIgONiorxk2gZozbrEhkKZAEt
 dHVmV0RMF0kKOBKBx9RVyBjTRSjo+bYvNF196+lQPmbLsxKFSPhy+Gu4VcAiFJdliAk09Z2aZ2h
 FWf/tXahLW+IMOrIMTIgckz3ZPcFw+rtayAovz0F3Hn/b/Z743nzTUr+zRpaMtSCXVM2xljoTvV
 UkqgHXkD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160204
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Am 19.09.25 um 02:32 schrieb Sean Christopherson:
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
> Acked-by: Anthony Krowiak <akrowiak@linux.ibm.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Christian Borntraeger <borntraeger@linux.ibm.com>

> ---
>   arch/s390/include/asm/kvm_host.h  | 2 ++
>   arch/s390/kvm/priv.c              | 8 ++++++++
>   drivers/s390/crypto/vfio_ap_ops.c | 2 +-
>   3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
> index f870d09515cc..ee25eeda12fd 100644
> --- a/arch/s390/include/asm/kvm_host.h
> +++ b/arch/s390/include/asm/kvm_host.h
> @@ -722,6 +722,8 @@ extern int kvm_s390_enter_exit_sie(struct kvm_s390_sie_block *scb,
>   extern int kvm_s390_gisc_register(struct kvm *kvm, u32 gisc);
>   extern int kvm_s390_gisc_unregister(struct kvm *kvm, u32 gisc);
>   
> +bool kvm_s390_is_gpa_in_memslot(struct kvm *kvm, gpa_t gpa);
> +
>   static inline void kvm_arch_free_memslot(struct kvm *kvm,
>   					 struct kvm_memory_slot *slot) {}
>   static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
> diff --git a/arch/s390/kvm/priv.c b/arch/s390/kvm/priv.c
> index 9253c70897a8..9a71b6e00948 100644
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
> +EXPORT_SYMBOL_FOR_MODULES(kvm_s390_is_gpa_in_memslot, "vfio_ap");
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


