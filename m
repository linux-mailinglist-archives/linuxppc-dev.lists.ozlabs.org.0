Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9F862D818
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 11:36:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCbtj2WgHz3dvM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 21:36:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=vf0GDy8l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=vf0GDy8l;
	dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCbsl0wB2z3bbB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 21:35:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2BgNwLdh+HBA4xrzyykRGd8e3nHfE6jHoZjPyIO7tQ8=; b=vf0GDy8lKzIs95KZT9hTDN9bLB
	KkkakBOovK/EhU72ZwXcJFd6ZXnYeh5hWZFAO+QwAUy+Iil38BRQKWQA/ovqtD2R3k/zIRWUVleNY
	mI6EufB0EHT9QlEKH1MxQI8dlYgzNxWxQ/KJJ0HUSUpP7NgTBBgzbRiK7voh4pixtxFai3XdS+4CH
	KUkR3sQ10UY1J1DLrBw2+xk4ToBWEQq3GT1Ou599VPaU5ywBw9TAIVKjU75NdNZTSPprpMUx5CQP1
	Y51nu+1iINv9JXk8aPYDqbEhMoPEahldPraSq7QM6Racs8sRYiTunUTXpT5cPjddHYjb4UQdEZEgF
	MxQo2C5A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35306)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ovcCQ-0004Iz-Pt; Thu, 17 Nov 2022 10:32:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ovcCG-0006jE-Em; Thu, 17 Nov 2022 10:32:40 +0000
Date: Thu, 17 Nov 2022 10:32:40 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2 3/3] treewide: use get_random_u32_between() when
 possible
Message-ID: <Y3YNyJ8oeixYuvdI@shell.armlinux.org.uk>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
 <20221114164558.1180362-4-Jason@zx2c4.com>
 <202211161436.A45AD719A@keescook>
 <Y3V4g8eorwiU++Y3@zx2c4.com>
 <Y3WW2lOgoYLKQeve@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3WW2lOgoYLKQeve@zx2c4.com>
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, ydroneaud@opteya.com, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org, patches@l
 ists.linux.dev, Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 17, 2022 at 03:05:14AM +0100, Jason A. Donenfeld wrote:
> On Thu, Nov 17, 2022 at 12:55:47AM +0100, Jason A. Donenfeld wrote:
> > 1) How/whether to make f(0, UR2_MAX) safe,
> >    - without additional 64-bit arithmetic,
> >    - minimizing the number of branches.
> >    I have a few ideas I'll code golf for a bit.
> > I think I can make progress with (1) alone by fiddling around with
> > godbolt enough, like usual.
> 
> The code gen is definitely worse.
> 
> Original half-open interval:
> 
>     return floor + get_random_u32_below(ceil - floor);
> 
> Suggested fully closed interval:
> 	
>     ceil = ceil - floor + 1;
>     return likely(ceil) ? floor + get_random_u32_below(ceil) : get_random_u32();

How many of these uses are going to have ceil and floor as a variable?
If they're constants (e.g. due to being in an inline function with
constant arguments) then the compiler will optimise all of the above
and the assembly code will just be either:

1. a call to get_random_u32()
2. a call to get_random_u32_below() and an addition.

If one passes ceil or floor as a variable, then yes, the code gen is
going to be as complicated as you suggest above.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
