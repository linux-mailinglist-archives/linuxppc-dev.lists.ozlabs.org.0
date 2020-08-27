Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AD1254ABD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 18:30:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcpBH6cPpzDqJl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 02:30:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
X-Greylist: delayed 68 seconds by postgrey-1.36 at bilbo;
 Fri, 28 Aug 2020 01:59:23 AEST
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcnV32lPYzDqCT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 01:59:22 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-127-1uCyu8HkODWHTq8BSgI4eA-1; Thu, 27 Aug 2020 16:58:02 +0100
X-MC-Unique: 1uCyu8HkODWHTq8BSgI4eA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 27 Aug 2020 16:58:02 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 27 Aug 2020 16:58:02 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>, Linus Torvalds
 <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>, "Michael
 Ellerman" <mpe@ellerman.id.au>, "x86@kernel.org" <x86@kernel.org>
Subject: RE: [PATCH 01/10] fs: don't allow kernel reads and writes without
 iter ops
Thread-Topic: [PATCH 01/10] fs: don't allow kernel reads and writes without
 iter ops
Thread-Index: AQHWfINAnoKBzQpz30W83mcBiLuV+KlMG9NA
Date: Thu, 27 Aug 2020 15:58:02 +0000
Message-ID: <e5cb22d53c7c4ebea92443b8b6d86e88@AcuMS.aculab.com>
References: <20200827150030.282762-1-hch@lst.de>
 <20200827150030.282762-2-hch@lst.de>
In-Reply-To: <20200827150030.282762-2-hch@lst.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: aculab.com
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
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Kees Cook <keescook@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christoph Hellwig
> Sent: 27 August 2020 16:00
>=20
> Don't allow calling ->read or ->write with set_fs as a preparation for
> killing off set_fs.  All the instances that we use kernel_read/write on
> are using the iter ops already.
>=20
> If a file has both the regular ->read/->write methods and the iter
> variants those could have different semantics for messed up enough
> drivers.  Also fails the kernel access to them in that case.

Is there a real justification for that?
For system calls supplying both methods makes sense to avoid
the extra code paths for a simple read/write.

Any one stupid enough to make them behave differently gets
what they deserve.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

