Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 437B52C8D99
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 20:02:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClF2q3FBbzDqHJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 06:01:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.66; helo=mail-wr1-f66.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClDsn31GBzDqty
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 05:54:05 +1100 (AEDT)
Received: by mail-wr1-f66.google.com with SMTP id 64so17600395wra.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 10:54:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J0Y4dG+GSInC75horYKTdpMJ72uEPkG0rsUqEhklRfs=;
 b=RAjhU/mpJgTP1cKv/xReptXvhEe8Sf8jvz1nAqbJlJYHHANDD7t3augINEg1uKyXPV
 6bcSZqz+eZ6TPbJ9vXp9pDqPeCwRz4HBGeSkSozunIyS+Nc2fKMNRmCJiONsYWCs8aPP
 cvW1M6q7+DQcb7Q83pl0xumP74aV9Pn0aKvid3HUhSCWNE4sMgNqPLRJPD5Ydo8XQapN
 ehDWQQI6u9repejG/4VHEXTlLRWM+B/lP7or/rsLAO5Gsc5Y/1Wp8Oj3ByN9G1hUFNVx
 o59EUYNujACYSz3p3rztcGmPXMad+EvcyfJFvKavdgQhtlk+O8E/MBcl7MhrI7JB56Fb
 ssIw==
X-Gm-Message-State: AOAM530wUjNP2g9IPwPf4mq7+reMb1lExXmS64x5s+5Aec4Dy3hfywIa
 KDrl8/ObAoxANRTsUC+KKEQ=
X-Google-Smtp-Source: ABdhPJzaY6oSMK9XtE7h+p3mGfqluRRVSwB1Bil1Ye28LiLYVgIzYdnlv4x47IHxrw1EjuGuSJVlFg==
X-Received: by 2002:a5d:688b:: with SMTP id h11mr29587757wru.417.1606762442112; 
 Mon, 30 Nov 2020 10:54:02 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id w5sm24515754wrm.29.2020.11.30.10.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 10:54:00 -0800 (PST)
Date: Mon, 30 Nov 2020 20:53:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Subject: Re: [PATCH 5/5] powerpc/configs: drop unused BACKLIGHT_GENERIC option
Message-ID: <20201130185359.GE29434@kozik-lap>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-6-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130152137.24909-6-andrey.zhizhikin@leica-geosystems.com>
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

On Mon, Nov 30, 2020 at 03:21:37PM +0000, Andrey Zhizhikin wrote:
> Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") removed geenric_bl driver from the tree, together with
> corresponding config option.
> 
> Remove BACKLIGHT_GENERIC config item from generic-64bit_defconfig.
> 
> Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
> ---
>  arch/powerpc/configs/powernv_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
