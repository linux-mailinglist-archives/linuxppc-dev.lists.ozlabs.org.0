Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3E675C4FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 12:49:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ENKKNQ00;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6mX672sYz2yDF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 20:49:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ENKKNQ00;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=yilun.xu@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 21 Jul 2023 20:48:37 AEST
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6mW94Dy1z2yDR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 20:48:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689936518; x=1721472518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lqUeKJjFv2Sxri0zg/OC/DAKL78i5iZqhBI02xpLRko=;
  b=ENKKNQ00bHO17vAk1HDHCRhKu8EQz6ao5C7E25KDH8V79X/LZbuj3xhi
   v3KMw0QX7fRCQRbTF/pUqcKV3IlWUybvMg7Us+AbIb019V9u7+BJSGqFe
   1KgmIYnZ9+5ZyC7/7PfGULvphoXE7E4KT/y3VY+BA/nOxnxQHjWaegMsZ
   8CIHA8LBNh2ka5b3lNlmyhn3870svqzEmdCeFoVKmmAIdxgiSqAwGwCTO
   Eb+HemJ56DFHk1rldirCaZjS2GUIDMs0ArZ4T+wAauz0LBYuf1m1iGcF3
   MYmHk+hfFCcwWmX5OghuQPjW2SwQSoXKY6Hnb7dRlsCzD/kel8hjQzUO/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="365884922"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="365884922"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 03:47:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="724827627"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="724827627"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orsmga002.jf.intel.com with ESMTP; 21 Jul 2023 03:47:13 -0700
Date: Fri, 21 Jul 2023 18:45:26 +0800
From: Xu Yilun <yilun.xu@intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a
 per-action union
Message-ID: <ZLphxpSTL9Fpn1ye@yilunxu-OptiPlex-7050>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-2-seanjc@google.com>
 <ZLolA2U83tP75Qdd@yzhao56-desk.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLolA2U83tP75Qdd@yzhao56-desk.sh.intel.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Paul Moore <paul@paul-moore.com>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Sean Christopherson <seanjc@google.com>,
  Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-07-21 at 14:26:11 +0800, Yan Zhao wrote:
> On Tue, Jul 18, 2023 at 04:44:44PM -0700, Sean Christopherson wrote:
> 
> May I know why KVM now needs to register to callback .change_pte()?

I can see the original purpose is to "setting a pte in the shadow page
table directly, instead of flushing the shadow page table entry and then
getting vmexit to set it"[1].

IIUC, KVM is expected to directly make the new pte present for new
pages in this callback, like for COW.

> As also commented in kvm_mmu_notifier_change_pte(), .change_pte() must be
> surrounded by .invalidate_range_{start,end}().
> 
> While kvm_mmu_notifier_invalidate_range_start() has called kvm_unmap_gfn_range()
> to zap all leaf SPTEs, and page fault path will not install new SPTEs
> successfully before kvm_mmu_notifier_invalidate_range_end(),
> kvm_set_spte_gfn() should not be able to find any shadow present leaf entries to
> update PFN.

I also failed to figure out how the kvm_set_spte_gfn() could pass
several !is_shadow_present_pte(iter.old_spte) check then write the new
pte.


[1] https://lore.kernel.org/all/200909222039.n8MKd4TL002696@imap1.linux-foundation.org/

Thanks,
Yilun

> 
> Or could we just delete completely
> "kvm_handle_hva_range(mn, address, address + 1, pte, kvm_set_spte_gfn);"
> from kvm_mmu_notifier_change_pte() ?
