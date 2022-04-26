Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2E650FFFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 16:04:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnkCK5Gwvz3bqW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 00:04:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q6ggUSdB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Q6ggUSdB; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnkBg3jZyz2yNv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 00:03:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650981835; x=1682517835;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=muy4OIGsUfuoU+ynYUj8788CzK12+NiFyJaROrENCgM=;
 b=Q6ggUSdBsaLnUCenchQxlsBYhw532Uu93BZYfUpYXST5OAHphfHoPuXo
 Gvca3Y0Nwt3edfLU+kF1dCMZUi05yORHeZTv7eq6BurmFq/G6QFpMp/yc
 SKwoKLoQcwp5QA+lIPvtVuzpHArB+fYfR/PghIXvjgQmBbEk53tv0NNDE
 IoOgOrjwVuf5Q0FBZJB0JmS1JUWqJ8ffL7KE4rn92p4Qtkd8ypqI1vFIO
 JaKkQfyOGpeYuBjHFzXg4iTzIMu1lByMRiAQhLAHlNOdOQNlzxxPejIaJ
 yrODhfWbm0R6+BLh76GTzutFhD5YE8IimnC2hLz2gb31iLG6KL0w337Zk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="246147770"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="246147770"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 07:01:41 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="579908538"
Received: from mmilkovx-mobl.amr.corp.intel.com ([10.249.47.245])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 07:01:33 -0700
Date: Tue, 26 Apr 2022 17:01:31 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v5 05/10] serial: termbits: ADDRB to indicate 9th bit
 addressing mode
In-Reply-To: <b667479-fb27-8712-cec8-938eed179240@linux.intel.com>
Message-ID: <17547658-4737-7ec1-9ef9-c61c6287b8b@linux.intel.com>
References: <20220426122448.38997-1-ilpo.jarvinen@linux.intel.com>
 <20220426122448.38997-6-ilpo.jarvinen@linux.intel.com>
 <Ymfq+jUXfZcNM/P/@kroah.com>
 <b667479-fb27-8712-cec8-938eed179240@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-479992224-1650981548=:1644"
Content-ID: <e8f02d4e-af44-a225-9cea-5c1babfa1471@linux.intel.com>
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
 linux-api@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-arch@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-serial <linux-serial@vger.kernel.org>,
 =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Johan Hovold <johan@kernel.org>, Vicente Bergas <vicencb@gmail.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mips@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Lukas Wunner <lukas@wunner.de>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, giulio.benetti@micronovasrl.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-479992224-1650981548=:1644
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <16767992-12e-3b16-2fdb-9ced864fa36e@linux.intel.com>

One additional thing below I missed on the first read.

On Tue, 26 Apr 2022, Ilpo Järvinen wrote:
> On Tue, 26 Apr 2022, Greg KH wrote:
> 
> > On Tue, Apr 26, 2022 at 03:24:43PM +0300, Ilpo Järvinen wrote:
> > > Add ADDRB to termbits to indicate 9th bit addressing mode. This change
> > > is necessary for supporting devices with RS485 multipoint addressing
> > > [*]. A later patch in the patch series adds support for Synopsys
> > > Designware UART capable for 9th bit addressing mode. In this mode, 9th
> > > bit is used to indicate an address (byte) within the communication
> > > line. The 9th bit addressing mode is selected using ADDRB introduced by
> > > an earlier patch.
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
> > > Cc: "David S. Miller" <davem@davemloft.net>
> > > Cc: sparclinux@vger.kernel.org
> > > Cc: Arnd Bergmann <arnd@arndb.de>
> > > Cc: linux-arch@vger.kernel.org
> > > Cc: linux-usb@vger.kernel.org
> > > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > ---

> > >  #define CMSPAR    010000000000          /* mark or space (stick) parity */
> > >  #define CRTSCTS   020000000000          /* flow control */
> > >  
> > > diff --git a/arch/powerpc/include/uapi/asm/termbits.h b/arch/powerpc/include/uapi/asm/termbits.h
> > > index ed18bc61f63d..c6a033732f39 100644
> > > --- a/arch/powerpc/include/uapi/asm/termbits.h
> > > +++ b/arch/powerpc/include/uapi/asm/termbits.h
> > > @@ -171,6 +171,7 @@ struct ktermios {
> > >  #define HUPCL	00040000
> > >  
> > >  #define CLOCAL	00100000
> > > +#define ADDRB	004000000000		/* address bit */
> > >  #define CMSPAR	  010000000000		/* mark or space (stick) parity */
> > >  #define CRTSCTS	  020000000000		/* flow control */
> > >  
> > > diff --git a/arch/sparc/include/uapi/asm/termbits.h b/arch/sparc/include/uapi/asm/termbits.h
> > > index ce5ad5d0f105..5eb1d547b5c4 100644
> > > --- a/arch/sparc/include/uapi/asm/termbits.h
> > > +++ b/arch/sparc/include/uapi/asm/termbits.h
> > > @@ -201,6 +201,7 @@ struct ktermios {
> > >  #define B3500000  0x00001012
> > >  #define B4000000  0x00001013  */
> > >  #define CIBAUD	  0x100f0000  /* input baud rate (not used) */
> > > +#define ADDRB	  0x20000000  /* address bit */
> > >  #define CMSPAR	  0x40000000  /* mark or space (stick) parity */
> > >  #define CRTSCTS	  0x80000000  /* flow control */
> > 
> > Why all the different values?  Can't we pick one and use it for all
> > arches?  Having these be different in different arches and userspace
> > should not be a thing for new fields, right?

ADDRB value is the same for all archs (it's just this octal vs hex 
notation I've followed as per the nearby defines within the same file
which makes them look different).

Should I perhaps add to my cleanup list conversion of all those octal ones 
to hex?

> > > diff --git a/drivers/char/pcmcia/synclink_cs.c b/drivers/char/pcmcia/synclink_cs.c
> > > index 78baba55a8b5..d179b9b57a25 100644
> > > --- a/drivers/char/pcmcia/synclink_cs.c
> > > +++ b/drivers/char/pcmcia/synclink_cs.c
> > > @@ -2287,6 +2287,8 @@ static void mgslpc_set_termios(struct tty_struct *tty, struct ktermios *old_term
> > >  		== RELEVANT_IFLAG(old_termios->c_iflag)))
> > >  	  return;
> > >  
> > > +	tty->termios.c_cflag &= ~ADDRB;
> > 
> > Having to do this for all drivers feels wrong.  It isn't needed for any
> > other flag, right?
> 
> My understanding is that it would be needed for other flags too, it's just 
> that many drivers probably haven't cared enough. Some drivers certainly 
> clear a few flags they don't support while others don't clear any but
> it's also challenging to determine it which flags which driver supports. 
> How bad the impact is per flag varies.
> 
> > That makes me really not like this change as it
> > feels very ackward and
> > yet-another-thing-a-serial-driver-has-to-remember.
> 
> It would be nice to have some mask for supported bits per driver. But it
> will be challenging to add at this point and I'm far from sure I could get 
> them right per driver even if carefully trying to.
> 
> > And as you are wanting to pass this bit to userspace, where is that
> > documented?
> 
> Ah, I probably should add it to driver-api/serial/driver.rst too but ADDRB
> is certainly mentioned alongside with other addressing mode documentation
> I wrote for the later changes in this series.

-- 
 i.
--8323329-479992224-1650981548=:1644--
