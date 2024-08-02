Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 988DA9459A9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 10:11:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lists.ozlabs.org;
	s=201707; t=1722586289;
	bh=CuMgTyhRiXFGu/Wk31+CzmYjkWa9oQ3VXwtvzg+PBI0=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=XGd9Wr0YSEnP76Dk6uE5IZt/9aAjfLJlolCEXLf3CqisQJ/PRI/treiP42eLyf8ba
	 Qv08B19A1J7gcU7Tt7F7l7mn5HhDj2L31aQkjJYVfpEafdxY0G0NM2ioj/IdrT/1tI
	 WrfWblDwkRo2yU7XnprGYaXh4GenuiYJPKJbqr5U34esOXTf4pwgPaDW4RIzDao79q
	 8Spgf6fcunMVlyld0+BY4+vBJjGZa9+c+v/s944KGygHS0rnRqNCmoMe5DxJ8a935W
	 QRtY+i+Ls1kHimH+hJTWA+G+VuXZY+Wu4kKQ3kq36r44+lnTygCsZlwMY8ZAnmxsOl
	 Zm7IQOVUvvNeQ==
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZz7P3yqCz3dTM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 18:11:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZz6g2lFXz3cW4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 18:10:49 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-80-s7rDkYwSMoizWbYGjzwnMg-1; Fri, 02 Aug 2024 09:10:42 +0100
X-MC-Unique: s7rDkYwSMoizWbYGjzwnMg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 2 Aug
 2024 09:10:02 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 2 Aug 2024 09:10:02 +0100
To: 'Simon Horman' <horms@kernel.org>, Herve Codina <herve.codina@bootlin.com>
Subject: RE: [PATCH net v1] net: wan: fsl_qmc_hdlc: Discard received CRC
Thread-Topic: [PATCH net v1] net: wan: fsl_qmc_hdlc: Discard received CRC
Thread-Index: AQHa4yXTTA/3x7b/50KM7uMtkj8Gw7ITnhqw
Date: Fri, 2 Aug 2024 08:10:02 +0000
Message-ID: <7659191688194f099cba22cc367c4eda@AcuMS.aculab.com>
References: <20240730063133.179598-1-herve.codina@bootlin.com>
 <20240731084443.GL1967603@kernel.org>
In-Reply-To: <20240731084443.GL1967603@kernel.org>
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
From: David Laight via Linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Reply-To: David Laight <David.Laight@ACULAB.COM>
Cc: Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Eric Dumazet <edumazet@google.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Simon Horman
> Sent: 31 July 2024 09:45
>=20
> On Tue, Jul 30, 2024 at 08:31:33AM +0200, Herve Codina wrote:
> > Received frame from QMC contains the CRC.
> > Upper layers don't need this CRC and tcpdump mentioned trailing junk
> > data due to this CRC presence.
> >
> > As some other HDLC driver, simply discard this CRC.
>=20
> It might be nice to specifically site an example.
> But yes, I see this pattern in hdlc_rx_done().

Pretty much the only reason you'd want the received CRC is to do
error recovery assuming a single short error burst.
Not that I've ever seen a driver contain the required code.
'Back of envelope' calculation: 32bit crc, 2kbyte frame, so 18bits
of crc per data bit, sqrt for 'birthday paradox' - I bet you can
recover 8-bit error bursts.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

