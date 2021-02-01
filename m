Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C021730B1CB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 21:59:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV0g72LW7zDrVM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 07:59:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=131.153.2.45;
 helo=h4.fbrelay.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV0dN0w3HzDqyb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 07:57:44 +1100 (AEDT)
Received: from MTA-08-4.privateemail.com (mta-08.privateemail.com
 [68.65.122.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id A79D5812D9
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Feb 2021 15:57:38 -0500 (EST)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 879CB6005C;
 Mon,  1 Feb 2021 15:57:33 -0500 (EST)
Received: from localhost (unknown [10.20.151.241])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id 437EB60052;
 Mon,  1 Feb 2021 20:57:33 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH v4 02/10] powerpc/signal: Add unsafe_copy_{vsx,
 fpr}_from_user()
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Gabriel Paubert" <paubert@iram.es>
Date: Mon, 01 Feb 2021 14:55:50 -0600
Message-Id: <C8YHSKQ99VC4.M9Y0WOFVUTBQ@geist>
In-Reply-To: <20210201165440.GA8929@lt-gp.iram.es>
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
Cc: David Laight <David.Laight@ACULAB.COM>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Feb 1, 2021 at 10:54 AM CST, Gabriel Paubert wrote:
> On Mon, Feb 01, 2021 at 09:55:44AM -0600, Christopher M. Riedl wrote:
> > On Thu Jan 28, 2021 at 4:38 AM CST, David Laight wrote:
> > > From: Christopher M. Riedl
> > > > Sent: 28 January 2021 04:04
> > > >=20
> > > > Reuse the "safe" implementation from signal.c except for calling
> > > > unsafe_copy_from_user() to copy into a local buffer.
> > > >=20
> > > > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > > > ---
> > > >  arch/powerpc/kernel/signal.h | 33 ++++++++++++++++++++++++++++++++=
+
> > > >  1 file changed, 33 insertions(+)
> > > >=20
> > > > diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/sig=
nal.h
> > > > index 2559a681536e..c18402d625f1 100644
> > > > --- a/arch/powerpc/kernel/signal.h
> > > > +++ b/arch/powerpc/kernel/signal.h
> > > > @@ -53,6 +53,33 @@ unsigned long copy_ckfpr_from_user(struct task_s=
truct *task, void __user *from);
> > > >  				&buf[i], label);\
> > > >  } while (0)
> > > >=20
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
> See include/linux/poll.h, where the limit is of the order of 800 bytes
> and the number of entries in an on stack array is chosen at compile time
> (different between 32 and 64 bit for example).
>
> The values are used in do_sys_poll, which, with almost 1000 bytes of
> stack footprint, appears close to the top of "make checkstack". In
> addition do_sys_poll has to call the ->poll function of every file
> descriptor in its table, so it is not a tail function.
>
> This 264 bytes array looks reasonable, but please use 'make checkstack'
> to verify that the function's total stack usage stays within reason.

Neat, looks like total usage is a bit larger but still reasonable and
less than half of 800B:

0xc000000000017e900 __unsafe_restore_sigcontext.constprop.0 [vmlinux]:352

Thanks for the tip!

>
> Gabriel
>
> >=20
> > > > +	int i;								\
> > > > +									\
> > > > +	unsafe_copy_from_user(buf, __f, ELF_NFPREG * sizeof(double),	\
> > >
> > > That really ought to be sizeof(buf).
> > >
> >=20
> > Agreed, I will fix this. Thanks!
> >=20
> > > David
> > >
> > >
> > > > +				label);					\
> > > > +	for (i =3D 0; i < ELF_NFPREG - 1; i++)				\
> > > > +		__t->thread.TS_FPR(i) =3D buf[i];				\
> > > > +	__t->thread.fp_state.fpscr =3D buf[i];				\
> > > > +} while (0)
> > > > +
> > > > +#define unsafe_copy_vsx_from_user(task, from, label)	do {		\
> > > > +	struct task_struct *__t =3D task;					\
> > > > +	u64 __user *__f =3D (u64 __user *)from;				\
> > > > +	u64 buf[ELF_NVSRHALFREG];					\
> > > > +	int i;								\
> > > > +									\
> > > > +	unsafe_copy_from_user(buf, __f,					\
> > > > +				ELF_NVSRHALFREG * sizeof(double),	\
> > > > +				label);					\
> > > > +	for (i =3D 0; i < ELF_NVSRHALFREG ; i++)				\
> > > > +		__t->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] =3D buf[i];	\
> > > > +} while (0)
> > > > +
> > > > +
> > > >  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> > > >  #define unsafe_copy_ckfpr_to_user(to, task, label)	do {		\
> > > >  	struct task_struct *__t =3D task;					\
> > > > @@ -80,6 +107,10 @@ unsigned long copy_ckfpr_from_user(struct task_=
struct *task, void __user *from);
> > > >  	unsafe_copy_to_user(to, (task)->thread.fp_state.fpr,	\
> > > >  			    ELF_NFPREG * sizeof(double), label)
> > > >=20
> > > > +#define unsafe_copy_fpr_from_user(task, from, label)			\
> > > > +	unsafe_copy_from_user((task)->thread.fp_state.fpr, from,	\
> > > > +			    ELF_NFPREG * sizeof(double), label)
> > > > +
> > > >  static inline unsigned long
> > > >  copy_fpr_to_user(void __user *to, struct task_struct *task)
> > > >  {
> > > > @@ -115,6 +146,8 @@ copy_ckfpr_from_user(struct task_struct *task, =
void __user *from)
> > > >  #else
> > > >  #define unsafe_copy_fpr_to_user(to, task, label) do { } while (0)
> > > >=20
> > > > +#define unsafe_copy_fpr_from_user(task, from, label) do { } while =
(0)
> > > > +
> > > >  static inline unsigned long
> > > >  copy_fpr_to_user(void __user *to, struct task_struct *task)
> > > >  {
> > > > --
> > > > 2.26.1
> > >
> > > -
> > > Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes,
> > > MK1 1PT, UK
> > > Registration No: 1397386 (Wales)
> >=20
> =20

