Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3282D50FE99
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 15:14:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Knj600gxZz3bd7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 23:14:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NflFOyIE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NflFOyIE; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Knj5J1ZkTz2xnR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 23:14:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650978852; x=1682514852;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=4mkD7GLX3iLI2eXfIKWZSJugD5xfyLr658aN5QzAUA4=;
 b=NflFOyIEJIFQ5QDsqr49srt/TdYss7qARnDwBcakeyxZnSFFjVbqwRv+
 iVO0FPgKtdZ6be6KdQIx5I9n5SBoJ7sDLl6pxf6kJHE+riKu4M08XUCbS
 FIYFi9xm/rdZQC1IXyojiEymjMx0WmXG+D7+fYdTtkJDZj0WI8u9aOxQJ
 XuwHYcW/SqPwPt5ijUeg5bqonJl3hAa4mEp+s23kXruXMbfS9mx2jivKD
 G5Q9gn8t60VdntQwwdA5/oqjAG1qWgLe+fis3BN8WH0B2r7dAbUkGdEJ4
 SKGdxVY5Bb9l8eRVwuzqDBigzLk7njsYadLbA9z1ecxbZ3FSBREY0vCIm w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="328514201"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="328514201"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 06:13:06 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="579884765"
Received: from mmilkovx-mobl.amr.corp.intel.com ([10.249.47.245])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 06:12:59 -0700
Date: Tue, 26 Apr 2022 16:12:57 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 05/10] serial: termbits: ADDRB to indicate 9th bit
 addressing mode
In-Reply-To: <Ymfq+jUXfZcNM/P/@kroah.com>
Message-ID: <b667479-fb27-8712-cec8-938eed179240@linux.intel.com>
References: <20220426122448.38997-1-ilpo.jarvinen@linux.intel.com>
 <20220426122448.38997-6-ilpo.jarvinen@linux.intel.com>
 <Ymfq+jUXfZcNM/P/@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1902298920-1650977784=:1644"
Content-ID: <9e9c7513-c53e-c92d-85d3-28ac5a3a7a22@linux.intel.com>
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
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-arch@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-serial <linux-serial@vger.kernel.org>,
 =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Johan Hovold <johan@kernel.org>, Vicente Bergas <vicencb@gmail.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mips@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Lukas Wunner <lukas@wunner.de>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, giulio.benetti@micronovasrl.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1902298920-1650977784=:1644
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <cd9fe5-9b4f-51fb-d37a-75d923e2ccc1@linux.intel.com>

On Tue, 26 Apr 2022, Greg KH wrote:

> On Tue, Apr 26, 2022 at 03:24:43PM +0300, Ilpo Järvinen wrote:
> > Add ADDRB to termbits to indicate 9th bit addressing mode. This change
> > is necessary for supporting devices with RS485 multipoint addressing
> > [*]. A later patch in the patch series adds support for Synopsys
> > Designware UART capable for 9th bit addressing mode. In this mode, 9th
> > bit is used to indicate an address (byte) within the communication
> > line. The 9th bit addressing mode is selected using ADDRB introduced by
> > an earlier patch.
> > 
> > [*] Technically, RS485 is just an electronic spec and does not itself
> > specify the 9th bit addressing mode but 9th bit seems at least
> > "semi-standard" way to do addressing with RS485.
> > 
> > Cc: linux-api@vger.kernel.org
> > Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> > Cc: Matt Turner <mattst88@gmail.com>
> > Cc: linux-alpha@vger.kernel.org
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: linux-mips@vger.kernel.org
> > Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> > Cc: Helge Deller <deller@gmx.de>
> > Cc: linux-parisc@vger.kernel.org
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: sparclinux@vger.kernel.org
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: linux-arch@vger.kernel.org
> > Cc: linux-usb@vger.kernel.org
> > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> >  arch/alpha/include/uapi/asm/termbits.h   | 1 +
> >  arch/mips/include/uapi/asm/termbits.h    | 1 +
> >  arch/parisc/include/uapi/asm/termbits.h  | 1 +
> >  arch/powerpc/include/uapi/asm/termbits.h | 1 +
> >  arch/sparc/include/uapi/asm/termbits.h   | 1 +
> >  drivers/char/pcmcia/synclink_cs.c        | 2 ++
> >  drivers/ipack/devices/ipoctal.c          | 2 ++
> >  drivers/mmc/core/sdio_uart.c             | 2 ++
> >  drivers/net/usb/hso.c                    | 3 ++-
> >  drivers/s390/char/tty3270.c              | 3 +++
> >  drivers/staging/greybus/uart.c           | 2 ++
> >  drivers/tty/amiserial.c                  | 6 +++++-
> >  drivers/tty/moxa.c                       | 1 +
> >  drivers/tty/mxser.c                      | 1 +
> >  drivers/tty/serial/serial_core.c         | 2 ++
> >  drivers/tty/synclink_gt.c                | 2 ++
> >  drivers/tty/tty_ioctl.c                  | 2 ++
> >  drivers/usb/class/cdc-acm.c              | 2 ++
> >  drivers/usb/serial/usb-serial.c          | 6 ++++--
> >  include/uapi/asm-generic/termbits.h      | 1 +
> >  net/bluetooth/rfcomm/tty.c               | 2 ++
> >  21 files changed, 40 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/alpha/include/uapi/asm/termbits.h b/arch/alpha/include/uapi/asm/termbits.h
> > index 4575ba34a0ea..0c123e715486 100644
> > --- a/arch/alpha/include/uapi/asm/termbits.h
> > +++ b/arch/alpha/include/uapi/asm/termbits.h
> > @@ -180,6 +180,7 @@ struct ktermios {
> >  #define HUPCL	00040000
> >  
> >  #define CLOCAL	00100000
> > +#define ADDRB	004000000000		/* address bit */
> >  #define CMSPAR	  010000000000		/* mark or space (stick) parity */
> >  #define CRTSCTS	  020000000000		/* flow control */
> >  
> > diff --git a/arch/mips/include/uapi/asm/termbits.h b/arch/mips/include/uapi/asm/termbits.h
> > index dfeffba729b7..4732d31b0e4e 100644
> > --- a/arch/mips/include/uapi/asm/termbits.h
> > +++ b/arch/mips/include/uapi/asm/termbits.h
> > @@ -182,6 +182,7 @@ struct ktermios {
> >  #define	 B3500000 0010016
> >  #define	 B4000000 0010017
> >  #define CIBAUD	  002003600000	/* input baud rate */
> > +#define ADDRB	  004000000000	/* address bit */
> >  #define CMSPAR	  010000000000	/* mark or space (stick) parity */
> >  #define CRTSCTS	  020000000000	/* flow control */
> >  
> > diff --git a/arch/parisc/include/uapi/asm/termbits.h b/arch/parisc/include/uapi/asm/termbits.h
> > index 40e920f8d683..d6bbd10d92ba 100644
> > --- a/arch/parisc/include/uapi/asm/termbits.h
> > +++ b/arch/parisc/include/uapi/asm/termbits.h
> > @@ -159,6 +159,7 @@ struct ktermios {
> >  #define  B3500000 0010016
> >  #define  B4000000 0010017
> >  #define CIBAUD    002003600000		/* input baud rate */
> > +#define ADDRB	  004000000000		/* address bit */
> 
> tabs where the rest were not?
> 
> >  #define CMSPAR    010000000000          /* mark or space (stick) parity */
> >  #define CRTSCTS   020000000000          /* flow control */
> >  
> > diff --git a/arch/powerpc/include/uapi/asm/termbits.h b/arch/powerpc/include/uapi/asm/termbits.h
> > index ed18bc61f63d..c6a033732f39 100644
> > --- a/arch/powerpc/include/uapi/asm/termbits.h
> > +++ b/arch/powerpc/include/uapi/asm/termbits.h
> > @@ -171,6 +171,7 @@ struct ktermios {
> >  #define HUPCL	00040000
> >  
> >  #define CLOCAL	00100000
> > +#define ADDRB	004000000000		/* address bit */
> >  #define CMSPAR	  010000000000		/* mark or space (stick) parity */
> >  #define CRTSCTS	  020000000000		/* flow control */
> >  
> > diff --git a/arch/sparc/include/uapi/asm/termbits.h b/arch/sparc/include/uapi/asm/termbits.h
> > index ce5ad5d0f105..5eb1d547b5c4 100644
> > --- a/arch/sparc/include/uapi/asm/termbits.h
> > +++ b/arch/sparc/include/uapi/asm/termbits.h
> > @@ -201,6 +201,7 @@ struct ktermios {
> >  #define B3500000  0x00001012
> >  #define B4000000  0x00001013  */
> >  #define CIBAUD	  0x100f0000  /* input baud rate (not used) */
> > +#define ADDRB	  0x20000000  /* address bit */
> >  #define CMSPAR	  0x40000000  /* mark or space (stick) parity */
> >  #define CRTSCTS	  0x80000000  /* flow control */
> 
> Why all the different values?  Can't we pick one and use it for all
> arches?  Having these be different in different arches and userspace
> should not be a thing for new fields, right?
> 
> > diff --git a/drivers/char/pcmcia/synclink_cs.c b/drivers/char/pcmcia/synclink_cs.c
> > index 78baba55a8b5..d179b9b57a25 100644
> > --- a/drivers/char/pcmcia/synclink_cs.c
> > +++ b/drivers/char/pcmcia/synclink_cs.c
> > @@ -2287,6 +2287,8 @@ static void mgslpc_set_termios(struct tty_struct *tty, struct ktermios *old_term
> >  		== RELEVANT_IFLAG(old_termios->c_iflag)))
> >  	  return;
> >  
> > +	tty->termios.c_cflag &= ~ADDRB;
> 
> Having to do this for all drivers feels wrong.  It isn't needed for any
> other flag, right?

My understanding is that it would be needed for other flags too, it's just 
that many drivers probably haven't cared enough. Some drivers certainly 
clear a few flags they don't support while others don't clear any but
it's also challenging to determine it which flags which driver supports. 
How bad the impact is per flag varies.

> That makes me really not like this change as it
> feels very ackward and
> yet-another-thing-a-serial-driver-has-to-remember.

It would be nice to have some mask for supported bits per driver. But it
will be challenging to add at this point and I'm far from sure I could get 
them right per driver even if carefully trying to.

> And as you are wanting to pass this bit to userspace, where is that
> documented?

Ah, I probably should add it to driver-api/serial/driver.rst too but ADDRB
is certainly mentioned alongside with other addressing mode documentation
I wrote for the later changes in this series.

-- 
 i.
--8323329-1902298920-1650977784=:1644--
