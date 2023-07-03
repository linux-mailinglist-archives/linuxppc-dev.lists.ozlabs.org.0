Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1003745E09
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:59:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=W8MiGSK6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvnbD4L2zz3c0T
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 23:59:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=W8MiGSK6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvnZK6PFpz30f9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 23:58:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/XBj/KASDZEwaINZN6zR62oMWEpcbbmzAAJb5oHzCeI=; b=W8MiGSK63K7sPBiin8aiix6wVO
	nHiTld2qumxTI7KLvLiwRcb6+D867gCT4fcfIrf2UUrOCFffjXpjVD2DolVTfso0nq3diFjiGDl7u
	I5R7gSTbdHSFUrmZXgVcKXmALtqvVzN9LEI4Lug2UX5PSrFU19UfvLyffICP0tjPS3Z263iCSCX8Q
	NG7pwby6B82QH/I9tyBuHDRRg52Dvqxu2PWPJE6HcnpfmsSfWKfnO9hjIskcCD2Vwy21zuqEGbyXI
	n52/HizMJdjIcYm/Lk/JIgxjXRuwiGvNZSsrmij1Tn9hr4h5xsz9/UA0pRH1DMprbqSBd5tjIh4q8
	Wxemefbg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qGK3e-00A60O-03;
	Mon, 03 Jul 2023 13:57:38 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4FC4E30012F;
	Mon,  3 Jul 2023 15:57:34 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 308802028FBD3; Mon,  3 Jul 2023 15:57:34 +0200 (CEST)
Date: Mon, 3 Jul 2023 15:57:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Yair Podemsky <ypodemsk@redhat.com>
Subject: Re: [PATCH v2 2/2] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to MM CPUs
Message-ID: <20230703135734.GK4253@hirez.programming.kicks-ass.net>
References: <20230620144618.125703-1-ypodemsk@redhat.com>
 <20230620144618.125703-3-ypodemsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620144618.125703-3-ypodemsk@redhat.com>
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
Cc: geert+renesas@glider.be, david@redhat.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, paulmck@kernel.org, x86@kernel.org, linux@armlinux.org.uk, ppandit@redhat.com, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, keescook@chromium.org, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, mtosatti@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 20, 2023 at 05:46:18PM +0300, Yair Podemsky wrote:
> @@ -191,7 +191,13 @@ static void tlb_remove_table_smp_sync(void *arg)
>  	/* Simply deliver the interrupt */
>  }
>  
> -void tlb_remove_table_sync_one(void)
> +#ifdef CONFIG_ARCH_HAS_CPUMASK_BITS
> +#define REMOVE_TABLE_IPI_MASK mm_cpumask(mm)
> +#else
> +#define REMOVE_TABLE_IPI_MASK cpu_online_mask
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

Aside from what Dave said about the REMOVE_TABLE_IPI_MASK thing, this
isn't right.

on_each_cpu_mask() includes the current cpu, while smp_call_function()
explicitly does not.

Yes, they all end up in smp_call_function_many_cond(), but the
on_each_cpu*() family will have SCF_RUN_LOCAL set, while the
smp_call_function*() family will not.
