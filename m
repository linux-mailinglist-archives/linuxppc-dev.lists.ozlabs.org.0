Return-Path: <linuxppc-dev+bounces-10388-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37546B0FFF4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jul 2025 07:30:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnfj83B0xz30TG;
	Thu, 24 Jul 2025 15:30:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753335020;
	cv=none; b=TeTkhBhu1/6OaXE0VQytuxxBOoydOGYlX1V+yXASHV0pM64kJ/nu+QyCVknp8kuVlHpq4zVEg8EvSfCc5Sjk1pK1A4mrcDhg6/6PAksvRhGOzTEL/xkqitdpiNV2oI09XNC0IIrHP4pIojj2RmpGzB0NE15v1U7esmuBH2pS0rKyvP3gWkrFV05bRXwBBZpqI80W6IiiaFruAt1hNGMXS8qZj0sU3QildLgrL2CtWPKm5Snx+SFXQIIWvgKzjQeMh1LA2LXqzhQ2AOhBmwg1gpb3iWWWGINY2ymNJMl5ajBZFLUjRzQVq57w0WaVOstrPHtquPezRYmtkEEC0Oi80A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753335020; c=relaxed/relaxed;
	bh=feWzxxtMhUW/xoBFPV3+36AjZRM2dS3U+W52VijVCRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dv0clVk/APov01zh12k3QMrbhHLKhnZjL/obTBkMyIM07KwyCjgQaSupBtBgRkxLzSmnAtlphdJn7Ue8ZJTWylZEH7LDYyQKVy5uKzlzbILnsJHBpxijUBrwHPmZqFzupw+Z4pwmmYrrcs/H+O8DrBQZyCG/PMoV2baSxb2KgR8dpwXOfsOjrRW16nCDtp/HHvQKWMUmt7zgAirDrfFH3/frgY7PfxXENuGm8DRNodJsk41TDRoegypUPHPkiX2A/TyrwaO1D3pjcQIuZiqCmJBJONFJbb9Ns5NKrrm88PlataB751N3AkhWVFd5e5TdiFUK0TdukBGFIHR847EMaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sNedDR55; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sNedDR55;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnfj73gLjz30T0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jul 2025 15:30:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 908325C557C;
	Thu, 24 Jul 2025 05:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3469FC4CEED;
	Thu, 24 Jul 2025 05:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753335016;
	bh=ISXdQZ3kB+W0hUweuwCNwLolV+g7Yo//dJ0hlqxAC0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sNedDR55x4+Sp5CqV3RRfyuKADcZPDY7YyZPtWIuQOH60C+zNPuSm9viRmif/bLfo
	 NsFm4J4q+ZZcM9ZED/jxSstX2X4Pgyv1k17y8+SM0XQuoBQr6vY3rqk4lEM3fxAa1u
	 ABhBaDpL96ZIPtJTWvkU9dp2YpVIQMGOwH9XuG46TgW7pZtZ4v+HULgkZqpEWmo8kQ
	 Qfev9GG7It4NBGZznP7FJzLkwtD7zgyTAqAcbUtx3SabjvqTYj0qaMOgTij7WJYbYd
	 Vt8/nLOyO6jeeDlbxuedgbMbzDO4Xj9XmOG2BbyxhnqoKrchC9IKqliIAiQd/MY5Xo
	 ct2H4wCgyMG6w==
Date: Thu, 24 Jul 2025 11:00:05 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <tujurux64if24z7w7h6wjxhrnh4owkgiv33u2fftp7zr5ucv2m@2ijo5ok5jhfk>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <aHoh1XfhR8EB_5yY@ryzen>
 <aHokdhpJUhSZ5FSp@ryzen>
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
In-Reply-To: <aHokdhpJUhSZ5FSp@ryzen>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 18, 2025 at 12:39:50PM GMT, Niklas Cassel wrote:
> On Fri, Jul 18, 2025 at 12:28:44PM +0200, Niklas Cassel wrote:
> > On Tue, Jul 15, 2025 at 07:51:03PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > 2) Testing link down reset:
> > 
> > selftests before link down reset:
> > # FAILED: 14 / 16 tests passed.
> > 
> > ## On EP side:
> > # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
> >   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> > 
> > 
> > [  111.137162] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x4
> > [  111.137881] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x0
> > [  111.138432] rockchip-dw-pcie a40000000.pcie: hot reset or link-down reset
> > [  111.139067] pcieport 0000:00:00.0: Recovering Root Port due to Link Down
> > [  111.139686] pci-endpoint-test 0000:01:00.0: AER: can't recover (no error_detected callback)
> > [  111.255407] rockchip-dw-pcie a40000000.pcie: PCIe Gen.3 x4 link up
> > [  111.256019] rockchip-dw-pcie a40000000.pcie: Root Port reset completed
> > [  111.383401] pcieport 0000:00:00.0: Root Port has been reset
> > [  111.384060] pcieport 0000:00:00.0: AER: device recovery failed
> > [  111.384582] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x3
> > [  111.385218] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x230011
> > [  111.385771] rockchip-dw-pcie a40000000.pcie: Received Link up event. Starting enumeration!
> > [  111.390866] pcieport 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
> > [  111.391650] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> > 
> > Basically all tests timeout
> > # FAILED: 1 / 16 tests passed.
> > 
> > Which is the same as before this patch series.
> 
> The above was with CONFIG_PCIEAER=y
> 

This is kind of expected since the pci_endpoint_test driver doesn't have the AER
err_handlers defined.

> Wilfred suggested that I tried without this config set.
> 
> However, doing so, I got the exact same result:
> # FAILED: 1 / 16 tests passed.
> 

Interesting. Could you please share the dmesg log like above.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

