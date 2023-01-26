Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CB767D336
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 18:31:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2nnf53wsz3fHc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 04:31:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2nn25R0Xz3fBf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 04:31:17 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-76-f12lco4sMJ-UFDGfrgpghw-1; Thu, 26 Jan 2023 17:31:11 +0000
X-MC-Unique: f12lco4sMJ-UFDGfrgpghw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.45; Thu, 26 Jan
 2023 17:31:09 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.045; Thu, 26 Jan 2023 17:31:09 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: RE: [PATCH v4 02/24] powerpc/pseries: Fix alignment of PLPKS
 structures and buffers
Thread-Topic: [PATCH v4 02/24] powerpc/pseries: Fix alignment of PLPKS
 structures and buffers
Thread-Index: AQHZMarbHHGSrma/kEeRKp/dNdgk5K6w84Ew
Date: Thu, 26 Jan 2023 17:31:09 +0000
Message-ID: <5118edd7f1f445afa1812d2b9b62dd4f@AcuMS.aculab.com>
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
 <20230120074306.1326298-3-ajd@linux.ibm.com>
 <87pmb2pxpa.fsf@mpe.ellerman.id.au>
 <20230126171925.GN25951@gate.crashing.org>
In-Reply-To: <20230126171925.GN25951@gate.crashing.org>
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
Cc: "sudhakar@linux.ibm.com" <sudhakar@linux.ibm.com>, "bgray@linux.ibm.com" <bgray@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, "erichte@linux.ibm.com" <erichte@linux.ibm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "nayna@linux.ibm.com" <nayna@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "zohar@linux.ibm.com" <zohar@linux.ibm.com>, "gjoyce@linux.ibm.com" <gjoyce@linux.ibm.com>, "joel@jms.id.au" <joel@jms.id.au>, "ruscur@russell.cc" <ruscur@russell.cc>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, "gcwilson@linux.ibm.com" <gcwilson@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Segher Boessenkool
> Sent: 26 January 2023 17:19
>=20
> On Thu, Jan 26, 2023 at 12:09:53AM +1100, Michael Ellerman wrote:
> > Andrew Donnellan <ajd@linux.ibm.com> writes:
> > > A number of structures and buffers passed to PKS hcalls have alignmen=
t
> > > requirements, which could on occasion cause problems:
> > >
> > > - Authorisation structures must be 16-byte aligned and must not cross=
 a
> > >   page boundary
> > >
> > > - Label structures must not cross page boundaries
> > >
> > > - Password output buffers must not cross page boundaries
> > >
> > > Round up the allocations of these structures/buffers to the next powe=
r of
> > > 2 to make sure this happens.
> >
> > It's not the *next* power of 2, it's the *nearest* power of 2, includin=
g
> > the initial value if it's already a power of 2.
>=20
> It's not the nearest either, the nearest power of two to 65 is 64.  You
> could say "but, round up" to which I would say "round?"  :-P
>=20
> "Adjust the allocation size to be the smallest power of two greater than
> or equal to the given size."
>=20
> "Pad to a power of two" in shorthand.  "Padded to a power of two if
> necessary" if you want to emphasise it can be a no-op.

Changing the size to kzalloc() doesn't help.
The alignment depends on the allocator and is only required to have
a relatively small alignment (ARCH_MINALIGN?) regardless of the size.

IIRC one of the allocators adds a small header to every item.
It won't return 16 byte aligned items at all.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

