Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E59D288DA70
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 10:42:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P0GWQbgn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4MCW50vYz3vYg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 20:42:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P0GWQbgn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4MBp6gFCz3cy9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 20:41:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 612E2CE169E;
	Wed, 27 Mar 2024 09:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A4DC433C7;
	Wed, 27 Mar 2024 09:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711532510;
	bh=L3MDabzqy52UiiTpotcbYr/fCovWNhX/kTom1rvfcLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0GWQbgnIHTf/G5uy23E/x7ykvt/PdbjSQBxEDrAG8933x7u7LE+eSEfWzro38F6g
	 QTeiC5ZrZDZQ0mxGSlCSjQnsqn1y49orZqEvDjAoGZZ9q0gIPbo+M7I3xt9HttPI8H
	 0ObzP0rjgPRbxin+sZBZNp2rk832mLKAM7p1KnRhq9wZ0yPDRMP+wMo10ULBHkQC6j
	 nG/B8CNKwie/6nXS6vLuQK2zBFa0RG4KiXbKOPr8QLv3RiNxkDJkl/eA9FSn3FwgFv
	 Mv/vFRKgxrFAhrljpIyeoQrajgkpwvQXIcl2ucpka2zQMo91uLTc1IlOSqgvlN9q6x
	 IIHd3CkrbewBw==
Date: Wed, 27 Mar 2024 10:41:39 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v12 8/8] PCI: endpoint: Remove "core_init_notifier" flag
Message-ID: <ZgPp020vefFw3pGk@ryzen>
References: <20240327-pci-dbi-rework-v12-0-082625472414@linaro.org>
 <20240327-pci-dbi-rework-v12-8-082625472414@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327-pci-dbi-rework-v12-8-082625472414@linaro.org>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>, Shawn Lin <shawn.lin@rock-chips.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-ke
 rnel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 27, 2024 at 02:43:37PM +0530, Manivannan Sadhasivam wrote:
> "core_init_notifier" flag is set by the glue drivers requiring refclk from
> the host to complete the DWC core initialization. Also, those drivers will
> send a notification to the EPF drivers once the initialization is fully
> completed using the pci_epc_init_notify() API. Only then, the EPF drivers
> will start functioning.
> 
> For the rest of the drivers generating refclk locally, EPF drivers will
> start functioning post binding with them. EPF drivers rely on the
> 'core_init_notifier' flag to differentiate between the drivers.
> Unfortunately, this creates two different flows for the EPF drivers.
> 
> So to avoid that, let's get rid of the "core_init_notifier" flag and follow
> a single initialization flow for the EPF drivers. This is done by calling
> the dw_pcie_ep_init_notify() from all glue drivers after the completion of
> dw_pcie_ep_init_registers() API. This will allow all the glue drivers to
> send the notification to the EPF drivers once the initialization is fully
> completed.
> 
> Only difference here is that, the drivers requiring refclk from host will
> send the notification once refclk is received, while others will send it
> during probe time itself.
> 
> But this also requires the EPC core driver to deliver the notification
> after EPF driver bind. Because, the glue driver can send the notification
> before the EPF drivers bind() and in those cases the EPF drivers will miss
> the event. To accommodate this, EPC core is now caching the state of the
> EPC initialization in 'init_complete' flag and pci-ep-cfs driver sends the
> notification to EPF drivers based on that after each EPF driver bind.
> 
> Tested-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>
