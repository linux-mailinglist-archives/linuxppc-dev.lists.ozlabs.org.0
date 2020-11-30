Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D51A92C8D7E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 19:56:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClDwg3ZgfzDqQh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 05:56:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.66; helo=mail-wm1-f66.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClDrm3krGzDqP0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 05:53:12 +1100 (AEDT)
Received: by mail-wm1-f66.google.com with SMTP id a3so428744wmb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 10:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wNVU7Wnc+eaUIFVNFzSXWeay3XxE3SLhhM3FYJKrr3g=;
 b=YPwjHh6rbBhDfFtmqPfIhn8dajpSM70JnB5WKYAKaGkmCx994FhLV8h2fBbFmaHd4S
 65o6c1PGoPWZ20kzhe3DpMI0BUOA8kQiOqLEIeMALvGHiWR1n0FkdJw8V59kpIEtWAow
 YciRJG4WBYFTAjb8E9mbvuo3mh+0E1zYX0ZVDKSBlbukCIISOkXLgJapz9vmm4OrQ8hz
 PGLoL66hCbxOPl4lfvaXzi/wqUrsqVrHKD4YFq0oAMHTV9eThhP2P+sAQ/J4bHrbu1gB
 jj/saOcyTKfsHDpmAi/z4685Ak37YIvAML+fuZjWbCnIEvWvcYytN8rpUjx1E4FbS4cz
 hmAg==
X-Gm-Message-State: AOAM531TkUuPiJ8D8Arp9ramkD+jxullt+jFwlK6BAfHtB16xJFU7Z5H
 /LY6v+wOFwA2+xh6oO4BUUo=
X-Google-Smtp-Source: ABdhPJw2FpgOR9PNeU1ye9qy5ni/TqLv9KVWJBGLmFHBKrWivAMsq4H9XX+Pn9Oe2EPE53IGBG4kBQ==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr195572wmb.175.1606762388808; 
 Mon, 30 Nov 2020 10:53:08 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id b73sm903707wmb.0.2020.11.30.10.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 10:53:07 -0800 (PST)
Date: Mon, 30 Nov 2020 20:53:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Subject: Re: [PATCH 2/5] arm64: defconfig: drop unused BACKLIGHT_GENERIC option
Message-ID: <20201130185304.GB29434@kozik-lap>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-3-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130152137.24909-3-andrey.zhizhikin@leica-geosystems.com>
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
Cc: alexandre.belloni@bootlin.com, tony@atomide.com,
 linux-kernel@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 thierry.reding@gmail.com, paulus@samba.org, sam@ravnborg.org,
 daniel.thompson@linaro.org, linux-omap@vger.kernel.org, deller@gmx.de,
 linux@armlinux.org.uk, jonathanh@nvidia.com, ludovic.desroches@microchip.com,
 catalin.marinas@arm.com, linux-mips@vger.kernel.org, will@kernel.org,
 mripard@kernel.org, linux-tegra@vger.kernel.org, lee.jones@linaro.org,
 wens@csie.org, linux-arm-kernel@lists.infradead.org, jernej.skrabec@siol.net,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 emil.l.velikov@gmail.com, nicolas.ferre@microchip.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 30, 2020 at 03:21:34PM +0000, Andrey Zhizhikin wrote:
> Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") removed geenric_bl driver from the tree, together with
> corresponding config option.
> 
> Remove BACKLIGHT_GENERIC config item from arm64 configuration.
> 
> Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
> ---
>  arch/arm64/configs/defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

The same trouble as with ARM patch - this should go directly via
arm-soc.

Best regards,
Krzysztof
