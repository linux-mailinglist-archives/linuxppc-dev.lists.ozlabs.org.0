Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D75D8734988
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 02:44:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rUN14PJn;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lLIbNU3p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QkrdM5kL3z30hk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 10:44:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rUN14PJn;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lLIbNU3p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QkrcR6qm0z2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 10:44:07 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1687135439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vsMXbrKh0JGoYY4QV9GoJzzJG7ynUwMTeuBBW75Cixw=;
	b=rUN14PJnvCNMHwi3GTEOlfidoeu9X715ZKU0SYtls/E3LdchOubCrv6G6mpg1kS5Tfe1/9
	s4JZa7jZI7/5XwWNgt1s7Bm2c/bSSDDBur1GSNft3GZ9udoq7EXJISSUO38jFXsNGvEbM0
	tkM74ZwC4qjXGWb7oec1XP9g1Yz2kDYVXq2zWp3OYogUAp3NdYJ+EU/2VWfMYxaoBPM/f0
	h8mrju1Sc9ps1cTeu3nCYiDGzqD/IRl0erFde+EUGB5wGGP14zw+GKvCyObIUHvlYiaxv4
	ceZRK3Uxj0lWHTCBTGtW1lP8JYu8YM/FvQhC52QcdmikiK6sh8q/uSftK+9f4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1687135439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vsMXbrKh0JGoYY4QV9GoJzzJG7ynUwMTeuBBW75Cixw=;
	b=lLIbNU3pTbmQ6EcHS74pAHUeumYKJH5D0qb0hsj7fDkEeEfUM8kX51p2S8npikVP/atNyj
	ZNKqUDCt/8atTiDw==
To: Kent Overstreet <kent.overstreet@linux.dev>
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
In-Reply-To: <20230618231431.4aj3k5ujye22sqai@moria.home.lan>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-7-rppt@kernel.org> <87jzw0qu3s.ffs@tglx>
 <20230618231431.4aj3k5ujye22sqai@moria.home.lan>
Date: Mon, 19 Jun 2023 02:43:58 +0200
Message-ID: <87h6r4qo1d.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kent!

On Sun, Jun 18 2023 at 19:14, Kent Overstreet wrote:
> On Mon, Jun 19, 2023 at 12:32:55AM +0200, Thomas Gleixner wrote:
>
> Thomas, you're confusing an internal interface with external

No. I am not.

Whether that's an internal function or not does not make any difference
at all.

Having a function growing _eight_ parameters where _six_ of them are
derived from a well defined data structure is a clear sign of design
fail.

It's not rocket science to do:

struct generic_allocation_info {
       ....
};

struct execmem_info {
       ....
       struct generic_allocation_info alloc_info;
;

struct execmem_param {
       ...
       struct execmem_info[NTYPES];
};

and having a function which can either operate on execmem_param and type
or on generic_allocation_info itself. It does not matter as long as the
data structure which is handed into this internal function is
describing it completely or needs a supplementary argument, i.e. flags.

Having tons of wrappers which do:

       a = generic_info.a;
       b = generic_info.b;
       ....
       n = generic_info.n;

       internal_func(a, b, ....,, n);

is just hillarious and to repeat myself tasteless and therefore
disgusting.

That's CS course first semester hackery, but TBH, I can only tell from
imagination because I did not take CS courses - maybe that's the
problem...

Data structure driven design works not from the usage site down to the
internals. It's the other way round:

  1) Define a data structure which describes what the internal function
     needs to know

  2) Implement use case specific variants which describe that

  3) Hand the use case specific variant to the internal function
     eventually with some minimal supplementary information.

Object oriented basics, right?

There is absolutely nothing wrong with having

      internal_func(generic_info *, modifier);

but having

      internal_func(a, b, ... n)

is fundamentally wrong in the context of an extensible and future proof
internal function.

Guess what. Today it's sufficient to have _eight_ arguments and we are
happy to have 10 nonsensical wrappers around this internal
function. Tomorrow there happens to be a use case which needs another
argument so you end up:

  Changing 10 wrappers plus the function declaration and definition in
  one go

instead of adding

  One new naturally 0 initialized member to generic_info and be done
  with it.

Look at the evolution of execmem_alloc() in this very pathset which I
pointed out. That very patchset covers _two_ of at least _six_ cases
Song and myself identified. It already had _three_ steps of evolution
from _one_ to _five_ to _eight_ parameters.

C is not like e.g. python where you can "solve" that problem by simply
doing:

- internal_func(a, b, c):
+ internal_func(a, b, c, d=None, ..., n=None):

But that's not a solution either. That's a horrible workaround even in
python once your parameter space gets sufficiently large. The way out in
python is to have **kwargs. But that's not an option in C, and not
necessarily the best option for python either.

Even in python or any other object oriented language you get to the
point where you have to rethink your approach, go back to the drawing
board and think about data representation.

But creating a new interface based on "let's see what we need over
time and add parameters as we see fit" is simply wrong to begin with
independent of the programming language.

Even if the _eight_ parameters are the end of the range, then they are
beyond justifyable because that's way beyond the natural register
argument space of any architecture and you are offloading your lazyness
to wrappers and the compiler to emit pointlessly horrible code.

There is a reason why new syscalls which need more than a few parameters
are based on 'struct DATA_WHICH_I_NEED_TO_KNOW' and 'flags'.

We've got burned on the non-extensibilty often enough. Why would a new
internal function have any different requirements especially as it is
neither implemented to the full extent nor a hotpath function?

Now you might argue that it _is_ a "hotpath" due to the BPF usage, but
then even more so as any intermediate wrapper which converts from one
data representation to another data representation is not going to
increase performance, right?

> ... I made the same mistake reviewing Song's patchset...

Songs series had rough edges, but was way more data structure driven
and palatable than this hackery.

The fact that you made a mistake while reviewing Songs series has
absolutely nothing to do with the above or my previous reply to Mike.

Thanks,

        tglx
