Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6152B6623D6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 12:07:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrB440QWwz3bXQ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:07:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YnQ3fGmp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=daniel.thompson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YnQ3fGmp;
	dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrB361tGLz3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 22:06:42 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id l26so5974519wme.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 03:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SjRwbpuBx9A4o4cRoFcJqEE5mXsy0UsyNYHbW5KtG4M=;
        b=YnQ3fGmpuRUapOzbtVRlN3HBT8Iorta3LecpdB0log7XED7u1IJxEqQs0QccmZxOai
         MfS/ZZSQ5WKDa9o6C1cGRqmSlALsDF7dYw8bC0mLYpQtTD17RkfW4+nHFkmXWXMpmBze
         LZwVtCyv46vyu0ZifdpdHibLyN3SfkifcK+AXWfJG2T0iyPzAA9pLINli7HH1gS+p9g3
         O+B5gLSVUqo8PEgDoBB9hhiNpI9OFz7Cq+mzvc+xnE3YYo3cKvbMrMpNiAgcOYu4257/
         //cyEe3wFJV/FzRNJeYb81OLG4xcEJtdkHClXQjHgPbLWfvpN3QzLV2BDagvGkziL0gK
         obhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjRwbpuBx9A4o4cRoFcJqEE5mXsy0UsyNYHbW5KtG4M=;
        b=6b3TfXDEtkeRrR4arLl8FxWqtvaCWh9lfJaVCF0yZk8HF37VXkutmhreeR3O8A9s0P
         VFSyaP0NHFh10CAHfxFqlV6xmzq9kmXqbNrKT6ERF3HCMFHDc8lWJmAAFmRuX5cg45ia
         5Y5MOPnWwCrOcpSW9PaNJCzujDG0Amb5kAqPXJ6h6qRi8QrrSv6g3y6arpfR8x476WmD
         CKoXt+zxBZ6M2yvhnrwqyvz2PY8fOXButIXIMNk/WtIf3naoJJOxesZWRrRpChYc5F/R
         Pvc+DqfkEi7nU+zyLzbf04ITAEQxdR59uDTOWxBOo5uZa5QF8JQVQ6plaO2m6dia7o+L
         75gg==
X-Gm-Message-State: AFqh2kr7/GvHWYQdji/P8O2Nk/jKoWth8oxAeYkgTWRehHm8QKLnnT/Y
	fvnoDIMTizWxg2BLS3K5SuDtfw==
X-Google-Smtp-Source: AMrXdXshcTe7Yre9OY4C4E6jNr30wzlSQe0BxicvczyjAULATvXvRnPw2diLMpZVvSEBR8IGX/Vbtw==
X-Received: by 2002:a05:600c:3550:b0:3d9:ed30:6a73 with SMTP id i16-20020a05600c355000b003d9ed306a73mr3129624wmq.9.1673262397923;
        Mon, 09 Jan 2023 03:06:37 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id y7-20020a7bcd87000000b003d997e5e679sm12453314wmj.14.2023.01.09.03.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 03:06:37 -0800 (PST)
Date: Mon, 9 Jan 2023 11:06:35 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: sam@ravnborg.org
Subject: Re: [PATCH 15/15] backlight: backlight: Drop the deprecated fb_blank
 property
Message-ID: <Y7v1OxdowGdxgvUj@aspen.lan>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
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

On Sat, Jan 07, 2023 at 07:26:29PM +0100, Sam Ravnborg via B4 Submission Endpoint wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
>
> With all users gone remove the deprecated fb_blank member in
> backlight_properties.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>


Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


PS Please don't treat this like a maintainer Acked-by: and merge it
   (Lee's not on holiday so work with Lee to figure out the merge
   strategy ;-) ).
