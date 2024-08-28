Return-Path: <linuxppc-dev+bounces-691-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2229627C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 14:52:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv47156zcz2yY9;
	Wed, 28 Aug 2024 22:51:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724849517;
	cv=none; b=aqNBJRa553roe2iov9i4rUoWfbBqOO5Z8ouWzEVL6xo7hb6ahDVC55cp11FiObHtr+7Np+9F+m4aM1pDkxxBFEPyOFEt70SPSvW1m4tBAE6HRuSIT6N0ynWFTbLJSe7zBlMz2VLXhu5ZGMBgfva2BF0W52xtsBNvv3SUIGpfuIsD8bj6qE173+rsSeZ7n2YJ9qsoQlaIiN+5J0l/daIkQjyFgPoiShEQqSNE9Hq6gbgZNJubIKBdAI9naNSEYdiVZF3vsAfIkoo6LodVaQc9ec3hfj31dZA97r3XZnWsUOcONVnY0AJmUBw5FhxWcdfVIrQULToJf6SRPS8r8yJhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724849517; c=relaxed/relaxed;
	bh=FBPnhwC0ZlgG+MDXjjoJC+KOKIZWd8sQEhxJuByTeDA=;
	h=Received:Received:X-Authentication-Warning:Date:From:To:Cc:
	 Subject:Message-ID:References:Mime-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent; b=E9mvRiyQFvftxIQ81AD4aGGvbuEpqeATD21Wtr8sr/T3Psx0zVnor99GUexs+0l8zVsFH81MbwYYFQ2KRARRUvH6d73mN2XQYz3n3ZG6GA7wrhQM6mSKbWYpLsaJbrrAGGbi4DJ/NtGnH/zOaROzZ1JnRA6ROFfJU04z4OzdZttITC1nqd7DIOqZ6aJRhA6v/2/RiuL3ZeaNTDWoxIuCNEQhCIJxFe+GrxcB4g/bL9tBpQPFT7dj7hVxJ4BbYeEYHg5YEr8izY1aB55iILDlknkIRWxJG+9hKqNaizaZkduBUwHdy49DIOQUwxSse23GoaikoW1BQU+WMLxOqZaEtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv471119gz2xJy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 22:51:56 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 47SCjLrv031636;
	Wed, 28 Aug 2024 07:45:21 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 47SCjJbM031635;
	Wed, 28 Aug 2024 07:45:19 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 28 Aug 2024 07:45:19 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
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
Message-ID: <20240828124519.GE29862@gate.crashing.org>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu> <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu> <20240827180819.GB2049@sol.localdomain> <20240827225330.GC29862@gate.crashing.org> <Zs8HirKLk-SrwTIu@zx2c4.com> <fc19bf63-d519-46e2-be70-80202c85ff92@app.fastmail.com>
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
In-Reply-To: <fc19bf63-d519-46e2-be70-80202c85ff92@app.fastmail.com>
User-Agent: Mutt/1.4.2.3i

On Wed, Aug 28, 2024 at 12:24:12PM +0000, Arnd Bergmann wrote:
> On Wed, Aug 28, 2024, at 11:18, Jason A. Donenfeld wrote:
> > On Tue, Aug 27, 2024 at 05:53:30PM -0500, Segher Boessenkool wrote:
> >> On Tue, Aug 27, 2024 at 11:08:19AM -0700, Eric Biggers wrote:
> >> > 
> >> > Is there a compiler flag that could be used to disable the generation of calls
> >> > to memset?
> >> 
> >> -fno-tree-loop-distribute-patterns .  But, as always, read up on it, see
> >> what it actually does (and how it avoids your problem, and mostly: learn
> >> what the actual problem *was*!)
> >
> > This might help with various loops, but it doesn't help with the matter
> > that this patch fixes, which is struct initialization. I just tried it
> > with the arm64 patch to no avail.
> 
> Maybe -ffreestanding can help here? That should cause the vdso to be built
> with the assumption that there is no libc, so it would neither add nor
> remove standard library calls. Not sure if that causes other problems,
> e.g. if the calling conventions are different.

"GCC requires the freestanding
environment provide 'memcpy', 'memmove', 'memset' and 'memcmp'."

This is precisely to implement things like struct initialisation.  Maybe
we should have a "-ffreeerstanding" or "-ffreefloating" or think of
something funnier still environment as well, this problem has been there
since the -ffreestanding flag has existed, but the problem is as old as
the night.

-fno-builtin might help a bit more, but just attack the problem at
its root, like I suggested?

(This isn't a new problem, originally it showed up as "GCC replaces
(part of) my memcpy() implementation by a (recursive) call to memcpy()"
and, well, that doesn't quite work!)


Segher

