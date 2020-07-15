Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70336221796
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 00:14:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6Wr94DfqzDqLc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 08:14:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=S/WhYifu; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6WpW1hKhzDqGt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 08:12:35 +1000 (AEST)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3066F2065F;
 Wed, 15 Jul 2020 22:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594851152;
 bh=yiFReVioS6K+TBmJa6LKAY/XmzClp9+1AGEcxSQDlBk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=S/WhYifuBwhLApPX94Rc/0RHdh1EsD3Lsktt1aoGethpDycX9QnYAuXsckOndJhw5
 n3QaIQohtvY8AFWnVXQuc092VZjXlIZnqtKtIWZvilP5gx9OzeqCMahn+95Usq7PJx
 YtSiGFgryUo4JNKSiAdj114J+tlIwEPKap8PPewk=
Date: Wed, 15 Jul 2020 17:12:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Message-ID: <20200715221230.GA563957@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e2ae69a55f542faa18988a49e9b9491@AcuMS.aculab.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-pci <linux-pci@vger.kernel.org>, "bjorn@helgaas.com" <bjorn@helgaas.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux <sparclinux@vger.kernel.org>,
 Toan Le <toan@os.amperecomputing.com>, Christoph Hellwig <hch@lst.de>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Kevin Hilman <khilman@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Jens Axboe <axboe@fb.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Shuah Khan <skhan@linuxfoundation.org>, Keith Busch <kbusch@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 'Oliver O'Halloran' <oohall@gmail.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Bjorn Helgaas <bhelgaas@google.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 15, 2020 at 02:38:29PM +0000, David Laight wrote:
> From: Oliver O'Halloran
> > Sent: 15 July 2020 05:19
> > 
> > On Wed, Jul 15, 2020 at 8:03 AM Arnd Bergmann <arnd@arndb.de> wrote:
> ...
> > > - config space accesses are very rare compared to memory
> > >   space access and on the hardware side the error handling
> > >   would be similar, but readl/writel don't return errors, they just
> > >   access wrong registers or return 0xffffffff.
> > >   arch/powerpc/kernel/eeh.c has a ton extra code written to
> > >   deal with it, but no other architectures do.
> > 
> > TBH the EEH MMIO hooks were probably a mistake to begin with. Errors
> > detected via MMIO are almost always asynchronous to the error itself
> > so you usually just wind up with a misleading stack trace rather than
> > any kind of useful synchronous error reporting. It seems like most
> > drivers don't bother checking for 0xFFs either and rely on the
> > asynchronous reporting via .error_detected() instead, so I have to
> > wonder what the point is. I've been thinking of removing the MMIO
> > hooks and using a background poller to check for errors on each PHB
> > periodically (assuming we don't have an EEH interrupt) instead. That
> > would remove the requirement for eeh_dev_check_failure() to be
> > interrupt safe too, so it might even let us fix all the godawful races
> > in EEH.
> 
> I've 'played' with PCIe error handling - without much success.
> What might be useful is for a driver that has just read ~0u to
> be able to ask 'has there been an error signalled for this device?'.

In many cases a driver will know that ~0 is not a valid value for the
register it's reading.  But if ~0 *could* be valid, an interface like
you suggest could be useful.  I don't think we have anything like that
today, but maybe we could.  It would certainly be nice if the PCI core
noticed, logged, and cleared errors.  We have some of that for AER,
but that's an optional feature, and support for the error bits in the
garden-variety PCI_STATUS register is pretty haphazard.  As you note
below, this sort of SERR/PERR reporting is frequently hard-wired in
ways that takes it out of our purview.

Bjorn
