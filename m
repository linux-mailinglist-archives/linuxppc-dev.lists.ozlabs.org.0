Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D30ED5996
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 04:38:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46s2my64qzzDqSx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 13:38:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="KTjjCxHh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="w/l9fZx3"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46s2l36zSyzDqPy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 13:37:03 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E472F2FD;
 Sun, 13 Oct 2019 22:36:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sun, 13 Oct 2019 22:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
 t5nuBRtp7xovMqn6s3e4o50CTo3WgPcK1r+jGdzfIWY=; b=KTjjCxHhV9bZvhYh
 lsUYOtPOmwGm/i0rbIJaFuQCBMeuakbVGChYy35uuOZmi/v8qUqY3wF+Iqa63wnT
 kov5gH0uSrPF9C3ZF29v6QIZ+EXog8nuMCtwZHWkJBq2Tc8cdOljRGXMXMBVBKaf
 Ws1te24d49c0rIM1FSlghMVFKvXLRs7sWAu8P9/+NaWKt9GY1Vv2GjIybPXdNmxo
 0i7NDSkvE7gToGQ+nx5ApY5qbYgqdgTgg5yDCRsWp2RGVfxNgo3itFzUfJaib9fm
 Yz88SdRgIP8rvdCekd5X4fqqQATMjzdfDY6nWZ57BtoGRKH6S+KDKRj2njl+4xJL
 rdq0tA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=t5nuBRtp7xovMqn6s3e4o50CTo3WgPcK1r+jGdzfI
 WY=; b=w/l9fZx3nYXf0vItp4gEBkplPbh0yN0vSVsCqUpcbnkUecaKO99+dKX8/
 gOqrHL9wqdKSIPxBslx0ydalU6hEp5DuGcmpypyHT3txy1eyCsb0+3aWjZTWsC3a
 EyV7o6H5/ToPiH6MLoXniP+cRrvTl3pTpheODQ58yOYAYk2WsdOU2J+BQvGDFATm
 s9uj9vR1/PB9xNS6iy7mtyyfmYyvo/a26QuZ0y7aJi5Rcv3ZGADUiZ6JQjvUyfHq
 OC/bpNG6esb1OxHSVFKs2hec95W9UQTvwGYEeGRCth4SJkREJXRFFWscSLFubxFW
 vix02+32ZCCqgbTvbl3nj1iypbgpA==
X-ME-Sender: <xms:St-jXd11y-pxb697bxI3XFxfjA4Arbk0IZY1wX9lsjaDzsrTCtlafQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjedtgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdeftddmnecujfgurhepkffuhffvffgjfhgtfggggfesthekredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecukfhppeduvddvrdelledrkedvrddutdenucfrrghrrghmpehmrghi
 lhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttgenucevlhhushhtvghrufhiii
 gvpedt
X-ME-Proxy: <xmx:St-jXTqn_PayRUWbdqjhaLkjoNTLYWuGPjcWj_dVBU05A6Px9Xio9A>
 <xmx:St-jXXTTlBmH8q3h3ICTmSaVWtbCe8kWeJShZMFAe503Mby9VAGU7g>
 <xmx:St-jXTqorU3A1j0KWnFjfuHGg-huAyDXVcoejrKiAOmw9h5ivCfFfw>
 <xmx:S9-jXXmb8nLcmP8xKqIb2eH_Ofz_IDa5-2R94Y52yVFMuUt34MRq_w>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id A7294D60057;
 Sun, 13 Oct 2019 22:36:55 -0400 (EDT)
Message-ID: <764cfbeb7233e3532a89820ff7cb242531aa63ea.camel@russell.cc>
Subject: Re: [PATCH v3 3/4] powerpc/mm/ptdump: debugfs handler for W+X
 checks at runtime
From: Russell Currey <ruscur@russell.cc>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 14 Oct 2019 13:36:52 +1100
In-Reply-To: <665bacec-036f-f392-7e0f-95a57b0a7d22@c-s.fr>
References: <20191004075050.73327-1-ruscur@russell.cc>
 <20191004075050.73327-4-ruscur@russell.cc>
 <665bacec-036f-f392-7e0f-95a57b0a7d22@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1 
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, joel@jms.id.au, rashmica.g@gmail.com,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-10-08 at 08:21 +0200, Christophe Leroy wrote:
> 
> Le 04/10/2019 à 09:50, Russell Currey a écrit :
> > Very rudimentary, just
> > 
> > 	echo 1 > [debugfs]/check_wx_pages
> > 
> > and check the kernel log.  Useful for testing strict module RWX.
> > 
> > Also fixed a typo.
> > 
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > ---
> >   arch/powerpc/mm/ptdump/ptdump.c | 31 +++++++++++++++++++++++++---
> > ---
> >   1 file changed, 25 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/powerpc/mm/ptdump/ptdump.c
> > b/arch/powerpc/mm/ptdump/ptdump.c
> > index 2f9ddc29c535..0547cd9f264e 100644
> > --- a/arch/powerpc/mm/ptdump/ptdump.c
> > +++ b/arch/powerpc/mm/ptdump/ptdump.c
> > @@ -4,7 +4,7 @@
> >    *
> >    * This traverses the kernel pagetables and dumps the
> >    * information about the used sections of memory to
> > - * /sys/kernel/debug/kernel_pagetables.
> > + * /sys/kernel/debug/kernel_page_tables.
> >    *
> >    * Derived from the arm64 implementation:
> >    * Copyright (c) 2014, The Linux Foundation, Laura Abbott.
> > @@ -409,16 +409,35 @@ void ptdump_check_wx(void)
> >   	else
> >   		pr_info("Checked W+X mappings: passed, no W+X pages
> > found\n");
> >   }
> > +
> > +static int check_wx_debugfs_set(void *data, u64 val)
> > +{
> > +	if (val != 1ULL)
> > +		return -EINVAL;
> > +
> > +	ptdump_check_wx();
> > +
> > +	return 0;
> > +}
> > +
> > +DEFINE_SIMPLE_ATTRIBUTE(check_wx_fops, NULL, check_wx_debugfs_set,
> > "%llu\n");
> >   #endif
> >   
> >   static int ptdump_init(void)
> >   {
> > -	struct dentry *debugfs_file;
> > -
> >   	populate_markers();
> >   	build_pgtable_complete_mask();
> > -	debugfs_file = debugfs_create_file("kernel_page_tables", 0400,
> > NULL,
> > -			NULL, &ptdump_fops);
> > -	return debugfs_file ? 0 : -ENOMEM;
> > +
> > +	if (!debugfs_create_file("kernel_page_tables", 0400, NULL,
> > +				 NULL, &ptdump_fops))
> > +		return -ENOMEM;
> > +
> > +#ifdef CONFIG_PPC_DEBUG_WX
> > +	if (!debugfs_create_file("check_wx_pages", 0200, NULL,
> > +				 NULL, &check_wx_fops))
> > +		return -ENOMEM;
> > +#endif
> 
> The above seems to be completely independant from everything else in 
> ptdump_init().
> 
> Could we avoid this #ifdef block inside ptdump_init() by creating a 
> selfstanding device_initcall() for that through a function called 
> ptdump_check_wx_init() defined inside the same #ifdef block as 
> ptdump_check_wx() ?

Yes that would be nicer, thanks

> 
> Christophe
> 
> > +
> > +	return 0;
> >   }
> >   device_initcall(ptdump_init);
> > 

