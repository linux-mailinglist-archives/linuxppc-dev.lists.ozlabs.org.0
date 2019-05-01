Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89047105AE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 09:06:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44v8Z40wmLzDqSf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 17:06:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="LUFDtgkh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JT1mxwUJ"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44v8Xh23vKzDqHq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 17:04:51 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 56FEE575;
 Wed,  1 May 2019 03:04:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 01 May 2019 03:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 8sKnl7/rBgZD6ViKOUA7iuC1Sja05lkEBS/a1jGjHFA=; b=LUFDtgkhwe+b6WOp
 68G8c7qvntquYP/Iuq3v9mtZ4UuVH9MEwkdR8jX8fibo7Vd7YlqauN8C94uSbwEm
 QOfin1TBmC+EZfFINupdCbTL4hXHYSMqh8UwqI8TZ1zVYo1VJd0zBW5SvznNPLab
 sJbR/ijmSA6zMDpQ55fJIZEADHgmgJWC0gopEHbew0G3m/BfQmKtNTQjNztJGA20
 f92ZyTWX/waK+Qj4b3CmLvnS1E2wc0eQJWWqT63IVcE3p9BD2dLBGm16gf7xleYB
 TG5MySTVex6rwi5IrhYSlUpUL89ebh9XgPFeMEaJUHfTm7BaZF6YMAGRih8uUcVR
 3p+LJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=8sKnl7/rBgZD6ViKOUA7iuC1Sja05lkEBS/a1jGjH
 FA=; b=JT1mxwUJ8cupobmdT7v5qv/Q1KTC7nM92l70/VWpTyfiwjoAIXksW5u68
 XDqZJJGoTrczPJINs/vW2Q3OdsySPA5LfXTicS3nLjDB17WhdJNME6E2f8h+DKEn
 iKWWvfvdaQYbdCEdYixuAQpy7Z3fk9Z78qeenUTRvmeevQCTilnYpFIdI7tQTWPX
 UB2rvbJ9PCZsXr4Q8c8ExUe0Mv2+4bAr3mMomRwgOSKN0HQtgzmczigDnB5DacKw
 MEcbBUpPnGQY8lOLNNtkGGct0e8dcARdiXcJb6jk/+rnqwJb93CTY9/43sqjztaH
 0kaLWitpmfMkEJsKBcw5zPEtnUsUw==
X-ME-Sender: <xms:EEXJXCJJ55mgclpLDl9KvfTxqYvdnz_DZIEOrInhpzuhW026oB5Npg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieeigdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfedtmdenucfjughrpefkuffhvfffjghftggfggfgsehtkeertddt
 reejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhush
 hsvghllhdrtggtqeenucfkphepuddvvddrleelrdekvddruddtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggtnecuvehluhhsthgvrhfuih
 iivgeptd
X-ME-Proxy: <xmx:EEXJXAs0nJKsvNALQPY2Ve_tMSVydnsfhnvL54a8MxdI_sCsZGg04g>
 <xmx:EEXJXAKUhO4KX9sFGFWEqdD0SfeLYI4dpFW2lXb63ZF6YWrDo7RFog>
 <xmx:EEXJXHm0aAzNtUFp-FR6JkGmRn6AdjbdfMX6fqDs6IbFIvr2nlhPvA>
 <xmx:EEXJXMQ6GkosMbzQOzoxIwgPbblLU52CragxKlfNHFXDLIM3CjZaLg>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id E4DFE103CA;
 Wed,  1 May 2019 03:04:45 -0400 (EDT)
Message-ID: <ca5e1db5fca5c12ca69d7810d575a437ae39ec87.camel@russell.cc>
Subject: Re: [PATCH 2/2] powerpc/mm: Warn if W+X pages found on boot
From: Russell Currey <ruscur@russell.cc>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 01 May 2019 17:04:42 +1000
In-Reply-To: <8e659a8f-af3f-e889-3f7a-560178c1f7b1@c-s.fr>
References: <20190424063958.24559-1-ruscur@russell.cc>
 <20190424063958.24559-2-ruscur@russell.cc>
 <8e659a8f-af3f-e889-3f7a-560178c1f7b1@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Julia.Lawall@lip6.fr, rashmica.g@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-04-24 at 09:14 +0200, Christophe Leroy wrote:
> 
> Le 24/04/2019 à 08:39, Russell Currey a écrit :
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
> >   arch/powerpc/Kconfig.debug         | 19 +++++++++++++++
> >   arch/powerpc/include/asm/pgtable.h |  5 ++++
> >   arch/powerpc/mm/pgtable_32.c       |  5 ++++
> >   arch/powerpc/mm/pgtable_64.c       |  5 ++++
> >   arch/powerpc/mm/ptdump/ptdump.c    | 38
> > ++++++++++++++++++++++++++++++
> >   5 files changed, 72 insertions(+)
> > 
> > diff --git a/arch/powerpc/Kconfig.debug
> > b/arch/powerpc/Kconfig.debug
> > index 4e00cb0a5464..a4160ff02ed4 100644
> > --- a/arch/powerpc/Kconfig.debug
> > +++ b/arch/powerpc/Kconfig.debug
> > @@ -361,6 +361,25 @@ config PPC_PTDUMP
> >   
> >   	  If you are unsure, say N.
> >   
> > +config DEBUG_WX
> 
> I would call it PPC_DEBUG_WX to avoid confusion.

It's the same functionality as on other architectures and is an arch-
local thing, I personally think it should be left as-is but given we
already put the PPC prefix on PTDUMP, I'll add it so it's consistent

<snip>

> > +	if (radix_enabled())
> > +		st.start_address = PAGE_OFFSET;
> > +	else
> +		st.start_address = KERN_VIRT_START;
>
> KERN_VIRT_START doesn't exist on PPC32.
> 
> Christophe
> 
Thanks a lot for the review!  Applied all your suggestions.  What
should I use on PPC32 instead?

- Russell

