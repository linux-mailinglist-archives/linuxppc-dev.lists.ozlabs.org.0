Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9387A9101
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 04:41:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=meXopBuV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrfm249mmz3c03
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 12:41:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=meXopBuV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mgamail.intel.com; envelope-from=yilun.xu@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrfl56Ggtz2ykc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 12:39:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695264018; x=1726800018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iSkpE1N9Jcp84HPqnZ+sK/v5B9D3q8Q2ZGh6iASUxTU=;
  b=meXopBuVi64o9rKjrq9ImRjwrn7FzQENxFLjZtX/PaykmMbJPWzM5njA
   vvawycxKMDHbH9gtQTcncnCKKtbX3ZdhGHTchTEfjF/lFLDYUjsWzHDbv
   t8r2cx4LpQSeW5A3A4LfYTo1AxkuMIGpxjhBC1NEOze4/w+LSz8k8KsT5
   aFaTwn1jMH+wD0mPxrGBP38Kj98PM5R2i4IMYe6TAAlDylnRW7W+tLQTZ
   1c2OhzB7Vlw5tYsVzQsbEEByn17Anm9LHMWXDUKH0+cuugC9dB6/YUZTl
   46n8udV1eIwpbvsFezdqjrC/zmLnhfF+OF7owjkkpkneXUtw7x4r8umZX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360653940"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360653940"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 19:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077731075"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077731075"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 19:39:45 -0700
Date: Thu, 21 Sep 2023 10:39:18 +0800
From: Xu Yilun <yilun.xu@intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [RFC PATCH v12 02/33] KVM: Use gfn instead of hva for
 mmu_notifier_retry
Message-ID: <ZQus1v3AvEZjuat9@yilunxu-OptiPlex-7050>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-3-seanjc@google.com>
 <ZQqMBEL61p739dpF@yilunxu-OptiPlex-7050>
 <ZQr5uXhV6Cnx4DYT@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQr5uXhV6Cnx4DYT@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@orac
 le.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-09-20 at 06:55:05 -0700, Sean Christopherson wrote:
> On Wed, Sep 20, 2023, Xu Yilun wrote:
> > On 2023-09-13 at 18:55:00 -0700, Sean Christopherson wrote:
> > > +void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end)
> > > +{
> > > +	lockdep_assert_held_write(&kvm->mmu_lock);
> > > +
> > > +	WARN_ON_ONCE(!kvm->mmu_invalidate_in_progress);
> > > +
> > >  	if (likely(kvm->mmu_invalidate_in_progress == 1)) {
> > >  		kvm->mmu_invalidate_range_start = start;
> > >  		kvm->mmu_invalidate_range_end = end;
> > 
> > IIUC, Now we only add or override a part of the invalidate range in
> > these fields, IOW only the range in last slot is stored when we unlock.
> 
> Ouch.  Good catch!
> 
> > That may break mmu_invalidate_retry_gfn() cause it can never know the
> > whole invalidate range.
> > 
> > How about we extend the mmu_invalidate_range_start/end everytime so that
> > it records the whole invalidate range:
> > 
> > if (kvm->mmu_invalidate_range_start == INVALID_GPA) {
> > 	kvm->mmu_invalidate_range_start = start;
> > 	kvm->mmu_invalidate_range_end = end;
> > } else {
> > 	kvm->mmu_invalidate_range_start =
> > 		min(kvm->mmu_invalidate_range_start, start);
> > 	kvm->mmu_invalidate_range_end =
> > 		max(kvm->mmu_invalidate_range_end, end);
> > }
> 
> Yeah, that does seem to be the easiest solution.
> 
> I'll post a fixup patch, unless you want the honors.

Please go ahead, cause at a second thought I'm wondering if this simple
range extension is reasonable.

When the invalidation acrosses multiple slots, I'm not sure if the
contiguous HVA range must correspond to contiguous GFN range. If not,
are we producing a larger range than required?

And when the invalidation acrosses multiple address space, I'm almost
sure it is wrong to merge GFN ranges from different address spaces. But
I have no clear solution yet.

Thanks,
Yilun
