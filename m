Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E2363B69
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 08:24:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNxby4tmRz3bvj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 16:24:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=atmark-techno.com (client-ip=13.115.124.170;
 helo=gw.atmark-techno.com; envelope-from=dominique.martinet@atmark-techno.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 531 seconds by postgrey-1.36 at boromir;
 Mon, 19 Apr 2021 14:58:29 AEST
Received: from gw.atmark-techno.com (gw.atmark-techno.com [13.115.124.170])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FNvj16kj3z30Dk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:58:28 +1000 (AEST)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 by gw.atmark-techno.com (Postfix) with ESMTPS id 8CF2C8056E
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 13:49:33 +0900 (JST)
Received: by mail-ot1-f69.google.com with SMTP id
 u19-20020a9d4d930000b02902876395d43dso9223947otk.21
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Apr 2021 21:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nwmKkdj5vxFBpFK3bj8w7Gz2YNFOXfPhegLyPurLzW0=;
 b=unMmiYjzbuRG94xtK4RZs4k21NvF0q7sNSGpiiEOeOe0wsWVJmPfZoZgZsWUUqatib
 lD6n9XzmZbsPnL425tDYpCgcL4bB2IbPnZpkcxlWX5S7emlgwmFq2gEvFRiLPCgLPL1y
 CIo71wnauhojFkRXcNCugYciBkwVtkMa+4ZwR9gzwOC3Gqf+0md2evO2RXfBtlPCgdmJ
 8zXLqNnSCS685+gPtmsHJZXhAmBwyCNuLU9iH5z45TiTNjOKTANtn1ziPoH2d7gzTa/U
 98ueXZVmpzMonzv6vG/AN75OjwSDuIZBmctxn7mnlGNEWIyNoZw06viTSkCKqgQKzSRG
 qeEQ==
X-Gm-Message-State: AOAM532yspvr8u1RMshlFy1sA7Tt1idTBIgln1NAINWV32z0ePxZcHOp
 x6DXl7wyp+hGI/zq0n6f2Rz3Smhyk3FyOvPW6Yoi1sDSMZurdh8CTkJi9zmOtOjEqcmfMXXB7Mq
 7T3TzORqgsGem9EWNgbwIL0ZKqu6tGQ==
X-Received: by 2002:a17:90a:430e:: with SMTP id
 q14mr10145467pjg.189.1618807761124; 
 Sun, 18 Apr 2021 21:49:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxUh9TJ2x/K//IB2lTaeXhs2rGXIpLK5cuzzNIi1YdNWpQlLZsRv610IvzYjHsCM08ZYf1MA==
X-Received: by 2002:a17:90a:430e:: with SMTP id
 q14mr10145444pjg.189.1618807760853; 
 Sun, 18 Apr 2021 21:49:20 -0700 (PDT)
Received: from pc-0115 (117.209.187.35.bc.googleusercontent.com.
 [35.187.209.117])
 by smtp.gmail.com with ESMTPSA id l22sm13247239pjc.13.2021.04.18.21.49.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Apr 2021 21:49:20 -0700 (PDT)
Received: from martinet by pc-0115 with local (Exim 4.94)
 (envelope-from <martinet@pc-0115>)
 id 1lYLqX-0016Kg-U8; Mon, 19 Apr 2021 13:49:17 +0900
Date: Mon, 19 Apr 2021 13:49:07 +0900
From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
Subject: Re: [RFC v1 PATCH 1/3] drivers: soc: add support for
 soc_device_match returning -EPROBE_DEFER
Message-ID: <YH0Lwy2AYpXaJIex@atmark-techno.com>
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-2-alice.guo@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210419042722.27554-2-alice.guo@oss.nxp.com>
X-Mailman-Approved-At: Mon, 19 Apr 2021 16:21:18 +1000
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
Cc: ulf.hansson@linaro.org, aymen.sghaier@nxp.com, geert+renesas@glider.be,
 rafael@kernel.org, airlied@linux.ie, mturquette@baylibre.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 a.hajda@samsung.com, netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 wim@linux-watchdog.org, herbert@gondor.apana.org.au, horia.geanta@nxp.com,
 khilman@baylibre.com, joro@8bytes.org, narmstrong@baylibre.com,
 linux-staging@lists.linux.dev, iommu@lists.linux-foundation.org,
 peter.ujfalusi@gmail.com, kishon@ti.com, tony@atomide.com,
 linux-omap@vger.kernel.org, stern@rowland.harvard.edu, kuba@kernel.org,
 linus.walleij@linaro.org, linux@roeck-us.net, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Roy.Pledge@nxp.com, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, edubezval@gmail.com, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, ssantosh@kernel.org,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, balbi@kernel.org, tomba@kernel.org,
 sboyd@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, adrian.hunter@intel.com, robert.foss@linaro.org,
 leoyang.li@nxp.com, linux@prisktech.co.nz, vkoul@kernel.org,
 linux-crypto@vger.kernel.org, daniel@ffwll.ch, j-keerthy@ti.com,
 dmaengine@vger.kernel.org, jyri.sarha@iki.fi, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

First comment overall for the whole serie:
Since it is the solution I had suggested when I reported the problem[1]
I have no qualm on the approach, comments for individual patches
follow.

[1] http://lore.kernel.org/r/YGGZJjAxA1IO+/VU@atmark-techno.com


Alice Guo (OSS) wrote on Mon, Apr 19, 2021 at 12:27:20PM +0800:
> From: Alice Guo <alice.guo@nxp.com>
> 
> In i.MX8M boards, the registration of SoC device is later than caam
> driver which needs it. Caam driver needs soc_device_match to provide
> -EPROBE_DEFER when no SoC device is registered and no
> early_soc_dev_attr.

This patch should be last in the set: you can't have soc_device_match
return an error before its callers handle it.

> Signed-off-by: Alice Guo <alice.guo@nxp.com>

As the one who reported the problem I would have been appreciated being
at least added to Ccs... I only happened to notice you posted this by
chance.

There is also not a single Fixes tag -- I believe this commit should
have Fixes: 7d981405d0fd ("soc: imx8m: change to use platform driver")
but I'm not sure how such tags should be handled in case of multiple
patches fixing something.

-- 
Dominique
