Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1070471522
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 18:55:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JBFn64wqTz3dbg
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 04:55:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.85.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 67 seconds by postgrey-1.36 at boromir;
 Sun, 12 Dec 2021 04:55:04 AEDT
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JBFm80y5rz3cTy
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Dec 2021 04:55:03 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-14-gpculCQTMuGutzfqbGQ0WA-1; Sat, 11 Dec 2021 17:53:47 +0000
X-MC-Unique: gpculCQTMuGutzfqbGQ0WA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.26; Sat, 11 Dec 2021 17:53:46 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.026; Sat, 11 Dec 2021 17:53:46 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Tiezhu Yang' <yangtiezhu@loongson.cn>, Dave Young <dyoung@redhat.com>,
 Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: RE: [PATCH v2 0/2] kdump: simplify code
Thread-Topic: [PATCH v2 0/2] kdump: simplify code
Thread-Index: AQHX7j/jzYqw5kMpA0qY43nH0kUm2Kwtku5w
Date: Sat, 11 Dec 2021 17:53:46 +0000
Message-ID: <0c5cb37139af4f3e85cc2c5115d7d006@AcuMS.aculab.com>
References: <1639193588-7027-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1639193588-7027-1-git-send-email-yangtiezhu@loongson.cn>
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Xuefeng Li <lixuefeng@loongson.cn>, "x86@kernel.org" <x86@kernel.org>,
 "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Tiezhu Yang
> Sent: 11 December 2021 03:33
>=20
> v2:
>   -- add copy_to_user_or_kernel() in lib/usercopy.c
>   -- define userbuf as bool type

Instead of having a flag to indicate whether the buffer is user or kernel,
would it be better to have two separate buffer pointers.
One for a user space buffer, the other for a kernel space buffer.
Exactly one of the buffers should always be NULL.

That way the flag is never incorrectly set.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

