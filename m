Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC44659745E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 18:43:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7DNY4lfMz3cDG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 02:43:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YpvpIKT4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YpvpIKT4;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7DMw1lN1z3bgC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 02:42:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 502EE60EDD;
	Wed, 17 Aug 2022 16:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9BBC433D6;
	Wed, 17 Aug 2022 16:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660754568;
	bh=+wEnZVI2aj40wim23BMsG+ci2KQg9to47RsgHXVHy10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YpvpIKT4XzsirkSD5uvjCpB+/1pIK+WsuRzW1OyY4JFHJM/UPgkTU0Dyof3gdxlD+
	 N9UeWOT6DqR/F02nr8dTesCV9NATI2TGSUYB/R9tBGzxXPSg7QngOCs5ui5IBs+gJK
	 rLwzJXJaLD1zhLxBAV94ZgMrFc9tma23ROcaLTcjfUc11WtX2f8GtAX3UuppT+RZ9D
	 D/K4io2T2RJfGjy4B2YcPEiR8BzL+YTRRIVdYftQPQGNTKD9lAaaBVMtxJbptx87kx
	 xeTN8Ihpf1nOpMTw7H4aCfYwqI9wj9ciPuFbzK99E0x0QcrXw5JhOlTMGBiJ4wrrEc
	 osemWEeY22khw==
Received: by pali.im (Postfix)
	id AAA9C739; Wed, 17 Aug 2022 18:42:45 +0200 (CEST)
Date: Wed, 17 Aug 2022 18:42:45 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 5/5] powerpc/pci: Add config option for using all 256 PCI
 buses
Message-ID: <20220817164245.qanxklpavge3shcm@pali>
References: <20220706104308.5390-1-pali@kernel.org>
 <20220706104308.5390-6-pali@kernel.org>
 <20220721222145.rzgthbwoselx2l43@pali>
 <875yjkb0ht.fsf@mpe.ellerman.id.au>
 <20220726111001.a2upqf5m5welcla6@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220726111001.a2upqf5m5welcla6@pali>
User-Agent: NeoMutt/20180716
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
Cc: Nick Child <nick.child@ibm.com>, linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, linux-pci@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday 26 July 2022 13:10:01 Pali Rohár wrote:
> On Tuesday 26 July 2022 21:02:22 Michael Ellerman wrote:
> > Pali Rohár <pali@kernel.org> writes:
> > > On Wednesday 06 July 2022 12:43:08 Pali Rohár wrote:
> > >> By default on PPC32 are PCI bus numbers unique across all PCI domains.
> > >> So system could have only 256 PCI buses independently of available
> > >> PCI domains.
> > >>
> > >> This is due to filling DT property pci-OF-bus-map which does not reflect
> > >> multi-domain setup.
> > >>
> > >> On all powerpc platforms except chrp and powermac there is no DT property
> > >> pci-OF-bus-map anymore and therefore it is possible on non-chrp/powermac
> > >> platforms to avoid this limitation of maximal number of 256 PCI buses in
> > >> system even on multi-domain setup.
> > >>
> > >> But avoiding this limitation would mean that all PCI and PCIe devices would
> > >> be present on completely different BDF addresses as every PCI domain starts
> > >> numbering PCI bueses from zero (instead of the last bus number of previous
> > >> enumerated PCI domain). Such change could break existing software which
> > >> expects fixed PCI bus numbers.
> > >>
> > >> So add a new config option CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT which
> > >> enables this change. By default it is disabled. It cause that initial value
> > >> of hose->first_busno is zero.
> > >>
> > >> Signed-off-by: Pali Rohár <pali@kernel.org>
> > >> ---
> > >>  arch/powerpc/Kconfig         | 11 +++++++++++
> > >>  arch/powerpc/kernel/pci_32.c |  6 ++++++
> > >>  2 files changed, 17 insertions(+)
> > >>
> > >> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > >> index be68c1f02b79..f66084bc1dfe 100644
> > >> --- a/arch/powerpc/Kconfig
> > >> +++ b/arch/powerpc/Kconfig
> > >> @@ -370,6 +370,17 @@ config PPC_DCR
> > >>  	depends on PPC_DCR_NATIVE || PPC_DCR_MMIO
> > >>  	default y
> > >>
> > >> +config PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
> > >> +	depends on PPC32
> > >> +	depends on !PPC_PMAC && !PPC_CHRP
> > >> +	bool "Assign PCI bus numbers from zero individually for each PCI domain"
> > >> +	help
> > >> +	  By default on PPC32 were PCI bus numbers unique across all PCI domains.
> > >> +	  So system could have only 256 PCI buses independently of available
> > >> +	  PCI domains. When this option is enabled then PCI bus numbers are
> > >> +	  PCI domain dependent and each PCI controller on own domain can have
> > >> +	  256 PCI buses, like it is on other Linux architectures.
> > >> +
> > >
> > > What do you think, would it be possible to set default value of this
> > > option to enabled?
> > 
> > My preference would be to not have the option at all, just make it the
> > default behaviour. Every new CONFIG option adds more combinations that
> > need testing, or more likely don't get well tested.
> > 
> > But I don't have a good feel for what could break if we turn it on, so
> > honestly I don't really know.
> > 
> > Also I do most of my 32-bit testing on pmacs, which are not affected by
> > the change.
> 
> It is because this change is incompatible with deprecated pci-OF-bus-map
> which pmac uses. I do not have any pmac box for testing or development,
> so I let this part as is.
> 
> If one day pci-OF-bus-map would be possible to disable on pmac then this
> pci bus number change can be enabled also for pmac.

Hello! I have created this patch which allows to disable deprecated
pci-OF-bus-map on powermac and allow to enable this new config option
PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT also on powermac.

So you can test this option too on your powermac boxes.

I'm really not sure if that pci-OF-bus-map is required and for which
platforms or software...

Patch for allowing to disable pci-OF-bus-map is here:
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220817163927.24453-1-pali@kernel.org/

> > So I'll probably take the series as-is, and then we can do some more
> > widespread testing and possibly flip the default to enabled, and then
> > maybe remove the option entirely in future.
> > 
> > cheers
> 
> I have tested it on P2020 board with 3 PCIe devices, each on own bus
> where each bus is connected to different PCIe controller / domain and it
> works correctly. Every PCIe device is on bus 1 bus but on different
> domains.
