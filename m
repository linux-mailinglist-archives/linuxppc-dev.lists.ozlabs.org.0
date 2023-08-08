Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A99D774EEA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 01:03:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=lQmkV5ot;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RL7yn6QpMz3cHr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 09:03:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=lQmkV5ot;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=treblig.org (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org)
Received: from mx.treblig.org (unknown [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RL7xs0XvHz2ygr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Aug 2023 09:02:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=ZDALvFIak3dkZOLuYlAfhCehu+RJYBfHhd0fnnY5iiM=; b=lQmkV5otXwlM+J8rAPsEoNdtCF
	xoZwrZIr017/bMTJyGOmuYGk8HEv+3Wvj5QSDylQVNIa9czH2B8sVY9zAk9hn/ExIi7rZHK4pJCfh
	8t+BzfDUpkjH60ulN6vn9LJLnxlNr82hUwc4ON+R4qSOZEvUIBPcf+jOZgkrhbWhDU60WZjztd1Kh
	z5rGNuwFfK4hgnFUy6JZR02eghvMqR8eKk/p3cwmWbrv0BlFX3iHSRwAsv9WeECDl04JwVqlqfsHT
	Z67ih3nULPu7qYiohBTtz8cCzV9FdOGR5c4HgBcI3JhcGSBDZyBIZBFSMvE7dFEMkOkjrfyKMft+0
	H+TwAbqg==;
Received: from dg by mx.treblig.org with local (Exim 4.94.2)
	(envelope-from <dg@treblig.org>)
	id 1qTViY-005rPc-MU; Tue, 08 Aug 2023 23:02:22 +0000
Date: Tue, 8 Aug 2023 23:02:22 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] powerpc: Use shared font data
Message-ID: <ZNLJfgD5HDz3yief@gallifrey>
References: <20230807010721.799613-1-linux@treblig.org>
 <828497a6-80c2-329f-8b47-2311bf08943d@infradead.org>
 <ZNJ7QzfA/GSgahmf@gallifrey>
 <8599e99b-ad80-abf8-ad40-4cb8262f047a@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <8599e99b-ad80-abf8-ad40-4cb8262f047a@infradead.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/5.10.0-23-amd64 (x86_64)
X-Uptime: 23:01:22 up 33 days,  8:32,  1 user,  load average: 0.04, 0.04, 0.00
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
Cc: sam@ravnborg.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Randy Dunlap (rdunlap@infradead.org) wrote:
> 
> 
> On 8/8/23 10:28, Dr. David Alan Gilbert wrote:
> > * Randy Dunlap (rdunlap@infradead.org) wrote:
> >> Hi--
> >>
> >> On 8/6/23 18:07, linux@treblig.org wrote:
> >>> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> >>>
> >>> PowerPC has a 'btext' font used for the console which is almost identical
> >>> to the shared font_sun8x16, so use it rather than duplicating the data.
> >>>
> >>> They were actually identical until about a decade ago when
> >>>    commit bcfbeecea11c ("drivers: console: font_: Change a glyph from
> >>>                         "broken bar" to "vertical line"")
> >>>
> >>> which changed the | in the shared font to be a solid
> >>> bar rather than a broken bar.  That's the only difference.
> >>>
> >>> This was originally spotted by PMD which noticed that sparc does
> >>> the same thing with the same data, and they also share a bunch
> >>> of functions to manipulate the data.  I've previously posted a near
> >>> identical patch for sparc.
> >>>
> >>> One difference I notice in PowerPC is that there are a bunch of compile
> >>> options for the .c files for the early code to avoid a bunch of security
> >>> compilation features;  it's not clear to me if this is a problem for
> >>> this font data.
> >>>
> >>> Tested very lightly with a boot without FS in qemu.
> >>>
> >>> v2
> >>>   Added 'select FONT_SUPPORT' (to stop modconfig causing the font to be
> >>>    linked into a module rather than the main kernel)
> >>>   Added 'select FONTS' to satisfy requirements in lib/fonts
> >>>
> >>> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> >>> ---
> >>>  arch/powerpc/Kconfig.debug  |   3 +
> >>>  arch/powerpc/kernel/btext.c | 360 +-----------------------------------
> >>>  2 files changed, 9 insertions(+), 354 deletions(-)
> >>>
> >>> diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
> >>> index 2a54fadbeaf51..521c4baf30e88 100644
> >>> --- a/arch/powerpc/Kconfig.debug
> >>> +++ b/arch/powerpc/Kconfig.debug
> >>> @@ -147,6 +147,9 @@ config BDI_SWITCH
> >>>  config BOOTX_TEXT
> >>>  	bool "Support for early boot text console (BootX or OpenFirmware only)"
> >>>  	depends on PPC_BOOK3S
> >>> +	select FONT_SUN8x16
> >>> +	select FONT_SUPPORT
> >>> +	select FONTS
> >>>  	help
> >>>  	  Say Y here to see progress messages from the boot firmware in text
> >>>  	  mode. Requires either BootX or Open Firmware.
> >>
> >> kconfig tells me:
> >>
> >> WARNING: unmet direct dependencies detected for FONTS
> >>   Depends on [n]: FONT_SUPPORT [=y] && (FRAMEBUFFER_CONSOLE [=n] || STI_CONSOLE [=n])
> >>   Selected by [y]:
> >>   - BOOTX_TEXT [=y] && PPC_BOOK3S [=y]
> >>
> >> WARNING: unmet direct dependencies detected for FONT_SUN8x16
> >>   Depends on [n]: FONT_SUPPORT [=y] && FRAMEBUFFER_CONSOLE [=n] && (!SPARC && FONTS [=y] || SPARC)
> >>   Selected by [y]:
> >>   - BOOTX_TEXT [=y] && PPC_BOOK3S [=y]
> >>
> >> because FONTS depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE and neither of those is set.
> > 
> > I'm not getting the warnings in the v2, with a few configs; what command
> > are using?
> > 
> 
> My 'make' build target is either pp32_randconfig or ppc64_randconfig.
> I see kconfig warnings in > 50% of the randconfigs. (small sample size,
> around 20)

Thanks, that triggers it for me; I'll have a discussion with it....

Dave

> 
> > I'm tempted to change the FONT_SUN8x16 dependency line to have
> > SPARC||BOOTX_TEXT or SPARC||POWERPC  and drop the 'select FONTS' I
> > added.
> > 
> > Dave
> > 
> >>
> >> -- 
> >> ~Randy
> 
> -- 
> ~Randy
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
