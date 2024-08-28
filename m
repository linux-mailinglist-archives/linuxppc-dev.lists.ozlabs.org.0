Return-Path: <linuxppc-dev+bounces-699-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3F3962E93
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 19:32:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvBLf39kYz2yhZ;
	Thu, 29 Aug 2024 03:32:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724866346;
	cv=none; b=fBkLCHzM9Q5nveqyKP11ndw1d2OusnYC3U+ntQTxT3WTwGILmxJmsH5VjTd8Vdu118Gx+9sLj2V5a108vNfsOoQLZ3yliDpOprc3xXhc5ylIzMzWFHX5Ap3QD63QPZsR2d4SLA3iC8V6ujYyxP3KcMdb3GdLNFzTZHds5FPPFSyJOIu7dQ6ZNfyk49I4Xyu0JopZSCvoNgDsBdH+g1bqTcSPN/ixas2nD05mo6sJgt0mjUAFa6hxpMcWq6OKJLOlltAJ78GTORmuRe0fqXfLPqkRY6ld2BOb+BnHojjVDyDm2DKtgCn5bji3CwuswntsfvaHqqxTGwJuJR7HuYQrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724866346; c=relaxed/relaxed;
	bh=k8Qyj74CeDoUya9Vr744m4R8YvCdqIPmQGpZ2FOAWuw=;
	h=Received:Received:X-Authentication-Warning:Date:From:To:Cc:
	 Subject:Message-ID:References:Mime-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent; b=jF5KbFD2NuMjtPRwVTMqqOfilw5qXsJSFA12iJUvBVAJyessGh/x04qb1nizoxAqL6Cs6XIjVJvdclhwzvJrMFv3ED46IE9eE8Qw+JOR6isq/VW1HEbnAYhmm7A5gyCMALNlN06hO0rjQgx0HtfdykRD6ZQPGH2d+QUDJUTkbdtIGGKyBgITrip0XsQXEsRQWjRdTdsGpQ1NC42lYVkrVrENwl3vZa0fQPWlpRlOhgTHPY3WKlHav+gugkBx/rcMT4QfS9SYSKWLTnzUiM3J5PBKRrRPmBudVN27xL4lOyzId/1u4V/OXBrTYytkMQ4ItA5LeMM1X0/jZhqbZTYCMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvBLc3vxtz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 03:32:24 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 47SHPeo9010804;
	Wed, 28 Aug 2024 12:25:40 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 47SHPc5F010803;
	Wed, 28 Aug 2024 12:25:38 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 28 Aug 2024 12:25:38 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, "Theodore Ts'o" <tytso@mit.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        shuah <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Linux-Arch <linux-arch@vger.kernel.org>, linux-mm@kvack.org,
        linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 05/17] vdso: Avoid call to memset() by getrandom
Message-ID: <20240828172538.GI29862@gate.crashing.org>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu> <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu> <20240827180819.GB2049@sol.localdomain> <20240827225330.GC29862@gate.crashing.org> <Zs8HirKLk-SrwTIu@zx2c4.com> <fc19bf63-d519-46e2-be70-80202c85ff92@app.fastmail.com> <20240828124519.GE29862@gate.crashing.org> <CAMj1kXGmDmxy75eP=rf_fzKmg0g_FeKV43jk2G_gibnKZBtVww@mail.gmail.com> <20240828162025.GG29862@gate.crashing.org> <CAMj1kXHZPfr2Sz78UrgsdX-2uBp0D1sCnznQnz5ZyMdiJq6rAA@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHZPfr2Sz78UrgsdX-2uBp0D1sCnznQnz5ZyMdiJq6rAA@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i

On Wed, Aug 28, 2024 at 07:12:55PM +0200, Ard Biesheuvel wrote:
> On Wed, 28 Aug 2024 at 18:24, Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> > > In my experience, this is likely to do the opposite: it causes the
> > > compiler to 'forget' the semantics of memcpy() and memset(), so that
> > > explicit trivial calls will no longer be elided and replaced with
> > > plain loads and stores (as it can no longer guarantee the equivalence)
> >
> > No, the compiler will never forget those semantics.  But if you tell it
> > your function named memset() is not the actual standard memset -- via
> > -fno-builtin-memset for example -- the compiler won't optimise things
> > involving it quite as much.  You told it so eh?
> 
> That is exactly the point I am making. So how would this help in this case?

I think we agree?  :-)

> > > This needs to be fixed for Clang as well, so throwing GCC specific
> > > flags at it will at best be a partial solution.
> >
> > clang says it is a 100% plug-in replacement for GCC, so they will have
> > to accept all GCC flags.  And in many cases they do.  Cases where they
> > don't are bugs.
> 
> Even if this were true, we support Clang versions today that do not
> support -fno-tree-loop-distribute-patterns so my point stands.

It is true.  Yes, this cause problems for their users.

> > > It is not a complete solution, unfortunately, and I guess there may be
> > > other situations (compiler/arch combinations) where this might pop up
> > > again.
> >
> > Why do mem* not work in VDSOs?  Fix that, and all these problems
> > disappear, and you do not need workrarounds :-)
> 
> Good point. We should just import memcpy and memset in the VDSO ELF metadata.

Yeah.  In many cases GCC will replace such calls by (faster and/or
smaller) inline code anyway, but when it does leave a call, there needs
to be an external function implementing it :-)

> Not sure about static binaries, though: do those even use the VDSO?

With "static binary" people usually mean "a binary not using any DSOs",
I think the VDSO is a DSO, also in this respect?  As always, -static
builds are *way* less problematic (and faster and smaller :-) )


Segher

