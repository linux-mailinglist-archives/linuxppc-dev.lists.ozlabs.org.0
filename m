Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 787CE1B7DE6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 20:32:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4982p42RngzDr3y
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 04:32:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=19w6=6i=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4982lb0vfCzDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 04:30:02 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3D46A20774;
 Fri, 24 Apr 2020 18:30:00 +0000 (UTC)
Date: Fri, 24 Apr 2020 14:29:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc: Properly return error code from
 do_patch_instruction()
Message-ID: <20200424142958.39d10d8f@gandalf.local.home>
In-Reply-To: <1587751422.a0nwb9dqfv.naveen@linux.ibm.com>
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <b1dbbb34a389a6f59eb6c99102d94c0070ddaf98.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <16070946-1185-2aad-62fe-f4ed9cd4eefe@c-s.fr>
 <20200424091552.497dc719@gandalf.local.home>
 <1587751422.a0nwb9dqfv.naveen@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 24 Apr 2020 23:37:06 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> >> Le 23/04/2020 =C3=A0 17:09, Naveen N. Rao a =C3=A9crit=C2=A0: =20
> >> > With STRICT_KERNEL_RWX, we are currently ignoring return value from
> >> > __patch_instruction() in do_patch_instruction(), resulting in the er=
ror
> >> > not being propagated back. Fix the same.   =20
> >>=20
> >> Good patch.
> >>=20
> >> Be aware that there is ongoing work which tend to wanting to replace=20
> >> error reporting by BUG_ON() . See=20
> >> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D16600=
3 =20
> >=20
> > Thanks for the reference. I still believe that WARN_ON() should be used=
 in
> > 99% of the cases, including here. And only do a BUG_ON() when you know
> > there's no recovering from it. =20
>=20
> I'm not sure if you meant that we should have a WARN_ON() in=20
> patch_instruction(), or if it was about the users of=20
> patch_instruction(). As you're well aware, ftrace likes to do its own=20
> WARN_ON() if any of its operations fail through ftrace_bug(). That was=20
> the reason I didn't add anything here.

I'm fine with that too, and better reason not to call BUG_ON(), because I'm
guessing if we crash, we never make it to the ftrace_bug() which reports
information that can be used to debug what went wrong.

-- Steve
