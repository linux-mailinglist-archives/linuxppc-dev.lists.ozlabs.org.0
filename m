Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5519F6D667D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 16:59:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrWBf1531z3fDL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 00:59:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=FmENSU8D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=FmENSU8D;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrW9m5ysdz30hh
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 00:58:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KBh4rzbfHfMkMMlE9cw+MqyUsj44Di5Ker7OlwFYGXg=; b=FmENSU8DdsJwRKLNIy11pT5rwr
	gZFbISKwxtxGEbpRDZI+PdPBb8ubt+23BYYSER2yHfUnSI2zgXRlA/A9liB6dhfL6rTy6LYIMRvQm
	gyR6cAIG2mB+TC5hkfYw1+vYNcbuY++BpvLFCCjlbeWJmHkcNxGqSYl+N/wcgrOkou9YFrZd67E9m
	w2uM4nUqUiAoo0Tu2WJytt+fQkxTpy55fgWCKZrUonHITpNDOnhhCxIBg+tWp3ViIM8YS9U4v2tUE
	9jirZfuWp7fZAvU8W0ipyUy++FGIYwgfKD5XO1ksJowLv7OYriDmtjptXbGAC0187adFlCZx+HUPA
	RAWV4RFA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pji6d-00FSN3-3U; Tue, 04 Apr 2023 14:57:55 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7720D30003A;
	Tue,  4 Apr 2023 16:57:51 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5C05626442AC2; Tue,  4 Apr 2023 16:57:51 +0200 (CEST)
Date: Tue, 4 Apr 2023 16:57:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Yair Podemsky <ypodemsk@redhat.com>
Subject: Re: [PATCH 2/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to MM CPUs
Message-ID: <20230404145751.GA297936@hirez.programming.kicks-ass.net>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-3-ypodemsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404134224.137038-3-ypodemsk@redhat.com>
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
Cc: geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, vschneid@redhat.com, gor@linux.ibm.com, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, keescook@chromium.org, paulmck@kernel.org, hca@linux.ibm.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, mtosatti@redhat.com, linux-kernel@vger.kernel.org, arnd@arndb.de, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 04, 2023 at 04:42:23PM +0300, Yair Podemsky wrote:
> diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
> index 2b93cf6ac9ae..5ea9be6fb87c 100644
> --- a/mm/mmu_gather.c
> +++ b/mm/mmu_gather.c
> @@ -191,7 +191,13 @@ static void tlb_remove_table_smp_sync(void *arg)
>  	/* Simply deliver the interrupt */
>  }
>  
> -void tlb_remove_table_sync_one(void)
> +#ifdef CONFIG_ARCH_HAS_CPUMASK_BITS
> +#define REMOVE_TABLE_IPI_MASK mm_cpumask(mm)
> +#else
> +#define REMOVE_TABLE_IPI_MASK NULL
> +#endif /* CONFIG_ARCH_HAS_CPUMASK_BITS */
> +
> +void tlb_remove_table_sync_one(struct mm_struct *mm)
>  {
>  	/*
>  	 * This isn't an RCU grace period and hence the page-tables cannot be
> @@ -200,7 +206,8 @@ void tlb_remove_table_sync_one(void)
>  	 * It is however sufficient for software page-table walkers that rely on
>  	 * IRQ disabling.
>  	 */
> -	smp_call_function(tlb_remove_table_smp_sync, NULL, 1);
> +	on_each_cpu_mask(REMOVE_TABLE_IPI_MASK, tlb_remove_table_smp_sync,
> +			NULL, true);
>  }

Uhh, I don't think NULL is a valid @mask argument. Should that not be
something like:

#ifdef CONFIG_ARCH_HAS_CPUMASK
#define REMOVE_TABLE_IPI_MASK mm_cpumask(mm)
#else
#define REMOVE_TABLE_IPI_MASK cpu_online_mask
#endif

	preempt_disable();
	on_each_cpu_mask(REMOVE_TABLE_IPI_MASK, tlb_remove_table_smp_sync, NULL true);
	preempt_enable();


?
