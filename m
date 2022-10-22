Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1FB608442
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 06:24:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MvSsc6jT7z3dw4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 15:24:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=lBfM7/p5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=nrlw=2x=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=lBfM7/p5;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MvSrf1mHgz3bjD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Oct 2022 15:23:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 63467B80D4B;
	Sat, 22 Oct 2022 04:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12835C433D7;
	Sat, 22 Oct 2022 04:23:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="lBfM7/p5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1666412617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B9PpCweDWCdYmYRSGKDbVg7+bIAdj37ycm4g1XbG6yY=;
	b=lBfM7/p5gSu1DVM047xbGxryCNIAciT+I0Q1kb50i3cof6dUxtUjRk0MKc6LBWnUojKf0X
	jbelDSUzqG0P6n89hqlrpIScNnmnA8Sxg6K0tnlWQ+ezzUhF8JMb3pSyet7RU8t6uyzlok
	7b/CTDV1erpNv77ET1Dj8vxxRoEEcC0=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1d387ad5 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 22 Oct 2022 04:23:36 +0000 (UTC)
Date: Sat, 22 Oct 2022 00:23:00 -0400
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v1 0/5] convert tree to
 get_random_u32_{below,above,between}()
Message-ID: <Y1NwJJOIB4gI5G11@zx2c4.com>
References: <20221022014403.3881893-1-Jason@zx2c4.com>
 <20221021205522.6b56fd24@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221021205522.6b56fd24@kernel.org>
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, linux-mips@vger.kernel.org, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph =?utf-8?Q?B=C3=B6
 hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 21, 2022 at 08:55:22PM -0700, Jakub Kicinski wrote:
> On Fri, 21 Oct 2022 21:43:58 -0400 Jason A. Donenfeld wrote:
> > Since get_random_u32_below() sits in my random.git tree, these patches
> > too will flow through that same tree.
> 
> How big is it?  Can you provide a stable branch to pull in the new
> helpers and then everyone will be able to apply the patches to their
> subsystem?

It's a patch. But what you suggest sounds crazy to me. Supply some
branch and have every tree merge that branch separately, in duplicate,
and then get all of the conversion patches through every tree, and then
somehow coordinate the removal of the deprecated function after all of
that, and then baby sit the grand orchestration of all this over the
course of two and half months, watch it fail because of some
unmaintained corner that's affected, and then try to herd it through for
another two and a half months after that? Holy crap. That's torture.

Were this an actually technically interesting patchset that required
some really detailed expert review, maybe that'd have some iota of
merit. But this is a really boring refactoring, mostly automated with
Coccinelle. If having to baby sit one hundred separate patches over the
course of months, handling confusion of walking maintainers through the
exercise of merging some weird duplicate branch into their trees before,
and so forth, is required to get this kind of grunt work done, I'm just
going to wind up losing all motivation for this kind of thing, and
naturally, as a matter of human nature, stop doing it. The result will
be that we have garbage pile up over time that operates on the principle
of "least hassle to deal with for the time being" rather than "love of
the code and a desire for long term maintainability and quality". The
former is sometimes how things go. The latter is what I'm striving for.

So what you suggest sounds really dreadful to me. Sorry.

Instead, this series follows the same template as the last one, and the
last one was much more nuanced and invasive and went fine. In the very
worst case, it'll require me to be on the ball with what's happening
with -next, which is something I've done before and can do again.

Jason
