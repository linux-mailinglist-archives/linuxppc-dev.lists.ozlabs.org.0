Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDDD6684D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 22:00:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtH4t1p0rz3cH1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 08:00:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d4giMpFz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=lpieralisi@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d4giMpFz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nt8CX2RCBz3bT7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 02:50:48 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A747062064;
	Thu, 12 Jan 2023 15:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10935C433EF;
	Thu, 12 Jan 2023 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673538644;
	bh=56hHJDsmg+aMaj3QZPHGVjwdZvjGg+53Y+wWNaKhYAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d4giMpFzAv8KQ4w0ui8ugaeRwaolxyDPbRIHurora702Io29haIJ9ZySWNUBH5ltK
	 wxEHrB2x1YUZQtlOvLNeL5K7BDpDPjIXMMRMMtTHxKcD14FXROAOCUNx0LjlJhU9gC
	 jAazybdLcqwV9L4LoNlPNCRhdXWOqO5YKtFGrRTkk/qrVfj2FXgr3CGRZ2bqQJ2pO8
	 bfxRQL0vi14RmaBNmI06t6Ptrsc9gKadgFQwC3GUlotBaRvITT8+69xaBM6s+P64fO
	 LMX6cKvlI3TvuMG+V8yDR/lceuhTXYxQqVEIhxo6Ixowmb9/99dAZDbbcDhnW91Y/s
	 99IUpoA/3O8rg==
Date: Thu, 12 Jan 2023 16:50:37 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH 1/1] PCI: layerscape: Add EP mode support for ls1028a
Message-ID: <Y8AsTaMwC/L/M+ve@lpieralisi>
References: <20221216161537.1003595-1-Frank.Li@nxp.com>
 <HE1PR0401MB2331BA1F1CDF8F8B8A4D26E488FE9@HE1PR0401MB2331.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HE1PR0401MB2331BA1F1CDF8F8B8A4D26E488FE9@HE1PR0401MB2331.eurprd04.prod.outlook.com>
X-Mailman-Approved-At: Fri, 13 Jan 2023 07:59:45 +1100
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, Rob Herring <robh@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "M.H. Lian" <minghuan.lian@nxp.com>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 09, 2023 at 03:41:31PM +0000, Frank Li wrote:
> > 
> > From: Xiaowei Bao <xiaowei.bao@nxp.com>
> > 
> > Add PCIe EP mode support for ls1028a.
> > 
> > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > ---
> > 
> > All other patches were already accepte by maintainer in
> > https://lore.kernel.org/lkml/20211112223457.10599-1-leoyang.li@nxp.com/
> > 
> > But missed this one.
> > 
> > Re-post.
> > 
> 
> Ping.

You must sign it off since you obviously are in the patch delivery chain:

https://docs.kernel.org/process/submitting-patches.html

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
