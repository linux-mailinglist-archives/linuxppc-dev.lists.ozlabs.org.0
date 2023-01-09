Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 619CB6623BF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 12:04:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrB001Sz9z3cL8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:04:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oGr26Y/f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=daniel.thompson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oGr26Y/f;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nr9z15nGKz3bXQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 22:03:07 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id z5so6685702wrt.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 03:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zefo0+cIWrVM5FFfr0NEPPr+QlP+S4JK9M0A8dYdzso=;
        b=oGr26Y/fiwHYFqrJohN/Z+dunayrmT0xuC0ParAo9r2mbdlha7JmZ5TehQNI7/mIWp
         hWSaPL393d7ahA2QrXLa47EcjFnu5YT3Jb1N9fthnTAQrjCxXX5POnD6hWqlfRrvA5rI
         D/zve+wX42+oAgMs/sBQZoe1LdpaOjZRMLxj9/pt72r0tOe0R/+AjRzibKCDbZ/OAUkz
         Q0BxMJI//BsazsVVwnI2dgwGh987r5dh+ydGEkKrBjeM7d2rKYJ1AA6ZN5E5Avw5UebQ
         EnTIpNqs1kyVGp6yaaqvQXZQzoIn0NGA/pp6hh/yoW71e/0duhXVOBRms7rLUxGdJdLd
         s8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zefo0+cIWrVM5FFfr0NEPPr+QlP+S4JK9M0A8dYdzso=;
        b=Ft1/I05oKvLBEyinMc+L8afIoF+YO/KdOQPVt5YfN6uZ4hQdxHxUpto09qnSF43nyX
         1ENy/5He8V7ZP6xJ1fex/c5WVTpeI6VG6pPNugcI7AzwNynM9Djtn5oIO2OOa/rYO/4v
         0vhiUlwb9CuBA2I4kCU/2NL/SLZaoCFonafFO2S2kGk1Kkn6OcVhduZbW1A0OAI3HLS9
         PEQKW7MyYNxedErfGr/UhEjIrqOz64LMskqgHGEf9C6ideHV6h0xT9wO6NeZadnSBep0
         fTuesY2BrzFiyXeB5VP1qHP/L/J5HgkBF9ZN73KBol6D6TbT8W6aiPSA41C7j7evl+8O
         v9pg==
X-Gm-Message-State: AFqh2kreF5THwjtikk1n7CzJ4oXOT7JXIVufgCQmXw2M4vFZ4xDCxegK
	qzl986Qsmx2xw8ARiyZ0btintQ==
X-Google-Smtp-Source: AMrXdXuJ229PsMqnsutJQhmCnDx582UTxhRGjYEWDOJCs8UDfbNlBoANEOulxPZfAp5vzNYgBBmlzA==
X-Received: by 2002:a5d:56cb:0:b0:28d:66c4:3102 with SMTP id m11-20020a5d56cb000000b0028d66c43102mr23679733wrw.12.1673262182985;
        Mon, 09 Jan 2023 03:03:02 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d58ce000000b002879c013b8asm8250053wrf.42.2023.01.09.03.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 03:03:02 -0800 (PST)
Date: Mon, 9 Jan 2023 11:02:59 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: sam@ravnborg.org
Subject: Re: [PATCH 13/15] backlight: omap1: Use backlight helpers
Message-ID: <Y7v0Yw3kg9E8j5Bu@aspen.lan>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-13-1bd9bafb351f@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-13-1bd9bafb351f@ravnborg.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-staging@lists.linux.dev, Stephen Kitt <steve@sk2.org>, Antonino Daplas <adaplas@gmail.com>, Robin van der Gracht <robin@protonic.nl>, Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Paul Mackerras <paulus@samba.org>, linux-fbdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 07, 2023 at 07:26:27PM +0100, Sam Ravnborg via B4 Submission Endpoint wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
>
> Rework backlight handling to avoid access to the deprecated
> backlight_properties.fb_blank member.
>
> The rework includes removal of get_brightness() operation,
> because there was no read back from HW so no use for it.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

This rework will result in additional calls to omapbl_send_enable()
during updates so, if anyone who cares about omap1, is filtering LKML
then a Tested-by: would be nice.

However, I doubt the additional calls will do any harm so even with
that absent:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
