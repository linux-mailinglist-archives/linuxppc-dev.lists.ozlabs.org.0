Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 193F9367BB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 10:05:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQqjv0qjrz30DH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 18:05:55 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQqjX6PZzz2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 18:05:34 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-144-i8bViBFkNvu_lZID7Y2huA-1; Thu, 22 Apr 2021 09:05:27 +0100
X-MC-Unique: i8bViBFkNvu_lZID7Y2huA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 09:05:27 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Thu, 22 Apr 2021 09:05:27 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Daniel Axtens' <dja@axtens.net>, Lakshmi Ramasubramanian
 <nramas@linux.microsoft.com>, "robh@kernel.org" <robh@kernel.org>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Subject: RE: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
Thread-Topic: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
Thread-Index: AQHXNx40L6Jjg9Iqf02Ssp9xJukHBarALKRw
Date: Thu, 22 Apr 2021 08:05:27 +0000
Message-ID: <3e6b31d92d5042d982daeb989e49299e@AcuMS.aculab.com>
References: <20210415191437.20212-1-nramas@linux.microsoft.com>
 <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
 <87eefag241.fsf@linkitivity.dja.id.au>
 <87r1j3ys8i.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87r1j3ys8i.fsf@dja-thinkpad.axtens.net>
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

From: Daniel Axtens
> Sent: 22 April 2021 03:21
>=20
> > Hi Lakshmi,
> >
> >> On 4/15/21 12:14 PM, Lakshmi Ramasubramanian wrote:
> >>
> >> Sorry - missed copying device-tree and powerpc mailing lists.
> >>
> >>> There are a few "goto out;" statements before the local variable "fdt=
"
> >>> is initialized through the call to of_kexec_alloc_and_setup_fdt() in
> >>> elf64_load(). This will result in an uninitialized "fdt" being passed
> >>> to kvfree() in this function if there is an error before the call to
> >>> of_kexec_alloc_and_setup_fdt().
> >>>
> >>> Initialize the local variable "fdt" to NULL.
> >>>
> > I'm a huge fan of initialising local variables! But I'm struggling to
> > find the code path that will lead to an uninit fdt being returned...
>=20
> OK, so perhaps this was putting it too strongly. I have been bitten
> by uninitialised things enough in C that I may have taken a slightly
> overly-agressive view of fixing them in the source rather than the
> compiler. I do think compiler-level mitigations are better, and I take
> the point that we don't want to defeat compiler checking.
>=20
> (Does anyone - and by anyone I mean any large distro - compile with
> local variables inited by the compiler?)

There are compilers that initialise locals to zero for 'debug' builds
and leave the 'random' for optimised 'release' builds.
Lets not test what we are releasing!

I also think there is a new option to gcc (or clang?) to initialise
on-stack structures and arrays to ensure garbage isn't passed.
That seems to be a horrid performance hit!
Especially in userspace where large stack allocations are almost free.

Any auto-initialise ought to be with a semi-random value
(especially not zero) so that it is never right and doesn't
lead to lazy coding.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

