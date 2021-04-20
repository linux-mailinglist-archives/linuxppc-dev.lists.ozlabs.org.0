Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 722633655B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 11:47:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPf4R2hH3z309j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 19:47:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gvB2Kjtu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=peter.ujfalusi@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gvB2Kjtu; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPdtQ6hxYz2xxw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 19:39:08 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id a25so29475898ljm.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 02:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0cgFeiaCJmuEwdxXqsfxCg9P2r8ydkzAaV1kqEK2h0w=;
 b=gvB2Kjtuq3c6hDrfV3q09iYFnvk6b3RYxllwzrHlnk+X8nahI/9ZgjrPXry5x6L08J
 ZqUJbyfgrU/17jihKD9RUFrWkKnPLnaOIz5SfrAgdH3V6GQqhJBsJvkRB5ags8nff6/g
 3cv4VDvDqV2sSqUfb8205g5G7kjLsdASVbSOa0/k/nLxNeajkm1KtVIIys66vWeGWX+c
 R9IfZtnbhr3czfjp/hluYCcP4dflvCu/ccDgljZf5znlxpNeSE4/7JXLhxawyn0f1SMK
 6r42KR2eqy29tw7Neimeshqmq4hBcMWCqRWk5EiKSmXItxwa+o1xYehRrMSSHpcpkKnQ
 slWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0cgFeiaCJmuEwdxXqsfxCg9P2r8ydkzAaV1kqEK2h0w=;
 b=fU1IQpe1IBIoo2PZgL7lCnLZTYUDCMaQcsqqH1tbkyL1gV/6ITg2KUgDoDTwooq6CP
 ljN7O851ueGm5+xFp0Gq4wuvhdWC8PY4h/BFwVH7UEuuQbYkwhcFFm75Y7X3rWsh84pi
 kPHsiJYPctn5HR+6/9qrcLt+6NuB7VZzXuBfENQWDdLzYlcGDSEf/56ONu3PlkjuUosn
 2DaKPaYp+tMhBsRQQBmm9upGvmGejK7t4SZQBJrY6Oqc5JTywTdXKtAnTTdGHQ3X3pYV
 B6rkScF1X+YjhjOwCuCOX+L5KhjFJOBAnPWlqYXSOtVvum56FGXpoA8rAWyCMNZS/fno
 mtTw==
X-Gm-Message-State: AOAM532+OZZ5MDuY3ENF4c9VZ+JPceokicpFG2IZm0UXjGgH/f2HP0h5
 IdcMviAha0CEpgNqCkkicXs=
X-Google-Smtp-Source: ABdhPJxU9OnhgUvmhfsaX0XQNxKFEPf1HsBVx73r0wgo9gbzwsyEGSVJJz6LhIbQa4C3GIRFxd4WnA==
X-Received: by 2002:a2e:9f49:: with SMTP id v9mr14102607ljk.44.1618911541931; 
 Tue, 20 Apr 2021 02:39:01 -0700 (PDT)
Received: from [10.0.0.42] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id n22sm723197lfu.144.2021.04.20.02.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 02:39:01 -0700 (PDT)
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>, gregkh@linuxfoundation.org,
 rafael@kernel.org, horia.geanta@nxp.com, aymen.sghaier@nxp.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, tony@atomide.com,
 geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 vkoul@kernel.org, a.hajda@samsung.com, narmstrong@baylibre.com,
 robert.foss@linaro.org, airlied@linux.ie, daniel@ffwll.ch,
 khilman@baylibre.com, tomba@kernel.org, jyri.sarha@iki.fi, joro@8bytes.org,
 will@kernel.org, mchehab@kernel.org, ulf.hansson@linaro.org,
 adrian.hunter@intel.com, kishon@ti.com, kuba@kernel.org,
 linus.walleij@linaro.org, Roy.Pledge@nxp.com, leoyang.li@nxp.com,
 ssantosh@kernel.org, matthias.bgg@gmail.com, edubezval@gmail.com,
 j-keerthy@ti.com, balbi@kernel.org, linux@prisktech.co.nz,
 stern@rowland.harvard.edu, wim@linux-watchdog.org, linux@roeck-us.net
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
Message-ID: <2924b8af-d176-01b1-a221-5219c1128494@gmail.com>
Date: Tue, 20 Apr 2021 12:40:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210419042722.27554-4-alice.guo@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Apr 2021 19:46:37 +1000
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
Cc: linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alice,

On 4/19/21 7:27 AM, Alice Guo (OSS) wrote:
> From: Alice Guo <alice.guo@nxp.com>
> 
> Update all the code that use soc_device_match because add support for
> soc_device_match returning -EPROBE_DEFER.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>  drivers/bus/ti-sysc.c                         |  2 +-
>  drivers/clk/renesas/r8a7795-cpg-mssr.c        |  4 +++-
>  drivers/clk/renesas/rcar-gen2-cpg.c           |  2 +-
>  drivers/clk/renesas/rcar-gen3-cpg.c           |  2 +-
>  drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c       |  7 ++++++-
>  drivers/dma/ti/k3-psil.c                      |  3 +++
>  drivers/dma/ti/k3-udma.c                      |  2 +-
>  drivers/gpu/drm/bridge/nwl-dsi.c              |  2 +-
>  drivers/gpu/drm/meson/meson_drv.c             |  4 +++-
>  drivers/gpu/drm/omapdrm/dss/dispc.c           |  2 +-
>  drivers/gpu/drm/omapdrm/dss/dpi.c             |  4 +++-
>  drivers/gpu/drm/omapdrm/dss/dsi.c             |  3 +++
>  drivers/gpu/drm/omapdrm/dss/dss.c             |  3 +++
>  drivers/gpu/drm/omapdrm/dss/hdmi4_core.c      |  3 +++
>  drivers/gpu/drm/omapdrm/dss/venc.c            |  4 +++-
>  drivers/gpu/drm/omapdrm/omap_drv.c            |  3 +++
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  4 +++-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  2 +-
>  drivers/gpu/drm/tidss/tidss_dispc.c           |  4 +++-
>  drivers/iommu/ipmmu-vmsa.c                    |  7 +++++--
>  drivers/media/platform/rcar-vin/rcar-core.c   |  2 +-
>  drivers/media/platform/rcar-vin/rcar-csi2.c   |  2 +-
>  drivers/media/platform/vsp1/vsp1_uif.c        |  4 +++-
>  drivers/mmc/host/renesas_sdhi_core.c          |  2 +-
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  2 +-
>  drivers/mmc/host/sdhci-of-esdhc.c             | 21 ++++++++++++++-----
>  drivers/mmc/host/sdhci-omap.c                 |  2 +-
>  drivers/mmc/host/sdhci_am654.c                |  2 +-
>  drivers/net/ethernet/renesas/ravb_main.c      |  4 +++-
>  drivers/net/ethernet/ti/am65-cpsw-nuss.c      |  2 +-
>  drivers/net/ethernet/ti/cpsw.c                |  2 +-
>  drivers/net/ethernet/ti/cpsw_new.c            |  2 +-
>  drivers/phy/ti/phy-omap-usb2.c                |  4 +++-
>  drivers/pinctrl/renesas/core.c                |  2 +-
>  drivers/pinctrl/renesas/pfc-r8a7790.c         |  5 ++++-
>  drivers/pinctrl/renesas/pfc-r8a7794.c         |  5 ++++-
>  drivers/soc/fsl/dpio/dpio-driver.c            | 13 ++++++++----
>  drivers/soc/renesas/r8a774c0-sysc.c           |  5 ++++-
>  drivers/soc/renesas/r8a7795-sysc.c            |  2 +-
>  drivers/soc/renesas/r8a77990-sysc.c           |  5 ++++-
>  drivers/soc/ti/k3-ringacc.c                   |  2 +-
>  drivers/staging/mt7621-pci/pci-mt7621.c       |  2 +-
>  drivers/thermal/rcar_gen3_thermal.c           |  4 +++-
>  drivers/thermal/ti-soc-thermal/ti-bandgap.c   | 10 +++++++--
>  drivers/usb/gadget/udc/renesas_usb3.c         |  2 +-
>  drivers/usb/host/ehci-platform.c              |  4 +++-
>  drivers/usb/host/xhci-rcar.c                  |  2 +-
>  drivers/watchdog/renesas_wdt.c                |  2 +-
>  48 files changed, 131 insertions(+), 52 deletions(-)
> 

...

> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 96ad21869ba7..50a4c8f0993d 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -5188,7 +5188,7 @@ static int udma_probe(struct platform_device *pdev)
>  	ud->match_data = match->data;
>  
>  	soc = soc_device_match(k3_soc_devices);
> -	if (!soc) {
> +	if (!IS_ERR(soc) && !soc) {

this does not sound right...

if (!soc || IS_ERR(soc))
or
if (IS_ERR_OR_NULL(soc))
is even better.

>  		dev_err(dev, "No compatible SoC found\n");
>  		return -ENODEV;

There might be a clever macro for it, but:

return soc ? PTR_ERR(soc) : -ENODEV;

>  	}

-- 
Péter
