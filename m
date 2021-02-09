Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C38873151D0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 15:39:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZls90VYMzDsp8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 01:39:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=207.82.80.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZlh0061RzDsn3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 01:31:24 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-288-A_ICKLg_PmetPQrYbE_D-A-1; Tue, 09 Feb 2021 14:31:16 +0000
X-MC-Unique: A_ICKLg_PmetPQrYbE_D-A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 9 Feb 2021 14:31:16 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 9 Feb 2021 14:31:16 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: RE: [PATCH v5 20/22] powerpc/syscall: Avoid storing 'current' in
 another pointer
Thread-Topic: [PATCH v5 20/22] powerpc/syscall: Avoid storing 'current' in
 another pointer
Thread-Index: AQHW/uu6M1m95GjSlEGhmhkEL2m4wKpP4cNQ
Date: Tue, 9 Feb 2021 14:31:16 +0000
Message-ID: <d35cc46eca474b2c9f94a4de269321e7@AcuMS.aculab.com>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <24804747098369ebcdac38970b8f7a1260bdd248.1612796617.git.christophe.leroy@csgroup.eu>
 <1612838134.rvncv9kzls.astroid@bobo.none>
 <20210209135053.GD27854@gate.crashing.org>
In-Reply-To: <20210209135053.GD27854@gate.crashing.org>
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
 "msuchanek@suse.de" <msuchanek@suse.de>, Paul Mackerras <paulus@samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Segher Boessenkool
> Sent: 09 February 2021 13:51
>=20
> On Tue, Feb 09, 2021 at 12:36:20PM +1000, Nicholas Piggin wrote:
> > What if you did this?
>=20
> > +static inline struct task_struct *get_current(void)
> > +{
> > +=09register struct task_struct *task asm ("r2");
> > +
> > +=09return task;
> > +}
>=20
> Local register asm variables are *only* guaranteed to live in that
> register as operands to an asm.  See
>   https://gcc.gnu.org/onlinedocs/gcc/Local-Register-Variables.html#Local-=
Register-Variables
> ("The only supported use" etc.)
>=20
> You can do something like
>=20
> static inline struct task_struct *get_current(void)
> {
> =09register struct task_struct *task asm ("r2");
>=20
> =09asm("" : "+r"(task));
>=20
> =09return task;
> }
>=20
> which makes sure that "task" actually is in r2 at the point of that asm.

If "r2" always contains current (and is never assigned by the compiler)
why not use a global register variable for it?

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

