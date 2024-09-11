Return-Path: <linuxppc-dev+bounces-1247-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51578974F9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 12:22:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3c805rj8z2xsH;
	Wed, 11 Sep 2024 20:22:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726050144;
	cv=none; b=Ko8D3I2CgtuonbH+101Bfuw/x2bV7mIFwWqIImhnMyUzj78B4KWlfy9UWrZBLIeSh54va5Sqo6iBxiUx/lTTEUQ0Pd1MeeYZR8hVNi1mbZlHOMY0PFtGFr3LLr1qdFdStBAoXNop4xQAISTGxiuX6kBaNOyP6iUEqsIJijqmuAodr3owPlTgYJxhYEqfZf0r9jGfew2CPrXDx7AH9Wo/v/jxl72OK9rZ++I6AqGbYJSo4kduU0SRsA7gMxpHnUV6xhZMLX+tPoK4NxA5YCCnuWTKSux8r12KPtBo8VGoDM8WgPvbSXtyV647pAEzATdrhe14Qn7cpvWbD7vWdskg8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726050144; c=relaxed/relaxed;
	bh=gilhAcdrA7pGmi/s85r2gM91YcnlghiT9xFnkSLLu+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=borMTb7M/wErtnHjk/OjvBBOupFeTjr0qdznFYTLjHd/qnrRSCIHkUReDN9+JTfGeYf4JiLuwmeU0SSY/UFJOuckDGPRLti7s4kDzxike4qldsDTDi13tI7xX91wmEZbeHnhJzHE0NBxwzcPlXuNrkDYeJMQd+7WTCJ+xwRAGYrqLmyIRNddkQq3clyCbas6JSc8/z+yDSi+gv2luou8gv71DXolh0hHSE+XifxxsUNLaeo4bxcjkvSt15yQwA0Cc0jnwft7o8++0PhxjvWnTJ6HvCysEbQ9kaRQTbz1BtzMHqkoXwtbO7oj33AQyMglf3U6aJy2oqTkOdMkhDcKWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MbotaJ9v; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MbotaJ9v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3c802Bpqz2xSM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 20:22:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C9715C0235;
	Wed, 11 Sep 2024 10:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6640EC4CEC5;
	Wed, 11 Sep 2024 10:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726050140;
	bh=8dWUooDoOxWC7Oca2MrJGx9YGMSeHFyGIMo9brZfk4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MbotaJ9vmctcoaZuCwWhMhi9fy5FIYS+b/HAYEruiQzbymZobfKvo47gbwbW+fy1t
	 kmLvVspCoENf4YJ7MG6qyNvTNAzqVaH95FS48N7vxf5HH4w5x9HqfrCJhhZOz0qSYT
	 FD4o6UXDBrwti0gG104xpdNn7cPukgyiIL3B2k9CSxzBbiHil9QxdJScuV7IplHt5W
	 o1J96IBLlfPsULekNIV4gsIz3YvGb3R5Lz6mZ8XITZx+iA0s8RnjfUTf8lq+EpquOb
	 tNbpjbzeeIR2Bev+q9SOEtahsme33D5y9Lo7KW1fhsL38m9Zfs1kaXRBBkfiBGmn1+
	 HGqEyFiCasPYg==
Date: Wed, 11 Sep 2024 13:19:07 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <ZuFumwtGQGOPMDo3@kernel.org>
References: <20240909064730.3290724-1-rppt@kernel.org>
 <20240909064730.3290724-7-rppt@kernel.org>
 <20240909092923.GB4723@noisy.programming.kicks-ass.net>
 <Zt8HiAzcaZS8lHT-@kernel.org>
 <20240909104940.71d8464c@gandalf.local.home>
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
In-Reply-To: <20240909104940.71d8464c@gandalf.local.home>

On Mon, Sep 09, 2024 at 10:49:40AM -0400, Steven Rostedt wrote:
> On Mon, 9 Sep 2024 17:34:48 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > > This is insane, just force BUILDTIME_MCOUNT_SORT  
> > 
> > The comment in ftrace.c says "... while mcount loc in modules can not be
> > sorted at build time"
> >  
> > I don't know enough about objtool, but I'd presume it's because the sorting
> > should happen after relocations, no?
> > 
> 
> IIRC, the sorting at build time uses scripts/sorttable.c, which from what I
> can tell, only gets called on vmlinux.

Regardless of the tool, the sorting should be done after relocation, no?

But isn't mcount loc is in data section? Then there should be no problem
just drop this patch
 
> -- Steve

-- 
Sincerely yours,
Mike.

