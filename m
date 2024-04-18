Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C418A9CB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 16:20:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B2pNwg/h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VL0Kz32vmz3dDP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 00:20:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B2pNwg/h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VL0KB6wpcz3cQx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 00:19:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F60961831;
	Thu, 18 Apr 2024 14:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DADC32781;
	Thu, 18 Apr 2024 14:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713449980;
	bh=AUt0AvjyUjML6ZxpdeebsS26lKqvFMfvN3N/sVPtRcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2pNwg/hwD4GFU+j3nK1XWEUYARxusswHne4K6Z5OpMVZCZ5ULburdPwHrZg5I4iu
	 U/y9G2YsiGlibZSfkHi7l9Xc1A1byzgoT5FVOk+X4RFIoKyf/9F5r8tzdINa6Ps8CK
	 NPuSjycgX6VTiF+iVSS1slG1ZPMnyNtYdJWJVNkY44ow8evHMgw76zaMNBUTb1gBOc
	 nj3GHa4KAPMpDuvEycIrwcKhHJVzFpCFK7p7pG+gbOJbi5QsNN4n2gti59vuYtfqHK
	 aaq8X28NwfZ8l26T0x1HIRhf7nZrUbo6m75mqZ305iGTMgwp0/oNpia09G3VtqBot9
	 UR6a8YKfras6w==
Date: Thu, 18 Apr 2024 15:19:32 +0100
From: Will Deacon <will@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
Message-ID: <20240418141932.GA1855@willie-the-truck>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
 <20240405115815.3226315-2-pbonzini@redhat.com>
 <20240412104408.GA27645@willie-the-truck>
 <86jzl2sovz.wl-maz@kernel.org>
 <ZhlLHtfeSHk9gRRO@google.com>
 <86h6g5si0m.wl-maz@kernel.org>
 <Zh1d94Pl6gneVoDd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zh1d94Pl6gneVoDd@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Marc Zyngier <maz@kernel.org>, linux-trace-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-perf-users@vger.kernel.org, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 15, 2024 at 10:03:51AM -0700, Sean Christopherson wrote:
> On Sat, Apr 13, 2024, Marc Zyngier wrote:
> > On Fri, 12 Apr 2024 15:54:22 +0100, Sean Christopherson <seanjc@google.com> wrote:
> > > 
> > > On Fri, Apr 12, 2024, Marc Zyngier wrote:
> > > > On Fri, 12 Apr 2024 11:44:09 +0100, Will Deacon <will@kernel.org> wrote:
> > > > > On Fri, Apr 05, 2024 at 07:58:12AM -0400, Paolo Bonzini wrote:
> > > > > Also, if you're in the business of hacking the MMU notifier code, it
> > > > > would be really great to change the .clear_flush_young() callback so
> > > > > that the architecture could handle the TLB invalidation. At the moment,
> > > > > the core KVM code invalidates the whole VMID courtesy of 'flush_on_ret'
> > > > > being set by kvm_handle_hva_range(), whereas we could do a much
> > > > > lighter-weight and targetted TLBI in the architecture page-table code
> > > > > when we actually update the ptes for small ranges.
> > > > 
> > > > Indeed, and I was looking at this earlier this week as it has a pretty
> > > > devastating effect with NV (it blows the shadow S2 for that VMID, with
> > > > costly consequences).
> > > > 
> > > > In general, it feels like the TLB invalidation should stay with the
> > > > code that deals with the page tables, as it has a pretty good idea of
> > > > what needs to be invalidated and how -- specially on architectures
> > > > that have a HW-broadcast facility like arm64.
> > > 
> > > Would this be roughly on par with an in-line flush on arm64?  The simpler, more
> > > straightforward solution would be to let architectures override flush_on_ret,
> > > but I would prefer something like the below as x86 can also utilize a range-based
> > > flush when running as a nested hypervisor.
> 
> ...
> 
> > I think this works for us on HW that has range invalidation, which
> > would already be a positive move.
> > 
> > For the lesser HW that isn't range capable, it also gives the
> > opportunity to perform the iteration ourselves or go for the nuclear
> > option if the range is larger than some arbitrary constant (though
> > this is additional work).
> > 
> > But this still considers the whole range as being affected by
> > range->handler(). It'd be interesting to try and see whether more
> > precise tracking is (or isn't) generally beneficial.
> 
> I assume the idea would be to let arch code do single-page invalidations of
> stage-2 entries for each gfn?

Right, as it's the only code which knows which ptes actually ended up
being aged.

> Unless I'm having a brain fart, x86 can't make use of that functionality.  Intel
> doesn't provide any way to do targeted invalidation of stage-2 mappings.  AMD
> provides an instruction to do broadcast invalidations, but it takes a virtual
> address, i.e. a stage-1 address.  I can't tell if it's a host virtual address or
> a guest virtual address, but it's a moot point because KVM doen't have the guest
> virtual address, and if it's a host virtual address, there would need to be valid
> mappings in the host page tables for it to work, which KVM can't guarantee.

Ah, so it sounds like it would need to be an arch opt-in then.

Will
