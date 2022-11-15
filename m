Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E36628E22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 01:17:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NB6F80rszz3ccs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 11:17:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pAqott4B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=dmitry.torokhov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pAqott4B;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NB6D82hj9z3057
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 11:16:22 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id f5-20020a17090a4a8500b002131bb59d61so95917pjh.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 16:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4v7OYMMAc0zCH8SqUBKlRfNwf0qE0V9KHmyK1/essTg=;
        b=pAqott4Bq5dl3rdIc4adqOK5knz8TnKfxoZTH+2b9qe71cEEAH4T/0fvzqiF2aWtDW
         P8xUtXSGUiuJ0gm0ZbZgn9V/cNH5nATQFwNKTr4tSngxZRjoX9tnmnlfLp0oI+1I/mFJ
         Y26vHwNuPbf+tc2JZJ3z5cS2AR2lpNpbJHE04/fY4qFtqi7J6pnyVlSdZpSFAq80Nwiw
         YI329wVzJWUQxgXaYTRsgFG77PGeHbR8UX3CTlDf2Z5EbHOOOVTkGbG/ZM4z0FsO3I70
         XqtgNXWk/DXHNdxlad06k6KJCCw7TXqdlGDbCm5CZvkMvscWi4li3lHue/nUqG+TexZq
         k+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4v7OYMMAc0zCH8SqUBKlRfNwf0qE0V9KHmyK1/essTg=;
        b=dVQFmo79WZJF9vhLhAaaHOwKKX/n/t35pQ/Kpd3Pc31BX4LCPwzos5jdOXX9PylqMs
         wm8DrbC2FWjSI9npvyPWCLNUdGFK8GIdHIFqHGP+wE6PxdsjFc55RhVA+J7AVDzDQuCC
         so/FoueNhqWLpk12MnprMQMfAL6jhG4bH4Fqoh7uESt5TxX6iZjEWjf1/pZxM4Bu6SDr
         VLigaZx8+OMfh0euGb6UHJV4/UJWoVRMW73kGMvKv/xUM73AC0SX3Y4gRlgHONK5UKLG
         CmZdYTLK1UZscK22WNC/Blv/PbPDeTnSu9zeeMJaEGMI1bMHrCSbIST0uu98gg4MYtEe
         +rnw==
X-Gm-Message-State: ANoB5pkZvq9OrYTx1yKNPBxy3133+h4/JBjPfvgIk8XKmjsn8GXb0bSy
	bKJceU40bYG72XXtglFE3Xk=
X-Google-Smtp-Source: AA0mqf4cr49ah0pai6zTD2+5A/8zltwpW9bVFF9eBvRF53ojwUVdgw9cIDv+GZ3MnHhOznEilalJug==
X-Received: by 2002:a17:903:3292:b0:17d:5e67:c523 with SMTP id jh18-20020a170903329200b0017d5e67c523mr1534029plb.115.1668471377451;
        Mon, 14 Nov 2022 16:16:17 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:718:95ee:2678:497])
        by smtp.gmail.com with ESMTPSA id om15-20020a17090b3a8f00b00213c7cf21c0sm7149531pjb.5.2022.11.14.16.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 16:16:16 -0800 (PST)
Date: Mon, 14 Nov 2022 16:16:13 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH] macintosh/mac_hid.c: don't load by default
Message-ID: <Y3LaTeMxTa/7Rv7H@google.com>
References: <20221113033022.2639-1-linux@weissschuh.net>
 <Y3KJ6SOD5PEwj1oe@google.com>
 <9255deb3-6c66-444d-940d-77e721d950e5@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9255deb3-6c66-444d-940d-77e721d950e5@t-8ch.de>
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

On Tue, Nov 15, 2022 at 12:54:41AM +0100, Thomas Weiﬂschuh wrote:
> Cc Franz who wrote the driver originally.
> (I hope I got the correct one)
> 
> Hi Dmitry,
> 
> On 2022-11-14 10:33-0800, Dmitry Torokhov wrote:
> > On Sun, Nov 13, 2022 at 04:30:22AM +0100, Thomas Weiﬂschuh wrote:
> >> There should be no need to automatically load this driver on *all*
> >> machines with a keyboard.
> >> 
> >> This driver is of very limited utility and has to be enabled by the user
> >> explicitly anyway.
> >> Furthermore its own header comment has deprecated it for 17 years.
> > 
> > I think if someone does not need a driver they can either not enable it
> > or blacklist it in /etc/modprobe.d/... There is no need to break
> > module loading in the kernel.
> 
> But nobody needs the driver as it is autoloaded in its current state.
> Without manual configuration after loading the driver does not provide any
> functionality.
> 
> Furthermore the autoloading should load the driver for a specific
> hardware/resource that it can provide additional functionality for.
> Right now the driver loads automatically for any system that has an input
> device with a key and then just does nothing.
> 
> It only wastes memory and confuses users why it is loaded.
> 
> If somebody really needs this (fringe) driver it should be on them to load it
> it instead of everybody else having to disable it.

The driver is not enabled by default, so somebody has to enable it in
the first place. How did you end up with it?

> 
> Furthermore the file has the following comment since the beginning of the git
> history in 2005:
> 
>     Copyright (C) 2000 Franz Sirl
> 
>     This file will soon be removed in favor of an uinput userspace tool.

OK, that is a separate topic, if there are no users we can remove the
driver. Do we know if this tool ever came into existence?

What I do not want is to break the autoload for one single driver
because somebody enabled it without intending to use and now tries to
implement a one-off.

> 
> >> Fixes: 99b089c3c38a ("Input: Mac button emulation - implement as an input filter")
> >> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> >> ---
> >>  drivers/macintosh/mac_hid.c | 2 --
> >>  1 file changed, 2 deletions(-)
> >> 
> >> diff --git a/drivers/macintosh/mac_hid.c b/drivers/macintosh/mac_hid.c
> >> index d8c4d5664145..d01d28890db4 100644
> >> --- a/drivers/macintosh/mac_hid.c
> >> +++ b/drivers/macintosh/mac_hid.c
> >> @@ -149,8 +149,6 @@ static const struct input_device_id mac_hid_emumouse_ids[] = {
> >>  	{ },
> >>  };
> >>  
> >> -MODULE_DEVICE_TABLE(input, mac_hid_emumouse_ids);
> >> -
> >>  static struct input_handler mac_hid_emumouse_handler = {
> >>  	.filter		= mac_hid_emumouse_filter,
> >>  	.connect	= mac_hid_emumouse_connect,
> >> 
> >> base-commit: fef7fd48922d11b22620e19f9c9101647bfe943d
> >> -- 
> >> 2.38.1

Thanks.

-- 
Dmitry
