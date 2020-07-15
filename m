Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 943F0221773
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 00:03:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6Wbc2RdTzDqhb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 08:03:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=AcJGbRPs; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6WYw5n2mzDqkj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 08:01:40 +1000 (AEST)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6936020657;
 Wed, 15 Jul 2020 22:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594850497;
 bh=Dz/aXCXx6hEm65ykjKGAALSDHDgV9W4n51TE8HVaNyg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=AcJGbRPssyYC0nJ+ZVPaX639DVjl/UswzmNpCfYtIJ/9lFmLiqEsM8Oe+PVOaMtjA
 8PYZFuxwlwNeaxYlaY0rRvuyKueHVRBBr22r3PeGhVh/B0wzpcKP+NZFvlFVPKec7F
 rA+SlkNjfyr5hBkmPyt0Czd/Rsugt1iAY+IfWurU=
Date: Wed, 15 Jul 2020 17:01:35 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Message-ID: <20200715220135.GA563272@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c994d9a804b4a2c8555c50b63e20772@AcuMS.aculab.com>
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
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, 'Arnd Bergmann' <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, Jens Axboe <axboe@fb.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Shuah Khan <skhan@linuxfoundation.org>,
 "bjorn@helgaas.com" <bjorn@helgaas.com>,
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

On Wed, Jul 15, 2020 at 02:24:21PM +0000, David Laight wrote:
> From: Arnd Bergmann
> > Sent: 15 July 2020 07:47
> > On Wed, Jul 15, 2020 at 1:46 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > 
> >  So something like:
> > >
> > >   void pci_read_config_word(struct pci_dev *dev, int where, u16 *val)
> > >
> > > and where we used to return anything non-zero, we just set *val = ~0
> > > instead?  I think we do that already in most, maybe all, cases.
> > 
> > Right, this is what I had in mind. If we start by removing the handling
> > of the return code in all files that clearly don't need it, looking at
> > whatever remains will give a much better idea of what a good interface
> > should be.
> 
> It would be best to get rid of that nasty 'u16 *' parameter.

Do you mean nasty because it's basically a return value, but not
returned as the *function's* return value?  I agree that if we were
starting from scratch it would nicer to have:

  u16 pci_read_config_word(struct pci_dev *dev, int where)

but I don't think it's worth changing the thousands of callers just
for that.

> Make the return int and return the read value or -1 on error.
> (Or maybe 0xffff0000 on error??)
> 
> For a 32bit read (there must be one for the BARs) returning
> a 64bit signed integer would work even for 32bit systems.
> 
> If code cares about the error, and it can be detected then
> it can check. Otherwise the it all 'just works'.

There are u8 (byte), u16 (word), and u32 (dword) config reads &
writes.  But I don't think it really helps to return something wider
than the access.  For programmatic errors like invalid alignment, we
could indeed use the extra bits to return an unambiguous error.  But
we still have the "device was unplugged" sort of errors where the
*hardware* typically returns ~0 and the config accessor doesn't know
whether that's valid data or an error.

Bjorn
