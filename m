Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 155FC8B8BE4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 16:29:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fH+LlSsK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTzw04x11z3cWG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 00:29:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fH+LlSsK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3h1eyzgykdcwamivrkowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTzvH20Pxz3cRJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2024 00:28:26 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dcdc3db67f0so1160932276.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 May 2024 07:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714573703; x=1715178503; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XN3PxGtZEQXNqntUnTfIz5xk/K9LwEoscNdYQ+/jCbc=;
        b=fH+LlSsKumwTREj6zMa7srIGQqvcBSFGV/PFk+BvnCYJh+DbHfO3r1DF5k/VhNI6ml
         ZdoVjJPEK9wcEAfEq2SRa0NyXXaENQiYBGzFmlgpHycmZPZOwUp5HQV/5ab53lZLozYl
         2XKuHlHRGB5eVBqqkOVpU1zWEvQvzGW06T5A1ZpBoyAFQj/GmFrK2AyFEWFzi/GwzDpb
         bEZjT4aT3Hp1nXS++z3PkvZxmP+ksBlt040QKEk0loXEHSi/ZWM/f8P6E1vm5jSQ4oUB
         XM1oAbMmqIQlT1zYPmgsRun3d8/uRhT287HvEK9UEUFI9zRWJ6ndhkdkKt/hJe5dWUhM
         cpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714573703; x=1715178503;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XN3PxGtZEQXNqntUnTfIz5xk/K9LwEoscNdYQ+/jCbc=;
        b=vmi8AXzMSh1Uwkxe29a4E59AL9pJQi/7nqF+9Y53Kmnvax7FQymcueJLhX+hYGZxHy
         lZMKN3HonCE61t9ox0RADMXbs2Te4Kyn58r0FwP/Jh4w+KR5Tb+Vn8e41odAYe7HjYjj
         yCvdt7iQAPb7nmy75pftN2Hakr5hbDHoopSWK5kYvP666pPe3r3Sp/RQzRnknCB71jT/
         RK/1Ji374gsukjYRnUB/mFkX7LWAbWw+a8W+08KefUnsvQtjfHYn7JgBQ2ruBCADOxaV
         wg+W3j+hwYXViry17WdGsgwRtc/gXtHZRzd0MFFBvl0UunXpmpvY+0XrbWs4hwHCbvDq
         Vwfg==
X-Forwarded-Encrypted: i=1; AJvYcCVBiu/woppGdeB/U8z7EtkA5TOZo4DPxlZRNbaEu9tHatjDDvwObKy7fyfjBWf7aOnJJA3UGtQie3S/b8D8ReEubMwjOA+HTmny7uBu9w==
X-Gm-Message-State: AOJu0Yz6W86IQ6fLYHqyIb0BbfJkT6/Qt6466mpX9Qj7vdXLP1CeV3Qn
	AOcoROlgZrtmZuCdhckE2mLtV66f5DZzpfjGM9SFjtmVcaBbCWEs1MfawZldEl5DD1rm81DSI2w
	9Xw==
X-Google-Smtp-Source: AGHT+IHUezc4IZyZaMpXPcKS4Nl6spB8OORkXUO8w6Eu/n8Z2MEF5bQ0emcAkaZbOCNg6hB5INRjxf830ZQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:a283:0:b0:de5:a44c:25af with SMTP id
 c3-20020a25a283000000b00de5a44c25afmr1319848ybi.5.1714573703105; Wed, 01 May
 2024 07:28:23 -0700 (PDT)
Date: Wed, 1 May 2024 07:28:21 -0700
In-Reply-To: <ZjGMn5tlq8edKZYv@linux.dev>
Mime-Version: 1.0
References: <20240430193157.419425-1-seanjc@google.com> <ZjGMn5tlq8edKZYv@linux.dev>
Message-ID: <ZjJRhQhX_12eBvY-@google.com>
Subject: Re: [PATCH 0/4] KVM: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Content-Type: text/plain; charset="us-ascii"
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

On Wed, May 01, 2024, Oliver Upton wrote:
> On Tue, Apr 30, 2024 at 12:31:53PM -0700, Sean Christopherson wrote:
> > Drop kvm_arch_sched_in() and instead pass a @sched_in boolean to
> > kvm_arch_vcpu_load().
> > 
> > While fiddling with an idea for optimizing state management on AMD CPUs,
> > I wanted to skip re-saving certain host state when a vCPU is scheduled back
> > in, as the state (theoretically) shouldn't change for the task while it's
> > scheduled out.  Actually doing that was annoying and unnecessarily brittle
> > due to having a separate API for the kvm_sched_in() case (the state save
> > needed to be in kvm_arch_vcpu_load() for the common path).
> > 
> > E.g. I could have set a "temporary"-ish flag somewhere in kvm_vcpu, but (a)
> > that's gross and (b) it would rely on the arbitrary ordering between
> > sched_in() and vcpu_load() staying the same.
> 
> Another option would be to change the rules around kvm_arch_sched_in()
> where the callee is expected to load the vCPU context.
> 
> The default implementation could just call kvm_arch_vcpu_load() directly
> and the x86 implementation can order things the way it wants before
> kvm_arch_vcpu_load().
> 
> I say this because ...
> 
> > The only real downside I see is that arm64 and riscv end up having to pass
> > "false" for their direct usage of kvm_arch_vcpu_load(), and passing boolean
> > literals isn't ideal.  But that can be solved by adding an inner helper that
> > omits the @sched_in param (I almost added a patch to do that, but I couldn't
> > convince myself it was necessary).
> 
> Needing to pass @sched_in for other usage of kvm_arch_vcpu_load() hurts
> readability, especially when no other architecture besides x86 cares
> about it.

Yeah, that bothers me too.

I tried your suggestion of having x86's kvm_arch_sched_in() do kvm_arch_vcpu_load(),
and even with an added kvm_arch_sched_out() to provide symmetry, the x86 code is
kludgy, and even the common code is a bit confusing as it's not super obvious
that kvm_sched_{in,out}() is really just kvm_arch_vcpu_{load,put}().

Staring a bit more at the vCPU flags we have, adding a "bool scheduled_out" isn't
terribly gross if it's done in common code and persists across load() and put(),
i.e. isn't so blatantly a temporary field.  And because it's easy, it could be
set with WRITE_ONCE() so that if it can be read cross-task if there's ever a
reason to do so.

The x86 code ends up being less ugly, and adding future arch/vendor code for
sched_in() *or* sched_out() requires minimal churn, e.g. arch code doesn't need
to override kvm_arch_sched_in().

The only weird part is that vcpu->preempted and vcpu->ready have slightly
different behavior, as they are cleared before kvm_arch_vcpu_load().  But the
weirdness is really with those flags no having symmetry, not with scheduled_out
itself.

Thoughts?

static void kvm_sched_in(struct preempt_notifier *pn, int cpu)
{
	struct kvm_vcpu *vcpu = preempt_notifier_to_vcpu(pn);

	WRITE_ONCE(vcpu->preempted, false);
	WRITE_ONCE(vcpu->ready, false);

	__this_cpu_write(kvm_running_vcpu, vcpu);
	kvm_arch_vcpu_load(vcpu, cpu);

	WRITE_ONCE(vcpu->scheduled_out, false);
}

static void kvm_sched_out(struct preempt_notifier *pn,
			  struct task_struct *next)
{
	struct kvm_vcpu *vcpu = preempt_notifier_to_vcpu(pn);

	WRITE_ONCE(vcpu->scheduled_out, true);

	if (current->on_rq) {
		WRITE_ONCE(vcpu->preempted, true);
		WRITE_ONCE(vcpu->ready, true);
	}
	kvm_arch_vcpu_put(vcpu);
	__this_cpu_write(kvm_running_vcpu, NULL);
}
