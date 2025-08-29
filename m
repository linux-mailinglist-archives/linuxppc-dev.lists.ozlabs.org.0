Return-Path: <linuxppc-dev+bounces-11488-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 455CCB3BCF6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 15:57:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD0FK5PWwz2yrX;
	Fri, 29 Aug 2025 23:57:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756475829;
	cv=none; b=fN/4wxFHd3eOBD6UOASQZJpf8ozuHCdmJ2VK4sfQeSP7qAddn5Zx7X9G8bRgHjpmxpg2FWMHyWLLKkRrzd/qmlQ/2moVWlDRsVxPHfqjG/gfGx8m0JKIWU3uorCzF3e+eDMvfQTJZVkJUPS1OdUnhXbyqpOvq4ABIjmjLSALayEl9HTFemIbFaoOWGw4yNjET/3FhKAjj5zwIr+P9FkEIVMTQwvYWNMkfA4PyO4N/GvNfXzVUnL5XQzgLZj4L0Ftgtkfgr/khvuK3c8VImaqH/jS9bmd3adUZURUBxl3VU5b1PVOfUJu2w/JJ+OqQiG9JXos1/xj2cRHzlgwQueUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756475829; c=relaxed/relaxed;
	bh=RKmUYus44y7wxM1lw5RoEDrn4yOkVuSx5nlw3WJZ0QI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dA6vzjP5GIn71SOL8dsk8B8lECVbRm1cbtJxzcCKpjWuv4DCfgfDZyK2NHYgeF4H1JqRSyyR0BrcIotaz31ROJDN8DJE8ay9gWalW82Le2pBzTX0GJxakppB5+ZOW7LQNigsJ+0ENCChYZQub8wefBpTmL4IFqAjrTRX30LYndhLbVDMHyvkizz0epT39RZi1sg6w3z6L+HpPXO1DALRxd4CBAu8eB6NfKvU5QfXM7ZvQ2nZIJ1C22L0DVKVuYx/DE8LoogF3LhGIW6gEwA3SrI4qB90eyYM4EaerNNzEIqeRZvpm/oEHrSXXDaYY/i/6jcqJx1g1cKkE8LUwmys4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HG7qR2Np; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HG7qR2Np;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD0FJ6pLGz2yqm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 23:57:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9B8B6013F;
	Fri, 29 Aug 2025 13:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3EDC4CEF0;
	Fri, 29 Aug 2025 13:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756475826;
	bh=TPcM7vsR5BgNayppQJ/9+eqOOaE0BLCmHtlJiHw2x00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HG7qR2NpViDP3330Rb3+QPhGOoxUP21ucjupQwVZKBcIDr6ufqfMnR0hZ92q/tXjj
	 RmOWxxOjua0rd4S3QlxP5u55wLh0SkpxoR8gxxnjs1oSWUq9Wzv45cyjdJpj6R/x1q
	 Fqb9eIP6XcU+N5ZjhpwAm87yAyqOongAIahxeIav2dVjcbL6V1mlQQ0EM3s1NSBSfy
	 myXVVVHQeEI+43tlZF1SvT0V3sD4rfF8O9njHVkY+uD6QLq+0PMjyXEDbdDLmnNu3P
	 3Fl5/n5sqcruuH6EstM67V0Y4OPto9EUCzd5+nOaQ9TcYhk2Yc07/m71tRiZsnTTMN
	 y9f/ja0kprk1w==
Date: Fri, 29 Aug 2025 19:26:56 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Niklas Cassel <cassel@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <zhu77qldhrr7ovp2g2tpusl67zsacjx5oapnaasxo2ybmhfohn@io3oqqc6gtte>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <aLC1rzdTVoN56Phc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLC1rzdTVoN56Phc@google.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 28, 2025 at 01:01:51PM GMT, Brian Norris wrote:
> On Tue, Jul 15, 2025 at 07:51:03PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > Hi,
> > 
> > Currently, in the event of AER/DPC, PCI core will try to reset the slot (Root
> > Port) and its subordinate devices by invoking bridge control reset and FLR. But
> > in some cases like AER Fatal error, it might be necessary to reset the Root
> > Ports using the PCI host bridge drivers in a platform specific way (as indicated
> > by the TODO in the pcie_do_recovery() function in drivers/pci/pcie/err.c).
> > Otherwise, the PCI link won't be recovered successfully.
> > 
> > So this series adds a new callback 'pci_host_bridge::reset_root_port' for the
> > host bridge drivers to reset the Root Port when a fatal error happens.
> > 
> > Also, this series allows the host bridge drivers to handle PCI link down event
> > by resetting the Root Ports and recovering the bus. This is accomplished by the
> > help of the new 'pci_host_handle_link_down()' API. Host bridge drivers are
> > expected to call this API (preferrably from a threaded IRQ handler) with
> > relevant Root Port 'pci_dev' when a link down event is detected for the port.
> > The API will reuse the pcie_do_recovery() function to recover the link if AER
> > support is enabled, otherwise it will directly call the reset_root_port()
> > callback of the host bridge driver (if exists).
> > 
> > For reference, I've modified the pcie-qcom driver to call
> > pci_host_handle_link_down() API with Root Port 'pci_dev' after receiving the
> > LINK_DOWN global_irq event and populated 'pci_host_bridge::reset_root_port()'
> > callback to reset the Root Port. Since the Qcom PCIe controllers support only
> > a single Root Port (slot) per controller instance, the API is going to be
> > invoked only once. For multi Root Port controllers, the controller driver is
> > expected to detect the Root Port that received the link down event and call
> > the pci_host_handle_link_down() API with 'pci_dev' of that Root Port.
> > 
> > Testing
> > -------
> > 
> > I've lost access to my test setup now. So Krishna (Cced) will help with testing
> > on the Qcom platform and Wilfred or Niklas should be able to test it on Rockchip
> > platform. For the moment, this series is compile tested only.
> 
> For the series:
> 
> Tested-by: Brian Norris <briannorris@chromium.org>
> 
> I've tested the whole thing on Qualcomm SC7280 Herobrine systems with
> NVMe. After adding a debugfs node to control toggling PERST, I can force
> the link to reset, and see it recover and resume NVMe traffic.
> 
> I've tested the first two on Pixel phones, using a non-upstream
> DWC-based driver that I'm working on getting in better shape. (We've
> previously supported a custom link-error API setup instead.) I'd love to
> see this available upstream.
> 

Thanks, Brian for testing! I didn't get time to look into the report from
Niklas (which is the only blocking thing for this series). I'll try to dig into
it today/tomorrow.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

