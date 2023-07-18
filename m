Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A1B7588C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 00:55:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nZENGkev;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5DnW1jMlz307y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 08:55:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nZENGkev;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Dmf0VSSz2ym1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 08:54:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 718EA61280;
	Tue, 18 Jul 2023 22:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BC9C433C8;
	Tue, 18 Jul 2023 22:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689720892;
	bh=1hPBVUZKx9DcSFz9qEiAQCMaCu6XICTp5tPsfBL3VTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nZENGkevC8W/gj/0tZ9tVvAElZY3lwTUMr999oZl+jwvHVvtSMgDpH1KbGMEAU4qs
	 GdpVYRatm0rSzVuAMU4XHsXzxbuISlJXTbyX6Ak0+tmkqQfllCv6T0ItKeE5MMHk1i
	 p33MlEu6cwmh6M4Wxxhhb5pd4+W3wYK2dE/YtpA2o5B+XvJOMq1ia1u6cYxrdVIx0U
	 mYPIoJrkuqKmEMSsiz1ZArYA01s/aryDGYYvNiRUoqAk6VAHtXJ1FOfnqL0xq3TBGo
	 uBMtWz1SprpEJs7h1FI0mxBwReuRTZEjdlXn/cq6JQTFCphSKiIDvhQXXnaOHRyuA3
	 6utEntLUgpgtg==
Date: Tue, 18 Jul 2023 15:54:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH 01/21] crypto: scomp - Revert "add support for
 deflate rfc1950 (zlib)"
Message-ID: <20230718225450.GD1005@sol.localdomain>
References: <20230718125847.3869700-1-ardb@kernel.org>
 <20230718125847.3869700-2-ardb@kernel.org>
 <20230718223239.GB1005@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718223239.GB1005@sol.localdomain>
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
Cc: Jens Axboe <axboe@kernel.dk>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Steffen Klassert <steffen.klassert@secunet.com>, Kees Cook <keescook@chromium.org>, qat-linux@intel.com, Sergey Senozhatsky <senozhatsky@chromium.org>, Richard Weinberger <richard@nod.at>, David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Nick Terrell <terrelln@fb.com>, netdev@vger.kernel.org, linux-mtd@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 18, 2023 at 03:32:39PM -0700, Eric Biggers wrote:
> On Tue, Jul 18, 2023 at 02:58:27PM +0200, Ard Biesheuvel wrote:
> > This reverts commit a368f43d6e3a001e684e9191a27df384fbff12f5.
> > 
> > "zlib-deflate" was introduced 6 years ago, but it does not have any
> > users. So let's remove the generic implementation and the test vectors,
> > but retain the "zlib-deflate" entry in the testmgr code to avoid
> > introducing warning messages on systems that implement zlib-deflate in
> > hardware.
> > 
> > Note that RFC 1950 which forms the basis of this algorithm dates back to
> > 1996, and predates RFC 1951, on which the existing IPcomp is based and
> > which we have supported in the kernel since 2003. So it seems rather
> > unlikely that we will ever grow the need to support zlib-deflate.
> > 
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  crypto/deflate.c | 61 +++++-----------
> >  crypto/testmgr.c |  8 +--
> >  crypto/testmgr.h | 75 --------------------
> >  3 files changed, 18 insertions(+), 126 deletions(-)
> 
> So if this is really unused, it's probably fair to remove it on that basis.
> However, it's not correct to claim that DEFLATE is obsoleted by zlib (the data
> format).  zlib is just DEFLATE plus a checksum, as is gzip.
> 
> Many users of zlib or gzip use an external checksum and therefore would be
> better served by DEFLATE, avoiding a redundant builtin checksum.  Typically,
> people have chosen zlib or gzip simply because their compression library
> defaulted to it, they didn't understand the difference, and they overlooked that
> they're paying the price for a redundant builtin checksum.
> 
> An example of someone doing it right is EROFS, which is working on adding
> DEFLATE support (not zlib or gzip!):
> https://lore.kernel.org/r/20230713001441.30462-1-hsiangkao@linux.alibaba.com
> 
> Of course, they are using the library API instead of the clumsy crypto API.
> 

Ah, I misread this patch, sorry.  It's actually removing support for zlib (the
data format) from the scomp API, leaving just DEFLATE.  That's fine too; again,
it ultimately just depends on what is actually being used via the scomp API.
But similarly you can't really claim that zlib is obsoleted by DEFLATE just
because of the RFC dates.  As I mentioned, many people do use zlib (the data
format), often just because it's the default of zlib (the library) and they
didn't know any better.  For example, btrfs compression supports zlib.

- Eric
