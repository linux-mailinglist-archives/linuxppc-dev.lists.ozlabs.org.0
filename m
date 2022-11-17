Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A6262CFEC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 01:44:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCLm92RPdz3cf2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 11:44:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=N4yvuS4q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=dvcg=3r=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=N4yvuS4q;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCLlG48mZz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 11:44:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6B0EDB81F5C;
	Thu, 17 Nov 2022 00:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D214C433C1;
	Thu, 17 Nov 2022 00:44:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="N4yvuS4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1668645839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o11kryBEJKQUBcciv1YGNpGcl9GzU1jQr08TEiO/WZo=;
	b=N4yvuS4qyMfxtARqyPHRBhk1SEXxz/3WJew88lI6NMO4+fa/MCaJBZuB/2QrKCXtuhKI0R
	o+j7S1e3eQB22ynfMfsCp3AmUWUXzjYsWW7wUl/69cBI5Z/naX7VjRMFejW8Owc2sNFQI3
	bMKj7v4gh+/iKlR/7cv7MrrI9ssFAS8=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 39d4929e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 17 Nov 2022 00:43:58 +0000 (UTC)
Date: Thu, 17 Nov 2022 01:43:54 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2 3/3] treewide: use get_random_u32_between() when
 possible
Message-ID: <Y3WDyl8ArQgeEoUU@zx2c4.com>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
 <20221114164558.1180362-4-Jason@zx2c4.com>
 <202211161436.A45AD719A@keescook>
 <Y3V4g8eorwiU++Y3@zx2c4.com>
 <Y3V6QtYMayODVDOk@zx2c4.com>
 <202211161628.164F47F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202211161628.164F47F@keescook>
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

On Wed, Nov 16, 2022 at 04:31:18PM -0800, Kees Cook wrote:
> On Thu, Nov 17, 2022 at 01:03:14AM +0100, Jason A. Donenfeld wrote:
> > On Thu, Nov 17, 2022 at 12:55:47AM +0100, Jason A. Donenfeld wrote:
> > > 2) What to call it:
> > >    - between I still like, because it mirrors "I'm thinking of a number
> > >      between 1 and 10 and..." that everybody knows,
> > >    - inclusive I guess works, but it's not a preposition,
> > >    - bikeshed color #3?
> > 
> > - between
> > - ranged
> > - spanning
> > 
> > https://www.thefreedictionary.com/List-of-prepositions.htm
> > - amid
> > 
> > Sigh, names.
> 
> I think "inclusive" is best.

I find it not very descriptive of what the function does. Is there one
you like second best? Or are you convinced they're all much much much
worse than "inclusive" that they shouldn't be considered?

Jason
