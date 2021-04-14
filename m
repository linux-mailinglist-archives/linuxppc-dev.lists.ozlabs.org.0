Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5440A35FD7E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 23:58:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLGZ71tFrz3bym
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 07:58:23 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLGYm2k9Bz2xZM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 07:58:04 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mtapsc-4-PsdLgvNoPOivxmwyvxbtWw-1; Wed, 14 Apr 2021 22:56:40 +0100
X-MC-Unique: PsdLgvNoPOivxmwyvxbtWw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 14 Apr 2021 22:56:39 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Wed, 14 Apr 2021 22:56:39 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Matthew Wilcox' <willy@infradead.org>, Jesper Dangaard Brouer
 <brouer@redhat.com>
Subject: RE: [PATCH 1/1] mm: Fix struct page layout on 32-bit systems
Thread-Topic: [PATCH 1/1] mm: Fix struct page layout on 32-bit systems
Thread-Index: AQHXMXYmwdfrgigLI0exh4xFUSZq9Kq0jZ3g
Date: Wed, 14 Apr 2021 21:56:39 +0000
Message-ID: <a50c3156fe8943ef964db4345344862f@AcuMS.aculab.com>
References: <20210410205246.507048-1-willy@infradead.org>
 <20210410205246.507048-2-willy@infradead.org>
 <20210411114307.5087f958@carbon>
 <20210411103318.GC2531743@casper.infradead.org>
 <20210412011532.GG2531743@casper.infradead.org>
 <20210414101044.19da09df@carbon>
 <20210414115052.GS2531743@casper.infradead.org>
 <20210414211322.3799afd4@carbon>
 <20210414213556.GY2531743@casper.infradead.org>
In-Reply-To: <20210414213556.GY2531743@casper.infradead.org>
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Matteo Croce <mcroce@linux.microsoft.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Christoph
 Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Matthew Wilcox
> Sent: 14 April 2021 22:36
>=20
> On Wed, Apr 14, 2021 at 09:13:22PM +0200, Jesper Dangaard Brouer wrote:
> > (If others want to reproduce).  First I could not reproduce on ARM32.
> > Then I found out that enabling CONFIG_XEN on ARCH=3Darm was needed to
> > cause the issue by enabling CONFIG_ARCH_DMA_ADDR_T_64BIT.
>=20
> hmmm ... you should be able to provoke it by enabling ARM_LPAE,
> which selects PHYS_ADDR_T_64BIT, and
>=20
> config ARCH_DMA_ADDR_T_64BIT
>         def_bool 64BIT || PHYS_ADDR_T_64BIT
>=20
> >  struct page {
> >         long unsigned int          flags;                /*     0     4=
 */
> >
> >         /* XXX 4 bytes hole, try to pack */
> >
> >         union {
> >                 struct {
> >                         struct list_head lru;            /*     8     8=
 */
> >                         struct address_space * mapping;  /*    16     4=
 */
> >                         long unsigned int index;         /*    20     4=
 */
> >                         long unsigned int private;       /*    24     4=
 */
> >                 };                                       /*     8    20=
 */
> >                 struct {
> >                         dma_addr_t dma_addr

Adding __packed here will remove the 4 byte hole before the union
and the compiler seems clever enough to know that anything following
a 'long' must also be 'long' aligned.
So you don't get anything horrid like byte accesses.
On 64bit dma_addr will remain 64bit aligned.
On arm32 dma_addr will be 32bit aligned - but forcing two 32bit access
won't make any difference.

So definitely the only simple fix.

=09David

> >                                            ;             /*     8     8=
 */
> >                 };                                       /*     8     8=
 */
> [...]
> >         } __attribute__((__aligned__(8)));               /*     8    24=
 */
> >         union {
> >                 atomic_t           _mapcount;            /*    32     4=
 */
> >                 unsigned int       page_type;            /*    32     4=
 */
> >                 unsigned int       active;               /*    32     4=
 */
> >                 int                units;                /*    32     4=
 */
> >         };                                               /*    32     4=
 */
> >         atomic_t                   _refcount;            /*    36     4=
 */
> >
> >         /* size: 40, cachelines: 1, members: 4 */
> >         /* sum members: 36, holes: 1, sum holes: 4 */
> >         /* forced alignments: 1, forced holes: 1, sum forced holes: 4 *=
/
> >         /* last cacheline: 40 bytes */
> > } __attribute__((__aligned__(8)));
>=20
> If you also enable CONFIG_MEMCG or enough options to make
> LAST_CPUPID_NOT_IN_PAGE_FLAGS true, you'll end up with another 4-byte
> hole at the end.

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

