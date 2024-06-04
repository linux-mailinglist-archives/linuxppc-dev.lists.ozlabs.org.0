Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4A78FBF80
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 01:02:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y9kw/6fC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv5h803H7z3dBk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 09:02:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b3; helo=out-179.mta1.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org)
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [IPv6:2001:41d0:203:375::b3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv5gG3zpWz30Wf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 09:01:06 +1000 (AEST)
X-Envelope-To: jthoughton@google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1717542038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+MGPWWPfczYg0bV6msWVM8wo7iUe4hq2RoxquwpyNXc=;
	b=Y9kw/6fCw7WeofkUSeTV2BTDMr5jngNUCtFMMUMXtMQwQZ57KMcePca1DBVS/t4qEWis16
	iF4e3V2COwO/t2Yct7KRRLkVhD5NRIOHTq7i/FQgEBT9QWzcLz+QujFnkzpcYe5jZDxDJW
	+mCbFXXZogKs/7ZLafe//WQoP8h37Tw=
X-Envelope-To: akpm@linux-foundation.org
X-Envelope-To: pbonzini@redhat.com
X-Envelope-To: aou@eecs.berkeley.edu
X-Envelope-To: ankita@nvidia.com
X-Envelope-To: anup@brainfault.org
X-Envelope-To: atishp@atishpatra.org
X-Envelope-To: axelrasmussen@google.com
X-Envelope-To: maobibo@loongson.cn
X-Envelope-To: catalin.marinas@arm.com
X-Envelope-To: dmatlack@google.com
X-Envelope-To: rientjes@google.com
X-Envelope-To: chenhuacai@kernel.org
X-Envelope-To: james.morse@arm.com
X-Envelope-To: corbet@lwn.net
X-Envelope-To: maz@kernel.org
X-Envelope-To: mpe@ellerman.id.au
X-Envelope-To: npiggin@gmail.com
X-Envelope-To: palmer@dabbelt.com
X-Envelope-To: paul.walmsley@sifive.com
X-Envelope-To: rananta@google.com
X-Envelope-To: ryan.roberts@arm.com
X-Envelope-To: seanjc@google.com
X-Envelope-To: shahuang@redhat.com
X-Envelope-To: shuah@kernel.org
X-Envelope-To: suzuki.poulose@arm.com
X-Envelope-To: zhaotianrui@loongson.cn
X-Envelope-To: will@kernel.org
X-Envelope-To: yuzhao@google.com
X-Envelope-To: yuzenghui@huawei.com
X-Envelope-To: kvm-riscv@lists.infradead.org
X-Envelope-To: kvm@vger.kernel.org
X-Envelope-To: kvmarm@lists.linux.dev
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-doc@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kselftest@vger.kernel.org
X-Envelope-To: linux-mips@vger.kernel.org
X-Envelope-To: linux-mm@kvack.org
X-Envelope-To: linux-riscv@lists.infradead.org
X-Envelope-To: linuxppc-dev@lists.ozlabs.org
X-Envelope-To: loongarch@lists.linux.dev
Date: Tue, 4 Jun 2024 23:00:28 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: James Houghton <jthoughton@google.com>
Subject: Re: [PATCH v4 6/7] KVM: arm64: Relax locking for kvm_test_age_gfn
 and kvm_age_gfn
Message-ID: <Zl-cjHVKaQ0iQE5d@linux.dev>
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-7-jthoughton@google.com>
 <Zlog5Yk_Pjq0jQhC@linux.dev>
 <Zloicw4IU8_-V5Ns@linux.dev>
 <CADrL8HV4SZ9BEQg1j3ojG-v5umL_d3sa4e1k2vMQCMmBEgeFpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADrL8HV4SZ9BEQg1j3ojG-v5umL_d3sa4e1k2vMQCMmBEgeFpQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Yu Zhao <yuzhao@google.com>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, David Rientjes <rientjes@google.com>, Zenghui Yu <yuzenghui@huawei.com>, Axel Rasmussen <axelrasmussen@google.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, David Matlack <dmatlack@google.com>, Palmer Dabbelt <palmer@dabbelt.com
 >, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, Sean Christopherson <seanjc@google.com>, Ankit Agrawal <ankita@nvidia.com>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 04, 2024 at 03:20:20PM -0700, James Houghton wrote:
> On Fri, May 31, 2024 at 12:18 PM Oliver Upton <oliver.upton@linux.dev> wrote:
> >
> > On Fri, May 31, 2024 at 12:11:33PM -0700, Oliver Upton wrote:
> > > On Wed, May 29, 2024 at 06:05:09PM +0000, James Houghton wrote:
> > >
> > > [...]
> > >
> > > > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > > > index 9e2bbee77491..eabb07c66a07 100644
> > > > --- a/arch/arm64/kvm/hyp/pgtable.c
> > > > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > > > @@ -1319,10 +1319,8 @@ static int stage2_age_walker(const struct kvm_pgtable_visit_ctx *ctx,
> > > >     data->young = true;
> > > >
> > > >     /*
> > > > -    * stage2_age_walker() is always called while holding the MMU lock for
> > > > -    * write, so this will always succeed. Nonetheless, this deliberately
> > > > -    * follows the race detection pattern of the other stage-2 walkers in
> > > > -    * case the locking mechanics of the MMU notifiers is ever changed.
> > > > +    * This walk may not be exclusive; the PTE is permitted to change
> > > > +    * from under us.
> > > >      */
> > > >     if (data->mkold && !stage2_try_set_pte(ctx, new))
> > > >             return -EAGAIN;
> > >
> > > It is probably worth mentioning that if there was a race to update the
> > > PTE then the GFN is most likely young, so failing to clear AF probably
> > > isn't even consequential.
> 
> Thanks Oliver.
> 
> >
> > Oh, and the WARN_ON() in kvm_pgtable_stage2_test_clear_young() is bogus
> > now. Maybe demote it to:
> >
> >   r = kvm_pgtable_walk(...);
> >   WARN_ON_ONCE(r && r != -EAGAIN);
> 
> Oh, indeed, thank you. Just to make sure -- does it make sense to
> retry the cmpxchg if it fails? For example, the way I have it now for
> x86[1], we retry the cmpxchg if the spte is still a leaf, otherwise we
> move on to the next one having done nothing. Does something like that
> make sense for arm64?

At least for arm64 I do not see a need for retry. The only possible
races are:

 - A stage-2 fault handler establishing / adjusting the mapping for the
   GFN. If the guest is directly accessing the GFN in question, what's
   the point of wiping out AF?

   Even when returning -EAGAIN we've already primed stage2_age_data::young,
   so we report the correct state back to the primary MMU.

 - Another kvm_age_gfn() trying to age the same GFN. I haven't even
   looked to see if this is possible from the primary MMU POV, but in
   theory one of the calls will win the race and clear AF.

Given Yu's concerns about making pending writers wait, we should take
every opportunity to bail on the walk.

-- 
Thanks,
Oliver
