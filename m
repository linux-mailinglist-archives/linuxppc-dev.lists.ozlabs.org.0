Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F0D62E7DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 23:11:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCvK66Fq5z3dvY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 09:11:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Q4bD/XUA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=dvcg=3r=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Q4bD/XUA;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCvJ872gyz2yHc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 09:11:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 069D3B82208;
	Thu, 17 Nov 2022 22:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D29BC433C1;
	Thu, 17 Nov 2022 22:10:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Q4bD/XUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1668723055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJhj9Z3si41Okh7QjFL8sfRqIMi0Yk5+ouF0KwmQggU=;
	b=Q4bD/XUAYdzoxgYLg+XIn4Lk+1x+8orB3IGL4+URLKCwS8OvQEFHtcJHobQ1IjE5hZQeq5
	VnSTrX5zHZ2fE16n1KLU+eanYkc3vTgMFIfA+ELQ9AAw9UvTlkFM7FU8Z1ElmoQ046TyID
	RHhzi0IVhFVn9STyoQTnIxbYkGv6Iw8=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1cf8d90d (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 17 Nov 2022 22:10:54 +0000 (UTC)
Date: Thu, 17 Nov 2022 23:10:50 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v3 3/3] treewide: use get_random_u32_inclusive() when
 possible
Message-ID: <Y3axaspOlt/oEDhw@zx2c4.com>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
 <20221117202906.2312482-1-Jason@zx2c4.com>
 <20221117202906.2312482-4-Jason@zx2c4.com>
 <202211171349.F42BA5B0@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202211171349.F42BA5B0@keescook>
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, patches@lists.linux.dev, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org, linux-media@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Chr
 istoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 17, 2022 at 01:57:13PM -0800, Kees Cook wrote:
> The only comment I have is that maybe these cases can just be left as-is
> with _below()?
> 
> > -             size_t len = get_random_u32_below(rs) + gs;
> > +             size_t len = get_random_u32_inclusive(gs, rs + gs - 1);
> 
> It seems like writing it in the form of base plus [0, limit) is clearer?
> 
> 		size_t len = gs + get_random_u32_below(rs);
> 
> But there is only a handful, so *shrug*

Okay, I'll drop that one.

Jason
