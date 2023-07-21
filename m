Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB0575CB10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 17:11:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bhS7A48H;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bhS7A48H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6tKv6kV7z3cb9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 01:10:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bhS7A48H;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bhS7A48H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6tJY4R85z3cbG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 01:09:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689952187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vmYiJ2McNnP+cgtfjeAKniOHtUlesHHQnwePocmwMM=;
	b=bhS7A48HhxoUmJv84zLSucHY2BKkc8IciVF5513BZ+2BhO+KQlPepFtGVIvPw7TV/B/3rb
	pxQOgMTV1S4GpZ96rf3S49zz83yIoGIcw7m4hz5lb19BfsSFV2q/k18QGzc1ADIHDK3vTh
	xgsr/Slug/6zcx4KoyqJZLxMlJGolOw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689952187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vmYiJ2McNnP+cgtfjeAKniOHtUlesHHQnwePocmwMM=;
	b=bhS7A48HhxoUmJv84zLSucHY2BKkc8IciVF5513BZ+2BhO+KQlPepFtGVIvPw7TV/B/3rb
	pxQOgMTV1S4GpZ96rf3S49zz83yIoGIcw7m4hz5lb19BfsSFV2q/k18QGzc1ADIHDK3vTh
	xgsr/Slug/6zcx4KoyqJZLxMlJGolOw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-c0HVKpvJMRC5S8NdXeL3pA-1; Fri, 21 Jul 2023 11:09:45 -0400
X-MC-Unique: c0HVKpvJMRC5S8NdXeL3pA-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-4fb76659d6cso1993687e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 08:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689952184; x=1690556984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0vmYiJ2McNnP+cgtfjeAKniOHtUlesHHQnwePocmwMM=;
        b=DDTyj2bIzaQATUDHlwYP6lOSPkc0S4JnfQt/Js6C/wJ7PkKpuzihn1p02s9Rzj0TNn
         i1iOUaSbGl+EOsso6BchPLvO96lZdyNBrpZBx2FkI27Qmeag3Bskbz3oHCzp/VUl7Tiy
         nHDvGrjxXQ6uNPVt4iTcgZO1lWlJ2ciOnAyQ/UaaMinNjCrjjuUL8rpn7mo7I85cmNhp
         Ind1gXJxb8wviQoVmgvvHzSrDm5/APMFRsoxc9yXAKcigiLSd52Iq7xDVwfclS6cO2LV
         i6uPLRSnBHCCszZzFXGH1UaPwqU99GxziMhqpu6zMcWilBa4jVYjL44nCDh1TwNMrj3d
         609w==
X-Gm-Message-State: ABy/qLY5KQmrMFtX+w7SrNDMZa6FwlS8hyi1dyOu+8djkVLK4bWL1Erw
	n67eK2SJHULG7nkQqKLKXtpZ6fjGCAxEMK4u1MrA4Dvdg/uTKsQzxVKWIsZqfi1Xg4YRCzWrccA
	OHswJy8yzWlll4I4LS7n8XH9B1g==
X-Received: by 2002:a05:6512:328d:b0:4fb:9050:1d92 with SMTP id p13-20020a056512328d00b004fb90501d92mr1367593lfe.51.1689952183969;
        Fri, 21 Jul 2023 08:09:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFPJFXvjHxdY0caGfwUnetqbu+BXv0f0ZakHLJfQbsd3FM7efS9VuBluWIt3TKTV7uVBQdwmQ==
X-Received: by 2002:a05:6512:328d:b0:4fb:9050:1d92 with SMTP id p13-20020a056512328d00b004fb90501d92mr1367563lfe.51.1689952183505;
        Fri, 21 Jul 2023 08:09:43 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id d17-20020aa7ce11000000b00521d42fb41asm2212963edv.67.2023.07.21.08.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 08:09:42 -0700 (PDT)
Message-ID: <68ce1eff-807c-d637-d992-f83e8af81514@redhat.com>
Date: Fri, 21 Jul 2023 17:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 14/29] KVM: x86/mmu: Handle page fault for private
 memory
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-15-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230718234512.1690985-15-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/19/23 01:44, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
> 
> A KVM_MEM_PRIVATE memslot can include both fd-based private memory and
> hva-based shared memory. Architecture code (like TDX code) can tell
> whether the on-going fault is private or not. This patch adds a
> 'is_private' field to kvm_page_fault to indicate this and architecture
> code is expected to set it.
> 
> To handle page fault for such memslot, the handling logic is different
> depending on whether the fault is private or shared. KVM checks if
> 'is_private' matches the host's view of the page (maintained in
> mem_attr_array).
>    - For a successful match, private pfn is obtained with
>      restrictedmem_get_page() and shared pfn is obtained with existing
>      get_user_pages().
>    - For a failed match, KVM causes a KVM_EXIT_MEMORY_FAULT exit to
>      userspace. Userspace then can convert memory between private/shared
>      in host's view and retry the fault.
> 
> Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/kvm/mmu/mmu.c          | 82 +++++++++++++++++++++++++++++++--
>   arch/x86/kvm/mmu/mmu_internal.h |  3 ++
>   arch/x86/kvm/mmu/mmutrace.h     |  1 +
>   3 files changed, 81 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index aefe67185637..4cf73a579ee1 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3179,9 +3179,9 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
>   	return level;
>   }
>   
> -int kvm_mmu_max_mapping_level(struct kvm *kvm,
> -			      const struct kvm_memory_slot *slot, gfn_t gfn,
> -			      int max_level)
> +static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
> +				       const struct kvm_memory_slot *slot,
> +				       gfn_t gfn, int max_level, bool is_private)
>   {
>   	struct kvm_lpage_info *linfo;
>   	int host_level;
> @@ -3193,6 +3193,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
>   			break;
>   	}
>   
> +	if (is_private)
> +		return max_level;
> +
>   	if (max_level == PG_LEVEL_4K)
>   		return PG_LEVEL_4K;
>   
> @@ -3200,6 +3203,16 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
>   	return min(host_level, max_level);
>   }
>   
> +int kvm_mmu_max_mapping_level(struct kvm *kvm,
> +			      const struct kvm_memory_slot *slot, gfn_t gfn,
> +			      int max_level)
> +{
> +	bool is_private = kvm_slot_can_be_private(slot) &&
> +			  kvm_mem_is_private(kvm, gfn);
> +
> +	return __kvm_mmu_max_mapping_level(kvm, slot, gfn, max_level, is_private);
> +}
> +
>   void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
>   {
>   	struct kvm_memory_slot *slot = fault->slot;
> @@ -3220,8 +3233,9 @@ void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>   	 * Enforce the iTLB multihit workaround after capturing the requested
>   	 * level, which will be used to do precise, accurate accounting.
>   	 */
> -	fault->req_level = kvm_mmu_max_mapping_level(vcpu->kvm, slot,
> -						     fault->gfn, fault->max_level);
> +	fault->req_level = __kvm_mmu_max_mapping_level(vcpu->kvm, slot,
> +						       fault->gfn, fault->max_level,
> +						       fault->is_private);
>   	if (fault->req_level == PG_LEVEL_4K || fault->huge_page_disallowed)
>   		return;
>   
> @@ -4304,6 +4318,55 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
>   	kvm_mmu_do_page_fault(vcpu, work->cr2_or_gpa, 0, true, NULL);
>   }
>   
> +static inline u8 kvm_max_level_for_order(int order)
> +{
> +	BUILD_BUG_ON(KVM_MAX_HUGEPAGE_LEVEL > PG_LEVEL_1G);
> +
> +	MMU_WARN_ON(order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G) &&
> +		    order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M) &&
> +		    order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_4K));
> +
> +	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G))
> +		return PG_LEVEL_1G;
> +
> +	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M))
> +		return PG_LEVEL_2M;
> +
> +	return PG_LEVEL_4K;
> +}
> +
> +static int kvm_do_memory_fault_exit(struct kvm_vcpu *vcpu,
> +				    struct kvm_page_fault *fault)
> +{
> +	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> +	if (fault->is_private)
> +		vcpu->run->memory.flags = KVM_MEMORY_EXIT_FLAG_PRIVATE;
> +	else
> +		vcpu->run->memory.flags = 0;
> +	vcpu->run->memory.gpa = fault->gfn << PAGE_SHIFT;
> +	vcpu->run->memory.size = PAGE_SIZE;
> +	return RET_PF_USER;
> +}
> +
> +static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> +				   struct kvm_page_fault *fault)
> +{
> +	int max_order, r;
> +
> +	if (!kvm_slot_can_be_private(fault->slot))
> +		return kvm_do_memory_fault_exit(vcpu, fault);
> +
> +	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
> +			     &max_order);
> +	if (r)
> +		return r;
> +
> +	fault->max_level = min(kvm_max_level_for_order(max_order),
> +			       fault->max_level);
> +	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
> +	return RET_PF_CONTINUE;
> +}
> +
>   static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
>   {
>   	struct kvm_memory_slot *slot = fault->slot;
> @@ -4336,6 +4399,12 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>   			return RET_PF_EMULATE;
>   	}
>   
> +	if (fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn))
> +		return kvm_do_memory_fault_exit(vcpu, fault);
> +
> +	if (fault->is_private)
> +		return kvm_faultin_pfn_private(vcpu, fault);
> +
>   	async = false;
>   	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, false, &async,
>   					  fault->write, &fault->map_writable,
> @@ -5771,6 +5840,9 @@ int noinline kvm_mmu_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa, u64 err
>   			return -EIO;
>   	}
>   
> +	if (r == RET_PF_USER)
> +		return 0;
> +
>   	if (r < 0)
>   		return r;
>   	if (r != RET_PF_EMULATE)
> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
> index d39af5639ce9..268b517e88cb 100644
> --- a/arch/x86/kvm/mmu/mmu_internal.h
> +++ b/arch/x86/kvm/mmu/mmu_internal.h
> @@ -203,6 +203,7 @@ struct kvm_page_fault {
>   
>   	/* Derived from mmu and global state.  */
>   	const bool is_tdp;
> +	const bool is_private;
>   	const bool nx_huge_page_workaround_enabled;
>   
>   	/*
> @@ -259,6 +260,7 @@ int kvm_tdp_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault);
>    * RET_PF_RETRY: let CPU fault again on the address.
>    * RET_PF_EMULATE: mmio page fault, emulate the instruction directly.
>    * RET_PF_INVALID: the spte is invalid, let the real page fault path update it.
> + * RET_PF_USER: need to exit to userspace to handle this fault.
>    * RET_PF_FIXED: The faulting entry has been fixed.
>    * RET_PF_SPURIOUS: The faulting entry was already fixed, e.g. by another vCPU.
>    *
> @@ -275,6 +277,7 @@ enum {
>   	RET_PF_RETRY,
>   	RET_PF_EMULATE,
>   	RET_PF_INVALID,
> +	RET_PF_USER,
>   	RET_PF_FIXED,
>   	RET_PF_SPURIOUS,
>   };
> diff --git a/arch/x86/kvm/mmu/mmutrace.h b/arch/x86/kvm/mmu/mmutrace.h
> index ae86820cef69..2d7555381955 100644
> --- a/arch/x86/kvm/mmu/mmutrace.h
> +++ b/arch/x86/kvm/mmu/mmutrace.h
> @@ -58,6 +58,7 @@ TRACE_DEFINE_ENUM(RET_PF_CONTINUE);
>   TRACE_DEFINE_ENUM(RET_PF_RETRY);
>   TRACE_DEFINE_ENUM(RET_PF_EMULATE);
>   TRACE_DEFINE_ENUM(RET_PF_INVALID);
> +TRACE_DEFINE_ENUM(RET_PF_USER);
>   TRACE_DEFINE_ENUM(RET_PF_FIXED);
>   TRACE_DEFINE_ENUM(RET_PF_SPURIOUS);
>   

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

