Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D277576BD38
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 21:03:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=YnJLmjRH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFkzG5LxWz3bZv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 05:03:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=YnJLmjRH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFkyM3lPtz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 05:02:49 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d08658c7713so6315981276.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 12:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1690916566; x=1691521366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SclraCm3h0ZTin0EjlVWz7al4/ZvI3IRr+5XmagqLbs=;
        b=YnJLmjRH0KqDrmcD+ZDiIsWHBYb7i1IT5zarLsqaoLjrQuoWLdV5MwUUB8C1sTLKl+
         BMldfKW/RIDQGp/B5BkIyTHX8Qmk82ZNbKlR7miY22lCzi0XhjYgybxgMq4s3laONYdL
         wEPcZZVZcQy/tB9W0XFuGu6FKWvcX5obRDAWSVXJZfa7jwn4cGxHid6CJCG1dVa5k84j
         MydtQkd2kO55QROQObazhaq/w2duJ7+sBnHZDSn4jxAYMrjVyTmLQn+cqrliXnAEU3Bc
         EhZFby4QcyzEMeJ+aDmGJOSUVEyBdKlcrMMjR3TZFmaK0jQXERcC5jzWTJuZgVlZIdtq
         Moxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690916566; x=1691521366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SclraCm3h0ZTin0EjlVWz7al4/ZvI3IRr+5XmagqLbs=;
        b=I/69kA2JrO9Td2yaj0JPk6OBQqrToq6pS7S4fHLZf0UyLeM55z6qQTg+aDZwIkhwGn
         JuWQS+pQqY7DvmEJwVK9OyJh2qQkX5x3eqM+WzZOxa+TjnWhsddB3a841AwFXWlCf65j
         BrPUsglOfbJtccCOkOfkfFN7EzTLuhT/AUqDpPhbMXkQqg88/VexSuTWGmG4c6RaRreR
         hQPkh9c5RA3NjREN4F1pkmIFIMOXjlN3wsCmOnZuv4sN8CuIy6isYpJteQLg20zGvQD/
         RUnEDopTgZKAOcTsW1WWeq7DSfZsbHP1I/Kn167ub+xbY1zsSIxz93Xeo1sSTqOvkLX4
         NHZg==
X-Gm-Message-State: ABy/qLYwtqeVmY1My8BIr4FGgYahfJQvYk7URCXcTrr92M/dNL3NBwRf
	uUMoaNV+L4UErg5R3F6MVbTgMXKlIF4uX96dG1Lx
X-Google-Smtp-Source: APBJJlGkxJn21mWe9Sf6JvEwFYjnL8542MYOjbs7yCSg+g+MDcAynIxRWeKd2lmeK9qLIMtSojkUVVblgXdfDv0SPWY=
X-Received: by 2002:a25:b285:0:b0:cf8:1070:82d3 with SMTP id
 k5-20020a25b285000000b00cf8107082d3mr15388769ybj.32.1690916566066; Tue, 01
 Aug 2023 12:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230620131223.431281-1-omosnace@redhat.com> <87edkseqf8.fsf@mail.lhotse>
 <CAFqZXNtsCKsr0YHPCSJJQ5An=RoMhf0dufgr7P_SnAAv7CrLjw@mail.gmail.com>
 <CAEjxPJ643nmW6HZOmQGNFDj-cQGf-x3jzZcrO8BHVN9thM23Dw@mail.gmail.com>
 <CAFqZXNuM-807tmT84rZ25xwh078BxvSfav88AozH=tt=J+dCrA@mail.gmail.com>
 <CAJ2a_DdZHFTHiRu5+ZENAwUq1Cor-jVoE9qdhb2x5uSej-MaRA@mail.gmail.com>
 <CAHC9VhQVQv78Xr1bDoJcuT5s441Lvc8AanMvMh8KXG-PuPTVAQ@mail.gmail.com> <CAFqZXNvt1Hz7yZoY47sYQdjUPTTPxa=VmR0=z7or9XjVMwkU=A@mail.gmail.com>
In-Reply-To: <CAFqZXNvt1Hz7yZoY47sYQdjUPTTPxa=VmR0=z7or9XjVMwkU=A@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 1 Aug 2023 15:02:35 -0400
Message-ID: <CAHC9VhRZKtext3ZquaZHDFgfH_SvEPO2Tf8Q6B2SJpt8RRE55g@mail.gmail.com>
Subject: Re: Login broken with old userspace (was Re: [PATCH v2] selinux:
 introduce an initial SID for early boot processes)
To: Ondrej Mosnacek <omosnace@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 1, 2023 at 9:24=E2=80=AFAM Ondrej Mosnacek <omosnace@redhat.com=
> wrote:
> On Fri, Jul 28, 2023 at 5:12=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> >
> > On Fri, Jul 28, 2023 at 9:24=E2=80=AFAM Christian G=C3=B6ttsche
> > <cgzones@googlemail.com> wrote:
> > >
> > > On Fri, 28 Jul 2023 at 15:14, Ondrej Mosnacek <omosnace@redhat.com> w=
rote:
> > > >
> > > > On Fri, Jul 28, 2023 at 1:52=E2=80=AFPM Stephen Smalley
> > > > <stephen.smalley.work@gmail.com> wrote:
> > > > >
> > > > > On Fri, Jul 28, 2023 at 7:36=E2=80=AFAM Ondrej Mosnacek <omosnace=
@redhat.com> wrote:
> > > > > >
> > > > > > On Fri, Jul 28, 2023 at 4:12=E2=80=AFAM Michael Ellerman <mpe@e=
llerman.id.au> wrote:
> > > > > > >
> > > > > > > Ondrej Mosnacek <omosnace@redhat.com> writes:
> > > > > > > > Currently, SELinux doesn't allow distinguishing between ker=
nel threads
> > > > > > > > and userspace processes that are started before the policy =
is first
> > > > > > > > loaded - both get the label corresponding to the kernel SID=
. The only
> > > > > > > > way a process that persists from early boot can get a meani=
ngful label
> > > > > > > > is by doing a voluntary dyntransition or re-executing itsel=
f.
> > > > > > >
> > > > > > > Hi,
> > > > > > >
> > > > > > > This commit breaks login for me when booting linux-next kerne=
ls with old
> > > > > > > userspace, specifically Ubuntu 16.04 on ppc64le. 18.04 is OK.
> > > > > > >
> > > > > > > The symptom is that login never accepts the root password, it=
 just
> > > > > > > always says "Login incorrect".
> > > > > > >
> > > > > > > Bisect points to this commit.
> > > > > > >
> > > > > > > Reverting this commit on top of next-20230726, fixes the prob=
lem
> > > > > > > (ie. login works again).
> > > > > > >
> > > > > > > Booting with selinux=3D0 also fixes the problem.
> > > > > > >
> > > > > > > Is this expected? The change log below suggests backward comp=
atibility
> > > > > > > was considered, is 16.04 just too old?
> > > > > >
> > > > > > Hi Michael,
> > > > > >
> > > > > > I can reproduce it on Fedora 38 when I boot with SELINUX=3Ddisa=
bled in
> > > > > > /etc/selinux/config (+ a kernel including that commit), so it l=
ikely
> > > > > > isn't caused by the userspace being old. Can you check what you=
 have
> > > > > > in /etc/selinux/config (or if it exists at all)?
> > > > > >
> > > > > > We have deprecated and removed the "runtime disable" functional=
ity in
> > > > > > SELinux recently [1], which was used to implement "disabling" S=
ELinux
> > > > > > via the /etc/selinux/config file, so now the situation (selinux=
=3D0 +
> > > > > > SELINUX=3Ddisabled in /etc/selinux/config) leads to a state whe=
re
> > > > > > SELinux is enabled, but no policy is loaded (and no enforcement=
 is
> > > > > > done). Such a state mostly behaves as if SElinux was truly disa=
bled
> > > > > > (via kernel command line), but there are some subtle difference=
s and I
> > > > > > believe we don't officially support it (Paul might clarify). Wi=
th
> > > > > > latest kernels it is recommended to either disable SELinux via =
the
> > > > > > kernel command line (or Kconfig[2]) or to boot it in Enforcing =
or
> > > > > > Permissive mode with a valid/usable policy installed.
> > > > > >
> > > > > > So I wonder if Ubuntu ships by default with the bad configurati=
on or
> > > > > > if it's just a result of using the custom-built linux-next kern=
el (or
> > > > > > some changes on your part). If Ubuntu's stock kernel is configu=
red to
> > > > > > boot with SELinux enabled by default, they should also by defau=
lt ship
> > > > > > a usable policy and SELINUX=3Dpermissive/enforcing in
> > > > > > /etc/selinux/config (or configure the kernel[2] or bootloader t=
o boot
> > > > > > with SELinux disabled by default). (Although if they ship a pre=
-[1]
> > > > > > kernel, they may continue to rely on the runtime disable
> > > > > > functionality, but it means people will have to be careful when
> > > > > > booting newer or custom kernels.)
> > > > > >
> > > > > > That said, I'd like to get to the bottom of why the commit caus=
es the
> > > > > > login to fail and fix it somehow. I presume something in PAM ch=
okes on
> > > > > > the fact that userspace tasks now have "init" instead of "kerne=
l" as
> > > > > > the pre-policy-load security context, but so far I haven't been=
 able
> > > > > > to pinpoint the problem. I'll keep digging...
> > > > > >
> > > > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git/commit/?id=3Df22f9aaf6c3d92ebd5ad9e67acc03afebaaeb289
> > > > > > [2] via CONFIG_LSM (or CONFIG_SECURITY_SELINUX_BOOTPARAM_VALUE =
on older kernels)
> > > > >
> > > > > Prior to selinux userspace commit
> > > > > 685f4aeeadc0b60f3770404d4f149610d656e3c8 ("libselinux:
> > > > > is_selinux_enabled(): drop no-policy-loaded test.") libselinux wa=
s
> > > > > checking the result of reading /proc/self/attr/current to see if =
it
> > > > > returned the "kernel" string as a means of detecting a system wit=
h
> > > > > SELinux enabled but no policy loaded, and treated that as if SELi=
nux
> > > > > were disabled. Hence, this does break old userspace. Not sure tho=
ugh
> > > > > why you'd see the same behavior with modern libselinux.
> > > >
> > > > Hm... now I tried booting the stock Fedora kernel (without the earl=
y
> > > > boot initial SID commit) and I got the same failure to login as wit=
h
> > > > the new kernel. So if Ubuntu 16.04 ships with pre-685f4aeeadc0
> > > > libselinux (quite possible), then it seems that the scenario with
> > > > terminal login + SELinux enabled + policy not loaded only works wit=
h
> > > > pre-685f4aeeadc0 libselinux and pre-5b0eea835d4e kernel, the other
> > > > combinations are broken. With pre-685f4aeeadc0 libselinux +
> > > > post-5b0eea835d4e kernel it is expected as you say (and probably
> > > > inevitable barring some hack on the kernel side), but it's not clea=
r
> > > > why also only updating libselinux seems to break it... /sys/fs/seli=
nux
> > > > is not mounted in my scenario, so there must be something else comi=
ng
> > > > into play.
> > > >
> > > >
> > > > --
> > > > Ondrej Mosnacek
> > > > Senior Software Engineer, Linux Security - SELinux kernel
> > > > Red Hat, Inc.
> > > >
> > >
> > > Completely untested:
> > >
> > > diff --git a/security/selinux/ss/services.c b/security/selinux/ss/ser=
vices.c
> > > index 2c5be06fbada..1ed275bd4551 100644
> > > --- a/security/selinux/ss/services.c
> > > +++ b/security/selinux/ss/services.c
> > > @@ -1322,8 +1322,19 @@ static int security_sid_to_context_core(u32
> > > sid, char **scontext,
> > >         if (!selinux_initialized()) {
> > >                 if (sid <=3D SECINITSID_NUM) {
> > >                         char *scontextp;
> > > -                       const char *s =3D initial_sid_to_string[sid];
> > > +                       const char *s;
> > >
> > > +                       /*
> > > +                        * Hide the context split of kernel threads a=
nd
> > > +                        * userspace threads from userspace before th=
e first
> > > +                        * policy is loaded.  Userspace, e.g. libseli=
nux prior
> > > +                        * to v2.6 or systemd, depends on the context=
 being
> > > +                        * "kernel".
> > > +                        */
> > > +                       if (sid =3D=3D SECINITSID_INIT)
> > > +                               sid =3D SECINITSID_KERNEL;
> > > +
> > > +                       s =3D initial_sid_to_string[sid];
> > >                         if (!s)
> > >                                 return -EINVAL;
> > >                         *scontext_len =3D strlen(s) + 1;
> >
> > I think I'd rather see something that does the following:
> >
> > 1. Convert all direct access of @initial_sid_to_string to calls to
> > security_get_initial_sid_context().  I think we can leave all the
> > stuff under scripts/ as-is, but I didn't think about it that hard, so
> > some additional thought would be required here.
>
> What should we then do with the reverse translation in
> security_context_to_sid_core()? It seems it is currently possible for
> a process to e.g. change its SID to another initial SID before the
> policy is loaded - would we let it to set itself to INIT and yet still
> return back KERNEL afterwards?

Yeah, I wasn't thinking of the reverse translation.  While the sid to
context string mapping is definitely flexible, I really don't like the
idea of changing the sid assigned to an entity, even if there isn't a
policy loaded (yet).

> > 2. Modify security_get_initial_sid_context() to so something similar
> > to what Christian proposed, e.g. translate INIT to KERNEL, but do so
> > only when POLICYDB_CAP_USERSPACE_INITIAL_CONTEXT is not enabled.  I
> > believe this should cover both the uninitialized and old policy case.
>
> You don't know whether the policycap is enabled or not until the
> policy is loaded and at that point it doesn't matter because then you
> already have a full context assigned to the SID.

My perspective is that there are really only two states we care about:
policy loaded with the INITIAL_CONTEXT policycap, and everything else
(including no policy loaded).

> OTOH, I don't know if we have another choice given the "no regressions" r=
ule...

Here's the thing, we're at -rc4 right now and I'm a little concerned
that I haven't seen a fix on-list for this.  If we don't at least have
some sort of design by the end of this week, with a patch early next
week, I'm going to have to revert the patch in selinux/next.

You don't have to like the silly little design above, but we need
*something* to fix this.

--=20
paul-moore.com
