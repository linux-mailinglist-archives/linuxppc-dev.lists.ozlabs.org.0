Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E16676C4A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jan 2023 12:22:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P09n002wlz3fJ9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jan 2023 22:22:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mI/3Oz7x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mI/3Oz7x;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P09m420ZWz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jan 2023 22:21:24 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4585E60BA6;
	Sun, 22 Jan 2023 11:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7DCC433D2;
	Sun, 22 Jan 2023 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674386481;
	bh=dHGHdmr+7JzWwDRFHdWnmnaV6JJ/et4k1OGeOBy+s8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mI/3Oz7xCmlS0EV7UcJ+9g2QVobNA471jJz1x9ex7XvBZnCtDvm/oOalfJhuDKkwP
	 iIDfeDxSrJymiWI3VsCGUrIJbT196j5g1+9F/KLqpOILVP2GiwQ3FbJdyoWO/n3n4r
	 s9DkB1SBGQOJm0jxL7hXm5L/tUbSbovJBaE+2FCDceuVj9jopcsx+axHXCc5J73jw2
	 EmuvHaezScbUTEX+riqv/2dde+rZdINVS7kUCHRh2gvxYDjWLvSCvqIc9vUBWpA9Zf
	 /s0C/R4BSIMSLqvfE/zRzTEnYjhwpNzIMGHfWkR6aDv3fPaKghXmNF/SrwzwlSxsXj
	 NXN3lZf9/ZBuQ==
Received: by pali.im (Postfix)
	id 9349593D; Sun, 22 Jan 2023 12:21:18 +0100 (CET)
Date: Sun, 22 Jan 2023 12:21:18 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH 1/2] powerpc/pci: Allow to disable filling deprecated
 pci-OF-bus-map
Message-ID: <20230122112118.qhezbsmoeggbkqfs@pali>
References: <20220817163927.24453-1-pali@kernel.org>
 <20221009112555.spnwid27r4rwi67q@pali>
 <20221101222603.h3nlrp6xuhrnkmht@pali>
 <20221126162345.a4uuyefmtavfqa6g@pali>
 <20221216181206.tfzd2qalkking6sj@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221216181206.tfzd2qalkking6sj@pali>
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

PING? It is more than 5 months since this patch series is there and it
still has not received any comment.

On Friday 16 December 2022 19:12:06 Pali Rohár wrote:
> PING?
> 
> On Saturday 26 November 2022 17:23:45 Pali Rohár wrote:
> > PING?
> > 
> > On Tuesday 01 November 2022 23:26:03 Pali Rohár wrote:
> > > Hello! Gentle reminder...
> > > 
> > > On Sunday 09 October 2022 13:25:55 Pali Rohár wrote:
> > > > Hello! Any comments on this? It would be nice to take these two patches
> > > > (or at least patch 2) to finally enable PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
> > > > by default where possible.
> > > > 
> > > > Per following comment there can be an issue with early powermac so seems
> > > > that PPC_PCI_OF_BUS_MAP_FILL still has to be by default enabled (which
> > > > implies that PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT is disabled) on powermac:
> > > > https://lore.kernel.org/linuxppc-dev/575f239205e8635add81c9f902b7d9db7beb83ea.camel@kernel.crashing.org/
> > > > 
> > > > On Wednesday 17 August 2022 18:39:26 Pali Rohár wrote:
> > > > > Creating or filling pci-OF-bus-map property in the device-tree is
> > > > > deprecated since May 2006 [1]. Allow to disable filling this property by
> > > > > unsetting config option CONFIG_PPC_PCI_OF_BUS_MAP_FILL for remaining chrp
> > > > > and powermac code.
> > > > > 
> > > > > Disabling of pci-OF-bus-map property allows to enable new option
> > > > > CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT also for chrp and powermac.
> > > > > 
> > > > > [1] - https://lore.kernel.org/linuxppc-dev/1148016268.13249.14.camel@localhost.localdomain/
> > > > > 
> > > > > Signed-off-by: Pali Rohár <pali@kernel.org>
> > > > > ---
> > > > >  arch/powerpc/Kconfig         | 12 +++++++++++-
> > > > >  arch/powerpc/kernel/pci_32.c |  6 ++++++
> > > > >  2 files changed, 17 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > > > > index 5881441f7672..df2696c406ad 100644
> > > > > --- a/arch/powerpc/Kconfig
> > > > > +++ b/arch/powerpc/Kconfig
> > > > > @@ -373,9 +373,19 @@ config PPC_DCR
> > > > >  	depends on PPC_DCR_NATIVE || PPC_DCR_MMIO
> > > > >  	default y
> > > > >  
> > > > > +config PPC_PCI_OF_BUS_MAP_FILL
> > > > > +	bool "Fill pci-OF-bus-map property in the device-tree"
> > > > > +	depends on PPC32
> > > > > +	depends on PPC_PMAC || PPC_CHRP
> > > > > +	default y
> > > > > +	help
> > > > > +	  This option creates and fills pci-OF-bus-map property in the
> > > > > +	  device-tree which is deprecated and is needed only for old
> > > > > +	  platforms.
> > > > > +
> > > > >  config PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
> > > > >  	depends on PPC32
> > > > > -	depends on !PPC_PMAC && !PPC_CHRP
> > > > > +	depends on !PPC_PCI_OF_BUS_MAP_FILL
> > > > >  	bool "Assign PCI bus numbers from zero individually for each PCI domain"
> > > > >  	help
> > > > >  	  By default on PPC32 were PCI bus numbers unique across all PCI domains.
> > > > > diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
> > > > > index 433965bf37b4..ffc4e1928c80 100644
> > > > > --- a/arch/powerpc/kernel/pci_32.c
> > > > > +++ b/arch/powerpc/kernel/pci_32.c
> > > > > @@ -64,6 +64,8 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_IBM,	PCI_DEVICE_ID_IBM_CPC710_PCI64,	fixu
> > > > >  
> > > > >  #if defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_CHRP)
> > > > >  
> > > > > +#ifdef CONFIG_PPC_PCI_OF_BUS_MAP_FILL
> > > > > +
> > > > >  static u8* pci_to_OF_bus_map;
> > > > >  static int pci_bus_count;
> > > > >  
> > > > > @@ -223,6 +225,8 @@ pci_create_OF_bus_map(void)
> > > > >  }
> > > > >  #endif
> > > > >  
> > > > > +#endif /* CONFIG_PPC_PCI_OF_BUS_MAP_FILL */
> > > > > +
> > > > >  #endif /* defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_CHRP) */
> > > > >  
> > > > >  void pcibios_setup_phb_io_space(struct pci_controller *hose)
> > > > > @@ -264,6 +268,7 @@ static int __init pcibios_init(void)
> > > > >  	}
> > > > >  
> > > > >  #if defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_CHRP)
> > > > > +#ifdef CONFIG_PPC_PCI_OF_BUS_MAP_FILL
> > > > >  	pci_bus_count = next_busno;
> > > > >  
> > > > >  	/* OpenFirmware based machines need a map of OF bus
> > > > > @@ -272,6 +277,7 @@ static int __init pcibios_init(void)
> > > > >  	 */
> > > > >  	if (pci_assign_all_buses)
> > > > >  		pcibios_make_OF_bus_map();
> > > > > +#endif
> > > > >  #endif
> > > > >  
> > > > >  	/* Call common code to handle resource allocation */
> > > > > -- 
> > > > > 2.20.1
> > > > > 
