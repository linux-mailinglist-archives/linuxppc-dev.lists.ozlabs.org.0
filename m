Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D9285ED0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 00:34:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bnHNLGYi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgCKK0lcTz3d3M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 10:34:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bnHNLGYi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgCJX1rPZz301f
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 10:33:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 940C5CE20A7;
	Wed, 21 Feb 2024 23:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799B6C433F1;
	Wed, 21 Feb 2024 23:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708558407;
	bh=oek7yMxAZVYzST3tZKKbzp+4bnsbv669D9ZZTh7z9Nk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bnHNLGYihBqBfQLCEfd3GjCg/Qa1C8D3xFhquSzSeBzw/lhnDDcAG6VSzIerwfMTO
	 HA17D0lKg73tkJJm9ohoD1+vra3S0DuJsXZgtyCQ56WfkLh0CjXd1WJq5Bl5wCdUjV
	 PZDhHyK1UJ7kYjOssyZ4A79x9q7GF4xq2YFBNw6sQtSK/j4rGyCbZDpfCj2BAEh8tj
	 KzqpeY+7Y9Ds743TtbPPAmyd67oCEkGtyDv35jy6S3oSDEu1JPJc6ljd9dSug+ueWA
	 8yoY1wosHzOW9ZJ+oauZMW0fnuS41MnUHpQyLyUQSYw0fjH5BxodgNkSrspQwkagC8
	 yrWW3rj6m6UGQ==
Date: Wed, 21 Feb 2024 17:33:25 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH 1/1] PCI/portdrv: Allow DPC if the OS controls AER
 natively.
Message-ID: <20240221233325.GA1595083@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221231102.GA1547668@bhelgaas>
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, kbusch@kernel.org, bhelgaas@google.com, lukas@wunner.de, Oliver O'Halloran <oohall@gmail.com>, Matthew W Carlis <mattc@purestorage.com>, mika.westerberg@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+cc Mahesh, Oliver, linuxppc-dev, since I mentioned powerpc below.
Probably not of interest since this is about the ACPI EDR feature, but
just FYI]

On Wed, Feb 21, 2024 at 05:11:04PM -0600, Bjorn Helgaas wrote:
> On Tue, Jan 23, 2024 at 09:59:21AM -0600, Bjorn Helgaas wrote:
> > On Mon, Jan 22, 2024 at 06:37:48PM -0800, Kuppuswamy Sathyanarayanan wrote:
> > > On 1/22/24 11:32 AM, Bjorn Helgaas wrote:
> > > > On Mon, Jan 08, 2024 at 05:15:08PM -0700, Matthew W Carlis wrote:
> > > >> A small part is probably historical; we've been using DPC on PCIe
> > > >> switches since before there was any EDR support in the kernel. It
> > > >> looks like there was a PCIe DPC ECN as early as Feb 2012, but this
> > > >> EDR/DPC fw ECN didn't come in till Jan 2019 & kernel support for ECN
> > > >> was even later. Its not immediately clear I would want to use EDR in
> > > >> my newer architecures & then there are also the older architecures
> > > >> still requiring support. When I submitted this patch I came at it
> > > >> with the approach of trying to keep the old behavior & still support
> > > >> the newer EDR behavior. Bjorns patch from Dec 28 2023 would seem to
> > > >> change the behavior for both root ports & switch ports, requiring
> > > >> them to set _OSC Control Field bit 7 (DPC) and _OSC Support Field
> > > >> bit 7 (EDR) or a kernel command line value. I think no matter what,
> > > >> we want to ensure that PCIe Root Ports and PCIe switches arrive at
> > > >> the same policy here.
> > > > Is there an approved DPC ECN to the PCI Firmware spec that adds DPC
> > > > control negotiation, but does *not* add the EDR requirement?
> > > >
> > > > I'm looking at
> > > > https://members.pcisig.com/wg/PCI-SIG/document/previewpdf/12888, which
> > > > seems to be the final "Downstream Port Containment Related
> > > > Enhancements" ECN, which is dated 1/28/2019 and applies to the PCI
> > > > Firmware spec r3.2.
> > > >
> > > > It adds bit 7, "PCI Express Downstream Port Containment Configuration
> > > > control", to the passed-in _OSC Control field, which indicates that
> > > > the OS supports both "native OS control and firmware ownership models
> > > > (i.e. Error Disconnect Recover notification) of Downstream Port
> > > > Containment."
> > > >
> > > > It also adds the dependency that "If the OS sets bit 7 of the Control
> > > > field, it must set bit 7 of the Support field, indicating support for
> > > > the Error Disconnect Recover event."
> > > >
> > > > So I'm trying to figure out if the "support DPC but not EDR" situation
> > > > was ever a valid place to be.  Maybe it's a mistake to have separate
> > > > CONFIG_PCIE_DPC and CONFIG_PCIE_EDR options.
> > > 
> > > My understanding is also similar. I have raised the same point in
> > > https://lore.kernel.org/all/3c02a6d6-917e-486c-ad41-bdf176639ff2@linux.intel.com/
> > 
> > Ah, sorry, I missed that.
> > 
> > > IMO, we don't need a separate config for EDR. I don't think user can
> > > gain anything with disabling EDR and enabling DPC. As long as
> > > firmware does not user EDR support, just compiling the code should
> > > be harmless.
> > > 
> > > So we can either remove it, or select it by default if user selects
> > > DPC config.
> > > 
> > > > CONFIG_PCIE_EDR depends on CONFIG_ACPI, so the situation is a little
> > > > bit murky on non-ACPI systems that support DPC.
> > > 
> > > If we are going to remove the EDR config, it might need #ifdef
> > > CONFIG_ACPI changes in edr.c to not compile ACPI specific code.
> > > Alternative choice is to compile edr.c with CONFIG_ACPI.
> > 
> > Right.  I think we should probably remove CONFIG_PCIE_EDR completely
> > and make everything controlled by CONFIG_PCIE_DPC.
> 
> In the PCI Firmware spec, r3.3, sec 4.5.1, table 4-4, the description
> of "Error Disconnect Recover Supported" hints at the possibility for
> an OS to support EDR but not DPC:
> 
>   In the context of PCIe, support for Error Disconnect Recover implies
>   that the operating system will invalidate the software state
>   associated with child devices of the port without attempting to
>   access the child device hardware. *If* the operating system supports
>   Downstream Port Containment (DPC), ..., the operating system shall
>   attempt to recover the child devices if the port implements the
>   Downstream Port Containment Extended Capability.
> 
> On the other hand, sec 4.6.12 and the implementation note there with
> the EDR flow seem to assume the OS *does* support DPC and can clear
> error status and bring ports out of DPC even if the OS hasn't been
> granted control of DPC.
> 
> EDR is an ACPI feature, and I guess it might be theoretically possible
> to use EDR on an ACPI system with some non-DPC error containment
> feature like powerpc EEH.  But obviously powerpc doesn't use ACPI, and
> a hypothetical ACPI system with non-DPC error containment would have
> to add support for that containment in edr_handle_event().
> 
> So while I'm not 100% sure that making CONFIG_PCIE_DPC control both
> DPC and EDR is completely correct, I guess for now I still think using
> CONFIG_PCIE_DPC for both DPC and EDR seems like a reasonable plan
> because we have no support for EDR *without* DPC.
> 
> Bjorn
