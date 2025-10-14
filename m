Return-Path: <linuxppc-dev+bounces-12850-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F951BD87FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 11:42:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm8Qn0z5zz30M0;
	Tue, 14 Oct 2025 20:42:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760434977;
	cv=none; b=mIXgwRc9wxyqFyNHfhrFC9ItC+20JyLCFQm3xLLR9cIE+6sbSD+kQFkisKYzJ2fuTAMbiG/ZBSuAvoE8s6kcKq6FoKjtBbWZab1LzRVZMvJm8nHen07iF4OgycJel+FiKwDSlSlb85DjeR/TBztw1c/paez5zQL4bEcFXbA1/82lo9d56mwRg+bG/2B+EQVAr838lnAgp4/zGS38g+8nGhbVG/7bLhPww5Qkd+W5jhWVx+1e4CmwcBszHmF1WwbGlsdznmJ670sIg1wwc7ANg5Fea1btc9WgREuD2efSnUTQzDleL4Akvw6DFfjCkwohsTLdzx/O3/WtZHCpFWvwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760434977; c=relaxed/relaxed;
	bh=EyinUIp7/RYhTp5epJi+n1GQX1sFo+xbZTFlP4HGzjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sz3bNIzIV4jJX6MRCk3wsd2iu9TFIFBK+xFsARfM/d/1l4oUVatHbeUSKQW7DrfzV0WXqULv208G0yviFVC+2UJy6/9pVs9oPhe3oN/PqdCXb7d97y3GY0twb/tBtUXI/tD1ZjGm/C/9zctpji1qdk20cDAoA/UugPxxHKFPaGhpTnQx086w/o1cEDM+xNiwRzV35cipkG12qXGLjnFXhJNiQ0vqboJiLnbctfLn52A7Imr48JPdGVOemzU9Ao+HMxY2GvxFigPpyrxRvBFIIaYN+kvpOi3+2z8nXrEznO/MoBGK0GTBB/o+/tB0b7wFL6pdy/27Dx0W00ROr1jcZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lT3Jtn7W; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lT3Jtn7W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cm8Qk1W0Fz2yrZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 20:42:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EyinUIp7/RYhTp5epJi+n1GQX1sFo+xbZTFlP4HGzjw=; b=lT3Jtn7WLusiNPynl/CNMZA26A
	dizGjfWpPThsB+CPPP+VBT1d7Yf8GvtmvImfJ5+mjXuMrZyWFCNkkwd373BEiHxSOaFObuL9EQIov
	GPM/cBO/PaHIaEYTL88sqqp43WQwYYrZFQBfoJLo/Fnb4kbSc9QbTG6Qjx6sNaLiTdpV+MMtbbvvb
	iOesMlrclvhPCdz5jldRsMPxRjQXTHw/9ea3nqaBi3wGtR9L7ebhkJYkTHAZ7DXywiz1qAHTCDFnW
	60UaLrTlPRzJ3mqXymx7ccZb7K2ZiRhlVHh/HXYWNy40YZCh97z5RnAFy42g98Gdjc0Xqe5t4Ivzg
	fWOjpouw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bXl-00000007xSU-20Gz;
	Tue, 14 Oct 2025 09:42:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 185FB300212; Tue, 14 Oct 2025 11:42:10 +0200 (CEST)
Date: Tue, 14 Oct 2025 11:42:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Message-ID: <20251014094210.GQ3245006@noisy.programming.kicks-ass.net>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <20250826041319.1284-5-kprateek.nayak@amd.com>
 <609a980b-cbe3-442b-a492-91722870b156@csgroup.eu>
 <20250826080706.GC3245006@noisy.programming.kicks-ass.net>
 <20250826094358.GG3245006@noisy.programming.kicks-ass.net>
 <CAMuHMdWMkKFLEZ34j=JV0Ls+o80UfC6s3yD5x-9G2K8ZV-Y-9w@mail.gmail.com>
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
In-Reply-To: <CAMuHMdWMkKFLEZ34j=JV0Ls+o80UfC6s3yD5x-9G2K8ZV-Y-9w@mail.gmail.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 14, 2025 at 11:25:53AM +0200, Geert Uytterhoeven wrote:
> Hoi Peter,
> 
> On Thu, 28 Aug 2025 at 14:57, Peter Zijlstra <peterz@infradead.org> wrote:
> > Now, when I look at unifying those config options (there's a metric ton
> > of crap that's duplicated in the arch/*/Kconfig), I end up with something
> > like the below.
> >
> > And while that isn't exact, it is the closest I could make it without
> > making a giant mess of things.
> >
> > WDYT?
> 
> Thanks for your patch, which is now commit 7bd291abe2da09f5 ("sched:
> Unify the SCHED_{SMT,CLUSTER,MC} Kconfig") in v6.18-rc1.
> 
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -41,6 +41,44 @@ config HOTPLUG_SMT
> >  config SMT_NUM_THREADS_DYNAMIC
> >         bool
> >
> > +config ARCH_SUPPORTS_SCHED_SMT
> > +       bool
> > +
> > +config ARCH_SUPPORTS_SCHED_CLUSTER
> > +       bool
> > +
> > +config ARCH_SUPPORTS_SCHED_MC
> > +       bool
> > +
> > +config SCHED_SMT
> > +       bool "SMT (Hyperthreading) scheduler support"
> > +       depends on ARCH_SUPPORTS_SCHED_SMT
> > +       default y
> 
> This is now enabled by default everywhere, while it was disabled by
> default on most architectures before...

I'm not sure ARCH_SUPPORTS_SCHED_SMT counts as everywhere, but yes.
A fair deal of the architectures had all this default yes, and I had to
pick something. Can't make an omelette without breaking an egg and all
that :/

> > +       help
> > +         Improves the CPU scheduler's decision making when dealing with
> > +         MultiThreading at a cost of slightly increased overhead in some
> > +         places. If unsure say N here.
> 
> So it should default to n?

That's just help text that got carried around. Many of the architectures
that had default y still had this text on. I suppose we can change it if
someone cares.

> If it is really needed on some architectures or platforms, I guess
> they can still select it explicitly?

There were 4 cases:

 - arch doesn't support SMT
 - arch supports SMT and lets user pick, default Y
 - arch supports SMT and lets user pick, default N
 - arch mandates SMT

Of those 3 are still possible, the one we lost is the default N case.

Old configs that have =N will continue to have N. New configs might end
up with Y.

Why is this a problem?

