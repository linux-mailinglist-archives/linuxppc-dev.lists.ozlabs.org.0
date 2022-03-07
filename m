Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA574CF7BE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 10:49:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBtwW4zq6z3bWd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 20:49:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W28BMBpX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=W28BMBpX; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBtvr5bV2z30Ks
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Mar 2022 20:49:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646646554; x=1678182554;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=zC3EygN9B67AQNPvzALqT8NwONoTEFy8bHC2L1G4njc=;
 b=W28BMBpXy598i6KxO4bY4gPGt9zVM5TTEksM0CK9+5j0ciB3OnZJve6t
 FMRaz+qPkhat8zNr6gakN/43e+5EOXlv25nbnIhzyIHdEL359ipJobi4K
 WqSqxNcdhtqVu2bi8meJgbr3kN8CDX9ctnuFpvIeOEdEQveWge1Co+DjB
 CgXKtWBuPaYckQi7PLEbRQ9jIGEMa9M0sIRzXccsckmJHKTqR+DOZJ+Wq
 aE0FPCmfK8p53EUfrLqjLzGt1BkEc1JAvc4jGghDAuyYhm7+nCQ2FWqps
 hVlLxCc++MXQo01+pupLlfUh99ByKQqvudFKTgpmmbRNAjVM9TurZizpo A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="254080149"
X-IronPort-AV: E=Sophos;i="5.90,161,1643702400"; d="scan'208";a="254080149"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 01:48:11 -0800
X-IronPort-AV: E=Sophos;i="5.90,161,1643702400"; d="scan'208";a="553088602"
Received: from rabl-mobl2.ger.corp.intel.com ([10.252.54.114])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 01:48:03 -0800
Date: Mon, 7 Mar 2022 11:48:01 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [RFC PATCH 6/7] serial: General support for multipoint addresses
In-Reply-To: <20220306194001.GD19394@wunner.de>
Message-ID: <ab43569c-6488-12a6-823-3ef09f2849d@linux.intel.com>
References: <20220302095606.14818-1-ilpo.jarvinen@linux.intel.com>
 <20220302095606.14818-7-ilpo.jarvinen@linux.intel.com>
 <20220306194001.GD19394@wunner.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-971395012-1646646016=:1677"
Content-ID: <cbee2ae-83f0-872e-34dd-cb9866dd3f6e@linux.intel.com>
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

--8323329-971395012-1646646016=:1677
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <07d5f9f-7fe3-3c54-6566-1873a5191970@linux.intel.com>

On Sun, 6 Mar 2022, Lukas Wunner wrote:

> On Wed, Mar 02, 2022 at 11:56:05AM +0200, Ilpo Järvinen wrote:
> 
> > This change is necessary for supporting devices with RS485
> > multipoint addressing [*].
> 
> If this is only used with RS485, why can't we just store the
> addresses in struct serial_rs485 and use the existing TIOCSRS485
> and TIOCGRS485 ioctls?  There's 20 bytes of padding left in
> struct serial_rs485 which you could use.  No need to add more
> user-space ABI.

It could if it is agreed that serial multipoint addressing is just
a thing in RS-485 and nowhere else? In that case, there is no point
in adding more generic support for it.

> > [*] Technically, RS485 is just an electronic spec and does not
> > itself specify the 9th bit addressing mode but 9th bit seems
> > at least "semi-standard" way to do addressing with RS485.
> 
> Is 9th bit addressing actually used by an Intel customer or was
> it implemented just for feature completeness? I think this mode
> isn't used often (I've never seen a use case myself), primarily
> because it requires disabling parity.

On what basis? ...The datasheet I'm looking at has a timing diagram 
with both D8 (9th bit) and parity so I think your information must be
incorrect. I don't have direct contacts with customers but I'm told
it's important for other org's customers.


-- 
 i.
--8323329-971395012-1646646016=:1677--
