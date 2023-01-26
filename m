Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD5E67C954
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 12:00:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2d694Gykz3ch3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 22:00:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UJ2ydcyF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2d5H1WRcz3cQV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 21:59:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UJ2ydcyF;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P2d5G3tdhz4wgv;
	Thu, 26 Jan 2023 21:59:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1674730786;
	bh=PCtjVepWpk4GVT4pLOjcJhXEJ7Ve61N+43Vi055QQMk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UJ2ydcyFtr+dijCjka/06++SoUFGz/mq3/xT9p1dnPwjot0Kgs6fMRIKhz94CnzDc
	 2Hcq+L1/i+Ev/9TQIZVamh1HBvXA1MGcDdi4656157jNthYE6vVtBO0dH2ePLrE27S
	 6vmTMqTuZrfHpBG9iHGFRiu/P1/S0m9W7+GDyZCANd+FFVz5/qJrtPeY1aaQoKs+Pc
	 6oEDXodwmoar9TGA5H0pwzyT8RIYgkAPTiga6NIqfBk3cDwBSDslVeNBgUCfzlL4BV
	 xHd2VIv2d+cokONEHtTWVfIvkoZW6b0K5BNZjOzIGtq2iNC39zK16f9JcvRcZ/aswT
	 vpCunW79QOJAg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH 1/2] powerpc/pci: Allow to disable filling deprecated
 pci-OF-bus-map
In-Reply-To: <20230122112118.qhezbsmoeggbkqfs@pali>
References: <20220817163927.24453-1-pali@kernel.org>
 <20221009112555.spnwid27r4rwi67q@pali>
 <20221101222603.h3nlrp6xuhrnkmht@pali>
 <20221126162345.a4uuyefmtavfqa6g@pali>
 <20221216181206.tfzd2qalkking6sj@pali>
 <20230122112118.qhezbsmoeggbkqfs@pali>
Date: Thu, 26 Jan 2023 21:59:43 +1100
Message-ID: <87r0vhzhls.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Pali Roh=C3=A1r <pali@kernel.org> writes:
> PING? It is more than 5 months since this patch series is there and it
> still has not received any comment.

There was some related discussion in another thread.

I planned to pick it up last merge window, but it breaks the
pmac32_defconfig build when CONFIG_PPC_PCI_OF_BUS_MAP_FILL=3Dn:

  ld: arch/powerpc/platforms/powermac/feature.o: in function `core99_ata100=
_enable':
  feature.c:(.text+0xcd0): undefined reference to `pci_device_from_OF_node'
  ld: arch/powerpc/platforms/powermac/pci.o: in function `pmac_pci_init':
  pci.c:(.init.text+0x5d4): undefined reference to `pci_device_from_OF_node'
  ld: pci.c:(.init.text+0x660): undefined reference to `pci_device_from_OF_=
node'

So I dropped it, and haven't had time to work out a fix.

cheers

> On Friday 16 December 2022 19:12:06 Pali Roh=C3=A1r wrote:
>> PING?
>>=20
>> On Saturday 26 November 2022 17:23:45 Pali Roh=C3=A1r wrote:
>> > PING?
>> >=20
>> > On Tuesday 01 November 2022 23:26:03 Pali Roh=C3=A1r wrote:
>> > > Hello! Gentle reminder...
>> > >=20
>> > > On Sunday 09 October 2022 13:25:55 Pali Roh=C3=A1r wrote:
>> > > > Hello! Any comments on this? It would be nice to take these two pa=
tches
>> > > > (or at least patch 2) to finally enable PPC_PCI_BUS_NUM_DOMAIN_DEP=
ENDENT
>> > > > by default where possible.
>> > > >=20
>> > > > Per following comment there can be an issue with early powermac so=
 seems
>> > > > that PPC_PCI_OF_BUS_MAP_FILL still has to be by default enabled (w=
hich
>> > > > implies that PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT is disabled) on powe=
rmac:
>> > > > https://lore.kernel.org/linuxppc-dev/575f239205e8635add81c9f902b7d=
9db7beb83ea.camel@kernel.crashing.org/
>> > > >=20
>> > > > On Wednesday 17 August 2022 18:39:26 Pali Roh=C3=A1r wrote:
>> > > > > Creating or filling pci-OF-bus-map property in the device-tree is
>> > > > > deprecated since May 2006 [1]. Allow to disable filling this pro=
perty by
>> > > > > unsetting config option CONFIG_PPC_PCI_OF_BUS_MAP_FILL for remai=
ning chrp
>> > > > > and powermac code.
>> > > > >=20
>> > > > > Disabling of pci-OF-bus-map property allows to enable new option
>> > > > > CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT also for chrp and powerm=
ac.
>> > > > >=20
>> > > > > [1] - https://lore.kernel.org/linuxppc-dev/1148016268.13249.14.c=
amel@localhost.localdomain/
>> > > > >=20
>> > > > > Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
>> > > > > ---
>> > > > >  arch/powerpc/Kconfig         | 12 +++++++++++-
>> > > > >  arch/powerpc/kernel/pci_32.c |  6 ++++++
>> > > > >  2 files changed, 17 insertions(+), 1 deletion(-)
>> > > > >=20
>> > > > > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> > > > > index 5881441f7672..df2696c406ad 100644
>> > > > > --- a/arch/powerpc/Kconfig
>> > > > > +++ b/arch/powerpc/Kconfig
>> > > > > @@ -373,9 +373,19 @@ config PPC_DCR
>> > > > >  	depends on PPC_DCR_NATIVE || PPC_DCR_MMIO
>> > > > >  	default y
>> > > > >=20=20
>> > > > > +config PPC_PCI_OF_BUS_MAP_FILL
>> > > > > +	bool "Fill pci-OF-bus-map property in the device-tree"
>> > > > > +	depends on PPC32
>> > > > > +	depends on PPC_PMAC || PPC_CHRP
>> > > > > +	default y
>> > > > > +	help
>> > > > > +	  This option creates and fills pci-OF-bus-map property in the
>> > > > > +	  device-tree which is deprecated and is needed only for old
>> > > > > +	  platforms.
>> > > > > +
>> > > > >  config PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
>> > > > >  	depends on PPC32
>> > > > > -	depends on !PPC_PMAC && !PPC_CHRP
>> > > > > +	depends on !PPC_PCI_OF_BUS_MAP_FILL
>> > > > >  	bool "Assign PCI bus numbers from zero individually for each P=
CI domain"
>> > > > >  	help
>> > > > >  	  By default on PPC32 were PCI bus numbers unique across all P=
CI domains.
>> > > > > diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/=
pci_32.c
>> > > > > index 433965bf37b4..ffc4e1928c80 100644
>> > > > > --- a/arch/powerpc/kernel/pci_32.c
>> > > > > +++ b/arch/powerpc/kernel/pci_32.c
>> > > > > @@ -64,6 +64,8 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_IBM,	PC=
I_DEVICE_ID_IBM_CPC710_PCI64,	fixu
>> > > > >=20=20
>> > > > >  #if defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_CHRP)
>> > > > >=20=20
>> > > > > +#ifdef CONFIG_PPC_PCI_OF_BUS_MAP_FILL
>> > > > > +
>> > > > >  static u8* pci_to_OF_bus_map;
>> > > > >  static int pci_bus_count;
>> > > > >=20=20
>> > > > > @@ -223,6 +225,8 @@ pci_create_OF_bus_map(void)
>> > > > >  }
>> > > > >  #endif
>> > > > >=20=20
>> > > > > +#endif /* CONFIG_PPC_PCI_OF_BUS_MAP_FILL */
>> > > > > +
>> > > > >  #endif /* defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_CHRP) =
*/
>> > > > >=20=20
>> > > > >  void pcibios_setup_phb_io_space(struct pci_controller *hose)
>> > > > > @@ -264,6 +268,7 @@ static int __init pcibios_init(void)
>> > > > >  	}
>> > > > >=20=20
>> > > > >  #if defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_CHRP)
>> > > > > +#ifdef CONFIG_PPC_PCI_OF_BUS_MAP_FILL
>> > > > >  	pci_bus_count =3D next_busno;
>> > > > >=20=20
>> > > > >  	/* OpenFirmware based machines need a map of OF bus
>> > > > > @@ -272,6 +277,7 @@ static int __init pcibios_init(void)
>> > > > >  	 */
>> > > > >  	if (pci_assign_all_buses)
>> > > > >  		pcibios_make_OF_bus_map();
>> > > > > +#endif
>> > > > >  #endif
>> > > > >=20=20
>> > > > >  	/* Call common code to handle resource allocation */
>> > > > > --=20
>> > > > > 2.20.1
>> > > > >=20
