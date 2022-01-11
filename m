Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5744248AAD9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 10:52:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JY5bR28B1z3cRg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 20:52:51 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JY5Zy5Dbfz3bdG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 20:52:25 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-405-rXUlX-ehMDyIXirCKi7aCg-1; Tue, 11 Jan 2022 09:52:18 +0000
X-MC-Unique: rXUlX-ehMDyIXirCKi7aCg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.26; Tue, 11 Jan 2022 09:52:18 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.026; Tue, 11 Jan 2022 09:52:17 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>
Subject: RE: [PATCH 5/5] compat: consolidate the compat_flock{,64} definition
Thread-Topic: [PATCH 5/5] compat: consolidate the compat_flock{, 64} definition
Thread-Index: AQHYBsZBTBglXUWeOki+cPQc77mslqxdkbpw
Date: Tue, 11 Jan 2022 09:52:17 +0000
Message-ID: <f69d570127db4f78a6b30e1775a020c4@AcuMS.aculab.com>
References: <20220111083515.502308-1-hch@lst.de>
 <20220111083515.502308-6-hch@lst.de>
In-Reply-To: <20220111083515.502308-6-hch@lst.de>
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
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christoph Hellwig
> Sent: 11 January 2022 08:35
>=20
> Provide a single common definition for the compat_flock and
> compat_flock64 structures using the same tricks as for the native
> variants.  Another extra define is added for the packing required on
> x86.
>=20
...
>  /*
> - * IA32 uses 4 byte alignment for 64 bit quantities,
> - * so we need to pack this structure.
> + * IA32 uses 4 byte alignment for 64 bit quantities, so we need to pack =
the
> + * compat flock64 structure.
>   */
...
> +#define __ARCH_NEED_COMPAT_FLOCK64_PACKED

Maybe:
#define __ARCH_COMPAT_FLOCK64_ATTR (packed),(aligned(4)

...
Delete this bit:
> +#ifdef __ARCH_NEED_COMPAT_FLOCK64_PACKED
> +#define __ARCH_COMPAT_FLOCK64_PACK=09__attribute__((packed))
> +#else
> +#define __ARCH_COMPAT_FLOCK64_PACK
> +#endif
...
> +struct compat_flock64 {
> +=09short=09=09l_type;
> +=09short=09=09l_whence;
> +=09compat_loff_t=09l_start;
> +=09compat_loff_t=09l_len;
> +=09compat_pid_t=09l_pid;
> +#ifdef __ARCH_COMPAT_FLOCK64_PAD
> +=09__ARCH_COMPAT_FLOCK64_PAD
> +#endif
> +} __ARCH_COMPAT_FLOCK64_PACK;

then:
#ifdef __ARCH_COMPAT_FLOCK64_ATTR
} __attribute__(__ARCH_COMPAT_FLOCK64_ATTR);
#else
};
#endif

Makes it a bit more like the xxx_PAD bits.
Although the trailing ; does cause a bit of grief.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

