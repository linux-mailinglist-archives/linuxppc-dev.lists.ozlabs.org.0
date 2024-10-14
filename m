Return-Path: <linuxppc-dev+bounces-2242-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA6999D71E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 21:16:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS6R03ZBPz2yZ4;
	Tue, 15 Oct 2024 06:16:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728933388;
	cv=none; b=cG0dwZIkHmaMW6N4PGFSPMpgYnVcYg9I54orSFIuRK8/yRrzN9PkL7MyEK+XPUmg7Pte/ZSOEvQQHwoPiQIhci55eaBNDPOupRjnd6BO4UheUTU3CUcegvGahWra0cNRX2FEp+CRBg3nrhz9/JUTXfYo4jf5RpMjoCqTQR8RvjT1+UefGGvLiLXUVp2O9gbPEnU+jpw7e5ZjQCTgZWh5OTvUhgMRrII8wPdsJhJO6os1RuFl37CK0y8ezl0t/VY8qN+Av9mEOM8iHsi7NjU+oANRx/+o7pvwPvQEKIqX1nO0p8FRxcOtW5gG0uuN75Iowpa+LYOLtQYVinWm51SjUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728933388; c=relaxed/relaxed;
	bh=Qj93O1JIO0dJGWm+S+jc//U0Xrz7rDNTjeJUxiHmdlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHVHtt2aPBthpzIyZSXrw29kaC1/Y3rt15aCICJRFj3UVMHjlY9AXQUeOuGhuEX5DyV/nC/ijrjo3DdRxjk9zdRu30PVehSzOXKbfPfysVGsNjbi1zUshPHuUQcPviP9hZWYeHOovYHZlwccXJycyIiv5+TZaaW6q56yycQOip07gDXw8Tg3OlN5NMXzRGNo3J6PlgY5Z3nvIhXWj2bMOXtdv2BvPMstJ6+ZpXh7Mvw7hxul/vn4s8hAav2iVhebvrjY/YT9VmHDPZjJVOKZpEqi1G7v2ySjQw3udlyqzSJF4ztnbLBVGV9jK+9lguJR6Mo2pdA3cUcDMQU80B5MPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EjG/5WZA; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EjG/5WZA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS6Qz1HsPz2yRC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 06:16:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E184A4271A;
	Mon, 14 Oct 2024 19:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC60C4CEC3;
	Mon, 14 Oct 2024 19:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728933383;
	bh=UuppSLaM0kOzMrDSh2RloHR9IgCcKKb57FBSLEkEUWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EjG/5WZADaXhvwARHnqKg67eiuXX7gTWxPoitBNELLTxxDNviuMSsmlu/en6P6ED8
	 zpJ52uHjqiz/g2IcIGwuziTngHnAXDzicRERzVAAIDP4l2L6y33KAuyIagMcpMXzl4
	 9dBRK2tjgLlrX3Ons9R5vBST3i3yiewblKFLfAI64WB5+23Fn5KkJljDLeTWRKDZ84
	 jnexNcW9vYFK3px9crwCiVYgH/8ctiyb/DdHjxU96pqWdOL1lwHrwqpz6qzLtvvsU8
	 7pmIeyrMmskmV1mcXKss65BVVX6VBxafQdYx2gdNsA2KwzhcBEiTj2VcG0YSmjPMmN
	 oCmkdGtrERExg==
Date: Mon, 14 Oct 2024 12:16:20 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Mike Rapoport <rppt@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
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
Subject: Re: [PATCH v5 7/8] execmem: add support for cache of large ROX pages
Message-ID: <Zw1uBBcG-jAgxF_t@bombadil.infradead.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-8-rppt@kernel.org>
 <Zwd7GRyBtCwiAv1v@infradead.org>
 <ZwfPPZrxHzQgYfx7@kernel.org>
 <ZwjXz0dz-RldVNx0@infradead.org>
 <ZwuIPZkjX0CfzhjS@kernel.org>
 <20241013202626.81f430a16750af0d2f40d683@linux-foundation.org>
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
In-Reply-To: <20241013202626.81f430a16750af0d2f40d683@linux-foundation.org>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Oct 13, 2024 at 08:26:26PM -0700, Andrew Morton wrote:
> On Sun, 13 Oct 2024 11:43:41 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > > > The idea is to keep everything together and have execmem_info describe all
> > > > that architecture needs. 
> > > 
> > > But why?  That's pretty different from our normal style of arch hooks,
> > > and introduces an indirect call in a security sensitive area.
> > 
> > Will change to __weak hook. 
> > 
> 
> Thanks, I'll drop the v1 series;
> 
> The todos which I collected are:
> 
> https://lkml.kernel.org/r/CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com
> https://lkml.kernel.org/r/Zwd6vH0rz0PVedLI@infradead.org
> https://lkml.kernel.org/r/ZwjXz0dz-RldVNx0@infradead.org
> https://lkml.kernel.org/r/202410111408.8fe6f604-lkp@intel.com

BTW Andrew I'd like to pick this up through the modules tree, and while
at it, also beat it up with some more testing as we're expanding also
with the modversions stuff for Rust modules.

  Luis

