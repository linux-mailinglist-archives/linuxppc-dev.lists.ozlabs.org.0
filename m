Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5815D21FA02
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 20:48:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5qKj43dwzDqcV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 04:48:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=M9TjDOCd; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5qGW0MTDzDqYX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 04:45:54 +1000 (AEST)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 839FA222B9;
 Tue, 14 Jul 2020 18:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594752352;
 bh=3OfvyawWxOWWLmXQVPZtn6FECuVWd3F0Ue8HezI5sRQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=M9TjDOCdh9hdhfOxp+E/b+GQRQRJigrTzFdSr08bZTbYfgplA8ZfIK7sw2uU4D17i
 JnwGLNAMtpemAssFF0Jl2PbTYsF6P1lbaXH8vsBMr+WVIisiILxg/v2D+n7zNSVt6u
 tBiC82XAr1HVg4w3jwKWvTKOh5aFHvV/m2Ll8Hf4=
Date: Tue, 14 Jul 2020 13:45:50 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Message-ID: <20200714184550.GA397277@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
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
Cc: Keith Busch <kbusch@kernel.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux <sparclinux@vger.kernel.org>, Toan Le <toan@os.amperecomputing.com>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Christoph Hellwig <hch@lst.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-pci <linux-pci@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Matt Turner <mattst88@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>,
 Jens Axboe <axboe@fb.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Shuah Khan <skhan@linuxfoundation.org>, bjorn@helgaas.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[trimmed the cc list; it's still too large but maybe arch folks care]

On Mon, Jul 13, 2020 at 05:08:10PM +0200, Arnd Bergmann wrote:
> On Mon, Jul 13, 2020 at 3:22 PM Saheed O. Bolarinwa
> <refactormyself@gmail.com> wrote:
> > This goal of these series is to move the definition of *all*
> > PCIBIOS* from include/linux/pci.h to arch/x86 and limit their use
> > within there.  All other tree specific definition will be left for
> > intact. Maybe they can be renamed.
> >
> > PCIBIOS* is an x86 concept as defined by the PCI spec. The
> > returned error codes of PCIBIOS* are positive values and this
> > introduces some complexities which other archs need not incur.
> 
> I think the intention is good, but I find the series in its current
> form very hard to review, in particular the way you touch some
> functions three times with trivial changes. Instead of
> 
> 1) replace PCIBIOS_SUCCESSFUL with 0
> 2) drop pointless 0-comparison
> 3) reformat whitespace
> 
> I would suggest to combine the first two steps into one patch per
> subsystem and drop the third step.

I agree.  BUT please don't just run out and post new patches to do
this.  Let's talk about Arnd's further ideas below first.

> ...
> Maybe the work can be split up differently, with a similar end
> result but fewer and easier reviewed patches. The way I'd look at
> the problem, there are three main areas that can be dealt with one
> at a time:
> 
> a) callers of the high-level config space accessors
>    pci_{write,read}_config_{byte,word,dword}, mostly in device
>    drivers.
> b) low-level implementation of the config space accessors
>     through struct pci_ops
> c) all other occurrences of these constants
> 
> Starting with a), my first question is whether any high-level
> drivers even need to care about errors from these functions. I see
> 4913 callers that ignore the return code, and 576 that actually
> check it, and almost none care about the specific error (as you
> found as well). Unless we conclude that most PCI drivers are wrong,
> could we just change the return type to 'void' and assume they never
> fail for valid arguments on a valid pci_device* ?

I really like this idea.

pci_write_config_*() has one return value, and only 100ish of 2500
callers check for errors.  It's sometimes possible for config
accessors to detect PCI errors and return failure, e.g., device was
removed or didn't respond, but most of them don't, and detecting these
errors is not really that valuable.

pci_read_config_*() is much more interesting because it returns two
things, the function return value and the value read from the PCI
device, and it's complicated to check both. 

Again it's sometimes possible for config read accessors to detect PCI
errors, but in most cases a PCI error means the accessor returns
success and the value from PCI is ~0.

Checking the function return value catches programming errors (bad
alignment, etc) but misses most of the interesting errors (device was
unplugged or reported a PCI error).

Checking the value returned from PCI is tricky because ~0 is a valid
value for some config registers, and only the driver knows for sure.
If the driver knows that ~0 is a possible value, it would have to do
something else, e.g., another config read of a register that *cannot*
be ~0, to see whether it's really an error.

I suspect that if we had a single value to look at it would be easier
to get right.  Error checking with current interface would look like
this:

  err = pci_read_config_word(dev, addr, &val);
  if (err)
    return -EINVAL;

  if (PCI_POSSIBLE_ERROR(val)) {
    /* if driver knows ~0 is invalid */
    return -EINVAL;

    /* if ~0 is potentially a valid value */
    err = pci_read_config_word(dev, PCI_VENDOR_ID, &val2);
    if (err)
      return -EINVAL;

    if (PCI_POSSIBLE_ERROR(val2))
      return -EINVAL;
  }

Error checking with a possible interface that returned only a single
value could look like this:

  val = pci_config_read_word(dev, addr);
  if (PCI_POSSIBLE_ERROR(val)) {
    /* if driver knows ~0 is invalid */
    return -EINVAL;

    /* if ~0 is potentially a valid value */
    val2 = pci_config_read_word(dev, PCI_VENDOR_ID);
    if (PCI_POSSIBLE_ERROR(val2))
      return -EINVAL;
  }

Am I understanding you correctly?

> For b), it might be nice to also change other aspects of the
> interface, e.g. passing a pci_host_bridge pointer plus bus number
> instead of a pci_bus pointer, or having the callback in the
> pci_host_bridge structure.

I like this idea a lot, too.  I think the fact that
pci_bus_read_config_word() requires a pci_bus * complicates things in
a few places.

I think it's completely separate, as you say, and we should defer it
for now because even part a) is a lot of work.  I added it to my list
of possible future projects.

Bjorn
