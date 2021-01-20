Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 626452FCACF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 06:44:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLDx62c1PzDqyc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 16:44:26 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLDvQ6DwdzDqVr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 16:42:58 +1100 (AEDT)
Received: from MTA-08-4.privateemail.com (mta-08.privateemail.com
 [68.65.122.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id B36E1805FC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 00:42:54 -0500 (EST)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 330D960099;
 Wed, 20 Jan 2021 00:42:50 -0500 (EST)
Received: from localhost (unknown [10.20.151.213])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id E32356005C;
 Wed, 20 Jan 2021 05:42:49 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH v3 1/8] powerpc/uaccess: Add unsafe_copy_from_user
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Michael Ellerman"
 <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>
Date: Tue, 19 Jan 2021 23:08:03 -0600
Message-Id: <C8NQ4D6KZV3H.1XZG3F3L7A3MW@geist>
In-Reply-To: <1e6309a4-58fe-c6a4-6e47-d8659177846c@csgroup.eu>
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

On Tue Jan 19, 2021 at 11:27 AM CST, Christophe Leroy wrote:
>
>
> Le 19/01/2021 =C3=A0 18:02, Christopher M. Riedl a =C3=A9crit :
> > On Tue Jan 19, 2021 at 6:33 AM CST, Christophe Leroy wrote:
> >>
> >>
> >> Le 19/01/2021 =C3=A0 03:11, Michael Ellerman a =C3=A9crit :
> >>> "Christopher M. Riedl" <cmr@codefail.de> writes:
> >>>> On Mon Jan 11, 2021 at 7:22 AM CST, Christophe Leroy wrote:
> >>>>> Le 09/01/2021 =C3=A0 04:25, Christopher M. Riedl a =C3=A9crit :
> >>>>>> Implement raw_copy_from_user_allowed() which assumes that userspac=
e read
> >>>>>> access is open. Use this new function to implement raw_copy_from_u=
ser().
> >>>>>> Finally, wrap the new function to follow the usual "unsafe_" conve=
ntion
> >>>>>> of taking a label argument.
> >>>>>
> >>>>> I think there is no point implementing raw_copy_from_user_allowed()=
, see
> >>>>> https://github.com/linuxppc/linux/commit/4b842e4e25b1 and
> >>>>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/8c74fc9ce81=
31cabb10b3e95dc0e430f396ee83e.1610369143.git.christophe.leroy@csgroup.eu/
> >>>>>
> >>>>> You should simply do:
> >>>>>
> >>>>> #define unsafe_copy_from_user(d, s, l, e) \
> >>>>> unsafe_op_wrap(__copy_tofrom_user((__force void __user *)d, s, l), =
e)
> >>>>>
> >>>>
> >>>> I gave this a try and the signal ops decreased by ~8K. Now, to be
> >>>> honest, I am not sure what an "acceptable" benchmark number here
> >>>> actually is - so maybe this is ok? Same loss with both radix and has=
h:
> >>>>
> >>>> 	|                                      | hash   | radix  |
> >>>> 	| ------------------------------------ | ------ | ------ |
> >>>> 	| linuxppc/next                        | 118693 | 133296 |
> >>>> 	| linuxppc/next w/o KUAP+KUEP          | 228911 | 228654 |
> >>>> 	| unsafe-signal64                      | 200480 | 234067 |
> >>>> 	| unsafe-signal64 (__copy_tofrom_user) | 192467 | 225119 |
> >>>>
> >>>> To put this into perspective, prior to KUAP and uaccess flush, signa=
l
> >>>> performance in this benchmark was ~290K on hash.
> >>>
> >>> If I'm doing the math right 8K is ~4% of the best number.
> >>>
> >>> It seems like 4% is worth a few lines of code to handle these constan=
t
> >>> sizes. It's not like we have performance to throw away.
> >>>
> >>> Or, we should chase down where the call sites are that are doing smal=
l
> >>> constant copies with copy_to/from_user() and change them to use
> >>> get/put_user().
> >>>
> >>
> >> Christopher, when you say you gave it a try, is I my series or only th=
e
> >> following ?
> >>
> >> #define unsafe_copy_from_user(d, s, l, e) \
> >> unsafe_op_wrap(__copy_tofrom_user((__force void __user *)d, s, l), e)
> >>
> >=20
> > I only used the above to replace this patch in my series (so none of my
> > changes implementing raw_copy_from_user_allowed() are included).
>
> Then I see no reason why the performance would be different, because you
> only call
> unsafe_copy_from_user() with non trivial lengthes.
>

Ok I made a mistake - this actually included the other improvements from
your feedback on this series; specifically moving the unsafe_get_user()
call to read the msr regs value into the #ifdef. My first pass resulted
in another __get_user() call which explains some of the perf loss.

With that mistake fixed, the benchmark performance is still only ~197k
on hash (consistent). I agree that there are no places where
unsafe_copy_from_user() is called with trivial lengths so the only
conclusion I can draw is that the changes in this patch marginally
speed-up the other __copy_from_user() calls. I started comparing the
disassembly but nothing immediately obvious stands out to me. In fact, I
observe the speed-up even if I keep this patch _and_ apply this change:

#define unsafe_copy_from_user(d, s, l, e) \
unsafe_op_wrap(__copy_tofrom_user((__force void __user *)d, s, l), e)

Related to that, I think sigset_t is always 8B on ppc64 so these will
probably need a wrapper if we pick-up your series to get rid of trivial
size optimizations:

__copy_from_user(&set, &uc->uc_sigmask, sizeof(set))

I can bring performance up to ~200K on hash again by replacing the two
__copy_from_user(&set, ...) with direct calls to __get_user_size() (it's
kind of hacky I think). See the last commit in this tree:

https://git.sr.ht/~cmr/linux/log/unsafe-signal64-v4

All my comments apply to performance on radix as well.

> >=20
> >>
> >> Because I see no use of unsafe_copy_from_user() that would explain tha=
t.
> >>
> >> Christophe

