Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 677458B8F6C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 20:10:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OKthm/ur;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VV4qV6h7Cz3cYm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 04:10:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OKthm/ur;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.184; helo=out-184.mta0.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 444 seconds by postgrey-1.37 at boromir; Thu, 02 May 2024 04:09:49 AEST
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VV4pj66jBz3cTt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2024 04:09:49 +1000 (AEST)
Date: Wed, 1 May 2024 18:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1714586499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=69cqu9i0hgyzyuHYDqr+vrRYe6XfjRaXapX+zs6xjnE=;
	b=OKthm/ur+byGKYcHm2DPTNC5z/URFbkOGPadzI7eiZzZ5mezBuOrZl7iO90ODYz9fRbgEy
	6ouYU5nahmPlBewz9DVswxKYUkCE/I5p4/wec5b9+XAdcs6XajZ/4HudNHe28xxU0lQwpd
	WHY0DzOGslb59/2viaOe877XKsJlqEk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 0/4] KVM: Fold kvm_arch_sched_in() into
 kvm_arch_vcpu_load()
Message-ID: <ZjKDe6SlVWGj0ugA@linux.dev>
References: <20240430193157.419425-1-seanjc@google.com>
 <ZjGMn5tlq8edKZYv@linux.dev>
 <ZjJRhQhX_12eBvY-@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjJRhQhX_12eBvY-@google.com>
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 01, 2024 at 07:28:21AM -0700, Sean Christopherson wrote:
> On Wed, May 01, 2024, Oliver Upton wrote:
> > On Tue, Apr 30, 2024 at 12:31:53PM -0700, Sean Christopherson wrote:
> > > Drop kvm_arch_sched_in() and instead pass a @sched_in boolean to
> > > kvm_arch_vcpu_load().
> > > 
> > > While fiddling with an idea for optimizing state management on AMD CPUs,
> > > I wanted to skip re-saving certain host state when a vCPU is scheduled back
> > > in, as the state (theoretically) shouldn't change for the task while it's
> > > scheduled out.  Actually doing that was annoying and unnecessarily brittle
> > > due to having a separate API for the kvm_sched_in() case (the state save
> > > needed to be in kvm_arch_vcpu_load() for the common path).
> > > 
> > > E.g. I could have set a "temporary"-ish flag somewhere in kvm_vcpu, but (a)
> > > that's gross and (b) it would rely on the arbitrary ordering between
> > > sched_in() and vcpu_load() staying the same.
> > 
> > Another option would be to change the rules around kvm_arch_sched_in()
> > where the callee is expected to load the vCPU context.
> > 
> > The default implementation could just call kvm_arch_vcpu_load() directly
> > and the x86 implementation can order things the way it wants before
> > kvm_arch_vcpu_load().
> > 
> > I say this because ...
> > 
> > > The only real downside I see is that arm64 and riscv end up having to pass
> > > "false" for their direct usage of kvm_arch_vcpu_load(), and passing boolean
> > > literals isn't ideal.  But that can be solved by adding an inner helper that
> > > omits the @sched_in param (I almost added a patch to do that, but I couldn't
> > > convince myself it was necessary).
> > 
> > Needing to pass @sched_in for other usage of kvm_arch_vcpu_load() hurts
> > readability, especially when no other architecture besides x86 cares
> > about it.
> 
> Yeah, that bothers me too.
> 
> I tried your suggestion of having x86's kvm_arch_sched_in() do kvm_arch_vcpu_load(),
> and even with an added kvm_arch_sched_out() to provide symmetry, the x86 code is
> kludgy, and even the common code is a bit confusing as it's not super obvious
> that kvm_sched_{in,out}() is really just kvm_arch_vcpu_{load,put}().
> 
> Staring a bit more at the vCPU flags we have, adding a "bool scheduled_out" isn't
> terribly gross if it's done in common code and persists across load() and put(),
> i.e. isn't so blatantly a temporary field.  And because it's easy, it could be
> set with WRITE_ONCE() so that if it can be read cross-task if there's ever a
> reason to do so.
> 
> The x86 code ends up being less ugly, and adding future arch/vendor code for
> sched_in() *or* sched_out() requires minimal churn, e.g. arch code doesn't need
> to override kvm_arch_sched_in().
> 
> The only weird part is that vcpu->preempted and vcpu->ready have slightly
> different behavior, as they are cleared before kvm_arch_vcpu_load().  But the
> weirdness is really with those flags no having symmetry, not with scheduled_out
> itself.
> 
> Thoughts?

Yeah, this seems reasonable. Perhaps scheduled_out could be a nice hint
for guardrails / sanity checks in the future.

-- 
Thanks,
Oliver
