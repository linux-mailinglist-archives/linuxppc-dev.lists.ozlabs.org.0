Return-Path: <linuxppc-dev+bounces-1184-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C27DA971CC7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 16:38:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2Tvr3kgJz2xGH;
	Tue, 10 Sep 2024 00:38:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725892680;
	cv=none; b=eRa/5i9x4eVD5Pz2z/D9rKO93PRCH6a1n27MPOjm7WBx2Sx2ZbvJ0KuPFXQYO2h+CRcnZNaNXygQnXKHSMVc/zdx3rqTaZlqKqbAK02pgE8h7WzpV8e0RCJuFQ5ekO2Mhz1xjAZIMOeVMfxf6UGqTQjr1evjUTlM3ZZVJ087rZOKddsUyEALDrTxNm18YHydAw0GnlH1S/Ur+y8+it549Wqnop4EfeWlnIx8xFTACGjf7RNdwkA4p8m1SfJ/78jAJsC2vO3yQNLfARkv7e5dnPW+PBEilzW8p4/xvEL7qmaReTZ8eXmFuLqDyO8h5d1XIso/WRQyEp/fFzTJmxPypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725892680; c=relaxed/relaxed;
	bh=fx5Q5wGHfaPcGQNBhBxzKuDh4bmf133p6Qs6k52Plj8=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=V9VhvtbfI5WLWHtDWv33djOrJAcZrhBWewTfmi9vqEQIbGBLfy9/pMX2p1Rcg49q/25256bsQDPmmr5dhjXqoQCcsB8aM5ZBPqd2rhtxWohFSbgeCM8ahdcRLOZxkhUrZ7WnJ7Qj6XGFx5WiEgGPxrP/vB6lkolKvSbDT3/jr9VfE7ySDvOqEZP8mPh5qJkAbI1eHrKq2/5/x5nCjdAEllfdBTSGupe0UO2kX6Z2qHKKRUeqYu/Bzfeu90xU4adKGkIJRPvD3Hjvff0MC7LtUWoRoZRW1pw7QBbcB4eoLrwsLr3kv7Htqb/jhdpK+ZhY3eXnD2yxWamFD9mTXzTjBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fs6Al/RP; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fs6Al/RP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2Tvr0rxjz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 00:38:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A79975C01BF;
	Mon,  9 Sep 2024 14:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA38C4CEC5;
	Mon,  9 Sep 2024 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725892676;
	bh=MghDFbPAU9zqqkhW3Xw5vWmg1dmDiUK7SCkrMyPD7PA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fs6Al/RPqqDYAd+lPeXebcBiEsV8ZcvYqHnhgbekPtDgt19OlBHjiP9gQSdGe9afm
	 E6dAjll1IYePf87BqvuUHZojSOISa9K5xqnGdYsjKjKAxmrH58TOhb7yDaJfDepFBa
	 KmFe19pfYgaP0P6SOasN93vKsvEqQdqzY5UZFrT5OYDRUwY9bZOJ0yO3EIutfG5ADs
	 9/aQXVlZzbQSnDoIg63nYDc2lsJ+5/3DsjcdPHAdeypnZ/+PEaSwQCoG2ocV6cZ8IN
	 5SSH1gwzGe/PyYVHsa/teqwYFCWwEBH8MNluTcSCH96QK9eENqGcAFK+i9m860tlOX
	 EjTv1+plHkaMQ==
Date: Mon, 9 Sep 2024 17:34:48 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <Zt8HiAzcaZS8lHT-@kernel.org>
References: <20240909064730.3290724-1-rppt@kernel.org>
 <20240909064730.3290724-7-rppt@kernel.org>
 <20240909092923.GB4723@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20240909092923.GB4723@noisy.programming.kicks-ass.net>

On Mon, Sep 09, 2024 at 11:29:23AM +0200, Peter Zijlstra wrote:
> On Mon, Sep 09, 2024 at 09:47:28AM +0300, Mike Rapoport wrote:
> > diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> > index 8da0e66ca22d..563d9a890ce2 100644
> > --- a/arch/x86/kernel/ftrace.c
> > +++ b/arch/x86/kernel/ftrace.c
> 
> > @@ -654,4 +656,15 @@ void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
> >  }
> >  #endif
> >  
> > +void ftrace_swap_func(void *a, void *b, int n)
> > +{
> > +	unsigned long t;
> > +
> > +	WARN_ON_ONCE(n != sizeof(t));
> > +
> > +	t = *((unsigned long *)a);
> > +	text_poke_copy(a, b, sizeof(t));
> > +	text_poke_copy(b, &t, sizeof(t));
> > +}
> 
> This is insane, just force BUILDTIME_MCOUNT_SORT

The comment in ftrace.c says "... while mcount loc in modules can not be
sorted at build time"
 
I don't know enough about objtool, but I'd presume it's because the sorting
should happen after relocations, no?

-- 
Sincerely yours,
Mike.

