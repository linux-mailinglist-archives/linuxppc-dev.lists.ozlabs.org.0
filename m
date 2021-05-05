Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBD7373F26
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 18:03:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fb1jB5Wynz30Q8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 02:03:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ObZoeRAu;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SU7T0LAk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ObZoeRAu; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=SU7T0LAk; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fb1hd3Zywz2yjH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 02:03:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620230585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1n5eBCPheirTlmkO/V8Dkx+9HIwI6ouJJXoWwQgrT24=;
 b=ObZoeRAu0wbJOA1hXfCZOcJMONp34goI7hUeVIjtL/dnuJNFkpgFsbmHCgqxUzu+9CNxn7
 u2cjCrdyQxSmfSZVVO6AVDEGBo1MKVc8wrfIr5zSEaIuIoVqBR0c6DyZd9bYSUjzB0gcoV
 D2Yn4Rn/hpe8nCh2o2mc6NYRwubEWqo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620230586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1n5eBCPheirTlmkO/V8Dkx+9HIwI6ouJJXoWwQgrT24=;
 b=SU7T0LAk2bp8jRfRsCqmKc868SL0C47ZmDZ5k/4UawwcCNDHMe/PCRSQAGXfaMRbYR9m/z
 RChlvtTdl2x6ovwILi3p9NwQP0QjX+hTRq/Sy20y5J01AILYowS2YG+lHWO80VUa8dot/h
 q43HKFOUBFiX/fD0s175Bgn2meMlQVE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-NHWi4wOuOxK3NeGv1Z0ryQ-1; Wed, 05 May 2021 12:03:03 -0400
X-MC-Unique: NHWi4wOuOxK3NeGv1Z0ryQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 4-20020adf80040000b029010cab735fdeso878053wrk.14
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 May 2021 09:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1n5eBCPheirTlmkO/V8Dkx+9HIwI6ouJJXoWwQgrT24=;
 b=ggfa7mvG00fV32sx/PxlbBjR1gklKMLIPY9HX1fEQH3k54jmT7MavKQp7aKVbkV05Y
 4u7bGv17VXQpoVxxMJnOpht5fe7HNywBpnPZLcTii9hrok7cqnnrbKSCQLxFCceBK8jH
 RfiD9rQ546WJgUhJ7bjbiKQJeXJQzYCsU/TY6IJ465+/IFP1E3iyDyh4e1wHw2KnnBUh
 sz2HQi/AYOjeffTiu2xlOlsf9j+Kjs0Vuezz26XrZswL39xrDZl7a4ahxuQYG6QnY8ID
 FO8mYnbSNcozJXCzi1rkoxoJkImYn3MEzuPMDZdEYQNHYUmwiJhw/0w0M8kNjoAy/OKT
 Vs1A==
X-Gm-Message-State: AOAM532gMol8TsRCPF3yKXNmuwqTuWZnKoC8zc0BoD/ZFZNWiUgHz5zG
 hEvH5rO+81FinWM5XLZNb5IL9SjF7jVMfpejPSCBQSAapsoggoEE0FVPY0LKBF3J4/6MUCGlDub
 fSjqDtvmv4sqmAXV1g9mSHVcXvw==
X-Received: by 2002:a5d:6386:: with SMTP id p6mr38971807wru.36.1620230581735; 
 Wed, 05 May 2021 09:03:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5h2Nhmgyt5a32/b5XL3k/4nl0ybMktVvwzYVFkUPnV2uAcTzu0ZxPk4ltILLR23enPmxrcw==
X-Received: by 2002:a5d:6386:: with SMTP id p6mr38971784wru.36.1620230581465; 
 Wed, 05 May 2021 09:03:01 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d22sm21146171wrc.50.2021.05.05.09.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 09:03:01 -0700 (PDT)
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix conversion to gfn-based MMU
 notifier callbacks
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210505121509.1470207-1-npiggin@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9e0a256b-fb5a-4468-ed21-68d524d6ea56@redhat.com>
Date: Wed, 5 May 2021 18:02:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505121509.1470207-1-npiggin@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Sean Christopherson <seanjc@google.com>,
 Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/05/21 14:15, Nicholas Piggin wrote:
> Commit b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU notifier
> callbacks") causes unmap_gfn_range and age_gfn callbacks to only work
> on the first gfn in the range. It also makes the aging callbacks call
> into both radix and hash aging functions for radix guests. Fix this.
> 
> Add warnings for the single-gfn calls that have been converted to range
> callbacks, in case they ever receieve ranges greater than 1.
> 
> Fixes: b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU notifier callbacks")
> Reported-by: Bharata B Rao <bharata@linux.ibm.com>
> Tested-by: Bharata B Rao <bharata@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Sorry for the breakage.  I queued this patch.

Paolo

> ---
> The e500 change in that commit also looks suspicious, why is it okay
> to remove kvm_flush_remote_tlbs() there? Also is the the change from
> returning false to true intended?
> 
> Thanks,
> Nick
> 
>   arch/powerpc/include/asm/kvm_book3s.h  |  2 +-
>   arch/powerpc/kvm/book3s_64_mmu_hv.c    | 46 ++++++++++++++++++--------
>   arch/powerpc/kvm/book3s_64_mmu_radix.c |  5 ++-
>   3 files changed, 36 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
> index a6e9a5585e61..e6b53c6e21e3 100644
> --- a/arch/powerpc/include/asm/kvm_book3s.h
> +++ b/arch/powerpc/include/asm/kvm_book3s.h
> @@ -210,7 +210,7 @@ extern void kvmppc_free_pgtable_radix(struct kvm *kvm, pgd_t *pgd,
>   				      unsigned int lpid);
>   extern int kvmppc_radix_init(void);
>   extern void kvmppc_radix_exit(void);
> -extern bool kvm_unmap_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
> +extern void kvm_unmap_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
>   			    unsigned long gfn);
>   extern bool kvm_age_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
>   			  unsigned long gfn);
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> index b7bd9ca040b8..2d9193cd73be 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> @@ -795,7 +795,7 @@ static void kvmppc_unmap_hpte(struct kvm *kvm, unsigned long i,
>   	}
>   }
>   
> -static bool kvm_unmap_rmapp(struct kvm *kvm, struct kvm_memory_slot *memslot,
> +static void kvm_unmap_rmapp(struct kvm *kvm, struct kvm_memory_slot *memslot,
>   			    unsigned long gfn)
>   {
>   	unsigned long i;
> @@ -829,15 +829,21 @@ static bool kvm_unmap_rmapp(struct kvm *kvm, struct kvm_memory_slot *memslot,
>   		unlock_rmap(rmapp);
>   		__unlock_hpte(hptep, be64_to_cpu(hptep[0]));
>   	}
> -	return false;
>   }
>   
>   bool kvm_unmap_gfn_range_hv(struct kvm *kvm, struct kvm_gfn_range *range)
>   {
> -	if (kvm_is_radix(kvm))
> -		return kvm_unmap_radix(kvm, range->slot, range->start);
> +	gfn_t gfn;
> +
> +	if (kvm_is_radix(kvm)) {
> +		for (gfn = range->start; gfn < range->end; gfn++)
> +			kvm_unmap_radix(kvm, range->slot, gfn);
> +	} else {
> +		for (gfn = range->start; gfn < range->end; gfn++)
> +			kvm_unmap_rmapp(kvm, range->slot, range->start);
> +	}
>   
> -	return kvm_unmap_rmapp(kvm, range->slot, range->start);
> +	return false;
>   }
>   
>   void kvmppc_core_flush_memslot_hv(struct kvm *kvm,
> @@ -924,10 +930,18 @@ static bool kvm_age_rmapp(struct kvm *kvm, struct kvm_memory_slot *memslot,
>   
>   bool kvm_age_gfn_hv(struct kvm *kvm, struct kvm_gfn_range *range)
>   {
> -	if (kvm_is_radix(kvm))
> -		kvm_age_radix(kvm, range->slot, range->start);
> +	gfn_t gfn;
> +	bool ret = false;
>   
> -	return kvm_age_rmapp(kvm, range->slot, range->start);
> +	if (kvm_is_radix(kvm)) {
> +		for (gfn = range->start; gfn < range->end; gfn++)
> +			ret |= kvm_age_radix(kvm, range->slot, gfn);
> +	} else {
> +		for (gfn = range->start; gfn < range->end; gfn++)
> +			ret |= kvm_age_rmapp(kvm, range->slot, gfn);
> +	}
> +
> +	return ret;
>   }
>   
>   static bool kvm_test_age_rmapp(struct kvm *kvm, struct kvm_memory_slot *memslot,
> @@ -965,18 +979,24 @@ static bool kvm_test_age_rmapp(struct kvm *kvm, struct kvm_memory_slot *memslot,
>   
>   bool kvm_test_age_gfn_hv(struct kvm *kvm, struct kvm_gfn_range *range)
>   {
> -	if (kvm_is_radix(kvm))
> -		kvm_test_age_radix(kvm, range->slot, range->start);
> +	WARN_ON(range->start + 1 != range->end);
>   
> -	return kvm_test_age_rmapp(kvm, range->slot, range->start);
> +	if (kvm_is_radix(kvm))
> +		return kvm_test_age_radix(kvm, range->slot, range->start);
> +	else
> +		return kvm_test_age_rmapp(kvm, range->slot, range->start);
>   }
>   
>   bool kvm_set_spte_gfn_hv(struct kvm *kvm, struct kvm_gfn_range *range)
>   {
> +	WARN_ON(range->start + 1 != range->end);
> +
>   	if (kvm_is_radix(kvm))
> -		return kvm_unmap_radix(kvm, range->slot, range->start);
> +		kvm_unmap_radix(kvm, range->slot, range->start);
> +	else
> +		kvm_unmap_rmapp(kvm, range->slot, range->start);
>   
> -	return kvm_unmap_rmapp(kvm, range->slot, range->start);
> +	return false;
>   }
>   
>   static int vcpus_running(struct kvm *kvm)
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> index ec4f58fa9f5a..d909c069363e 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> @@ -993,7 +993,7 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
>   }
>   
>   /* Called with kvm->mmu_lock held */
> -bool kvm_unmap_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
> +void kvm_unmap_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
>   		     unsigned long gfn)
>   {
>   	pte_t *ptep;
> @@ -1002,14 +1002,13 @@ bool kvm_unmap_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
>   
>   	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE) {
>   		uv_page_inval(kvm->arch.lpid, gpa, PAGE_SHIFT);
> -		return false;
> +		return;
>   	}
>   
>   	ptep = find_kvm_secondary_pte(kvm, gpa, &shift);
>   	if (ptep && pte_present(*ptep))
>   		kvmppc_unmap_pte(kvm, ptep, gpa, shift, memslot,
>   				 kvm->arch.lpid);
> -	return false;
>   }
>   
>   /* Called with kvm->mmu_lock held */
> 

