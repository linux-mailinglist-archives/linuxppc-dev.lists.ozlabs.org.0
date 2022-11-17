Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B291162E17F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 17:21:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NClXJ4dp3z3cMk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 03:21:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=ShJChEFk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=dvcg=3r=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=ShJChEFk;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NClWM26Mcz2yxc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 03:20:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5411A6219E;
	Thu, 17 Nov 2022 16:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59CEC433B5;
	Thu, 17 Nov 2022 16:20:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ShJChEFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1668702005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yXReeGYWAkNsw4+UICMYAUFCUliJi8syMU+jrBjtN+I=;
	b=ShJChEFkS/WoLTYTfqnIoulaJEVDjPgHlBF73vJKzecwUuNaBWaxad+1izxyXu6Exw/TaA
	5irR4sihjVzoDK1KiXvBd2OBPvvMwotSdLzvfkIJeE7XNMY72JeeG28zUlT5pyaHmBsZk0
	JQ9ybm2sWtI6GOjvOwFIenKMBQ/9L7c=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d3e36533 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 17 Nov 2022 16:20:04 +0000 (UTC)
Date: Thu, 17 Nov 2022 17:19:52 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH v2 3/3] treewide: use get_random_u32_between() when
 possible
Message-ID: <Y3ZfKHTHWUkdZIMt@zx2c4.com>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
 <20221114164558.1180362-4-Jason@zx2c4.com>
 <202211161436.A45AD719A@keescook>
 <Y3V4g8eorwiU++Y3@zx2c4.com>
 <Y3V6QtYMayODVDOk@zx2c4.com>
 <202211161628.164F47F@keescook>
 <Y3WDyl8ArQgeEoUU@zx2c4.com>
 <0EE39896-C7B6-4CB6-87D5-22AA787740A9@kernel.org>
 <Y3ZWbcoGOdFjlPhS@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y3ZWbcoGOdFjlPhS@mit.edu>
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
Cc: Kees Cook <kees@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, ydroneaud@opteya.com, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-mmc@vger.kernel.org, patches@lists.linux.dev, Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 17, 2022 at 10:42:37AM -0500, Theodore Ts'o wrote:
> On Wed, Nov 16, 2022 at 04:47:27PM -0800, Kees Cook wrote:
> > >> > - between
> > >> > - ranged
> > >> > - spanning
> > >> > 
> > >> > https://www.thefreedictionary.com/List-of-prepositions.htm
> > >> > - amid
> > >> > 
> > >> > Sigh, names.
> > >> 
> > >> I think "inclusive" is best.
> > >
> > >I find it not very descriptive of what the function does. Is there one
> > >you like second best? Or are you convinced they're all much much much
> > >worse than "inclusive" that they shouldn't be considered?
> > 
> > Right, I don't think any are sufficiently descriptive. "Incluisve"
> > with two arguments seems unambiguous and complete to me. :)
> 
> The problem with "between", "ranged", "spanning" is that they don't
> tell the reader whether we're dealing with an "open interval" or a
> "closed interval".  They are just different ways of saying that it's a
> range between, say, 0 and 20.  But it doesn't tell you whether it
> includes 0 or 20 or not.
> 
> The only way I can see for making it ambiguous is either to use the
> terminology "closed interval" or "inclusive".  And "open" and "closed"
> can have other meanings, so get_random_u32_inclusive() is going to be
> less confusing than get_random_u32_closed().

Alright, that about settles it then. I'll re-roll.

Jason
