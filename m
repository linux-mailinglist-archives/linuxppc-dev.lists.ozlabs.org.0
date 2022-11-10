Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A01623CDC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 08:42:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7DMX6xXWz3cK2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 18:42:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bKwr6F+u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=robert.hu@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bKwr6F+u;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7D71077mz3cDx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 18:31:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668065517; x=1699601517;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K4DExVACpt2lARFBBsyLRbh7EHo+YwPLCynabZeKIUc=;
  b=bKwr6F+u5O/uwA0AbzWz4KZuXteMfuppDFTKGhNXmZnnrzmcy6NBF2FP
   WKqe3wf697p85+AEmFrsXhPYxjtIpS2rhADiebKAHzRrLoftJg5yoxrgp
   z6xTatM9jdkQkk2ZmhBv7UlPdg61f/pOq8oKuGuDj8cWdqT4KJhzDroBJ
   vz35oqYWVBj805Xbdx8JXuujf/C5lbJqWzZkMkPXw5lu1s7amdGmJ3zKj
   rq9tEFLNJgPdjI4YO5zluPd/U+GQV5JGjW6neoAkrnr9TfzdKJLkR6Gzc
   feWQoR2ZH3KAHM8lci6U6YxtbxBHnEhxVENAJFaX2twmAViiQNDQltW4t
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="313009371"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="313009371"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2022 23:31:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="631556568"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="631556568"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org) ([10.239.48.212])
  by orsmga007.jf.intel.com with ESMTP; 09 Nov 2022 23:31:43 -0800
Message-ID: <ff0e8701d02ee161d064f92c8b742c2cc061bce0.camel@linux.intel.com>
Subject: Re: [PATCH 32/44] KVM: x86: Unify pr_fmt to use module name for all
 KVM modules
From: Robert Hoo <robert.hu@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>,  Marc Zyngier <maz@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Vitaly
 Kuznetsov <vkuznets@redhat.com>
Date: Thu, 10 Nov 2022 15:31:42 +0800
In-Reply-To: <20221102231911.3107438-33-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-33-seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 10 Nov 2022 18:41:09 +1100
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-11-02 at 23:18 +0000, Sean Christopherson wrote:
> Define pr_fmt using KBUILD_MODNAME for all KVM x86 code so that
> printks
> use consistent formatting across common x86, Intel, and AMD code.  In
> addition to providing consistent print formatting, using
> KBUILD_MODNAME,
> e.g. kvm_amd and kvm_intel, allows referencing SVM and VMX (and SEV
> and
> SGX and ...) as technologies without generating weird messages, and
> without causing naming conflicts with other kernel code, e.g. "SEV:
> ",
> "tdx: ", "sgx: " etc.. are all used by the kernel for non-KVM
> subsystems.
> 
> Opportunistically move away from printk() for prints that need to be
> modified anyways, e.g. to drop a manual "kvm: " prefix.
> 
> Opportunistically convert a few SGX WARNs that are similarly modified
> to
> WARN_ONCE; in the very unlikely event that the WARNs fire, odds are
> good
> that they would fire repeatedly and spam the kernel log without
> providing
> unique information in each print.
> 
> Note, defining pr_fmt yields undesirable results for code that uses
> KVM's
> printk wrappers, e.g. vcpu_unimpl().  But, that's a pre-existing
> problem
> as SVM/kvm_amd already defines a pr_fmt, and thankfully use of KVM's
> wrappers is relatively limited in KVM x86 code.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/cpuid.c            |  1 +
>  arch/x86/kvm/debugfs.c          |  2 ++
>  arch/x86/kvm/emulate.c          |  1 +
>  arch/x86/kvm/hyperv.c           |  1 +
>  arch/x86/kvm/i8254.c            |  4 ++--
>  arch/x86/kvm/i8259.c            |  4 +++-
>  arch/x86/kvm/ioapic.c           |  1 +
>  arch/x86/kvm/irq.c              |  1 +
>  arch/x86/kvm/irq_comm.c         |  7 +++---
>  arch/x86/kvm/kvm_onhyperv.c     |  1 +
>  arch/x86/kvm/lapic.c            |  8 +++----
>  arch/x86/kvm/mmu/mmu.c          |  6 ++---
>  arch/x86/kvm/mmu/page_track.c   |  1 +
>  arch/x86/kvm/mmu/spte.c         |  4 ++--
>  arch/x86/kvm/mmu/spte.h         |  4 ++--
>  arch/x86/kvm/mmu/tdp_iter.c     |  1 +
>  arch/x86/kvm/mmu/tdp_mmu.c      |  1 +
>  arch/x86/kvm/mtrr.c             |  1 +
>  arch/x86/kvm/pmu.c              |  1 +
>  arch/x86/kvm/smm.c              |  1 +
>  arch/x86/kvm/svm/avic.c         |  2 +-
>  arch/x86/kvm/svm/nested.c       |  2 +-
>  arch/x86/kvm/svm/pmu.c          |  2 ++
>  arch/x86/kvm/svm/sev.c          |  1 +
>  arch/x86/kvm/svm/svm.c          | 10 ++++-----
>  arch/x86/kvm/svm/svm_onhyperv.c |  1 +
>  arch/x86/kvm/svm/svm_onhyperv.h |  4 ++--
>  arch/x86/kvm/vmx/evmcs.c        |  1 +
>  arch/x86/kvm/vmx/evmcs.h        |  4 +---
>  arch/x86/kvm/vmx/nested.c       |  3 ++-
>  arch/x86/kvm/vmx/pmu_intel.c    |  5 +++--
>  arch/x86/kvm/vmx/posted_intr.c  |  2 ++
>  arch/x86/kvm/vmx/sgx.c          |  5 +++--
>  arch/x86/kvm/vmx/vmcs12.c       |  1 +
>  arch/x86/kvm/vmx/vmx.c          | 40 ++++++++++++++++---------------
> --
>  arch/x86/kvm/vmx/vmx_ops.h      |  4 ++--
>  arch/x86/kvm/x86.c              | 28 ++++++++++++-----------
>  arch/x86/kvm/xen.c              |  1 +
>  38 files changed, 97 insertions(+), 70 deletions(-)
> 
After this patch set, still find some printk()s left in arch/x86/kvm/*,
consider clean all of them up?

arch/x86/kvm/lapic.c:1215:		printk(KERN_ERR "TODO:
unsupported delivery mode %x\n",
arch/x86/kvm/lapic.c:1506:		printk(KERN_ERR "Local APIC
read with len = %x, "
arch/x86/kvm/lapic.c:2586:		printk(KERN_ERR "malloc apic
regs error for vcpu %x\n",
arch/x86/kvm/ioapic.h:95:		printk(KERN_EMERG "assertion
failed %s: %d: %s\n",	\
arch/x86/kvm/ioapic.c:614:		printk(KERN_WARNING "ioapic:
wrong length %d\n", len);
arch/x86/kvm/ioapic.c:641:		printk(KERN_WARNING "ioapic:
Unsupported size %d\n", len);
arch/x86/kvm/mmu/mmu.c:1652:			printk(KERN_ERR "%s: %p
%llx\n", __func__,
arch/x86/kvm/svm/svm.c:3450:		printk(KERN_ERR "%s: unexpected
exit_int_info 0x%x "
arch/x86/kvm/vmx/posted_intr.c:322:				printk(
KERN_INFO
arch/x86/kvm/vmx/posted_intr.c:343:			printk(KERN_INF
O "%s: failed to update PI IRTE\n",
arch/x86/kvm/vmx/vmx.c:6507:			printk(KERN_WARNING
"%s: Breaking out of NMI-blocked "
arch/x86/kvm/x86.c:13027:		printk(KERN_INFO "irq bypass
consumer (token %p) unregistration"

