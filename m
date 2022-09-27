Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B81195EBA4E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 08:01:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc8C64mWCz3cBq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 16:01:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KCy0tVmV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=dmitry.torokhov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KCy0tVmV;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc8BX5MZHz3bXy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 16:01:07 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id x1so8180190plv.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 23:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=KmMk56mDUlyDTTT32tWxFwynOn3qJ7x9u3+7ehaDfuo=;
        b=KCy0tVmVEkDRvL4k8tW4HdlD7/t4El1jiHZ/dK47R/aICnJoUkkAUmo7AfVY2Sum58
         STsc7/BM9qCcEUSA5QTukxQNCgmkxBPhsEv4X9Xd1HxclqWEjwEnOCwIDihX72hVZzZ3
         mzJ9bOI2bpGJ0+DRjaMHDCADTwuU28HL45U7c1RgaCbWVnmDNHSHhR1ugvspk6fEo2io
         4MnbydsfNVyETPaug3dBlYni4GsZrgNYc5N0+3W4AcLN+aP41jaQnrmhJxUORJAH5hpQ
         OBn6x69D4YMZN42Og6X9g6Wn8+cEnJmtxiHi80xbBnO5VmLlKHIYYk/FNbvLtI+mnIvs
         FRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KmMk56mDUlyDTTT32tWxFwynOn3qJ7x9u3+7ehaDfuo=;
        b=nVAecj5bJdEnaa0ieo5HLNo5zo2izxCqoP6HrtkEtr1p2rMgXHvtZXyIofO3cH50a6
         xMuNn5MyZg4jsqOKqa1BU5ImGfFo05lZB7C4Zb7fceSULmPO8zDS2pGmPbzqcdlzjVUh
         vI7aAW+rZ1LtDC2OheKGZbajOw2X9b427hWUrvQFfD2+1mdXColgDb5H87WAgklNNgDy
         G4iuCWQ7jH3lhzFKb9oBPs1gyUkbvXP+YBp3FuQTlQuR03Oy6X9r/WDaOpswiaL8kmZ6
         h2OSNv4xG6j16YeXXic/uQnkaDGMp/Yr5bKzgaLNPRrtRP9tEKwWlKD3hr0YxlBbg/fZ
         HpSg==
X-Gm-Message-State: ACrzQf0JeeaZzAlpQmTiOF1xD/KQq0dmbAvy3W4UHYPL8qoakTIlrxOh
	NGmHCgBu4lkxreLzeTYJwYk=
X-Google-Smtp-Source: AMsMyM6wTi9h110kts0nAn7gMK8AVBYLbc/xGdTaubZBOpxPIgmpCmDeU8r8ymWE0aiXhIs1JZ3bNg==
X-Received: by 2002:a17:903:2346:b0:178:4c17:eef7 with SMTP id c6-20020a170903234600b001784c17eef7mr25015442plh.30.1664258464390;
        Mon, 26 Sep 2022 23:01:04 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9739:ab49:3830:2cbb])
        by smtp.gmail.com with ESMTPSA id a203-20020a621ad4000000b0053b0d88220csm641172pfa.3.2022.09.26.23.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 23:01:03 -0700 (PDT)
Date: Mon, 26 Sep 2022 23:01:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Is PPC 44x PIKA Warp board still relevant?
Message-ID: <YzKRnaFYmaQd2XWD@google.com>
References: <Yy/hv2fOLzdWOuvT@google.com>
 <ed43b0d6-d6d4-73d2-b4ab-637f6d2e310e@csgroup.eu>
 <87o7v2zaby.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o7v2zaby.fsf@mpe.ellerman.id.au>
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
Cc: "ssx@qnx.com" <ssx@qnx.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 26, 2022 at 08:41:53PM +1000, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > Hi Dmitry
> >
> > Le 25/09/2022 à 07:06, Dmitry Torokhov a écrit :
> >> Hi Michael, Nick,
> >> 
> >> I was wondering if PIKA Warp board still relevant. The reason for my
> >> question is that I am interested in dropping legacy gpio APIs,
> >> especially OF-specific ones, in favor of newer gpiod APIs, and
> >> arch/powerpc/platforms/44x/warp.c is one of few users of it.
> >
> > As far as I can see, that board is still being sold, see
> >
> > https://www.voipon.co.uk/pika-warp-asterisk-appliance-p-932.html
> 
> On the other hand it looks like PIKA technologies went bankrupt earlier
> this year.
> 
> >> The code in question is supposed to turn off green led and flash red led
> >> in case of overheating, and is doing so by directly accessing GPIOs
> >> owned by led-gpio driver without requesting/allocating them. This is not
> >> really supported with gpiod API, and is not a good practice in general.
> >
> > As far as I can see, it was ported to led-gpio by
> >
> > ba703e1a7a0b powerpc/4xx: Have Warp take advantage of GPIO LEDs 
> > default-state = keep
> > 805e324b7fbd powerpc: Update Warp to use leds-gpio driver
> >
> >> Before I spend much time trying to implement a replacement without
> >> access to the hardware, I wonder if this board is in use at all, and if
> >> it is how important is the feature of flashing red led on critical
> >> temperature shutdown?
> >
> > Don't know who can tell it ?
> 
> I would be surprised if anyone is still running upstream kernels on it.
> 
> I can't find any sign of any activity on the mailing list related to it
> since it was initially merged.
> 
> > Maybe let's perform a more standard implementation is see if anybody 
> > screams ?
> 
> How much work is it to convert it?
> 
> Flashing a LED when the machine dies is nice, but not exactly critical,
> hopefully the machine *isn't* dying that often :)

OK, I think I figured out how to let platform code access the GPIOs
while still using leds-gpio driver for normal operation. I will send a
patch shortly.

Thanks.

-- 
Dmitry
