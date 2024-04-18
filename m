Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6058A9753
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 12:25:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r7r3HpYQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKv7L2gZpz3d2d
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 20:25:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r7r3HpYQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKv6f3w1Dz3brZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 20:25:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 60375617CE;
	Thu, 18 Apr 2024 10:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36123C113CC;
	Thu, 18 Apr 2024 10:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713435912;
	bh=YYR+dNmhH5n7QU2mxc3zizI6arTy/RTvZImlW/XQhPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r7r3HpYQ6nFiS0E8RoFspK8YNTCn1wvgAKmlggqCij/FXkbh7szpgdlp50MnvnkyP
	 lk96Jv8sQ1JdQGAURqqmqgYkF3mGapE5gySL9ZwhZHyzkL0O/RbIQf5t1nWm3gYpbq
	 uEpL9PSB2RTnOFLn1B9HaIE/diUnPoc6ZmU/M8wQ2SoiNmWWCQToS5x4OihQModqbL
	 wQp9NYpGP/8mk1FlFPEVNiGZQBNpmOaQ1CBof6I+gHZEt/zViTgmR/oZTmy5m+cXoj
	 Tt5QDTjkEbUg1MEvU+IXwpfYnYqHcejQQSHvHq4OyuZGU6Xkki5E+LhnslG0zaaCc7
	 s1wPnD7FtE6tA==
Date: Thu, 18 Apr 2024 13:23:55 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 6/7] execmem: add support for cache of large ROX pages
Message-ID: <ZiD0u3uz97ltnXJS@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-7-rppt@kernel.org>
 <20240415104750.GJ40213@noisy.programming.kicks-ass.net>
 <Zh1dKkFr6zdBh2Kz@kernel.org>
 <20240416075234.GA31647@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416075234.GA31647@noisy.programming.kicks-ass.net>
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

On Tue, Apr 16, 2024 at 09:52:34AM +0200, Peter Zijlstra wrote:
> On Mon, Apr 15, 2024 at 08:00:26PM +0300, Mike Rapoport wrote:
> > On Mon, Apr 15, 2024 at 12:47:50PM +0200, Peter Zijlstra wrote:
> > > On Thu, Apr 11, 2024 at 07:05:25PM +0300, Mike Rapoport wrote:
> > > 
> > > > To populate the cache, a writable large page is allocated from vmalloc with
> > > > VM_ALLOW_HUGE_VMAP, filled with invalid instructions and then remapped as
> > > > ROX.
> > > 
> > > > +static void execmem_invalidate(void *ptr, size_t size, bool writable)
> > > > +{
> > > > +	if (execmem_info->invalidate)
> > > > +		execmem_info->invalidate(ptr, size, writable);
> > > > +	else
> > > > +		memset(ptr, 0, size);
> > > > +}
> > > 
> > > +static void execmem_invalidate(void *ptr, size_t size, bool writeable)
> > > +{
> > > +       /* fill memory with INT3 instructions */
> > > +       if (writeable)
> > > +               memset(ptr, 0xcc, size);
> > > +       else
> > > +               text_poke_set(ptr, 0xcc, size);
> > > +}
> > > 
> > > Thing is, 0xcc (aka INT3_INSN_OPCODE) is not an invalid instruction.
> > > It raises #BP not #UD.
> > 
> > Do you mean that _invalidate is a poor name choice or that it's necessary
> > to use an instruction that raises #UD?
> 
> Poor naming, mostly. #BP handler will still scream bloody murder if the
> site is otherwise unclaimed.
> 
> It just isn't an invalid instruction.

Well, execmem_fill_with_insns_screaming_bloody_murder seems too long, how
about execmem_fill_trapping_insns?

-- 
Sincerely yours,
Mike.
