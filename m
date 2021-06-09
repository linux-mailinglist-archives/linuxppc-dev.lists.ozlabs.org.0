Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED703A1D33
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 20:50:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0blk3t3Cz3btH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 04:50:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KkKklqSE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KkKklqSE; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0blG0gg4z2yyQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 04:50:17 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80F1C61263;
 Wed,  9 Jun 2021 18:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623264613;
 bh=C+fQwxf4qGLB0wIX+D9ckXOCcaluaN1AhBUgphBnnq8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=KkKklqSEHfckLE6i/wuhhzzkZbHhyLILhl5HwBnlU9KGKYLNXpSyY3wixx46rXjha
 aGMNvivLt3B2SRRmDmzwpJz5u0rQqIGazdIAvck9wBHAkFKzFiXms133kp5cPJReXV
 /4RlGiSwLnOX3UGsNvSbapTUBAkxGp6MYZgrvN6m1fOEf69t6IOVlyyfTP0JAXuQHV
 8v14c+Ro7FEblZNOxWzt9TxeMHNtju9aya6fmxJnR1CvpltFifJFer7osFHhzDhbv0
 HDgv3l44ZNtnkmLvBtJng5E4sV6nspOk++gcuJWZ1Z2OJBmZ32haoydDaVMJ2xdJsE
 JzBN+gUeiVBgQ==
Date: Wed, 9 Jun 2021 13:50:12 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/1] of/pci: Add IORESOURCE_MEM_64 to resource flags for
 64-bit memory addresses
Message-ID: <20210609185012.GA2647526@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+WwAeziGN4EfPAWfA0fieAjfcxfi29=StOx0GeKjAe_g@mail.gmail.com>
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
Cc: Leonardo Bras <leobras.c@gmail.com>, devicetree@vger.kernel.org,
 Alexey Kardashevskiy <aik@ozlabs.ru>, PCI <linux-pci@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 15, 2021 at 01:59:52PM -0500, Rob Herring wrote:
> On Thu, Apr 15, 2021 at 1:01 PM Leonardo Bras <leobras.c@gmail.com> wrote:
> >
> > Many other resource flag parsers already add this flag when the input
> > has bits 24 & 25 set, so update this one to do the same.

[Adding this to the thread for archaeological purposes since it didn't
make it to the commit log]

The other resource flag parsers appear to be:

  pci_parse_of_flags(u32 addr0, ...)    # powerpc/kernel/pci_of_scan.c
    unsigned int as = addr0 & OF_PCI_ADDR0_SPACE_MASK;
    if (as == OF_PCI_ADDR0_SPACE_MMIO32 || as == OF_PCI_ADDR0_SPACE_MMIO64)
      flags = IORESOURCE_MEM | PCI_BASE_ADDRESS_SPACE_MEMORY;
      if (as == OF_PCI_ADDR0_SPACE_MMIO64)
        flags |= PCI_BASE_ADDRESS_MEM_TYPE_64 | IORESOURCE_MEM_64;

  pci_parse_of_flags(u32 addr0)         # sparc/kernel/pci.c
    if (addr0 & 0x02000000) {
      flags = IORESOURCE_MEM | PCI_BASE_ADDRESS_SPACE_MEMORY;
      if (addr0 & 0x01000000)
        flags |= IORESOURCE_MEM_64 | PCI_BASE_ADDRESS_MEM_TYPE_64;

  of_bus_pci_get_flags(... addr)        # drivers/of/address.c (this one)
    u32 w = be32_to_cpup(addr);
    switch((w >> 24) & 0x03) {
    case 0x02: /* 32 bits */
      flags |= IORESOURCE_MEM;
      break;
    case 0x03: /* 64 bits */
      flags |= IORESOURCE_MEM | IORESOURCE_MEM_64;
      break;

It's super annoying to have three copies of essentially the same
thing.  Even more annoying that they test the same things in three
completely different ways.  But I remember looking at this several
years ago, and it wasn't as simple to unify these as I had hoped.

> Many others? Looks like sparc and powerpc to me. Those would be the
> ones I worry about breaking. Sparc doesn't use of/address.c so it's
> fine. Powerpc version of the flags code was only fixed in 2019, so I
> don't think powerpc will care either.

I'm guessing you're referring to df5be5be8735 ("powerpc/pci/of: Fix OF
flags parsing for 64bit BARs").

> I noticed both sparc and powerpc set PCI_BASE_ADDRESS_MEM_TYPE_64 in
> the flags. AFAICT, that's not set anywhere outside of arch code. So
> never for riscv, arm and arm64 at least. That leads me to
> pci_std_update_resource() which is where the PCI code sets BARs and
> just copies the flags in PCI_BASE_ADDRESS_MEM_MASK ignoring
> IORESOURCE_* flags. So it seems like 64-bit is still not handled and
> neither is prefetch.
> 
> > Some devices (like virtio-net) have more than one memory resource
> > (like MMIO32 and MMIO64) and without this flag it would be needed to
> > verify the address range to know which one is which.
> >
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  drivers/of/address.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index 73ddf2540f3f..dc7147843783 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -116,9 +116,12 @@ static unsigned int of_bus_pci_get_flags(const __be32 *addr)
> >                 flags |= IORESOURCE_IO;
> >                 break;
> >         case 0x02: /* 32 bits */
> > -       case 0x03: /* 64 bits */
> >                 flags |= IORESOURCE_MEM;
> >                 break;
> > +
> > +       case 0x03: /* 64 bits */
> > +               flags |= IORESOURCE_MEM | IORESOURCE_MEM_64;
> > +               break;
> >         }
> >         if (w & 0x40000000)
> >                 flags |= IORESOURCE_PREFETCH;
> > --
> > 2.30.2
> >
