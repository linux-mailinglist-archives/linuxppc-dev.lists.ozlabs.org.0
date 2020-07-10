Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A591821B2AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 11:49:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B37Yb4m9YzDqjb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 19:49:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=br/6N3S/; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B37Wv43BWzDqXg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 19:48:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=w3kp1+jdf3bXyU6T7tLgS3NnoV3a3u51ChfZ8zM0K6Y=; b=br/6N3S/jhoP3JJtrayUvCy7E2
 /oRU43tMNdc0fhNyVDv7fH8+PstYkTFr08/wfrTrxhGC49B2ucWOnnRIlRuLDLPqDItmT26eTHVVT
 rKad4E6DtLTLe7r82xihXktEnX6M01WB8CtpTMKx0JkiRXLtOdgDsB46LJ2Um4Kwx0VPp7Sn4uFnj
 9peCcN+glsBEtOBgkQNs5SlFneyn96pQGzqF1XgyfYmbBC6yaqpGsgv4jn5/X3BVoAhe1YjIuxGN7
 +Ih7bvd7BtJLcLS+PaTsRy3yVa67fyYc9A2jpYSkiYQJx+S2batZv+RGXRz90Vxfyba40R2zVSQm8
 SQgM/Jpw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtpdR-0001ld-Ea; Fri, 10 Jul 2020 09:48:01 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id EAD99304E03;
 Fri, 10 Jul 2020 11:48:00 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D7BCF2B5130F2; Fri, 10 Jul 2020 11:48:00 +0200 (CEST)
Date: Fri, 10 Jul 2020 11:48:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 5/7] lazy tlb: introduce lazy mm refcount helper
 functions
Message-ID: <20200710094800.GA4800@hirez.programming.kicks-ass.net>
References: <20200710015646.2020871-1-npiggin@gmail.com>
 <20200710015646.2020871-6-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200710015646.2020871-6-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 10, 2020 at 11:56:44AM +1000, Nicholas Piggin wrote:

> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 73199470c265..ad95812d2a3f 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1253,7 +1253,7 @@ void start_secondary(void *unused)
>  	unsigned int cpu = smp_processor_id();
>  	struct cpumask *(*sibling_mask)(int) = cpu_sibling_mask;
>  
> -	mmgrab(&init_mm);
> +	mmgrab(&init_mm); /* XXX: where is the mmput for this? */
>  	current->active_mm = &init_mm;
>  
>  	smp_store_cpu_info(cpu);

Right; so IIRC it should be this one:

> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index 134688d79589..ff9fcbc4e76b 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -578,7 +578,7 @@ static int finish_cpu(unsigned int cpu)
>  	 */
>  	if (mm != &init_mm)
>  		idle->active_mm = &init_mm;
> -	mmdrop(mm);
> +	mmdrop_lazy_tlb(mm);
>  	return 0;
>  }

