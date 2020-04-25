Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1631B86F6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 16:20:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498Y8Y260WzDqCF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 00:19:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=orc5=6j=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498XxW6q5lzDqQb
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 00:10:23 +1000 (AEST)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C03A720704;
 Sat, 25 Apr 2020 14:10:15 +0000 (UTC)
Date: Sat, 25 Apr 2020 10:10:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Christopher M. Riedl" <cmr@informatik.wtf>
Subject: Re: [PATCH 1/3] powerpc: Properly return error code from
 do_patch_instruction()
Message-ID: <20200425101014.0c1b5fe0@oasis.local.home>
In-Reply-To: <C29ONNE5PMZ3.2R5TT1FV2RFHC@geist>
References: <20200424091552.497dc719@gandalf.local.home>
 <C29ONNE5PMZ3.2R5TT1FV2RFHC@geist>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 24 Apr 2020 14:26:02 -0500
"Christopher M. Riedl" <cmr@informatik.wtf> wrote:

> On Fri Apr 24, 2020 at 9:15 AM, Steven Rostedt wrote:
> > On Thu, 23 Apr 2020 18:21:14 +0200
> > Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> >
> >  =20
> > > Le 23/04/2020 =C3=A0 17:09, Naveen N. Rao a =C3=A9crit=C2=A0: =20
> > > > With STRICT_KERNEL_RWX, we are currently ignoring return value from
> > > > __patch_instruction() in do_patch_instruction(), resulting in the e=
rror
> > > > not being propagated back. Fix the same.   =20
> > >=20
> > > Good patch.
> > >=20
> > > Be aware that there is ongoing work which tend to wanting to replace=
=20
> > > error reporting by BUG_ON() . See=20
> > > https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D1660=
03 =20
> >
> >=20
> > Thanks for the reference. I still believe that WARN_ON() should be used
> > in
> > 99% of the cases, including here. And only do a BUG_ON() when you know
> > there's no recovering from it.
> >
> >=20
> > In fact, there's still BUG_ON()s in my code that I need to convert to
> > WARN_ON() (it was written when BUG_ON() was still acceptable ;-)
> > =20
> Figured I'd chime in since I am working on that other series :) The
> BUG_ON()s are _only_ in the init code to set things up to allow a
> temporary mapping for patching a STRICT_RWX kernel later. There's no
> ongoing work to "replace error reporting by BUG_ON()". If that initial
> setup fails we cannot patch under STRICT_KERNEL_RWX at all which imo
> warrants a BUG_ON(). I am still working on v2 of my RFC which does
> return any __patch_instruction() error back to the caller of
> patch_instruction() similar to this patch.


I agree certain locations may warrant a BUG_ON(), but I wouldn't make a
generic operation like patch_instruction() BUG, as it may be used in
cases that do not warrant it (like setting up ftrace).

Deciding to BUG on not based on the return code of patch_instruction()
is the way to go IMO.

-- Steve

