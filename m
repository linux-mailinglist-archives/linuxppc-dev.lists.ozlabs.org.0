Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D17B260B234
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 18:44:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mx1BC5ygZz3cBn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 03:44:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=R/LWqL0H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=xank=2z=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=R/LWqL0H;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mx19D6Stbz2xgG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 03:43:28 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DC75FB81612;
	Mon, 24 Oct 2022 16:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495C4C433D7;
	Mon, 24 Oct 2022 16:43:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="R/LWqL0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1666629797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jVwnCaFZdOk86y5jBEGAHVTaPFA8qqxydDorS9HQrxk=;
	b=R/LWqL0HmERHhgI7BdwcGOaB3Q8XsPIH6B/Gdo3HJUMIuT9hwUE+2aIfUs7T5AhOI79Jt6
	d8ngYNFZKfkYsUwIv2qdXPqC/aoaC88pmme7vJsjJeVfqbHgYDfmh3RufMLuzpN+0qp8US
	fVJyhkYuwNudc5bRrrZ+Jls0DQkggGI=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 885087f8 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 24 Oct 2022 16:43:17 +0000 (UTC)
Date: Mon, 24 Oct 2022 18:43:09 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH v1 0/5] convert tree to
 get_random_u32_{below,above,between}()
Message-ID: <Y1bAnU4pCczkw5j8@zx2c4.com>
References: <20221022014403.3881893-1-Jason@zx2c4.com>
 <20221021205522.6b56fd24@kernel.org>
 <Y1NwJJOIB4gI5G11@zx2c4.com>
 <20221021223242.05df0a5b@kernel.org>
 <Y1OD2tdVwQsydSNV@zx2c4.com>
 <20221021230322.00dd045c@kernel.org>
 <Y1WtAZfciG1z2CC7@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y1WtAZfciG1z2CC7@mit.edu>
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, linux-mips@vger.kernel.org, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph =?utf-8?Q?B=C3
 =B6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Oct 23, 2022 at 05:07:13PM -0400, Theodore Ts'o wrote:
> On Fri, Oct 21, 2022 at 11:03:22PM -0700, Jakub Kicinski wrote:
> > On Sat, 22 Oct 2022 07:47:06 +0200 Jason A. Donenfeld wrote:
> > > On Fri, Oct 21, 2022 at 10:32:42PM -0700, Jakub Kicinski wrote:
> > > > But whatever. I mean - hopefully there aren't any conflicts in the ~50
> > > > networking files you touch. I just wish that people didn't pipe up with
> > > > the tree wide changes right after the merge window. Feels like the
> > > > worst possible timing.  
> > > 
> > > Oh, if the timing is what makes this especially worrisome, I have
> > > no qualms about rebasing much later, and reposting this series then.
> > > I'll do that.
> > 
> > Cool, thanks! I promise to not be grumpy if you repost around rc6 :)
> 
> One way of making things less painful for the stable branch and for
> the upstream branch is to *add* new helpers instead of playing
> replacement games like s/prandom_u32_max/get_random_u32_below/.  This
> is what causes the patch conflict problems.
> 
> One advantage of at least adding the new functions to the stable
> branches, even if we don't do the wholesale replacement, is that it

That's a good idea. I'll also save the removal commit, anyhow, for a
separate thing at the end of 6.2 rc1, so that -next doesn't have issues
either.  That's how things wound up going down for the first tranche of
these, and that worked well.

Jason
