Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A20313A96
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 18:15:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZCM96J9dzDvW1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 04:15:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=68.65.122.30;
 helo=mta-10-1.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from MTA-10-1.privateemail.com (mta-10-1.privateemail.com
 [68.65.122.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZCKW0y9czDqlX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 04:13:32 +1100 (AEDT)
Received: from MTA-10.privateemail.com (localhost [127.0.0.1])
 by MTA-10.privateemail.com (Postfix) with ESMTP id 5C9786005C;
 Mon,  8 Feb 2021 12:13:29 -0500 (EST)
Received: from localhost (unknown [10.20.151.230])
 by MTA-10.privateemail.com (Postfix) with ESMTPA id 2835B60048;
 Mon,  8 Feb 2021 17:13:29 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH 2/8] powerpc/signal: Add unsafe_copy_{vsx,fpr}_from_user()
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
Date: Mon, 08 Feb 2021 11:14:01 -0600
Message-Id: <C94BGJXVR3GE.11YGE41549ZVT@geist>
In-Reply-To: <1caa3c1e-bf4e-700e-efea-28964005bb12@csgroup.eu>
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

On Sun Feb 7, 2021 at 4:12 AM CST, Christophe Leroy wrote:
>
>
> Le 06/02/2021 =C3=A0 18:39, Christopher M. Riedl a =C3=A9crit :
> > On Sat Feb 6, 2021 at 10:32 AM CST, Christophe Leroy wrote:
> >>
> >>
> >> Le 20/10/2020 =C3=A0 04:01, Christopher M. Riedl a =C3=A9crit :
> >>> On Fri Oct 16, 2020 at 10:48 AM CDT, Christophe Leroy wrote:
> >>>>
> >>>>
> >>>> Le 15/10/2020 =C3=A0 17:01, Christopher M. Riedl a =C3=A9crit :
> >>>>> Reuse the "safe" implementation from signal.c except for calling
> >>>>> unsafe_copy_from_user() to copy into a local buffer. Unlike the
> >>>>> unsafe_copy_{vsx,fpr}_to_user() functions the "copy from" functions
> >>>>> cannot use unsafe_get_user() directly to bypass the local buffer si=
nce
> >>>>> doing so significantly reduces signal handling performance.
> >>>>
> >>>> Why can't the functions use unsafe_get_user(), why does it significa=
ntly
> >>>> reduces signal handling
> >>>> performance ? How much significant ? I would expect that not going
> >>>> through an intermediate memory
> >>>> area would be more efficient
> >>>>
> >>>
> >>> Here is a comparison, 'unsafe-signal64-regs' avoids the intermediate =
buffer:
> >>>
> >>> 	|                      | hash   | radix  |
> >>> 	| -------------------- | ------ | ------ |
> >>> 	| linuxppc/next        | 289014 | 158408 |
> >>> 	| unsafe-signal64      | 298506 | 253053 |
> >>> 	| unsafe-signal64-regs | 254898 | 220831 |
> >>>
> >>> I have not figured out the 'why' yet. As you mentioned in your series=
,
> >>> technically calling __copy_tofrom_user() is overkill for these
> >>> operations. The only obvious difference between unsafe_put_user() and
> >>> unsafe_get_user() is that we don't have asm-goto for the 'get' varian=
t.
> >>> Instead we wrap with unsafe_op_wrap() which inserts a conditional and
> >>> then goto to the label.
> >>>
> >>> Implemenations:
> >>>
> >>> 	#define unsafe_copy_fpr_from_user(task, from, label)   do {         =
   \
> >>> 	       struct task_struct *__t =3D task;                            =
     \
> >>> 	       u64 __user *buf =3D (u64 __user *)from;                      =
     \
> >>> 	       int i;                                                       =
   \
> >>> 									       \
> >>> 	       for (i =3D 0; i < ELF_NFPREG - 1; i++)                       =
     \
> >>> 		       unsafe_get_user(__t->thread.TS_FPR(i), &buf[i], label); \
> >>> 	       unsafe_get_user(__t->thread.fp_state.fpscr, &buf[i], label); =
   \
> >>> 	} while (0)
> >>>
> >>> 	#define unsafe_copy_vsx_from_user(task, from, label)   do {         =
   \
> >>> 	       struct task_struct *__t =3D task;                            =
     \
> >>> 	       u64 __user *buf =3D (u64 __user *)from;                      =
     \
> >>> 	       int i;                                                       =
   \
> >>> 									       \
> >>> 	       for (i =3D 0; i < ELF_NVSRHALFREG ; i++)                     =
     \
> >>> 		       unsafe_get_user(__t->thread.fp_state.fpr[i][TS_VSRLOWOFFSET]=
, \
> >>> 				       &buf[i], label);                        \
> >>> 	} while (0)
> >>>
> >>
> >> Do you have CONFIG_PROVE_LOCKING or CONFIG_DEBUG_ATOMIC_SLEEP enabled =
in
> >> your config ?
> >=20
> > I don't have these set in my config (ppc64le_defconfig). I think I
> > figured this out - the reason for the lower signal throughput is the
> > barrier_nospec() in __get_user_nocheck(). When looping we incur that
> > cost on every iteration. Commenting it out results in signal performanc=
e
> > of ~316K w/ hash on the unsafe-signal64-regs branch. Obviously the
> > barrier is there for a reason but it is quite costly.
>
> Interesting.
>
> Can you try with the patch I just sent out
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/c72f014730823b413=
528e90ab6c4d3bcb79f8497.1612692067.git.christophe.leroy@csgroup.eu/

Yeah that patch solves the problem. Using unsafe_get_user() in a loop is
actually faster on radix than using the intermediary buffer step. A
summary of results below (unsafe-signal64-v6 uses unsafe_get_user() and
avoids the local buffer):

        |                                  | hash   | radix  |
        | -------------------------------- | ------ | ------ |
        | unsafe-signal64-v5               | 194533 | 230089 |
        | unsafe-signal64-v6               | 176739 | 202840 |
        | unsafe-signal64-v5+barrier patch | 203037 | 234936 |
        | unsafe-signal64-v6+barrier patch | 205484 | 241030 |

I am still expecting some comments/feedback on my v5 before sending out
v6. Should I include your patch in my series as well?

>
> Thanks
> Christophe

