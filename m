Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0F4878A46
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 22:55:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Eome4s09;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtrDV44FMz3cCc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 08:55:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Eome4s09;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtrCl1L47z2xQH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 08:54:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 004C0CE12A5;
	Mon, 11 Mar 2024 21:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4BBC433C7;
	Mon, 11 Mar 2024 21:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710194079;
	bh=RWD53XQN8UsgouYUBF/rTClQBGz527mrHnHW07+LEvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eome4s09U0yv2YUiX7PkctOicSMRH/yZOh6gnNHwqz8AI3Od+MdGJEeamS0f7e/Rg
	 EKv3GFwpTGiOOLiVWTZpMtwJHx1nzexz6euFNxlYZWJ+mz5wMTgZY+s7k5ZCuLXjlU
	 Q+epQAXw6XXRuSGu4tO+RzCdoobL9znOdQ45I3dz+B6EpKd4zxdEjk7P6Oh4eNWsAc
	 Lp4NPa4szCmQyVI2rLifPe+RyPkuYYJ5VxV5Y+UMqeicTFacCyxISQMAHTlc0bDHNG
	 GFLAPM9kqVH055Ixhp4hp6Z+B+3XyEurelGgsFQYR8csLnIKr6fF0qQTyfN2WKjaGL
	 QI56/3wgaZNXA==
Date: Mon, 11 Mar 2024 22:54:28 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v9 07/10] PCI: dwc: ep: Remove "core_init_notifier" flag
Message-ID: <Ze99lLhe2GqIqMgl@ryzen>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-7-29d433d99cda@linaro.org>
 <ZesRk5Dg4KEASD3U@ryzen>
 <20240311144559.GA2504@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311144559.GA2504@thinkpad>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@
 lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 11, 2024 at 08:15:59PM +0530, Manivannan Sadhasivam wrote:
> > 
> > I would say that it is the following change that breaks things:
> > 
> > > -	if (!core_init_notifier) {
> > > -		ret = pci_epf_test_core_init(epf);
> > > -		if (ret)
> > > -			return ret;
> > > -	}
> > > -
> > 
> > Since without this code, pci_epf_test_core_init() will no longer be called,
> > as there is currently no one that calls epf->core_init() for a EPF driver
> > after it has been bound. (For drivers that call dw_pcie_ep_init_notify() in
> > .probe())
> > 
> 
> Thanks a lot for testing, Niklas!
> 
> > I guess one way to solve this would be for the EPC core to keep track of
> > the current EPC "core state" (up/down). If the core is "up" at EPF .bind()
> > time, notify the EPF driver directly after .bind()?
> > 
> 
> Yeah, that's a good solution. But I think it would be better if the EPC caches
> all events if the EPF drivers are not available and dispatch them once the bind
> happens for each EPF driver. Even though INIT_COMPLETE is the only event that is
> getting generated before bind() now, IMO it is better to add provision to catch
> other events also.
> 
> Wdyt?

I'm not sure.
What if the EPF goes up/down/up, it seems a bit silly to send all those
events to the EPF driver that will alloc+free+alloc.

Do we know for sure that we will want to store + replay events other than
INIT_COMPLETE?

And how many events should we store?


Until we can think of a good reason which events other than UP/DOWN we
can to store, I think that just storing the state as an integer in
struct pci_epc seems simpler.


Or I guess we could continue with a flag in struct pci_epc_features,
like has_perst_notifier, which would then require the EPC driver to
call both epc_notify_core_up() and epc_notify_core_down() when receiving
the PERST deassert/assert.
For a driver without the flag set, the EPC core would call
.epc_notify_core_up() after bind. (And .epc_notify_core_down() would never
be called, or it could call it before unbind().)
That way an EPF driver itself would not need any different handling
(all callbacks would always come, either triggered by an EPC driver that
has PERST GPIO irq, or triggered by the EPC core for a driver that lacks
a PERST GPIO).


Kind regards,
Niklas
