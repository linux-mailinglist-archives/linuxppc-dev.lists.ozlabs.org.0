Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E642B3694FD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 16:42:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRcTL60Gzz3br4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Apr 2021 00:42:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.85.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRcT12tvZz2xZH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Apr 2021 00:42:28 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-284-PmE_EISXMrO369CsnbPo2Q-1; Fri, 23 Apr 2021 15:42:22 +0100
X-MC-Unique: PmE_EISXMrO369CsnbPo2Q-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Fri, 23 Apr 2021 15:42:21 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Fri, 23 Apr 2021 15:42:21 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Michael Ellerman' <mpe@ellerman.id.au>, Daniel Axtens <dja@axtens.net>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, "robh@kernel.org"
 <robh@kernel.org>, "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Subject: RE: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
Thread-Topic: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
Thread-Index: AQHXOEeqL6Jjg9Iqf02Ssp9xJukHBarCLKqw
Date: Fri, 23 Apr 2021 14:42:21 +0000
Message-ID: <3a6b9c56f81e47d08e6bf70d8222725f@AcuMS.aculab.com>
References: <20210415191437.20212-1-nramas@linux.microsoft.com>
 <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
 <87eefag241.fsf@linkitivity.dja.id.au>
 <87r1j3ys8i.fsf@dja-thinkpad.axtens.net> <875z0daz46.fsf@mpe.ellerman.id.au>
In-Reply-To: <875z0daz46.fsf@mpe.ellerman.id.au>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "bauerman@linux.ibm.com" <bauerman@linux.ibm.com>,
 "lkp@intel.com" <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman
> Sent: 23 April 2021 14:51
...
> > (Does anyone - and by anyone I mean any large distro - compile with
> > local variables inited by the compiler?)
>=20
> This is where I say, "yes, Android" and you say "ugh no I meant a real
> distro", and I say "well ...".
>=20
> But yeah doesn't help us much.

And it doesn't seem to stop my phone crashing either :-)

Of course, I've absolutely no way of finding out where it is crashing.
Nor where the massive memory leaks are that means it need rebooting
every few days.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

