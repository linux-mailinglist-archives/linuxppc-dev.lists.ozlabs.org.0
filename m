Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 489694D4703
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 13:31:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDpMK0xXbz30CL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 23:31:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KdptwUPf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KdptwUPf; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDpLg2gPWz30RT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 23:30:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646915435; x=1678451435;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=KpU7qHsFQttScVYV4Sy+C7cKf/dHAGOyV91juLQL6gk=;
 b=KdptwUPf5/tvnjZpAFms6t1JBthFZUSwXzkro8AQm07L+kpZDnLgUz4U
 LfQD+FchUBifWcfvpA8jB5ncHVhea8fSNKRKDhXlPusPn3jr9tktvZOj3
 dsPXpMEBCmFnOaIqCp1HehwRvj5STN7Z+CIy+ktLKd3yTB3CuO0XdQUsD
 V2avj3WX965Rs/SawMnj/0hXmkAcipcm3yr2SO3e0AgYz/sbXyiin6BC+
 SuLvGm7xkMug70r0YeCOsBSoQi4B7nbXLRLWbbJ8P7J3ZsyNyOJKNCcp2
 pjmN4t7NihMx+O5Np+6Q2t0vxISCG/ySPPID/YctpxgDKsQ+AqDcRN34U g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="279974514"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="279974514"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 04:29:31 -0800
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="554624288"
Received: from mborg-mobl.ger.corp.intel.com ([10.252.33.144])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 04:29:23 -0800
Date: Thu, 10 Mar 2022 14:29:21 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [RFC PATCH 6/7] serial: General support for multipoint addresses
In-Reply-To: <20220309190521.GA9832@wunner.de>
Message-ID: <6feb796a-ea58-9a6-f2f9-a11ca72acfd@linux.intel.com>
References: <20220302095606.14818-1-ilpo.jarvinen@linux.intel.com>
 <20220302095606.14818-7-ilpo.jarvinen@linux.intel.com>
 <20220306194001.GD19394@wunner.de>
 <ab43569c-6488-12a6-823-3ef09f2849d@linux.intel.com>
 <20220309190521.GA9832@wunner.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-24784813-1646915371=:1973"
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-sh@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-api@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, linux-doc@vger.kernel.org,
 linux-serial <linux-serial@vger.kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 Johan Hovold <johan@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-24784813-1646915371=:1973
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Wed, 9 Mar 2022, Lukas Wunner wrote:

> On Mon, Mar 07, 2022 at 11:48:01AM +0200, Ilpo Järvinen wrote:
> > On Sun, 6 Mar 2022, Lukas Wunner wrote:
> > > On Wed, Mar 02, 2022 at 11:56:05AM +0200, Ilpo Järvinen wrote:
> > > > This change is necessary for supporting devices with RS485
> > > > multipoint addressing [*].
> > > 
> > > If this is only used with RS485, why can't we just store the
> > > addresses in struct serial_rs485 and use the existing TIOCSRS485
> > > and TIOCGRS485 ioctls?  There's 20 bytes of padding left in
> > > struct serial_rs485 which you could use.  No need to add more
> > > user-space ABI.
> > 
> > It could if it is agreed that serial multipoint addressing is just
> > a thing in RS-485 and nowhere else? In that case, there is no point
> > in adding more generic support for it.
> 
> It's just that the above-quoted sentence in the commit message
> specifically mentions RS485.

That sentence is just to justify why addressing mode is needed,
not to take a stance on whether it is only used with RS485 or not.

> If you intend to use it with RS232
> as well, that should be made explicit, otherwise one wonders why
> it wasn't integrated into struct serial_rs485.
> 
> I have no idea how common 9th bit addressing mode is with RS232.
> Goggle turns up links saying it's mainly used with RS485, "but also
> RS232".  Since RS232 isn't a bus but a point-to-point link,
> 9th bit addressing doesn't seem to make as much sense.

While I don't know any better, I can image though that with an 
RS232-to-RS485 converter, it could make some sense.

If I put them back to serial_rs485 / rs485 config, it's basically just 
where I initially started from with this patchset (offlist).


-- 
 i.

--8323329-24784813-1646915371=:1973--
