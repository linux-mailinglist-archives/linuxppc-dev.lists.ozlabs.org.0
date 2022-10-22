Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F3960849A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 07:33:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MvVPJ0CGgz3dwP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 16:33:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XiKRpGGC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XiKRpGGC;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MvVNL273Yz3bjh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Oct 2022 16:32:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 689CEB80E2A;
	Sat, 22 Oct 2022 05:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9AE7C433D6;
	Sat, 22 Oct 2022 05:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666416765;
	bh=uf/R6l7THqxM2eHX/ustV805xoE8PhYT+1NbCR1d9A0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XiKRpGGCmE/1hVye3ks4VJsdgQWl4ep8RDm+RId5IAAujaPtM2G+4i6YdPrtEB8nH
	 q1Qj8HSnwQEOWQWPR8bzNYtYmBI1rIvEGKyk/TxU5aHsFRNHSNZO56sQy1qHdU3rI9
	 U0WQ+d+xKvGWN2I6VU9wZCRGKaE4CeIj2zJodGKNkBO8/gxw10rMKSLqOi9+fm9XL2
	 aVxqSKiID3UJMx6AplycmP9wIR/o3WiE2TTEdqTvywk+wi1rvKyOtrwa5kAC+IvOzs
	 /uJLZkjhd3iv/Hr57ZGnG61GWwtYesQTjbIs3uQ9LNEHWpQYfNMZdpP0JfeK0o9opa
	 S++WYI56QMg6A==
Date: Fri, 21 Oct 2022 22:32:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v1 0/5] convert tree to
 get_random_u32_{below,above,between}()
Message-ID: <20221021223242.05df0a5b@kernel.org>
In-Reply-To: <Y1NwJJOIB4gI5G11@zx2c4.com>
References: <20221022014403.3881893-1-Jason@zx2c4.com>
	<20221021205522.6b56fd24@kernel.org>
	<Y1NwJJOIB4gI5G11@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: "Darrick J .
 Wong" <djwong@kernel.org>, linux-mips@vger.kernel.org, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, "Martin K .
 Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph =?UTF-8?B?QsO2aG13YWxkZXI=?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 22 Oct 2022 00:23:00 -0400 Jason A. Donenfeld wrote:
> > How big is it?  Can you provide a stable branch to pull in the new
> > helpers and then everyone will be able to apply the patches to their
> > subsystem?  
> 
> It's a patch. But what you suggest sounds crazy to me. Supply some
> branch and have every tree merge that branch separately, in duplicate,
> and then get all of the conversion patches through every tree, and then
> somehow coordinate the removal of the deprecated function after all of
> that, and then baby sit the grand orchestration of all this over the
> course of two and half months, watch it fail because of some
> unmaintained corner that's affected, and then try to herd it through for
> another two and a half months after that? Holy crap. That's torture.

I clean up some random networking API every couple of releases.
Unfortunately other subsystems use networking APIs too, so I have 
to do what you describe as "torture". It's not that hard in my
experience but perhaps I'm incredibly gifted. Or resilient to pain.

> Were this an actually technically interesting patchset that required
> some really detailed expert review, maybe that'd have some iota of
> merit. But this is a really boring refactoring, mostly automated with
> Coccinelle. If having to baby sit one hundred separate patches over the
> course of months, handling confusion of walking maintainers through the
> exercise of merging some weird duplicate branch into their trees before,
> and so forth, is required to get this kind of grunt work done, I'm just
> going to wind up losing all motivation for this kind of thing, and
> naturally, as a matter of human nature, stop doing it. The result will
> be that we have garbage pile up over time that operates on the principle
> of "least hassle to deal with for the time being" rather than "love of
> the code and a desire for long term maintainability and quality". The
> former is sometimes how things go. The latter is what I'm striving for.
> 
> So what you suggest sounds really dreadful to me. Sorry.
> 
> Instead, this series follows the same template as the last one, and the
> last one was much more nuanced and invasive and went fine. In the very
> worst case, it'll require me to be on the ball with what's happening
> with -next, which is something I've done before and can do again.

Not sure what you mean by "being on the ball with what's happening with
-next" surely it's Steven who'll be fixing the conflicts and paying
with his time? Or carrying extra patches because neither you will be
able to convert the new cases in your tree nor in the origin tree since
it won't have your new helpers.

To me putting the new helpers first, on a clean branch off Linus's tree
so in case of emergency it can be pulled into a random^W arbitrary tree
is just good hygiene.

But whatever. I mean - hopefully there aren't any conflicts in the ~50
networking files you touch. I just wish that people didn't pipe up with
the tree wide changes right after the merge window. Feels like the
worst possible timing.
