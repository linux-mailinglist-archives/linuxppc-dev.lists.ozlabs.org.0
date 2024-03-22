Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B95B886AFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 12:04:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kBBpFH4u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1KGN2JPpz3vgP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 22:04:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kBBpFH4u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1KF467Pnz3vYr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 22:03:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EFC43CE0C47;
	Fri, 22 Mar 2024 11:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A044CC433C7;
	Fri, 22 Mar 2024 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711105398;
	bh=j1bJ4w42kskV9ai5cekyhLUyNo8Ucw+qxC21MeUMMfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBBpFH4ubCr9UE0s7VfPsPShqTptBKiky+oxr6MYRB3RFKivrooYY4krN96Ri7nb9
	 urD0mdBEEucPD6uvIlEXYT7FWNrZaA3LNKAVdfs49lmNXxyZjQdv5t4CGTSPRvj+x/
	 AxqJDnUkGVGUBzn20ssSWcezKA+RzCbvRjOpR5zFEi9ZFxC0/Jz5zD0QzRD6jjMnFa
	 C3hwF8e5x+qwY8FuY/1g5hV0XF2NmlEy8H0/6VwdzxXTHAwMUu0XcsJ3R8Yjxe5uIl
	 3tKAR7pTiiHJnOnR8ruRAe3F67uoQtegz/o1LuZUo6PvinllofVh9ellJKuNY/K1Sr
	 cLcRfzgBZNR3Q==
Date: Fri, 22 Mar 2024 12:03:07 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v10 7/8] PCI: dwc: ep: Call dw_pcie_ep_init_registers()
 API directly from all glue drivers
Message-ID: <Zf1la9ICDCHAyOit@ryzen>
References: <20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org>
 <20240314-pci-dbi-rework-v10-7-14a45c5a938e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314-pci-dbi-rework-v10-7-14a45c5a938e@linaro.org>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang
  <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 14, 2024 at 01:18:05PM +0530, Manivannan Sadhasivam wrote:
> Currently, dw_pcie_ep_init_registers() API is directly called by the glue
> drivers requiring active refclk from host. But for the other drivers, it is
> getting called implicitly by dw_pcie_ep_init(). This is due to the fact
> that this API initializes DWC EP specific registers and that requires an
> active refclk (either from host or generated locally by endpoint itsef).
> 
> But, this causes a discrepancy among the glue drivers. So to avoid this
> confusion, let's call this API directly from all glue drivers irrespective
> of refclk dependency. Only difference here is that the drivers requiring
> refclk from host will call this API only after the refclk is received and
> other drivers without refclk dependency will call this API right after
> dw_pcie_ep_init().
> 
> With this change, the check for 'core_init_notifier' flag can now be
> dropped from dw_pcie_ep_init() API. This will also allow us to remove the
> 'core_init_notifier' flag completely in the later commits.
> 
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>
