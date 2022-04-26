Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B01D50FFDC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 15:59:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Knk5Y1Gdgz3bqR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 23:59:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rPlxeusT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=rPlxeusT; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Knk4t1mRsz2yMj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 23:58:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5A64B82006;
 Tue, 26 Apr 2022 13:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF43AC385AA;
 Tue, 26 Apr 2022 13:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1650981527;
 bh=Q2CbGzlO12o2sbSJCVILKFqSAKwSGP36Qpvd86jEE4c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rPlxeusTmjq/0/+EHFfnDlmdGs+COvFDZFCgTv+38FHJQLu/3K1jRTOXmXkqLXP/J
 qA5n0a+3bskZdBKVwMeeYcIF3N60iifRKD7Sa6eyVSIhkcBzHwhLVOLaneSeWcqnhC
 KjMJhwCaSLPfTwzfbLs4yha6/Z7mC05ooTVOw3+o=
Date: Tue, 26 Apr 2022 15:58:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v5 06/10] serial: General support for multipoint addresses
Message-ID: <Ymf6lJdj+nR74Tak@kroah.com>
References: <20220426122448.38997-1-ilpo.jarvinen@linux.intel.com>
 <20220426122448.38997-7-ilpo.jarvinen@linux.intel.com>
 <YmfsDng2Z04PT3GS@kroah.com>
 <e67014bd-3c32-e7d-2982-a0edb741f3c0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e67014bd-3c32-e7d-2982-a0edb741f3c0@linux.intel.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, heiko@sntech.de,
 linux-sh@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 linux-doc@vger.kernel.org, linux-serial <linux-serial@vger.kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Matt Turner <mattst88@gmail.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, Johan Hovold <johan@kernel.org>,
 Vicente Bergas <vicencb@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, linux-mips@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Lukas Wunner <lukas@wunner.de>,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 giulio.benetti@micronovasrl.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 26, 2022 at 04:36:49PM +0300, Ilpo Järvinen wrote:
> On Tue, 26 Apr 2022, Greg KH wrote:
> 
> > On Tue, Apr 26, 2022 at 03:24:44PM +0300, Ilpo Järvinen wrote:
> > > Add generic support for serial multipoint addressing. Two new ioctls
> > > are added. TIOCSADDR is used to indicate the destination/receive
> > > address. TIOCGADDR returns the current address in use. The driver
> > > should implement set_addr and get_addr to support addressing mode.
> > > 
> > > Adjust ADDRB clearing to happen only if driver does not provide
> > > set_addr (=the driver doesn't support address mode).
> > > 
> > > This change is necessary for supporting devices with RS485 multipoint
> > > addressing [*]. A following patch in the patch series adds support for
> > > Synopsys Designware UART capable for 9th bit addressing mode. In this
> > > mode, 9th bit is used to indicate an address (byte) within the
> > > communication line. The 9th bit addressing mode is selected using ADDRB
> > > introduced by the previous patch.
> > > 
> > > Transmit addresses / receiver filter are specified by setting the flags
> > > SER_ADDR_DEST and/or SER_ADDR_RECV. When the user supplies the transmit
> > > address, in the 9bit addressing mode it is sent out immediately with
> > > the 9th bit set to 1. After that, the subsequent normal data bytes are
> > > sent with 9th bit as 0 and they are intended to the device with the
> > > given address. It is up to receiver to enforce the filter using
> > > SER_ADDR_RECV. When userspace has supplied the receive address, the
> > > driver is expected to handle the matching of the address and only data
> > > with that address is forwarded to the user. Both SER_ADDR_DEST and
> > > SER_ADDR_RECV can be given at the same time in a single call if the
> > > addresses are the same.
> > > 
> > > The user can clear the receive filter with SER_ADDR_RECV_CLEAR.
> > > 
> > > [*] Technically, RS485 is just an electronic spec and does not itself
> > > specify the 9th bit addressing mode but 9th bit seems at least
> > > "semi-standard" way to do addressing with RS485.
> > > 
> > > Cc: linux-api@vger.kernel.org
> > > Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> > > Cc: Matt Turner <mattst88@gmail.com>
> > > Cc: linux-alpha@vger.kernel.org
> > > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > Cc: linux-mips@vger.kernel.org
> > > Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> > > Cc: Helge Deller <deller@gmx.de>
> > > Cc: linux-parisc@vger.kernel.org
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > Cc: Paul Mackerras <paulus@samba.org>
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> > > Cc: Rich Felker <dalias@libc.org>
> > > Cc: linux-sh@vger.kernel.org
> > > Cc: "David S. Miller" <davem@davemloft.net>
> > > Cc: sparclinux@vger.kernel.org
> > > Cc: Chris Zankel <chris@zankel.net>
> > > Cc: Max Filippov <jcmvbkbc@gmail.com>
> > > Cc: linux-xtensa@linux-xtensa.org
> > > Cc: Arnd Bergmann <arnd@arndb.de>
> > > Cc: linux-arch@vger.kernel.org
> > > Cc: linux-doc@vger.kernel.org
> > > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > ---
> 
> > > diff --git a/include/uapi/linux/serial.h b/include/uapi/linux/serial.h
> > > index fa6b16e5fdd8..8cb785ea7087 100644
> > > --- a/include/uapi/linux/serial.h
> > > +++ b/include/uapi/linux/serial.h
> > > @@ -149,4 +149,12 @@ struct serial_iso7816 {
> > >  	__u32	reserved[5];
> > >  };
> > >  
> > > +struct serial_addr {
> > > +	__u32	flags;
> > > +#define SER_ADDR_RECV			(1 << 0)
> > > +#define SER_ADDR_RECV_CLEAR		(1 << 1)
> > > +#define SER_ADDR_DEST			(1 << 2)
> > 
> > You never check for invalid flags being sent to the kernel, which means
> > this api can never change in the future to add new flags :(
> 
> Ok, so you mean the general level should to check
> if (...->flags & ~(SER_ADDR_FLAGS_ALL))
> 	return -EINVAL;
> ?

For any new kernel api you always have to ensure that no "extra" flags
or bits are set and reject it otherwise you can never add any more bits
or flags in the future.  This should be in the Documentation/ directory
for how to add new ioctls somewhere.

> There's some code in the driver that detects invalid flag combinations 
> (in 10/10) but I guess it doesn't satisfies what you're after. It is 
> similar to how serial_rs485 flags is handled, that is, clearing flags it 
> didn't handle (when it can) and returning -EINVAL for impossible 
> combinations such as getting both RECV and DEST addr at the same time.
> I don't know if serial_rs485 flags is a good example at all, it certainly 
> doesn't check whether bits are set where there's no flag defined.
> 
> > And what about struct serial_rs485?  Shouldn't that be used here
> > instead?  Why do we need a new ioctl and structure?
> 
> It is possible (Lukas already mentioned that option too). It just means
> this will be available only on RS485 which could well be enough but Andy 
> mentioned he has in the past come across addressing mode also with some 
> RS232 thing (he didn't remember details anymore and it could be 
> insignificant for the real world of today).

This is rs485 so let's keep it attached to that.  Lots of people do
their own custom addressing schemes on top of 232 but that's up to them
to support in userspace or as a line discipline.

thanks,

greg k-h
