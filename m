Return-Path: <linuxppc-dev+bounces-11057-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B19E9B27C2C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 11:07:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3GV03n6Sz3ccF;
	Fri, 15 Aug 2025 19:07:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755248872;
	cv=none; b=TZ5mLSagG2ex9NHkRc96KQn35YTtHoH2KR3axvw3RHSyKK3Vurk92rQtzGAdlPovtd2Itw7GZ9snBA81/6iTyqPjkQhG+54au/qCGCPaUkdqx/UtDfWAWjzKpyJ8tGd1I+SJmJlVfZqF+Q6S8DXL5Z3w4WkotuOSujwgx5xIIMNBqKeXsPIpRY0FoHTIRJsp+Lb1P6fj0qDCGVvuNvMAlsgt2vdHJHW4LNtRa9Jh4UZHWVnpJ4MrJHwyvAN5d4igA+0cYHx17kOgOYBosk0oEyYI1seewzJNJc+Klal3J8Lvt/dCkhWglWRRvMo/pDv303zeoEPE9EgOT//Hp9leIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755248872; c=relaxed/relaxed;
	bh=zx8aj1LQUu76+ljSCYXAYhF4QC+RDTXrYtl7+NbK/ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOp/ihez8t481e785DNr3xR4fYfDiRw7R6G/XMm+mJW3PNybPsoaLabsgtXP/Mir0pzvE33p3KqmqOuTlbpa4Qg+1s4ILpEcNNXXtL8rk6iJyHMG7YQn8s5afmLggg4ln9T3hwBTYujJtixq6DC450Q8/QfhLg+FTybf90ZqYY7/qhpPbLmsekYfOCruTYG1JArONhMS8l4O8WbmryzfH/Oxmq+yzw+YC9YMIRd83Ito5mlIyT9bctpqFvOWMmZPLuVPf2Jcoq71BFiTVOYYSMUeRyFn8UiWTKWKKSTB9mJTWDd7YqQCX/V0sePLmTudko+/ta3k38upU0C1E7b3Gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hCUydPaS; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hCUydPaS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3GTz4Xl8z3cbt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 19:07:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9EE6746104;
	Fri, 15 Aug 2025 09:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9562CC4CEEB;
	Fri, 15 Aug 2025 09:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755248868;
	bh=99xoqnVTE+5vEX0JBLvhsXhVQgcPMAYXND8yARERRQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCUydPaS4CL2g3ZuiCxjRYNo4suGGZo/3UjPaacLUxD1omL+fIDSwIfBfobZcheqU
	 haxhg6ctciTH1Qx4vtPKJjwB82S5dr3w7YX5qWiIR9VX34XCTCS1b8+M5+QI2HPDN5
	 L+iY/Aawf8965lNHCXfNz2yDNl+7FHBsotvI0rPRLoadnxBXrvTk7DqIp5G1fLKnIR
	 0G3n6W3pdQluol7T0GEzkTe1hfW0I+6IuGbp7k0Z22VrEqWHWMJd7DsO89pq8nPE5r
	 gkxqgdBf+LAe2FlFTv/PtTsFCQIzWfbh/ZycAHI3v2v1Q3QORKE4OexEf8teUi28sf
	 sU8Q5bHzk1/nA==
Date: Fri, 15 Aug 2025 11:07:42 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <aJ743hJw-T9y3waX@ryzen>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <aHoh1XfhR8EB_5yY@ryzen>
 <aHokdhpJUhSZ5FSp@ryzen>
 <tujurux64if24z7w7h6wjxhrnh4owkgiv33u2fftp7zr5ucv2m@2ijo5ok5jhfk>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tujurux64if24z7w7h6wjxhrnh4owkgiv33u2fftp7zr5ucv2m@2ijo5ok5jhfk>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Mani,

Sorry for the delayed reply.
I just came back from vacation.

On Thu, Jul 24, 2025 at 11:00:05AM +0530, Manivannan Sadhasivam wrote:
> On Fri, Jul 18, 2025 at 12:39:50PM GMT, Niklas Cassel wrote:
> > On Fri, Jul 18, 2025 at 12:28:44PM +0200, Niklas Cassel wrote:
> > > On Tue, Jul 15, 2025 at 07:51:03PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > > 2) Testing link down reset:
> > > 
> > > selftests before link down reset:
> > > # FAILED: 14 / 16 tests passed.
> > > 
> > > ## On EP side:
> > > # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
> > >   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> > > 
> > > 
> > > [  111.137162] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x4
> > > [  111.137881] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x0
> > > [  111.138432] rockchip-dw-pcie a40000000.pcie: hot reset or link-down reset
> > > [  111.139067] pcieport 0000:00:00.0: Recovering Root Port due to Link Down
> > > [  111.139686] pci-endpoint-test 0000:01:00.0: AER: can't recover (no error_detected callback)
> > > [  111.255407] rockchip-dw-pcie a40000000.pcie: PCIe Gen.3 x4 link up
> > > [  111.256019] rockchip-dw-pcie a40000000.pcie: Root Port reset completed
> > > [  111.383401] pcieport 0000:00:00.0: Root Port has been reset
> > > [  111.384060] pcieport 0000:00:00.0: AER: device recovery failed
> > > [  111.384582] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x3
> > > [  111.385218] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x230011
> > > [  111.385771] rockchip-dw-pcie a40000000.pcie: Received Link up event. Starting enumeration!
> > > [  111.390866] pcieport 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
> > > [  111.391650] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> > > 
> > > Basically all tests timeout
> > > # FAILED: 1 / 16 tests passed.
> > > 
> > > Which is the same as before this patch series.
> > 
> > The above was with CONFIG_PCIEAER=y
> > 
> 
> This is kind of expected since the pci_endpoint_test driver doesn't have the AER
> err_handlers defined.

I see.
Would be nice if we could add them then, so that we can verify that this
series is working as intended.


> 
> > Wilfred suggested that I tried without this config set.
> > 
> > However, doing so, I got the exact same result:
> > # FAILED: 1 / 16 tests passed.
> > 
> 
> Interesting. Could you please share the dmesg log like above.

It is looking exactly like the dmesg above

[   86.820059] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x4
[   86.820791] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x0
[   86.821344] rockchip-dw-pcie a40000000.pcie: hot reset or link-down reset
[   86.821978] pcieport 0000:00:00.0: Recovering Root Port due to Link Down
[   87.040551] rockchip-dw-pcie a40000000.pcie: PCIe Gen.3 x4 link up
[   87.041138] rockchip-dw-pcie a40000000.pcie: Root Port reset completed
[   87.168378] pcieport 0000:00:00.0: Root Port has been reset
[   87.168882] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x3
[   87.169519] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x230011
[   87.272463] rockchip-dw-pcie a40000000.pcie: Received Link up event. Starting enumeration!
[   87.277552] pcieport 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[   87.278314] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01

except that we don't get the:
> [  111.139686] pci-endpoint-test 0000:01:00.0: AER: can't recover (no error_detected callback)
> [  111.384060] pcieport 0000:00:00.0: AER: device recovery failed

prints.


Kind regards,
Niklas

