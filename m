Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2BC8A6579
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 09:53:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=fU/cNEu5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJbrf0t38z3vXy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 17:53:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=fU/cNEu5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJbqt2HQwz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 17:52:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=507ZBsLeuCe8QOYcleBeRL5NXt96hdJ7/5G0PziK1K0=; b=fU/cNEu5qw/O2Klf8s6HCr+ThI
	AhpI1nEs4Up9XFmJBI03cktnXOkGdoRbOvIZzjK48ok45c2JILgNd4BIrGYsKyEjDF0eQQL+HYJwR
	Yiyrnny32/na/Ys3afDWWVnk61J34su4s2sCj0Ub01AHgZcx+Fsp5j+qrF1A8v0sYzXZMlCD5kjBk
	s3viP3O4TygKJJxdljC/ZTymqUoM44K9+R+bQ//RVwqZYO5nBn5merN0aN+obc8V8nFi/A7z6wGAX
	iEjE6w/enUoiPeoQuWrQTmG1HLtwkxvfU1NO54vIH5bCDXvS5cudA99gRVmIMYwS4kC9jIInm3J/Z
	dg+Vrz+Q==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdcJ-0000000HZIl-1TGs;
	Tue, 16 Apr 2024 07:52:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0630E30040C; Tue, 16 Apr 2024 09:52:35 +0200 (CEST)
Date: Tue, 16 Apr 2024 09:52:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [RFC PATCH 6/7] execmem: add support for cache of large ROX pages
Message-ID: <20240416075234.GA31647@noisy.programming.kicks-ass.net>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-7-rppt@kernel.org>
 <20240415104750.GJ40213@noisy.programming.kicks-ass.net>
 <Zh1dKkFr6zdBh2Kz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zh1dKkFr6zdBh2Kz@kernel.org>
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

On Mon, Apr 15, 2024 at 08:00:26PM +0300, Mike Rapoport wrote:
> On Mon, Apr 15, 2024 at 12:47:50PM +0200, Peter Zijlstra wrote:
> > On Thu, Apr 11, 2024 at 07:05:25PM +0300, Mike Rapoport wrote:
> > 
> > > To populate the cache, a writable large page is allocated from vmalloc with
> > > VM_ALLOW_HUGE_VMAP, filled with invalid instructions and then remapped as
> > > ROX.
> > 
> > > +static void execmem_invalidate(void *ptr, size_t size, bool writable)
> > > +{
> > > +	if (execmem_info->invalidate)
> > > +		execmem_info->invalidate(ptr, size, writable);
> > > +	else
> > > +		memset(ptr, 0, size);
> > > +}
> > 
> > +static void execmem_invalidate(void *ptr, size_t size, bool writeable)
> > +{
> > +       /* fill memory with INT3 instructions */
> > +       if (writeable)
> > +               memset(ptr, 0xcc, size);
> > +       else
> > +               text_poke_set(ptr, 0xcc, size);
> > +}
> > 
> > Thing is, 0xcc (aka INT3_INSN_OPCODE) is not an invalid instruction.
> > It raises #BP not #UD.
> 
> Do you mean that _invalidate is a poor name choice or that it's necessary
> to use an instruction that raises #UD?

Poor naming, mostly. #BP handler will still scream bloody murder if the
site is otherwise unclaimed.

It just isn't an invalid instruction.
