Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED912DFE22
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 17:43:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D04zw1rmCzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 03:43:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D04yN3cstzDqN9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Dec 2020 03:42:34 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mtapsc-5-b9x0mQY4PWebkGD87-Qp8A-1; Mon, 21 Dec 2020 16:42:26 +0000
X-MC-Unique: b9x0mQY4PWebkGD87-Qp8A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 21 Dec 2020 16:42:23 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 21 Dec 2020 16:42:23 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: RE: [PATCH] powerpc:Don't print raw EIP/LR hex values in dump_stack()
 and show_regs()
Thread-Topic: [PATCH] powerpc:Don't print raw EIP/LR hex values in
 dump_stack() and show_regs()
Thread-Index: AQHW17dukx+1atuJ10yi7rVw0MWNE6oBwFGw
Date: Mon, 21 Dec 2020 16:42:23 +0000
Message-ID: <ad814ccf34c14c76b45e50b6e7741c3a@AcuMS.aculab.com>
References: <20201221032758.12143-1-nixiaoming@huawei.com>
 <2279fc96-1f10-0c3f-64d9-734f18758620@csgroup.eu>
 <20201221163130.GZ2672@gate.crashing.org>
In-Reply-To: <20201221163130.GZ2672@gate.crashing.org>
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
Cc: "ravi.bangoria@linux.ibm.com" <ravi.bangoria@linux.ibm.com>,
 "mikey@neuling.org" <mikey@neuling.org>,
 "yanaijie@huawei.com" <yanaijie@huawei.com>,
 "wangle6@huawei.com" <wangle6@huawei.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "haren@linux.ibm.com" <haren@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "npiggin@gmail.com" <npiggin@gmail.com>, "paulus@samba.org" <paulus@samba.org>,
 "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 Xiaoming Ni <nixiaoming@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Segher Boessenkool
> Sent: 21 December 2020 16:32
>=20
> On Mon, Dec 21, 2020 at 04:17:21PM +0100, Christophe Leroy wrote:
> > Le 21/12/2020 =C3=A0 04:27, Xiaoming Ni a =C3=A9crit=C2=A0:
> > >Since the commit 2b0e86cc5de6 ("powerpc/fsl_booke/32: implement KASLR
> > >infrastructure"), the powerpc system is ready to support KASLR.
> > >To reduces the risk of invalidating address randomization, don't print=
 the
> > >EIP/LR hex values in dump_stack() and show_regs().
>=20
> > I think your change is not enough to hide EIP address, see below a dump
> > with you patch, you get "Faulting instruction address: 0xc03a0c14"
>=20
> As far as I can see the patch does nothing to the GPR printout.  Often
> GPRs contain code addresses.  As one example, the LR is moved via a GPR
> (often GPR0, but not always) for storing on the stack.
>=20
> So this needs more work.

If the dump_stack() is from an oops you need the real EIP value
on order to stand any chance of making headway.

Otherwise you might just as well just print 'borked - tough luck'.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

