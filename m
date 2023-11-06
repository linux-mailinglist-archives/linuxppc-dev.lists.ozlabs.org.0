Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 527AB7E2581
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 14:32:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AymGKtdt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPC2v1tmLz3cCv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 00:32:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AymGKtdt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=yilun.xu@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Tue, 07 Nov 2023 00:32:05 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPC1x56c4z3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 00:32:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699277526; x=1730813526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GcPOwqKIRcSDpD/XkGdZ5KVAeJljJ23LDoDjt600Qfg=;
  b=AymGKtdtnY8HGhSe0vNWB7MilexnyhUY4IO4Mzjqax1R0tV2nzQebaUr
   W1kOtf3cznuAPrdYdxXlD5y3g5PRYhhMRxRjIdpclLkLLxQ9eyFkT5W8p
   MgIDdTnyZ8v403w37Zibu0S/eJqTA8vmfG3vC6eyCmZr7xb47U027xLF1
   4wXiuZ8ayHigr8IwiJqgctlTPCB0Ev8ta2/rtGN2ilLh872ms4ohjLRIj
   h5YnQyoHyWqbfqdGyqNIcHiJuOa/p4s+bVtzey1Z4Xts5Vmfi2V32vq8X
   r8aJOXr/CZ8kEP3r8BvcKDgMIv8Fp0o0LIw97/Mv81a/RRtyKvtc/7R5m
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2263471"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="2263471"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 05:30:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="755855766"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="755855766"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orsmga007.jf.intel.com with ESMTP; 06 Nov 2023 05:30:42 -0800
Date: Mon, 6 Nov 2023 21:29:10 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v13 20/35] KVM: x86/mmu: Handle page fault for private
 memory
Message-ID: <ZUjqJjz0Epf7ii8F@yilunxu-OptiPlex-7050>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-21-seanjc@google.com>
 <ZUeSaAKRemlSRQpO@yilunxu-OptiPlex-7050>
 <CABgObfb1Wf2ptitGhJPM6VcmkCG9haMoQj2BsttjeoV=9F0O9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfb1Wf2ptitGhJPM6VcmkCG9haMoQj2BsttjeoV=9F0O9Q@mail.gmail.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quen
 tin Perret <qperret@google.com>, Sean Christopherson <seanjc@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 05, 2023 at 05:19:36PM +0100, Paolo Bonzini wrote:
> On Sun, Nov 5, 2023 at 2:04 PM Xu Yilun <yilun.xu@linux.intel.com> wrote:
> >
> > > +static void kvm_mmu_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> > > +                                           struct kvm_page_fault *fault)
> > > +{
> > > +     kvm_prepare_memory_fault_exit(vcpu, fault->gfn << PAGE_SHIFT,
> > > +                                   PAGE_SIZE, fault->write, fault->exec,
> > > +                                   fault->is_private);
> > > +}
> > > +
> > > +static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> > > +                                struct kvm_page_fault *fault)
> > > +{
> > > +     int max_order, r;
> > > +
> > > +     if (!kvm_slot_can_be_private(fault->slot)) {
> > > +             kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> > > +             return -EFAULT;
> > > +     }
> > > +
> > > +     r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
> > > +                          &max_order);
> > > +     if (r) {
> > > +             kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> > > +             return r;
> >
> > Why report KVM_EXIT_MEMORY_FAULT here? even with a ret != -EFAULT?
> 
> The cases are EFAULT, EHWPOISON (which can report
> KVM_EXIT_MEMORY_FAULT) and ENOMEM. I think it's fine
> that even -ENOMEM can return KVM_EXIT_MEMORY_FAULT,
> and it doesn't violate the documentation.  The docs tell you "what
> can you do if error if EFAULT or EHWPOISON?"; they don't
> exclude that other errnos result in KVM_EXIT_MEMORY_FAULT,
> it's just that you're not supposed to look at it

Thanks, it's OK for ENOMEM + KVM_EXIT_MEMORY_FAULT.

Another concern is, now 3 places to report EFAULT + KVM_EXIT_MEMORY_FAULT:

  if (!kvm_slot_can_be_private(fault->slot)) {
	kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
	return -EFAULT;
  }

  file = kvm_gmem_get_file(slot);
  if (!file)
	return -EFAULT;

  if (fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
	kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
	return -EFAULT;
  }

They are different cases, and seems userspace should handle them
differently, but not enough information to distinguish them.

Thanks,
Yilun

> 
> Paolo
> 
> 
