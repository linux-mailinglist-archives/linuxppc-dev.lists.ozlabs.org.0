Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 858844CED8C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Mar 2022 20:50:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBXJ63yTPz3bVP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 06:50:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=h08.hostsharing.net (client-ip=2a01:4f8:150:2161:1:b009:f23e:0;
 helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net;
 receiver=<UNKNOWN>)
X-Greylist: delayed 595 seconds by postgrey-1.36 at boromir;
 Mon, 07 Mar 2022 06:50:07 AEDT
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBXHg0BNLz305B
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Mar 2022 06:50:06 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id B3C27100D9417;
 Sun,  6 Mar 2022 20:40:02 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id F33A644C28B; Sun,  6 Mar 2022 20:40:01 +0100 (CET)
Date: Sun, 6 Mar 2022 20:40:01 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [RFC PATCH 6/7] serial: General support for multipoint addresses
Message-ID: <20220306194001.GD19394@wunner.de>
References: <20220302095606.14818-1-ilpo.jarvinen@linux.intel.com>
 <20220302095606.14818-7-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220302095606.14818-7-ilpo.jarvinen@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-api@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, linux-doc@vger.kernel.org,
 linux-serial@vger.kernel.org, Matt Turner <mattst88@gmail.com>,
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

On Wed, Mar 02, 2022 at 11:56:05AM +0200, Ilpo Järvinen wrote:
> This patch adds generic support for serial multipoint
> addressing. Two new ioctls are added. TIOCSADDR is used to

Nit:  "This patch adds..." is superfluous.  Just write "Add ..."
in imperative mood.


> This change is necessary for supporting devices with RS485
> multipoint addressing [*].

If this is only used with RS485, why can't we just store the
addresses in struct serial_rs485 and use the existing TIOCSRS485
and TIOCGRS485 ioctls?  There's 20 bytes of padding left in
struct serial_rs485 which you could use.  No need to add more
user-space ABI.


> [*] Technically, RS485 is just an electronic spec and does not
> itself specify the 9th bit addressing mode but 9th bit seems
> at least "semi-standard" way to do addressing with RS485.

Is 9th bit addressing actually used by an Intel customer or was
it implemented just for feature completeness?  I think this mode
isn't used often (I've never seen a use case myself), primarily
because it requires disabling parity.

Thanks,

Lukas
