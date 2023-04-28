Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCF56F2048
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Apr 2023 23:52:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7RDN5L82z3f4M
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 07:52:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iTc5xlR/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iTc5xlR/;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q7RCT4snxz3cBp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Apr 2023 07:52:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA5236412C;
	Fri, 28 Apr 2023 21:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1666EC433EF;
	Fri, 28 Apr 2023 21:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682718721;
	bh=7O0Ned+q8ZPBB8k9Xsvo1WnJ6w0vF5mKxj1ue/l/84E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iTc5xlR/sYKg5kfAIuSF+qH8xR/12KpzXW/JWJKxFGx6KoVLMC5SQC3XZGEUatNBy
	 qxHxopoaTIxYs5y0h5IiFGDmE6jegNNDxWExCMesp1KPbrPScCx0scKsi89Q2mtma7
	 CEzHIftjJ2IENV5Oa+PrQzchU9nSUZpyIzawNh4y8BEHyDnBVHw2u+gDiFAyLU7dQS
	 7Di+G9J1V6k+ud9xPsdWBXF+Dkbu2UQCAk1VYMAgoPK8wHCGXqZVci8353+kEHs6i9
	 lyQdGmgsfYSJLbuzqyYwBZYfAZVADY+iGHvCaQqFaoh/xguzlkGzvXWJru9go150Ha
	 CW8iqrmcdcqJQ==
Date: Fri, 28 Apr 2023 16:51:59 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] PCI: layerscape: Add the endpoint linkup notifier
 support
Message-ID: <20230428215159.GA369421@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420221117.692173-1-Frank.Li@nxp.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, imx@lists.linux.dev, Rob Herring <robh@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, open list <linux-kernel@vger.kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 20, 2023 at 06:11:17PM -0400, Frank Li wrote:
> Layerscape has PME interrupt, which can be use as linkup notifer.
> Set CFG_READY bit when linkup detected.

s/use/used/
s/notifer/notifier/

> +/* PEX PFa PCIE pme and message interrupt registers*/

s/pme/PME/ to match other usage and spec.

> +		dev_info(pci->dev, "Detect the link up state !\n");
> +	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
> +		dev_info(pci->dev, "Detect the link down state !\n");
> +	} else if (val & PEX_PF0_PME_MES_DR_HRD) {
> +		dev_info(pci->dev, "Detect the hot reset state !\n");

No spaces before "!".  Omit the "!" completely unless these are
unexpected situations.  They seem ordinary to me.

Would probably be better as just "Link up", "Link down", "Hot reset".
Or "Link up state detected" if you want.

> +		dev_err(&pdev->dev, "Can't get 'pme' irq.\n");
> +		dev_err(&pdev->dev, "Can't register PCIe IRQ.\n");

Capitalize "IRQ" in both the above message and this one.  No "."
needed at the end.

Bjorn
