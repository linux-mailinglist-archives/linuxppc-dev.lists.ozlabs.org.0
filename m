Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D0C29F7C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 23:22:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMg1W7222zDqW7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 09:22:55 +1100 (AEDT)
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
 header.s=20161025 header.b=JXYioUG+; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMfyr6HlYzDqdm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 09:20:35 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id a200so3546019pfa.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 15:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=FOoaeCn33/ipYh2zHeIJMAsJ57EgPtJEMeLEEZX4GBg=;
 b=JXYioUG+T5BQ59RxZlgLJQH7xPvNe0cS4rzH12hBu8Sym70lt57gs1Pkds6SaAC90f
 C3p4B/4Q6npqOo5DKBxAKnFr8Kr4AF1uO+D+Ybt8FQbFC+7/aOyWoa6f6jO36vPhv0gf
 Jjtf9S6d68AHuDpRG+QKdxw5bSxHZGZXSEik17nQFn+f68Wqy2q3nvCZtN6+WU98ZRAG
 VszFLN/zelOKJe17cacdXwXVg7TJ/4AjuBm4KJpsj6U1SK4lG4aAOMOWRXgBcboPoO8U
 tsx9Md4BKIalifnFtjCPMfAoZtgsGDdYTZBqkx2AAhFMAKZyDqleF9XqFeOmr5LPiz12
 Ereg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=FOoaeCn33/ipYh2zHeIJMAsJ57EgPtJEMeLEEZX4GBg=;
 b=liExFRi/X8CbcZibqzkiUGd7Yx9ceCbGAm90idPYuVXmwoJwO+YP5WbMX8+p4B4amX
 iJT8kLxgdhjnQPGxNB5pg+uYsV+lWBwnVCNM9bPizvhnva37Tk02C8kr9F8QDq6MYH36
 k8VjaqCEGdWkvAWN/4Lo+HQc/sCkGK39lpoiIxBzFvnpUqDkjyEvvu8LDE+0koPPw7XD
 w0jJq5eeFRukJplimnaxCLRpVLr7lwwgHVfv21eaUgFD8I6vwLxFTTKyJxHsUgPapAqN
 DQB5Waw79hcwI9/JyMUHveGsd/mq1QUhtF8IPUui2yTpnOrEQidvaglv6WeaNGqvN5sG
 saHw==
X-Gm-Message-State: AOAM530/E9CQfpSwZ/Na5imtmpJpN2tlhEONrIGYbymd8XmLI9fpMlVA
 uJvzGEt2Ic9GkIPny9cCCOU=
X-Google-Smtp-Source: ABdhPJzIHxSZFeeHkKrEYBnNoJGKIQEtuuPzw7YrhdkseS3FZyrRqbwhxcs5J9Iyjnq9UuKpbBh01Q==
X-Received: by 2002:a17:90a:ab8b:: with SMTP id
 n11mr1378340pjq.162.1604010031783; 
 Thu, 29 Oct 2020 15:20:31 -0700 (PDT)
Received: from SL2P216MB0475.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:19::5])
 by smtp.gmail.com with ESMTPSA id
 i30sm3772040pgb.81.2020.10.29.15.20.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 15:20:30 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 09/13] PCI: dwc: Rework MSI initialization
Thread-Topic: [PATCH 09/13] PCI: dwc: Rework MSI initialization
Thread-Index: AQHWrWuJaaGDQXSS2Eu3W5SQBB5/HqmvKH4y
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 29 Oct 2020 22:20:19 +0000
Message-ID: <SL2P216MB0475953C235B27D3E6C01CE2AA140@SL2P216MB0475.KORP216.PROD.OUTLOOK.COM>
References: <20201028204646.356535-1-robh@kernel.org>
 <20201028204646.356535-10-robh@kernel.org>
In-Reply-To: <20201028204646.356535-10-robh@kernel.org>
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
> There are 3 possible MSI implementations for the DWC host. The first is
> using the built-in DWC MSI controller. The 2nd is a custom MSI
> controller as part of the PCI host (keystone only). The 3rd is an
> external MSI controller (typically GICv3 ITS). Currently, the last 2
> are distinguished with a .msi_host_init() hook with the 3rd option using
> an empty function. However we can detect the 3rd case with the presence
> of 'msi-parent' or 'msi-map' properties, so let's do that instead and
> remove the empty functions.
>
> Cc: Murali Karicheri <m-karicheri2@ti.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Minghuan Lian <minghuan.Lian@nxp.com>
> Cc: Mingkai Hu <mingkai.hu@nxp.com>
> Cc: Roy Zang <roy.zang@nxp.com>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-keystone.c     |  9 -------
>  drivers/pci/controller/dwc/pci-layerscape.c   | 25 -------------------
>  .../pci/controller/dwc/pcie-designware-host.c | 20 +++++++++------
>  drivers/pci/controller/dwc/pcie-designware.h  |  1 +
>  drivers/pci/controller/dwc/pcie-intel-gw.c    |  9 -------
>  5 files changed, 13 insertions(+), 51 deletions(-)

[...]
