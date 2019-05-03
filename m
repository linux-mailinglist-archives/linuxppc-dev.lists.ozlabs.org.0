Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AD3125DE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 02:56:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wDGv2HTVzDqXB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 10:56:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="mcqoaD00"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="4JAy1yuV"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wDFR1q1FzDqLB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 10:55:23 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A151F5A7;
 Thu,  2 May 2019 20:55:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 02 May 2019 20:55:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 UEIQv5LWUL+GdzdBZmIUWxKe8JPzQq56Ac0tlzTHnmo=; b=mcqoaD00l8Bq5jg9
 c8/pGIJXC4LbJgoP/uNi9ugl5TmECbHjDCoQrrtOWOaPAzrPjVM0h3Gp4l0FWVaZ
 noTOpwY21mXM+SgIsPY4jRDAzFAFI9I9LjvkA7JuWI252QfPhznb7mfI2A7T58kB
 mTnejxJDVv3DMbL6/vvUm6Eab1lDACqzukXwXfCBXWzbbysrUMEphSEZOUlAAmzq
 E/KEx+syH+lB6x9a3Ivo5eYSKI4K2vatwIWK2C6lYcG+kszHs5Bewbq5uGK8ab8i
 2AigP6tzBBo8gfk1bvF7Lh/FqF/EU4ESvXU1xrlSRF5ijhZKyBCg+RCnaJoJpW+K
 2kHxZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=UEIQv5LWUL+GdzdBZmIUWxKe8JPzQq56Ac0tlzTHn
 mo=; b=4JAy1yuV7+ziviIt7hM1Zsc+bpr5Nei9inJKjIPAWz9/eZNDKiT1o60P1
 GXCPAnI8P2mufJRGwsnu+LDrTYTFZPcWQvFtQxup7jaPAGxerPCTTPe7nJFM/QSb
 zLae9PVfMjk8UXt7t3z3gk512zBCjt+OIGlnkZvlHf5HTtijjeVVADx7ppIE9mGW
 CQiNwNOpurVQkV40Jf4eSVjGFMpUFBWuBQNffMsZgsS7HcwFGYpXKDborIS8dVpI
 s40M16mzoHf5SBGpY9s8Qd26qFSEaupctHEGcT4z+uc+D7bb5GjRu0v31j66MKl9
 f/4DGanTWzV2r9ZAi/njooGGZO0+A==
X-ME-Sender: <xms:d5HLXGm9iAzGeXRxMNExnBvs2PKhlhmMHj4A3aZ-4fjvt2aV0ARW5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjedtgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdeftddmnecujfgurhepkffuhffvffgjfhgtfggggfesthejredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecukfhppeduvddvrdelledrkedvrddutdenucfrrghrrghmpehmrghi
 lhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttgenucevlhhushhtvghrufhiii
 gvpedt
X-ME-Proxy: <xmx:d5HLXGFWla6Ck7CM6dNhiRN5KA8i_gbiBFieqprXwTadhwNVVk6XKA>
 <xmx:d5HLXCdQB8joxLe7s_dRc56UUNItvVKBNqlgcBcxso_EAo4oApuIXg>
 <xmx:d5HLXPhu7ceq9cA8XFnL59NzzXzTx61ZfBqnPlXu0ycTC4ReL8ed0Q>
 <xmx:eJHLXOcGzl1E_8KMFp0iAjDGc75Z_X7XkKgczjYitB5A-TbogUw43w>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 75146103D4;
 Thu,  2 May 2019 20:55:17 -0400 (EDT)
Message-ID: <5074405df506970edc7c3fe7604bc60f345163eb.camel@russell.cc>
Subject: Re: [PATCH v2 2/2] powerpc/mm: Warn if W+X pages found on boot
From: Russell Currey <ruscur@russell.cc>
To: Joel Stanley <joel@jms.id.au>
Date: Fri, 03 May 2019 10:55:13 +1000
In-Reply-To: <CACPK8XeGD85Yt1bZvuDo4LnYwn0xg15eDJoOep1JC3bg0s0uXA@mail.gmail.com>
References: <20190502073947.6481-1-ruscur@russell.cc>
 <20190502073947.6481-2-ruscur@russell.cc>
 <CACPK8XeGD85Yt1bZvuDo4LnYwn0xg15eDJoOep1JC3bg0s0uXA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
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
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Rashmica Gupta <rashmica.g@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-05-03 at 00:37 +0000, Joel Stanley wrote:
> On Thu, 2 May 2019 at 07:42, Russell Currey <ruscur@russell.cc>
> wrote:
> > Implement code to walk all pages and warn if any are found to be
> > both
> > writable and executable.  Depends on STRICT_KERNEL_RWX enabled, and
> > is
> > behind the DEBUG_WX config option.
> > 
> > This only runs on boot and has no runtime performance implications.
> > 
> > Very heavily influenced (and in some cases copied verbatim) from
> > the
> > ARM64 code written by Laura Abbott (thanks!), since our ptdump
> > infrastructure is similar.
> > 
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > ---
> > v2: A myriad of fixes and cleanups thanks to Christophe Leroy
> > 
> >  arch/powerpc/Kconfig.debug         | 19 ++++++++++++++
> >  arch/powerpc/include/asm/pgtable.h |  6 +++++
> >  arch/powerpc/mm/pgtable_32.c       |  3 +++
> >  arch/powerpc/mm/pgtable_64.c       |  3 +++
> >  arch/powerpc/mm/ptdump/ptdump.c    | 41
> > +++++++++++++++++++++++++++++-
> >  5 files changed, 71 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/Kconfig.debug
> > b/arch/powerpc/Kconfig.debug
> > index 4e00cb0a5464..9e8bcddd8b8f 100644
> > --- a/arch/powerpc/Kconfig.debug
> > +++ b/arch/powerpc/Kconfig.debug
> > @@ -361,6 +361,25 @@ config PPC_PTDUMP
> > 
> >           If you are unsure, say N.
> > 
> > +config PPC_DEBUG_WX
> 
> The other architectures call this DEBUG_WX, in case you wanted to
> name
> it the same.

I did originally, I changed it since we have PPC_PTDUMP but I don't
really care either way.  mpe can change it if he wants

> 
> > +       bool "Warn on W+X mappings at boot"
> > +       select PPC_PTDUMP
> > +       help
> > +         Generate a warning if any W+X mappings are found at boot.

