Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C65A2311F37
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 18:55:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DY0LC0wjNzDqcY
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 04:54:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DY0HT68VBzDqPn
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Feb 2021 04:52:37 +1100 (AEDT)
Received: from MTA-08-4.privateemail.com (mta-08.privateemail.com
 [68.65.122.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 23EEB80943
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 12:52:33 -0500 (EST)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 4A2586006A;
 Sat,  6 Feb 2021 12:52:26 -0500 (EST)
Received: from localhost (unknown [10.20.151.208])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id 1724A6003E;
 Sat,  6 Feb 2021 17:52:26 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH 2/8] powerpc/signal: Add unsafe_copy_{vsx,fpr}_from_user()
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
Date: Sat, 06 Feb 2021 11:39:13 -0600
Message-Id: <C92MQRHFCFEA.37OV051PFFY6@geist>
In-Reply-To: <fce0b2d0-58a3-a94d-a8e9-d104fc2b3058@csgroup.eu>
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

On Sat Feb 6, 2021 at 10:32 AM CST, Christophe Leroy wrote:
>
>
> Le 20/10/2020 =C3=A0 04:01, Christopher M. Riedl a =C3=A9crit :
> > On Fri Oct 16, 2020 at 10:48 AM CDT, Christophe Leroy wrote:
> >>
> >>
> >> Le 15/10/2020 =C3=A0 17:01, Christopher M. Riedl a =C3=A9crit :
> >>> Reuse the "safe" implementation from signal.c except for calling
> >>> unsafe_copy_from_user() to copy into a local buffer. Unlike the
> >>> unsafe_copy_{vsx,fpr}_to_user() functions the "copy from" functions
> >>> cannot use unsafe_get_user() directly to bypass the local buffer sinc=
e
> >>> doing so significantly reduces signal handling performance.
> >>
> >> Why can't the functions use unsafe_get_user(), why does it significant=
ly
> >> reduces signal handling
> >> performance ? How much significant ? I would expect that not going
> >> through an intermediate memory
> >> area would be more efficient
> >>
> >=20
> > Here is a comparison, 'unsafe-signal64-regs' avoids the intermediate bu=
ffer:
> >=20
> > 	|                      | hash   | radix  |
> > 	| -------------------- | ------ | ------ |
> > 	| linuxppc/next        | 289014 | 158408 |
> > 	| unsafe-signal64      | 298506 | 253053 |
> > 	| unsafe-signal64-regs | 254898 | 220831 |
> >=20
> > I have not figured out the 'why' yet. As you mentioned in your series,
> > technically calling __copy_tofrom_user() is overkill for these
> > operations. The only obvious difference between unsafe_put_user() and
> > unsafe_get_user() is that we don't have asm-goto for the 'get' variant.
> > Instead we wrap with unsafe_op_wrap() which inserts a conditional and
> > then goto to the label.
> >=20
> > Implemenations:
> >=20
> > 	#define unsafe_copy_fpr_from_user(task, from, label)   do {           =
 \
> > 	       struct task_struct *__t =3D task;                              =
   \
> > 	       u64 __user *buf =3D (u64 __user *)from;                        =
   \
> > 	       int i;                                                         =
 \
> > 									       \
> > 	       for (i =3D 0; i < ELF_NFPREG - 1; i++)                         =
   \
> > 		       unsafe_get_user(__t->thread.TS_FPR(i), &buf[i], label); \
> > 	       unsafe_get_user(__t->thread.fp_state.fpscr, &buf[i], label);   =
 \
> > 	} while (0)
> >=20
> > 	#define unsafe_copy_vsx_from_user(task, from, label)   do {           =
 \
> > 	       struct task_struct *__t =3D task;                              =
   \
> > 	       u64 __user *buf =3D (u64 __user *)from;                        =
   \
> > 	       int i;                                                         =
 \
> > 									       \
> > 	       for (i =3D 0; i < ELF_NVSRHALFREG ; i++)                       =
   \
> > 		       unsafe_get_user(__t->thread.fp_state.fpr[i][TS_VSRLOWOFFSET], =
\
> > 				       &buf[i], label);                        \
> > 	} while (0)
> >=20
>
> Do you have CONFIG_PROVE_LOCKING or CONFIG_DEBUG_ATOMIC_SLEEP enabled in
> your config ?

I don't have these set in my config (ppc64le_defconfig). I think I
figured this out - the reason for the lower signal throughput is the
barrier_nospec() in __get_user_nocheck(). When looping we incur that
cost on every iteration. Commenting it out results in signal performance
of ~316K w/ hash on the unsafe-signal64-regs branch. Obviously the
barrier is there for a reason but it is quite costly.

This also explains why the copy_{fpr,vsx}_to_user() direction does not
suffer from the slowdown because there is no need for barrier_nospec().
>
> If yes, could you try together with the patch from Alexey
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210204121612.32=
721-1-aik@ozlabs.ru/
> ?
>
> Thanks
> Christophe

