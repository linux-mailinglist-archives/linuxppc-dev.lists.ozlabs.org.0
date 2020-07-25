Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D937022D9DD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 22:28:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDd1J2SLZzF1MD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 06:28:04 +1000 (AEST)
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
 header.s=casper.20170209 header.b=odRFRlgm; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDczR5NfCzF18f
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jul 2020 06:26:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7azmDqGQO5Za3wCk4hdbgBfXxhZiYOq/pNKw+FtLaYk=; b=odRFRlgmw5mlm1slXQblTZb2F9
 NzDpKGbskVYn6izccYMa3Q216cUxMpCQ5U9q6hAsYmvSiqWTBAZZG5ydgFk4Qz29kez2t1CKGrzpX
 muLvEbTcWk8SiWytSlcM8+XLBflgu7QHg21leMbKMPCYlFezg7wbRQvXfsB7s5sIkiYF90UT7GpwR
 Uf+pwpsheyLGPgtXnVL8a7D1zaCZx47rABRQS/QUu/bAihY5cDYFAtJKB6jaBhroCWrbaPtAMhIdT
 w4EiEdcNqCuoDUfPSR3IheQOcfuDSNlcxK8CACBuinQAcYAvT5dedokOROCwgU6jDlttyvttrGiko
 jmFXPzMA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzQkM-0001DS-Kr; Sat, 25 Jul 2020 20:26:19 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D61783013E5;
 Sat, 25 Jul 2020 22:26:17 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id BCF6C2143798C; Sat, 25 Jul 2020 22:26:17 +0200 (CEST)
Date: Sat, 25 Jul 2020 22:26:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] lockdep: improve current->(hard|soft)irqs_enabled
 synchronisation with actual irq state
Message-ID: <20200725202617.GI10769@hirez.programming.kicks-ass.net>
References: <20200723105615.1268126-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723105615.1268126-1-npiggin@gmail.com>
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
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 23, 2020 at 08:56:14PM +1000, Nicholas Piggin wrote:
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
> index 3a0db7b0b46e..35060be09073 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -200,17 +200,14 @@ static inline bool arch_irqs_disabled(void)
>  #define powerpc_local_irq_pmu_save(flags)			\
>  	 do {							\
>  		raw_local_irq_pmu_save(flags);			\
> -		trace_hardirqs_off();				\
> +		if (!raw_irqs_disabled_flags(flags))		\
> +			trace_hardirqs_off();			\
>  	} while(0)

So one problem with the above is something like this:

	raw_local_irq_save();
	<NMI>
	  powerpc_local_irq_pmu_save();

that would now no longer call into tracing/lockdep at all. As a
consequence, lockdep and tracing would show the NMI ran with IRQs
enabled, which is exceptionally weird..

Similar problem with:

	raw_local_irq_disable();
	local_irq_save()

Now, most architectures today seem to do what x86 also did:

	<NMI>
	  trace_hardirqs_off()
	  ...
	  if (irqs_unmasked(regs))
	    trace_hardirqs_on()
	</NMI>

Which is 'funny' when it interleaves like:

	local_irq_disable();
	...
	local_irq_enable()
	  trace_hardirqs_on();
	  <NMI/>
	  raw_local_irq_enable();

Because then it will undo the trace_hardirqs_on() we just did. With the
result that both tracing and lockdep will see a hardirqs-disable without
a matching enable, while the hardware state is enabled.

Which is exactly the state Alexey seems to have ran into.

Now, x86, and at least arm64 call nmi_enter() before
trace_hardirqs_off(), but AFAICT Power never did that, and that's part
of the problem. nmi_enter() does lockdep_off() and that _used_ to also
kill IRQ tracking.

Now, my patch changed that, it makes IRQ tracking not respect
lockdep_off(). And that exposed x86 (and everybody else :/) to the same
problem you have.

And this is why I made x86 look at software state in NMIs. Because then
it all works out. For bonus points, trace_hardirqs_*() also has some
do-it-once logic for tracing.



Anyway, it's Saturday evening, time for a beer. I'll stare at this more
later.
