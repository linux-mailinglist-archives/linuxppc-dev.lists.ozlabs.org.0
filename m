Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 981BA5F8861
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 00:47:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlL023ZhZz3dy8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 09:46:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=QmEOahoB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=1ou5=2j=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=QmEOahoB;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlKP96CLqz2xJ7
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 09:20:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A9B460B02;
	Sat,  8 Oct 2022 22:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70236C433C1;
	Sat,  8 Oct 2022 22:20:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QmEOahoB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665267601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P/cyFerOrVR1hjiF/QX04AV2aA5aZrHQbK/mKyxjv9I=;
	b=QmEOahoBx06KMjDzLtZ7ejYlSXdX3xXDEfCsWADs48NoQdJjnF97KJ2e9Xd8nbc1t03bHc
	iLLQvFEr+bqjH8bhenqpSsnO09+GKMG/IoUml8RmXTmxGyb7ZNYDfXX5MlPSK23GrIkSgB
	X2xrqLLCtqWzb7N/605l/YH3w7HZ3qs=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6a6d913c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 8 Oct 2022 22:20:01 +0000 (UTC)
Date: Sun, 9 Oct 2022 00:19:59 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH v4 2/6] treewide: use prandom_u32_max() when possible
Message-ID: <Y0H3jzGE1oiwEYa5@zx2c4.com>
References: <20221007180107.216067-1-Jason@zx2c4.com>
 <20221007180107.216067-3-Jason@zx2c4.com>
 <01fafe0e56554b1c9c934c458b93473a@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <01fafe0e56554b1c9c934c458b93473a@AcuMS.aculab.com>
X-Mailman-Approved-At: Sun, 09 Oct 2022 09:45:10 +1100
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, "x86@kernel.org" <x86@kernel.org>, Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, KP Singh <kpsingh@kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "patches@lists.linux.dev" <patches@lists.linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Eric Dumazet <edumazet@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@ker
 nel.org>, Christoph Hellwig <hch@lst.de>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Airlie <airlied@redhat.com>, Paolo Abeni <pabeni@redhat.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Pablo Neira Ayuso <pablo@netfilter.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, "linux-um@lists.infradead.org" <linux-um@lists.infra
 dead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>, "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johannes Berg <johannes@sipsolutions.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Florian Westphal <fw@strlen.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.
 org>, Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Jan Kara <jack@suse.com>, Thomas Graf <tgraf@suug.ch>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Oct 08, 2022 at 10:08:03PM +0000, David Laight wrote:
> From: Jason A. Donenfeld
> > Sent: 07 October 2022 19:01
> > 
> > Rather than incurring a division or requesting too many random bytes for
> > the given range, use the prandom_u32_max() function, which only takes
> > the minimum required bytes from the RNG and avoids divisions.
> > 
> ...
> > --- a/lib/cmdline_kunit.c
> > +++ b/lib/cmdline_kunit.c
> > @@ -76,7 +76,7 @@ static void cmdline_test_lead_int(struct kunit *test)
> >  		int rc = cmdline_test_values[i];
> >  		int offset;
> > 
> > -		sprintf(in, "%u%s", prandom_u32_max(256), str);
> > +		sprintf(in, "%u%s", get_random_int() % 256, str);
> >  		/* Only first '-' after the number will advance the pointer */
> >  		offset = strlen(in) - strlen(str) + !!(rc == 2);
> >  		cmdline_do_one_test(test, in, rc, offset);
> > @@ -94,7 +94,7 @@ static void cmdline_test_tail_int(struct kunit *test)
> >  		int rc = strcmp(str, "") ? (strcmp(str, "-") ? 0 : 1) : 1;
> >  		int offset;
> > 
> > -		sprintf(in, "%s%u", str, prandom_u32_max(256));
> > +		sprintf(in, "%s%u", str, get_random_int() % 256);
> >  		/*
> >  		 * Only first and leading '-' not followed by integer
> >  		 * will advance the pointer.
> 
> Something has gone backwards here....
> And get_random_u8() looks a better fit.

Wrong patch version.

> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
