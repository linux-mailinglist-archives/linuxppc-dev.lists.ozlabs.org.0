Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D39829F7BD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 23:21:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMfzX2VgCzDqdx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 09:21:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=jingoohan1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=efjnQN8B; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMfwk1sBQzDqcn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 09:18:44 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id o3so3484859pgr.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 15:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=0JLyqfoztBsM4bd8GDzwKmcvHsdDBe0Vipxzr6rfQ6o=;
 b=efjnQN8BYX87Tjs3cdlMM5rbHmXG6lM/LdGTA8BLHkD+wr3lwYOVZBW7+BdpO4MfuN
 +TlDghiZ4ZXBSa0vZBgvec8u4PN3mBdzhbeITS/6g7uOmseOxMiweI6rZW6wgDEsELgA
 5GIEsVfBMgcdeomUPNI8IW0drzniTV6u41RzzzL1eFFz/g2M/b9y9C1bkx89HRd0ewsE
 iKkqWm+ECzvRLnc685+eeX+FsIH9QcAI09kKGKWs6wHyiNsQxDhRzR8VRrcDoYOivPeO
 LxUYW7C+uSJOblQZDGo0+yJIT7QWRCLremt1WF5O1mljBaXEUpv/5tugMPqYGftgdYCw
 41FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=0JLyqfoztBsM4bd8GDzwKmcvHsdDBe0Vipxzr6rfQ6o=;
 b=T4YR9kBJgsagk01Y2oUaZQRIHH2HAC8UHJikLYQiNKwKPFjdkYvQ91xdF0UKUD6RHY
 qWClJR2arJrm/AETYTR4jfoODJXszQPAxMYBKx7y/n54rUw1rOwCAXeEGz3KNXCqMIuz
 XNa4ftjT21ZEjiP1Uk4TwrNwhJp/O3klTnjoP6jSVrVLuSl+WcFDfpzG+MAhyi8K1myq
 OIOgwVFoMloRKHaXU6YW6kDxibIlobChsYXHnrHgfl9PZmbGhGOQKUgwJ96xioq2UwRK
 xlhE78RS2Qn2FrYIqq+MOXmX/NSB+2WuZ+7fNsO2JlXGhrtGrC2YOcSMGs4SZeLUV/Rf
 G7Mg==
X-Gm-Message-State: AOAM533TzZCvmwtriiD2RSAanI0uTRP44av+GBauslpuABKXi+IkYtzX
 zH420K9DU731FVAMa+ZO3pQ=
X-Google-Smtp-Source: ABdhPJyKzky7Hlxd2ju++O4t3nei2/mY1jw3pY46QxIKFwE+ZIP26mYCGKOsIJiQiTBtuu8EYwlZAg==
X-Received: by 2002:aa7:9811:0:b029:15d:2c0e:e947 with SMTP id
 e17-20020aa798110000b029015d2c0ee947mr6362369pfl.76.1604009920927; 
 Thu, 29 Oct 2020 15:18:40 -0700 (PDT)
Received: from SL2P216MB0475.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:19::5])
 by smtp.gmail.com with ESMTPSA id
 20sm3913757pfh.219.2020.10.29.15.18.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 15:18:40 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 08/13] PCI: dwc: Move MSI interrupt setup into DWC common
 code
Thread-Topic: [PATCH 08/13] PCI: dwc: Move MSI interrupt setup into DWC common
 code
Thread-Index: AQHWrWuFOQ/rIkS/ZEGWk+b2wGddk6mvJ/u9
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 29 Oct 2020 22:18:28 +0000
Message-ID: <SL2P216MB04754345E108C4B2DD752C1FAA140@SL2P216MB0475.KORP216.PROD.OUTLOOK.COM>
References: <20201028204646.356535-1-robh@kernel.org>
 <20201028204646.356535-9-robh@kernel.org>
In-Reply-To: <20201028204646.356535-9-robh@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-arm-kernel@axis.com" <linux-arm-kernel@axis.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Kevin Hilman <khilman@baylibre.com>,
 Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Yue Wang <yue.wang@Amlogic.com>,
 Murali Karicheri <m-karicheri2@ti.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Andy Gross <agross@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Han Jingoo <jingoohan1@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/28/20, 4:47 PM, Rob Herring wrote:
>=20
> Platforms using the built-in DWC MSI controller all have a dedicated
> interrupt with "msi" name or at index 0, so let's move setting up the
> interrupt to the common DWC code.
>
> spear13xx and dra7xx are the 2 oddballs with muxed interrupts, so
> we need to prevent configuring the MSI interrupt by setting msi_irq
> to negative.
>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Yue Wang <yue.wang@Amlogic.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jesper Nilsson <jesper.nilsson@axis.com>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Xiaowei Song <songxiaowei@hisilicon.com>
> Cc: Binghui Wang <wangbinghui@hisilicon.com>
> Cc: Stanimir Varbanov <svarbanov@mm-sol.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Pratyush Anand <pratyush.anand@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@axis.com
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c       |  3 +++
>  drivers/pci/controller/dwc/pci-exynos.c       |  6 -----
>  drivers/pci/controller/dwc/pci-imx6.c         |  6 -----
>  drivers/pci/controller/dwc/pci-meson.c        |  6 -----
>  drivers/pci/controller/dwc/pcie-artpec6.c     |  6 -----
> .../pci/controller/dwc/pcie-designware-host.c | 11 +++++++++-
>  .../pci/controller/dwc/pcie-designware-plat.c |  6 -----
>  drivers/pci/controller/dwc/pcie-histb.c       |  6 -----
>  drivers/pci/controller/dwc/pcie-kirin.c       | 22 -------------------
>  drivers/pci/controller/dwc/pcie-qcom.c        |  8 -------
>  drivers/pci/controller/dwc/pcie-spear13xx.c   |  1 +
>  drivers/pci/controller/dwc/pcie-tegra194.c    |  8 -------
>  drivers/pci/controller/dwc/pcie-uniphier.c    |  6 -----
>  13 files changed, 14 insertions(+), 81 deletions(-)

[...]
