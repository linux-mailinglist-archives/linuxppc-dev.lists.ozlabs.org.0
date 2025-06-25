Return-Path: <linuxppc-dev+bounces-9730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6361AE7A9F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 10:45:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRwQ43Gpqz2yKq;
	Wed, 25 Jun 2025 18:45:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:150:2161:1:b009:f23e:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750841148;
	cv=none; b=Zf1m7q4RH6DRPrUAo/4RF3TZYxdyq00jp5VgirmyDxxHuV4RNIpDtuACljooPBCi/DixhIj/qxMqkYD31oPvm5vyvyp5eRppPUHfOVf7slwZN5Epyb7VJR5E06RkVUD1ucoLNY7lxkgIA7mRLPkcsCN2KtfoH0/dgXiZMNv1Yr1Q/ychUbhIkre5JsYmntgYiHeyuLUHmqVZvQeoR+pJ7wdYrtc60B51sV7uLIwKuZrEnOf9DiNAlAiTnXQ3HDpRIgNRDWb4+U2GsfG5o062pKlCy5ZR4dRUDX2dEcKPseDmn2zDEW5GvoiZMiZ8KveLFakTtFe94M8c8n2Kz7zCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750841148; c=relaxed/relaxed;
	bh=jyO84yQEOuJcc04iWXYMXwCskkIWUNcQkgOlHPr1fXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLWdYTnzHLO33JDj0/KIL7fPZkT/64QO0CSG6elbvukJEMRyar9SwXoYvppkvm3cPUwh5Syt4Pya1xpovU3Sygyw+CC9gRBhzBxHMPULT+NY6+wUrJkH537yHfGJe2/6N2HZdConrdxiaVl5g6REHEWO4OV872NNxMJqaEiDxyIitWCvohgouuZsFK6AXUa6ihGbsYM3UblC7y4/iYHC4jDnL82vk+I2ZkLi8iAZJXOPmSWQcvbCOv32eGgXr5bLWHfuAWy5raYSkWMRjtTa5u5D782mtA6X0uiNjSh13WvZSz9yyfAV/PdQm0f9vZXlwjE590sSf/wuOlQSGMX09w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:4f8:150:2161:1:b009:f23e:0; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=2a01:4f8:150:2161:1:b009:f23e:0; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRwQ34kGZz2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 18:45:47 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 904BB2C05264;
	Wed, 25 Jun 2025 10:45:38 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 477423B709D; Wed, 25 Jun 2025 10:45:38 +0200 (CEST)
Date: Wed, 25 Jun 2025 10:45:38 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	christophe leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH v2 2/6] pci/hotplug/pnv_php: Work around switches with
 broken
Message-ID: <aFu3Mg9SqlaDTw9z@wunner.de>
References: <20250618201722.GA1220739@bhelgaas>
 <1155677312.1313623.1750361373491.JavaMail.zimbra@raptorengineeringinc.com>
 <aFUTV87SMdpHRbt8@wunner.de>
 <318974284.1316210.1750437945118.JavaMail.zimbra@raptorengineeringinc.com>
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
In-Reply-To: <318974284.1316210.1750437945118.JavaMail.zimbra@raptorengineeringinc.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 20, 2025 at 11:45:45AM -0500, Timothy Pearson wrote:
> From: "Lukas Wunner" <lukas@wunner.de>
> > I don't know how much PCIe hotplug on PowerNV differs from native,
> > spec-compliant PCIe hotplug.  If the differences are vast (and I
> > get the feeling they might be if I read terms like "PHB" and
> > "EEH unfreeze", which sound completely foreign to me), it might
> > be easier to refactor pnv_php.c and copy patterns or code from
> > pciehp, than to integrate the functionality from pnv_php.c into
> > pciehp.
> 
> The differences at the root level (PHB) are quite significant -- the
> controller is more advanced in many ways than standard PCIe root
> complexes [1] -- and those differences need very special handling.
> Once we are looking at devices downstream of the root complex,
> standard PCIe hotplug and AER specifications apply, so we're in a
> strange spot of really wanting to use pciehp (to handle all nested
> downstream bridges), but pciehp still needs to understand how to deal
> with our unqiue root complex.
> 
> One idea I had was to use the existing modularity of pciehp's source
> and add a new pciehp_powernv.c file with all of our root complex
> handling methods.  We could then #ifdef swap the assocated root complex
> calls to that external file when compiled in PowerNV mode.

We've traditionally dealt with such issues by inserting pcibios_*()
hooks in generic code, with a __weak implementation (which is usually
an empty stub) and a custom implementation in arch/powerpc/.

The linker then chooses the custom implementation over the __weak one.

You can find the existing hooks with:

git grep "__weak .*pcibios" -- drivers/pci
git grep pcibios -- arch/powerpc

An alternative method is to add a callback to struct pci_host_bridge.

> > One thing I don't quite understand is, it sounds like you've
> > attached a PCIe switch to a Root Port and the hotplug ports
> > are on the PCIe switch.  Aren't those hotplug ports just
> > bog-standard ones that can be driven by pciehp?  My expectation
> > would have been that a PowerNV-specific hotplug driver would
> > only be necessary for hotplug-capable Root Ports.
> 
> That's the problem -- the pciehp driver assumes x86 root ports,

Nah, there's nothing x86-specific about it.  pciehp is used on all
kinds of arches, it's just an implementation of the PCIe Base Spec.

> and the powernv driver ends up duplicating (badly) parts of the pciehp
> functionality for downstream bridges.  That's one reason I'd like to
> abstract the root port handling in pciehp and eventually move the
> PowerNV root port handling into that module.

Sounds like you're currently describing the Switch Downstream Ports with
an "ibm,ioda-phb2" compatible string in the devicetree?  That would feel
wrong since they're not host bridges.

> [1] Among other interesting differences, it is both capable of and has
> been tested to properly block and report all invalid accesses from a
> PCIe device to system memory.  This breaks assumptions in many PCIe
> device drivers, but is also a significant security advantage.
> EEH freeze is effectively this security mechanism kicking in -- on
> detecting an invalid access, the PHB itself will block the access and
> put the PE into a frozen state where no PCIe traffic is permitted.

That sounds somewhat similar to what the PCIe Access Control Services
Capability provides.  I think at least some IOMMUs support raising an
exception on illegal accesses, so the EEH functionality is probably not
*that* special.

Thanks,

Lukas

