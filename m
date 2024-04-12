Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DA98A36A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 21:59:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SGLpNFOb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VGS7r1SSYz3vbZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Apr 2024 05:59:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SGLpNFOb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VGS755Lc1z3dXj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Apr 2024 05:58:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1194ECE3AC3;
	Fri, 12 Apr 2024 19:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFEAC113CC;
	Fri, 12 Apr 2024 19:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712951918;
	bh=9HYoa2q9zbdAwhkuDRDtehEu+C2d3K7WfVfQ1MwY5ts=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SGLpNFOblQMeIbaJAa2RR1y9xP1A4VwRPfNvrMemMrQdH7DFIEqXfWjED1/QhvtxO
	 hJwupFe0Zppd9Hx7FQ6sAD9A8zlkGNqxCKL93Lgv+HM/Tlv2ihysEEhBSMme0WU/xZ
	 RmyWk2LZ0EfMI6v7/A50srEd/rQl8GV6TNI7lhloC7ZsNkN79QdcezoDxDudu48TlU
	 6yeJb0nSJDsOMZYNoTJ//yRoBGLYAUywwOLqZRW1kYosaZ/FAmRG8UQ0qWOU9fuvNj
	 MUvOqI6C3if4nm0zgjmb2nXTx/fQpWCIEwE1QW09jgPv9Q7AQOn6hkEUrmUqhOGaI4
	 DTF2TST3dsEgA==
Date: Fri, 12 Apr 2024 14:58:36 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v12 2/8] PCI: dwc: ep: Add Kernel-doc comments for APIs
Message-ID: <20240412195836.GA13344@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327-pci-dbi-rework-v12-2-082625472414@linaro.org>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>, Shawn Lin <shawn.lin@rock-chips.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <ming
 kai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 27, 2024 at 02:43:31PM +0530, Manivannan Sadhasivam wrote:
> All of the APIs are missing the Kernel-doc comments. Hence, add them.

> + * dw_pcie_ep_reset_bar - Reset endpoint BAR

Apparently this resets @bar for every function of the device, so it's
not just a single BAR?

> + * dw_pcie_ep_raise_intx_irq - Raise INTx IRQ to the host
> + * @ep: DWC EP device
> + * @func_no: Function number of the endpoint
> + *
> + * Return: 0 if success, errono otherwise.

s/errono/errno/ (another instance below)

Bjorn
