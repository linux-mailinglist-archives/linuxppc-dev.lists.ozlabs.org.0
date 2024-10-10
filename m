Return-Path: <linuxppc-dev+bounces-1965-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 332B599824E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 11:33:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPPhD5lGWz3blg;
	Thu, 10 Oct 2024 20:33:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728552812;
	cv=none; b=C17EoNV9bdIffazf6QptRr0Xun+3WSxCU9wme159+Wf1xb+HmKa1OO9E35USM8UJgHvozLFN2NUw/KV6AfHZ/Yp4ViwVnDFzOkG77t/Qzk6hSwWIkYbyTz97LoDPpsQ5c70BV/0sVpEoChehPr2qaEd3P6aQahqKyZBGea/kgTF/yGNnw2BhIhmHoD/fEHJ05N6d9SgotPphz/V/FXkAd6qUKMKYh+m2Ff6CFaE/Jr1I/O/d08lILCsa8rSF/aZdYdNuMpa8jYKZOqWg+kt9AzLbqlhWgvWEPxkDHJS5fNPk0F2LUfMTHzHAi1kfilUbC9rOgwwo5VJzHRP5HkBO+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728552812; c=relaxed/relaxed;
	bh=GAyGpq2ToVprQTiU0GHlGT9QpKdbqvtvC7vVE+iJ9ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bi5yvZSN4sZQZqY4raTqXtp7v1NRQxgCJaoFN/0gg+9QoSHYw3bpIYdTMPgPIn2lugWEXTOIo8zMzaixkSP1NxwKSE2vzEA8ddQGeW/smmoiEBIOPFB5jrjvkPDjh4jC3kPmGf4icY0pwHxlljHL5SpmLragXwyZlLg8giGfnMvmdBTn3oZCjb6Cy2Mbn0XR4YJNwLC6+ER0UCCWOz+V9/KtqarsqKoCqkvlsLshVUIGhNBIWV+VMV62tmB/6TdW2oeWnYK0o00+vgRXgwSsmTnDZiOlOrXS8LqzY8BsnXf985vf6AFAgaul7GR56WRHNy7ExAFqLllbuvykhP4Luw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TOVNNKtr; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TOVNNKtr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPPhC2dpsz3bld
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 20:33:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3129CA43782;
	Thu, 10 Oct 2024 09:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18111C4CEC5;
	Thu, 10 Oct 2024 09:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728552807;
	bh=IHjj8Pm1cvim8ImsaUaQl0ADY0QKS9kDKJZxcyI9510=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TOVNNKtrf8daQuuMacjY7pAlRlt/k4vb7wjQCQYF0aVuw/4MxtY1IEDmecYy869WA
	 eL70bjSLCWzeSg87onzBIfUU+BSv9+MhwYkC/eIJ924jg8Lyc5Ubk1r7GreDoZptDJ
	 teVpdajxre4MsBPJA9mql4sRA7irY3J0uloNZaSVW+zDmxt4CzZVh6D1UOnW7YD45l
	 /XMlYCHBMS9YgkvBhtdnENr2FDWIvohUoNzgrqIpRpXIOWraQQuc8IrP9OJlfmnsWJ
	 /Y7TcehyVVbI3ky02lFC2Bu9TlmKaTridXnO8cdxvFKPK24cuDB2/RZZ9PsqYrxZV2
	 Py4W9D9Jti/XA==
Date: Thu, 10 Oct 2024 12:29:39 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
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
Message-ID: <Zweeg3oc-zrrG_D9@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-8-rppt@kernel.org>
 <20241009132427.5c94fb5942bae3832446bca5@linux-foundation.org>
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
In-Reply-To: <20241009132427.5c94fb5942bae3832446bca5@linux-foundation.org>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 09, 2024 at 01:24:27PM -0700, Andrew Morton wrote:
> On Wed,  9 Oct 2024 21:08:15 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > Using large pages to map text areas reduces iTLB pressure and improves
> > performance.
> 
> Are there any measurable performance improvements?

I don't have any numbers, I just followed the common sense of "less TLB
entries is better" and relied on Thomas comments from previous discussions.
 
> What are the effects of this series upon overall memory consumption?
 
There will be some execmem cache fragmentation and an increase in memory
consumption. It depends on the actual modules loaded and how large it the
fragmentation.

For a set of pretty randomly chosen modules where most come from
net/netfilter I see an increase from 19M to 25M.

> The lack of acks is a bit surprising for a v5 patch, but I'll add all
> this to mm.git for some testing, thanks.
> 

-- 
Sincerely yours,
Mike.

