Return-Path: <linuxppc-dev+bounces-3062-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F32049C2577
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 20:21:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlTLz1k3fz3bkc;
	Sat,  9 Nov 2024 06:21:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731093675;
	cv=none; b=WM6fvtCNAroFYv8iM4wWBjF0u0oXzHkkFErD+BXxDmiZ2wSKYpAsQF+CkbW+L8gNcnJzSz3pNE+AlB0C3tWAyPmsfNkFbsYksGtRVAelwCw9Gk69shjpAWPSuFEx+/Zx0dkvp2eDGC8lCzcnTSAmQpSlGTR8bC3zIahdjKwqnHz/DyGMIUe9rKjLm+qv9f1c+V1Lvwd102US5KULMeB70EaTdksyQG3stzAO/dvuLinkxSSJoqIswfIMPfricrR19iRBr1z/DfAE+k8ID1tsoiUJLV63J3YKVGYNxZc5blmJyIdc1MP9J1zI/7HuEr5kb0+v8wHzDEY5T4eX3HEaxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731093675; c=relaxed/relaxed;
	bh=8YcjDPRp+ch63AiHWbyUonpJU1I1xzWMm60VjxeSPBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbhAz/FcKdmaxprr1l5KL1SpJf0HxVmahmKj6EX/NHew09k6mEwx/YAnJonfRXOazj0STEGmzne6orqrl9ts9r2qVMXKaq18F4WD7r3x33JdkYWFR+tbGTYxjn0M8ja5WxulgYCSY/RdHpDGdHXP2xKV3qdgMCbsZr7dNCDMFfQfMT18PBPhjmBV9pyCAXR3W/BTHGbxniDZ5mzRNcR7RQO37e+KjMBXTo2QqdGt9WEvfg8acbKEOpKpgpUrtAX/LfGr9gfepFCqzMJCLJblheFscxio9SUr44wIoLSe4F5yheSeQX/zbIqPjhklAtJ9lMGSfO0qyJiisQvEJ2qPFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=cZYBwdrp; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=cZYBwdrp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlTLs3F3gz3bkY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2024 06:21:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8YcjDPRp+ch63AiHWbyUonpJU1I1xzWMm60VjxeSPBg=; b=cZYBwdrpfBq0WkAzRag13fRlS+
	+srbnreYjdRBxyphguUoNEdRENMc2XQvjvdmcPCG8tSi0IBd8RLKxJ9tVIKKCXbrYhVgAlphm7nFw
	KaOQ0DI3OZtCLdtVPbfYEJVunJWsU6yxRKMG5SYnngYK6zSyWVyBmQMCBmKL8ASErMzOjFliOr1mf
	2LGzPOyztA+UnoRF4/9kZWW+fAaVytkEptmIljkMleewymLWOvGhcue0d8GGy16tmNypfEEULMmnL
	CkTYE7C3ZtK277xJSY/wpLNDvmH4tyWeyO6lWNLkHljqzc1EiAJps/puK56riWhqlGDWL8ndXq/w4
	lQvZSyMg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t9UXE-00000009Dec-12gL;
	Fri, 08 Nov 2024 19:20:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2150230049D; Fri,  8 Nov 2024 20:20:44 +0100 (CET)
Date: Fri, 8 Nov 2024 20:20:43 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, oliver.upton@linux.dev, seanjc@google.com,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, will@kernel.org, linux@armlinux.org.uk,
	catalin.marinas@arm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@linutronix.de,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v7 4/5] x86: perf: Refactor misc flag assignments
Message-ID: <20241108192043.GA22801@noisy.programming.kicks-ass.net>
References: <20241108153411.GF38786@noisy.programming.kicks-ass.net>
 <gsntbjypft37.fsf@coltonlewis-kvm.c.googlers.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gsntbjypft37.fsf@coltonlewis-kvm.c.googlers.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Nov 08, 2024 at 07:01:16PM +0000, Colton Lewis wrote:
> Peter Zijlstra <peterz@infradead.org> writes:
> 
> > On Thu, Nov 07, 2024 at 07:03:35PM +0000, Colton Lewis wrote:
> > > Break the assignment logic for misc flags into their own respective
> > > functions to reduce the complexity of the nested logic.
> 
> > > Signed-off-by: Colton Lewis <coltonlewis@google.com>
> > > Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> > > ---
> > >   arch/x86/events/core.c            | 32 +++++++++++++++++++++++--------
> > >   arch/x86/include/asm/perf_event.h |  2 ++
> > >   2 files changed, 26 insertions(+), 8 deletions(-)
> 
> > > diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> > > index d19e939f3998..9fdc5fa22c66 100644
> > > --- a/arch/x86/events/core.c
> > > +++ b/arch/x86/events/core.c
> > > @@ -3011,16 +3011,35 @@ unsigned long
> > > perf_arch_instruction_pointer(struct pt_regs *regs)
> > >   	return regs->ip + code_segment_base(regs);
> > >   }
> 
> > > +static unsigned long common_misc_flags(struct pt_regs *regs)
> > > +{
> > > +	if (regs->flags & PERF_EFLAGS_EXACT)
> > > +		return PERF_RECORD_MISC_EXACT_IP;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> > > +{
> > > +	unsigned long guest_state = perf_guest_state();
> > > +	unsigned long flags = common_misc_flags(regs);
> 
> > This is double common_misc and makes no sense
> 
> I'm confused what you mean. Are you referring to starting with
> common_misc_flags in both perf_arch_misc_flags and
> perf_arch_guest_misc_flags so possibly the common_msic_flags are set
> twice?
> 
> That seems like a good thing that common flags are set wherever they
> apply. You can't guarantee where perf_arch_guest_misc_flags may be
> called in the future.

I got confused by perf_arch_misc_flags() calling common_misc_flags()
twice. It is in fact worse, because afaict all of
perf_arch_guest_misc_flags() is 'common'.

Isn't the below more or less what you want?

static unsigned long misc_flags(struct pt_regs *regs)
{
	unsigned long flags = 0;

	if (regs->flags & PERF_EFLAGS_EXACT)
		flags |= PERF_RECORD_MISC_EXACT_IP;

	return flags;
}

static unsigned long native_flags(struct pt_regs *regs)
{
	unsigned long flags = 0;

	if (user_mode(regs))
		flags |= PERF_RECORD_MISC_USER;
	else
		flags |= PERF_RECORD_MISC_KERNEL;

	return flags;
}

static unsigned long guest_flags(struct pt_regs *regs)
{
	unsigned long guest_state = perf_guest_state();
	unsigned long flags = 0;

	if (guest_state & PERF_GUEST_ACTIVE) {
		if (guest_state & PERF_GUEST_USER)
			flags |= PERF_RECORD_MISC_GUEST_USER;
		else
			flags |= PERF_RECORD_MISC_GUEST_KERNEL;
	}

	return flags;
}

unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
{
	unsigned long flags;

	flags = misc_flags(regs);
	flags |= guest_flags(regs);

	return flags;
}

unsigned long perf_arch_misc_flags(struct pt_regs *regs)
{
	unsigned long flags;
	unsigned long guest;

	flags = misc_flags(regs);
	guest = guest_flags(regs);
	if (guest)
		flags |= guest;
	else
		flags |= native_flags(regs);

	return flags;
}

Note how both perf_arch*() functions end up calling both misc and guest.

