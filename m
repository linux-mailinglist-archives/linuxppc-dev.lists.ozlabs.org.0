Return-Path: <linuxppc-dev+bounces-697-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC69962D9C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 18:27:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv8vV3F7lz2yY0;
	Thu, 29 Aug 2024 02:27:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724862438;
	cv=none; b=ZsbKTEsFW/PNLctP5NCR3SIHwOqpPeIevsMtWBwRG6JSk2R7eMte5Z6UPDUE1gRn+2Z73MKo+dRY1h79P+hTuJm20vsw01L9Nn02i79AJdcKweMGZNPoeLbrix57F11aTL0HkeC/iVPiNLhar1hm7M9+ZTyHy4CKC5PYiDZaE9udlFuBlEzDYmiAze/tdbMsj3M0h43UZ7WPqJd4kPKzoOY7VNSd6ISpF90EGcsgOxvlJIZFEXMtaezC3q+QKc1I7JgQKp7jfooxttTm3pNNKnwk21+DLOeSgfbTA31ZHyFysrWM1TmWMFqIVkVKQ+vfUcUG3VYPwyxQfmz6qapoDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724862438; c=relaxed/relaxed;
	bh=DHfvUMFhpYQy9mAn0IMqRDOSXQkdCSygfrSJESi6GUw=;
	h=Received:Received:X-Authentication-Warning:Date:From:To:Cc:
	 Subject:Message-ID:References:Mime-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent; b=P8NBm1tgkWBKzcdV3wJeQjHycL8tLDGFBlGqMZ1Oif7MyiYp1hxxvKTgobyWr84/wCx3V3Ud4RQL3UjXfTHt7pfmfscnraVTj+uGF0rxHl12eAMIOsSHRa+ZdGCgVOULa2kzOP0rVPrAwg6jGmv+lA6yUZCKFGWDcyaRYGdt3mt+wJVsoXFb/ryAzsCtaYvsi3/sc8dhM16Xcdeve5cTEMRYwv1ZZl59vV3N6XybeTy8bR5YQ92pbb0JiDb/hRBR3ouKzkN3TOBggNU1hf1MakABKYyxuBF0br+s/3swW2rHbcNo4aGagIBd+eN8nu3NSQ8hSwfkPmHLk571n/UQyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv8vT0cRWz2yGD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 02:27:15 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 47SGKT1D008844;
	Wed, 28 Aug 2024 11:20:29 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 47SGKPkx008843;
	Wed, 28 Aug 2024 11:20:25 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 28 Aug 2024 11:20:25 -0500
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
Message-ID: <20240828162025.GG29862@gate.crashing.org>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu> <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu> <20240827180819.GB2049@sol.localdomain> <20240827225330.GC29862@gate.crashing.org> <Zs8HirKLk-SrwTIu@zx2c4.com> <fc19bf63-d519-46e2-be70-80202c85ff92@app.fastmail.com> <20240828124519.GE29862@gate.crashing.org> <CAMj1kXGmDmxy75eP=rf_fzKmg0g_FeKV43jk2G_gibnKZBtVww@mail.gmail.com>
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
In-Reply-To: <CAMj1kXGmDmxy75eP=rf_fzKmg0g_FeKV43jk2G_gibnKZBtVww@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i

Hi!

On Wed, Aug 28, 2024 at 05:40:23PM +0200, Ard Biesheuvel wrote:
> On Wed, 28 Aug 2024 at 14:57, Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> >
> > On Wed, Aug 28, 2024 at 12:24:12PM +0000, Arnd Bergmann wrote:
> > > On Wed, Aug 28, 2024, at 11:18, Jason A. Donenfeld wrote:
> > > > On Tue, Aug 27, 2024 at 05:53:30PM -0500, Segher Boessenkool wrote:
> > > >> On Tue, Aug 27, 2024 at 11:08:19AM -0700, Eric Biggers wrote:
> > > >> >
> > > >> > Is there a compiler flag that could be used to disable the generation of calls
> > > >> > to memset?
> > > >>
> > > >> -fno-tree-loop-distribute-patterns .  But, as always, read up on it, see
> > > >> what it actually does (and how it avoids your problem, and mostly: learn
> > > >> what the actual problem *was*!)
> > > >
> > > > This might help with various loops, but it doesn't help with the matter
> > > > that this patch fixes, which is struct initialization. I just tried it
> > > > with the arm64 patch to no avail.
> > >
> > > Maybe -ffreestanding can help here? That should cause the vdso to be built
> > > with the assumption that there is no libc, so it would neither add nor
> > > remove standard library calls. Not sure if that causes other problems,
> > > e.g. if the calling conventions are different.
> >
> > "GCC requires the freestanding
> > environment provide 'memcpy', 'memmove', 'memset' and 'memcmp'."
> >
> > This is precisely to implement things like struct initialisation.  Maybe
> > we should have a "-ffreeerstanding" or "-ffreefloating" or think of
> > something funnier still environment as well, this problem has been there
> > since the -ffreestanding flag has existed, but the problem is as old as
> > the night.
> >
> > -fno-builtin might help a bit more, but just attack the problem at
> > its root, like I suggested?
> >
> 
> In my experience, this is likely to do the opposite: it causes the
> compiler to 'forget' the semantics of memcpy() and memset(), so that
> explicit trivial calls will no longer be elided and replaced with
> plain loads and stores (as it can no longer guarantee the equivalence)

No, the compiler will never forget those semantics.  But if you tell it
your function named memset() is not the actual standard memset -- via
-fno-builtin-memset for example -- the compiler won't optimise things
involving it quite as much.  You told it so eh?

You can also tell it not to have a __builtin_memset function, but in
this particular case that won;t quite work, since the compiler does need
to have that builtin available to do struct and array initialisations
and the like.

> > (This isn't a new problem, originally it showed up as "GCC replaces
> > (part of) my memcpy() implementation by a (recursive) call to memcpy()"
> > and, well, that doesn't quite work!)
> >
> 
> This needs to be fixed for Clang as well, so throwing GCC specific
> flags at it will at best be a partial solution.

clang says it is a 100% plug-in replacement for GCC, so they will have
to accept all GCC flags.  And in many cases they do.  Cases where they
don't are bugs.

> It is not a complete solution, unfortunately, and I guess there may be
> other situations (compiler/arch combinations) where this might pop up
> again.

Why do mem* not work in VDSOs?  Fix that, and all these problems
disappear, and you do not need workrarounds :-)


Segher

