Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA4F762022
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 19:29:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=Tc94ByYH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9PCt2PmYz3c8V
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 03:29:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=Tc94ByYH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=treblig.org (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 1198 seconds by postgrey-1.37 at boromir; Wed, 26 Jul 2023 03:28:41 AEST
Received: from mx.treblig.org (unknown [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9PBx6tNZz30gy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 03:28:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=yRbVjFfsSAWk2qgPNLV4SL8PYOAzyHPJa8qojV/qbTU=; b=Tc94ByYH0orSeNXKGUiuuOjWTS
	ATnRhfKj2TfUyt+WICB9rlgeFHnc2qULhs+lSzd2663ZUtjIuViBkKDl4v9cvfQE70uhdxfi2OfVo
	hXzlkILmigafv1+Mb2ZmSuUm/1rAt3+M2VTcN2pV5oS87RL5bwgli0k7APUKsnTUyG5xB87fE64nj
	UsihBZudUopiFXmotkuW68RBPAkmvd2mPZLaOpBn08IskQJN3VjNqNORXfrhdudlMgRbt8H4MCBj3
	rQwkK6s27v528DgBSbJsVmgjKbcvzVO2mqAZyIeHKxpY+YodZ55LfPQQ1PPlA/YFHlx0ZeRMiC52L
	nUy4XK8Q==;
Received: from dg by mx.treblig.org with local (Exim 4.94.2)
	(envelope-from <dg@treblig.org>)
	id 1qOLWR-003Grm-3b; Tue, 25 Jul 2023 17:08:31 +0000
Date: Tue, 25 Jul 2023 17:08:31 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] powerpc: Use shared font data
Message-ID: <ZMABj6UNK98fONEQ@gallifrey>
References: <20230725000141.165985-1-linux@treblig.org>
 <20230725170104.GA838289@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20230725170104.GA838289@ravnborg.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/5.10.0-23-amd64 (x86_64)
X-Uptime: 17:08:19 up 19 days,  2:39,  1 user,  load average: 0.00, 0.01, 0.00
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Sam Ravnborg (sam@ravnborg.org) wrote:
> Hi David,
> 
> On Tue, Jul 25, 2023 at 01:01:41AM +0100, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > PowerPC has a 'btext' font used for the console which is almost identical
> > to the shared font_sun8x16, so use it rather than duplicating the data.
> > 
> > They were actually identical until about a decade ago when
> >    commit bcfbeecea11c ("drivers: console: font_: Change a glyph from
> >                         "broken bar" to "vertical line"")
> > 
> > which changed the | in the shared font to be a solid
> > bar rather than a broken bar.  That's the only difference.
> > 
> > This was originally spotted by PMD which noticed that sparc does
> > the same thing with the same data, and they also share a bunch
> > of functions to manipulate the data.  I've previously posted a near
> > identical patch for sparc.
> > 
> > One difference I notice in PowerPC is that there are a bunch of compile
> > options for the .c files for the early code to avoid a bunch of security
> > compilation features;  it's not clear to me if this is a problem for
> > this font data.
> > 
> > Tested very lightly with a boot without FS in qemu.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> Yep, looks very similar to sparc, so
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks!

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
