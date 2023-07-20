Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C71D75A3D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 03:17:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cR5knavF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5vt92qbFz3bsW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 11:17:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cR5knavF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=yuan.yao@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5vsF1nNnz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 11:16:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689815777; x=1721351777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0X3B3RFBvIohiBDiMK6hMbRCxfxPASWhBjQpW8WFunc=;
  b=cR5knavFH338bhWxR2FwjraGxLpx2aUXeHrnr/+N3Uj3C7QGzTfgGpuP
   ycm/X8O/PHSCpjZeCZKPZrEC5tsjlnAXe0My8xrpN9H9FF0gDmeJzLn9/
   YgESl69e1xjPlEekvDHEd6PXkt1MZjZ4HG/LBgIXIwOND1aoQly2plSz/
   vifBTn7YEvDzmbUpSPOH+S2hGH9odPMo9O34yPDUSoqWemyUb7+haiZwU
   h2F+ROlc4gQlmCv7/zASDCsvpCOrsYn3ighDBaJQi6PENQeC3OCFM3dLp
   bTx96NwIqbR4AzSQLPFR8IGF53nBYoqOVtBkPGoOdJ1o2mw+Pwc20b8XM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="364065932"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="364065932"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 18:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="674516361"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="674516361"
Received: from yy-desk-7060.sh.intel.com (HELO localhost) ([10.239.159.76])
  by orsmga003.jf.intel.com with ESMTP; 19 Jul 2023 18:15:44 -0700
Date: Thu, 20 Jul 2023 09:15:41 +0800
From: Yuan Yao <yuan.yao@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [RFC PATCH v11 05/29] KVM: Convert KVM_ARCH_WANT_MMU_NOTIFIER to
 CONFIG_KVM_GENERIC_MMU_NOTIFIER
Message-ID: <20230720011541.6ti5sygwwfwko6ab@yy-desk-7060>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-6-seanjc@google.com>
 <20230719073115.vuedo2cf3mp27xm4@yy-desk-7060>
 <ZLfv7aRq5W52ezek@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLfv7aRq5W52ezek@google.com>
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

On Wed, Jul 19, 2023 at 07:15:09AM -0700, Sean Christopherson wrote:
> On Wed, Jul 19, 2023, Yuan Yao wrote:
> > On Tue, Jul 18, 2023 at 04:44:48PM -0700, Sean Christopherson wrote:
> > > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > > index 90a0be261a5c..d2d3e083ec7f 100644
> > > --- a/include/linux/kvm_host.h
> > > +++ b/include/linux/kvm_host.h
> > > @@ -255,7 +255,9 @@ bool kvm_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
> > >  int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
> > >  #endif
> > >
> > > -#ifdef KVM_ARCH_WANT_MMU_NOTIFIER
> > > +struct kvm_gfn_range;
> >
> > Not sure why a declaration here, it's defined for ARCHs which defined
> > KVM_ARCH_WANT_MMU_NOTIFIER before.
>
> The forward declaration exists to handle cases where CONFIG_KVM=n, specifically
> arch/powerpc/include/asm/kvm_ppc.h's declaration of hooks to forward calls to
> uarch modules:
>
> 	bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *range);
> 	bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
> 	bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
> 	bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
>
> Prior to using a Kconfig, a forward declaration wasn't necessary because
> arch/powerpc/include/asm/kvm_host.h would #define KVM_ARCH_WANT_MMU_NOTIFIER even
> if CONFIG_KVM=n.
>
> Alternatively, kvm_ppc.h could declare the struct.  I went this route mainly to
> avoid the possibility of someone encountering the same problem on a different
> architecture.

Ah I see, thanks for your explanation!
