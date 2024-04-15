Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5D08A4CC9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 12:44:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GwGuQ4aH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJ3h9011xz3fQR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 20:44:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GwGuQ4aH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJ3gP0YBhz3d3Q
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 20:43:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sHN9K6TMgi0EQGirMl9LJrLTL74puiAUj6pDWO1mbbg=; b=GwGuQ4aHjE28h3DMQEljrl12S9
	k7qbRgAehAWmB1KZsKYRkIe5T4YmQ/IK7K1/tscLIiWM+Frzf3BTbHghy00qu8vsdYndUrZk657/5
	7U6MObgQX8Hy2DTMmRYPlPtuplIcSQak3GNH/5HdZ6q2oAguSRJjpD+LaJ9a87To/HWlTYLJ9YvvV
	DlPdjGnZeeuN/uKeKILlCHLcOLy+D7L1I3Tkf+oPOF+MhpDr74c6GfylqnVH3luQcSx0xGQC7Rr+F
	/Pi5v1/cfv4gkg/y9fqk5azH4jFf+jsMj8+XJZsS62wcfAHMmEcUQTu5cq8eADVZRA0kd303q26id
	Ns2I29PA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJnx-0000000FWHZ-0CDf;
	Mon, 15 Apr 2024 10:43:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id ACBA530040C; Mon, 15 Apr 2024 12:43:16 +0200 (CEST)
Date: Mon, 15 Apr 2024 12:43:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [RFC PATCH 5/7] x86/module: perpare module loading for ROX
 allocations of text
Message-ID: <20240415104316.GI40213@noisy.programming.kicks-ass.net>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-6-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411160526.2093408-6-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@infradead.org>, linux-trace-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 11, 2024 at 07:05:24PM +0300, Mike Rapoport wrote:
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index 45a280f2161c..b4d6868df573 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c

> @@ -504,17 +513,17 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
>  		 *   patch if feature is *NOT* present.
>  		 */
>  		if (!boot_cpu_has(a->cpuid) == !(a->flags & ALT_FLAG_NOT)) {
> -			optimize_nops_inplace(instr, a->instrlen);
> +			optimize_nops_inplace(wr_instr, a->instrlen);
>  			continue;
>  		}
>  
> -		DPRINTK(ALT, "feat: %d*32+%d, old: (%pS (%px) len: %d), repl: (%px, len: %d) flags: 0x%x",
> +		DPRINTK(ALT, "feat: %d*32+%d, old: (%px (%px) len: %d), repl: (%px (%px), len: %d) flags: 0x%x",
>  			a->cpuid >> 5,
>  			a->cpuid & 0x1f,
> -			instr, instr, a->instrlen,
> -			replacement, a->replacementlen, a->flags);
> +			instr, wr_instr, a->instrlen,
> +			replacement, wr_replacement, a->replacementlen, a->flags);

I think this, and

>  
> -		memcpy(insn_buff, replacement, a->replacementlen);
> +		memcpy(insn_buff, wr_replacement, a->replacementlen);
>  		insn_buff_sz = a->replacementlen;
>  
>  		if (a->flags & ALT_FLAG_DIRECT_CALL) {
> @@ -528,11 +537,11 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
>  
>  		apply_relocation(insn_buff, a->instrlen, instr, replacement, a->replacementlen);
>  
> -		DUMP_BYTES(ALT, instr, a->instrlen, "%px:   old_insn: ", instr);
> +		DUMP_BYTES(ALT, wr_instr, a->instrlen, "%px:   old_insn: ", instr);

this, want to remain as is. 

>  		DUMP_BYTES(ALT, replacement, a->replacementlen, "%px:   rpl_insn: ", replacement);
>  		DUMP_BYTES(ALT, insn_buff, insn_buff_sz, "%px: final_insn: ", instr);
>  
> -		text_poke_early(instr, insn_buff, insn_buff_sz);
> +		text_poke_early(wr_instr, insn_buff, insn_buff_sz);
>  	}
>  
>  	kasan_enable_current();

The rationale being that we then print an address that can be correlated
to the kernel image (provided one either kills kaslr or adjusts for it).
