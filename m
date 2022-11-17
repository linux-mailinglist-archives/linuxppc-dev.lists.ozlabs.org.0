Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AB562E03B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 16:44:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCkkc4Z1rz3dtj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 02:44:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=a5RGA55J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mit.edu (client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=a5RGA55J;
	dkim-atps=neutral
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCkjd1JqQz3cGV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 02:44:03 +1100 (AEDT)
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net [173.48.120.46])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2AHFgbpU025691
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Nov 2022 10:42:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1668699767; bh=Z8eRjDyW5LkCGXRIWQ/ehJoBTxfA+rKV6G90HV/lnfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a5RGA55J01HygsEqMJNP2VrZPtI8ZaGUHt2dY2LY5wF8DMtynBL3gxe4ssBSltxUc
	 tGBtVlIBAOfcvHXP8OxNBxX/rSKyMd0+qgQqEihqLCmIIT5R91T0BV2UToxLFXN9NK
	 qLPI7qFXLd4XspU67nh5HMMeBw4NAJ1ReJokdr95mAlk7ege100zyHPP5eUMyPQkdJ
	 2J/DoKBr5ulEfGsbUWpt2b/Jh4Fgk8Q/WSHSBEMDxX6G3lCTA/GKgvoNGo91ao1O85
	 B0gVxshfsoXUb4HsVOvv2uuEHdk9gVaKkI7GIFJ0/jwX2DtNAGU82pYQXeJCXpebQn
	 9YTcylqtbCwyg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 2CB0415C34C3; Thu, 17 Nov 2022 10:42:37 -0500 (EST)
Date: Thu, 17 Nov 2022 10:42:37 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v2 3/3] treewide: use get_random_u32_between() when
 possible
Message-ID: <Y3ZWbcoGOdFjlPhS@mit.edu>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
 <20221114164558.1180362-4-Jason@zx2c4.com>
 <202211161436.A45AD719A@keescook>
 <Y3V4g8eorwiU++Y3@zx2c4.com>
 <Y3V6QtYMayODVDOk@zx2c4.com>
 <202211161628.164F47F@keescook>
 <Y3WDyl8ArQgeEoUU@zx2c4.com>
 <0EE39896-C7B6-4CB6-87D5-22AA787740A9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0EE39896-C7B6-4CB6-87D5-22AA787740A9@kernel.org>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "Darrick J . Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, ydroneaud@opteya.com, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfounda
 tion.org>, linux-mmc@vger.kernel.org, patches@lists.linux.dev, Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 16, 2022 at 04:47:27PM -0800, Kees Cook wrote:
> >> > - between
> >> > - ranged
> >> > - spanning
> >> > 
> >> > https://www.thefreedictionary.com/List-of-prepositions.htm
> >> > - amid
> >> > 
> >> > Sigh, names.
> >> 
> >> I think "inclusive" is best.
> >
> >I find it not very descriptive of what the function does. Is there one
> >you like second best? Or are you convinced they're all much much much
> >worse than "inclusive" that they shouldn't be considered?
> 
> Right, I don't think any are sufficiently descriptive. "Incluisve"
> with two arguments seems unambiguous and complete to me. :)

The problem with "between", "ranged", "spanning" is that they don't
tell the reader whether we're dealing with an "open interval" or a
"closed interval".  They are just different ways of saying that it's a
range between, say, 0 and 20.  But it doesn't tell you whether it
includes 0 or 20 or not.

The only way I can see for making it ambiguous is either to use the
terminology "closed interval" or "inclusive".  And "open" and "closed"
can have other meanings, so get_random_u32_inclusive() is going to be
less confusing than get_random_u32_closed().

Cheers,

					- Ted
