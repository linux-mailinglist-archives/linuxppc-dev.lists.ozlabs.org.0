Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E98C87199D7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 12:32:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX2WY4633z3dxn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 20:32:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=j5qEB66O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=j5qEB66O;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX2Vd709Nz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 20:31:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eO/OU9rxkp8hXKcShXmqMYIGO9NNy/sl1o++FVK8OV8=; b=j5qEB66OyejLhukROTeex8RZO2
	8KI1zzfHFM0FSLCqza9uhEVgX/c6zEyu5qHGxX7CJjO0P8cMHhiatrGDyBr1rwPhvt1GBzYI3w9hK
	7k0I9xbsAZWFem/1PDEo2VNDt00sI8oyAzzTxJA4uo4MvXyvrVy0amUmV0Fe6tnUgHehB/WpCQHa0
	E82Y4vUZviXiJKDYelnzUm/Nrm/arC8TppikUDhcTNAzuZOH6BUuoSoQ5fKrxoZnJc+dZbGtWiKRX
	XlzWY1ePr9L+jMWFfjfVYehLflBFoPhhFwj8zZHz6jYQh5Ua/7Uf898zVO4+XMxyKyYJVXo3IJNI+
	6+NetZlw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q4fa1-008HDp-EN; Thu, 01 Jun 2023 10:30:53 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3A54F30031F;
	Thu,  1 Jun 2023 12:30:51 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0D9D021484ABB; Thu,  1 Jun 2023 12:30:51 +0200 (CEST)
Date: Thu, 1 Jun 2023 12:30:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 12/13] x86/jitalloc: prepare to allocate exectuatble
 memory as ROX
Message-ID: <20230601103050.GT4253@hirez.programming.kicks-ass.net>
References: <20230601101257.530867-1-rppt@kernel.org>
 <20230601101257.530867-13-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601101257.530867-13-rppt@kernel.org>
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozla
 bs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 01, 2023 at 01:12:56PM +0300, Mike Rapoport wrote:

> +static void __init_or_module do_text_poke(void *addr, const void *opcode, size_t len)
> +{
> +	if (system_state < SYSTEM_RUNNING) {
> +		text_poke_early(addr, opcode, len);
> +	} else {
> +		mutex_lock(&text_mutex);
> +		text_poke(addr, opcode, len);
> +		mutex_unlock(&text_mutex);
> +	}
> +}

So I don't much like do_text_poke(); why?

> diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> index aa99536b824c..d50595f2c1a6 100644
> --- a/arch/x86/kernel/ftrace.c
> +++ b/arch/x86/kernel/ftrace.c
> @@ -118,10 +118,13 @@ ftrace_modify_code_direct(unsigned long ip, const char *old_code,
>  		return ret;
>  
>  	/* replace the text with the new text */
> -	if (ftrace_poke_late)
> +	if (ftrace_poke_late) {
>  		text_poke_queue((void *)ip, new_code, MCOUNT_INSN_SIZE, NULL);
> -	else
> -		text_poke_early((void *)ip, new_code, MCOUNT_INSN_SIZE);
> +	} else {
> +		mutex_lock(&text_mutex);
> +		text_poke((void *)ip, new_code, MCOUNT_INSN_SIZE);
> +		mutex_unlock(&text_mutex);
> +	}
>  	return 0;
>  }

And in the above case it's actively wrong for loosing the _queue()
thing.
