Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9AF3388B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 10:31:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxgYy0PdWz3dJ7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 20:31:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 307 seconds by postgrey-1.36 at boromir;
 Fri, 12 Mar 2021 20:31:32 AEDT
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxgYc4JxTz3cK5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 20:31:31 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-246-bXCeiKEdM4OAsnjZn57_UQ-1; Fri, 12 Mar 2021 09:25:02 +0000
X-MC-Unique: bXCeiKEdM4OAsnjZn57_UQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 12 Mar 2021 09:25:01 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Fri, 12 Mar 2021 09:25:01 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Guenter Roeck' <linux@roeck-us.net>, Chris Packham
 <Chris.Packham@alliedtelesis.co.nz>, Wolfram Sang <wsa@kernel.org>
Subject: RE: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXFr5yGwPv8sFHu0aW8iQkc3zyi6qAERyg
Date: Fri, 12 Mar 2021 09:25:01 +0000
Message-ID: <1a7d43e6a16c46cdbe63b497b29ac453@AcuMS.aculab.com>
References: <20210311081842.GA1070@ninjato>
 <94dfa9dc-a80c-98ba-4169-44cce3d810f7@alliedtelesis.co.nz>
 <725c5e51-65df-e17d-e2da-0982efacf2d2@roeck-us.net>
In-Reply-To: <725c5e51-65df-e17d-e2da-0982efacf2d2@roeck-us.net>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Linuxppc-dev Guenter Roeck
> Sent: 11 March 2021 21:35
>=20
> On 3/11/21 1:17 PM, Chris Packham wrote:
> >
> > On 11/03/21 9:18 pm, Wolfram Sang wrote:
> >>> Bummer. What is really weird is that you see clock stretching under
> >>> CPU load. Normally clock stretching is triggered by the device, not
> >>> by the host.
> >> One example: Some hosts need an interrupt per byte to know if they
> >> should send ACK or NACK. If that interrupt is delayed, they stretch th=
e
> >> clock.
> >>
> > It feels like something like that is happening. Looking at the T2080
> > Reference manual there is an interesting timing diagram (Figure 14-2 if
> > someone feels like looking it up). It shows SCL low between the ACK for
> > the address and the data byte. I think if we're delayed in sending the
> > next byte we could violate Ttimeout or Tlow:mext from the SMBUS spec.
> >
>=20
> I think that really leaves you only two options that I can see:
> Rework the driver to handle critical actions (such as setting TXAK,
> and everything else that might result in clock stretching) in the
> interrupt handler, or rework the driver to handle everything in
> a high priority kernel thread.

I'm not sure a high priority kernel thread will help.
Without CONFIG_PREEMPT (which has its own set of nasties)
a RT process won't be scheduled until the processor it last
ran on does a reschedule.
I don't think a kernel thread will be any different from a
user process running under the RT scheduler.

I'm trying to remember the smbus spec (without remembering the I2C one).
While basically a clock+data bit-bang the slave is allowed to drive
the clock low to extend a cycle.
It may be allowed to do this at any point?
The master can generate the data at almost any rate (below the maximum)
but I don't think it can go down to zero.
But I do remember one of the specs having a timeout.

But I'd have thought the slave should answer the cycle correctly
regardless of any 'random' delays the master adds in.
Unless you are getting away with de-asserting chipselect?

The only implementation I've done is one an FPGA so doesn't have
worry about interrupt latencies.
It doesn't actually support clock stretching; it wasn't in the
code I started from and none of the slaves we need to connect to
ever does it.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

