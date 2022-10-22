Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6936084E5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 08:04:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MvW4b3K7jz3dwJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 17:04:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LGS4FPjZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LGS4FPjZ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MvW3j35LPz3bjD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Oct 2022 17:03:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8DA6EB80EA7;
	Sat, 22 Oct 2022 06:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12E6C433C1;
	Sat, 22 Oct 2022 06:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666418605;
	bh=tCXdIEe/bRuPmuD8DZJI7sITbkxpBfee1t0FtUrlE1s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LGS4FPjZ0GenPE80Ht65ggEck6bgj5dMaBGUbmI1p5KIioZcU/U0B3w+tI1Dn25rx
	 llIng6acUhVuJ/HM4vaBISzwQ0bzbS9XtQmJ0Vcv4gBrkA4Yvn+Z2n4iaDXSOr93lP
	 6kE0ELPCFel8IWbq2XeR8VABeZZKCK5yTtr8p63JXPEROgpP0teOCA5RybzOekIHey
	 WO01JaNbJ4vidygloxS7RXdQaKTXIlWeMJqqphRYpzZR07P/w8/CEUZljrbdPYJwK0
	 sq4K9MbjRVh/iSW4OILqP9q7FbHb8Bp51AV9w0kHCsF0BcDX0ybnQzP/gy7AmQZBK5
	 pdal5+51PPfEA==
Date: Fri, 21 Oct 2022 23:03:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v1 0/5] convert tree to
 get_random_u32_{below,above,between}()
Message-ID: <20221021230322.00dd045c@kernel.org>
In-Reply-To: <Y1OD2tdVwQsydSNV@zx2c4.com>
References: <20221022014403.3881893-1-Jason@zx2c4.com>
	<20221021205522.6b56fd24@kernel.org>
	<Y1NwJJOIB4gI5G11@zx2c4.com>
	<20221021223242.05df0a5b@kernel.org>
	<Y1OD2tdVwQsydSNV@zx2c4.com>
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, linux-mips@vger.kernel.org, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph =?UTF-8?B?QsO2aG1
 3YWxkZXI=?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 22 Oct 2022 07:47:06 +0200 Jason A. Donenfeld wrote:
> On Fri, Oct 21, 2022 at 10:32:42PM -0700, Jakub Kicinski wrote:
> > But whatever. I mean - hopefully there aren't any conflicts in the ~50
> > networking files you touch. I just wish that people didn't pipe up with
> > the tree wide changes right after the merge window. Feels like the
> > worst possible timing.  
> 
> Oh, if the timing is what makes this especially worrisome, I have
> no qualms about rebasing much later, and reposting this series then.
> I'll do that.

Cool, thanks! I promise to not be grumpy if you repost around rc6 :)
