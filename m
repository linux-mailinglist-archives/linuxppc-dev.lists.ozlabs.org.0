Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C3F29F7EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 23:28:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMg7L4C1SzDqf9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 09:27:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=jingoohan1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Y9nHCkew; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMg5j5D5czDqMG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 09:26:32 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id 10so3576360pfp.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 15:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=mkEgROIngf3O0w1+XcYDyb5JIBk2dNaftiZ6UBvH2VU=;
 b=Y9nHCkewbzooPqcIlQFiHkBNDQnXob8eGJMErBn5Kx5FzCfsDuykMaviTzO3vZ7Qnh
 8zWQwRu8DPDT73CdsSIaxrCemeuUruBmPaHs6ieXkGYxgjSxFi/844DmgHOiojMnWXeQ
 NajtcKpsAZ9W/cfZb9bzIkHwOP7aMyTJ4e/LGWa2RGc99u7NDIEplSRzWdGJuhjGU+2O
 KKm4xeT85V500fvlJX8STmkmnn2dRn/OFxCbq1WY6zZ5uIl14OnSbjUgeNZZrEQ+THvZ
 Z2vRyPIq5jyc1DFSExiBvPSOpvbduMcgnKoUE9ixwXQNytNE+9ahAJxbj7dzXASdEjpf
 PsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=mkEgROIngf3O0w1+XcYDyb5JIBk2dNaftiZ6UBvH2VU=;
 b=FdLGV5CSi2VA6no5KaW+loPOw4Qpz7blgzku/YKWYHP4DtRXQZh8F/xFfJ2/gsKoSH
 73CS89tb6i4OkuT0/SA7QAn+RXnFDQd26EyG3QO5ynerg34k1YEa4JqkDNqoNy/CGJSA
 gNtwstczj4fliBv0pEzRCDMjY3Vl1WwJucBSJhJ5ImD5VXi5qoeFa/l335zsGKAiZOwV
 ZsUu++WZ9Fcdw29S5o1KdgJHq55lCnd95yhu/oz8S4+suHaa/Euo/2DzggC1nVVXyAwW
 YE9BKS7D17q4IPZNhQXty1iNA6EKoG696J5dSAS7ZtTbX0tXD8S3HC5oIlhDAPFM2vgl
 Yg1w==
X-Gm-Message-State: AOAM5323d56WLnOQxEx78UfB71Nq+sJ8BwJ2D42LS4HukabjjrAE+B5W
 nK04Z4zguOn2DUKse0Cy4f0=
X-Google-Smtp-Source: ABdhPJxLiaVskm2lyywheCpLlw6KpmmKQnxfOGZyB+6+99Bzc075kKu5TiLbCw/mexj2EE4uIqrGNg==
X-Received: by 2002:a62:dd56:0:b029:155:8165:c6c2 with SMTP id
 w83-20020a62dd560000b02901558165c6c2mr6220236pff.3.1604010389698; 
 Thu, 29 Oct 2020 15:26:29 -0700 (PDT)
Received: from SL2P216MB0475.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:19::5])
 by smtp.gmail.com with ESMTPSA id
 q123sm3967727pfq.56.2020.10.29.15.26.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 15:26:28 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 11/13] PCI: dwc: Move dw_pcie_msi_init() into core
Thread-Topic: [PATCH 11/13] PCI: dwc: Move dw_pcie_msi_init() into core
Thread-Index: AQHWrWuMH1iwupoOnEKPhemhbtsXGKmvKimM
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 29 Oct 2020 22:26:17 +0000
Message-ID: <SL2P216MB0475B8EB98EF27395F5D381FAA140@SL2P216MB0475.KORP216.PROD.OUTLOOK.COM>
References: <20201028204646.356535-1-robh@kernel.org>
 <20201028204646.356535-12-robh@kernel.org>
In-Reply-To: <20201028204646.356535-12-robh@kernel.org>
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
> The host drivers which call dw_pcie_msi_init() are all the ones using
> the built-in MSI controller, so let's move it into the common DWC code.
>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

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
> Cc: linux-omap@vger.kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@axis.com
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c           |  2 --
>  drivers/pci/controller/dwc/pci-exynos.c           |  4 ----
>  drivers/pci/controller/dwc/pci-imx6.c             |  1 -
>  drivers/pci/controller/dwc/pci-meson.c            |  1 -
>  drivers/pci/controller/dwc/pcie-artpec6.c         |  1 -
>  drivers/pci/controller/dwc/pcie-designware-host.c |  8 +++++---
>  drivers/pci/controller/dwc/pcie-designware-plat.c |  1 -
>  drivers/pci/controller/dwc/pcie-designware.h      | 10 ----------
>  drivers/pci/controller/dwc/pcie-histb.c           |  2 --
>  drivers/pci/controller/dwc/pcie-kirin.c           |  1 -
>  drivers/pci/controller/dwc/pcie-qcom.c            |  2 --
>  drivers/pci/controller/dwc/pcie-spear13xx.c       |  6 +-----
>  drivers/pci/controller/dwc/pcie-tegra194.c        |  2 --
>  drivers/pci/controller/dwc/pcie-uniphier.c        |  1 -
>  14 files changed, 6 insertions(+), 36 deletions(-)

[...]
