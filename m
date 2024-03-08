Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 083AF87601A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 09:49:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=acgWSAny;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrfwY5Qmkz3dX1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 19:49:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=acgWSAny;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Trfvn4l0qz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 19:48:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E89AB61DA6;
	Fri,  8 Mar 2024 08:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED92CC433C7;
	Fri,  8 Mar 2024 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709887698;
	bh=Os46CKddDWTirtB0sWeRcEab98vw5dx34ifSSInDtrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=acgWSAnyntQI7YWkNBHe6teZXBzI+ut6mvemDrUzDs+pe3VOXto4DGWOz0dJDP3nh
	 B7lKYknLYn1z0fr85u+hCeBSHgq3TG7m8UwP77ZSlBu3bdlmkCUnnAlPGE45GjZ1A/
	 NqOlGZuJjarMerfBcmzyaGjCs/uZVvG1Uutrd7OjM/LgxcZIWlJ3PJRk/Uu4sCTTpV
	 IC3myDAxuOvPxCMsQItoG6hQETn3bK2mvnxHhylRJ32inW3B3NPoEycGeFn6bi7v+m
	 17e1XVd06boVRH7eL5z5lL0F1wAq5XsPqFzxlJi5wXVe/WDpZ97W8GgU4DCIzZs69N
	 A/tDo9imbZViQ==
Date: Fri, 8 Mar 2024 09:48:07 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v9 07/10] PCI: dwc: ep: Remove "core_init_notifier" flag
Message-ID: <ZerQxxfUvFm2MjqV@ryzen>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-7-29d433d99cda@linaro.org>
 <Zeos8kVxgchH9veF@ryzen>
 <20240308053829.GC3789@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308053829.GC3789@thinkpad>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@
 lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 08, 2024 at 11:08:29AM +0530, Manivannan Sadhasivam wrote:
> On Thu, Mar 07, 2024 at 10:09:06PM +0100, Niklas Cassel wrote:
> > On Mon, Mar 04, 2024 at 02:52:19PM +0530, Manivannan Sadhasivam wrote:
> > > "core_init_notifier" flag is set by the glue drivers requiring refclk from
> > > the host to complete the DWC core initialization. Also, those drivers will
> > > send a notification to the EPF drivers once the initialization is fully
> > > completed using the pci_epc_init_notify() API. Only then, the EPF drivers
> > > will start functioning.
> > > 
> > > For the rest of the drivers generating refclk locally, EPF drivers will
> > > start functioning post binding with them. EPF drivers rely on the
> > > 'core_init_notifier' flag to differentiate between the drivers.
> > > Unfortunately, this creates two different flows for the EPF drivers.
> > > 
> > > So to avoid that, let's get rid of the "core_init_notifier" flag and follow
> > > a single initialization flow for the EPF drivers. This is done by calling
> > > the dw_pcie_ep_init_notify() from all glue drivers after the completion of
> > > dw_pcie_ep_init_registers() API. This will allow all the glue drivers to
> > > send the notification to the EPF drivers once the initialization is fully
> > > completed.
> > > 
> > > Only difference here is that, the drivers requiring refclk from host will
> > > send the notification once refclk is received, while others will send it
> > > during probe time itself.
> > > 
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > 
> > You have removed the .core_init_notifier from EPC drivers,
> > but the callback in EPF drivers is still called .core_init.
> > 
> > Yes, this was a confusing name even before this patch, but
> > after this patch, it is probably even worse :)
> > 
> > The callback should be named from the perspective of EPF drivers IMO.
> > .core_init sounds like a EPF driver should initialize the core.
> > (But that is of course done by the EPC driver.)
> > 
> > The .link_up() callback name is better, the EPF driver is informed
> > that the link is up.
> > 
> > Perhaps we could rename .core_init to .core_up ?
> > 
> > It tells the EPF drivers that the core is now up.
> > (And the EPF driver can configure the BARs.)
> > 
> 
> I don't disagree :) I thought about it but then decided to not extend the scope
> of this series further. So saved that for next series.
> 
> But yeah, it is good to clean it up here itself.

If you intend to create a .core_deinit or .core_down (or whatever name
you decide on), perhaps it is better to leave this cleanup to be part
of that same series?


Kind regards,
Niklas
