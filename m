Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD967E1381
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Nov 2023 14:05:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cBhCx8Bj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SNZTr2KFyz3cTY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 00:05:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cBhCx8Bj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mgamail.intel.com; envelope-from=yilun.xu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SNZSw2J1Sz2xrD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 00:04:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699189488; x=1730725488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mFE9c4kKSFVvQT9y1x5f+rwwI1//UOO/ul+Hvls5bPM=;
  b=cBhCx8Bj4EJYfwx62CQFoZ+L6r8uaibPqwLDLKkfywDgQAqinwwPSZRe
   IbOfmAWJxECXIgsuSwzCx9+BYHsnS1B8DBBJsuf+l7oWZNMUV7/3NUusL
   JYrMtOVGr2Iq2yqOAzIOJj3ExEKNOcCIqKgad9QBuTRXwRugd6a+KElts
   aGtlOqxG/y/LT2UK8+d3hjWDmQSMBzz9Z+L6PBX7v1W0XkjgxZ5QOg1h/
   cCdhwZ9SlPTSTgMMCYepgkpOcV6xub12e2k71S/iPptsVdWIfgtASLtWy
   hsWiLVZcdikhNZE8QFxIstFkUHym30aDnk1DJi3WkMuj4ZCU6jWo5lrfa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="388033733"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="388033733"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 05:04:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="10206430"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa001.fm.intel.com with ESMTP; 05 Nov 2023 05:04:02 -0800
Date: Sun, 5 Nov 2023 21:02:32 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v13 20/35] KVM: x86/mmu: Handle page fault for private
 memory
Message-ID: <ZUeSaAKRemlSRQpO@yilunxu-OptiPlex-7050>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-21-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027182217.3615211-21-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, L
 iam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +static void kvm_mmu_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> +					      struct kvm_page_fault *fault)
> +{
> +	kvm_prepare_memory_fault_exit(vcpu, fault->gfn << PAGE_SHIFT,
> +				      PAGE_SIZE, fault->write, fault->exec,
> +				      fault->is_private);
> +}
> +
> +static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> +				   struct kvm_page_fault *fault)
> +{
> +	int max_order, r;
> +
> +	if (!kvm_slot_can_be_private(fault->slot)) {
> +		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> +		return -EFAULT;
> +	}
> +
> +	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
> +			     &max_order);
> +	if (r) {
> +		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> +		return r;

Why report KVM_EXIT_MEMORY_FAULT here? even with a ret != -EFAULT? This is
different from the decription where KVM_EXIT_MEMORY_FAULT is introduced:

  KVM_EXIT_MEMORY_FAULT will be used to report memory faults that appear to
  be implicit conversions.

  To allow for future possibilities where KVM reports KVM_EXIT_MEMORY_FAULT
  and fills run->memory_fault on _any_ unresolved fault, KVM returns
  "-EFAULT"

Thanks,
Yilun

> +	}
> +
> +	fault->max_level = min(kvm_max_level_for_order(max_order),
> +			       fault->max_level);
> +	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
> +
> +	return RET_PF_CONTINUE;
> +}
