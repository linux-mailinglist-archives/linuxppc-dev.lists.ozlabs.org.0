Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB51D30AD38
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 17:58:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTvKY4g0zzDrg4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 03:58:41 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTvHd0G59zDrRW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 03:57:00 +1100 (AEDT)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id 634E5600A0;
 Mon,  1 Feb 2021 11:56:57 -0500 (EST)
Received: from localhost (unknown [10.20.151.204])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id 2963360091;
 Mon,  1 Feb 2021 16:56:57 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
To: "David Laight" <David.Laight@ACULAB.COM>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH v4 02/10] powerpc/signal: Add unsafe_copy_{vsx,
 fpr}_from_user()
From: "Christopher M. Riedl" <cmr@codefail.de>
Date: Mon, 01 Feb 2021 10:55:23 -0600
Message-Id: <C8YCOH19N9EX.3LXG80WZT1N37@geist>
In-Reply-To: <0433d40adacc47a3a27bc8bc35e076e3@AcuMS.aculab.com>
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

On Mon Feb 1, 2021 at 10:15 AM CST, David Laight wrote:
> From: Christopher M. Riedl
> > Sent: 01 February 2021 15:56
> >=20
> > On Thu Jan 28, 2021 at 4:38 AM CST, David Laight wrote:
> > > From: Christopher M. Riedl
> > > > Sent: 28 January 2021 04:04
> > > >
> > > > Reuse the "safe" implementation from signal.c except for calling
> > > > unsafe_copy_from_user() to copy into a local buffer.
> > > >
> > > > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > > > ---
> > > >  arch/powerpc/kernel/signal.h | 33 ++++++++++++++++++++++++++++++++=
+
> > > >  1 file changed, 33 insertions(+)
> > > >
> > > > diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/sig=
nal.h
> > > > index 2559a681536e..c18402d625f1 100644
> > > > --- a/arch/powerpc/kernel/signal.h
> > > > +++ b/arch/powerpc/kernel/signal.h
> > > > @@ -53,6 +53,33 @@ unsigned long copy_ckfpr_from_user(struct task_s=
truct *task, void __user *from);
> > > >  				&buf[i], label);\
> > > >  } while (0)
> > > >
> > > > +#define unsafe_copy_fpr_from_user(task, from, label)	do {		\
> > > > +	struct task_struct *__t =3D task;					\
> > > > +	u64 __user *__f =3D (u64 __user *)from;				\
> > > > +	u64 buf[ELF_NFPREG];						\
> > >
> > > How big is that buffer?
> > > Isn't is likely to be reasonably large compared to a reasonable
> > > kernel stack frame.
> > > Especially since this isn't even a leaf function.
> > >
> >=20
> > I think Christophe answered this - I don't really have an opinion eithe=
r
> > way. What would be a 'reasonable' kernel stack frame for reference?
>
> Zero :-)
>

Hehe good point!

> >=20
> > > > +	int i;								\
> > > > +									\
> > > > +	unsafe_copy_from_user(buf, __f, ELF_NFPREG * sizeof(double),	\
> > > > +				label);					\
> > > > +	for (i =3D 0; i < ELF_NFPREG - 1; i++)				\
> > > > +		__t->thread.TS_FPR(i) =3D buf[i];				\
> > > > +	__t->thread.fp_state.fpscr =3D buf[i];				\
> > > > +} while (0)
>
> On further reflection, since you immediately loop through the buffer
> why not just use user_access_begin() and unsafe_get_user() in the loop.

Christophe had suggested this a few revisions ago as well. When I tried
this approach, the signal handling performance took a pretty big hit:
https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-October/219351.html

I included some numbers on v3 as well but decided to drop the approach
altogether for this one since it just didn't seem worth the hit.

>
> David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes,
> MK1 1PT, UK
> Registration No: 1397386 (Wales)

