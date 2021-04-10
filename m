Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C12FD35AE15
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 16:19:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHcZN585gz3c28
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 00:19:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHcZ30ZfWz2ysr
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 00:19:06 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-84-kCKo1-18OZuYsleNdk-yPA-1; Sat, 10 Apr 2021 15:17:06 +0100
X-MC-Unique: kCKo1-18OZuYsleNdk-yPA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Sat, 10 Apr 2021 15:17:05 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Sat, 10 Apr 2021 15:17:05 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Matthew Wilcox' <willy@infradead.org>, kernel test robot <lkp@intel.com>
Subject: RE: Bogus struct page layout on 32-bit
Thread-Topic: Bogus struct page layout on 32-bit
Thread-Index: AQHXLbNopyewSd0HZEaZbqB5fscTXqqtw2Cg
Date: Sat, 10 Apr 2021 14:17:04 +0000
Message-ID: <b9d5b09eaec44334b29241e16b8605d5@AcuMS.aculab.com>
References: <20210409185105.188284-3-willy@infradead.org>
 <202104100656.N7EVvkNZ-lkp@intel.com>
 <20210410024313.GX2531743@casper.infradead.org>
In-Reply-To: <20210410024313.GX2531743@casper.infradead.org>
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
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Matthew Wilcox
> Sent: 10 April 2021 03:43
> On Sat, Apr 10, 2021 at 06:45:35AM +0800, kernel test robot wrote:
> > >> include/linux/mm_types.h:274:1: error: static_assert failed due to r=
equirement
> '__builtin_offsetof(struct page, lru) =3D=3D __builtin_offsetof(struct fo=
lio, lru)' "offsetof(struct page,
> lru) =3D=3D offsetof(struct folio, lru)"
> >    FOLIO_MATCH(lru, lru);
> >    include/linux/mm_types.h:272:2: note: expanded from macro 'FOLIO_MAT=
CH'
> >            static_assert(offsetof(struct page, pg) =3D=3D offsetof(stru=
ct folio, fl))
>=20
> Well, this is interesting.  pahole reports:
>=20
> struct page {
>         long unsigned int          flags;                /*     0     4 *=
/
>         /* XXX 4 bytes hole, try to pack */
>         union {
>                 struct {
>                         struct list_head lru;            /*     8     8 *=
/
> ...
> struct folio {
>         union {
>                 struct {
>                         long unsigned int flags;         /*     0     4 *=
/
>                         struct list_head lru;            /*     4     8 *=
/
>=20
> so this assert has absolutely done its job.
>=20
> But why has this assert triggered?  Why is struct page layout not what
> we thought it was?  Turns out it's the dma_addr added in 2019 by commit
> c25fff7171be ("mm: add dma_addr_t to struct page").  On this particular
> config, it's 64-bit, and ppc32 requires alignment to 64-bit.  So
> the whole union gets moved out by 4 bytes.
>=20
> Unfortunately, we can't just fix this by putting an 'unsigned long pad'
> in front of it.  It still aligns the entire union to 8 bytes, and then
> it skips another 4 bytes after the pad.
>=20
> We can fix it like this ...
>=20
> +++ b/include/linux/mm_types.h
> @@ -96,11 +96,12 @@ struct page {
>                         unsigned long private;
>                 };
>                 struct {        /* page_pool used by netstack */
> +                       unsigned long _page_pool_pad;
>                         /**
>                          * @dma_addr: might require a 64-bit value even o=
n
>                          * 32-bit architectures.
>                          */
> -                       dma_addr_t dma_addr;
> +                       dma_addr_t dma_addr __packed;
>                 };
>                 struct {        /* slab, slob and slub */
>                         union {
>=20
> but I don't know if GCC is smart enough to realise that dma_addr is now
> on an 8 byte boundary and it can use a normal instruction to access it,
> or whether it'll do something daft like use byte loads to access it.

I'm betting it will use byte accesses.
Checked - it does seem to use 4-byte accesses.
(godbolt is rather short of 32 bit compilers...)

>=20
> We could also do:
>=20
> +                       dma_addr_t dma_addr __packed __aligned(sizeof(voi=
d *));

I wonder if __aligned(n) should be defined as
=09__attribute__((packed,aligned(n))
I don't think you ever want the 'unpacked' variant.

But explicitly reducing the alignment of single member is much
better than the habit of marking the structure 'packed'.

(Never mind the habit of adding __packed 'because we don't want
the compiler to add random padding.)

>=20
> and I see pahole, at least sees this correctly:
>=20
>                 struct {
>                         long unsigned int _page_pool_pad; /*     4     4 =
*/
>                         dma_addr_t dma_addr __attribute__((__aligned__(4)=
)); /*     8     8 */
>                 } __attribute__((__packed__)) __attribute__((__aligned__(=
4)));

Is the attribute on the struct an artifact of pahole?
It should just have an alignment of 4 without anything special.

>=20
> This presumably affects any 32-bit architecture with a 64-bit phys_addr_t
> / dma_addr_t.  Advice, please?

Only those where a 64-bit value is 64-bit aligned.
So that excludes x86 (which can have 64-bit dma) but includes sparc32
(which probably doesn't).

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

