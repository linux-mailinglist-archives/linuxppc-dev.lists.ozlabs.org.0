Return-Path: <linuxppc-dev+bounces-9728-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4065AAE7988
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 10:08:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRvZh363jz2yKq;
	Wed, 25 Jun 2025 18:08:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:1000::53df:5f64:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750838892;
	cv=none; b=TdMk0MIGp4Zidij708Z3dFqLnNVGXuwktJQezaWgXEpetn7RQfiAn+rB53gjgm/WU03O0TuQRnk++3BKQZA5p/pdJynxspuL0kEIRQ8V24D6uPKfNeDY3i2LM9jT8NJQKliqzlSAspX+fn9PO9voBUunTpIdC4um+wZscg7c7QVFXKyO9cYs4WB8R+AjqWMu3v0LmSaABUtLAiifT90ZiZGYykWLzeA4lcH3daEoulNNezavnJLlJ+FQPRTs0JxCJV+EMdE2wxcLjdXAWJYBLpBHHDzMf69aNgLAJGbm/5/OBA2bq1OUEKgL/fKb8d4aR+Y32IRzk212F1Is/0uHPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750838892; c=relaxed/relaxed;
	bh=vTZANFRYgO0h3OunI8tZBajHQMuEw20TiUsI3M2Xnm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOcu45bMge6dwTTFjWuawNui9O7P1GrNuZJSubdHDgzgqFwWXUjngU05kr1IYVwzjMHsXMeEHUk/Au9Ah6bF6+r9pQPOAW0YgTDatNk569XB/mrv2JRtSpgAkV02coe5TvSDpVFp5U1YxtEbCQDmksemmv7Hf0+OHHVgtZrsNkug+2kZc204XXRIM2jOwB0+HZeDrm1tzTHuwDf9HRVZzY+4IPojfsC4DztzObc8blrPeyn5uTo9DhFfrTwAHPBwzhz77teYBr/OcuoRypQX4dh+3l/jwoOeq3aXkuqEHhwsdrXPj43JtgL6gWUaWpQ+9zbGEcn7XRTQiDq0G0CrIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRvZf6hJHz2xbX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 18:08:08 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id E93BD2C06E33;
	Wed, 25 Jun 2025 10:08:02 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id E3CED3B708B; Wed, 25 Jun 2025 10:08:02 +0200 (CEST)
Date: Wed, 25 Jun 2025 10:08:02 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Krishna Kumar <krishnak@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"\"linux-pci\"," <linux-pci@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	christophe leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	"\"Bjorn Helgaas\"," <bhelgaas@google.com>
Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention
 indicator
Message-ID: <aFuuYq0m0hDAdPRF@wunner.de>
References: <20250618190146.GA1213349@bhelgaas>
 <1469323476.1312174.1750293474949.JavaMail.zimbra@raptorengineeringinc.com>
 <19689b53-ac23-4b48-97c7-b26f360a7b75@linux.ibm.com>
 <aFaCfYre9N52ARWH@wunner.de>
 <f13a2d2b-af52-4934-b4fa-66bc1e5ece32@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f13a2d2b-af52-4934-b4fa-66bc1e5ece32@linux.ibm.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 25, 2025 at 09:38:19AM +0530, Krishna Kumar wrote:
> On 6/21/25 3:29 PM, Lukas Wunner wrote:
> > On Fri, Jun 20, 2025 at 02:56:51PM +0530, Krishna Kumar wrote:
> > > 5. If point 3 and 4 does not solve the problem, then only we should
> > > move to pciehp.c. But AFAIK, PPC/Powernv is DT based while pciehp.c
> > > may be only supporting acpi (I have to check it on this). We need to
> > > provide PHB related information via DTB and maintain the related
> > > topology information via dtb and then it can be doable.
> > 
> > pciehp is not ACPI-specific.  The PCIe port service driver in
> > drivers/pci/pcie/portdrv.c binds to any PCIe port, examines the
> > port's capabilities (e.g. hotplug, AER, DPC, ...) and instantiates
> > sub-devices to which pciehp and the other drivers such as aer bind.
> 
> 1. If we get PHB info from mmcfg via acpi table in x86 and create a
>    root port from there with some address/entity and if this Acpi and
>    associated entity is not present for PPC, then it can be a problem.
> 
> 2. PPC is normally based on DTB entity and it identifies PHB and pcie
>    devices from there. If this all the information is correctly map
>    via portdrv.c then there is no problem and whatever you are telling
>    is correct and it will work.
> 
> 3. But if point 2 is not handled correctly we need to just aligned with
>    port related data structure to make it work.

PCI devices do not have to be enumerated in the devicetree (or in ACPI
DSDT) because PCI is an enumerable bus (like USB).  Only the host bridge
has to be enumerated in the devicetree or DSDT.  The kernel can find the
PCI devices below the host bridge itself.  Hot-plugged devices are
usually not described in the devicetree or DSDT because one doesn't
know their properties in advance.

pnv_php.c seems to search the devicetree for hotplug slots and
instantiates them.  My expectation would be that any hotplug-capable
PCIe Root Port or Downstream Port, which is *not* described in the
devicetree such that pnv_php.c creates a slot for it, is handled by
pciehp.

Timothy was talking about a Microsemi PCIe switch below the Root Port.
My understanding is that the Downstream Ports of that switch are
hotplug-capable.  So unless you've disabled CONFIG_HOTPLUG_PCI_PCIE,
I'd expect those ports to be handled by pciehp.  Assuming they're not
described as a "ibm,ioda2-phb" compatible device in the devicetree,
but why would they?

Thanks,

Lukas

