Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C5123D97
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 03:59:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d08T3sqSzDqVJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 13:59:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.68; helo=mail-ed1-f68.google.com;
 envelope-from=wens213@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csie.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47czsg4mmxzDqSR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 13:46:10 +1100 (AEDT)
Received: by mail-ed1-f68.google.com with SMTP id m8so350872edi.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 18:46:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vxwj4gd/9Empd7D3FvHODrnvOnRhpeyanogRcG726ys=;
 b=bwM2eRGKbXSQm4ETEfwLWAj+zOv1ivbdH+cYhtpkNVo6XRBuDy+/T+deOUSGCZ4Dy9
 2LXddYmMDjAXhxctAEEAmXkWOryge9p4JOjJ11CnQc3cbzSfi8ihMNCa7WEnMdnD/jhO
 +AEbA2FBePcsuhOCLSf1GVI0BzfNV3cDuhbrJa8hDAgMezYehLbjBHkl74axTWzS4C8o
 8HRAfm7HCgQfcPOTD9iLG4LWENyJH48U5nqe4z975k3YH91hzDChkmubcYT1X5HLspgt
 R7v0LsVa7qfevXyi4drV2y8Y7sIukgCpqgT/idLd9DslqvJsSPye5upnjYtRyhq+UbgE
 aPog==
X-Gm-Message-State: APjAAAW6iACKT3YL6VrQvFpJBobizfbL/58DBjj86JadMY+X3wg+MaHv
 ZDOqZlQpk2d4VF+c5H1xVgVky4y2wvI=
X-Google-Smtp-Source: APXvYqygHDpAQSR7lHHSXDewNqdd6p4bvv3ESFIgTCOPSCT/M3Sc22aD17tWoAIqsogH2CEw/r/zfw==
X-Received: by 2002:a17:906:69d1:: with SMTP id
 g17mr1705502ejs.238.1576637165284; 
 Tue, 17 Dec 2019 18:46:05 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51])
 by smtp.gmail.com with ESMTPSA id b9sm35943ejj.24.2019.12.17.18.46.04
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 18:46:04 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id j42so566076wrj.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 18:46:04 -0800 (PST)
X-Received: by 2002:adf:81e3:: with SMTP id 90mr1136437wra.23.1576637164034;
 Tue, 17 Dec 2019 18:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 18 Dec 2019 10:45:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v67kgMcV5hhURYzMCggeTSnOoupmYKDPViS0tiYFSxOfjA@mail.gmail.com>
Message-ID: <CAGb2v67kgMcV5hhURYzMCggeTSnOoupmYKDPViS0tiYFSxOfjA@mail.gmail.com>
Subject: Re: [PATCH 01/10] soc: sunxi: convert to
 devm_platform_ioremap_resource
To: Yangtao Li <tiny.windzz@gmail.com>, Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 18 Dec 2019 13:57:25 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, leoyang.li@nxp.com,
 "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>,
 Andy Gross <agross@kernel.org>, khalasa@piap.pl, Kukjin Kim <kgene@kernel.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jun Nie <jun.nie@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Dec 15, 2019 at 1:54 AM Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify code.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/soc/sunxi/sunxi_sram.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
> index 1b0d50f36349..f73fbcc73f51 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -320,7 +320,6 @@ static struct regmap_config sunxi_sram_emac_clock_regmap = {
>
>  static int sunxi_sram_probe(struct platform_device *pdev)
>  {
> -       struct resource *res;
>         struct dentry *d;
>         struct regmap *emac_clock;
>         const struct sunxi_sramc_variant *variant;
> @@ -331,8 +330,7 @@ static int sunxi_sram_probe(struct platform_device *pdev)
>         if (!variant)
>                 return -EINVAL;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       base = devm_ioremap_resource(&pdev->dev, res);
> +       base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(base))
>                 return PTR_ERR(base);
>
> --
> 2.17.1
>
