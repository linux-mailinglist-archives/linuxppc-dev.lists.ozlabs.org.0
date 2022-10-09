Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 518045F8928
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 05:34:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlSMc1ST3z3drS
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 14:34:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=BCnShyLw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=aaew=2k=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=BCnShyLw;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlRZ02W2Hz3bjj
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 13:58:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 80CD3B80B91;
	Sun,  9 Oct 2022 02:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F02C433D6;
	Sun,  9 Oct 2022 02:58:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="BCnShyLw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665284282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PTr9nvXhCIMgKxMMIHmKX/lEwOczzX2VojqQXIdEQXM=;
	b=BCnShyLwlwmwAtXh10NutIMIlSIhkA3vRZVyN65BKsRj3tXHWyoCFyOeejJMpbUNI3Ekb8
	49UE+EpPryrYxycNRVtDAFnXtv9x21EZGJQQn9h5YttxW9h0hZ/Z324YkU/7vcz00VHicb
	bpNHNFK7pnOsAXwDr3Q1vkS9s34eCwg=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b38280f4 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sun, 9 Oct 2022 02:58:02 +0000 (UTC)
Date: Sat, 8 Oct 2022 20:57:54 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH v3 3/5] treewide: use get_random_u32() when possible
Message-ID: <Y0I4si9+cMracPAq@zx2c4.com>
References: <848ed24c-13ef-6c38-fd13-639b33809194@csgroup.eu>
 <CAHmME9raQ4E00r9r8NyWJ17iSXE_KniTG0onCNAfMmfcGar1eg@mail.gmail.com>
 <f10fcfbf-2da6-cf2d-6027-fbf8b52803e9@csgroup.eu>
 <6396875c-146a-acf5-dd9e-7f93ba1b4bc3@csgroup.eu>
 <CAHmME9pE4saqnwxhsAwt-xegYGjsavPOGnHCbZhUXD7kaJ+GAA@mail.gmail.com>
 <501b0fc3-6c67-657f-781e-25ee0283bc2e@csgroup.eu>
 <Y0Ayvov/KQmrIwTS@zx2c4.com>
 <202210071010.52C672FA9@keescook>
 <Y0BoQmVauPLC2uW5@zx2c4.com>
 <69080fb8cace486db4e28e2e90f1d550@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <69080fb8cace486db4e28e2e90f1d550@AcuMS.aculab.com>
X-Mailman-Approved-At: Sun, 09 Oct 2022 14:33:33 +1100
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, "x86@kernel.org" <x86@kernel.org>, Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, KP Singh <kpsingh@kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Eric Dumazet <edumazet@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon
  <will@kernel.org>, Christoph Hellwig <hch@lst.de>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Airlie <airlied@redhat.com>, Paolo Abeni <pabeni@redhat.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Pablo Neira Ayuso <pablo@netfilter.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen
 ?= <toke@toke.dk>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>, "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johannes Berg <johannes@sipsolutions.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Florian Westphal <f
 w@strlen.de>, "patches@lists.linux.dev" <patches@lists.linux.dev>, Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, Chuck Lever <chuck.lever@oracle.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Jan Kara <jack@suse.com>, Thomas Graf <tgraf@suug.ch>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Oct 08, 2022 at 09:53:33PM +0000, David Laight wrote:
> From: Jason A. Donenfeld
> > Sent: 07 October 2022 18:56
> ...
> > > Given these kinds of less mechanical changes, it may make sense to split
> > > these from the "trivial" conversions in a treewide patch. The chance of
> > > needing a revert from the simple 1:1 conversions is much lower than the
> > > need to revert by-hand changes.
> > >
> > > The Cocci script I suggested in my v1 review gets 80% of the first
> > > patch, for example.
> > 
> > I'll split things up into a mechanical step and a non-mechanical step.
> > Good idea.
> 
> I'd also do something about the 'get_random_int() & 3' cases.
> (ie remainder by 2^n-1)
> These can be converted to 'get_random_u8() & 3' (etc).
> So they only need one random byte (not 4) and no multiply.
> 
> Possibly something based on (the quickly typed, and not C):
> #define get_random_below(val) [
> 	if (builtin_constant(val))
> 		BUILD_BUG_ON(!val || val > 0x100000000ull)
> 		if (!(val & (val - 1)) {
> 			if (val <= 0x100)
> 				return get_random_u8() & (val - 1);
> 			if (val <= 0x10000)
> 				return get_random_u16() & (val - 1);
> 			return get_random_u32() & (val - 1);
> 		}
> 	}
> 	BUILD_BUG_ON(sizeof (val) > 4);
> 	return ((u64)get_random_u32() * val) >> 32;

This is already how the prandom_u32_max() implementation works, as
suggested in the cover letter. The multiplication by constants in it
reduces to bit shifts and you already get all the manual masking
possible.

> get_random_below() is a much better name than prandom_u32_max().

Yes, but that name is reserved for when I succeed at making a function
that bounds with a uniform distribution. prandom_u32_max()'s
distribution is non-uniform since it doesn't do rejection sampling. Work
in progress is on https://git.zx2c4.com/linux-rng/commit/?h=jd/get_random_u32_below .
But out of common respect for this already huge thread with a massive
CC list, if you want to bikeshed my WIP stuff, please start a new thread
for that and not bog this one down. IOW, no need to reply here directly.
That'd annoy me.

Jason
