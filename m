Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBD04C633E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 07:40:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6W3X7478z3bVC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 17:40:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6W330qW5z2xWd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 17:40:13 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-127-ln2z8qc2NY6O0etIBpyffg-1; Mon, 28 Feb 2022 06:40:07 +0000
X-MC-Unique: ln2z8qc2NY6O0etIBpyffg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 06:40:04 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Mon, 28 Feb 2022 06:40:04 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'guoren@kernel.org'" <guoren@kernel.org>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "arnd@arndb.de" <arnd@arndb.de>, "anup@brainfault.org"
 <anup@brainfault.org>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "liush@allwinnertech.com"
 <liush@allwinnertech.com>, "wefu@redhat.com" <wefu@redhat.com>,
 "drew@beagleboard.org" <drew@beagleboard.org>, "wangjunqiang@iscas.ac.cn"
 <wangjunqiang@iscas.ac.cn>, "hch@lst.de" <hch@lst.de>
Subject: RE: [PATCH V7 03/20] compat: consolidate the compat_flock{,64}
 definition
Thread-Topic: [PATCH V7 03/20] compat: consolidate the compat_flock{,64}
 definition
Thread-Index: AQHYK/ctkLOBFN5NzkqkonsQCyvC26yogbZg
Date: Mon, 28 Feb 2022 06:40:04 +0000
Message-ID: <b8e765910e274c0fb574ff23f88b881c@AcuMS.aculab.com>
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-4-guoren@kernel.org>
In-Reply-To: <20220227162831.674483-4-guoren@kernel.org>
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
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: guoren@kernel.org
> Sent: 27 February 2022 16:28
>=20
> From: Christoph Hellwig <hch@lst.de>
>=20
> Provide a single common definition for the compat_flock and
> compat_flock64 structures using the same tricks as for the native
> variants.  Another extra define is added for the packing required on
> x86.
...
> diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.=
h
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
>=20
>  struct compat_statfs {
>  =09int=09=09f_type;
> diff --git a/include/linux/compat.h b/include/linux/compat.h
> index 1c758b0e0359..a0481fe6c5d5 100644
> --- a/include/linux/compat.h
> +++ b/include/linux/compat.h
> @@ -258,6 +258,37 @@ struct compat_rlimit {
>  =09compat_ulong_t=09rlim_max;
>  };
>=20
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
> +

Provided compat_loff_t are correctly defined with __aligned__(4)
marking the structure packed isn't needed.
I believe compat_u64 and compat_s64 both have aligned(4).
It is also wrong, consider:

struct foo {
=09char x;
=09struct compat_flock64 fl64;
};

There should be 3 bytes of padding after 'x'.
But you've removed it.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

