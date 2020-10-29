Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3D129F7E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 23:26:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMg5R3tqQzDqQh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 09:26:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=jingoohan1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tBJct0dO; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMg3B6mS5zDqLp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 09:24:21 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id 15so3492439pgd.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 15:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=9mqbTtWDUKSZ1WPBFs+gFlrLeX5B0ppunvO1L1WoE6Q=;
 b=tBJct0dOj+8ac7g5SqfP/LNRCHS59hKwwbbqYi7lNSKlrhy/NDKVbecFO37UWLFSp/
 wslaeWTzhgor+pJeRp4v4aqxuk1RlwQu3T14KY0fe1VHrzCOVOurZfXjDiNFQNHPtvIr
 fme+iceW0Mh6HMjDSqOaLFQMu9czNnfzN6jWy7MGypoGZ+uZvmTQ+uVaVQyADFNSzfHN
 puKdoYBwGf6oN8GqUzBpQA9AV5euZaDb1HjxJBVy3nPBOiRn4DO60EX1QYShMUER2Qun
 YgvMXDLhc1c/1EIzR9jy1K6BC4jgBAnu4YWfqGnJb0qP2CCWhoYIXKftkZ6bN2osiqQk
 VJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=9mqbTtWDUKSZ1WPBFs+gFlrLeX5B0ppunvO1L1WoE6Q=;
 b=jgo1mNk2Jc6C5TxQESZZhVHcRTiQNmBxAxhmHe8/+EiU6boeqoCut0xYBrmUexFXIY
 Zta5ZqaFZC1ctmUWkNbJCJ3sRXQ5AIH0QLXTSNGrTcCngCbofwu8ryV59ZOjLIqgp/lO
 GaSJfl0xfZxau2NG12CywKOfaTIvbOWhIzG822rl4FIRDsOKYsjlpYUH+XjgKmtojpfY
 uWULhk+DqqIz9hm0OaKvSPzNpZIUcAwj9c1U+zteCG6rQ7v7FdrCI5Qf09NDDNAoPlnc
 pw/OgsKjsGdZenu0u0cbzFI4XzKgfTLfx7dHf0WN8+j18QPceGy4og9VrFsZzMnRlLLb
 iw3A==
X-Gm-Message-State: AOAM533+sRWxj3xOZqOW5264WR1EXfojycCTEvqe5aTlSuDSuhBuSd/Q
 dh+yrXUN15D2wSIpWprqOWg=
X-Google-Smtp-Source: ABdhPJyf9HkO546mjW9pBJiNrvmxxbKS5PCAVoKRcNjZQMkBpSaL2UdBzGRuMr78otZem6jWtaFUtw==
X-Received: by 2002:a17:90a:7c03:: with SMTP id
 v3mr1953144pjf.233.1604010258165; 
 Thu, 29 Oct 2020 15:24:18 -0700 (PDT)
Received: from SL2P216MB0475.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:19::5])
 by smtp.gmail.com with ESMTPSA id
 q16sm3686700pff.52.2020.10.29.15.24.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 15:24:17 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 10/13] PCI: dwc: Move link handling into common code
Thread-Topic: [PATCH 10/13] PCI: dwc: Move link handling into common code
Thread-Index: AQHWrWuJoIKvQ2UL9k+TQsNhRy2uqqmvKY0c
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 29 Oct 2020 22:24:06 +0000
Message-ID: <SL2P216MB04751BBE5822E3BA7DA91D76AA140@SL2P216MB0475.KORP216.PROD.OUTLOOK.COM>
References: <20201028204646.356535-1-robh@kernel.org>
 <20201028204646.356535-11-robh@kernel.org>
In-Reply-To: <20201028204646.356535-11-robh@kernel.org>
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
> All the DWC drivers do link setup and checks at roughly the same time.
> Let's use the existing .start_link() hook (currently only used in EP
> mode) and move the link handling to the core code.
>
> The behavior for a link down was inconsistent as some drivers would fail
> probe in that case while others succeed. Let's standardize this to
> succeed as there are usecases where devices (and the link) appear later
> even without hotplug. For example, a reconfigured FPGA device.
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
>  drivers/pci/controller/dwc/pci-dra7xx.c       |  2 -
>  drivers/pci/controller/dwc/pci-exynos.c       | 41 +++++++----------
>  drivers/pci/controller/dwc/pci-imx6.c         |  9 ++--
>  drivers/pci/controller/dwc/pci-keystone.c     |  9 ----
>  drivers/pci/controller/dwc/pci-meson.c        | 24 ++++------
>  drivers/pci/controller/dwc/pcie-armada8k.c    | 39 +++++++---------
>  drivers/pci/controller/dwc/pcie-artpec6.c     |  2 -
>  .../pci/controller/dwc/pcie-designware-host.c |  9 ++++
>  .../pci/controller/dwc/pcie-designware-plat.c |  3 --
>  drivers/pci/controller/dwc/pcie-histb.c       | 34 +++++++-------
>  drivers/pci/controller/dwc/pcie-kirin.c       | 23 ++--------
>  drivers/pci/controller/dwc/pcie-qcom.c        | 19 ++------
>  drivers/pci/controller/dwc/pcie-spear13xx.c   | 46 ++++++++-----------
>  drivers/pci/controller/dwc/pcie-tegra194.c    |  1 -
>  drivers/pci/controller/dwc/pcie-uniphier.c    | 13 ++----
>  15 files changed, 103 insertions(+), 171 deletions(-)

[...]
