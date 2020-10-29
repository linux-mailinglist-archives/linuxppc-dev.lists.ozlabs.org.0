Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 466D529F7AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 23:18:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMfwR2n6DzDqWP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 09:18:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=jingoohan1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ATMcJHxQ; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMfsG6DZXzDqWZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 09:15:46 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id t14so3515649pgg.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 15:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=wb9YwAxk2NQxLFpcYqM6hbPaI2aklAiVUdGq2NV0NhI=;
 b=ATMcJHxQmcMBWJSdahPYM75Ks+3p5JFHoEoVc7wKHtTMTbGrJ5GPrQzOTiqlY/O2FA
 WcTEd1DVFH8+A73QhQ7zJ1qFHeH931aweF+gFgULPrr0iJsUs9Arm7T0zDOQ7iGDiXIr
 K62PsZ6J0HRNE6V/79CiAYGV5qsWbEjJZ4U/s4YTUzibO5SupXBCGG4Yd4cmcB6LnzJL
 ucNZ9eyosFtlWjFHFpJ4JjOOjjyB8hIRnG42xcgmVOsrZkbJkz320MI+awHTrpziRXml
 0CcGcuey+fWXuCZiaAV7DePF42FtnVFkTRchEYkAoEEQtmtloHnfynN+A7jngOoU0BUr
 hlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=wb9YwAxk2NQxLFpcYqM6hbPaI2aklAiVUdGq2NV0NhI=;
 b=sNT4xrtv/holRsQGjMscdwHLwuuXeq4a1PN4JmQjncJu8GHlEoRmIw6TMUkyukyVpP
 0JTuseTZniGhrgckApoxIrqDeVLvUwv3aYAzb9qaMgs+gYUDoW58YVwWDSOBgHepoUko
 EErIIrSXHWl7lfzc3JC/BOph6vo1ZXKXB0bRuqz5QyMVW9Oi66WNTH/m7r34cekk/k0O
 IxEI0NKqvTRuN734UJpWU3CkwgFPS+vaLPOjc+FXpQjBKIjGM44BP4cRVn8cAlldJTgZ
 ZjSCgcZ7ePvHB55sAACeOAKZr13Sl5ysdGs2eI51eM4pKvG57KY+IeNkRHoXDMm/iI9N
 EAUQ==
X-Gm-Message-State: AOAM530xTSbs/NbxNIvC9Jpu2tIsOzkGu6V3Ty9G5hK4rvrPkrhXvlkA
 qPnrfGSVi6f8/VNmF8n851o=
X-Google-Smtp-Source: ABdhPJxlHYl+cZgk+KIPjNe48JdRu/zKn8ZJifDV9M3gXsbKATnx6XuuuC+nrXnuW0dPRIEWcL42zA==
X-Received: by 2002:a17:90a:bf05:: with SMTP id
 c5mr1353597pjs.11.1604009744576; 
 Thu, 29 Oct 2020 15:15:44 -0700 (PDT)
Received: from SL2P216MB0475.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:19::5])
 by smtp.gmail.com with ESMTPSA id
 34sm1704038pgv.53.2020.10.29.15.15.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 15:15:43 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 07/13] PCI: dwc: Drop the .set_num_vectors() host op
Thread-Topic: [PATCH 07/13] PCI: dwc: Drop the .set_num_vectors() host op
Thread-Index: AQHWrWuFryq4LWMsWUG3+ygcwfeheamvJygg
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 29 Oct 2020 22:15:32 +0000
Message-ID: <SL2P216MB0475BFB1A3DF471129F61B93AA140@SL2P216MB0475.KORP216.PROD.OUTLOOK.COM>
References: <20201028204646.356535-1-robh@kernel.org>
 <20201028204646.356535-8-robh@kernel.org>
In-Reply-To: <20201028204646.356535-8-robh@kernel.org>
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
> There's no reason for the .set_num_vectors() host op. Drivers needing a
> non-default value can just initialize pcie_port.num_vectors directly.
>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../pci/controller/dwc/pcie-designware-host.c | 19 ++++---------------
>  .../pci/controller/dwc/pcie-designware-plat.c |  7 +------
>  drivers/pci/controller/dwc/pcie-designware.h  |  1 -
>  drivers/pci/controller/dwc/pcie-tegra194.c    |  7 +------
>  4 files changed, 6 insertions(+), 28 deletions(-)

[...]
