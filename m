Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C50351B7ED8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 21:27:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49841F31xDzDqZ1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 05:26:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=131.153.2.45;
 helo=h4.fbrelay.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4983yv0yn2zDr0V
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 05:24:55 +1000 (AEST)
Received: from MTA-05-3.privateemail.com (mta-05.privateemail.com
 [198.54.127.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 6FAC58004D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 15:24:51 -0400 (EDT)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
 by MTA-05.privateemail.com (Postfix) with ESMTP id 8622C60051;
 Fri, 24 Apr 2020 15:24:43 -0400 (EDT)
Received: from localhost (unknown [10.20.151.214])
 by MTA-05.privateemail.com (Postfix) with ESMTPA id E949E6004B;
 Fri, 24 Apr 2020 19:24:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Original: =?utf-8?q?On_Thu,_23_Apr_2020_18:21:14_+0200
 =0D=0AChristophe_Leroy_<chris?= =?utf-8?q?tophe.leroy@c-s.fr>_wrote:
 =0D=0A=0D=0A>_Le_23/04/2020_=C3=A0_17?= =?utf-8?q?:09,_Naveen_N._Rao_a_
 =C3=A9crit=C2=A0:=0D=0A>_>_With_STRICT=5FK?= =?utf-8?q?ERNEL
 =5FRWX,_we_are_currently_ignoring_return_value_from=0D=0A>?= =?utf-8?q?_>_
 =5F=5Fpatch=5Finstruction()_in_do=5Fpatch=5Finstruction(),_r?=
 =?utf-8?q?esulting_in_the_error=0D=0A>_>_not_being_propagated_back._Fix_t?=
 =?utf-8?q?he_same.__=0D=0A>_=0D=0A>_Good_patch.=0D=0A>_=0D=0A>_Be_aware_t?=
 =?utf-8?q?hat_there_is_ongoing_work_which_tend_to_wanting_to_replace_=0D?=
 =?utf-8?q?=0A>_error_reporting_by_BUG=5FON()_._See_=0D=0A>_https://patchw?=
 =?utf-8?q?ork.ozlabs.org/project/linuxppc-dev/list/=3Fseries=3D166003=0D?=
 =?utf-8?q?=0A=0D=0AThanks_for_the_reference._I_still_believe_that_WARN=5F?=
 =?utf-8?q?ON()_should_be_used_in=0D=0A99%_of_the_cases,_including_here._A?=
 =?utf-8?q?nd_only_do_a_BUG=5FON()_when_you_know=0D=0Athere's_no_recoverin?=
 =?utf-8?q?g_from_it.=0D=0A=0D=0AIn_fact,_there's_still_BUG=5FON()s_in_my_?=
 =?utf-8?q?code_that_I_need_to_convert_to=0D=0AWARN=5FON()_(it_was_written?=
 =?utf-8?q?_when_BUG=5FON()_was_still_acceptable_;-)=0D=0A=0D=0A--_Steve?=
 =?utf-8?q?=0D=0A?=
In-Reply-To: <20200424091552.497dc719@gandalf.local.home>
Originaldate: Fri Apr 24, 2020 at 9:15 AM
Originalfrom: "Steven Rostedt" <rostedt@goodmis.org>
Date: Fri, 24 Apr 2020 14:26:02 -0500
Subject: Re: [PATCH 1/3] powerpc: Properly return error code from
 do_patch_instruction()
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: "Steven Rostedt" <rostedt@goodmis.org>, "Christophe Leroy"
 <christophe.leroy@c-s.fr>
Message-Id: <C29ONNE5PMZ3.2R5TT1FV2RFHC@geist>
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Apr 24, 2020 at 9:15 AM, Steven Rostedt wrote:
> On Thu, 23 Apr 2020 18:21:14 +0200
> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>
>=20
> > Le 23/04/2020 =C3=A0 17:09, Naveen N. Rao a =C3=A9crit=C2=A0:
> > > With STRICT_KERNEL_RWX, we are currently ignoring return value from
> > > __patch_instruction() in do_patch_instruction(), resulting in the err=
or
> > > not being propagated back. Fix the same. =20
> >=20
> > Good patch.
> >=20
> > Be aware that there is ongoing work which tend to wanting to replace=20
> > error reporting by BUG_ON() . See=20
> > https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D166003
>
>=20
> Thanks for the reference. I still believe that WARN_ON() should be used
> in
> 99% of the cases, including here. And only do a BUG_ON() when you know
> there's no recovering from it.
>
>=20
> In fact, there's still BUG_ON()s in my code that I need to convert to
> WARN_ON() (it was written when BUG_ON() was still acceptable ;-)
>
Figured I'd chime in since I am working on that other series :) The
BUG_ON()s are _only_ in the init code to set things up to allow a
temporary mapping for patching a STRICT_RWX kernel later. There's no
ongoing work to "replace error reporting by BUG_ON()". If that initial
setup fails we cannot patch under STRICT_KERNEL_RWX at all which imo
warrants a BUG_ON(). I am still working on v2 of my RFC which does
return any __patch_instruction() error back to the caller of
patch_instruction() similar to this patch.
>=20
> -- Steve
>
>=20
>
>=20

