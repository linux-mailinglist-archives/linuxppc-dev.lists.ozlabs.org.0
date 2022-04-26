Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B49CF50FDAA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 14:52:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Knhck46Wnz3bXw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 22:52:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=PeVgS2kA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=PeVgS2kA; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Knhc3115dz2yN4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 22:52:17 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FF2A61947;
 Tue, 26 Apr 2022 12:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2BADC385AC;
 Tue, 26 Apr 2022 12:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1650977533;
 bh=JYdt7nbGn2AGAmBPvGn66zPmcPIfNYsifRTpCHGEQPs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PeVgS2kAG6q5eiHA+jYqEttw/PXUgA0eQejcGeGlzbdKNFJ/x4hRepm+jc/dBQT+6
 JmJkRlgGOqlBcrSLH4aREEHXkqpiN/VBeQKPLUNBDHX7StjuwOzxngNC2H0mW2Mvhf
 EH4d238nRc3YrEWe4spzNlm07S+xuaxY3WZRLeh8=
Date: Tue, 26 Apr 2022 14:52:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v5 05/10] serial: termbits: ADDRB to indicate 9th bit
 addressing mode
Message-ID: <Ymfq+jUXfZcNM/P/@kroah.com>
References: <20220426122448.38997-1-ilpo.jarvinen@linux.intel.com>
 <20220426122448.38997-6-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426122448.38997-6-ilpo.jarvinen@linux.intel.com>
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
 Helge Deller <deller@gmx.de>, linux-serial@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
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

On Tue, Apr 26, 2022 at 03:24:43PM +0300, Ilpo J�rvinen wrote:
> Add ADDRB to termbits to indicate 9th bit addressing mode. This change
> is necessary for supporting devices with RS485 multipoint addressing
> [*]. A later patch in the patch series adds support for Synopsys
> Designware UART capable for 9th bit addressing mode. In this mode, 9th
> bit is used to indicate an address (byte) within the communication
> line. The 9th bit addressing mode is selected using ADDRB introduced by
> an earlier patch.
> 
> [*] Technically, RS485 is just an electronic spec and does not itself
> specify the 9th bit addressing mode but 9th bit seems at least
> "semi-standard" way to do addressing with RS485.
> 
> Cc: linux-api@vger.kernel.org
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-parisc@vger.kernel.org
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: sparclinux@vger.kernel.org
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-arch@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Ilpo J�rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  arch/alpha/include/uapi/asm/termbits.h   | 1 +
>  arch/mips/include/uapi/asm/termbits.h    | 1 +
>  arch/parisc/include/uapi/asm/termbits.h  | 1 +
>  arch/powerpc/include/uapi/asm/termbits.h | 1 +
>  arch/sparc/include/uapi/asm/termbits.h   | 1 +
>  drivers/char/pcmcia/synclink_cs.c        | 2 ++
>  drivers/ipack/devices/ipoctal.c          | 2 ++
>  drivers/mmc/core/sdio_uart.c             | 2 ++
>  drivers/net/usb/hso.c                    | 3 ++-
>  drivers/s390/char/tty3270.c              | 3 +++
>  drivers/staging/greybus/uart.c           | 2 ++
>  drivers/tty/amiserial.c                  | 6 +++++-
>  drivers/tty/moxa.c                       | 1 +
>  drivers/tty/mxser.c                      | 1 +
>  drivers/tty/serial/serial_core.c         | 2 ++
>  drivers/tty/synclink_gt.c                | 2 ++
>  drivers/tty/tty_ioctl.c                  | 2 ++
>  drivers/usb/class/cdc-acm.c              | 2 ++
>  drivers/usb/serial/usb-serial.c          | 6 ++++--
>  include/uapi/asm-generic/termbits.h      | 1 +
>  net/bluetooth/rfcomm/tty.c               | 2 ++
>  21 files changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/alpha/include/uapi/asm/termbits.h b/arch/alpha/include/uapi/asm/termbits.h
> index 4575ba34a0ea..0c123e715486 100644
> --- a/arch/alpha/include/uapi/asm/termbits.h
> +++ b/arch/alpha/include/uapi/asm/termbits.h
> @@ -180,6 +180,7 @@ struct ktermios {
>  #define HUPCL	00040000
>  
>  #define CLOCAL	00100000
> +#define ADDRB	004000000000		/* address bit */
>  #define CMSPAR	  010000000000		/* mark or space (stick) parity */
>  #define CRTSCTS	  020000000000		/* flow control */
>  
> diff --git a/arch/mips/include/uapi/asm/termbits.h b/arch/mips/include/uapi/asm/termbits.h
> index dfeffba729b7..4732d31b0e4e 100644
> --- a/arch/mips/include/uapi/asm/termbits.h
> +++ b/arch/mips/include/uapi/asm/termbits.h
> @@ -182,6 +182,7 @@ struct ktermios {
>  #define	 B3500000 0010016
>  #define	 B4000000 0010017
>  #define CIBAUD	  002003600000	/* input baud rate */
> +#define ADDRB	  004000000000	/* address bit */
>  #define CMSPAR	  010000000000	/* mark or space (stick) parity */
>  #define CRTSCTS	  020000000000	/* flow control */
>  
> diff --git a/arch/parisc/include/uapi/asm/termbits.h b/arch/parisc/include/uapi/asm/termbits.h
> index 40e920f8d683..d6bbd10d92ba 100644
> --- a/arch/parisc/include/uapi/asm/termbits.h
> +++ b/arch/parisc/include/uapi/asm/termbits.h
> @@ -159,6 +159,7 @@ struct ktermios {
>  #define  B3500000 0010016
>  #define  B4000000 0010017
>  #define CIBAUD    002003600000		/* input baud rate */
> +#define ADDRB	  004000000000		/* address bit */

tabs where the rest were not?

>  #define CMSPAR    010000000000          /* mark or space (stick) parity */
>  #define CRTSCTS   020000000000          /* flow control */
>  
> diff --git a/arch/powerpc/include/uapi/asm/termbits.h b/arch/powerpc/include/uapi/asm/termbits.h
> index ed18bc61f63d..c6a033732f39 100644
> --- a/arch/powerpc/include/uapi/asm/termbits.h
> +++ b/arch/powerpc/include/uapi/asm/termbits.h
> @@ -171,6 +171,7 @@ struct ktermios {
>  #define HUPCL	00040000
>  
>  #define CLOCAL	00100000
> +#define ADDRB	004000000000		/* address bit */
>  #define CMSPAR	  010000000000		/* mark or space (stick) parity */
>  #define CRTSCTS	  020000000000		/* flow control */
>  
> diff --git a/arch/sparc/include/uapi/asm/termbits.h b/arch/sparc/include/uapi/asm/termbits.h
> index ce5ad5d0f105..5eb1d547b5c4 100644
> --- a/arch/sparc/include/uapi/asm/termbits.h
> +++ b/arch/sparc/include/uapi/asm/termbits.h
> @@ -201,6 +201,7 @@ struct ktermios {
>  #define B3500000  0x00001012
>  #define B4000000  0x00001013  */
>  #define CIBAUD	  0x100f0000  /* input baud rate (not used) */
> +#define ADDRB	  0x20000000  /* address bit */
>  #define CMSPAR	  0x40000000  /* mark or space (stick) parity */
>  #define CRTSCTS	  0x80000000  /* flow control */

Why all the different values?  Can't we pick one and use it for all
arches?  Having these be different in different arches and userspace
should not be a thing for new fields, right?

> diff --git a/drivers/char/pcmcia/synclink_cs.c b/drivers/char/pcmcia/synclink_cs.c
> index 78baba55a8b5..d179b9b57a25 100644
> --- a/drivers/char/pcmcia/synclink_cs.c
> +++ b/drivers/char/pcmcia/synclink_cs.c
> @@ -2287,6 +2287,8 @@ static void mgslpc_set_termios(struct tty_struct *tty, struct ktermios *old_term
>  		== RELEVANT_IFLAG(old_termios->c_iflag)))
>  	  return;
>  
> +	tty->termios.c_cflag &= ~ADDRB;

Having to do this for all drivers feels wrong.  It isn't needed for any
other flag, right?  That makes me really not like this change as it
feels very ackward and
yet-another-thing-a-serial-driver-has-to-remember.

And as you are wanting to pass this bit to userspace, where is that
documented?

thanks,

greg k-h
