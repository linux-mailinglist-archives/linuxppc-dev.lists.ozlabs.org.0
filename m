Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B251638A883
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 12:52:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm64t4z32z3bsy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 20:52:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm64R65hQz2yYM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 20:51:49 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-273-SZ-uRtyiMuiGND1F0dV4yw-1; Thu, 20 May 2021 11:51:42 +0100
X-MC-Unique: SZ-uRtyiMuiGND1F0dV4yw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 20 May 2021 11:51:40 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Thu, 20 May 2021 11:51:40 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>, "naveen.n.rao@linux.vnet.ibm.com"
 <naveen.n.rao@linux.vnet.ibm.com>, "jniethe5@gmail.com" <jniethe5@gmail.com>
Subject: RE: [PATCH v1 12/12] powerpc: Replace PPC_INST_NOP by PPC_RAW_NOP()
Thread-Topic: [PATCH v1 12/12] powerpc: Replace PPC_INST_NOP by PPC_RAW_NOP()
Thread-Index: AQHXTWKqsFNaBF2Go0GIp2jNepTo56rsMM/Q
Date: Thu, 20 May 2021 10:51:40 +0000
Message-ID: <30d3299cdf8a49e488834fe0c02d03c0@AcuMS.aculab.com>
References: <5d146b31b943e7ad674894421db4feef54804b9b.1621506159.git.christophe.leroy@csgroup.eu>
 <ad46c195ca1b8572629ef07ba6bfe247585239a6.1621506159.git.christophe.leroy@csgroup.eu>
In-Reply-To: <ad46c195ca1b8572629ef07ba6bfe247585239a6.1621506159.git.christophe.leroy@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy
> Sent: 20 May 2021 11:23
>=20
> On the road to removing all PPC_INST_xx defines in
> asm/ppc-opcodes.h, change PPC_INST_NOP to PPC_RAW_NOP().
...
> @@ -475,7 +474,7 @@
>  #define PPC_RAW_ADD_DOT(t, a, b)=09(PPC_INST_ADD | ___PPC_RT(t) | ___PPC=
_RA(a) | ___PPC_RB(b) | 0x1)
>  #define PPC_RAW_ADDC(t, a, b)=09=09(0x7c000014 | ___PPC_RT(t) | ___PPC_R=
A(a) | ___PPC_RB(b))
>  #define PPC_RAW_ADDC_DOT(t, a, b)=09(0x7c000014 | ___PPC_RT(t) | ___PPC_=
RA(a) | ___PPC_RB(b) | 0x1)
> -#define PPC_RAW_NOP()=09=09=09(PPC_INST_NOP)
> +#define PPC_RAW_NOP()=09=09=09PPC_RAW_ORI(0, 0, 0)

Shouldn't that be PPC_RAW_ORI(_R0, _R0, 0) ?

Also PPC_RAW_ADC_DOT() could be (PPC_RAW_ADC(t, a, b) | 0x1)

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

