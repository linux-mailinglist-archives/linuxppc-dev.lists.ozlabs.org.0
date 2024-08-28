Return-Path: <linuxppc-dev+bounces-692-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB189627FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 14:58:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv4GX2xSJz2yKD;
	Wed, 28 Aug 2024 22:58:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724849908;
	cv=none; b=K1D6uHBnya+nvfKrp/NgqSM41v+EcVmiX5zF84t6IF3nEqTl/Z4SCNw5i3mxapumrxOarhncfe6bFDqlksb8U1015NLfjIzNuzqojSXm+omQspAns/kL94mzWLfGecBSPu1aFHMEJeYaYEcac2QeMyOgyXJZlbKmxTW1W/UACg6ehl3sDDfcnNK27O2zBRpdCRlsdYLpvCLmEYVjKK3AtrYfr0h64lxVa97zlJ5h6uhjc1cLwlX+BEL8rgcNG6dHXj6idkm0OzscYimndpnUxi3veq8sxHW5gBabiQDfa6mGhZ8MczUoWyMa6nvxuhrt/oX+Ehk89OTaR02U7UHVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724849908; c=relaxed/relaxed;
	bh=M5Ol/050kYlS3NVHSEmUPJsNggqEGajbAkSVcjbojFo=;
	h=Received:Received:X-Authentication-Warning:Date:From:To:Cc:
	 Subject:Message-ID:References:Mime-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 User-Agent; b=NGPR3+ZBU6snts1RuvTO212XG0F2xDmzeG/bdUZEmH876sxDyHPA7/QM/brzAyLH8jo1Acy8yHJMWTMEPewVmeUJsBgsPXEggklJ0NYLrbxrxa+UXZmJfZEPm9Iqe14zSk+mT8Q0Yq5OyKe7AV2Tk1KMVhfBQQ7El7QLA2U+0bjo1XE73h7C7tVLKQp+HdGkgdi5I+C/cWJ6Cri3hqSc2e8o1w/BBliGj+6PKAh2wNDcKQ9GndgFmgpFqAcb8Uc9EU5gtMj3VxVFag2ONAsI4nz3E+/dc53Ido/l+ptQlbkyr8HUOYAUnP2r66NffWmR0xUfRakC0uLiT+Jrt2v/sQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv4GW6DQcz2yK7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 22:58:27 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 47SCptJf031924;
	Wed, 28 Aug 2024 07:51:55 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 47SCpru5031923;
	Wed, 28 Aug 2024 07:51:53 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 28 Aug 2024 07:51:53 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
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
Message-ID: <20240828125153.GF29862@gate.crashing.org>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu> <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu> <20240827180819.GB2049@sol.localdomain> <20240827225330.GC29862@gate.crashing.org> <Zs8HirKLk-SrwTIu@zx2c4.com> <fc19bf63-d519-46e2-be70-80202c85ff92@app.fastmail.com> <CAHmME9rjH4Ek3e8jmBvRp3wy+mrzJAeYxk5=o+OHjoT5sTOQPg@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9rjH4Ek3e8jmBvRp3wy+mrzJAeYxk5=o+OHjoT5sTOQPg@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i

On Wed, Aug 28, 2024 at 02:26:08PM +0200, Jason A. Donenfeld wrote:
> On Wed, Aug 28, 2024 at 2:24 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Wed, Aug 28, 2024, at 11:18, Jason A. Donenfeld wrote:
> > > On Tue, Aug 27, 2024 at 05:53:30PM -0500, Segher Boessenkool wrote:
> > >> On Tue, Aug 27, 2024 at 11:08:19AM -0700, Eric Biggers wrote:
> > >> >
> > >> > Is there a compiler flag that could be used to disable the generation of calls
> > >> > to memset?
> > >>
> > >> -fno-tree-loop-distribute-patterns .  But, as always, read up on it, see
> > >> what it actually does (and how it avoids your problem, and mostly: learn
> > >> what the actual problem *was*!)
> > >
> > > This might help with various loops, but it doesn't help with the matter
> > > that this patch fixes, which is struct initialization. I just tried it
> > > with the arm64 patch to no avail.
> >
> > Maybe -ffreestanding can help here? That should cause the vdso to be built
> > with the assumption that there is no libc, so it would neither add nor
> > remove standard library calls. Not sure if that causes other problems,
> > e.g. if the calling conventions are different.
> 
> >From https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90701:
> 
> | You need -ffreestanding but that is documented to emit memset and
> memcpy still.

Yeah.

'-nostdlib'
     Do not use the standard system startup files or libraries when
     linking.

This won't help a bit, the compiler will still optimise your
initialisation loop to a memset() call, it just won't link to libgcc.a
and crt*.o and its ilk (which is not where mem* are implemented in the
first place!)


Segher

