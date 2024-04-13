Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 096058A3C13
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Apr 2024 11:57:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mFZQ2ioQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VGpkX5tpPz3vbJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Apr 2024 19:57:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mFZQ2ioQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VGpjq4mssz3020
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Apr 2024 19:56:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 08B8A601FE;
	Sat, 13 Apr 2024 09:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB85C4AF55;
	Sat, 13 Apr 2024 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713002188;
	bh=QDdFeOtdYZxjp46RxGOVjOsa4iTVpoIZG/FPIUq7PkU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mFZQ2ioQYI4SPEajzb0CoDJ+DBpEtqV/6Z/BFQ4PKiYU1objwuCL1h0YEV5wVvaaV
	 CStVGbxbg2PLEvUpiruu3vkH/y4cM4+cyaR6uTFrqiuCgSAt4YmdU+kQNO4mhteYE5
	 q333pUGrVdvWTX2jJozMVr1WfreRxN9CZWgNdxAf4RoHKNGu901fhZ7/hHch++3d1I
	 m2eFAZSX3y2YCFXBDOjGGbQYp+igVsDeuNqTryAXEm0o7f2cHg2zXaMLKr1soTFZ2j
	 ofMp5Ohw4rwS2q0YaHgiHwMQ7+YkitOG5MjuKApjtCEFb8HYoNf/A99GWK9EyWwGw/
	 8+Y5NXUY8UrNA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1rva7W-0047Ih-AA;
	Sat, 13 Apr 2024 10:56:26 +0100
Date: Sat, 13 Apr 2024 10:56:25 +0100
Message-ID: <86h6g5si0m.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
In-Reply-To: <ZhlLHtfeSHk9gRRO@google.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
	<20240405115815.3226315-2-pbonzini@redhat.com>
	<20240412104408.GA27645@willie-the-truck>
	<86jzl2sovz.wl-maz@kernel.org>
	<ZhlLHtfeSHk9gRRO@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.2
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: seanjc@google.com, will@kernel.org, pbonzini@redhat.com, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, oliver.upton@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, tsbogend@alpha.franken.de, npiggin@gmail.com, anup@brainfault.org, atishp@atishpatra.org, akpm@linux-foundation.org, david@redhat.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Will Deacon <will@kernel.org>, Anup Patel <anup@brainfault.org>, linux-trace-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-perf-users@vger.kernel.org, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 Apr 2024 15:54:22 +0100,
Sean Christopherson <seanjc@google.com> wrote:
> 
> On Fri, Apr 12, 2024, Marc Zyngier wrote:
> > On Fri, 12 Apr 2024 11:44:09 +0100, Will Deacon <will@kernel.org> wrote:
> > > On Fri, Apr 05, 2024 at 07:58:12AM -0400, Paolo Bonzini wrote:
> > > Also, if you're in the business of hacking the MMU notifier code, it
> > > would be really great to change the .clear_flush_young() callback so
> > > that the architecture could handle the TLB invalidation. At the moment,
> > > the core KVM code invalidates the whole VMID courtesy of 'flush_on_ret'
> > > being set by kvm_handle_hva_range(), whereas we could do a much
> > > lighter-weight and targetted TLBI in the architecture page-table code
> > > when we actually update the ptes for small ranges.
> > 
> > Indeed, and I was looking at this earlier this week as it has a pretty
> > devastating effect with NV (it blows the shadow S2 for that VMID, with
> > costly consequences).
> > 
> > In general, it feels like the TLB invalidation should stay with the
> > code that deals with the page tables, as it has a pretty good idea of
> > what needs to be invalidated and how -- specially on architectures
> > that have a HW-broadcast facility like arm64.
> 
> Would this be roughly on par with an in-line flush on arm64?  The simpler, more
> straightforward solution would be to let architectures override flush_on_ret,
> but I would prefer something like the below as x86 can also utilize a range-based
> flush when running as a nested hypervisor.
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index ff0a20565f90..b65116294efe 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -601,6 +601,7 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
>         struct kvm_gfn_range gfn_range;
>         struct kvm_memory_slot *slot;
>         struct kvm_memslots *slots;
> +       bool need_flush = false;
>         int i, idx;
>  
>         if (WARN_ON_ONCE(range->end <= range->start))
> @@ -653,10 +654,22 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
>                                         break;
>                         }
>                         r.ret |= range->handler(kvm, &gfn_range);
> +
> +                       /*
> +                        * Use a precise gfn-based TLB flush when possible, as
> +                        * most mmu_notifier events affect a small-ish range.
> +                        * Fall back to a full TLB flush if the gfn-based flush
> +                        * fails, and don't bother trying the gfn-based flush
> +                        * if a full flush is already pending.
> +                        */
> +                       if (range->flush_on_ret && !need_flush && r.ret &&
> +                           kvm_arch_flush_remote_tlbs_range(kvm, gfn_range.start
> +                                                            gfn_range.end - gfn_range.start + 1))
> +                               need_flush = true;
>                 }
>         }
>  
> -       if (range->flush_on_ret && r.ret)
> +       if (need_flush)
>                 kvm_flush_remote_tlbs(kvm);
>  
>         if (r.found_memslot)

I think this works for us on HW that has range invalidation, which
would already be a positive move.

For the lesser HW that isn't range capable, it also gives the
opportunity to perform the iteration ourselves or go for the nuclear
option if the range is larger than some arbitrary constant (though
this is additional work).

But this still considers the whole range as being affected by
range->handler(). It'd be interesting to try and see whether more
precise tracking is (or isn't) generally beneficial.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
