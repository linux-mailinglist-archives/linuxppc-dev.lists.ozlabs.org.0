Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BAF60966B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Oct 2022 23:12:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MwWBH2Grvz3byZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 08:12:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=FXNrxCWr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mit.edu (client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=FXNrxCWr;
	dkim-atps=neutral
X-Greylist: delayed 179 seconds by postgrey-1.36 at boromir; Mon, 24 Oct 2022 08:11:46 AEDT
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MwW9G6cfCz2xGJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Oct 2022 08:11:45 +1100 (AEDT)
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net [173.48.120.46])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 29NL7D2p025712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Oct 2022 17:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1666559243; bh=zbENVyGNAon7zNh9ohkJFECSMTzXRXbcNrepMHxrEAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FXNrxCWraFmMAOW+vqR38ZOexAnGjiiR9A8LdOwTHYuoNMBlL77R2zP0ktOpr83lt
	 VqRJZ2eM6bTmotP3IJ0ZjbLCm4EYxGWCpxZWFf6OGNB4ci103uHdfxC4WF6VQ2zTX/
	 sdIQ8AMmuFf2tnrWyiobYzmlMOkVIMT/l7Xfqoj9INuJk54r2BALT8VjDgqDT3Zhdd
	 VJdERnwc5/7VlgvkT7OeoHx0mHgokAaWpeUY/UYmdBjcPk3IReiiQVTczMP0A0m8lc
	 roc5e18VhoTm14PI9JdmJ03W1yO7BPKEnbbIuJ9deFvxdyuN3p81VawGcIo+Cv1H4t
	 KETGAaOyQuEfg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id BE8CB15C33A3; Sun, 23 Oct 2022 17:07:13 -0400 (EDT)
Date: Sun, 23 Oct 2022 17:07:13 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v1 0/5] convert tree to
 get_random_u32_{below,above,between}()
Message-ID: <Y1WtAZfciG1z2CC7@mit.edu>
References: <20221022014403.3881893-1-Jason@zx2c4.com>
 <20221021205522.6b56fd24@kernel.org>
 <Y1NwJJOIB4gI5G11@zx2c4.com>
 <20221021223242.05df0a5b@kernel.org>
 <Y1OD2tdVwQsydSNV@zx2c4.com>
 <20221021230322.00dd045c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021230322.00dd045c@kernel.org>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "Darrick J . Wong" <djwong@kernel.org>, linux-mips@vger.kernel.org, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph =?iso-88
 59-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 21, 2022 at 11:03:22PM -0700, Jakub Kicinski wrote:
> On Sat, 22 Oct 2022 07:47:06 +0200 Jason A. Donenfeld wrote:
> > On Fri, Oct 21, 2022 at 10:32:42PM -0700, Jakub Kicinski wrote:
> > > But whatever. I mean - hopefully there aren't any conflicts in the ~50
> > > networking files you touch. I just wish that people didn't pipe up with
> > > the tree wide changes right after the merge window. Feels like the
> > > worst possible timing.  
> > 
> > Oh, if the timing is what makes this especially worrisome, I have
> > no qualms about rebasing much later, and reposting this series then.
> > I'll do that.
> 
> Cool, thanks! I promise to not be grumpy if you repost around rc6 :)

One way of making things less painful for the stable branch and for
the upstream branch is to *add* new helpers instead of playing
replacement games like s/prandom_u32_max/get_random_u32_below/.  This
is what causes the patch conflict problems.

One advantage of at least adding the new functions to the stable
branches, even if we don't do the wholesale replacement, is that it
makes it much less likely that a backported patch, which uses the new
API, won't fail to compile --- and of course, the major headache case
is one where it's not noticed at first because it didn't get picked up
in people's test compiles until after the Linux x.y.z release has been
pushed out.

Whether it's worth doing the wholesale replacement is a different
question, but separating "add the new functions with one or two use
cases so the functions are actulaly _used_" from the "convert the
world to use the new functions" from the "remove the old functions",
might life easier.

					- Ted
