Return-Path: <linuxppc-dev+bounces-10191-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE4B01CDE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jul 2025 15:06:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bdsRS64RNz30VR;
	Fri, 11 Jul 2025 23:06:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752239188;
	cv=none; b=HOjYL283uzO9zieyOAGkUCs5m//aZpeqdACv264nU7bBn+LZCBcmsbzvLPwck6VPJjUCRPzhzN14it7ekC9Aj/Vb7gD2C2FEpyzMWFFCp6CvUVFwiHibxCOMv3JwFFHVAZIfbVK2ClNSuSsi5HIkyWR1WCNtoaGpPckZqoPjG7SKcnt/r3loVJ/sA6BFsNKkD8dGVoeBVwqulAcj9NdC6MPL51w6IrXCL9aoMXgksu4X6kVnS9mcX6AzZgNdVDSpbGfKAN8mHKODRLaCNGfhu8lTE7l+vhkm3eu0TLC46DqcX0RI1K1/eeb7ZDjmhmskKUWqGynj0AuHnMrNXLE/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752239188; c=relaxed/relaxed;
	bh=JQDO7CQbOse5fynpXP+bHFdnydSlbIlzSOnsKM4/1ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mN4iQax6LoYhtK4DjboxcNMKlNV9vxJ3fsu/rHigLKCcdcZ/1fB7gnCL9GB6wgMA86pSZ6I50+xnbEcCAeHYBtVL9T6Hh/TOrl9UW6At1/egcJ4Y5qXN5SBvwAZG/pU/eS37498kDPakxCW/TPAKMOBPQ37h2yNApHULSSSxDKQ93AQxM1JqAlpLvLifEUxSwEf67gRkI982UIhw295odE3ovkBFaH03STbn+Qd/NzU3NZQeHWcV2YcUBF+oRpn6GrSDzjBAnqQ3TqybjHTa9OM/RWwOfxJuSIzREGW0IGThIC9krxsRfxIV1GW8s71x00AZN27l+LQcYJqGdqJIqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=nmrReV8D; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=nmrReV8D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdsRR3BRdz2y92
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jul 2025 23:06:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JQDO7CQbOse5fynpXP+bHFdnydSlbIlzSOnsKM4/1ek=; b=nmrReV8DwctvLjXYkxFOs5GG3A
	sbZLcU/SKsakeyPJR7xcr9eLL8ztsj6REA+QLFqWeWl8wptXBsAXI+yXPrpEh/MYtqcWL24pyadUV
	MaSk4RYDiaDAYA3SV8AzNgL9GFilmQCW/ZZtTGfIwFQ22WLmpdwUa7eS1yS0XB/dMyFCshp3PliUt
	GImPgDWwv8qamQAUbrZf0nuywP7ftzAQ4mX2q07XXZUPxzb49ZHomGPOn1RkyRCu66Oh/QoarEM+Y
	VHw/cEYm47Rs1AeUIbEXOHdHZ3p8joIZ89nk7uUMNn0+Xhsp57tADXactQhYlWnemIXP19LWAMIuE
	HTJ23B0g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDRy-00000009GLp-2VOl;
	Fri, 11 Jul 2025 13:06:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B5E873001AA; Fri, 11 Jul 2025 15:06:01 +0200 (CEST)
Date: Fri, 11 Jul 2025 15:06:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Li Chen <me@linux.beauty>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Brian Gerst <brgerst@gmail.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Li Chen <chenl311@chinatelecom.cn>,
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
	Tobias Huschle <huschle@linux.ibm.com>,
	Mete Durlu <meted@linux.ibm.com>,
	Joel Granados <joel.granados@kernel.org>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v5 1/4] smpboot: introduce SDTL_INIT() helper to tidy
 sched topology setup
Message-ID: <20250711130601.GD905792@noisy.programming.kicks-ass.net>
References: <20250710105715.66594-1-me@linux.beauty>
 <20250710105715.66594-2-me@linux.beauty>
 <ba4dbdf8-bc37-493d-b2e0-2efb00ea3e19@amd.com>
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
In-Reply-To: <ba4dbdf8-bc37-493d-b2e0-2efb00ea3e19@amd.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 11, 2025 at 11:20:30AM +0530, K Prateek Nayak wrote:
> On 7/10/2025 4:27 PM, Li Chen wrote:
> >  	/*
> >  	 * .. and append 'j' levels of NUMA goodness.
> >  	 */
> >  	for (j = 1; j < nr_levels; i++, j++) {
> > -		tl[i] = (struct sched_domain_topology_level){
> > -			.mask = sd_numa_mask,
> > -			.sd_flags = cpu_numa_flags,
> > -			.flags = SDTL_OVERLAP,
> > -			.numa_level = j,
> > -			SD_INIT_NAME(NUMA)
> > -		};
> > +		tl[i] = SDTL_INIT(sd_numa_mask, cpu_numa_flags, NUMA);
> > +		tl[i].numa_level = j;
> > +		tl[i].flags = SDTL_OVERLAP;
> 
> Tangential discussion: I was looking at this and was wondering why we
> need a "tl->flags" when there is already sd_flags() function and we can
> simply add SD_OVERLAP to sd_numa_flags().
> 
> I think "tl->flags" was needed when the idea of overlap domains was
> added in commit e3589f6c81e4 ("sched: Allow for overlapping sched_domain
> spans") when it depended on "FORCE_SD_OVERLAP" sched_feat() which
> allowed toggling this off but that was done away with in commit
> af85596c74de ("sched/topology: Remove FORCE_SD_OVERLAP") so perhaps we
> can get rid of it now?
> 
> Relying on SD_NUMA should be enough currently. Peter, Valentin, what do
> you think of something like below?

I think you're right. SD_NUMA appears to be the one and only case that
also has SDTL_OVERLAP which then results in setting SD_OVERLAP, making
SD_NUMA and SD_OVERLAP equivalent and SDTL_OVERLAP redundant.

I'll presume you're okay with me adding your SoB to things, and I'll
push out all 5 patches to queue/sched/core to let the robots have a go
at things.

