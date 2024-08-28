Return-Path: <linuxppc-dev+bounces-707-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7390963464
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 00:05:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvJPf5f9Rz2xb8;
	Thu, 29 Aug 2024 08:05:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724865193;
	cv=none; b=RN/yS89mZYMzUdBtZafJzXfjlti0jgbBKlJhuy27kbwQO/l/AdoEegqkLerXBEThHtX3GyCy/WUAV6ilQ25GImazioWt+2c1Sk0I/QNzBN2hdq95sWZw3Fur1ZCxSd/ZE2+Wxz1NvPNfSrBUIIz0P/LijibW5qCzGAWBDuWGWLE80KTrEmXXIGi0+45aFtOz87xbzpYmKrd7Roz/Oct891+2VzyXrT31BJNNzL9S0xKN4zcAqQm4AKwVb5jC6tvGTtSbqvSCalO70DFq1IKXdiGJoA+xrpoXYT3L3XAXhezmnNQg+MgnKwBzLumOC23rcUA2eu8fHmzbhUTylSkmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724865193; c=relaxed/relaxed;
	bh=AxP5p6vD8WoRT4fDcBhmPqf4pYQ9KeCD5eFFIS2JcQM=;
	h=Received:Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 Message-ID:Subject:To:Cc:Content-Type; b=ZsGkypQrc4YhjmHrtP3hidP6g1gxHrjv79IIZkgwfdW4nPTcCu6R958oVeGWSLnFHzpwntE/dwzLP3qz52ucTj4wA70nIWayAoBaUYTijeVHZHRjo71tKPg72QqksZRqKa2C17lWjXzgyDY5upvHlDixeK+jp1O6Rb67DzF/V+CTnvcDDrnRDlPQcZNg6S84BHSrs5cPuqmxhRFId2AQXukL8WYZemOfaAiCe9k5+drnYO7RZLQlUil6Bv3SBCBS3wmYBqjZMOfjkStKuUrgErsjbJlq53o/zuY3Mu9KBewwx2mqdpVuj4Wy2DKWI3VJQUfqBqE9XdVkC9CCUU8gYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SFar5KJc; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SFar5KJc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv9wT04Jzz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 03:13:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E185A426EA
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 17:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE6EC4CEC5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724865188;
	bh=wTRLnPlAZutCpvLR9R0pglZtR1qgqcPfis4YRXDGlYs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SFar5KJcyOOqLxwhcaGjzk/s+2JLgrGwjQyRUqMnq6qFBlWFPPLW87QI6cfGTmo/s
	 kTVZAokZ2cisPjdcnUa3o49tV1Mw1SpGBGSGUcYilXuMO9Efm1NJJ5zCWyc1Tt2Hzm
	 lNCW48SmTnuXeiI0kQ7hshKa57+I34WmOj4Hs7S81TVeAqFWJ+xVjZqUuI0mSAO995
	 Iq9KaCwlEo1MddLN2KZngqRFwoh2+BZIWdXuoIxh32ggUPof8YLd8aatTgjH5SX1m+
	 77gnG1IU3Jm1Xrpe8VgMpb4xQNmxAy8A/Nn9dhjj9hgXea2lYFDEJuJm/71JAeV9HL
	 rP2cvKtthC9KQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f50966c478so39420151fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 10:13:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVV63Hk/859U3phJSVf1rbGzSK5Qb/vJ4POxOAozdRPVo7wZcZ0W6paenj/HOVz7NLPQolC4auTc+QLxI0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzlTHECzRppRXMYvvuWWN8O0Zkr3fc8w9087kktyQH8emSHAQXf
	vn4UK2J7T8e1/9XFXSbgZOxHvnKe3uQQJDkM0YcdAvI3whGoy6tf0M9FjM7LQaPVmpwtbzTFGhY
	Wyj+TTuT164QsTTM/sX3EEDuHeSU=
X-Google-Smtp-Source: AGHT+IGT9a5qWQBtajQWghZ5b1FsgrYGjXl26AJMqNqo5EHBiRSmkhizffOxvoPuUqVl91lIQUxQnoyI/1L7KXA3rkA=
X-Received: by 2002:a05:6512:131e:b0:533:4689:9750 with SMTP id
 2adb3069b0e04-5346c626565mr2097762e87.26.1724865187012; Wed, 28 Aug 2024
 10:13:07 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu>
 <20240827180819.GB2049@sol.localdomain> <20240827225330.GC29862@gate.crashing.org>
 <Zs8HirKLk-SrwTIu@zx2c4.com> <fc19bf63-d519-46e2-be70-80202c85ff92@app.fastmail.com>
 <20240828124519.GE29862@gate.crashing.org> <CAMj1kXGmDmxy75eP=rf_fzKmg0g_FeKV43jk2G_gibnKZBtVww@mail.gmail.com>
 <20240828162025.GG29862@gate.crashing.org>
In-Reply-To: <20240828162025.GG29862@gate.crashing.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 28 Aug 2024 19:12:55 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHZPfr2Sz78UrgsdX-2uBp0D1sCnznQnz5ZyMdiJq6rAA@mail.gmail.com>
Message-ID: <CAMj1kXHZPfr2Sz78UrgsdX-2uBp0D1sCnznQnz5ZyMdiJq6rAA@mail.gmail.com>
Subject: Re: [PATCH v2 05/17] vdso: Avoid call to memset() by getrandom
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Eric Biggers <ebiggers@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, "Theodore Ts'o" <tytso@mit.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, shuah <shuah@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Aug 2024 at 18:24, Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> Hi!
>
> On Wed, Aug 28, 2024 at 05:40:23PM +0200, Ard Biesheuvel wrote:
> > On Wed, 28 Aug 2024 at 14:57, Segher Boessenkool
> > <segher@kernel.crashing.org> wrote:
> > >
> > > On Wed, Aug 28, 2024 at 12:24:12PM +0000, Arnd Bergmann wrote:
> > > > On Wed, Aug 28, 2024, at 11:18, Jason A. Donenfeld wrote:
> > > > > On Tue, Aug 27, 2024 at 05:53:30PM -0500, Segher Boessenkool wrote:
> > > > >> On Tue, Aug 27, 2024 at 11:08:19AM -0700, Eric Biggers wrote:
> > > > >> >
> > > > >> > Is there a compiler flag that could be used to disable the generation of calls
> > > > >> > to memset?
> > > > >>
> > > > >> -fno-tree-loop-distribute-patterns .  But, as always, read up on it, see
> > > > >> what it actually does (and how it avoids your problem, and mostly: learn
> > > > >> what the actual problem *was*!)
> > > > >
> > > > > This might help with various loops, but it doesn't help with the matter
> > > > > that this patch fixes, which is struct initialization. I just tried it
> > > > > with the arm64 patch to no avail.
> > > >
> > > > Maybe -ffreestanding can help here? That should cause the vdso to be built
> > > > with the assumption that there is no libc, so it would neither add nor
> > > > remove standard library calls. Not sure if that causes other problems,
> > > > e.g. if the calling conventions are different.
> > >
> > > "GCC requires the freestanding
> > > environment provide 'memcpy', 'memmove', 'memset' and 'memcmp'."
> > >
> > > This is precisely to implement things like struct initialisation.  Maybe
> > > we should have a "-ffreeerstanding" or "-ffreefloating" or think of
> > > something funnier still environment as well, this problem has been there
> > > since the -ffreestanding flag has existed, but the problem is as old as
> > > the night.
> > >
> > > -fno-builtin might help a bit more, but just attack the problem at
> > > its root, like I suggested?
> > >
> >
> > In my experience, this is likely to do the opposite: it causes the
> > compiler to 'forget' the semantics of memcpy() and memset(), so that
> > explicit trivial calls will no longer be elided and replaced with
> > plain loads and stores (as it can no longer guarantee the equivalence)
>
> No, the compiler will never forget those semantics.  But if you tell it
> your function named memset() is not the actual standard memset -- via
> -fno-builtin-memset for example -- the compiler won't optimise things
> involving it quite as much.  You told it so eh?
>

That is exactly the point I am making. So how would this help in this case?

> You can also tell it not to have a __builtin_memset function, but in
> this particular case that won;t quite work, since the compiler does need
> to have that builtin available to do struct and array initialisations
> and the like.
>
> > > (This isn't a new problem, originally it showed up as "GCC replaces
> > > (part of) my memcpy() implementation by a (recursive) call to memcpy()"
> > > and, well, that doesn't quite work!)
> > >
> >
> > This needs to be fixed for Clang as well, so throwing GCC specific
> > flags at it will at best be a partial solution.
>
> clang says it is a 100% plug-in replacement for GCC, so they will have
> to accept all GCC flags.  And in many cases they do.  Cases where they
> don't are bugs.
>

Even if this were true, we support Clang versions today that do not
support -fno-tree-loop-distribute-patterns so my point stands.

> > It is not a complete solution, unfortunately, and I guess there may be
> > other situations (compiler/arch combinations) where this might pop up
> > again.
>
> Why do mem* not work in VDSOs?  Fix that, and all these problems
> disappear, and you do not need workrarounds :-)
>

Good point. We should just import memcpy and memset in the VDSO ELF metadata.

Not sure about static binaries, though: do those even use the VDSO?

