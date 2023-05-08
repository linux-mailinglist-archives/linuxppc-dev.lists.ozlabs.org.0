Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A53166FB9C5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 23:32:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFZHg4f21z3fNX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 07:31:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SOAlUBWI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SOAlUBWI;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFZGm40jGz3cFt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 07:31:12 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EEEE862517;
	Mon,  8 May 2023 21:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31388C433EF;
	Mon,  8 May 2023 21:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683581468;
	bh=T0A52YhbVC0xShcDektXWFKw+mqnN3k3AY2OPTdnEjg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SOAlUBWI1RiZWt4v/no1jMnVz5vsHRWC2dBBSgu+0aa6liSOZwgEjQbPrfmfwkHHd
	 ILaGwcnaIIg7BHxDSihUs3mN3XnskViXm/8m651NE0q+h5VHuJzKgHP4u/+gNjTRjB
	 8+ko+NbXdY43bHh3j6RNCenshzNAOK2waDgHlP4c92mJ/DJb6y1CK4NNgSWpdhtEgc
	 ysOmHf1sL7Vio+P+ydRnTNaP2wOCN+2a5C2gVVI8JLWQX10LIiffiHx40GFLUcMUSs
	 aUsd3zbTFdYjBRhT4u/2xvwZ1jpzG9pzddicUmBXu8z+kTVhbLQnwU9At99GnQoFgx
	 QdT91TV03NtRQ==
Date: Mon, 8 May 2023 16:31:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <frank.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH v2 1/1] PCI: layerscape: Add the endpoint
 linkup notifier support
Message-ID: <20230508213106.GA1192065@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM6PR04MB4838D92748AD426DA1661C0C88719@AM6PR04MB4838.eurprd04.prod.outlook.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, open list <linux-kernel@vger.kernel.org>, "M.H. Lian" <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Roy Zang <roy.zang@nxp.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Rob Herring <robh@kernel.org>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 08, 2023 at 01:31:26PM +0000, Frank Li wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: Saturday, May 6, 2023 2:59 AM
> > To: Frank Li <frank.li@nxp.com>
> > Cc: M.H. Lian <minghuan.lian@nxp.com>; Mingkai Hu
> > <mingkai.hu@nxp.com>; Roy Zang <roy.zang@nxp.com>; Lorenzo Pieralisi
> > <lpieralisi@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof
> > Wilczyński <kw@linux.com>; Bjorn Helgaas <bhelgaas@google.com>; open
> > list:PCI DRIVER FOR FREESCALE LAYERSCAPE <linuxppc-dev@lists.ozlabs.org>;
> > open list:PCI DRIVER FOR FREESCALE LAYERSCAPE <linux-
> > pci@vger.kernel.org>; moderated list:PCI DRIVER FOR FREESCALE
> > LAYERSCAPE <linux-arm-kernel@lists.infradead.org>; open list <linux-
> > kernel@vger.kernel.org>; imx@lists.linux.dev
> > Subject: [EXT] Re: [PATCH v2 1/1] PCI: layerscape: Add the endpoint linkup
> > notifier support

All these quoted headers are redundant clutter since we've already
seen them when Manivannan sent his comments.  It would be nice if your
mailer could be configured to omit them.

> > > +static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
> > > +                                  struct platform_device *pdev)
> > > +{
> > > +     u32 val;
> > > +     int ret;
> > > +
> > > +     pcie->irq = platform_get_irq_byname(pdev, "pme");
> > > +     if (pcie->irq < 0) {
> > > +             dev_err(&pdev->dev, "Can't get 'pme' IRQ\n");
> > 
> > PME
> 
> Here should be dts property `pme`, suppose should match
> platform_get_irq_byname(pdev, "pme");

You can also edit out all the other context and questions if you're
not responding to them.

There were a lot of other comments that were useful but are not
relevant to this reply.

Bjorn
