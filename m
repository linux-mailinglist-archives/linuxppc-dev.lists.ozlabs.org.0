Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDE4443883
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 23:35:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkPqr5Gz8z2yp0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 09:35:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bluescreens.de (client-ip=80.241.56.171;
 helo=mout-p-201.mailbox.org; envelope-from=cmr@bluescreens.de;
 receiver=<UNKNOWN>)
X-Greylist: delayed 598 seconds by postgrey-1.36 at boromir;
 Wed, 03 Nov 2021 09:35:10 AEDT
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkPqL1drgz2xWl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Nov 2021 09:35:09 +1100 (AEDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4HkPbg24zGzQlYd;
 Tue,  2 Nov 2021 23:25:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: Fwd: Fwd: X stopped working with 5.14 on iBook
From: "Christopher M. Riedl" <cmr@bluescreens.de>
To: "Finn Thain" <fthain@linux-m68k.org>, "Christopher M. Riedl"
 <cmr@linux.ibm.com>
Date: Tue, 02 Nov 2021 17:27:46 -0500
Message-Id: <CFFNC8MZ20HR.13XRVPWSKVLE0@wrwlf0000>
In-Reply-To: <48c3ed15-2ecf-cc12-c287-2b61457f5fb@nippy.intranet>
X-Rspamd-Queue-Id: 071D9130B
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
Cc: Stan Johnson <stanley.johnson.001@protonmail.com>,
 linuxppc-dev@lists.ozlabs.org, Riccardo Mottola <riccardo.mottola@libero.it>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 1, 2021 at 9:20 PM CDT, Finn Thain wrote:
> Hi Christopher,
>
> After many builds and tests, Stan and I were able to determine that this
> regression only affects builds with CONFIG_USER_NS=3Dy. That is,
>
> d3ccc9781560 + CONFIG_USER_NS=3Dy --> fail
> d3ccc9781560 + CONFIG_USER_NS=3Dn --> okay
> d3ccc9781560~ + CONFIG_USER_NS=3Dy --> okay
> d3ccc9781560~ + CONFIG_USER_NS=3Dn --> okay
>
> Stan also tested a PowerMac G3 system and found that the regression is
> not
> present there. Thus far, only PowerMac G4 systems are known to be
> affected
> (Stan's Cube and Riccardo's PowerBook).
>
> I asked Stan to try v5.15-rc after reverting commit d3ccc9781560.
> Unexpectedly, this build had the same issue. So, it appears there are
> multiple bad commits that produce this Xorg failure, of which
> d3ccc9781560
> is just the first.
>
> But there's no easy way to identify the other bad commits using
> bisection.
> So I've addressed this message to you. Can you help fix this regression?

Hi,

I switched email addresses a few times since that patch - also I am not
employed at IBM any longer so that @linux.ibm.com email doesn't work
either. In any case, I'll take a look and see if I can figure out what's
going on. I do actually have a PowerBook G4 here (if it can be coaxed to
boot) that could help me root cause this.

Thanks!
Chris R.

>
> Regards,
> Finn
>
> On Fri, 22 Oct 2021, Christophe Leroy wrote:
>
> > ...
> > >=20
> > > -------- Forwarded Message --------
> > > Subject: Fwd: X stopped working with 5.14 on iBook
> > > Date: Fri, 22 Oct 2021 11:35:21 -0600
> > > From: Stan Johnson
> > > To: Christopher M. Riedl <cmr@codefail.de>
> > > CC: Finn Thain <fthain@fastmail.com.au>
> > >=20
> > > Hello Christopher Riedl,
> > >=20
> > > Please see the message below, in which a git bisect identifies a comm=
it
> > > which may have stopped X from working on some PowerPC G4 systems
> > > (specifically the G4 PowerBook and Cube, possibly others).
> > >=20
> > > I'm not sure how to proceed with further tests. If the identified com=
mit
> > > could not have caused the problem, then further testing may be needed=
.
> > > Please let me know if you need any additional information.
> > >=20
> > > Hopefully your e-mail filter will allow messages from yahoo.com addre=
sses.
> > >=20
> > > thanks for your help
> > >=20
> > > -Stan Johnson
> > >=20
> > > -------- Forwarded Message --------
> > > Subject: Re: X stopped working with 5.14 on iBook
> > > Date: Fri, 22 Oct 2021 11:25:14 -0600
> > > From: Stan Johnson
> > > To: debian-powerpc@lists.debian.org
> > > CC: Riccardo Mottola <riccardo.mottola@libero.it>
> > >=20
> > > On 10/14/21 9:21 PM, Stan Johnson wrote:
> > > > ...
> > > > Debian's 5.10.0-8 config file works (as expected) with Debian's 5.1=
0.0-8
> > > > kernel source.
> > > > ...
> > > > X works with 5.14 using a tuned config file derived from 5.13 testi=
ng.
> > > > ...
> > >=20
> > > Update:
> > >=20
> > > The issue originally reported by Riccardo Mottola was that X wasn't
> > > working on a PowerBook G4 using Debian's default
> > > vmlinux-5.14.0-2-powerpc kernel. I was able to confirm that the X
> > > failure also occurs on a G4 Cube. My G4 Cube has Debian SID,
> > > sysvinit-core, Xfce and wdm installed. To test whether X works, I
> > > disabled wdm, then I log in at the text console and run "startx". Whe=
n X
> > > fails, the screen goes blank and the backlight stays on; when X works=
,
> > > the normal desktop comes up.
> > >=20
> > > X works in mainline v5.12 built using a config file based on Debian's
> > > config-5.10.0-8-powerpc.
> > >=20
> > > X fails in mainline v5.13 built using a config file based on Debian's
> > > config-5.10.0-8-powerpc.
> > >=20
> > > With much help and advice from Finn Thain, I was able to run a bisect
> > > using a config file based on Debian's config-5.10.0-8-powerpc, with
> > > v5.12 "good" and v5.13 "bad".
> > >=20
> > > $ git reset --hard
> > > HEAD is now at 62fb9874f5da Linux 5.13
> > > $ git bisect start v5.13
> > > Updating files: 100% (12992/12992), done.
> > > Previous HEAD position was 62fb9874f5da Linux 5.13
> > > HEAD is now at 9f4ad9e425a1 Linux 5.12
> > > $ git bisect bad v5.13
> > > $ git bisect good v5.12
> > > Bisecting: 8739 revisions left to test after this (roughly 13 steps)
> > > > 85f3f17b5db2dd9f8a094a0ddc665555135afd22] Merge branch 'md-fixes' o=
f
> > > https://git.kernel.org/pub/scm/linux/kernel/git/song/md into block-5.=
13
> > >=20
> > > After the bisect, git reports this:
> > >=20
> > > ----------
> > >=20
> > > d3ccc9781560af051554017c702631560bdc0811 is the first bad commit
> > > commit d3ccc9781560af051554017c702631560bdc0811
> > > Author: Christopher M. Riedl <cmr@codefail.de>
> > > Date:   Fri Feb 26 19:12:59 2021 -0600
> > >=20
> > >      powerpc/signal: Use __get_user() to copy sigset_t
> > >=20
> > >      Usually sigset_t is exactly 8B which is a "trivial" size and doe=
s not
> > >      warrant using __copy_from_user(). Use __get_user() directly in
> > >      anticipation of future work to remove the trivial size optimizat=
ions
> > >      from __copy_from_user().
> > >=20
> > >      The ppc32 implementation of get_sigset_t() previously called
> > >      copy_from_user() which, unlike __copy_from_user(), calls access_=
ok().
> > >      Replacing this w/ __get_user() (no access_ok()) is fine here sin=
ce both
> > >      callsites in signal_32.c are preceded by an earlier access_ok().
> > >=20
> > >      Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > >      Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > >      Link: https://lore.kernel.org/r/20210227011259.11992-11-cmr@code=
fail.de
> > >=20
> > >   arch/powerpc/kernel/signal.h    | 7 +++++++
> > >   arch/powerpc/kernel/signal_32.c | 2 +-
> > >   arch/powerpc/kernel/signal_64.c | 4 ++--
> > >   3 files changed, 10 insertions(+), 3 deletions(-)
> > >=20
> >=20

