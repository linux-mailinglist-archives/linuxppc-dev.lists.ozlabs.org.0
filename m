Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C6475C262
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 11:04:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EzYRJRs1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EzYRJRs1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6kCV05mSz3cHF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 19:04:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EzYRJRs1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EzYRJRs1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6kBW5c5mz3bWr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 19:04:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689930238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UkppB3amY8e+ZFUORFAPfGoR63QBz1mTawh0tzwUFzU=;
	b=EzYRJRs1FRwxZFKV2KR+oejn212mnUAqD1y3yDNp74EgXxXFXPKvXNHX+iANedMeyhyoPv
	tUPV/ehJK5Va677fhJhjoUEHX6Xhc7UmMNbpK/gPZOyuTnSd2GqwgAK8xVHDNb1e211UxR
	0Nzxx4hvwzkeQK/XWDZiX5rCvW8T+80=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689930238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UkppB3amY8e+ZFUORFAPfGoR63QBz1mTawh0tzwUFzU=;
	b=EzYRJRs1FRwxZFKV2KR+oejn212mnUAqD1y3yDNp74EgXxXFXPKvXNHX+iANedMeyhyoPv
	tUPV/ehJK5Va677fhJhjoUEHX6Xhc7UmMNbpK/gPZOyuTnSd2GqwgAK8xVHDNb1e211UxR
	0Nzxx4hvwzkeQK/XWDZiX5rCvW8T+80=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-eCLSDdHeMnm_6J_Orxa31A-1; Fri, 21 Jul 2023 05:03:56 -0400
X-MC-Unique: eCLSDdHeMnm_6J_Orxa31A-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-992e6840901so208532966b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 02:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689930235; x=1690535035;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UkppB3amY8e+ZFUORFAPfGoR63QBz1mTawh0tzwUFzU=;
        b=LWuZYbD2ZmmmWiSzQz2aIZRVktlqgPTAoi9gRhXjkoyqPbj0YoJmuJuaAvCd6SiHqs
         Wq8HZYOP+nxii9aK6MkBlS/aR9n6Hq/WApsSWNrzaSioKcMNvi5cNDJSDntgFbT6DLxS
         8LDf1ZZaGBkTIjDgXEeDjdyCB9mUdnSpG3211QbYtBpWalZs4KFSQMWCcVxj41yMDucf
         Bp6BWRUfblF/y6EeCTej0jdT1Ohg3OL/vYQq90dBAVvHu6AocXS8oUFfBYzHlQCU52oc
         hy07GVL5c5VT/eotYOVlUCcBkctoQ9I7ivAeQVC5r93IDUYGjzpXc7ZYlnnKnDjKMh6a
         Afzw==
X-Gm-Message-State: ABy/qLbXDuyIn1ieYoFJVSgGqyD92PwtaoQErLCXHdv+Rwl+fbBPBg3p
	Kt9vVH4PdXnsZbh+t+3/TrHRSBSe0oO3ElcV4L3OibJABaBrUU1FcHdaCJBgyeKcowLimuh3X1a
	IJfy0ZMTXpMdCy2ei0HTTSW1Sgw==
X-Received: by 2002:a17:907:6d8c:b0:98d:abd4:4000 with SMTP id sb12-20020a1709076d8c00b0098dabd44000mr7889146ejc.35.1689930234810;
        Fri, 21 Jul 2023 02:03:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGH6YzYN7wVD16W6bBWRZvka9R57MaW1yVsDxFFu0qfog7UhF1jWQDyj4gC4NTPLd7VWeWUJA==
X-Received: by 2002:a17:907:6d8c:b0:98d:abd4:4000 with SMTP id sb12-20020a1709076d8c00b0098dabd44000mr7889108ejc.35.1689930234273;
        Fri, 21 Jul 2023 02:03:54 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id rv7-20020a17090710c700b00993a9a951fasm1915159ejb.11.2023.07.21.02.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 02:03:53 -0700 (PDT)
Message-ID: <47c5f57c-a191-1983-b4ef-6e0c59c0c446@redhat.com>
Date: Fri, 21 Jul 2023 11:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 06/29] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-7-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230718234512.1690985-7-seanjc@google.com>
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
> Cc: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/kvm/x86.c       |  2 +-
>   include/linux/kvm_host.h |  4 ++--
>   include/uapi/linux/kvm.h | 13 +++++++++++++
>   virt/kvm/kvm_main.c      | 38 ++++++++++++++++++++++++++++++--------
>   4 files changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index a6b9bea62fb8..92e77afd3ffd 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12420,7 +12420,7 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
>   	}
>   
>   	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> -		struct kvm_userspace_memory_region m;
> +		struct kvm_userspace_memory_region2 m;
>   
>   		m.slot = id | (i << 16);
>   		m.flags = 0;
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index d2d3e083ec7f..e9ca49d451f3 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1130,9 +1130,9 @@ enum kvm_mr_change {
>   };
>   
>   int kvm_set_memory_region(struct kvm *kvm,
> -			  const struct kvm_userspace_memory_region *mem);
> +			  const struct kvm_userspace_memory_region2 *mem);
>   int __kvm_set_memory_region(struct kvm *kvm,
> -			    const struct kvm_userspace_memory_region *mem);
> +			    const struct kvm_userspace_memory_region2 *mem);
>   void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot);
>   void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen);
>   int kvm_arch_prepare_memory_region(struct kvm *kvm,
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index f089ab290978..4d4b3de8ac55 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -95,6 +95,16 @@ struct kvm_userspace_memory_region {
>   	__u64 userspace_addr; /* start of the userspace allocated memory */
>   };
>   
> +/* for KVM_SET_USER_MEMORY_REGION2 */
> +struct kvm_userspace_memory_region2 {
> +	__u32 slot;
> +	__u32 flags;
> +	__u64 guest_phys_addr;
> +	__u64 memory_size;
> +	__u64 userspace_addr;
> +	__u64 pad[16];
> +};
> +
>   /*
>    * The bit 0 ~ bit 15 of kvm_userspace_memory_region::flags are visible for
>    * userspace, other bits are reserved for kvm internal use which are defined
> @@ -1192,6 +1202,7 @@ struct kvm_ppc_resize_hpt {
>   #define KVM_CAP_COUNTER_OFFSET 227
>   #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
>   #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
> +#define KVM_CAP_USER_MEMORY2 230
>   
>   #ifdef KVM_CAP_IRQ_ROUTING
>   
> @@ -1466,6 +1477,8 @@ struct kvm_vfio_spapr_tce {
>   					struct kvm_userspace_memory_region)
>   #define KVM_SET_TSS_ADDR          _IO(KVMIO,   0x47)
>   #define KVM_SET_IDENTITY_MAP_ADDR _IOW(KVMIO,  0x48, __u64)
> +#define KVM_SET_USER_MEMORY_REGION2 _IOW(KVMIO, 0x49, \
> +					 struct kvm_userspace_memory_region2)
>   
>   /* enable ucontrol for s390 */
>   struct kvm_s390_ucas_mapping {
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 53346bc2902a..c14adf93daec 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1549,7 +1549,7 @@ static void kvm_replace_memslot(struct kvm *kvm,
>   	}
>   }
>   
> -static int check_memory_region_flags(const struct kvm_userspace_memory_region *mem)
> +static int check_memory_region_flags(const struct kvm_userspace_memory_region2 *mem)
>   {
>   	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
>   
> @@ -1951,7 +1951,7 @@ static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
>    * Must be called holding kvm->slots_lock for write.
>    */
>   int __kvm_set_memory_region(struct kvm *kvm,
> -			    const struct kvm_userspace_memory_region *mem)
> +			    const struct kvm_userspace_memory_region2 *mem)
>   {
>   	struct kvm_memory_slot *old, *new;
>   	struct kvm_memslots *slots;
> @@ -2055,7 +2055,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
>   EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
>   
>   int kvm_set_memory_region(struct kvm *kvm,
> -			  const struct kvm_userspace_memory_region *mem)
> +			  const struct kvm_userspace_memory_region2 *mem)
>   {
>   	int r;
>   
> @@ -2067,7 +2067,7 @@ int kvm_set_memory_region(struct kvm *kvm,
>   EXPORT_SYMBOL_GPL(kvm_set_memory_region);
>   
>   static int kvm_vm_ioctl_set_memory_region(struct kvm *kvm,
> -					  struct kvm_userspace_memory_region *mem)
> +					  struct kvm_userspace_memory_region2 *mem)
>   {
>   	if ((u16)mem->slot >= KVM_USER_MEM_SLOTS)
>   		return -EINVAL;
> @@ -4514,6 +4514,7 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>   {
>   	switch (arg) {
>   	case KVM_CAP_USER_MEMORY:
> +	case KVM_CAP_USER_MEMORY2:
>   	case KVM_CAP_DESTROY_MEMORY_REGION_WORKS:
>   	case KVM_CAP_JOIN_MEMORY_REGIONS_WORKS:
>   	case KVM_CAP_INTERNAL_ERROR_DATA:
> @@ -4757,6 +4758,14 @@ static int kvm_vm_ioctl_get_stats_fd(struct kvm *kvm)
>   	return fd;
>   }
>   
> +#define SANITY_CHECK_MEM_REGION_FIELD(field)					\
> +do {										\
> +	BUILD_BUG_ON(offsetof(struct kvm_userspace_memory_region, field) !=		\
> +		     offsetof(struct kvm_userspace_memory_region2, field));	\
> +	BUILD_BUG_ON(sizeof_field(struct kvm_userspace_memory_region, field) !=		\
> +		     sizeof_field(struct kvm_userspace_memory_region2, field));	\
> +} while (0)
> +
>   static long kvm_vm_ioctl(struct file *filp,
>   			   unsigned int ioctl, unsigned long arg)
>   {
> @@ -4779,15 +4788,28 @@ static long kvm_vm_ioctl(struct file *filp,
>   		r = kvm_vm_ioctl_enable_cap_generic(kvm, &cap);
>   		break;
>   	}
> +	case KVM_SET_USER_MEMORY_REGION2:
>   	case KVM_SET_USER_MEMORY_REGION: {
> -		struct kvm_userspace_memory_region kvm_userspace_mem;
> +		struct kvm_userspace_memory_region2 mem;
> +		unsigned long size;
> +
> +		if (ioctl == KVM_SET_USER_MEMORY_REGION)
> +			size = sizeof(struct kvm_userspace_memory_region);
> +		else
> +			size = sizeof(struct kvm_userspace_memory_region2);
> +
> +		/* Ensure the common parts of the two structs are identical. */
> +		SANITY_CHECK_MEM_REGION_FIELD(slot);
> +		SANITY_CHECK_MEM_REGION_FIELD(flags);
> +		SANITY_CHECK_MEM_REGION_FIELD(guest_phys_addr);
> +		SANITY_CHECK_MEM_REGION_FIELD(memory_size);
> +		SANITY_CHECK_MEM_REGION_FIELD(userspace_addr);
>   
>   		r = -EFAULT;
> -		if (copy_from_user(&kvm_userspace_mem, argp,
> -						sizeof(kvm_userspace_mem)))
> +		if (copy_from_user(&mem, argp, size))
>   			goto out;
>   
> -		r = kvm_vm_ioctl_set_memory_region(kvm, &kvm_userspace_mem);
> +		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
>   		break;
>   	}
>   	case KVM_GET_DIRTY_LOG: {

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

