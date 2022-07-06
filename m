Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C89568311
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 11:14:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdDPS2wRLz3c63
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 19:14:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UyINPEp8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=olteanv@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UyINPEp8;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdDNp5Tyhz3bl8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 19:13:28 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id r6so7012283edd.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Jul 2022 02:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WKlacHhWVR2IblvCAgYMcCw7cvtmo7gBzlhxFpijOWM=;
        b=UyINPEp8aUU7+iO4UvYReAysG8acJi4s0lW7fYS990hIHuI2KgReqshlPjlC0FcdQX
         RWLEJ1iagzj5JHTLAwg1Tfl34CjKErUg06qCwRi5FpbuqXpIfRK0B8kuUc2l5x+40o+8
         2YldATzAdsq2GhIZIL2D0cZi8oKOkVG5Y5xLvvP4kajNiX5yCXAJSyEYBx1RvA9W9SdO
         piij5Lfa0VXVwqnHofYdHxRPOmYTBO/NXTATLm6C9JRKYr2iRvgzlsZTZRGqO8gtc9pI
         zkPBxco6Fa5B8qkZy3WblPhpXY+1PsQ3ol/zLxC+L8wAov5SdI1JA4byrn/VHyXJavbs
         ZPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WKlacHhWVR2IblvCAgYMcCw7cvtmo7gBzlhxFpijOWM=;
        b=bRXPX+Wn1VZs0ATKJshsytf/RBnmpT7KdD1rRl+eoUWeqzx+3APyUgJohSH5AE0CAO
         4Zas/jv8aHwfLvjKHg74ALSniZEm3DjURil7X18GLb8n3LOoHsGM4EDEasHAAxbMW0Tz
         IM4ImFGq+KeOjRvH5i7IDcHCRe02dR6HyZZLoGDE5lcx7PsBoZijIx3WPhNI5Z8fjOlv
         ZOsXdUY7Mm88ZlzvGKqqUU1gFhae/Bj/V346t1nfglIE6TekMDqrhvV48MdjM9j1YHfW
         a0T/z8Lg5YOSa+9piRMWut5bZA66eThmJdvRWgVquJQS5dGzKSjAm5pwxI6XLzflxYtE
         zryw==
X-Gm-Message-State: AJIora9bLED8pTcnQx7rkVOXHG38BPI/zic11EWlxLa4MpyJkb92r9zS
	6WwyK67H4MlCcQI5+SXoKgA=
X-Google-Smtp-Source: AGRyM1tgzHocOxIjG9HexS+g9z9ap2nsem/HblqVyMjIbl5ZbLhG8nAvflW5PCvUObUWjIPHfLadCA==
X-Received: by 2002:a05:6402:350a:b0:435:df44:30aa with SMTP id b10-20020a056402350a00b00435df4430aamr51209856edd.403.1657098799156;
        Wed, 06 Jul 2022 02:13:19 -0700 (PDT)
Received: from skbuf ([188.26.185.61])
        by smtp.gmail.com with ESMTPSA id er13-20020a056402448d00b0043a5bcf80a2sm6350790edb.60.2022.07.06.02.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 02:13:18 -0700 (PDT)
Date: Wed, 6 Jul 2022 12:13:15 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220706091315.p5k2jck3rmyjhvqw@skbuf>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
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
Cc: alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev, linux-staging@lists.linux.dev, kasan-dev@googlegroups.com, linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, linux-input@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, linux-pm@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, patches@opensource.cirrus.co
 m, linux-usb@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, linux-crypto@vger.kernel.org, netdev@vger.kernel.org, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 28, 2022 at 04:03:12PM +0200, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <uwe@kleine-koenig.org>
> 
> The value returned by an i2c driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
> 
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Assuming you remove the spurious kasan change:

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
