Return-Path: <linuxppc-dev+bounces-10318-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2098BB0A0CF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jul 2025 12:40:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bk5sD3TF1z2xfR;
	Fri, 18 Jul 2025 20:40:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752835200;
	cv=none; b=Bef0a0Td3YvhCX/nXsuqcl2k7/51rEffLw7Zv1eQRT30qheBowiRyL2RZsRl21hviLgWMzioOjT3cQ7YyfhoKlVcvJMf9aiNP/uXEjmlfG4Mv3E+AmM3l2RUPbJNQapXgUpLcci8PGi3BfVVeTh/nI2dxCuuuogCMUbd3M7YFUU00T74TSYoQr9+Y611YD6o4Z1I5vkYSJtJx4igumNy1nQl6Pk+hStHi3yS9rjNirDrslq+e0bbQ8ojH/3VryirVu3uzYFCuLlC+r6LBWqBnlL312FTVjw/SIL+JKPv8gBgH3vyhHNqunYDehIW2RJ6GwNN9ORPjy1aW1quO/Fm5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752835200; c=relaxed/relaxed;
	bh=IFGNSXyBzlfv/Oj4MgwjqyjIVax4i6/p74f+gTytbJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfQh1u5SbKs8lJrZ27Jryclhk8i8TgWPk/duhvhf3SFPbrMuZpE96rjLJ47S7tNQxvWFMpOA0Pgl2X0A8gb9KHuKm3x5dm2jUQhYc752HAq7tYLW6VSJ/AbNimTW1YfYite/7ibT0TcZqdkc+oJxb/u/brpJbVb6fyCDk1umanwCrocenAwivD8oaoTO4eFpCijP04aWUN5bA8chgF4EOtFvdQMfCUgpbe2FXWLvOWbtmI6aVexNpSu0EToJ4Jm0WCC+6HkSYxxalBd3sFHLJipgzs5naiwTX0FXkEEWu0lFa9OZVbP/ocHNmmS/UAOfKQr9l9/3eu1IzVyPuTTH7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IPlrFQBt; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IPlrFQBt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bk5sC53blz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 20:39:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5234E5C5C60;
	Fri, 18 Jul 2025 10:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161EFC4CEF0;
	Fri, 18 Jul 2025 10:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752835197;
	bh=J3EdFx6SeghEC/3QrFs16mdw3ziovg04wubMBc5qbUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPlrFQBtvUlZfA7a+pVin1pFTP7wye2etea45L0KxgzvuN5VA5/XYu1MyW3Xtw9BX
	 cXL2kXR7CiYeUQP0DsONWFLp7zbJ9zl7KUXlq5LI945F+NGunAFWedcpd57Nt4nS+B
	 DO/r/Cx19XXM7KfS03jieyFoNUBzNpU8bbxrw2L511QVxGAr98ZXWB2uYjftwZ5dnD
	 4YDpEFwUNh03TE5Ar8Vq6XqGAlWb5aflWRTH/TOH7rLvuWOPgTv+CLF6liQVsvP2ah
	 yveNKo3QRKnzR2f/ScmBsawG2qE80GXNLSf3orq5fHbG8Mrq+dAmRyfBuGAtgXeiOq
	 s1uZKCsgGIvXg==
Date: Fri, 18 Jul 2025 12:39:50 +0200
From: Niklas Cassel <cassel@kernel.org>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
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
Message-ID: <aHokdhpJUhSZ5FSp@ryzen>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <aHoh1XfhR8EB_5yY@ryzen>
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
In-Reply-To: <aHoh1XfhR8EB_5yY@ryzen>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 18, 2025 at 12:28:44PM +0200, Niklas Cassel wrote:
> On Tue, Jul 15, 2025 at 07:51:03PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> 2) Testing link down reset:
> 
> selftests before link down reset:
> # FAILED: 14 / 16 tests passed.
> 
> ## On EP side:
> # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
>   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> 
> 
> [  111.137162] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x4
> [  111.137881] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x0
> [  111.138432] rockchip-dw-pcie a40000000.pcie: hot reset or link-down reset
> [  111.139067] pcieport 0000:00:00.0: Recovering Root Port due to Link Down
> [  111.139686] pci-endpoint-test 0000:01:00.0: AER: can't recover (no error_detected callback)
> [  111.255407] rockchip-dw-pcie a40000000.pcie: PCIe Gen.3 x4 link up
> [  111.256019] rockchip-dw-pcie a40000000.pcie: Root Port reset completed
> [  111.383401] pcieport 0000:00:00.0: Root Port has been reset
> [  111.384060] pcieport 0000:00:00.0: AER: device recovery failed
> [  111.384582] rockchip-dw-pcie a40000000.pcie: PCIE_CLIENT_INTR_STATUS_MISC: 0x3
> [  111.385218] rockchip-dw-pcie a40000000.pcie: LTSSM_STATUS: 0x230011
> [  111.385771] rockchip-dw-pcie a40000000.pcie: Received Link up event. Starting enumeration!
> [  111.390866] pcieport 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
> [  111.391650] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> 
> Basically all tests timeout
> # FAILED: 1 / 16 tests passed.
> 
> Which is the same as before this patch series.

The above was with CONFIG_PCIEAER=y

Wilfred suggested that I tried without this config set.

However, doing so, I got the exact same result:
# FAILED: 1 / 16 tests passed.


For the record, the test that passes is not actually passing either,
it is the BAR4 test, which is skipped, since BAR4 is reserved on rock5b:
ok 5 pci_ep_bar.BAR4.BAR_TEST # SKIP BAR is disabled


Kind regards,
Niklas

