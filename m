Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 279597DDD3E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 08:32:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dbzzVEJ0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKzHV0fRkz3cTn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 18:32:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dbzzVEJ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.100; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Wed, 01 Nov 2023 18:31:52 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKzGc2pjXz2xdn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 18:31:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698823912; x=1730359912;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=38bUYl9zGRcXqgO3kvm3wpVN8MNciUwqMVCV5OnvF8E=;
  b=dbzzVEJ0VtYKJpwYDwLm6Erf758D2DtLy4v4g3tz9cXYhvGF7Uv9TrHU
   gyNMrTeLxKVRMZZLh2Ai5/2Q4mVlflBdzK5XL6d6IivpGy7bqyo827NB5
   fGOgCWtnGbuzzNmBsCCiqHVBKDUnZ/MykVkj7IXeJGjOVJxdgy/sgGj6F
   MsZwVwIYazdpuvq5k8lCrJtetNxCVS9VkqTvJNQWjHKLsZ+kaRMnygG5L
   MEyyg6QuBkSLOArtxuELp1dDzNi7YScU7vet3kVxqbNG77D4hM30LLK8A
   nnX7gbZqMGDYycZfCUaTQLYPactDHIg5HyrR3ehjawnMJNOazf4deitAk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="454923857"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="454923857"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 00:30:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="884461159"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="884461159"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.238.10.126]) ([10.238.10.126])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 00:30:30 -0700
Message-ID: <b2e1f4ed-9954-4bea-b5b5-04b0041df5ec@linux.intel.com>
Date: Wed, 1 Nov 2023 15:30:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
To: Sean Christopherson <seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-10-seanjc@google.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20231027182217.3615211-10-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?= =?UTF-8?Q?n?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@goog
 le.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/28/2023 2:21 AM, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
>
> Add a new KVM exit type to allow userspace to handle memory faults that
> KVM cannot resolve, but that userspace *may* be able to handle (without
> terminating the guest).
>
> KVM will initially use KVM_EXIT_MEMORY_FAULT to report implicit
> conversions between private and shared memory.  With guest private memory,
> there will be two kind of memory conversions:
>
>    - explicit conversion: happens when the guest explicitly calls into KVM
>      to map a range (as private or shared)
>
>    - implicit conversion: happens when the guest attempts to access a gfn
>      that is configured in the "wrong" state (private vs. shared)
>
> On x86 (first architecture to support guest private memory), explicit
> conversions will be reported via KVM_EXIT_HYPERCALL+KVM_HC_MAP_GPA_RANGE,
> but reporting KVM_EXIT_HYPERCALL for implicit conversions is undesriable
> as there is (obviously) no hypercall, and there is no guarantee that the
> guest actually intends to convert between private and shared, i.e. what
> KVM thinks is an implicit conversion "request" could actually be the
> result of a guest code bug.
>
> KVM_EXIT_MEMORY_FAULT will be used to report memory faults that appear to
> be implicit conversions.
>
> Note!  To allow for future possibilities where KVM reports
> KVM_EXIT_MEMORY_FAULT and fills run->memory_fault on _any_ unresolved
> fault, KVM returns "-EFAULT" (-1 with errno == EFAULT from userspace's
> perspective), not '0'!
Is "-EHWPOISON" case not considered unresolved, so it is not mentioned here?

> Due to historical baggage within KVM, exiting to
> userspace with '0' from deep callstacks, e.g. in emulation paths, is
> infeasible as doing so would require a near-complete overhaul of KVM,
> whereas KVM already propagates -errno return codes to userspace even when
> the -errno originated in a low level helper.
>
> Report the gpa+size instead of a single gfn even though the initial usage
> is expected to always report single pages.  It's entirely possible, likely
> even, that KVM will someday support sub-page granularity faults, e.g.
> Intel's sub-page protection feature allows for additional protections at
> 128-byte granularity.
>
> Link: https://lore.kernel.org/all/20230908222905.1321305-5-amoorthy@google.com
> Link: https://lore.kernel.org/all/ZQ3AmLO2SYv3DszH@google.com
> Cc: Anish Moorthy <amoorthy@google.com>
> Cc: David Matlack <dmatlack@google.com>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   Documentation/virt/kvm/api.rst | 41 ++++++++++++++++++++++++++++++++++
>   arch/x86/kvm/x86.c             |  1 +
>   include/linux/kvm_host.h       | 11 +++++++++
>   include/uapi/linux/kvm.h       |  8 +++++++
>   4 files changed, 61 insertions(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index ace984acc125..860216536810 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6723,6 +6723,26 @@ array field represents return values. The userspace should update the return
>   values of SBI call before resuming the VCPU. For more details on RISC-V SBI
>   spec refer, https://github.com/riscv/riscv-sbi-doc.
>   
> +::
> +
> +		/* KVM_EXIT_MEMORY_FAULT */
> +		struct {
> +			__u64 flags;
> +			__u64 gpa;
> +			__u64 size;
> +		} memory;
> +
> +KVM_EXIT_MEMORY_FAULT indicates the vCPU has encountered a memory fault that
> +could not be resolved by KVM.  The 'gpa' and 'size' (in bytes) describe the
> +guest physical address range [gpa, gpa + size) of the fault.  The 'flags' field
> +describes properties of the faulting access that are likely pertinent.
> +Currently, no flags are defined.
> +
> +Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in that it
> +accompanies a return code of '-1', not '0'!  errno will always be set to EFAULT
> +or EHWPOISON when KVM exits with KVM_EXIT_MEMORY_FAULT, userspace should assume
> +kvm_run.exit_reason is stale/undefined for all other error numbers.
> +
>   ::
>   
>       /* KVM_EXIT_NOTIFY */
> @@ -7757,6 +7777,27 @@ This capability is aimed to mitigate the threat that malicious VMs can
>   cause CPU stuck (due to event windows don't open up) and make the CPU
>   unavailable to host or other VMs.
>   
> +7.34 KVM_CAP_MEMORY_FAULT_INFO
> +------------------------------
> +
> +:Architectures: x86
> +:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
> +
> +The presence of this capability indicates that KVM_RUN will fill
> +kvm_run.memory_fault if KVM cannot resolve a guest page fault VM-Exit, e.g. if
> +there is a valid memslot but no backing VMA for the corresponding host virtual
> +address.
> +
> +The information in kvm_run.memory_fault is valid if and only if KVM_RUN returns
> +an error with errno=EFAULT or errno=EHWPOISON *and* kvm_run.exit_reason is set
> +to KVM_EXIT_MEMORY_FAULT.
> +
> +Note: Userspaces which attempt to resolve memory faults so that they can retry
> +KVM_RUN are encouraged to guard against repeatedly receiving the same
> +error/annotated fault.
> +
> +See KVM_EXIT_MEMORY_FAULT for more information.
> +
>   8. Other capabilities.
>   ======================
>   
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 6409914428ca..ee3cd8c3c0ef 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -4518,6 +4518,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_ENABLE_CAP:
>   	case KVM_CAP_VM_DISABLE_NX_HUGE_PAGES:
>   	case KVM_CAP_IRQFD_RESAMPLE:
> +	case KVM_CAP_MEMORY_FAULT_INFO:
>   		r = 1;
>   		break;
>   	case KVM_CAP_EXIT_HYPERCALL:
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 4e741ff27af3..96aa930536b1 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2327,4 +2327,15 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
>   /* Max number of entries allowed for each kvm dirty ring */
>   #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
>   
> +static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> +						 gpa_t gpa, gpa_t size)
> +{
> +	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> +	vcpu->run->memory_fault.gpa = gpa;
> +	vcpu->run->memory_fault.size = size;
> +
> +	/* Flags are not (yet) defined or communicated to userspace. */
> +	vcpu->run->memory_fault.flags = 0;
> +}
> +
>   #endif
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index bd1abe067f28..7ae9987b48dd 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -274,6 +274,7 @@ struct kvm_xen_exit {
>   #define KVM_EXIT_RISCV_SBI        35
>   #define KVM_EXIT_RISCV_CSR        36
>   #define KVM_EXIT_NOTIFY           37
> +#define KVM_EXIT_MEMORY_FAULT     38
>   
>   /* For KVM_EXIT_INTERNAL_ERROR */
>   /* Emulate instruction failed. */
> @@ -520,6 +521,12 @@ struct kvm_run {
>   #define KVM_NOTIFY_CONTEXT_INVALID	(1 << 0)
>   			__u32 flags;
>   		} notify;
> +		/* KVM_EXIT_MEMORY_FAULT */
> +		struct {
> +			__u64 flags;
> +			__u64 gpa;
> +			__u64 size;
> +		} memory_fault;
>   		/* Fix the size of the union. */
>   		char padding[256];
>   	};
> @@ -1203,6 +1210,7 @@ struct kvm_ppc_resize_hpt {
>   #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
>   #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
>   #define KVM_CAP_USER_MEMORY2 230
> +#define KVM_CAP_MEMORY_FAULT_INFO 231
>   
>   #ifdef KVM_CAP_IRQ_ROUTING
>   

