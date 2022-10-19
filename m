Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA151605116
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 22:12:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mt22G4s9Sz3dsL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 07:12:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I1ZMR3K2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=conor@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I1ZMR3K2;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mt21N1swHz3br0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 07:11:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 908EDB82367;
	Wed, 19 Oct 2022 20:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D40C433C1;
	Wed, 19 Oct 2022 20:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666210276;
	bh=cxINFjC4l26JMWQCDS6yOnnhsiWltfRN4i3cz4+b7vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I1ZMR3K24nseRo15MOP5rfNigW+Z7xZT29yurBVj0i8XMgxeJujD+PIICzNZIm6bN
	 gyK4dHYnL1woYBdPMdyEToXjqNHDrW2LDxd3wWYhGDXgu42WH98mSb6PNGE0biVwoI
	 NmL/FHqhwiOGE1mM2xnC6PMrXYmWjtf1ioNz6JDLPE8Y5e73BbnB6NW23Hrt0MK1e/
	 +nKHkSBV5CS1gPpnn/eBnJUp5fsum7rA+C1TehSt0R/pHMPXztTW0k12Hfu1L95GIv
	 +3fg3d6ThtT2fif5tCNG/VOG/010vzdu0WdMFtWVtPpP1GUcqnAcVjxl7mbvJEmMkE
	 xq4VgOFK32PwA==
Date: Wed, 19 Oct 2022 21:11:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] PCI: Remove unnecessary of_irq.h includes
Message-ID: <Y1BZ26pv9A0VFS/j@spud>
References: <20221019195452.37606-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019195452.37606-1-helgaas@kernel.org>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Toan Le <toan@os.amperecomputing.com>, linux-riscv@lists.infradead.org, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Joyce Ooi <joyce.ooi@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Michal Simek <michal.simek@amd.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas
  <bhelgaas@google.com>, Scott Branden <sbranden@broadcom.com>, Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 19, 2022 at 02:54:51PM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Many host controller drivers #include <linux/of_irq.h> even though they
> don't need it.  Remove the unnecessary #includes.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

>  drivers/pci/controller/pcie-microchip-host.c | 1 -

LGTM...
Acked-by: Conor Dooley <conor.dooley@microchip.com>
