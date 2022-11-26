Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB68639730
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 17:25:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKHBm4QR0z3f3g
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 03:25:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MYf+UI0e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MYf+UI0e;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKH9P283Gz3f4J
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 03:23:53 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 17D98CE181B;
	Sat, 26 Nov 2022 16:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5E8C433C1;
	Sat, 26 Nov 2022 16:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669479828;
	bh=qKqx4Tr3JhjXXIAJyvO8uCkqIauGraZIS4qb2SsQx4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MYf+UI0ezWSP6CzcSK3T4oTdNiEwtaR6toqDDnt+pbazrlYC9uQDV3Ck715V65AbD
	 z6fC3XZ9XKoOcSm+YdcLNx+hZ4+E+T/YTrMqtTiv5QgT2CQsRtuMhHtP455sPcQ3wI
	 FcCaZ/K5ZnJDTksrnZtbAntwr+xkkcOt4AKrx9pdzvucwtGi7jFP8uKsZMONVRAG9i
	 egjCDyHfDdHuVcaEWYmQtRkd86T0Y0dh9eFNgMYwZRi9TP9dydjYVPb2l8KO122AwS
	 lOXaY++X7LGDmJUhUiwt/tNIT33amuSRv8l+J5MfIPuWoUC+XO4N8DJeN4SPE7Zl1s
	 pUfQ7HFfb4XJQ==
Received: by pali.im (Postfix)
	id 9D86C7B2; Sat, 26 Nov 2022 17:23:45 +0100 (CET)
Date: Sat, 26 Nov 2022 17:23:45 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH 1/2] powerpc/pci: Allow to disable filling deprecated
 pci-OF-bus-map
Message-ID: <20221126162345.a4uuyefmtavfqa6g@pali>
References: <20220817163927.24453-1-pali@kernel.org>
 <20221009112555.spnwid27r4rwi67q@pali>
 <20221101222603.h3nlrp6xuhrnkmht@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221101222603.h3nlrp6xuhrnkmht@pali>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PING?

On Tuesday 01 November 2022 23:26:03 Pali Rohár wrote:
> Hello! Gentle reminder...
> 
> On Sunday 09 October 2022 13:25:55 Pali Rohár wrote:
> > Hello! Any comments on this? It would be nice to take these two patches
> > (or at least patch 2) to finally enable PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
> > by default where possible.
> > 
> > Per following comment there can be an issue with early powermac so seems
> > that PPC_PCI_OF_BUS_MAP_FILL still has to be by default enabled (which
> > implies that PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT is disabled) on powermac:
> > https://lore.kernel.org/linuxppc-dev/575f239205e8635add81c9f902b7d9db7beb83ea.camel@kernel.crashing.org/
> > 
> > On Wednesday 17 August 2022 18:39:26 Pali Rohár wrote:
> > > Creating or filling pci-OF-bus-map property in the device-tree is
> > > deprecated since May 2006 [1]. Allow to disable filling this property by
> > > unsetting config option CONFIG_PPC_PCI_OF_BUS_MAP_FILL for remaining chrp
> > > and powermac code.
> > > 
> > > Disabling of pci-OF-bus-map property allows to enable new option
> > > CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT also for chrp and powermac.
> > > 
> > > [1] - https://lore.kernel.org/linuxppc-dev/1148016268.13249.14.camel@localhost.localdomain/
> > > 
> > > Signed-off-by: Pali Rohár <pali@kernel.org>
> > > ---
> > >  arch/powerpc/Kconfig         | 12 +++++++++++-
> > >  arch/powerpc/kernel/pci_32.c |  6 ++++++
> > >  2 files changed, 17 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > > index 5881441f7672..df2696c406ad 100644
> > > --- a/arch/powerpc/Kconfig
> > > +++ b/arch/powerpc/Kconfig
> > > @@ -373,9 +373,19 @@ config PPC_DCR
> > >  	depends on PPC_DCR_NATIVE || PPC_DCR_MMIO
> > >  	default y
> > >  
> > > +config PPC_PCI_OF_BUS_MAP_FILL
> > > +	bool "Fill pci-OF-bus-map property in the device-tree"
> > > +	depends on PPC32
> > > +	depends on PPC_PMAC || PPC_CHRP
> > > +	default y
> > > +	help
> > > +	  This option creates and fills pci-OF-bus-map property in the
> > > +	  device-tree which is deprecated and is needed only for old
> > > +	  platforms.
> > > +
> > >  config PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
> > >  	depends on PPC32
> > > -	depends on !PPC_PMAC && !PPC_CHRP
> > > +	depends on !PPC_PCI_OF_BUS_MAP_FILL
> > >  	bool "Assign PCI bus numbers from zero individually for each PCI domain"
> > >  	help
> > >  	  By default on PPC32 were PCI bus numbers unique across all PCI domains.
> > > diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
> > > index 433965bf37b4..ffc4e1928c80 100644
> > > --- a/arch/powerpc/kernel/pci_32.c
> > > +++ b/arch/powerpc/kernel/pci_32.c
> > > @@ -64,6 +64,8 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_IBM,	PCI_DEVICE_ID_IBM_CPC710_PCI64,	fixu
> > >  
> > >  #if defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_CHRP)
> > >  
> > > +#ifdef CONFIG_PPC_PCI_OF_BUS_MAP_FILL
> > > +
> > >  static u8* pci_to_OF_bus_map;
> > >  static int pci_bus_count;
> > >  
> > > @@ -223,6 +225,8 @@ pci_create_OF_bus_map(void)
> > >  }
> > >  #endif
> > >  
> > > +#endif /* CONFIG_PPC_PCI_OF_BUS_MAP_FILL */
> > > +
> > >  #endif /* defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_CHRP) */
> > >  
> > >  void pcibios_setup_phb_io_space(struct pci_controller *hose)
> > > @@ -264,6 +268,7 @@ static int __init pcibios_init(void)
> > >  	}
> > >  
> > >  #if defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_CHRP)
> > > +#ifdef CONFIG_PPC_PCI_OF_BUS_MAP_FILL
> > >  	pci_bus_count = next_busno;
> > >  
> > >  	/* OpenFirmware based machines need a map of OF bus
> > > @@ -272,6 +277,7 @@ static int __init pcibios_init(void)
> > >  	 */
> > >  	if (pci_assign_all_buses)
> > >  		pcibios_make_OF_bus_map();
> > > +#endif
> > >  #endif
> > >  
> > >  	/* Call common code to handle resource allocation */
> > > -- 
> > > 2.20.1
> > > 
