Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DA222DED8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 14:01:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BF1kc0BJwzDrg1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 22:01:44 +1000 (AEST)
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
 header.s=casper.20170209 header.b=ismlg70E; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BF1hY5BD2zDq61
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jul 2020 21:59:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3Ulcv+XYXDsbe/gQ1QFaymA76fUaf73Ogbakhyf58ME=; b=ismlg70EGIrI2GcxeAyrDWqIpb
 ERntESs/K7v8oLSLDAyAEvckbFbKb5gDNBysO72uyFZ8Iv9LllqLYbcQq7cYbMNeZdfgEeofsaEr0
 dOMiZHBiYdzAXlTvErQKqCJLbaJAYj42ZODd6CzzYbBFv1kovJA8FMzXYXQ9RdAh7is1fK6Tj8WYz
 gIWoY29VXIgaLtBs88qi1Dn1cJYY6dLu93ubtTpChQWEwu7+zMp2SHol91o/Op4GE2ng0AvfW4ozw
 csLZIUPXqGeS6rK4DmgbMKFKvLwqTQIBR6PCvlLCMET4DGwcyC6C4zs8Id+3T+qrwgXJEv98xYrLZ
 nFHyab/g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzfJj-0006ih-6B; Sun, 26 Jul 2020 11:59:47 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E7704304D58;
 Sun, 26 Jul 2020 13:59:44 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 33A6D284D5CC2; Sun, 26 Jul 2020 13:59:44 +0200 (CEST)
Date: Sun, 26 Jul 2020 13:59:44 +0200
From: peterz@infradead.org
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] lockdep: improve current->(hard|soft)irqs_enabled
 synchronisation with actual irq state
Message-ID: <20200726115944.GB119549@hirez.programming.kicks-ass.net>
References: <20200723105615.1268126-1-npiggin@gmail.com>
 <20200725202617.GI10769@hirez.programming.kicks-ass.net>
 <1595735694.b784cvipam.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595735694.b784cvipam.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 26, 2020 at 02:14:34PM +1000, Nicholas Piggin wrote:
> > Now, x86, and at least arm64 call nmi_enter() before
> > trace_hardirqs_off(), but AFAICT Power never did that, and that's part
> > of the problem. nmi_enter() does lockdep_off() and that _used_ to also
> > kill IRQ tracking.
> 
> Power does do nmi_enter -- __perf_event_interrupt()
> 
>         nmi = perf_intr_is_nmi(regs);
>         if (nmi)
>                 nmi_enter();
>         else
>                 irq_enter();

That's _waaaay_ too late, you've done the trace_hardirqs_{off,on} in
arch/powerpc/kernel/exceptions-64e.S, you need to _first_ do nmi_enter()
and _then_ trace_hardirqs_off(), or rather, that's still broken, but
then we get into the details of entry ordering.


