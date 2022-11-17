Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2A962E810
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 23:17:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCvRj6RYgz3f4h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 09:17:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCvR522gwz2yHc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 09:17:04 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-135-r8pLcNsHMNSPwdstNZNmIw-1; Thu, 17 Nov 2022 22:15:38 +0000
X-MC-Unique: r8pLcNsHMNSPwdstNZNmIw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 17 Nov
 2022 22:15:36 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.044; Thu, 17 Nov 2022 22:15:36 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Theodore Ts'o' <tytso@mit.edu>, Kees Cook <kees@kernel.org>
Subject: RE: [PATCH v2 3/3] treewide: use get_random_u32_between() when
 possible
Thread-Topic: [PATCH v2 3/3] treewide: use get_random_u32_between() when
 possible
Thread-Index: AQHY+pt8WAMBAHgXDk6lkwvXqmmyGK5DraKg
Date: Thu, 17 Nov 2022 22:15:36 +0000
Message-ID: <5b2afac148e24181a206e540768e465b@AcuMS.aculab.com>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
 <20221114164558.1180362-4-Jason@zx2c4.com> <202211161436.A45AD719A@keescook>
 <Y3V4g8eorwiU++Y3@zx2c4.com> <Y3V6QtYMayODVDOk@zx2c4.com>
 <202211161628.164F47F@keescook> <Y3WDyl8ArQgeEoUU@zx2c4.com>
 <0EE39896-C7B6-4CB6-87D5-22AA787740A9@kernel.org> <Y3ZWbcoGOdFjlPhS@mit.edu>
In-Reply-To: <Y3ZWbcoGOdFjlPhS@mit.edu>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "Darrick J . Wong" <djwong@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, "ydroneaud@opteya.com" <ydroneaud@opteya.com>, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, SeongJae Park <sj@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de
 >, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "patches@lists.linux.dev" <patches@lists.linux.dev>, =?iso-8859-1?Q?Christoph_B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Theodore Ts'o
> Sent: 17 November 2022 15:43
...
> The problem with "between", "ranged", "spanning" is that they don't
> tell the reader whether we're dealing with an "open interval" or a
> "closed interval".  They are just different ways of saying that it's a
> range between, say, 0 and 20.  But it doesn't tell you whether it
> includes 0 or 20 or not.
>=20
> The only way I can see for making it ambiguous is either to use the
> terminology "closed interval" or "inclusive".  And "open" and "closed"
> can have other meanings, so get_random_u32_inclusive() is going to be
> less confusing than get_random_u32_closed().

It has to be said that removing the extra function and requiring
the callers use 'base + get_random_below(high [+1] - base)' is
likely to be the only way to succinctly make the code readable
and understandable.

Otherwise readers either have to look up another function to see
what it does or waste variable brain cells on more trivia.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

