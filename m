Return-Path: <linuxppc-dev+bounces-10251-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E981EB05624
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 11:20:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhDDW21LJz3c8C;
	Tue, 15 Jul 2025 19:20:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752571211;
	cv=none; b=Jfqb3Jd3pxowjR/+ChqPFEqQgaWAPuusxns1KtqJHhmbdLQwYT9tXYkSeCzPNHHR+Q6D1yi+9YWi9K4ZtZSCbOn8agE94iPk+CD2OogsA8D1KxgX/qeG4U8Q4o3HgAX7pTBoSAUM2QVZAPqKv8zH/ubpgBPtOajXBKxSJy+aVzVZoNT4mUjks65xYAmX01Muur7OIBMdgDhCY6+t1Ti4Iuwjy08UZPikoHmff3bTsApFL1yzP4MHieRqwrDfSqIFyLGnK5Tg3lGRH/w++XgjIO222GcZu7reJqg/0m01cw2H0U97s9ZcMLwjTZQ5nv5rnv//I4s75zw88vQ2vQpG7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752571211; c=relaxed/relaxed;
	bh=wentu35WzBTz2FfdFIRnADpD/NQKbxdQzM55pRJzSNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGpCXh9cAf/CcWbaGtZ8EiHuJnbZUC+GzkMg/JzziHL0rwCIfKJI5XgYAQ/p8kr5ybqYOQEX6Meg/7CKNqAagsUcKL8FAQuGtUL5ZG/c1rX4YSBr9hF0xWLTYzrIqBI2h3/O+BECf/KokhpIbYUS06w9BXzs1iCU3sAhz/TamLFVSKLUBtY7iNeu5c8e+Doo8vntx/beXIyxbXwt5/GH01uhCfwOWEBu5sLxOM2uo3w2rpQLresKTXiXCZyRZTBNj/AQUyqVu41LoU4L5qQq87DQLkX9Xm12qel/K0m1JPHGck92svMMcTNkfTXUeeshn7KeNYXADaBuGxDFHnUZKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d4e/gA/X; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d4e/gA/X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhDDV4f90z3c89
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 19:20:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46FF246316;
	Tue, 15 Jul 2025 09:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA07C4CEE3;
	Tue, 15 Jul 2025 09:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752571208;
	bh=zMX0HnJ6CCzw8b9lVKy3uhSYJilLYoAhgM5/FrM5H9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d4e/gA/XYvMMld3wapT7zeY1Gk0uwHEwJggXKWAa4A9zBaFmlJPabx3x1jsbR3yNJ
	 R0GpKskCbOugdis7UiMYxXYnDrOzn/3/1+OUIOLoEdjOIsos0z6JrQcMUjNzQlKcre
	 lz1944BNZHo8Y5XDm7f+ywdeXXcX700tfufNkwNk7XQYX5eOLTKfsLSCzXqjpCFC03
	 HjshEiqu1EwEsrzoU5vhtsQruoimF/UqS2FUcQbB60aU0ppgJ5dVZrk8/XJB8ZaWpR
	 hMimgMsxb0vHBX51jmnVu+jjDPdCVfJnQ9diGWXPuuv61GKkWjTE8KGEJ1K7gGO+Hq
	 zs+q6/TELjheg==
Date: Tue, 15 Jul 2025 14:49:56 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczy??ski <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Niklas Cassel <cassel@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/4] PCI/ERR: Add support for resetting the Root Ports
 in a platform specific way
Message-ID: <tfpszamhfxx62vclkfxqfuuda24ps6e4yti7fgywycznpwfj5l@22nggkft2mph>
References: <20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com>
 <20250715-pci-port-reset-v5-1-26a5d278db40@oss.qualcomm.com>
 <aHYOW3P0wvHo5a1j@wunner.de>
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
In-Reply-To: <aHYOW3P0wvHo5a1j@wunner.de>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 15, 2025 at 10:16:27AM GMT, Lukas Wunner wrote:
> On Tue, Jul 15, 2025 at 01:29:18PM +0530, Manivannan Sadhasivam wrote:
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -4964,7 +4964,19 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
> >  
> >  void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
> >  {
> > +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> > +	int ret;
> > +
> > +	if (host->reset_root_port) {
> > +		ret = host->reset_root_port(host, dev);
> > +		if (ret)
> > +			pci_err(dev, "Failed to reset Root Port: %d\n", ret);
> > +
> > +		return;
> > +	}
> > +
> 
> There used to be a pci_is_root_bus() check here:
> 
> https://lore.kernel.org/r/20250524185304.26698-2-manivannan.sadhasivam@linaro.org/
> 

Right. I forgot to include that series, but somehow managed to remember the
s/slot/root_port change.

Will incorporate in next revision, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

