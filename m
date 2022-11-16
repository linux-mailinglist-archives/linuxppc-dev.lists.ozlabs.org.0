Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1F862CF39
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 00:56:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCKhk6bSDz3dtt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 10:56:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=goQ4eWiA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=7/5/=3q=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=goQ4eWiA;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCKgk69n0z3bm9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 10:56:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83BF56204E;
	Wed, 16 Nov 2022 23:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABDBC433D6;
	Wed, 16 Nov 2022 23:55:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="goQ4eWiA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1668642952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sM9LBQZ376u5w/8PZH+YQVlUaxTNIyanmkjPT3FYfMU=;
	b=goQ4eWiAvkZqWkfss8gq1ex5AtlA/ahfxEBk6r2fheEdHDzxQqDvdaI7jHnRtKQZacSknN
	xALKJahBGIU2w4KpYkodsz6zSfQUgQjwtn/9XiLQzmbduxm8SAGcIyMTbNpEffPJ6eVtj8
	fknlTQXlnEW5l9AjbJbPQ6U48mWYP8U=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 48c033fa (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 16 Nov 2022 23:55:51 +0000 (UTC)
Date: Thu, 17 Nov 2022 00:55:47 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2 3/3] treewide: use get_random_u32_between() when
 possible
Message-ID: <Y3V4g8eorwiU++Y3@zx2c4.com>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
 <20221114164558.1180362-4-Jason@zx2c4.com>
 <202211161436.A45AD719A@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202211161436.A45AD719A@keescook>
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, patches@lists.linux.dev, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, ydroneaud@opteya.com, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org, linux-media@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org, linux-kerne
 l@vger.kernel.org, Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 16, 2022 at 02:43:13PM -0800, Kees Cook wrote:
> On Mon, Nov 14, 2022 at 05:45:58PM +0100, Jason A. Donenfeld wrote:
> > -				(get_random_u32_below(1024) + 1) * PAGE_SIZE;
> > +				get_random_u32_between(1, 1024 + 1) * PAGE_SIZE;
> 
> I really don't like "between". Can't this be named "inclusive" (and
> avoid adding 1 everywhere, which seems ugly), or at least named
> something less ambiguous?
> 
> > -		n = get_random_u32_below(100) + 1;
> > +		n = get_random_u32_between(1, 101);
> 
> Because I find this much less readable. "Below 100" is clear: 0-99
> inclusive, plus 1, so 1-100 inclusive. "Between 1 and 101" is not obvious
> to me to mean: 1-100 inclusive.
> 
> These seem so much nicer:
> 	get_random_u32_inclusive(1, 1024)
> 	get_random_u32_inclusive(1, 100)

Yann pointed out something similar -- the half-closed interval being
confusing -- and while I was initially dismissive, I've warmed up to
doing this fully closed after sending a diff of that:

https://lore.kernel.org/lkml/Y3Qt8HiXj8giOnZy@zx2c4.com/

So okay, let's say that I'll implement the inclusive version instead. We
now have two problems to solve:

1) How/whether to make f(0, UR2_MAX) safe,
   - without additional 64-bit arithmetic,
   - minimizing the number of branches.
   I have a few ideas I'll code golf for a bit.

2) What to call it:
   - between I still like, because it mirrors "I'm thinking of a number
     between 1 and 10 and..." that everybody knows,
   - inclusive I guess works, but it's not a preposition,
   - bikeshed color #3?

I think I can make progress with (1) alone by fiddling around with
godbolt enough, like usual. I could use some more ideas for (2) though.

Jason
