Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D27B55BCB2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 02:29:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LX5800ZPSz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 10:29:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=axis-central1 header.b=S/iODZvh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axis.com (client-ip=195.60.68.17; helo=smtp1.axis.com; envelope-from=jesper.nilsson@axis.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=axis-central1 header.b=S/iODZvh;
	dkim-atps=neutral
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWmDr1jZBz2xbY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 21:47:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1656330461;
  x=1687866461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HvYHOeFy99wGwq/w2fx0FEcTo66gkhtePc7lFcpF/fs=;
  b=S/iODZvht98C4u69EXSfAaC4sMgtoPaKaoi+UA1oX1vqT1pQjHBJkJL6
   DUn5H+vnRjzISY4c9fSw6MQmI1b0fpMlmPKzlSkV7n9iTsNqPPUbTCuEa
   DVeah8uq6hKHOi3jXRRTbC84h+e6vq0Sz5J5SUOsxSdRJQm0qnz+6MrNZ
   pfcDroaiRkjyaPQEa6UtJo0rjZHklOm+IbGpHx0hkN/WUd67Kd8dW5e9g
   qosoaIlLq87YyS61hF30K/4RSeOGzoLfxd0N6fv9Cp+a+1wtCmh4B2pqf
   LMM5noDpcBJY0tE2aD82R0hx2S/ngDJpzGe/g2iBoG83S5Vlcyl/1S630
   A==;
Date: Mon, 27 Jun 2022 13:47:33 +0200
From: Jesper Nilsson <Jesper.Nilsson@axis.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH RESEND v5 15/18] PCI: dwc: Add dw_ prefix to the
 pcie_port structure name
Message-ID: <20220627114733.GG13332@axis.com>
References: <20220624143428.8334-1-Sergey.Semin@baikalelectronics.ru>
 <20220624143428.8334-16-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220624143428.8334-16-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 28 Jun 2022 10:29:05 +1000
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Neil Armstrong <narmstrong@baylibre.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Binghui Wang <wangbinghui@hisilicon.com>, Frank Li <Frank.Li@nxp.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry
 Reding <thierry.reding@gmail.com>, Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>, Alim Akhtar <alim.akhtar@samsung.com>, Jonathan Chocron <jonnyc@amazon.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, Jesper
 Nilsson <Jesper.Nilsson@axis.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Kevin
 Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@axis.com>, Kishon Vijay Abraham I <kishon@ti.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Rahul Tanwar <rtanwar@maxlinear.com>, Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Xiaowei Song <songxiaowei@hisilicon.com>, Greentime Hu <greentime.hu@sifive.com>, Richard Zhu <hongxing.zhu@nxp.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, Srikanth Thokala <srikanth.thokala@intel.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Yue Wang <yue.wang@Amlogic.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>, Mingkai Hu <mingkai.hu@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Heiko Stuebner <heiko@sntech.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Serge Semin <fancer.lancer@gmail.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 24, 2022 at 04:34:25PM +0200, Serge Semin wrote:
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
> Reviewed-by: Rob Herring <robh@kernel.org>

Sorry, I never replied in the thread for the last patch,
your reasoning for not changing the parameter name made sense.

For the ARTPEC-6 parts,

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
