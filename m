Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D85B62919F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 06:42:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBFSS6dZJz3c9y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 16:42:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Yl2cAdhA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=dmitry.torokhov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Yl2cAdhA;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBFRV1snlz3c6k
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 16:41:40 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id k7so12187492pll.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 21:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uQqRcNAhAHU0MAvKQcalM3RhDD2z13gHm2Bk2z14Kqk=;
        b=Yl2cAdhASFvQ+i7S/0GXfWmFFAtErap+Ahnjq6U5qiEBlY2F3G4GfUSfkz64Itn3Pf
         HgMHmuwQcqz8SE0fNmQSA25iISSEW3/UBgDcfwZEaY7f/CKOIvCdE6ql8fLfgKCA+bRv
         PiJ0Zqh29x4/wcLoZkulGZzzWcUXNbuO0O6L0aCuz2hiqDN3YE8A2foEcYN5sPxy19da
         Innx1z+OHUCmfbagjWYP1I3dV0Gd3bIVrGqlSuD4SCGixplofbWlxcTabaNd2tdlNitA
         CtKRBvWLHdj/FgW7DW+JxpRr69FY+sfokw4J1kaMWheDqDSN/v6YAPwnCbM36eGcU/VC
         TElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQqRcNAhAHU0MAvKQcalM3RhDD2z13gHm2Bk2z14Kqk=;
        b=Wu8sip+sVbqonaVylwJ4A4NvfsFx2HGNRCCwh9aje3VAXgDIEd0jaiBK0BoLvXnKZQ
         Q1COQ5hW8V82t4ggeLaVVnyRHT/dc/klF4twDlIza0D47HjM8Wavcu9CFX0obNt2SQEh
         PGEvWEwlnfsIUMhauPcRwebN6SuDpp1qk0R34KKSjhL/yMRWRBjxYQJELModrytAfdYU
         b9EWeAaQM9QB42rskkwBkkCVRJy1572glPfuAp7H/UT+MsOVoPwKzuBWwGT2W/vNEPrV
         t26ozCl3qkhtHd8LCwq9gvCUvaMhYgA6IXoUTtIYROgI09Tj2o2x7f3AE1CqQCPQPXtW
         dl/g==
X-Gm-Message-State: ANoB5plPJT0mL/dPXhKmtw21i2V2RCa7ZmzcK34sdhkk1D6xanCFYP6j
	oCAH7ARX1N6e64aY6FB395M=
X-Google-Smtp-Source: AA0mqf44rycjoWi/rDRu5nf/JiahIhO0HTP/5BpbvCgK2TCfeX27ZgnLEHxyPZ9x4v8DU2zEQAA93A==
X-Received: by 2002:a17:903:1306:b0:17f:7771:dde1 with SMTP id iy6-20020a170903130600b0017f7771dde1mr2574608plb.125.1668490895736;
        Mon, 14 Nov 2022 21:41:35 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:718:95ee:2678:497])
        by smtp.gmail.com with ESMTPSA id sc17-20020a17090b511100b0021828120643sm4897281pjb.45.2022.11.14.21.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 21:41:35 -0800 (PST)
Date: Mon, 14 Nov 2022 21:41:31 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH] macintosh/mac_hid.c: don't load by default
Message-ID: <Y3Mmi8wm62c7+0zv@google.com>
References: <20221113033022.2639-1-linux@weissschuh.net>
 <Y3KJ6SOD5PEwj1oe@google.com>
 <9255deb3-6c66-444d-940d-77e721d950e5@t-8ch.de>
 <Y3LaTeMxTa/7Rv7H@google.com>
 <cf4c9402-189f-4ff7-a130-c61ccfc99a08@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf4c9402-189f-4ff7-a130-c61ccfc99a08@t-8ch.de>
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
Cc: linux-input@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Franz Sirl <Franz.Sirl-kernel@lauterbach.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 15, 2022 at 04:07:53AM +0100, Thomas Weißschuh wrote:
> On 2022-11-14 16:16-0800, Dmitry Torokhov wrote:
> > On Tue, Nov 15, 2022 at 12:54:41AM +0100, Thomas Weißschuh wrote:
> >> Cc Franz who wrote the driver originally.
> >> (I hope I got the correct one)
> >> 
> >> Hi Dmitry,
> >> 
> >> On 2022-11-14 10:33-0800, Dmitry Torokhov wrote:
> >>> On Sun, Nov 13, 2022 at 04:30:22AM +0100, Thomas Weißschuh wrote:
> >>>> There should be no need to automatically load this driver on *all*
> >>>> machines with a keyboard.
> >>>> 
> >>>> This driver is of very limited utility and has to be enabled by the user
> >>>> explicitly anyway.
> >>>> Furthermore its own header comment has deprecated it for 17 years.
> >>> 
> >>> I think if someone does not need a driver they can either not enable it
> >>> or blacklist it in /etc/modprobe.d/... There is no need to break
> >>> module loading in the kernel.
> >> 
> >> But nobody needs the driver as it is autoloaded in its current state.
> >> Without manual configuration after loading the driver does not provide any
> >> functionality.
> >> 
> >> Furthermore the autoloading should load the driver for a specific
> >> hardware/resource that it can provide additional functionality for.
> >> Right now the driver loads automatically for any system that has an input
> >> device with a key and then just does nothing.
> >> 
> >> It only wastes memory and confuses users why it is loaded.
> >> 
> >> If somebody really needs this (fringe) driver it should be on them to load it
> >> it instead of everybody else having to disable it.
> > 
> > The driver is not enabled by default, so somebody has to enable it in
> > the first place. How did you end up with it?
> 
> My distro kernel configured it to be enabled as module.

Maybe you should talk to them? Which one is this? Not all distributions
seem to enable it (Debian for example does not).

> So people who want to use it can do so. It would be nice if the rest of us
> wouldn't have to care about it.
> 
> >> Furthermore the file has the following comment since the beginning of the git
> >> history in 2005:
> >> 
> >>     Copyright (C) 2000 Franz Sirl
> >> 
> >>     This file will soon be removed in favor of an uinput userspace tool.
> > 
> > OK, that is a separate topic, if there are no users we can remove the
> > driver. Do we know if this tool ever came into existence?
> 
> One interpretation of it is attached as "mac_hid_userspace.c".
> 
> > What I do not want is to break the autoload for one single driver
> > because somebody enabled it without intending to use and now tries to
> > implement a one-off.
> 
> Is an autoloaded driver that then does not (ever) automatically provide any
> functionality not broken by definition?

No because it does not result in any regression in behavior.

> It was enabled by the distro. Which seems correct, because maybe somebody will
> use it.
> 
> Taken to an illogical extreme: If it is fine for modules to load automatically
> even if they are not useful, why not just always load all available modules?

Well, take for example a driver for a NIC. It is not really useful until
you configure it by assigning an address to the interface, etc. Should
we not automatically load drivers for NICs?

> 
> 
> Maybe we can take the removal of the autoload as a first step of deprecation
> and finally removal of the module.
> To quote you:
> 
>     "I'd rather we did not promote from drivers/macintosh to other platforms,
>      but rather removed it. The same functionality can be done from
>      userspace." [0]

I think if you talk to your distro and see if they stop enabling it and
offer your userspace utility as a replacement if they indeed need the
functionality would be the best way of deprecating the driver.

Thanks.

-- 
Dmitry
