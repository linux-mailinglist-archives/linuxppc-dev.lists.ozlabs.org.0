Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A272F245FBD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 10:25:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVRtw4pC7zDqQj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 18:25:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=207.82.80.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVRrT4vgHzDqPf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:23:19 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-180-lNRQs7-OMBKEt5epJ5rllg-1; Mon, 17 Aug 2020 09:23:12 +0100
X-MC-Unique: lNRQs7-OMBKEt5epJ5rllg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 17 Aug 2020 09:23:11 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 17 Aug 2020 09:23:11 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Michael Ellerman <mpe@ellerman.id.au>, "x86@kernel.org" <x86@kernel.org>
Subject: RE: [PATCH 09/11] x86: remove address space overrides using set_fs()
Thread-Topic: [PATCH 09/11] x86: remove address space overrides using set_fs()
Thread-Index: AQHWdGicIkTuqnSld0yWphpVxhe9Oqk79IHw
Date: Mon, 17 Aug 2020 08:23:11 +0000
Message-ID: <935d551809894d14965e430e05d21057@AcuMS.aculab.com>
References: <20200817073212.830069-1-hch@lst.de>
 <20200817073212.830069-10-hch@lst.de>
In-Reply-To: <20200817073212.830069-10-hch@lst.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: aculab.com
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
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Kees Cook <keescook@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christoph Hellwig
> Sent: 17 August 2020 08:32
>
> Stop providing the possibility to override the address space using
> set_fs() now that there is no need for that any more.  To properly
> handle the TASK_SIZE_MAX checking for 4 vs 5-level page tables on
> x86 a new alternative is introduced, which just like the one in
> entry_64.S has to use the hardcoded virtual address bits to escape
> the fact that TASK_SIZE_MAX isn't actually a constant when 5-level
> page tables are enabled.
....
> @@ -93,7 +69,7 @@ static inline bool pagefault_disabled(void);
>  #define access_ok(addr, size)=09=09=09=09=09\
>  ({=09=09=09=09=09=09=09=09=09\
>  =09WARN_ON_IN_IRQ();=09=09=09=09=09=09\
> -=09likely(!__range_not_ok(addr, size, user_addr_max()));=09=09\
> +=09likely(!__range_not_ok(addr, size, TASK_SIZE_MAX));=09=09\
>  })

Can't that always compare against a constant even when 5-levl
page tables are enabled on x86-64?

On x86-64 it can (probably) reduce to (addr | (addr + size)) < 0.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

