Return-Path: <linuxppc-dev+bounces-13833-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9FCC39738
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 08:50:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2DrD6zJMz2yrq;
	Thu,  6 Nov 2025 18:50:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762415420;
	cv=none; b=TDsNW+l8xrKgovTONh84dkK9ayTnhbt6EvhGvUON9HsK/JNSuJvWFt3j4XFFTo+0A4SSAyG1B2XTGGA0KqXLDw/VbInxV6rdg2nlxspYQNteD+S7trK+iDzW3bp1cdZoSFYU/+l8q4zZuHynXFzm4P9qVcwD4yU9eP3XIAMRqMqaY6+BXcGitZGSaQRRS0hct6VVleIfJ6l4UHuWa+lrxvW92xq/s1wR91GOaH8DaIGBTo2D+wKXb+vm9cNLYXFPH8dpWmK+rsV4MKCFgUXJaiJovaRZWrKza9Q9IhvIqYSUfEY1Uel04KmMrQddoB+qJjpFEpuwMB2biVJkfw3T7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762415420; c=relaxed/relaxed;
	bh=7Daal1mpDnwksHTBXhovLycDkyASp1letXDnqfk8zx0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RHUB09tHxOv1d09LqqI3vi+J6n76oI8cjQ5tS7HCoeim42a/bjSPIwqXySPHW6JG7tov4Ifmjlu+wzxziPMtdPI0bW8uCBjEyM4WjLwg4rqoXspW+7+emZWbVtefj9S1Ek5BAsACUQG/xnYzoStd1+dOmxMYFzt7QdX82k8AePA/t9i+FE7ce8A+VB/ZSZkzHjeb2tyvntk8vqstb3+TnZkews4r7l8JLYuZS28LzsWhnA7DKLVX6SrdvC4fdhE6uCQNYvSJbCaMdzaHSjmzoSs/T7RP+v1hQs01AzgGDU7+JabywqpaphS1WOBMuqy9AVBqgaBWGeUsz+v9nzyS3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=oGtJR8jt; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=oGtJR8jt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2Dr72HW1z2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 18:50:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=7Daal1mpDnwksHTBXhovLycDkyASp1letXDnqfk8zx0=; t=1762415415;
	x=1763020215; b=oGtJR8jtwW4dOgZqd6glaxHar3B0WRikL8zY+38H6nf/4QSZxJ61ylXStUSyB
	Nn1MfF1Qmn0WXFxTwFvbC536pu3NYE7ZZNk9jSSyzP4gaeV+kwc3lK1EVLEF5lDFdYFsyBh/We1IP
	y8Sl+zhXZCizPWsaSt+gLArmfv2jpktruSDGf1cAn/ZddTDk9o7+4VrsW+24R0GCMftKddlIxC6op
	OsUAuFzOdjFsw/vXHHRcbYp7GnR9oygMZIQv2cXbqCBYKrqUwi9IiAp2ND9fs9Ra+QgGL6NFWRwpE
	YTK/2OgUxp/m13gUWVN3uwrRhdo8TdAOBce887pl2ndLeZSmHA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vGukh-00000003Msv-3VoG; Thu, 06 Nov 2025 08:49:51 +0100
Received: from dynamic-077-183-232-018.77.183.pool.telefonica.de ([77.183.232.18] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vGukh-00000003VWh-2Pwo; Thu, 06 Nov 2025 08:49:51 +0100
Message-ID: <8fcc0fd4b74f99d5c4d80d3907e7607a7d4c89da.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 02/24] sparc/PCI: Remove pcibios_enable_device() as they
 do nothing extra
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andreas Larsson <andreas@gaisler.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "David S. Miller" <davem@davemloft.net>,  Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, 	linux-pci@vger.kernel.org,
 sparclinux@vger.kernel.org, Thomas Bogendoerfer	
 <tsbogend@alpha.franken.de>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Yinghai Lu <yinghai@kernel.org>, Igor Mammedov	
 <imammedo@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>,  Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=	
 <kw@linux.com>, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, 
	linuxppc-dev@lists.ozlabs.org
Date: Thu, 06 Nov 2025 08:49:50 +0100
In-Reply-To: <20250822145605.18172-3-ilpo.jarvinen@linux.intel.com>
References: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>
	 <20250822145605.18172-3-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 77.183.232.18
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Ilpo,

On Fri, 2025-08-22 at 17:55 +0300, Ilpo J=C3=A4rvinen wrote:
> Under arch/sparc/ there are multiple copies of pcibios_enable_device()
> but none of those seem to do anything extra beyond what
> pci_enable_resources() is supposed to do. These functions could lead to
> inconsistencies in behavior, especially now as pci_enable_resources()
> and the bridge window resource flags behavior are going to be altered
> by upcoming changes.
>=20
> Remove all pcibios_enable_device() from arch/sparc/ so that PCI core
> can simply call into pci_enable_resources() instead using it's __weak
> version of pcibios_enable_device().
>=20
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  arch/sparc/kernel/leon_pci.c | 27 ---------------------------
>  arch/sparc/kernel/pci.c      | 27 ---------------------------
>  arch/sparc/kernel/pcic.c     | 27 ---------------------------
>  3 files changed, 81 deletions(-)
>=20
> diff --git a/arch/sparc/kernel/leon_pci.c b/arch/sparc/kernel/leon_pci.c
> index 8de6646e9ce8..10934dfa987a 100644
> --- a/arch/sparc/kernel/leon_pci.c
> +++ b/arch/sparc/kernel/leon_pci.c
> @@ -60,30 +60,3 @@ void leon_pci_init(struct platform_device *ofdev, stru=
ct leon_pci_info *info)
>  	pci_assign_unassigned_resources();
>  	pci_bus_add_devices(root_bus);
>  }
> -
> -int pcibios_enable_device(struct pci_dev *dev, int mask)
> -{
> -	struct resource *res;
> -	u16 cmd, oldcmd;
> -	int i;
> -
> -	pci_read_config_word(dev, PCI_COMMAND, &cmd);
> -	oldcmd =3D cmd;
> -
> -	pci_dev_for_each_resource(dev, res, i) {
> -		/* Only set up the requested stuff */
> -		if (!(mask & (1<<i)))
> -			continue;
> -
> -		if (res->flags & IORESOURCE_IO)
> -			cmd |=3D PCI_COMMAND_IO;
> -		if (res->flags & IORESOURCE_MEM)
> -			cmd |=3D PCI_COMMAND_MEMORY;
> -	}
> -
> -	if (cmd !=3D oldcmd) {
> -		pci_info(dev, "enabling device (%04x -> %04x)\n", oldcmd, cmd);
> -		pci_write_config_word(dev, PCI_COMMAND, cmd);
> -	}
> -	return 0;
> -}
> diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
> index ddac216a2aff..a9448088e762 100644
> --- a/arch/sparc/kernel/pci.c
> +++ b/arch/sparc/kernel/pci.c
> @@ -722,33 +722,6 @@ struct pci_bus *pci_scan_one_pbm(struct pci_pbm_info=
 *pbm,
>  	return bus;
>  }
> =20
> -int pcibios_enable_device(struct pci_dev *dev, int mask)
> -{
> -	struct resource *res;
> -	u16 cmd, oldcmd;
> -	int i;
> -
> -	pci_read_config_word(dev, PCI_COMMAND, &cmd);
> -	oldcmd =3D cmd;
> -
> -	pci_dev_for_each_resource(dev, res, i) {
> -		/* Only set up the requested stuff */
> -		if (!(mask & (1<<i)))
> -			continue;
> -
> -		if (res->flags & IORESOURCE_IO)
> -			cmd |=3D PCI_COMMAND_IO;
> -		if (res->flags & IORESOURCE_MEM)
> -			cmd |=3D PCI_COMMAND_MEMORY;
> -	}
> -
> -	if (cmd !=3D oldcmd) {
> -		pci_info(dev, "enabling device (%04x -> %04x)\n", oldcmd, cmd);
> -		pci_write_config_word(dev, PCI_COMMAND, cmd);
> -	}
> -	return 0;
> -}
> -
>  /* Platform support for /proc/bus/pci/X/Y mmap()s. */
>  int pci_iobar_pfn(struct pci_dev *pdev, int bar, struct vm_area_struct *=
vma)
>  {
> diff --git a/arch/sparc/kernel/pcic.c b/arch/sparc/kernel/pcic.c
> index 25fe0a061732..3d54ad5656a4 100644
> --- a/arch/sparc/kernel/pcic.c
> +++ b/arch/sparc/kernel/pcic.c
> @@ -641,33 +641,6 @@ void pcibios_fixup_bus(struct pci_bus *bus)
>  	}
>  }
> =20
> -int pcibios_enable_device(struct pci_dev *dev, int mask)
> -{
> -	struct resource *res;
> -	u16 cmd, oldcmd;
> -	int i;
> -
> -	pci_read_config_word(dev, PCI_COMMAND, &cmd);
> -	oldcmd =3D cmd;
> -
> -	pci_dev_for_each_resource(dev, res, i) {
> -		/* Only set up the requested stuff */
> -		if (!(mask & (1<<i)))
> -			continue;
> -
> -		if (res->flags & IORESOURCE_IO)
> -			cmd |=3D PCI_COMMAND_IO;
> -		if (res->flags & IORESOURCE_MEM)
> -			cmd |=3D PCI_COMMAND_MEMORY;
> -	}
> -
> -	if (cmd !=3D oldcmd) {
> -		pci_info(dev, "enabling device (%04x -> %04x)\n", oldcmd, cmd);
> -		pci_write_config_word(dev, PCI_COMMAND, cmd);
> -	}
> -	return 0;
> -}
> -
>  /* Makes compiler happy */
>  static volatile int pcic_timer_dummy;

This change actually broke driver initialization on SPARC, see:

https://github.com/sparclinux/issues/issues/22

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

