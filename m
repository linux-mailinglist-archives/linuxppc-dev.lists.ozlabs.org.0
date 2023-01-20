Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4E1675C26
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 18:53:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz6Yn08rSz3fKr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 04:53:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GjbiRjgq;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JKFUMRfV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GjbiRjgq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JKFUMRfV;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz6Xq2pT1z30Bp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 04:52:59 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 2C66C33795;
	Fri, 20 Jan 2023 17:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674237175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UNyEsjm7hTRHmPW+XmOpTTJAr6gba2jkZnI10liz/yE=;
	b=GjbiRjgqTWyXCgMsFjtKYs9AvuDkHg49it+0qX0XS2aTMfPj7Mw2LGq4NMAoFYcaj9PVej
	vMAyYMvPMBYBuZ3p8DCAt5IgRAcn/Lj3Sm6fk2rJ/G7ZgTQRF8kz1VRmIiI7Mso2WhAkiI
	qH5MslyqTpbp47xkbnG2yy0C43RDIu8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674237175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UNyEsjm7hTRHmPW+XmOpTTJAr6gba2jkZnI10liz/yE=;
	b=JKFUMRfVDlOz7Gei5bw7WnRU5/xBTxCqxl9tiG+nANWfa+RRqPUrsxile+0ykUzlS10JwM
	oHseEXEeJdaFmKAQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id F157F2C141;
	Fri, 20 Jan 2023 17:52:54 +0000 (UTC)
Date: Fri, 20 Jan 2023 18:52:53 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] of: Fix of platform build on powerpc due to bad of
 disaply code
Message-ID: <20230120175253.GW16547@kitsune.suse.cz>
References: <20230118215045.5551-1-msuchanek@suse.de>
 <20230119095323.4659-1-msuchanek@suse.de>
 <CAL_JsqKo+mdjA485KDb1ZauJcbOU-FR1G-Z2sYYNu7+Zn32wSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKo+mdjA485KDb1ZauJcbOU-FR1G-Z2sYYNu7+Zn32wSA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "Erhard F." <erhard_f@mailbox.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, open list <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Fri, Jan 20, 2023 at 11:23:39AM -0600, Rob Herring wrote:
> On Thu, Jan 19, 2023 at 3:53 AM Michal Suchanek <msuchanek@suse.de> wrote:
> >
> > The commit 2d681d6a23a1 ("of: Make of framebuffer devices unique")
> > breaks build because of wrong argument to snprintf. That certainly
> > avoids the runtime error but is not the intended outcome.
> >
> > Also use standard device name format of-display.N for all created
> > devices.
> >
> > Fixes: 2d681d6a23a1 ("of: Make of framebuffer devices unique")
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> > v2: Update the device name format
> > ---
> >  drivers/of/platform.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > index f2a5d679a324..8c1b1de22036 100644
> > --- a/drivers/of/platform.c
> > +++ b/drivers/of/platform.c
> > @@ -525,7 +525,9 @@ static int __init of_platform_default_populate_init(void)
> >         if (IS_ENABLED(CONFIG_PPC)) {
> >                 struct device_node *boot_display = NULL;
> >                 struct platform_device *dev;
> > -               int display_number = 1;
> > +               int display_number = 0;
> > +               char buf[14];
> > +               char *of_display_format = "of-display.%d";
> 
> static const as suggested and can we just move on please...
Only const, static could be dodgy

> >                 int ret;
> >
> >                 /* Check if we have a MacOS display without a node spec */
> > @@ -556,7 +558,10 @@ static int __init of_platform_default_populate_init(void)
> >                         if (!of_get_property(node, "linux,opened", NULL) ||
> >                             !of_get_property(node, "linux,boot-display", NULL))
> >                                 continue;
> > -                       dev = of_platform_device_create(node, "of-display", NULL);
> > +                       ret = snprintf(buf, sizeof(buf), of_display_format, display_number++);
> 
> The boot display is always "of-display.0". Just use the fixed string
> here. Then we can get rid of the whole debate around static const.

I prefer to use the same format string when the names should be
consistent. Also it would resurrect the starting from 1 debate.

But if you really want to have two strings I do not care all that much.

> 
> > +                       if (ret >= sizeof(buf))
> > +                               continue;
> 
> This only happens if display_number becomes too big. Why continue on?
> The next iteration will fail too.

Yes, there is no need to continue with the loop.

Thanks

Michal

> 
> > +                       dev = of_platform_device_create(node, buf, NULL);
> >                         if (WARN_ON(!dev))
> >                                 return -ENOMEM;
> >                         boot_display = node;
> > @@ -564,10 +569,9 @@ static int __init of_platform_default_populate_init(void)
> >                 }
> >
> >                 for_each_node_by_type(node, "display") {
> > -                       char *buf[14];
> >                         if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
> >                                 continue;
> > -                       ret = snprintf(buf, "of-display-%d", display_number++);
> > +                       ret = snprintf(buf, sizeof(buf), of_display_format, display_number++);
> >                         if (ret >= sizeof(buf))
> >                                 continue;
> 
> Here too in the original change.
> 
> >                         of_platform_device_create(node, buf, NULL);
> > --
> > 2.35.3
> >
