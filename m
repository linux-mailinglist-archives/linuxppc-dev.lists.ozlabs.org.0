Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0085F7E1F37
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 12:04:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A0tpgkDd;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A0tpgkDd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SP7lD6LB0z3d9W
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 22:04:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A0tpgkDd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A0tpgkDd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SP7k94vkgz3cW7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 22:03:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699268590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PMg5NrY+vjxLbRnS3SqlrSoMXrcxCGHK0jMnZO5VxDw=;
	b=A0tpgkDdNjWp2OJ81ND5V9TrZ7Rq+xmIeiTk7R9nCcfkqnO4mHOz/ykHq1v6wqZythiGdp
	rQolAErFxUuQ9U032O9M9w7hszfL6swy90daGu9goYb5NFhGyA6rUYZLBM9K+tdiSp5UOe
	XCdI4WhBwo8PCUdIL7nN4lkHKsuaEBE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699268590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PMg5NrY+vjxLbRnS3SqlrSoMXrcxCGHK0jMnZO5VxDw=;
	b=A0tpgkDdNjWp2OJ81ND5V9TrZ7Rq+xmIeiTk7R9nCcfkqnO4mHOz/ykHq1v6wqZythiGdp
	rQolAErFxUuQ9U032O9M9w7hszfL6swy90daGu9goYb5NFhGyA6rUYZLBM9K+tdiSp5UOe
	XCdI4WhBwo8PCUdIL7nN4lkHKsuaEBE=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-JWmIvVoNP0qcsaL898aKvw-1; Mon, 06 Nov 2023 06:03:08 -0500
X-MC-Unique: JWmIvVoNP0qcsaL898aKvw-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-507a0904cdbso4773722e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 03:03:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268587; x=1699873387;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMg5NrY+vjxLbRnS3SqlrSoMXrcxCGHK0jMnZO5VxDw=;
        b=WT0QEQQ3btMj1tOq9/JUWMG2y2wgbfBCnhO2iXPrVtbS6bDPdmtwMs6MSx2Orsbyl2
         0XBrfnrA6rWnF72p8xfxTys88tovlvYmAxsR55g3nbZpgV6hz2ucYG6ipL65G/J27kKx
         sN86NWxt3lzzUL7IewHO+WrqkPXwKMGZDMtgElqGuJ/V+dIuS7P5YDT1jpBPZuklIJze
         T8WddR/R1kNKd3QFSaHrEeyEY0H4uJ3VYpUrrf3BkVdP2DAZU2PsQiWMNoFWlk6Hu8wq
         yFh/FWLlA3JixKCCfYicyBuxyDatEGwkflRiOfF2lnAi0xIjLL6jHxycgab4YNGQ1hVf
         1sgA==
X-Gm-Message-State: AOJu0YxI5o2fT5nw5Q0udLzUOD3I+gGJdmDgD9sRsmGeJiyGu+uBGBs9
	cLrOJ7f7/rUpt815dc6+6k+sMA4zNAn3DnOIWygNeWxtPTZvophuZN//UkxGypzugPYQ/yQ3x6A
	HgoynNUiaqpqHFh9lotwEMN3AVw==
X-Received: by 2002:a05:6512:39c8:b0:507:ae8b:a573 with SMTP id k8-20020a05651239c800b00507ae8ba573mr28020821lfu.51.1699268587075;
        Mon, 06 Nov 2023 03:03:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4WbcJWNwrls+R9tzJfJ8eTtL4Q8omI/OEY1CgGbCh4jE0ul8N4otbClOvO1xbzTzebzB2Bg==
X-Received: by 2002:a05:6512:39c8:b0:507:ae8b:a573 with SMTP id k8-20020a05651239c800b00507ae8ba573mr28020798lfu.51.1699268586630;
        Mon, 06 Nov 2023 03:03:06 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id o7-20020a5d6847000000b0032f7e832cabsm9104646wrw.90.2023.11.06.03.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 03:03:06 -0800 (PST)
Message-ID: <5562bf2d-e039-425d-875e-e7ced85dc51a@redhat.com>
Date: Mon, 6 Nov 2023 12:03:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 23/35] KVM: x86: Add support for "protected VMs" that
 can utilize private memory
To: Fuad Tabba <tabba@google.com>, Sean Christopherson <seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-24-seanjc@google.com>
 <CA+EHjTwN8BP+7hDveRyx0d+D3CmQN05kHEpLdi2q27jYBuFzAw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <CA+EHjTwN8BP+7hDveRyx0d+D3CmQN05kHEpLdi2q27jYBuFzAw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?= =?UTF-8?Q?n?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel
 .org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/6/23 12:00, Fuad Tabba wrote:
> Hi,
> 
> 
> On Fri, Oct 27, 2023 at 7:23 PM Sean Christopherson <seanjc@google.com> wrote:
>>
>> Add a new x86 VM type, KVM_X86_SW_PROTECTED_VM, to serve as a development
>> and testing vehicle for Confidential (CoCo) VMs, and potentially to even
>> become a "real" product in the distant future, e.g. a la pKVM.
>>
>> The private memory support in KVM x86 is aimed at AMD's SEV-SNP and
>> Intel's TDX, but those technologies are extremely complex (understatement),
>> difficult to debug, don't support running as nested guests, and require
>> hardware that's isn't universally accessible.  I.e. relying SEV-SNP or TDX
> 
> nit: "that isn't"
> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>

Hi Fuad,

thanks for your reviews and tests of the gmem patches!  Can you please 
continue replying to v14?

Thanks,

Paolo

> Cheers,
> /fuad
> 
>> for maintaining guest private memory isn't a realistic option.
>>
>> At the very least, KVM_X86_SW_PROTECTED_VM will enable a variety of
>> selftests for guest_memfd and private memory support without requiring
>> unique hardware.
>>
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> ---
>>   Documentation/virt/kvm/api.rst  | 32 ++++++++++++++++++++++++++++++++
>>   arch/x86/include/asm/kvm_host.h | 15 +++++++++------
>>   arch/x86/include/uapi/asm/kvm.h |  3 +++
>>   arch/x86/kvm/Kconfig            | 12 ++++++++++++
>>   arch/x86/kvm/mmu/mmu_internal.h |  1 +
>>   arch/x86/kvm/x86.c              | 16 +++++++++++++++-
>>   include/uapi/linux/kvm.h        |  1 +
>>   virt/kvm/Kconfig                |  5 +++++
>>   8 files changed, 78 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 38dc1fda4f45..00029436ac5b 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -147,10 +147,29 @@ described as 'basic' will be available.
>>   The new VM has no virtual cpus and no memory.
>>   You probably want to use 0 as machine type.
>>
>> +X86:
>> +^^^^
>> +
>> +Supported X86 VM types can be queried via KVM_CAP_VM_TYPES.
>> +
>> +S390:
>> +^^^^^
>> +
>>   In order to create user controlled virtual machines on S390, check
>>   KVM_CAP_S390_UCONTROL and use the flag KVM_VM_S390_UCONTROL as
>>   privileged user (CAP_SYS_ADMIN).
>>
>> +MIPS:
>> +^^^^^
>> +
>> +To use hardware assisted virtualization on MIPS (VZ ASE) rather than
>> +the default trap & emulate implementation (which changes the virtual
>> +memory layout to fit in user mode), check KVM_CAP_MIPS_VZ and use the
>> +flag KVM_VM_MIPS_VZ.
>> +
>> +ARM64:
>> +^^^^^^
>> +
>>   On arm64, the physical address size for a VM (IPA Size limit) is limited
>>   to 40bits by default. The limit can be configured if the host supports the
>>   extension KVM_CAP_ARM_VM_IPA_SIZE. When supported, use
>> @@ -8650,6 +8669,19 @@ block sizes is exposed in KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES as a
>>   64-bit bitmap (each bit describing a block size). The default value is
>>   0, to disable the eager page splitting.
>>
>> +8.41 KVM_CAP_VM_TYPES
>> +---------------------
>> +
>> +:Capability: KVM_CAP_MEMORY_ATTRIBUTES
>> +:Architectures: x86
>> +:Type: system ioctl
>> +
>> +This capability returns a bitmap of support VM types.  The 1-setting of bit @n
>> +means the VM type with value @n is supported.  Possible values of @n are::
>> +
>> +  #define KVM_X86_DEFAULT_VM   0
>> +  #define KVM_X86_SW_PROTECTED_VM      1
>> +
>>   9. Known KVM API problems
>>   =========================
>>
>> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
>> index f9e8d5642069..dff10051e9b6 100644
>> --- a/arch/x86/include/asm/kvm_host.h
>> +++ b/arch/x86/include/asm/kvm_host.h
>> @@ -1244,6 +1244,7 @@ enum kvm_apicv_inhibit {
>>   };
>>
>>   struct kvm_arch {
>> +       unsigned long vm_type;
>>          unsigned long n_used_mmu_pages;
>>          unsigned long n_requested_mmu_pages;
>>          unsigned long n_max_mmu_pages;
>> @@ -2077,6 +2078,12 @@ void kvm_mmu_new_pgd(struct kvm_vcpu *vcpu, gpa_t new_pgd);
>>   void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
>>                         int tdp_max_root_level, int tdp_huge_page_level);
>>
>> +#ifdef CONFIG_KVM_PRIVATE_MEM
>> +#define kvm_arch_has_private_mem(kvm) ((kvm)->arch.vm_type != KVM_X86_DEFAULT_VM)
>> +#else
>> +#define kvm_arch_has_private_mem(kvm) false
>> +#endif
>> +
>>   static inline u16 kvm_read_ldt(void)
>>   {
>>          u16 ldt;
>> @@ -2125,14 +2132,10 @@ enum {
>>   #define HF_SMM_INSIDE_NMI_MASK (1 << 2)
>>
>>   # define KVM_MAX_NR_ADDRESS_SPACES     2
>> +/* SMM is currently unsupported for guests with private memory. */
>> +# define kvm_arch_nr_memslot_as_ids(kvm) (kvm_arch_has_private_mem(kvm) ? 1 : 2)
>>   # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
>>   # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
>> -
>> -static inline int kvm_arch_nr_memslot_as_ids(struct kvm *kvm)
>> -{
>> -       return KVM_MAX_NR_ADDRESS_SPACES;
>> -}
>> -
>>   #else
>>   # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, 0)
>>   #endif
>> diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
>> index 1a6a1f987949..a448d0964fc0 100644
>> --- a/arch/x86/include/uapi/asm/kvm.h
>> +++ b/arch/x86/include/uapi/asm/kvm.h
>> @@ -562,4 +562,7 @@ struct kvm_pmu_event_filter {
>>   /* x86-specific KVM_EXIT_HYPERCALL flags. */
>>   #define KVM_EXIT_HYPERCALL_LONG_MODE   BIT(0)
>>
>> +#define KVM_X86_DEFAULT_VM     0
>> +#define KVM_X86_SW_PROTECTED_VM        1
>> +
>>   #endif /* _ASM_X86_KVM_H */
>> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
>> index 091b74599c22..8452ed0228cb 100644
>> --- a/arch/x86/kvm/Kconfig
>> +++ b/arch/x86/kvm/Kconfig
>> @@ -77,6 +77,18 @@ config KVM_WERROR
>>
>>            If in doubt, say "N".
>>
>> +config KVM_SW_PROTECTED_VM
>> +       bool "Enable support for KVM software-protected VMs"
>> +       depends on EXPERT
>> +       depends on X86_64
>> +       select KVM_GENERIC_PRIVATE_MEM
>> +       help
>> +         Enable support for KVM software-protected VMs.  Currently "protected"
>> +         means the VM can be backed with memory provided by
>> +         KVM_CREATE_GUEST_MEMFD.
>> +
>> +         If unsure, say "N".
>> +
>>   config KVM_INTEL
>>          tristate "KVM for Intel (and compatible) processors support"
>>          depends on KVM && IA32_FEAT_CTL
>> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
>> index 86c7cb692786..b66a7d47e0e4 100644
>> --- a/arch/x86/kvm/mmu/mmu_internal.h
>> +++ b/arch/x86/kvm/mmu/mmu_internal.h
>> @@ -297,6 +297,7 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
>>                  .max_level = KVM_MAX_HUGEPAGE_LEVEL,
>>                  .req_level = PG_LEVEL_4K,
>>                  .goal_level = PG_LEVEL_4K,
>> +               .is_private = kvm_mem_is_private(vcpu->kvm, cr2_or_gpa >> PAGE_SHIFT),
>>          };
>>          int r;
>>
>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>> index c4d17727b199..e3eb608b6692 100644
>> --- a/arch/x86/kvm/x86.c
>> +++ b/arch/x86/kvm/x86.c
>> @@ -4441,6 +4441,13 @@ static int kvm_ioctl_get_supported_hv_cpuid(struct kvm_vcpu *vcpu,
>>          return 0;
>>   }
>>
>> +static bool kvm_is_vm_type_supported(unsigned long type)
>> +{
>> +       return type == KVM_X86_DEFAULT_VM ||
>> +              (type == KVM_X86_SW_PROTECTED_VM &&
>> +               IS_ENABLED(CONFIG_KVM_SW_PROTECTED_VM) && tdp_enabled);
>> +}
>> +
>>   int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>>   {
>>          int r = 0;
>> @@ -4632,6 +4639,11 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>>          case KVM_CAP_X86_NOTIFY_VMEXIT:
>>                  r = kvm_caps.has_notify_vmexit;
>>                  break;
>> +       case KVM_CAP_VM_TYPES:
>> +               r = BIT(KVM_X86_DEFAULT_VM);
>> +               if (kvm_is_vm_type_supported(KVM_X86_SW_PROTECTED_VM))
>> +                       r |= BIT(KVM_X86_SW_PROTECTED_VM);
>> +               break;
>>          default:
>>                  break;
>>          }
>> @@ -12314,9 +12326,11 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>>          int ret;
>>          unsigned long flags;
>>
>> -       if (type)
>> +       if (!kvm_is_vm_type_supported(type))
>>                  return -EINVAL;
>>
>> +       kvm->arch.vm_type = type;
>> +
>>          ret = kvm_page_track_init(kvm);
>>          if (ret)
>>                  goto out;
>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> index 29e9eb51dec9..5b5820d19e71 100644
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@ -1218,6 +1218,7 @@ struct kvm_ppc_resize_hpt {
>>   #define KVM_CAP_MEMORY_FAULT_INFO 231
>>   #define KVM_CAP_MEMORY_ATTRIBUTES 232
>>   #define KVM_CAP_GUEST_MEMFD 233
>> +#define KVM_CAP_VM_TYPES 234
>>
>>   #ifdef KVM_CAP_IRQ_ROUTING
>>
>> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
>> index 08afef022db9..2c964586aa14 100644
>> --- a/virt/kvm/Kconfig
>> +++ b/virt/kvm/Kconfig
>> @@ -104,3 +104,8 @@ config KVM_GENERIC_MEMORY_ATTRIBUTES
>>   config KVM_PRIVATE_MEM
>>          select XARRAY_MULTI
>>          bool
>> +
>> +config KVM_GENERIC_PRIVATE_MEM
>> +       select KVM_GENERIC_MEMORY_ATTRIBUTES
>> +       select KVM_PRIVATE_MEM
>> +       bool
>> --
>> 2.42.0.820.g83a721a137-goog
>>
> 

