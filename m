Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8BF220123
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 01:48:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5xzT5Bl4zDqQ8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 09:48:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=tn9o8ZCA; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5xxL407RzDqXr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 09:46:30 +1000 (AEST)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C9EDB2072D;
 Tue, 14 Jul 2020 23:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594770387;
 bh=wtP+4xn/3ROLDCnCdtwJkSJDqfGM891qyb+Mz6SauTA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=tn9o8ZCAfNgSgH72ERt+aeYP66qUfTmtYfjFNCX6FT6RJlFHDMdI484mpLYGPMCFl
 etBSoQw7rxsL5ADmrv2o51K6DLsBhiaYNnyUGCWmq7po93mP7jxggAw+kakTUlUNGF
 tnnwxltmd0lrhppiSvmpFMGntz46bsze02Yo4vrA=
Date: Tue, 14 Jul 2020 18:46:25 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Message-ID: <20200714234625.GA428442@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3EZX8=649R9cYF6_=ivh1Xyrgsc5mUtS=d5yvQ3doZaQ@mail.gmail.com>
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
 Kjetil Oftedal <oftedal@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>,
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

[+cc Kjetil]

On Wed, Jul 15, 2020 at 12:01:56AM +0200, Arnd Bergmann wrote:
> On Tue, Jul 14, 2020 at 8:45 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Mon, Jul 13, 2020 at 05:08:10PM +0200, Arnd Bergmann wrote:
> > > On Mon, Jul 13, 2020 at 3:22 PM Saheed O. Bolarinwa
> > > Starting with a), my first question is whether any high-level
> > > drivers even need to care about errors from these functions. I see
> > > 4913 callers that ignore the return code, and 576 that actually
> > > check it, and almost none care about the specific error (as you
> > > found as well). Unless we conclude that most PCI drivers are wrong,
> > > could we just change the return type to 'void' and assume they never
> > > fail for valid arguments on a valid pci_device* ?
> >
> > I really like this idea.
> >
> > pci_write_config_*() has one return value, and only 100ish of 2500
> > callers check for errors.  It's sometimes possible for config
> > accessors to detect PCI errors and return failure, e.g., device was
> > removed or didn't respond, but most of them don't, and detecting these
> > errors is not really that valuable.
> >
> > pci_read_config_*() is much more interesting because it returns two
> > things, the function return value and the value read from the PCI
> > device, and it's complicated to check both.
> >
> > Again it's sometimes possible for config read accessors to detect PCI
> > errors, but in most cases a PCI error means the accessor returns
> > success and the value from PCI is ~0.
> >
> > Checking the function return value catches programming errors (bad
> > alignment, etc) but misses most of the interesting errors (device was
> > unplugged or reported a PCI error).
> 
> My thinking was more that most of the time the error checking may
> be completely bogus to start with, and I would just not check for
> errors at all.

Yes.  I have no problem with that.  There are a few cases where it's
important to check for errors, e.g., we read a status register and do
something based on a bit being set.  A failure will return all bits
set, and we may do the wrong thing.  But most of the errors we care
about will be on MMIO reads, not config reads, so we can probably
ignore most config read errors.

> > Checking the value returned from PCI is tricky because ~0 is a valid
> > value for some config registers, and only the driver knows for sure.
> > If the driver knows that ~0 is a possible value, it would have to do
> > something else, e.g., another config read of a register that *cannot*
> > be ~0, to see whether it's really an error.
> >
> > I suspect that if we had a single value to look at it would be easier
> > to get right.  Error checking with current interface would look like
> > this:
> >
> >   err = pci_read_config_word(dev, addr, &val);
> >   if (err)
> >     return -EINVAL;
> >
> >   if (PCI_POSSIBLE_ERROR(val)) {
> >     /* if driver knows ~0 is invalid */
> >     return -EINVAL;
> >
> >     /* if ~0 is potentially a valid value */
> >     err = pci_read_config_word(dev, PCI_VENDOR_ID, &val2);
> >     if (err)
> >       return -EINVAL;
> >
> >     if (PCI_POSSIBLE_ERROR(val2))
> >       return -EINVAL;
> >   }
> >
> > Error checking with a possible interface that returned only a single
> > value could look like this:
> >
> >   val = pci_config_read_word(dev, addr);
> >   if (PCI_POSSIBLE_ERROR(val)) {
> >     /* if driver knows ~0 is invalid */
> >     return -EINVAL;
> >
> >     /* if ~0 is potentially a valid value */
> >     val2 = pci_config_read_word(dev, PCI_VENDOR_ID);
> >     if (PCI_POSSIBLE_ERROR(val2))
> >       return -EINVAL;
> >   }
> >
> > Am I understanding you correctly?
> 
> That would require changing all callers of the function, which
> I think would involve changing some 700 files. 

Yeah, that would be a disaster.  So something like:

  void pci_read_config_word(struct pci_dev *dev, int where, u16 *val)

and where we used to return anything non-zero, we just set *val = ~0
instead?  I think we do that already in most, maybe all, cases.

> What I was suggesting was to only change the return type to void and
> categorize all drivers that today check it as either
> 
> a) checking the return code is not helpful, or possibly even
>     wrong, so we just stop doing it. I expect those to be the
>     vast majority of callers, but that could be wrong.
> 
> b) Code that legitimately check the error code and need to
>    take an appropriate action. These could be changed to
>    calling a different interface such as 'pci_bus_read_config_word'
>    or a new 'pci_device_last_error()' function.

Yep, makes sense.

> The reasons I suspect that most callers don't actually need
> to check for errors are:
> 
> - Most error checking is static: PCIBIOS_BAD_REGISTER_NUMBER
>   only happens if you pass an invalid register number, but most
>   callers pass a compile-time constant register number that is
>   known to be correct, or the driver would never work. Similarly,
>   PCIBIOS_DEVICE_NOT_FOUND wouldn't normally happen
>   since you pass a valid pci_device pointer that was already
>   probed.

Yep, except for things like device removal or other PCI errors.

> - config space accesses are very rare compared to memory
>   space access and on the hardware side the error handling
>   would be similar, but readl/writel don't return errors, they just
>   access wrong registers or return 0xffffffff.
>   arch/powerpc/kernel/eeh.c has a ton extra code written to
>   deal with it, but no other architectures do.
> 
> - If we add code to detect errors in pci_read_config_*
>   and do some of the stuff from powerpc's
>   eeh_dev_check_failure(), we are more likely to catch
>   intermittent failures when drivers don't check, or bugs
>   with invalid arguments in device drivers than relying on
>   drivers to get their error handling right when those code
>   paths don't ever get covered in normal testing.

Yeah, this makes sense and sounds like a potential follow-on project.

> Looking at a couple of random drivers that do check the
> return codes, I find:
> 
> drivers/edac/amd8131_edac.c: prints the register number,
> then keeps going. This is not useful
> 
> drivers/net/ethernet/mellanox/mlx4/reset.c: error handling
> in mlx4_reset() seems reasonable, but it gets called
> from mlx4_pci_resume(), which has a 'void' return code and
> cannot propagate the error further. My guess is that it
> would try to keep going after a failed resume and run into
> random other problems then.
> 
> drivers/ata/pata_cs5536.c: error code gets passed to
> caller and then always ignored. Can clearly be changed
> 
> drivers/net/wireless/intersil/prism54/islpci_hotplug.c:
> Out of two calls, only one is checked, which seems bogus
> 
> drivers/usb/host/pci-quirks.c: only one of many instances
> has a check, again this seems bogus.
> 
> drivers/leds/leds-ss4200.c: called from probe(), which
> seems to correctly deal with errors by failing the probe.
> Not sure this can ever fail though, since the driver only does
> it after pci_enable_device() succeeds first. Note that
> pci_enable_device() ignores pci_read_config_byte()
> errors but sanity-checks the register contents/

So maybe a good place to start is by removing some of the useless
error checking for pci_read_config_*() and pci_write_config_*().
That's a decent-sized but not impractical project that could be done
per subsystem or something:

  git grep -E "(if|return|=).*\<pci_(read|write)_config" drivers

finds about 400 matches.

Some of those callers probably really *do* want to check for errors,
and I guess we'd have to identify them and do them separately as you
mentioned.

Bjorn
