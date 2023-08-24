Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C73E9786F83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 14:48:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=dnmeukHg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWjYD5pfXz3cD7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 22:48:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=dnmeukHg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=treblig.org (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org)
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWjXJ54L3z2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 22:47:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=5ix2rprjqMmtg3QKk2R00SMw+sT74bDQ+N4/iHHMqXU=; b=dnmeukHg0IpApECk4SjENXZFVG
	KUteOEBdFqKrRNxed5CoWPnxZY8giGvPrABTRaDOSuyny2+UfnA2pVIdCrl2/u/aRdAEsjkopG/mS
	HboqVVQ6BnAPAKLVbftvP3Z+62G0idp7AXwiJXZgldf+0ZhbXdMkM0EXY7qV6GCVY8T/4Zom1MAkL
	G4ndnvkvw1CTixHhv2kgrSpbetL+2io/qnDGyvGZgX3/WICiFSW334TITaq1m+geD8CUoJFoh2fxQ
	T21v2pDAjWo3atPsU634ozBYUhM8IRBuiHblUpLpb1gJV84Ba/4cySexGGlIAXDVpyA1FGddZfUCs
	5wouGs+g==;
Received: from dg by mx.treblig.org with local (Exim 4.94.2)
	(envelope-from <dg@treblig.org>)
	id 1qZ9jk-008QkI-7r; Thu, 24 Aug 2023 12:46:56 +0000
Date: Thu, 24 Aug 2023 12:46:56 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3] powerpc: Use shared font data
Message-ID: <ZOdRQFKaxnKQ+s/U@gallifrey>
References: <20230812010241.529173-1-linux@treblig.org>
 <ZOY0dANP4s3L3VyX@gallifrey>
 <87msygvjvy.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87msygvjvy.fsf@mail.lhotse>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/5.10.0-23-amd64 (x86_64)
X-Uptime: 12:42:48 up 48 days, 22:14,  1 user,  load average: 0.01, 0.00, 0.00
User-Agent: Mutt/2.0.5 (2021-01-21)
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
Cc: sam@ravnborg.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michael Ellerman (mpe@ellerman.id.au) wrote:
> "Dr. David Alan Gilbert" <linux@treblig.org> writes:
> > * linux@treblig.org (linux@treblig.org) wrote:
> >> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> >> 
> >> PowerPC has a 'btext' font used for the console which is almost identical
> >> to the shared font_sun8x16, so use it rather than duplicating the data.
> >> 
> >> They were actually identical until about a decade ago when
> >>    commit bcfbeecea11c ("drivers: console: font_: Change a glyph from
> >>                         "broken bar" to "vertical line"")
> >> 
> >> which changed the | in the shared font to be a solid
> >> bar rather than a broken bar.  That's the only difference.
> >> 
> >> This was originally spotted by the PMF source code analyser, which
> >> noticed that sparc does the same thing with the same data, and they
> >> also share a bunch of functions to manipulate the data.  I've previously
> >> posted a near identical patch for sparc.
> >> 
> >> Tested very lightly with a boot without FS in qemu.
> >> 
> >> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> >
> > Hi Michael,
> >   Just checking, is there anything else I need to do here?
>    
> I felt like the lib/fonts/Kconfig change could be cleaner, but the
> existing Kconfig is not well structured for what we want to do.

Yeh that line has caused quite a bit of pain in this otherwise simple
set.

> I think at least it could be simplified to:
> 
> config FONT_SUN8x16
> 	bool "Sparc console 8x16 font"
> 	depends on (FRAMEBUFFER_CONSOLE && (FONTS || SPARC)) || BOOTX_TEXT

OK, I'll give it a go - but I wonder what else we need to test?
My version was careful not to change other arch's behaviour
on this config, I worry this might. (Although IMHO I actually think
we could just remove this entire depends, and the only reason I haven't
is because I worry what other knock on there might be).

Dave

> 
> cheers
> 
> 
> >> diff --git a/lib/fonts/Kconfig b/lib/fonts/Kconfig
> >> index c035fde66aebe..1804abe08ffe4 100644
> >> --- a/lib/fonts/Kconfig
> >> +++ b/lib/fonts/Kconfig
> >> @@ -98,7 +98,8 @@ config FONT_10x18
> >>  
> >>  config FONT_SUN8x16
> >>  	bool "Sparc console 8x16 font"
> >> -	depends on FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)
> >> +	depends on (FRAMEBUFFER_CONSOLE || BOOTX_TEXT) &&\
> >> +	           (!SPARC && FONTS || SPARC || PPC)
> >>  	help
> >>  	  This is the high resolution console font for Sun machines. Say Y.
> >>  
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
