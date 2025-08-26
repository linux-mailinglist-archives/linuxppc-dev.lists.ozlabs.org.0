Return-Path: <linuxppc-dev+bounces-11306-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81185B35662
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 10:07:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB0dH0RP4z3dJV;
	Tue, 26 Aug 2025 18:07:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756195651;
	cv=none; b=Ikz/9BkYpg+rVZ9emF4iioRlhjNUg3iIfOasX00Beviqp+zc7AiY2ruBBsyCYLBwFeIRR7khSLtzH9aWDXAIt4Z0YfmyfXeywxyc+CsebAX0OCrC8Yzwr/gfCPxdsFL77ocxZj18aERC+gEz754E2/cx4moLJ7RUdi6fi9+Tmlk2KFRjVbTvyUZxw/5SVi/geJeHjzGsuBHzCc6m8ccI39StGIbcxQmiwGyp+9Z7VeUgcUam1xCHBQAeiDptFNk+lkKe9GTtpdnVbGxxUUyzin136VFzBLpHCpGkxz4ddtiO6PNMKo5SSY4xu3jVOsXm776eeCaqyLYP7rsK6Cq1XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756195651; c=relaxed/relaxed;
	bh=hmFJ8UGHXtcnTXJTD5aZxBfE9vYuZlwcChixuyZ11Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a89E3lvVzULWwjdVNjgh1b0KEB3FgMxrCytWItTmN4ueId4HreExrUycdqqchtEnrtKQ1JxKmzKPxmVveKcehN2omYb7s0FOO+ruF4pL4OC+dcL1nh6TocxKxwGMYRqPaJ1j+c51CRsfZLLKAdrNm/d8oYXgmR3Z4UuSZkCMu0ZzEoAAN+clw49jRH1X4jeE8+sa+ybOFopgRJXBFUUg+dexCswYnytGHdieu1cUQ/+iLjm1r9qWpLn8HDltNVnPEWNpOVdiN6Zvw8be/T14oiwXQ2SmIya6XT4T9OsQsyZ7iY00/U45DRm6E5fggDMGyTCV/5P8NxI6scDGn56lVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=H9DpZjWM; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=H9DpZjWM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cB0dG29N4z3dHw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 18:07:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hmFJ8UGHXtcnTXJTD5aZxBfE9vYuZlwcChixuyZ11Qo=; b=H9DpZjWMWHsq6F3BUVy79e5zuz
	vghIAhY56CI0DpFSVhIibAP4Grh3T4XZmFtAv9N2boiP1jSrrRyqC/Kyt7ZxhkACiCVKZvnDhWzGn
	F+ALksY6fLI9K8Tyu6NlNbuzKhfPGRQzKlBA3P8Fx6yacNBiheOoJjqewsc39YYjZJomLeyhVWnyW
	Kl/o1HBVxiUoLvYU+WlcBCjio4gaTu4doNCN9S8XBFZU6oiJbeUQrefhrCPAdIcHB/xBb9uGuXuMh
	A/wYCGUpUC329jIMJvbiltVIYieOElB91RdrbPNG9oxBQRT7HBz8WT3d8oYoKYEY6YaSFbhpgDYTV
	Is5pjO7A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqohv-00000002AKe-1j30;
	Tue, 26 Aug 2025 08:07:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E75E73002C5; Tue, 26 Aug 2025 10:07:06 +0200 (CEST)
Date: Tue, 26 Aug 2025 10:07:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
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
Message-ID: <20250826080706.GC3245006@noisy.programming.kicks-ass.net>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <20250826041319.1284-5-kprateek.nayak@amd.com>
 <609a980b-cbe3-442b-a492-91722870b156@csgroup.eu>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <609a980b-cbe3-442b-a492-91722870b156@csgroup.eu>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 26, 2025 at 06:49:29AM +0200, Christophe Leroy wrote:
> 
> 
> Le 26/08/2025 à 06:13, K Prateek Nayak a écrit :
> > PowerPC enables the MC scheduling domain by default on systems with
> > coregroup support without having a SCHED_MC config in Kconfig.
> > 
> > The scheduler uses CONFIG_SCHED_MC to introduce the MC domain in the
> > default topology (core) and to optimize the default CPU selection
> > routine (sched-ext).
> > 
> > Introduce CONFIG_SCHED_MC for powerpc and note that it should be
> > preferably enabled given the current default behavior. This also ensures
> > PowerPC is tested during future developments that come to depend on
> > CONFIG_SCHED_MC.
> > 
> > Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> > ---
> >   arch/powerpc/Kconfig           | 9 +++++++++
> >   arch/powerpc/include/asm/smp.h | 2 ++
> >   arch/powerpc/kernel/smp.c      | 4 ++++
> >   3 files changed, 15 insertions(+)
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 93402a1d9c9f..e954ab3f635f 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -971,6 +971,15 @@ config SCHED_SMT
> >   	  when dealing with POWER5 cpus at a cost of slightly increased
> >   	  overhead in some places. If unsure say N here.
> > +config SCHED_MC
> > +	bool "Multi-Core Cache (MC) scheduler support"
> > +	depends on PPC64 && SMP
> > +	default y
> > +	help
> > +	  MC scheduler support improves the CPU scheduler's decision making
> > +	  when dealing with POWER systems that contain multiple Last Level
> > +	  Cache instances on the same socket. If unsure say Y here.
> > +
> 
> You shouldn't duplicate CONFIG_SCHED_MC in every architecture, instead you
> should define a CONFIG_ARCH_HAS_SCHED_MC in arch/Kconfig that gets selected
> by architectures then have CONFIG_SCHED_MC defined in init/Kconfig or
> kernel/Kconfig or so.

Let me add this first -- it is currently duplicated. Then I'll see about
merging the thing across architectures.

