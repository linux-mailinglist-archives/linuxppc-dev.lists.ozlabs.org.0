Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DB44F11B8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 11:12:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KX4mP74x7z3bVN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 19:12:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EEMOK8nA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EEMOK8nA; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KX4lk6hSlz2xnK
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Apr 2022 19:11:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649063507; x=1680599507;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=QqiEMALvxm0dsFsEQM+G8iM/nNOxk00l7kVM6nD9bW8=;
 b=EEMOK8nAeyZmjN9IQglJUDi4qa7SrHiMHAzaa/r9sJI7COOa6v/2gdmN
 a/BpxjcFSFBHIlVrWqU8sBm/AX+hZ9RvDwCUNDmdhY2BYlSKerPOCSeeJ
 eoZOuAKEwnVaTSxFDCWNqk6sKQ/s6UgQhg0wcHfwLvaJjAzpCk3icmQ94
 0ko0SoIyHUJ//UJTHNaQ9kdhOJBsjGmEv+S/+EnJJtOXSFEy+t9AotJUD
 4PfnXcKZ5XR9jVym9woSsFujdgVfq/dnW8c1pDGFy8rallbU+ZZbdoxmk
 qv+Ze9wud37yJkcA4ZxZ9e3+c1trwNWxbx6/Tv8I998kriQTvADe5yhkw A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10306"; a="258053076"
X-IronPort-AV: E=Sophos;i="5.90,233,1643702400"; d="scan'208";a="258053076"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 02:10:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,233,1643702400"; d="scan'208";a="569307128"
Received: from rhamza-mobl.ger.corp.intel.com ([10.251.211.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 02:10:25 -0700
Date: Mon, 4 Apr 2022 12:10:18 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 07/12] serial: termbits: ADDRB to indicate 9th bit
 addressing mode
In-Reply-To: <CAK8P3a0iP79RQWr6-YDf=xQZvonZchYN-Rn7HN2pkNihZ=anAw@mail.gmail.com>
Message-ID: <a05978b6-ed73-4ee-c688-e383b47c35d5@linux.intel.com>
References: <20220404082912.6885-1-ilpo.jarvinen@linux.intel.com>
 <20220404082912.6885-8-ilpo.jarvinen@linux.intel.com>
 <CAK8P3a0iP79RQWr6-YDf=xQZvonZchYN-Rn7HN2pkNihZ=anAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1630404425-1649063432=:1675"
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Heiko Stuebner <heiko@sntech.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux <sparclinux@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, Helge Deller <deller@gmx.de>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Matt Turner <mattst88@gmail.com>, Johan Hovold <johan@kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, USB list <linux-usb@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Lukas Wunner <lukas@wunner.de>,
 alpha <linux-alpha@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, giulio.benetti@micronovasrl.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1630404425-1649063432=:1675
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 4 Apr 2022, Arnd Bergmann wrote:

> On Mon, Apr 4, 2022 at 10:29 AM Ilpo Järvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> 
> >
> >  #define CLOCAL 00100000
> > +#define ADDRB  010000000               /* address bit */
> >  #define CMSPAR   010000000000          /* mark or space (stick) parity */
> >  #define CRTSCTS          020000000000          /* flow control */
> >
> > diff --git a/arch/mips/include/uapi/asm/termbits.h b/arch/mips/include/uapi/asm/termbits.h
> > index dfeffba729b7..e7ea31cfec78 100644
> > --- a/arch/mips/include/uapi/asm/termbits.h
> > +++ b/arch/mips/include/uapi/asm/termbits.h
> > @@ -181,6 +181,7 @@ struct ktermios {
> >  #define         B3000000 0010015
> >  #define         B3500000 0010016
> >  #define         B4000000 0010017
> > +#define ADDRB    0020000       /* address bit */
> >  #define CIBAUD   002003600000  /* input baud rate */
> >  #define CMSPAR   010000000000  /* mark or space (stick) parity */
> >  #define CRTSCTS          020000000000  /* flow control */
> 
> It looks like the top bits are used the same way on all architectures
> already, while the bottom bits of the flag differ. Could you pick
> the next free bit from the top to use the same value 04000000000
> everywhere?

04000000000 isn't the top of the use:

diff --git a/arch/alpha/include/uapi/asm/termbits.h 
b/arch/alpha/include/uapi/asm/termbits.h
index 4575ba34a0ea..285169c794ec 100644
--- a/arch/alpha/include/uapi/asm/termbits.h
+++ b/arch/alpha/include/uapi/asm/termbits.h
@@ -178,10 +178,11 @@ struct ktermios {
 #define PARENB 00010000
 #define PARODD 00020000
 #define HUPCL  00040000
 
 #define CLOCAL 00100000
+#define ADDRB  010000000               /* address bit */
 #define CMSPAR   010000000000          /* mark or space (stick) parity */
 #define CRTSCTS          020000000000          /* flow control */
 
 #define CIBAUD 07600000
 #define IBSHIFT        16
diff --git a/arch/sparc/include/uapi/asm/termbits.h 
b/arch/sparc/include/uapi/asm/termbits.h
index ce5ad5d0f105..4ad60c4acf65 100644
--- a/arch/sparc/include/uapi/asm/termbits.h
+++ b/arch/sparc/include/uapi/asm/termbits.h
@@ -198,10 +198,11 @@ struct ktermios {
    adjust CBAUD constant and drivers accordingly.
 #define B4000000  0x00001013  */
+#define ADDRB    0x00002000  /* address bit */
 #define CIBAUD   0x100f0000  /* input baud rate (not used) */
 #define CMSPAR   0x40000000  /* mark or space (stick) parity */
 #define CRTSCTS          0x80000000  /* flow control */


Somehow I managed to convince myself earlier there isn't a bit available 
that would be consistent across archs but now that I recheck the 
04000000000 bit (0x20000000) you propose, it seems to be that nothing is 
using it.

It's not suprising I didn't get the magnitude of those long octal numbers 
right. ...They are such a pain to interpret correctly.


-- 
 i.

--8323329-1630404425-1649063432=:1675--
