Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 193EF68FA3C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 23:24:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBvfv2wNbz3cBm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 09:24:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CMTCSn9N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CMTCSn9N;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBvdx4hXRz3c6H
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 09:23:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9CBEE617FB;
	Wed,  8 Feb 2023 22:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A47AC433EF;
	Wed,  8 Feb 2023 22:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675894993;
	bh=OTzvcsJ+7/dblWvZKx0OO7rGkqobHrEhsSkHSFYQUeU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=CMTCSn9NLVq9SnuioEIW7nld5dGU6EYQNsWBNgVqAcaZUyloxU9EVuP/Qa0o13pkd
	 B0XADOrQhPnRuX4Z//DGHrmcFUi/vVP7jaYx8B955g5Msag8gEW4BHWadctTjX/hjm
	 WHvbflnndg9xNZ5rdvGPA8/ASkuUaHeSCg1e0vtBgxD6flaqaFsRo9MUlP+beKnBWh
	 5c0wAxIqskNsY5dG/JDG2403gwPoYcxEE0Q9c+KFfioJoKd9L6taQI/B/D6WUJQfrH
	 Gu1FQucseaD95r4B9oV7zzaSk4YWesnlDDw8jtBsMH/EGnANaC5b6GqN9Tze/BhVsl
	 ZPuoGRGsF9QNQ==
Date: Wed, 8 Feb 2023 16:23:11 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <frank.li@nxp.com>
Subject: Re: [External] : RE: [EXT] [PATCH v2 1/1] PCI: layerscape: Add EP
 mode support for ls1028a
Message-ID: <20230208222311.GA2490083@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HE1PR0401MB2331634B29ED9EDAB032B73888DB9@HE1PR0401MB2331.eurprd04.prod.outlook.com>
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
Cc: Rob Herring <robh@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, Roy Zang <roy.zang@nxp.com>, ALOK TIWARI <alok.a.tiwari@oracle.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, "M.H. Lian" <minghuan.lian@nxp.com>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 07, 2023 at 04:20:21PM +0000, Frank Li wrote:
> > Subject: Re: [External] : RE: [EXT] [PATCH v2 1/1] PCI: layerscape: Add EP
> > mode support for ls1028a
> > 
> >          { .compatible = "fsl,ls1046a-pcie-ep", .data = &ls1_ep_drvdata },
> > +       { .compatible = "fsl,ls1028a-pcie-ep", .data = &ls1_ep_drvdata },
> >         { .compatible = "fsl,ls1088a-pcie-ep", .data = &ls2_ep_drvdata },
> > 
> > can it be like this for better readability. ?
> 
> It is just chip name and follow name conversion, which already
> upstreamed and documented. 
>
> Why do you think it not is good readability? 

I thought maybe ALOK's point was to sort the list, which does make a
lot of sense.  But if you want to sort by the .data member, I would
think you would make .compatible a secondary sort key, which means
ls1028a would come before ls1046a, so you would end up with this
instead:

 static const struct of_device_id ls_pcie_ep_of_match[] = {
+       { .compatible = "fsl,ls1028a-pcie-ep", .data = &ls1_ep_drvdata },
        { .compatible = "fsl,ls1046a-pcie-ep", .data = &ls1_ep_drvdata },
        { .compatible = "fsl,ls1088a-pcie-ep", .data = &ls2_ep_drvdata },
        { .compatible = "fsl,ls2088a-pcie-ep", .data = &ls2_ep_drvdata },
        { .compatible = "fsl,lx2160ar2-pcie-ep", .data = &lx2_ep_drvdata },
        { },
 };

