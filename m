Return-Path: <linuxppc-dev+bounces-1295-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 273C09769D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 14:59:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4Hb06Wzzz2yRM;
	Thu, 12 Sep 2024 22:59:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726145980;
	cv=none; b=RZH4y58jDom9EoqJ4RoCyar8Y2K5BRyA0zFD9PhD9cxHUbi4E+XjkD9uoVNJF8rFrChv1goUJRkbVzxl9C8byDcoTCr9XTEPEQLcT5DI3ieocQQLbdNoBNT47VLapDFGCfwaRCshD4pTqnEYh7/hdYb9PIvvaVgY2MaD/sf4KlrG8GBWvhGZkXcPdBuORyGl/lTyf7V1U/kCzYP0bJe215YZVA5ogK1sBHGPrdmtzf6zUravq4OHT8Z/rYJtmse8UPZttwR0v5paliVYRxmb/w9Rw6PX1e/X5a9w3JUU2QD3IQOORdm/Xc9fjBie4Kd256F+Qm+N8PBaznYAl4UReg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726145980; c=relaxed/relaxed;
	bh=XpD/X77lqA2X1MwBp8e+ur8KLx0SrQSGDLfeVcHTiUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRjo+48bwy0XG5NHRoWp6nXfBkbyxSbO8NvGO3WyzOlkHNUEI7+suqz3ngWjKboLlZmpZfA2kR0cNcemvwwU13iXry9UWr0QKxlktF/h/sq6+W5dw3+jXbIp+L+hmMT71wSz23XW7zQIw3rOSKYgfihZjnhmfRHUCRS1h4UHRPQOt4h+HCPEJ2lpMJkkf4Tt0pYkqXsRJ3kb4bPg0/27HiPeUcXI2nzRKzGl+RdGJ1E+V79aWgvObB3AJA6m/aagegFqNc5FXEdQUwJi4CJmxUUJdTzsgbaO8gfB40x9DJngHoKfp6Xe1vCtq/vtAW0pxYNJEeso/BOXzbUmZToHNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JBe7SGXr; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sUAssYPp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JBe7SGXr; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sUAssYPp; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JBe7SGXr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sUAssYPp;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JBe7SGXr;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sUAssYPp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 362 seconds by postgrey-1.37 at boromir; Thu, 12 Sep 2024 22:59:39 AEST
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4HZz4QCLz2yNj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 22:59:38 +1000 (AEST)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 79AA71FB74;
	Thu, 12 Sep 2024 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726145612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XpD/X77lqA2X1MwBp8e+ur8KLx0SrQSGDLfeVcHTiUI=;
	b=JBe7SGXrxt6QxAQ4dTBgjo9UuvN9TZq6EDfhbhKFeM37XVq+76Mt5DgWn1FPP7rGnesQAr
	MrLuxVez1HSlM3rkAmLO9efpH6EBjXmD6HdboCD/Vh2t3MXxwklyXaJZwSezIVq/VJiyXt
	RCEkadWYFlVUcgFnhV2biH64DCLDuTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726145612;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XpD/X77lqA2X1MwBp8e+ur8KLx0SrQSGDLfeVcHTiUI=;
	b=sUAssYPpOAzlZyM8ayyp7s5Wo30orVV8PcrUmsFHyaD8UudIvNRo9chcON4TAiiAtm1VOw
	2pCXTLhk+2U8UwAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726145612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XpD/X77lqA2X1MwBp8e+ur8KLx0SrQSGDLfeVcHTiUI=;
	b=JBe7SGXrxt6QxAQ4dTBgjo9UuvN9TZq6EDfhbhKFeM37XVq+76Mt5DgWn1FPP7rGnesQAr
	MrLuxVez1HSlM3rkAmLO9efpH6EBjXmD6HdboCD/Vh2t3MXxwklyXaJZwSezIVq/VJiyXt
	RCEkadWYFlVUcgFnhV2biH64DCLDuTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726145612;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XpD/X77lqA2X1MwBp8e+ur8KLx0SrQSGDLfeVcHTiUI=;
	b=sUAssYPpOAzlZyM8ayyp7s5Wo30orVV8PcrUmsFHyaD8UudIvNRo9chcON4TAiiAtm1VOw
	2pCXTLhk+2U8UwAg==
Date: Thu, 12 Sep 2024 14:53:31 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Morten Rasmussen <morten.rasmussen@arm.com>
Cc: Yicong Yang <yangyicong@huawei.com>, yangyicong@hisilicon.com,
	Pierre Gondois <pierre.gondois@arm.com>,
	linuxppc-dev@lists.ozlabs.org, bp@alien8.de,
	dave.hansen@linux.intel.com, mingo@redhat.com,
	linux-arm-kernel@lists.infradead.org, mpe@ellerman.id.au,
	peterz@infradead.org, tglx@linutronix.de, sudeep.holla@arm.com,
	will@kernel.org, catalin.marinas@arm.com, x86@kernel.org,
	linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
	gregkh@linuxfoundation.org, rafael@kernel.org,
	jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
	linuxarm@huawei.com, xuwei5@huawei.com, guohanjun@huawei.com
Subject: Re: [PATCH v5 3/4] arm64: topology: Support SMT control on ACPI
 based system
Message-ID: <20240912125331.GZ26466@kitsune.suse.cz>
References: <00e6110a-462a-c117-0292-e88b57d27a05@huawei.com>
 <3947cb79-3199-4cd6-b784-51a245084581@arm.com>
 <1a7b5ac7-f040-672f-07a0-d7f3dc170c88@huawei.com>
 <6c05e39c-41f3-451c-b119-7b8662c1ceee@arm.com>
 <7f722af2-2969-aae5-1fb5-68d353eb95b9@huawei.com>
 <277bd093-422b-4301-92a3-d0a58eb41af5@arm.com>
 <10082e64-b00a-a30b-b9c5-1401a54f6717@huawei.com>
 <Ztqp-SUinu8C9a-P@R5WKVNH4JW>
 <bb2bd7f4-e0ea-a771-7960-e35949ec9e03@huawei.com>
 <ZuLXlOe0CyiH5eXd@R5WKVNH4JW>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuLXlOe0CyiH5eXd@R5WKVNH4JW>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -8.30
X-Spam-Flag: NO

Hello,

On Thu, Sep 12, 2024 at 01:59:16PM +0200, Morten Rasmussen wrote:
> On Fri, Sep 06, 2024 at 04:36:30PM +0800, Yicong Yang wrote:
> > On 2024/9/6 15:06, Morten Rasmussen wrote:
> > > Hi Yicong,
> > > 
> > > On Thu, Sep 05, 2024 at 08:02:20PM +0800, Yicong Yang wrote:
> > >> On 2024/9/5 16:34, Pierre Gondois wrote:
> > >>> Hello Yicong,
> > >>>
> > >>> If a platform has CPUs with:
> > >>> - 1 thread
> > >>> - X (!= 1) threads
> > >>> Then I think that the asymmetry is not detected
> > >>
> > >> Ah ok, I only handle the case where there are several thread numbers except no SMT CPUs in the
> > >> system. For this case I was thinking we don't need to handle this since there's only one kind
> > >> of SMT core in the system, control should works fine for the SMT CPU clusters and we may not
> > >> care about the CPUs with no SMT.
> > >>
> > >> Below code should handle the case if we initialize the max_smt_thread_num to 0. I also
> > >> reword the warning messages to match the fact. For heterogeneous SMT topology we still
> > >> support control SMT by on/off toggle but not fully support setting the thread number.
> > >>
> > >> 	int max_smt_thread_num = 0;
> > >> 	[...]
> > >> 	/*
> > >> 	 * This should be a short loop depending on the number of heterogeneous
> > >> 	 * CPU clusters. Typically on a homogeneous system there's only one
> > >> 	 * entry in the XArray.
> > >> 	 */
> > >> 	xa_for_each(&hetero_cpu, hetero_id, entry) {
> > >> 		/*
> > >> 		 * If max_smt_thread_num has been initialized and doesn't match
> > >> 		 * the thread number of this entry, then the system has
> > >> 		 * heterogeneous SMT topology.
> > >> 		 */
> > >> 		if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
> > >> 			pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
> > > 
> > > What does 'partly supported' mean here?
> > > 
> > > If the SMT control doesn't work as intended for this topology, I don't
> > > think it should be enabled for it.
> > > 
> > 
> > The /sys/devices/system/cpu/smt/control supports 2 kind of controls [1]
> > (a) enable/disable SMT entirely by writing on/off
> > (b) enable/disable SMT partially by writing a valid thread number (CONFIG_SMT_NUM_THREADS_DYNAMIC)
> > 
> > We assume 3 kind of SMT topology:
> > 1. homogeneous SMT topology, all the CPUs support SMT or not
> > 2.1 heterogeneous SMT topology, part of CPU clusters have SMT and others not. Clusters support SMT
> >     have the same SMT thread number
> > 2.2 heterogeneous SMT topology, part of CPU clusters have SMT and the thread number may differs
> >     (e.g. cluster 1 is of SMT 2 and cluster 2 is of SMT 4. not sure there's such a real system)
> > 
> > For any of above SMT topology, control (a) should work as expected. When enabling SMT by writing "on"
> > the SMT is disabled for those CPU clusters who have SMT. Same for disabling SMT by writing "off".
> > But control (b) may not work for case 2.2 since the SMT thread number is not the same across
> > the system.
> > 
> > For this series alone we won't met this since CONFIG_SMT_NUM_THREADS_DYNAMIC is not enabled.
> > So control (b) only supports write 1/max_thread which behaves same as write off/on and will
> > work as intended for all the 3 cases. As discussed Pierre will add support for
> >  CONFIG_SMT_NUM_THREADS_DYNAMIC since thunderX2 is a symmetric SMT4 machine and
> > CONFIG_SMT_NUM_THREADS_DYNAMIC would be useful. We thought a warning should be useful
> > if running on a system of case 2.2.
> 
> Thanks for explaining the situation.
> 
> So IIUC, for case 2.2 there will be _no_ failures if someone writes a
> value different from 1 or max_threads?
> 
> The SMT control code can handle that max_threads isn't the correct
> number of threads for all cores in the system?

Hello,

I suppose a number can be interpreted as 'up to this number'. If that's
what the user wanted is another question, on a hypothetical heterogenous
system with different number of threads in different CPUs it is
questionalble what this achieves.

Arguably once such system is found and the desired configurations
undestood this can be expanded to handle them.

Thanks

Michal

