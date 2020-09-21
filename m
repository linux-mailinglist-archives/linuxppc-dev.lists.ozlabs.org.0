Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 777A2272B98
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 18:19:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw8lV2l3PzDqWn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 02:19:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw7Zz1NwbzDqHr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 01:26:48 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-128-o9XrdwUZOBmYoiJUKH50rg-1; Mon, 21 Sep 2020 16:26:37 +0100
X-MC-Unique: o9XrdwUZOBmYoiJUKH50rg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 21 Sep 2020 16:26:35 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 21 Sep 2020 16:26:35 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Al Viro' <viro@zeniv.linux.org.uk>
Subject: RE: [PATCH 04/11] iov_iter: explicitly check for CHECK_IOVEC_ONLY in
 rw_copy_check_uvector
Thread-Topic: [PATCH 04/11] iov_iter: explicitly check for CHECK_IOVEC_ONLY in
 rw_copy_check_uvector
Thread-Index: AQHWkCRT6PkpgoAV6EexsDeYdekosqlzL1uQ///yg4CAABQ90A==
Date: Mon, 21 Sep 2020 15:26:35 +0000
Message-ID: <99515e866c3e4e9c8140795352a62704@AcuMS.aculab.com>
References: <20200921143434.707844-1-hch@lst.de>
 <20200921143434.707844-5-hch@lst.de>
 <7336624280b8444fb4cb00407317741b@AcuMS.aculab.com>
 <20200921151119.GU3421308@ZenIV.linux.org.uk>
In-Reply-To: <20200921151119.GU3421308@ZenIV.linux.org.uk>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
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
Cc: "linux-aio@kvack.org" <linux-aio@kvack.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 'Christoph Hellwig' <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Al Viro
> Sent: 21 September 2020 16:11
> On Mon, Sep 21, 2020 at 03:05:32PM +0000, David Laight wrote:
>=20
> > I've actually no idea:
> > 1) Why there is an access_ok() check here.
> >    It will be repeated by the user copy functions.
>=20
> Early sanity check.
>=20
> > 2) Why it isn't done when called from mm/process_vm_access.c.
> >    Ok, the addresses refer to a different process, but they
> >    must still be valid user addresses.
> >
> > Is 2 a legacy from when access_ok() actually checked that the
> > addresses were mapped into the process's address space?
>=20
> It never did.  2 is for the situation when a 32bit process
> accesses 64bit one; addresses that are perfectly legitimate
> for 64bit userland (and fitting into the first 4Gb of address
> space, so they can be represented by 32bit pointers just fine)
> might be rejected by access_ok() if the caller is 32bit.

Can't 32 bit processes on a 64bit system access all the way to 4GB?
Mapping things by default above 3GB will probably break things.
But there is no reason to disallow explicit maps.
And in any case access_ok() can use the same limit as it does for
64bit processes - the page fault handler will sort it all out.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

