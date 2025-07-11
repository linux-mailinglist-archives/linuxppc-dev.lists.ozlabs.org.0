Return-Path: <linuxppc-dev+bounces-10190-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A326DB01BEE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jul 2025 14:26:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bdrY20gjBz2y92;
	Fri, 11 Jul 2025 22:26:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752236774;
	cv=none; b=YekSS2HYzjqdhg8YZk7hMUhTSYA+3OR3ggP1WO+AKmMgKQJ0k9oq9BW43zP+hhkf0S42fD4h7cvv5JKc+Gneq5D3IwjxOPX48/ad1GykQTcppOpPCpjGU7K5mbRG9KsQzoXnqQsRffFL28zn8Rh3+fYA3Rk79pDNsyNKZy+U8CU+3Clc1JYYF/kx4CQn7oXpIG95+VTw1xcWlPscVPkCFl007Zty3ORvDf9Ps+7hclFw7gyO8r8SR+szsXUwEL5VjBk+XHNR1rQGNDCeDCIfiRJ1POOdk6EeWy3RsAlqduGt0ZDo/9LRvAllVsPK0iiWiDDvtEJ7iJ6LYYAQ5B4uLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752236774; c=relaxed/relaxed;
	bh=vGjGW/PtJqBFBruMN5J6ADYZtMINuph/UDezRVBHu1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3UCFqnKTFyEJonpDjnomNXtpHAB//c242aBf1GxAljjSfP2pxIXgFtUjQ4fI905JfyuWWAwSQcywd/y5Vrd6DuoTfheGa770bAyEzzEHBnZtzBR9MDCOFVQTrL6YUq9EKU/cOMVT+eevPzOFZWqZGcuy9nz6pt0Vmt9YROeMgaAXn8ApnNA391YrXtLjasyNa+nGd8J45OPre9OqWPV+a5f4Pueg4jdw+M6Vado3kfPUHDTsXy16O8zAx6TjEWM2EjLc1apHM0sUSZAWye+pfQ+PLCQrr1RSLaZl+vpjnlNMEzCfWV7ap//zjBp8jKOLMOXRh84tvH2zad3Y3B01A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=PaExWWTu; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=PaExWWTu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdrXw68NCz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jul 2025 22:26:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vGjGW/PtJqBFBruMN5J6ADYZtMINuph/UDezRVBHu1Y=; b=PaExWWTu6LCWc//YsZkBXUY3qB
	OhRcnm1raovoM5kv8uOVijsT/tUZyQM82IAAMgZVZWwPht3FD0gePK+so8z+iLW5V24Sdat5Yx2mU
	+vGUD2xwNKHxG9MoCvV+hUYL+u45hQBujCuTkz7HQwlB0T98xHl0AY+LGI63i+tP2F7HC2zX7xaCF
	8cv44QWL96iNFXy2QjuzOul6m/GtUhM6S1KJV6cGHv4ATQWy5EmxxvIhYPUdyMMF5b/vbp6wreTi7
	0p5woQ/tOGYzNNZUH0pMdgOC4iR4GlDpuNSpg7JM6Lb6wUh3lWAfmOV9IM4l0c0aRDZZhXTkigVnR
	lnzUcaSg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCoj-00000009G4q-1Htk;
	Fri, 11 Jul 2025 12:25:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 489EA3001AA; Fri, 11 Jul 2025 14:25:28 +0200 (CEST)
Date: Fri, 11 Jul 2025 14:25:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Li Chen <me@linux.beauty>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
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
	Thomas Wei??schuh <thomas.weissschuh@linutronix.de>,
	Li Chen <chenl311@chinatelecom.cn>,
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
	Tobias Huschle <huschle@linux.ibm.com>,
	Mete Durlu <meted@linux.ibm.com>,
	Joel Granados <joel.granados@kernel.org>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v5 1/4] smpboot: introduce SDTL_INIT() helper to tidy
 sched topology setup
Message-ID: <20250711122528.GB905792@noisy.programming.kicks-ass.net>
References: <20250710105715.66594-1-me@linux.beauty>
 <20250710105715.66594-2-me@linux.beauty>
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
In-Reply-To: <20250710105715.66594-2-me@linux.beauty>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jul 10, 2025 at 06:57:07PM +0800, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> Define a small SDTL_INIT(maskfn, flagsfn, name) macro and use it to build the
> sched_domain_topology_level array. Purely a cleanup; behaviour is unchanged.
> 
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>  arch/powerpc/kernel/smp.c      | 34 +++++++++++++---------------------
>  arch/s390/kernel/topology.c    | 10 +++++-----
>  arch/x86/kernel/smpboot.c      | 21 ++++++---------------
>  include/linux/sched/topology.h |  4 ++--
>  kernel/sched/topology.c        | 24 ++++++++----------------
>  5 files changed, 34 insertions(+), 59 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 5ac7084eebc0b..0b7ab7d2eb142 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1700,28 +1700,20 @@ static void __init build_sched_topology(void)
>  #ifdef CONFIG_SCHED_SMT
>  	if (has_big_cores) {
>  		pr_info("Big cores detected but using small core scheduling\n");
> -		powerpc_topology[i++] = (struct sched_domain_topology_level){
> -			smallcore_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT)
> -		};
> -	} else {
> -		powerpc_topology[i++] = (struct sched_domain_topology_level){
> -			cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT)
> -		};
> -	}
> +		powerpc_topology[i++] =
> +			SDTL_INIT(smallcore_smt_mask, powerpc_smt_flags, SMT);
> +	} else
> +		powerpc_topology[i++] = SDTL_INIT(cpu_smt_mask, powerpc_smt_flags, SMT);
>  #endif
> -	if (shared_caches) {
> -		powerpc_topology[i++] = (struct sched_domain_topology_level){
> -			shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE)
> -		};
> -	}
> -	if (has_coregroup_support()) {
> -		powerpc_topology[i++] = (struct sched_domain_topology_level){
> -			cpu_mc_mask, powerpc_shared_proc_flags, SD_INIT_NAME(MC)
> -		};
> -	}
> -	powerpc_topology[i++] = (struct sched_domain_topology_level){
> -		cpu_cpu_mask, powerpc_shared_proc_flags, SD_INIT_NAME(PKG)
> -	};
> +	if (shared_caches)
> +		powerpc_topology[i++] =
> +			SDTL_INIT(shared_cache_mask, powerpc_shared_cache_flags, CACHE);
> +
> +	if (has_coregroup_support())
> +		powerpc_topology[i++] =
> +			SDTL_INIT(cpu_mc_mask, powerpc_shared_proc_flags, MC);
> +
> +	powerpc_topology[i++] = SDTL_INIT(cpu_cpu_mask, powerpc_shared_proc_flags, PKG);

You wrecked coding-style here and lost a bunch of curlies. I've fixed
that up for you.

