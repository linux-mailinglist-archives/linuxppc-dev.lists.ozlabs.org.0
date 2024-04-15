Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 908398A5891
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 19:06:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eA4Y4x6L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJD8c319Wz3dWv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 03:06:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eA4Y4x6L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJD7r4W57z3cCt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 03:05:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB0A760ECF;
	Mon, 15 Apr 2024 17:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EB7C2BD10;
	Mon, 15 Apr 2024 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713200726;
	bh=brTfnO2VyUJAmFmt0xYsxELn1GfIqBydjJY5MAA2GwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eA4Y4x6LpKDmJlhsFuCKUKDWszVPc0aMol9ibBC4zWuhXiukyHzmx+wctUQDy9YcO
	 SgrxzhBVYrKzoib5nD4pxj58Yru3AKozTZkN+TvcG/88RKgokKwWdJ7ot3KrqKc7Eq
	 DUMXngRm3Kt+F/W7nD5rsdsyrXI/SKwSE27eJw0RyuFsxXe2CY8Th13OWBhzodIeFI
	 g3IfMeClHVfNPTzOpcIibEz/rTBRU3MdIzMovL+lADX98nFVYDJgBcU0E0gUS/Sp3y
	 NkyrAJJ3bphAZ5D3Vr/0URqS2QdYx5P8qEukDaFoUJqWeYw/1mketQaU4aGKwRL5Ma
	 kNnuFlXqLWYaw==
Date: Mon, 15 Apr 2024 20:04:13 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 5/7] x86/module: perpare module loading for ROX
 allocations of text
Message-ID: <Zh1eDU1L1FbFwZzT@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-6-rppt@kernel.org>
 <20240415104316.GI40213@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415104316.GI40213@noisy.programming.kicks-ass.net>
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

On Mon, Apr 15, 2024 at 12:43:16PM +0200, Peter Zijlstra wrote:
> On Thu, Apr 11, 2024 at 07:05:24PM +0300, Mike Rapoport wrote:
> > diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> > index 45a280f2161c..b4d6868df573 100644
> > --- a/arch/x86/kernel/alternative.c
> > +++ b/arch/x86/kernel/alternative.c
> 
> > @@ -504,17 +513,17 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
> >  		 *   patch if feature is *NOT* present.
> >  		 */
> >  		if (!boot_cpu_has(a->cpuid) == !(a->flags & ALT_FLAG_NOT)) {
> > -			optimize_nops_inplace(instr, a->instrlen);
> > +			optimize_nops_inplace(wr_instr, a->instrlen);
> >  			continue;
> >  		}
> >  
> > -		DPRINTK(ALT, "feat: %d*32+%d, old: (%pS (%px) len: %d), repl: (%px, len: %d) flags: 0x%x",
> > +		DPRINTK(ALT, "feat: %d*32+%d, old: (%px (%px) len: %d), repl: (%px (%px), len: %d) flags: 0x%x",
> >  			a->cpuid >> 5,
> >  			a->cpuid & 0x1f,
> > -			instr, instr, a->instrlen,
> > -			replacement, a->replacementlen, a->flags);
> > +			instr, wr_instr, a->instrlen,
> > +			replacement, wr_replacement, a->replacementlen, a->flags);
> 
> I think this, and

I've found printing both address handy when I debugged it, but no strong
feelings here.
 
> >  
> > -		memcpy(insn_buff, replacement, a->replacementlen);
> > +		memcpy(insn_buff, wr_replacement, a->replacementlen);
> >  		insn_buff_sz = a->replacementlen;
> >  
> >  		if (a->flags & ALT_FLAG_DIRECT_CALL) {
> > @@ -528,11 +537,11 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
> >  
> >  		apply_relocation(insn_buff, a->instrlen, instr, replacement, a->replacementlen);
> >  
> > -		DUMP_BYTES(ALT, instr, a->instrlen, "%px:   old_insn: ", instr);
> > +		DUMP_BYTES(ALT, wr_instr, a->instrlen, "%px:   old_insn: ", instr);
> 
> this, want to remain as is. 

here wr_instr is the buffer to dump:

DUMP_BYTES(type, buf, len, fmt, args...)

rather than an address, which remained 'instr'.
 
> >  		DUMP_BYTES(ALT, replacement, a->replacementlen, "%px:   rpl_insn: ", replacement);
> >  		DUMP_BYTES(ALT, insn_buff, insn_buff_sz, "%px: final_insn: ", instr);
> >  
> > -		text_poke_early(instr, insn_buff, insn_buff_sz);
> > +		text_poke_early(wr_instr, insn_buff, insn_buff_sz);
> >  	}
> >  
> >  	kasan_enable_current();
> 
> The rationale being that we then print an address that can be correlated
> to the kernel image (provided one either kills kaslr or adjusts for it).

-- 
Sincerely yours,
Mike.
