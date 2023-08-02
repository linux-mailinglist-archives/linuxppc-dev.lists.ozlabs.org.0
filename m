Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F43676D3EF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 18:44:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=mtLrXd/J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGHrl1kPVz3bZr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:44:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=mtLrXd/J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=treblig.org (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org)
Received: from mx.treblig.org (unknown [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGHqr1R7Xz2yDL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 02:44:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=031AZhyLVAnvSrG5EfAXCSNcm362d8NHJ28zLnLxYmc=; b=mtLrXd/JAIp176o8Ohuxx8WcsW
	CxmFnVk4u/FFudPnt/vFTbsxFGGckpr8P3ZRXY0tjldKqOvwlzyqA1Hy3gkWRMi0NR/dgQFWUyeGU
	+tpJmOLGSaC4XVSe7yQTczif0hg52oCybE+3qlr6ZWcIlTCRwZp28cQoRAhbcTskQh2Lllht3EIBX
	PQBcjcivt1eZGQdRpsyvbR2zgoYBSt5GXncG4J0N+IOg74k4D6WVfNHPYnufGJvRTDBbJBvaW80VM
	ulomkks44Tt+xFKB5j54KJePEH5DDUMdjSxhltyT/PCTX/pXXSh01bsoVqYreJ7WgBfbyloP/qUul
	JIv5hMxg==;
Received: from dg by mx.treblig.org with local (Exim 4.94.2)
	(envelope-from <dg@treblig.org>)
	id 1qREwy-004sNq-9g; Wed, 02 Aug 2023 16:43:52 +0000
Date: Wed, 2 Aug 2023 16:43:52 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] powerpc: Use shared font data
Message-ID: <ZMqHyC5PAEGzMLRz@gallifrey>
References: <20230725000141.165985-1-linux@treblig.org>
 <878rb0em3s.fsf@mail.lhotse>
 <ZMOaz9EqqeaPGokA@gallifrey>
 <871qgl1vs2.fsf@mail.lhotse>
 <182b08ea-04f3-3282-e3c3-9448bab6568a@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <182b08ea-04f3-3282-e3c3-9448bab6568a@infradead.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/5.10.0-23-amd64 (x86_64)
X-Uptime: 16:37:41 up 27 days,  2:09,  1 user,  load average: 0.00, 0.01, 0.00
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
> On 8/2/23 05:19, Michael Ellerman wrote:
> > "Dr. David Alan Gilbert" <linux@treblig.org> writes:
> >> * Michael Ellerman (mpe@ellerman.id.au) wrote:
> >>> linux@treblig.org writes:
> >>>> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> >>>>
> >>>> PowerPC has a 'btext' font used for the console which is almost identical
> >>>> to the shared font_sun8x16, so use it rather than duplicating the data.
> >>>>
> >>>> They were actually identical until about a decade ago when
> >>>>    commit bcfbeecea11c ("drivers: console: font_: Change a glyph from
> >>>>                         "broken bar" to "vertical line"")
> >>>>
> >>>> which changed the | in the shared font to be a solid
> >>>> bar rather than a broken bar.  That's the only difference.
> >>>>
> >>>> This was originally spotted by PMD which noticed that sparc does
> >>>
> >>> PMD means "Page Middle Directory" to most Linux folks, I assume that's
> >>> not what you meant :)
> >>
> >> Ah, any good TLA is ripe for reuse:
> >>    https://pmd.github.io/pmd/pmd_userdocs_cpd.html
> > 
> > Thanks.
> > 
> > Unfortunately this patch causes a warning:
> > 
> >   WARNING: unmet direct dependencies detected for FONT_SUN8x16
> >     Depends on [n]: FONT_SUPPORT [=y] && FRAMEBUFFER_CONSOLE [=y] && (!SPARC && FONTS [=n] || SPARC)
> >     Selected by [y]:
> >     - BOOTX_TEXT [=y] && PPC_BOOK3S [=y]
> > 
> > And breaks allmodconfig with:
> > 
> >   ld: arch/powerpc/kernel/btext.o:(.toc+0x0): undefined reference to `font_sun_8x16'
> >   make[3]: *** [../scripts/Makefile.vmlinux:36: vmlinux] Error 1
> > 
> > I guess the Kconfig logic needs some more work.
> 
> Also please see:
>   https://lore.kernel.org/all/dd29e5f5-d9f7-0103-e602-b98f26c88fb1@infradead.org/
> for a similar problem on UML.

Thanks Michael, Randy.

Does anyone understand why the font_sun8x16 has any of those
 'Depends on' ?

It's just a font structure definition.

Dave

> -- 
> ~Randy
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
