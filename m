Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1628A5865
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 19:02:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JQhmkrbx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJD4L4l27z3vXd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 03:02:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JQhmkrbx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJD3Y0krmz3bxZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 03:01:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8274560EE1;
	Mon, 15 Apr 2024 17:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14FBC32783;
	Mon, 15 Apr 2024 17:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713200500;
	bh=i8/bH2GflHHwL9Q6O831fT+UJyy/N/JxZRrEitYoDU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQhmkrbxlkokAIFsbHYvCZlDdyYFqLoERLQD9UjXNswKquLP0xtcV1u+YOoMVBYzN
	 Sb7LZUsXfhw2SSDicmJPXX6wJEySR7qXgqeF6WRCMsTmaxb6dTEEvdKVJ2QF8xV73M
	 zWVAeo2j5d2mIhRamGxbmxaN76CTvh0ZT5e287zxh62+7uCraDbeX1crXvejWzPawj
	 XA+nSfS1WF1QUSKZ+OwNWlmE2LS69a8cbAEH8Ow0G8h8jNNt9mOeOurVvGxQejJFIq
	 lJWV1cL3Cak0wByUAJkuz9CCwdQLw1/FNbKBb/4i5MFAWn2PKkhEyDcE8g7rJ9Kbjc
	 EpnrFltAXi4ng==
Date: Mon, 15 Apr 2024 20:00:26 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 6/7] execmem: add support for cache of large ROX pages
Message-ID: <Zh1dKkFr6zdBh2Kz@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-7-rppt@kernel.org>
 <20240415104750.GJ40213@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415104750.GJ40213@noisy.programming.kicks-ass.net>
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

On Mon, Apr 15, 2024 at 12:47:50PM +0200, Peter Zijlstra wrote:
> On Thu, Apr 11, 2024 at 07:05:25PM +0300, Mike Rapoport wrote:
> 
> > To populate the cache, a writable large page is allocated from vmalloc with
> > VM_ALLOW_HUGE_VMAP, filled with invalid instructions and then remapped as
> > ROX.
> 
> > +static void execmem_invalidate(void *ptr, size_t size, bool writable)
> > +{
> > +	if (execmem_info->invalidate)
> > +		execmem_info->invalidate(ptr, size, writable);
> > +	else
> > +		memset(ptr, 0, size);
> > +}
> 
> +static void execmem_invalidate(void *ptr, size_t size, bool writeable)
> +{
> +       /* fill memory with INT3 instructions */
> +       if (writeable)
> +               memset(ptr, 0xcc, size);
> +       else
> +               text_poke_set(ptr, 0xcc, size);
> +}
> 
> Thing is, 0xcc (aka INT3_INSN_OPCODE) is not an invalid instruction.
> It raises #BP not #UD.

Do you mean that _invalidate is a poor name choice or that it's necessary
to use an instruction that raises #UD?

-- 
Sincerely yours,
Mike.
