Return-Path: <linuxppc-dev+bounces-11551-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D922B3DD34
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 10:58:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFjTb0vVWz2ywv;
	Mon,  1 Sep 2025 18:58:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756717123;
	cv=none; b=Zr+s9TF6FiQG6pbMgVpTen97Y3B5/3x0t4C/niIKZU38Sz6wuAsvwQqOBnd3ykveeeaAIw5KpPl28s97aUXYTpdHW20jAUHWqJwZuK7DKvPfEZkpPbqrex2W2gk38u0Fuf83B51zec7Gxl6EakT4nVSw8zkuSn0uqeQl/NkmSJRw273yhigjHNGf7aJGKurgJR6QGrKWOiWxg36HH/IlUyqOWtRwY3gxFSis/+F61ImbJBR2rqwyQXF+v5zj43Ml6XbiTAk0oIya4Q8wU+6fGxH3onQvwmn01tO90CBf0TZP9o71dMrT/DNYTNczNSj+ii3r8Q0/DI85gf1Sya+Puw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756717123; c=relaxed/relaxed;
	bh=ELXcS4kuUmNY0mNJAeIrv8bpfUT+7O0FMeM9giGQ16Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikPgrnAbXFUVV1tweuz9NAntRyG0Dcmd4TVC4jtHS0x0XTG1q1dttIxgi+TNfYEFeZ5Dh2EDrU9T5t2ayAHGJW8CGzsicw3pTA9r3wmHZj+W5gB6BWVLf9xX1va5svZn/JnV0HV4TSInLsO0VDBcCu5tDdH7A4QgM4NLh6uHxOHmljJQ5cGaDg+/hUjm3GQ1zJ1Ls2ViDzx2HaAqjSvqJXB6bXFo2S9Zcy3tml0u2zU7htRy5XVCC3mPpk0mOUWIscUiylm+wEnzrDBpAMnyVuTYZZG0FUoEMRrJ8GWhC66nt9PI8M2x7n3hB8Ec+ali2eSOU6Q9sq/CiNT8lcMFZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UT+w+3il; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UT+w+3il;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFjTZ28Xhz2yhb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 18:58:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ELXcS4kuUmNY0mNJAeIrv8bpfUT+7O0FMeM9giGQ16Q=; b=UT+w+3ilhmZ+76H+urMqJ6Hsrd
	/xfgAuPhxfKGbWSVeTe/Aw9uUNWYzqaoq3v5yiHoutCJeSARcDUyYKAxGZM4CRG8zJwDS2Wqv01F/
	qWaQ6BipmwycC3OwpGnuVBMr3BlroIg1lki85OuJs1mgzdpi1lZrKQmrY9dgBy/L3fPySfABazIos
	1sbx5FtHVpXgG9gw7SXaUFg2XsFkqC3u1a9fHIuCXfyV2lqLj5zlj/d5eZkBXsuJBqBdNm9sO0XXX
	TKdrhTHXgKSbliK9avGEYM8DKpLOK6oAX/G7p9a0UwLXE0CsIcmvPDSpicBl/64VfEYH8GCc6Xy/J
	xHhUM9YQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0Mi-00000003gYr-0NpU;
	Mon, 01 Sep 2025 08:58:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 96847300342; Mon, 01 Sep 2025 10:58:15 +0200 (CEST)
Date: Mon, 1 Sep 2025 10:58:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
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
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
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
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v7 0/8] sched/fair: Get rid of sched_domains_curr_level
 hack for tl->cpumask()
Message-ID: <20250901085815.GE4067720@noisy.programming.kicks-ass.net>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <b64c820d-084a-40d9-bb4e-82986b9e6482@linux.ibm.com>
 <20250826101328.GV4067720@noisy.programming.kicks-ass.net>
 <xhsmh7bymlg2f.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <5ec9ca8a-9ba9-4600-a7a2-f7bd790fca83@linux.ibm.com>
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
In-Reply-To: <5ec9ca8a-9ba9-4600-a7a2-f7bd790fca83@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 29, 2025 at 02:23:06PM +0530, Shrikanth Hegde wrote:

> I was looking at: https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=sched/core
> 
> Current code doesn't allow one to enable/disable SCHED_MC on ppc since it is set always in kconfig.
> Used the below patch:
> 
> I think since the config is there, it would be good to provide a option to disable. no?

So current PPC code has this MC thing unconditional. I've been
preserving that behaviour. If PPC maintainers feel they want this
selectable, I'm happy to include something like the below, but as a
separate patch with a separate changelog that states this explicit
choice.

> ---
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index fc0d1c19f5a1..da5b2f8d3686 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -170,9 +170,8 @@ config PPC
>  	select ARCH_STACKWALK
>  	select ARCH_SUPPORTS_ATOMIC_RMW
>  	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx
> -	select ARCH_SUPPORTS_SCHED_SMT		if PPC64 && SMP
>  	select ARCH_SUPPORTS_SCHED_MC		if PPC64 && SMP
> -	select SCHED_MC				if ARCH_SUPPORTS_SCHED_MC
> +	select ARCH_SUPPORTS_SCHED_SMT		if PPC64 && SMP
>  	select ARCH_USE_BUILTIN_BSWAP
>  	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
>  	select ARCH_USE_MEMTEST
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 68edb66c2964..458ec5bd859e 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1706,10 +1706,12 @@ static void __init build_sched_topology(void)
>  			SDTL_INIT(tl_cache_mask, powerpc_shared_cache_flags, CACHE);
>  	}
> +#ifdef CONFIG_SCHED_MC
>  	if (has_coregroup_support()) {
>  		powerpc_topology[i++] =
>  			SDTL_INIT(tl_mc_mask, powerpc_shared_proc_flags, MC);
>  	}
> +#endif
>  	powerpc_topology[i++] = SDTL_INIT(tl_pkg_mask, powerpc_shared_proc_flags, PKG);
> 

