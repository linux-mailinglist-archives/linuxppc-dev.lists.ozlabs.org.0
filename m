Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D4129F8E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 00:09:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMh2w3YKzzDqvK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 10:09:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=jingoohan1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gy+FevCW; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMgGS1kpnzDqWR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 09:34:08 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id b19so2011107pld.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 15:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=odZpHbQegqT56U/cV/zJ1qrd6r3mGVChHF0VMSj69o0=;
 b=gy+FevCWq3xOKFvYbDpwz/v/EbxdJwTn9QVRUJOTJih66PW1TK/3NCZSJDPw9s+lse
 bkn74gnr4dgUfMBduEsxwTi2+ufO5e/+hUGIsMqkVs/R90SRyOZN7E7Oo/Uiz4+/kdKI
 XSLd+pdpeS8hOp+w4CCkgtaXITBk3FeqS/Atf8ilvae/ogwHTlVc0Ego1liS94BkKlv+
 1upTB8XaECpXOjZFIGOHsSRwFVRuMF4SuobL1D0hQWgog7GripUtaiOtQDlhGkAE3kHv
 vTu7ty07GqlJzrf6WKLjk+wXp1xMQLRtLDu6cF6UfdcVzOs3s0GSgD61pl8eeKqYlUAH
 skUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=odZpHbQegqT56U/cV/zJ1qrd6r3mGVChHF0VMSj69o0=;
 b=gBb9/RxgR7sbzrNJt++kaNSceYCs1LmdO+hR2bHXFR5g4Pv7OF9gCw0JuGmX6A8/ko
 KaIhqR4N/W5rDR13pW8789YNQ3n7jxOjwkrBO/ElpvNt2nwECl0Q0kh/1xIV5xvrNvX3
 rinQFTUyrDx7475d8e2EqnCojNmNd5MX7eIsLD3dijOaihrONqvFTPLOyIlo8a2kLQ6E
 oPcQyMJOCyLFK6PndxZE+/80kza2oGq5+arEcBuhEB4lrwoVGrMR4q+8Pm25rLZx8Dw1
 F5HVvXbzLxTLmt7e679s1i5TxO8hIM+MjVC5R7jM9jFS2ikwByh4p5WN3qO45MI8/9SG
 FLBA==
X-Gm-Message-State: AOAM530x7ccOoQApxRs29ysa5QlU3MgU2/PN1Y1Ixt+tefx7xd1C1R0F
 ICz6SJDpOL+FJQ/2O05ApQ4=
X-Google-Smtp-Source: ABdhPJz+1FMPSkLVT3GNpxHHfWtt2o0ojp3jORJQkn1z2v1aWL9snq6p3aEN0mFkDfNYztLrINb5ag==
X-Received: by 2002:a17:902:bd01:b029:d4:d73d:7644 with SMTP id
 p1-20020a170902bd01b02900d4d73d7644mr6117533pls.69.1604010843618; 
 Thu, 29 Oct 2020 15:34:03 -0700 (PDT)
Received: from SLXP216MB0477.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:9::5])
 by smtp.gmail.com with ESMTPSA id i24sm3912204pfd.7.2020.10.29.15.33.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 15:34:02 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 12/13] PCI: dwc: Move dw_pcie_setup_rc() to DWC common code
Thread-Topic: [PATCH 12/13] PCI: dwc: Move dw_pcie_setup_rc() to DWC common
 code
Thread-Index: AQHWrWuNe0SVTqZ+qUiqNCgd41OCHamvKtka
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 29 Oct 2020 22:29:06 +0000
Message-ID: <SLXP216MB047727F5D8FE67D796651A8BAA140@SLXP216MB0477.KORP216.PROD.OUTLOOK.COM>
References: <20201028204646.356535-1-robh@kernel.org>
 <20201028204646.356535-13-robh@kernel.org>
In-Reply-To: <20201028204646.356535-13-robh@kernel.org>
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
> All RC complex drivers must call dw_pcie_setup_rc(). The ordering of the
> call shouldn't be too important other than being after any RC resets.
>
> There's a few calls of dw_pcie_setup_rc() left as drivers implementing
> suspend/resume need it.
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
> Cc: Murali Karicheri <m-karicheri2@ti.com>
> Cc: Minghuan Lian <minghuan.Lian@nxp.com>
> Cc: Mingkai Hu <mingkai.hu@nxp.com>
> Cc: Roy Zang <roy.zang@nxp.com>
> Cc: Yue Wang <yue.wang@Amlogic.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Jesper Nilsson <jesper.nilsson@axis.com>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Xiaowei Song <songxiaowei@hisilicon.com>
> Cc: Binghui Wang <wangbinghui@hisilicon.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Stanimir Varbanov <svarbanov@mm-sol.com>
> Cc: Pratyush Anand <pratyush.anand@gmail.com>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: linux-omap@vger.kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@axis.com
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c           | 1 -
>  drivers/pci/controller/dwc/pci-exynos.c           | 1 -
>  drivers/pci/controller/dwc/pci-imx6.c             | 1 -
>  drivers/pci/controller/dwc/pci-keystone.c         | 2 --
>  drivers/pci/controller/dwc/pci-layerscape.c       | 2 --
>  drivers/pci/controller/dwc/pci-meson.c            | 2 --
>  drivers/pci/controller/dwc/pcie-armada8k.c        | 2 --
>  drivers/pci/controller/dwc/pcie-artpec6.c         | 1 -
>  drivers/pci/controller/dwc/pcie-designware-host.c | 1 +
>  drivers/pci/controller/dwc/pcie-designware-plat.c | 8 --------
>  drivers/pci/controller/dwc/pcie-histb.c           | 3 ---
>  drivers/pci/controller/dwc/pcie-kirin.c           | 2 --
>  drivers/pci/controller/dwc/pcie-qcom.c            | 1 -
>  drivers/pci/controller/dwc/pcie-spear13xx.c       | 2 --
>  drivers/pci/controller/dwc/pcie-uniphier.c        | 2 --
>  15 files changed, 1 insertion(+), 30 deletions(-)

[...]
