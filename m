Return-Path: <linuxppc-dev+bounces-11550-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA7DB3DD17
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 10:53:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFjMV5yFLz2yrB;
	Mon,  1 Sep 2025 18:53:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756716806;
	cv=none; b=SR8HZc83G6B0xvNpES+H8FdxqCcjs56b/E8REBO7bm0rsfj4Zu+83NBngSGS8sFOG4YeNTJP4txNC3MT/ZweT6ik8Lu863UVGTaUzgLLQMrU5a+eGP8/2wvV6zPuOwhR1uGbO0cBcgLcDtx2he9zR7uxQ9YWsUl+eXbR8/gzX+d/g5s9BCpcGzY8ZeRLkUAUilAbw4bxpJdZDxtUw/M/MQBHXeZ+j69L4sWFajzrbAOTIljpRbs2/FcQTSf0QpfuSwH+9WqxXE9n2Dge3cXnx1vS0WonLL0zJX5NP7srUl/Tdt7EXx9VrgT7OU7FYkQYxHoHQbY8B5K0uX3B8Dcjww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756716806; c=relaxed/relaxed;
	bh=StnaVQ/kuJKs04O83dX5k4oJKlm7slZS7P8l56c6/pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSuuXmm+uuT5buKyKDW9aRtRdudhYqw1WAvCwedoQrssgVQzc1Nkpfg9Cng5E8orMhmyf8M3kQloOYN9mR0EUykvn2rHDhTca3PY+EagmQGe1rCT/bw946wysG4yVz6hv8bRNg8uw2Vs2VJKW6V64X8lEaUfLoYj2OA6KmiGr5wsGH9GpmQf+xJ/9gRmLd9k3Or7cm2LP21hbjU77iU3rvxqXu5n+MKy2oEIyDp4yTbNaYb8zr40DKqoHVBfbpQVehUOmQ9YmC4WH0o78LbWQJJ3/QW6mvaUlNlTbGZnO73WWvPdlx54yu90PB3Wz0DEUf92Bp+5I4xyp7WRbZ2ZmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RA4zwAAE; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RA4zwAAE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFjMR462gz2yhb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 18:53:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=StnaVQ/kuJKs04O83dX5k4oJKlm7slZS7P8l56c6/pw=; b=RA4zwAAEQiCqRY/TooPy/tk0ud
	rw/w/lrPMKIuCcLgBggd3vuF4fpgSHX2M6sOVAuXSsUxc6uo62EztDxZp6mUyLYACfh9aAiQ4hUoK
	82CRdGtK06o3JG8leT4mdeqFWpOvxCq7zbalqum94HHR3wsQiUtwGOvNJ/2o6yTp+OPGxXR5MGYPV
	1yOapB3oD+7v/gfi+iv8++UHuT1iMd7Mz0pOnUMIQprUWkrJXSVst3cjO2AyrjWrnKgBhq12Fknwk
	r0JV17FlQBdTf/VOYEqYBwF38xuhW7tHMPCWst5TfMJAk8UyIIHkIoyKzZPme1MsIqukkAMY1KpFN
	VoQ5ou9w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0HF-00000003gW1-0qU0;
	Mon, 01 Sep 2025 08:52:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3F3FB300342; Mon, 01 Sep 2025 10:52:36 +0200 (CEST)
Date: Mon, 1 Sep 2025 10:52:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	thomas.weissschuh@linutronix.de, Li Chen <chenl311@chinatelecom.cn>,
	Bibo Mao <maobibo@loongson.cn>, Mete Durlu <meted@linux.ibm.com>,
	Tobias Huschle <huschle@linux.ibm.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Brian Gerst <brgerst@gmail.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andrea Righi <arighi@nvidia.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>
Subject: Re: [PATCH v7 4/8] powerpc/smp: Introduce CONFIG_SCHED_MC to guard
 MC scheduling bits
Message-ID: <20250901085236.GK4068168@noisy.programming.kicks-ass.net>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <20250826041319.1284-5-kprateek.nayak@amd.com>
 <609a980b-cbe3-442b-a492-91722870b156@csgroup.eu>
 <20250826080706.GC3245006@noisy.programming.kicks-ass.net>
 <20250826094358.GG3245006@noisy.programming.kicks-ass.net>
 <7137972e-bc7a-432c-94be-755ba9029d8c@linux.ibm.com>
 <20250901083507.GD4067720@noisy.programming.kicks-ass.net>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901083507.GD4067720@noisy.programming.kicks-ass.net>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 01, 2025 at 10:35:07AM +0200, Peter Zijlstra wrote:
> On Thu, Aug 28, 2025 at 08:13:51PM +0530, Shrikanth Hegde wrote:
> 
> > > --- a/arch/powerpc/Kconfig
> > > +++ b/arch/powerpc/Kconfig
> > > @@ -170,6 +170,9 @@ config PPC
> > >   	select ARCH_STACKWALK
> > >   	select ARCH_SUPPORTS_ATOMIC_RMW
> > >   	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx
> > > +	select ARCH_SUPPORTS_SCHED_SMT		if PPC64 && SMP
> > > +	select ARCH_SUPPORTS_SCHED_MC		if PPC64 && SMP
> > > +	select SCHED_MC				if ARCH_SUPPORTS_SCHED_MC
> > 
> > Wondering if this SCHED_MC is necessary here? shouldn't it be set by arch/Kconfig?
> 
> Ah, so without this SCHED_MC becomes a user selectable option, with this
> it is an always on option (for ppc64) -- no user prompt.
> 
> That is, this is the only way I found to have similar semantics to this:
> 
> > > -config SCHED_MC
> > > -	def_bool y
> > > -	depends on PPC64 && SMP
> > > -
> 
> Which is also not a user selectable option.
> 
> > nit: Also, can we have so they are still sorted?
> > 	select ARCH_SUPPORTS_SCHED_MC		if PPC64 && SMP
> > 	select ARCH_SUPPORTS_SCHED_SMT		if PPC64 && SMP
> 
> Sure, let me flip them. I need to prod that that patch anyway, built
> robot still ain'ted happy.

Looks like 44x/iss476-smp_defconfig (iow 32bit power) also wants
SCHED_MC, so it should be:

config SCHED_MC
	def_bool y
	depends on SMP

Its just SMT that's a PPC64 special.

