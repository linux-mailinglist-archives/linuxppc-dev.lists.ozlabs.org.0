Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5FF85474F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 11:39:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NM4tcHce;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZZSp1Xcnz3dXD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 21:39:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NM4tcHce;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZZS52zXpz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 21:39:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86E53618B6;
	Wed, 14 Feb 2024 10:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55909C433C7;
	Wed, 14 Feb 2024 10:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707907139;
	bh=eslzQormGDUUKR6M3wUfA/wR65g2VVIMI2OcUV5+luQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NM4tcHcenWq1MQ46lCcjZguB2y0u9a08wBEfpVvvyTs7aHG6ltzW76Dp3veftpT3j
	 i1Z8OUTTxKwVUAmyDMA+HXFG+VHMfUSpBXFYQKnXtfp4zAw9tSsPC4LsKRiXuq2zAg
	 HvqopQ1KrOMmaeAddUivvw1SPeSBFS4rs/JYB6OWbu8LyMbywWfLlGHwIwSoPCUba+
	 CR/KZxC/S7C6BvcQ6xEq1ZAT/XwXhgiHFAmVMnZNvfQpiBQ54hkBW5XE+iCSel8XF/
	 fPXVUiky2QMlDUFAJiVqHbMLhldLNckU/yM4uw7ip+kHMlzdMUBZ1fj64JKT3Rpf6g
	 dEPOCUfNAx76A==
Date: Wed, 14 Feb 2024 11:38:47 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Kishon Vijay Abraham I <kvijayab@amd.com>
Subject: Re: [PATCH 0/2] PCI endpoint BAR hardware description cleanup
Message-ID: <ZcyYNzYo9HiQi4DY@x1-carbon>
References: <20240210012634.600301-1-cassel@kernel.org>
 <7a243a1e-6b47-bc2f-c538-b57db1c9c580@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a243a1e-6b47-bc2f-c538-b57db1c9c580@amd.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Allen Hubbe <allenbh@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Damien Le Moal <dlemoal@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, linuxppc-dev@lists.ozlabs
 .org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, ntb@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Jon Mason <jdmason@kudzu.us>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 14, 2024 at 09:47:54AM +0530, Kishon Vijay Abraham I wrote:
> Hi Niklas,
> 
> On 2/10/2024 6:56 AM, Niklas Cassel wrote:
> > The series is based on top of:
> > https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=endpoint
> > 
> > 
> > Hello all,
> > 
> > This series cleans up the hardware description for PCI endpoint BARs.
> > 
> > The problems with the existing hardware description:
> > -The documentation is lackluster.
> > -Some of the names are confusingly similar, e.g. fixed_64bit and
> >   fixed_size, even though these are for completely unrelated things.
> > -The way that the BARs are defined in the endpoint controller drivers
> >   is messy, because the left hand side is not a BAR, so you can mark a
> >   BAR as e.g. both fixed size and reserved.
> > 
> > This series tries to address all the problems above.
> > 
> > Personally, I think that the code is more readable, both the endpoint
> > controller drivers, but also pci-epc-core.c.
> 
> Thank you for cleaning this up!
> 
> FWIW:
> Reviewed-by: Kishon Vijay Abraham I <kishon@kernel.org>

IMHO, a FWIW is quite the undersell here, as there is no R-b I would value
higher than the R-b from the original author or the pci endpoint subsystem :)


Kind regards,
Niklas
