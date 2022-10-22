Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D4060840A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 05:56:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MvSF20zscz3dwR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 14:56:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GETuklby;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GETuklby;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MvSD26W4jz2xDv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Oct 2022 14:55:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6DAA7B80C82;
	Sat, 22 Oct 2022 03:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79AAC433D6;
	Sat, 22 Oct 2022 03:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666410925;
	bh=89N+4GISvqQWb0Tijt5yj4RwXtZrZKRvKtcKUVVREJk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GETuklby2JHS+aXTFJaLhRgrftVC9jMoy97OABjkdd2t3NXG/XB0RcjgpMtEi3TPW
	 t25uX2D4MUeOoE2+Mje7rTtLeaXTsj71TPBZk9SADxS9KlYEW7+9SmDOiGYQlqm4N9
	 zWSbG9s5Zk5A2tKzkHGSMdV7wNowrrOt1NEwWyz6pxQCX238qjHaDM/fo67zs9yliy
	 iMHN839RU8fHVz8V1o0KqSlUe+jdJCA3eYc8eIFj8eKhelndFPxf1fDe9SyVZ6oGwu
	 aIoffChdbww4TvCiA1GR2ATkrR9THIve5f/l4GrAqaPxMcn6amarxedSWqtBaOE+7y
	 2QJD3oNb/sKXg==
Date: Fri, 21 Oct 2022 20:55:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v1 0/5] convert tree to
 get_random_u32_{below,above,between}()
Message-ID: <20221021205522.6b56fd24@kernel.org>
In-Reply-To: <20221022014403.3881893-1-Jason@zx2c4.com>
References: <20221022014403.3881893-1-Jason@zx2c4.com>
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

On Fri, 21 Oct 2022 21:43:58 -0400 Jason A. Donenfeld wrote:
> Since get_random_u32_below() sits in my random.git tree, these patches
> too will flow through that same tree.

How big is it?  Can you provide a stable branch to pull in the new
helpers and then everyone will be able to apply the patches to their
subsystem?

