Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 553A630AE41
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 18:45:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTwMk0zsrzDr49
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 04:45:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=68.65.122.19;
 helo=mta-09-3.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from MTA-09-3.privateemail.com (mta-09-3.privateemail.com
 [68.65.122.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTwKc0NwrzDqpR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 04:43:45 +1100 (AEDT)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id 9285060059;
 Mon,  1 Feb 2021 12:43:43 -0500 (EST)
Received: from localhost (unknown [10.20.151.223])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id 597586004A;
 Mon,  1 Feb 2021 17:43:43 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "David Laight" <David.Laight@ACULAB.COM>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH v4 02/10] powerpc/signal: Add unsafe_copy_{vsx,
 fpr}_from_user()
Date: Mon, 01 Feb 2021 11:43:48 -0600
Message-Id: <C8YDPJHR942I.3QTOTXFX2270W@geist>
In-Reply-To: <f6234b06ccb54cffb3583f40635636d3@AcuMS.aculab.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Feb 1, 2021 at 11:37 AM CST, David Laight wrote:
> From: Christopher M. Riedl
> > Sent: 01 February 2021 16:55
> ...
> > > > > > +	int i;								\
> > > > > > +									\
> > > > > > +	unsafe_copy_from_user(buf, __f, ELF_NFPREG * sizeof(double),	=
\
> > > > > > +				label);					\
> > > > > > +	for (i =3D 0; i < ELF_NFPREG - 1; i++)				\
> > > > > > +		__t->thread.TS_FPR(i) =3D buf[i];				\
> > > > > > +	__t->thread.fp_state.fpscr =3D buf[i];				\
> > > > > > +} while (0)
> > >
> > > On further reflection, since you immediately loop through the buffer
> > > why not just use user_access_begin() and unsafe_get_user() in the loo=
p.
> >=20
> > Christophe had suggested this a few revisions ago as well. When I tried
> > this approach, the signal handling performance took a pretty big hit:
> > https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-October/219351.htm=
l
> >=20
> > I included some numbers on v3 as well but decided to drop the approach
> > altogether for this one since it just didn't seem worth the hit.
>
> Was that using unsafe_get_user (which relies on user_access_begin()
> having 'opened up' user accesses) or just get_user() that does
> it for every access?
>
> The former should be ok, the latter will be horrid.

It was using unsafe_get_user() whereas unsafe_copy_from_user() will just
call the optimized __copy_tofrom_user() a single time - assuming that
user access is open.

>
> David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes,
> MK1 1PT, UK
> Registration No: 1397386 (Wales)

