Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DCE2FF251
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 18:47:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DM8wg092CzDrNy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 04:47:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DM8tD3rbmzDqQ3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 04:45:06 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id uk-mta-7-70jJZbebO02FvmwaO8iuwQ-1;
 Thu, 21 Jan 2021 17:44:57 +0000
X-MC-Unique: 70jJZbebO02FvmwaO8iuwQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 21 Jan 2021 17:44:55 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 21 Jan 2021 17:44:55 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: RE: [PATCH 02/13] module: add a module_loaded helper
Thread-Topic: [PATCH 02/13] module: add a module_loaded helper
Thread-Index: AQHW8BhvE0+Qt/OaHkK/jwqI2nu4BKoyViXg
Date: Thu, 21 Jan 2021 17:44:55 +0000
Message-ID: <8d59f11971764db2a104c87937e1d3ab@AcuMS.aculab.com>
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-3-hch@lst.de>
 <844a7fc3-2cba-46d2-fd4e-e5fe16b08573@csgroup.eu>
 <20210121171119.GA29916@lst.de>
In-Reply-To: <20210121171119.GA29916@lst.de>
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
Cc: Petr Mladek <pmladek@suse.com>, Michal Marek <michal.lkml@markovi.net>,
 Andrew Donnellan <ajd@linux.ibm.com>, Jessica Yu <jeyu@kernel.org>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Masahiro
 Yamada <masahiroy@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>=20
> On Thu, Jan 21, 2021 at 11:00:20AM +0100, Christophe Leroy wrote:
> > > +bool module_loaded(const char *name);
> >
> > Maybe module_is_loaded() would be a better name.
>=20
> Fine with me.

It does look like both callers aren't 'unsafe'.
But it is a bit strange returning a stale value.

It did make be look a bit more deeply at try_module_get().
For THIS_MODULE (eg to get an extra reference for a kthread)
I doubt it can ever fail.

But the other cases require a 'module' structure be passed in.
ISTM that unloading the module could invalidate the pointer
that has just been read from some other structure.

I'm guessing that some other lock must always be held.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

