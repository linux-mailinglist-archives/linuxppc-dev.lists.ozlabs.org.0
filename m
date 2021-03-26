Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C987834ACBE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 17:45:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6SWg5xLrz3c7k
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 03:45:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6SWH55rxz300V
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 03:44:58 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-213-YTy4IFWENUi9fJgzzqBpKg-2; Fri, 26 Mar 2021 16:44:49 +0000
X-MC-Unique: YTy4IFWENUi9fJgzzqBpKg-2
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 16:44:48 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Fri, 26 Mar 2021 16:44:48 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Al Viro' <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>
Subject: RE: [PATCH 3/4] exec: simplify the compat syscall handling
Thread-Topic: [PATCH 3/4] exec: simplify the compat syscall handling
Thread-Index: AQHXIlr1GfPxLRNSxkCVNQRYzf6AcKqWeGLg
Date: Fri, 26 Mar 2021 16:44:48 +0000
Message-ID: <da94e124fad244459fe3431077c7ffa8@AcuMS.aculab.com>
References: <20210326143831.1550030-1-hch@lst.de>
 <20210326143831.1550030-4-hch@lst.de>
 <YF4H58gozyNkoCeO@zeniv-ca.linux.org.uk>
In-Reply-To: <YF4H58gozyNkoCeO@zeniv-ca.linux.org.uk>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Brian Gerst <brgerst@gmail.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Al Viro
> Sent: 26 March 2021 16:12
>=20
> On Fri, Mar 26, 2021 at 03:38:30PM +0100, Christoph Hellwig wrote:
>=20
> > +static const char __user *
> > +get_user_arg_ptr(const char __user *const __user *argv, int nr)
> >  {
> > +=09if (in_compat_syscall()) {
> > +=09=09const compat_uptr_t __user *compat_argv =3D
> > +=09=09=09compat_ptr((unsigned long)argv);
> >  =09=09compat_uptr_t compat;
> >
> > +=09=09if (get_user(compat, compat_argv + nr))
> >  =09=09=09return ERR_PTR(-EFAULT);
> >  =09=09return compat_ptr(compat);
> > +=09} else {
> > +=09=09const char __user *native;
> >
> > +=09=09if (get_user(native, argv + nr))
> > +=09=09=09return ERR_PTR(-EFAULT);
> > +=09=09return native;
> > +=09}
> >  }
>=20
> Yecchhh....  So you have in_compat_syscall() called again and again, for
> each argument in the list?  I agree that current version is fucking ugly,
> but I really hate that approach ;-/

Especially since in_compat_syscall() isn't entirely trivial on x86-64.
Probably all in the noise for 'exec', but all the bits do add up.

You may not want separate get_user() on some architectures either.
The user_access_begin/end aren't cheap.

OTOH if you call copy_from_user() you get hit by the stupid
additional costs of 'user copy hardening'.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

