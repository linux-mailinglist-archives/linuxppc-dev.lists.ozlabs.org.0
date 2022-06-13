Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E5954A00E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 22:48:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMNvN5gc7z3cgQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 06:48:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.180; helo=mail-il1-f180.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMNtz4y8hz2yL2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 06:48:11 +1000 (AEST)
Received: by mail-il1-f180.google.com with SMTP id y17so5148002ilj.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 13:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/dzRBMIn98y05EN99Sgq5WDsEwo7wpH66xTE6XCo/M4=;
        b=iflkaZVxmeu6wWuL2KwDrhBFclUUwlK4vq7wujuru7msUdVVULiioaa2AOWXwJ4wZ5
         mNkbvIKxB04jRuPxBEJp9e+844s4NwbOiN9/bSyOJOenZuWTtRwJ6+rii4iR6i+0EnhA
         GHV6jB8WZoGq8cU59LX5gUBanIhz6jbieBWOolnigC75cTglejwLuD0/M5Su0ErOrIz9
         iHmuWmTvTk7pYSaqB2qpwkRP04mfAFnbq3b8/aJJf9bhYoGzXDKNWbBdqECMHxAF38co
         hYiH0CBt3TRAaBgiOcY9vp9h13R+fax39G5LtpFyKVYZRoCSx3y6C8EMgS8YWasRq88S
         y7EA==
X-Gm-Message-State: AJIora9KUqK415szP9S9BUyRw3rzH77Yn7Rx95e8jxQH6xu3MQu5bXSR
	Jf6lCG7gj8sKa+HeIiYq6A==
X-Google-Smtp-Source: AGRyM1uVO/KYjaDwGOXreGf4KGdEqy/t353ouqbFZgp5s/y6kuWD2fxXl3ut4zPLn500QHJwX/rd6w==
X-Received: by 2002:a92:ca45:0:b0:2d1:b7cf:26a9 with SMTP id q5-20020a92ca45000000b002d1b7cf26a9mr962751ilo.52.1655153288816;
        Mon, 13 Jun 2022 13:48:08 -0700 (PDT)
Received: from robh.at.kernel.org ([69.39.28.171])
        by smtp.gmail.com with ESMTPSA id c2-20020a92c8c2000000b002d11397f4f9sm4380280ilq.74.2022.06.13.13.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 13:48:08 -0700 (PDT)
Received: (nullmailer pid 56167 invoked by uid 1000);
	Mon, 13 Jun 2022 20:48:06 -0000
Date: Mon, 13 Jun 2022 14:48:06 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v4 15/18] PCI: dwc: Add dw_ prefix to the pcie_port
 structure name
Message-ID: <20220613204806.GA55629-robh@kernel.org>
References: <20220610082535.12802-1-Sergey.Semin@baikalelectronics.ru>
 <20220610082535.12802-16-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610082535.12802-16-Sergey.Semin@baikalelectronics.ru>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org, Binghui Wang <wangbinghui@hisilicon.com>, Frank Li <Frank.Li@nxp.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>, Alim Akhtar <alim.akhtar@samsung.com>, Jonathan Chocron <jonnyc@amazon.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Srikanth Thokala <srikanth.thokala@intel.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.
 com, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Rahul Tanwar <rtanwar@maxlinear.com>, Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Xiaowei Song <songxiaowei@hisilicon.com>, Greentime Hu <greentime.hu@sifive.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-omap@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Yue Wang <yue.wang@amlogic.com>, linux-samsung-soc@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org, Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, linuxppc-dev@lists.ozlabs.org, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, Serge Semin 
 <fancer.lancer@gmail.com>, Stanimir Varbanov <svarban

ov@mm-sol.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 10, 2022 at 11:25:31AM +0300, Serge Semin wrote:
> All of the DW PCIe core driver entities have names with the dw_ prefix in
> order to easily distinguish local and common PCIe name spaces. All except
> the pcie_port structure which contains the DW PCIe Root Port descriptor.
> For historical reason the structure has retained the original name since
> commit 340cba6092c2 ("pci: Add PCIe driver for Samsung Exynos") when
> the DW PCIe IP-core support was added to the kernel. Let's finally fix
> that by adding the dw_ prefix to the structure name and by adding the _rp
> suffix to be similar to the EP counterpart. Thus the name will be coherent
> with the common driver naming policy. It shall make the driver code more
> readable eliminating visual confusion between the local and generic PCI
> name spaces.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v4:
> - This is a new patch created on the v4 lap of the series.
> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c       | 12 +++----
>  drivers/pci/controller/dwc/pci-exynos.c       |  6 ++--
>  drivers/pci/controller/dwc/pci-imx6.c         |  6 ++--
>  drivers/pci/controller/dwc/pci-keystone.c     | 20 +++++------
>  drivers/pci/controller/dwc/pci-layerscape.c   |  2 +-
>  drivers/pci/controller/dwc/pci-meson.c        |  2 +-
>  drivers/pci/controller/dwc/pcie-al.c          |  6 ++--
>  drivers/pci/controller/dwc/pcie-armada8k.c    |  4 +--
>  drivers/pci/controller/dwc/pcie-artpec6.c     |  4 +--
>  .../pci/controller/dwc/pcie-designware-host.c | 36 +++++++++----------
>  .../pci/controller/dwc/pcie-designware-plat.c |  2 +-
>  drivers/pci/controller/dwc/pcie-designware.h  | 30 ++++++++--------
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c |  4 +--
>  drivers/pci/controller/dwc/pcie-fu740.c       |  2 +-
>  drivers/pci/controller/dwc/pcie-histb.c       | 10 +++---
>  drivers/pci/controller/dwc/pcie-intel-gw.c    |  6 ++--
>  drivers/pci/controller/dwc/pcie-keembay.c     |  4 +--
>  drivers/pci/controller/dwc/pcie-kirin.c       |  2 +-
>  drivers/pci/controller/dwc/pcie-qcom.c        |  4 +--
>  drivers/pci/controller/dwc/pcie-spear13xx.c   |  6 ++--
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 22 ++++++------
>  drivers/pci/controller/dwc/pcie-uniphier.c    | 10 +++---
>  drivers/pci/controller/dwc/pcie-visconti.c    |  6 ++--
>  23 files changed, 103 insertions(+), 103 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
