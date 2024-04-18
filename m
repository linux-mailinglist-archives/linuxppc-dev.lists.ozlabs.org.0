Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 936D58A9736
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 12:22:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SELAoNeX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKv392hyWz3cVV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 20:22:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SELAoNeX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKv2S71Nfz3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 20:21:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E10D617AF;
	Thu, 18 Apr 2024 10:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE78C113CC;
	Thu, 18 Apr 2024 10:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713435694;
	bh=GIF39x+DoxCddvDNRomXCworfiQAca8ygUjDy3+kOkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SELAoNeXc3Beu0HbaRnXjo5QYZwKVoBtQiv3DGWKIGD1ByoQxYtKIRMmvzmqWXRIs
	 l28WXlrgf45drPhQ9fcY+C862qqlcZ84I3lISaD2oLaKCzcGbAykPBulJ9k6bwvlRz
	 LV8NaKjnWubu4ei2CwJbivkB4YEQEKSRsSyVzaW8Mxs5W6YReOjEi+EuEAD86bBnwS
	 qFPhIxsVlHHsOebyI08OR68Lghu75Srbh8a5UrbpGFwRlRYkMIVyzmMjHu+Dqlrqq9
	 fLqc6ctyg9Ep6vn3VgTN09QBUzcZ5AVisQI/jdvTkZRhUWxPwNNaW0QWW5GqKdhOFZ
	 JlWziN6p3qThQ==
Date: Thu, 18 Apr 2024 13:20:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Nadav Amit <nadav.amit@gmail.com>
Subject: Re: [RFC PATCH 3/7] module: prepare to handle ROX allocations for
 text
Message-ID: <ZiDz4YbIHEOAnpwF@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-4-rppt@kernel.org>
 <0C4B9C1A-97DE-4798-8256-158369AF42A4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0C4B9C1A-97DE-4798-8256-158369AF42A4@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@infradead.org>, linux-trace-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, linux-parisc@vger.kernel.org, "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masa
 mi Hiramatsu <mhiramat@kernel.org>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 16, 2024 at 12:36:08PM +0300, Nadav Amit wrote:
> 
> 
> > On 11 Apr 2024, at 19:05, Mike Rapoport <rppt@kernel.org> wrote:
> > 
> > @@ -2440,7 +2479,24 @@ static int post_relocation(struct module *mod, const struct load_info *info)
> > 	add_kallsyms(mod, info);
> > 
> > 	/* Arch-specific module finalizing. */
> > -	return module_finalize(info->hdr, info->sechdrs, mod);
> > +	ret = module_finalize(info->hdr, info->sechdrs, mod);
> > +	if (ret)
> > +		return ret;
> > +
> > +	for_each_mod_mem_type(type) {
> > +		struct module_memory *mem = &mod->mem[type];
> > +
> > +		if (mem->is_rox) {
> > +			if (!execmem_update_copy(mem->base, mem->rw_copy,
> > +						 mem->size))
> > +				return -ENOMEM;
> > +
> > +			vfree(mem->rw_copy);
> > +			mem->rw_copy = NULL;
> > +		}
> > +	}
> > +
> > +	return 0;
> > }
> 
> I might be missing something, but it seems a bit racy.
> 
> IIUC, module_finalize() calls alternatives_smp_module_add(). At this
> point, since you don’t hold the text_mutex, some might do text_poke(),
> e.g., by enabling/disabling static-key, and the update would be
> overwritten. No?

Right :(
Even worse, for UP case alternatives_smp_unlock() will "patch" still empty
area.

So I'm thinking about calling alternatives_smp_module_add() from an
additional callback after the execmem_update_copy().

Does it make sense to you?

-- 
Sincerely yours,
Mike.
