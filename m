Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 272274AF457
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 15:45:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jv2k96QsJz3cR0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 01:45:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jv2jh1Pyrz2x9Z
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 01:45:25 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-242-qivUEKu-Nx-csT-ffmbl5A-1; Wed, 09 Feb 2022 14:45:19 +0000
X-MC-Unique: qivUEKu-Nx-csT-ffmbl5A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Wed, 9 Feb 2022 14:45:18 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Wed, 9 Feb 2022 14:45:18 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'David T-G' <davidtg+robot@justpickone.org>, "linux-raid@vger.kernel.org"
 <linux-raid@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] lib/raid6/test/Makefile: Use `$(pound)` instead of
 `\#` for Make 4.3
Thread-Topic: [PATCH v2 1/2] lib/raid6/test/Makefile: Use `$(pound)` instead
 of `\#` for Make 4.3
Thread-Index: AQHYHbrjaaGrMTB3M0ipeBb59E9eX6yLST5A
Date: Wed, 9 Feb 2022 14:45:18 +0000
Message-ID: <6879dfb9fd594925b348fbbbf0051670@AcuMS.aculab.com>
References: <20220208152148.48534-1-pmenzel@molgen.mpg.de>
 <d07a9d41-5a8f-a1f3-59f7-d2a75d6df2e5@youngman.org.uk>
 <20220209134139.GA4455@justpickone.org>
In-Reply-To: <20220209134139.GA4455@justpickone.org>
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David T-G
> Sent: 09 February 2022 13:42
>=20
> ...and then Wols Lists said...
> %
> % On 08/02/2022 15:21, Paul Menzel wrote:
> ...
> %
> % As commented elsewhere, for the sake of us ENGLISH speakers,
> % *PLEASE* make that $(hash). A pound sign is =C2=A3.
>=20
> Or, even better, $(octothorpe) since that's merely a symbol rather than a
> food product or a result of an algorithm on data.  You might even hope
> that we hash this out eventually ...

I was more worried that people might think we should smoke the hash.

The # symbol called 'hash' in the UK. Can't remember why - but it is used
to mean 'number'.

'octothorpe' is some brain-damaged name and should be shot^Werased on sight=
.

The whole UK v US confusion about what a 'pound' sign looks like almost
certainly led to UK ascii using the =C2=A3 glyph for 0x23.
I can imaging a phone call where a US person said '0x23 is the pound sign'.

I remember problems with ascii peripherals on a ebcdic mainframe where
=C2=A3 $ # and \ had to get squeezed into the three available codes.
Not only was in semi-random what a line printer might print,
we had 'page mode' terminals where the input and output translation
tables didn't always match.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

