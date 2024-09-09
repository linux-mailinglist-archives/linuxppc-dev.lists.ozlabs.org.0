Return-Path: <linuxppc-dev+bounces-1177-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EBD971630
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 13:05:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2PBd6fxbz2xrJ;
	Mon,  9 Sep 2024 21:05:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725874226;
	cv=none; b=oKmy/xJOpszxLevWbGzdVg+m+ccQ/M3PWg8FaBSo9j5PsyEbY+lqwXugAWasVQMuOK3kuDF6rEdqnET8SADSN2hwZQX4D3WFq9F+KRlChs1OuMO5LJMDb1/Ix0ZNjTidjuLVWbpIn5atJwfXV2WX05Upi4nC+DdkM69SA+lRl2xa11ex2RkebXcoOyubiMp0+cwfMRXVuf3v7fENSiLzj257ZQTNpA2EpvZxXgQQeurIBSkrfSNfwFraPu2tzKwUjhuFSJo+PPsbuspixFUlNmA0AKMX6UvkguuD7HbqexhvrpNq7uTEJgMQxROhdsVtXlJANT0H7TDZeILB7H6/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725874226; c=relaxed/relaxed;
	bh=f16Hum48X2/PRv+OYRnrqWvXhbLKUUXP4MBg4DPZdlQ=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=VdUjOTCvghMCL0mwTtd4wZzfa0CjkAD0wf01BSoveoyDMV/aLP3I+7q320iCwejBno6y+/aFi1+ImDNrEcnVsS9vTcygrkQSb3OzkBn5j6TcVs8VY6lY1V2/+uqsw4NIQWitLHPz3R5P9GsEzTLD4XTVsqHZ4zTPqKX1FI8oiHzyeT+lqfUHI2OXu7Tn4JIRARyCBjfRe79BNe1/PbE2+EnBAhQA/1QgWowii6P9B17robHpU+ZYlLKpCuFIVOhHt+dnFfIQu/EDRte9JSAfxc0JezqfMV3sOj3l+5XQ8aU56O02VdGtt8SR1aNACb7kUcOKDC8O3siC5sn909pSKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2M4r3bcyz2yDM
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 19:30:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f16Hum48X2/PRv+OYRnrqWvXhbLKUUXP4MBg4DPZdlQ=; b=PHcK1SUWaNK+mGL/l3LU81VEdD
	D9nBb1lF9fC+k5KduxINliKCuQNtwOV9r3VV7JhDFojWrMZqtjtzwsWQR7ymjqHMdZK4/Tzo1krQG
	l72L0TWbRaFKsNxIJEvL02K4akN/vihdxELVqTsQPMZh102jhI0PE6Yrqkpm+R5bTxUWvCjPykmtq
	WlbddJH0odsLTU/9pMOdxn+PkTNa49n7N5ZvM4UD0maObK3Zd9qj9kNJXbjqHQeNmT1JTuolvrtNi
	Vpta2pPXprvf8lrp/xLulCdRHeE9tzU/AQ/jRdr1yi09xwhjfkgynp4ly+k7LQoKGQqGefX9PFflQ
	rxIuTYAw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1snai3-0000000AlXL-0vBQ;
	Mon, 09 Sep 2024 09:29:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 80F5330047C; Mon,  9 Sep 2024 11:29:23 +0200 (CEST)
Date: Mon, 9 Sep 2024 11:29:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3 6/8] x86/module: perpare module loading for ROX
 allocations of text
Message-ID: <20240909092923.GB4723@noisy.programming.kicks-ass.net>
References: <20240909064730.3290724-1-rppt@kernel.org>
 <20240909064730.3290724-7-rppt@kernel.org>
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
In-Reply-To: <20240909064730.3290724-7-rppt@kernel.org>

On Mon, Sep 09, 2024 at 09:47:28AM +0300, Mike Rapoport wrote:
> diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> index 8da0e66ca22d..563d9a890ce2 100644
> --- a/arch/x86/kernel/ftrace.c
> +++ b/arch/x86/kernel/ftrace.c

> @@ -654,4 +656,15 @@ void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
>  }
>  #endif
>  
> +void ftrace_swap_func(void *a, void *b, int n)
> +{
> +	unsigned long t;
> +
> +	WARN_ON_ONCE(n != sizeof(t));
> +
> +	t = *((unsigned long *)a);
> +	text_poke_copy(a, b, sizeof(t));
> +	text_poke_copy(b, &t, sizeof(t));
> +}

This is insane, just force BUILDTIME_MCOUNT_SORT

