Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 556AD758FBC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 09:55:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ChGShfn5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Smg7315z306p
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 17:55:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ChGShfn5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=yuan.yao@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Sll1g2Kz2yV5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 17:54:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689753299; x=1721289299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1N+W8cRNC9pUexWe7qJQhUtuOwgwVBF4LoLojnPzLGM=;
  b=ChGShfn5ZfSUdses4eyvBFNShls1fkk6PWR6zwG5Gb8BjGTSUBkKBG4/
   eGpE3AVclW+alvFLoID8h/ySiXLBY9fezL3tyMQkOEazwHzlUrDf8QhU7
   XfFYZBkbFXdkpuVp9D80PPO1MwZJEB55OI5DOXFk93VPZCZCgH54l1dUH
   EyZWgZVcmY3kvjFiIKPNyoNfPo7m5lxvcPt211AC90ISdfTxHlhQDXK8S
   y5WTQ3vQsrItuuYMmcp2GFC05ojaORInXKl+6J90CQVzArSbHBMczf/DB
   OqCW2SJQjhHaCO5t1FSQjX+mTjkA/TYx9HfC4QMNZtaZ62Ta82eMI/e35
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="397250615"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="397250615"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 00:54:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="814045464"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="814045464"
Received: from yy-desk-7060.sh.intel.com (HELO localhost) ([10.239.159.76])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Jul 2023 00:54:41 -0700
Date: Wed, 19 Jul 2023 15:54:40 +0800
From: Yuan Yao <yuan.yao@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [RFC PATCH v11 07/29] KVM: Add KVM_EXIT_MEMORY_FAULT exit
Message-ID: <20230719075440.m3h653frqggaiusc@yy-desk-7060>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-8-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718234512.1690985-8-seanjc@google.com>
User-Agent: NeoMutt/20171215
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver
  Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 18, 2023 at 04:44:50PM -0700, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
>
> This new KVM exit allows userspace to handle memory-related errors. It
> indicates an error happens in KVM at guest memory range [gpa, gpa+size).
> The flags includes additional information for userspace to handle the
> error. Currently bit 0 is defined as 'private memory' where '1'
> indicates error happens due to private memory access and '0' indicates
> error happens due to shared memory access.

Now it's bit 3:

#define KVM_MEMORY_EXIT_FLAG_PRIVATE (1ULL << 3)

I remember some other attributes were introduced in v10 yet:

#define KVM_MEMORY_ATTRIBUTE_READ              (1ULL << 0)
#define KVM_MEMORY_ATTRIBUTE_WRITE             (1ULL << 1)
#define KVM_MEMORY_ATTRIBUTE_EXECUTE           (1ULL << 2)
#define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)

So KVM_MEMORY_EXIT_FLAG_PRIVATE changed to bit 3 due to above things,
or other reason ? (Sorry I didn't follow v10 too much before).

>
> When private memory is enabled, this new exit will be used for KVM to
> exit to userspace for shared <-> private memory conversion in memory
> encryption usage. In such usage, typically there are two kind of memory
> conversions:
>   - explicit conversion: happens when guest explicitly calls into KVM
>     to map a range (as private or shared), KVM then exits to userspace
>     to perform the map/unmap operations.
>   - implicit conversion: happens in KVM page fault handler where KVM
>     exits to userspace for an implicit conversion when the page is in a
>     different state than requested (private or shared).
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  Documentation/virt/kvm/api.rst | 22 ++++++++++++++++++++++
>  include/uapi/linux/kvm.h       |  8 ++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index c0ddd3035462..34d4ce66e0c8 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6700,6 +6700,28 @@ array field represents return values. The userspace should update the return
>  values of SBI call before resuming the VCPU. For more details on RISC-V SBI
>  spec refer, https://github.com/riscv/riscv-sbi-doc.
>
> +::
> +
> +		/* KVM_EXIT_MEMORY_FAULT */
> +		struct {
> +  #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
> +			__u64 flags;
> +			__u64 gpa;
> +			__u64 size;
> +		} memory;
> +
> +If exit reason is KVM_EXIT_MEMORY_FAULT then it indicates that the VCPU has
> +encountered a memory error which is not handled by KVM kernel module and
> +userspace may choose to handle it. The 'flags' field indicates the memory
> +properties of the exit.
> +
> + - KVM_MEMORY_EXIT_FLAG_PRIVATE - indicates the memory error is caused by
> +   private memory access when the bit is set. Otherwise the memory error is
> +   caused by shared memory access when the bit is clear.
> +
> +'gpa' and 'size' indicate the memory range the error occurs at. The userspace
> +may handle the error and return to KVM to retry the previous memory access.
> +
>  ::
>
>      /* KVM_EXIT_NOTIFY */
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 4d4b3de8ac55..6c6ed214b6ac 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -274,6 +274,7 @@ struct kvm_xen_exit {
>  #define KVM_EXIT_RISCV_SBI        35
>  #define KVM_EXIT_RISCV_CSR        36
>  #define KVM_EXIT_NOTIFY           37
> +#define KVM_EXIT_MEMORY_FAULT     38
>
>  /* For KVM_EXIT_INTERNAL_ERROR */
>  /* Emulate instruction failed. */
> @@ -520,6 +521,13 @@ struct kvm_run {
>  #define KVM_NOTIFY_CONTEXT_INVALID	(1 << 0)
>  			__u32 flags;
>  		} notify;
> +		/* KVM_EXIT_MEMORY_FAULT */
> +		struct {
> +#define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
> +			__u64 flags;
> +			__u64 gpa;
> +			__u64 size;
> +		} memory;
>  		/* Fix the size of the union. */
>  		char padding[256];
>  	};
> --
> 2.41.0.255.g8b1d071c50-goog
>
