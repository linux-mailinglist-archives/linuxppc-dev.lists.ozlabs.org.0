Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD10608B7F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 12:22:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MvcpT2NVCz3dwB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 21:22:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wOx3mp5k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wOx3mp5k;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MvcnW6x75z2xJ7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Oct 2022 21:21:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C67860AC1;
	Sat, 22 Oct 2022 10:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97FEC433D6;
	Sat, 22 Oct 2022 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666434090;
	bh=4VayhwOVTKVAjPqqz97sF96LRLG+KRcajksLHZHtUxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wOx3mp5ksWJtvhNhAOmZUG8X3+HuRkTdY9Nc7h6cWFEIxsW4svt4t9REDVX0plI4T
	 0jvG2TdFgRx98jdox1K2bPVjxSRKOYymF+6X8vmbsIcB0hIMeoD9P7/9qN6LIAT+Ko
	 fQekZTeUTocY/mdL9wRqCZaeHaw+pLcmNqIWDT+k=
Date: Sat, 22 Oct 2022 12:21:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v1 0/5] convert tree to
 get_random_u32_{below,above,between}()
Message-ID: <Y1PEJxnlY7dh4yK8@kroah.com>
References: <20221022014403.3881893-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221022014403.3881893-1-Jason@zx2c4.com>
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, linux-mips@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph =?iso-8859-1?Q?B=F6hmwalder?= <c
 hristoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 21, 2022 at 09:43:58PM -0400, Jason A. Donenfeld wrote:
> Hey everyone,
> 
> Here's the second and final tranche of tree-wide conversions to get
> random integer handling a bit tamer. It's predominantly another
> Coccinelle-based patchset.
> 
> First we s/prandom_u32_max/get_random_u32_below/, since the former is
> just a deprecated alias for the latter. Then in the next commit we can
> remove prandom_u32_max all together. I'm quite happy about finally being
> able to do that. It means that prandom.h is now only for deterministic and 
> repeatable randomness, not non-deterministic/cryptographic randomness.
> That line is no longer blurred.
> 
> Then, in order to clean up a bunch of inefficient patterns, we introduce
> two trivial static inline helper functions built on top of
> get_random_u32_below: get_random_u32_above and get_random_u32_between.
> These are pretty straight forward to use and understand. Then the final
> two patches convert some gnarly open-coded number juggling to use these
> helpers.
> 
> I've used Coccinelle for all the treewide patches, so hopefully review
> is rather uneventful. I didn't accept all of the changes that Coccinelle
> proposed, though, as these tend to be somewhat context-specific. I erred
> on the side of just going with the most obvious cases, at least this
> time through. And then we can address more complicated cases through
> actual maintainer trees.
> 
> Since get_random_u32_below() sits in my random.git tree, these patches
> too will flow through that same tree.
> 
> Regards,
> Jason


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
