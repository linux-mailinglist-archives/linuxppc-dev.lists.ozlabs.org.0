Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 740662C8D81
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 19:58:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClDyg1T5CzDqSH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 05:58:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.68; helo=mail-wr1-f68.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClDs95xbbzDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 05:53:33 +1100 (AEDT)
Received: by mail-wr1-f68.google.com with SMTP id i2so17611161wrs.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 10:53:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mtWjhyJKSY07pJm4d9iFY7jeF0Tu5I4taqa0sRTC28A=;
 b=guzcAt7Gly2HsGrcOAYLRaKzBQN0W/XFPluf7B+BWUtwRsvpunWx1wQ40rK+s1lpd4
 30PCsH0F+Zkg+tdJxbSE8Qivvp3AtT3UvlcRgLAhAM0yi+BcmI3JQmVRFwVb2ywyGfg0
 Wec43newCmqzxg9gOWmMckq1RRwe9BRHvCVTAE3Kbq0Y0PYWQsE3xYmRFhh/lgdMyoH5
 ZEuihrDFO8MKfxKwbgDEDF8wBbmVc5/aLu+fb2esvy9sFY62QJZkdzA86ZLeumN5Suq7
 BTScE/JGZvHSs8Py5R7XPHjyAoQTjnIpOQP4YsA6Ne+2ltu/NC2thyoKoDaDZuyNNVgy
 gDaw==
X-Gm-Message-State: AOAM532oaiZ86xy0QxvRHpstdak3AuL6pn1zt00JX8BBPhXS1yYSEa9v
 otyBKS+2DOznoxJ64yZN6sg=
X-Google-Smtp-Source: ABdhPJwXa0AqF81gvDse9p0Yw/CaQ7O2QUQTvVTmgvjzB90sBz+llfV2kANrqxAIRMnHg7L2O6jxCw==
X-Received: by 2002:adf:f441:: with SMTP id f1mr30343737wrp.225.1606762409693; 
 Mon, 30 Nov 2020 10:53:29 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id u23sm245138wmc.32.2020.11.30.10.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 10:53:28 -0800 (PST)
Date: Mon, 30 Nov 2020 20:53:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Subject: Re: [PATCH 3/5] MIPS: configs: drop unused BACKLIGHT_GENERIC option
Message-ID: <20201130185326.GC29434@kozik-lap>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-4-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130152137.24909-4-andrey.zhizhikin@leica-geosystems.com>
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

On Mon, Nov 30, 2020 at 03:21:35PM +0000, Andrey Zhizhikin wrote:
> Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") removed geenric_bl driver from the tree, together with
> corresponding config option.
> 
> Remove BACKLIGHT_GENERIC config item from all MIPS configurations.
> 
> Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
> ---
>  arch/mips/configs/gcw0_defconfig      | 1 -
>  arch/mips/configs/gpr_defconfig       | 1 -
>  arch/mips/configs/lemote2f_defconfig  | 1 -
>  arch/mips/configs/loongson3_defconfig | 1 -
>  arch/mips/configs/mtx1_defconfig      | 1 -
>  arch/mips/configs/rs90_defconfig      | 1 -
>  6 files changed, 6 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
