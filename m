Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E708704CB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 16:05:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KxfxPZyT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpMSV473Yz3vXt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 02:05:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KxfxPZyT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpMRn1xRWz3bs2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 02:04:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 532F1CE1387;
	Mon,  4 Mar 2024 15:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC42C433F1;
	Mon,  4 Mar 2024 15:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709564673;
	bh=JQ0+zqW2caSPP+fUJhGdRNpSWxMzAFd26SsP97GqJ5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KxfxPZyTJCmJ5mZxVgiJqCzXofUHAoQs7mRC4KDObSN4wZYzCp+or22QBaGGe5t9d
	 pLbvJc3JLMFgeoU1w44VMTP8tAduMKv6D3daCt6OZvQd6ZtM5E/Z97noo5A7eDc0s2
	 W+ig+U1dUuuB06z3B0xWfblUl4Qt+mYQ4jEyGRB7YwL+af8wnuI87t37LKaJhjrGoW
	 ub8JQUD6sglgIwv+HwJS9neFZqPR7gHY6wjCaYatMgn1yMmWuoNgu/qGBQDEDJSnwJ
	 1Wcb5mT3qEHKZKholtNHLHRLkFh6GvNDPtCqpZMBtwoYo84wi/8B185vMWK2kovBNR
	 BuM6Fu1YvISvg==
Date: Mon, 4 Mar 2024 20:34:17 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v8 03/10] PCI: dwc: ep: Introduce dw_pcie_ep_cleanup()
 API for drivers supporting PERST#
Message-ID: <20240304150417.GK2647@thinkpad>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-3-64c7fd0cfe64@linaro.org>
 <ZeB7PQtkDSoCzE1Z@fedora>
 <20240304081713.GH2647@thinkpad>
 <ZeWnmLjS0O8CYQYg@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZeWnmLjS0O8CYQYg@fedora>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yo
 shihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 04, 2024 at 11:51:04AM +0100, Niklas Cassel wrote:
> On Mon, Mar 04, 2024 at 01:47:13PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Feb 29, 2024 at 01:40:29PM +0100, Niklas Cassel wrote:
> > > On Sat, Feb 24, 2024 at 12:24:09PM +0530, Manivannan Sadhasivam wrote:
> > > 
> > > Since e.g. qcom-ep.c does a reset_control_assert() during perst
> > > assert/deassert, which should clear sticky registers, I think that
> > > you should let dw_pcie_ep_cleanup() clean up the BARs using
> > > dw_pcie_ep_clear_bar().
> > > 
> > 
> > As I mentioned earlier, it is the job of the EPF drivers to clear the BARs since
> > they allocate them. I'm trying to reduce the implicit resetting wherever we
> > could.
> > 
> > The proper fix is to add the LINK_DOWN callback to EPF drivers and do cleanup.
> > I'm planning to submit a series for that after this one.
> 
> Currently, pci-epf-test allocates memory for the BARs in .bind().
> Likewise it frees the memory for the BARs in .unbind().
> 
> AFAICT, most iATU registers, and most BAR registers are sticky registers,
> so they will not get reset on link down.
> (The currently selected BAR size, in case of Resizable BAR is an exception.)
> 
> That means that even on link down, we do not need to free the memory,
> or change the iATU settings. (This applies to all drivers.)
> 
> 
> 
> However, on PERST (for the drivers call dw_pcie_ep_cleanup()), they call
> reset_control_assert(), so they will clear sticky registers, which means
> that they need to at least re-write the iATU and BAR registers.
> (I guess they could free + allocate the memory for the BARs again,
> but I don't think that is strictly necessary.)
> That is why I suggested that you call dw_pcie_ep_clear_bar() from
> dw_pcie_ep_cleanup().
> 

Sorry, I keep assuming the flow w.r.t PERST# supported platforms :/

My bad!

> 
> 
> If you free the memory for the BARs in link_down() (this callback exists
> for many drivers, even drivers without a PERST handler), where are you
> supposted to alloc the memory for the BARs again?
> 
> Allocating them at link_up() is too late (because as soon as the link is
> up, the host is allowed to enumerate the EP BARs.) The proper place is to
> allocate them when receiving PERST, but not all drivers have a PERST handler.
> 
> (My understanding is that 1) PERST assert 2) PERST deassert 3) link is up.)
> 
> 
> 
> unbind() undos what was done in bind(), so shouldn't link_down() undo what was
> done in link_up()? With that logic, if you move the alloc to .core_init(),
> should we perhaps have a .core_deinit() callback for EPF drivers?
> (I guess only drivers which perform a reset during PERST would call this.)
> 
> But considering that free+alloc is not strictly needed, why not just keep
> the allocation + free in .bind()/.unbind() ?
> (To avoid the need to create a .core_deinit()), and let dw_pcie_ep_cleanup()
> call dw_pcie_ep_clear_bar() ?
> 
> I guess my point is that it seems a bit pointless for drivers that do not
> clear sticky registers to free+alloc memory on link down, for no good
> reason. (Memory might get fragmented over time, so it might not be possible
> to perform a big allocation after the device has been running for a really
> long time.)
> 
> 
> 
> So I'm thinking that we either
> 1) Keep the alloc/free in bind/unbind, and let dw_pcie_ep_cleanup() call
> dw_pcie_ep_clear_bar(),
> or
> 2) Introduce a .deinit_core() callback which will free the BARs.
> (Because I don't see how you will (re-)allocate memory for all drivers
> if you free the memory in link_down().)
> 

I think option 2 is the better solution. In my view, calling
dw_pcie_ep_clear_bar() from EPC drivers is a layering violation since the
allocation happens from EPF drivers.

So clearing the BARs during the deinit() callback that gets called when PERST#
assert happens is the way to go.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
