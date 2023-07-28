Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FBB767044
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 17:13:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=cbUs7BZv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCB3406q8z3cLn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 01:13:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=cbUs7BZv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCB293jYvz2yWD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 01:12:15 +1000 (AEST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5838881e30bso23286877b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 08:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1690557130; x=1691161930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9VTV3cc3uFUdaaZLXGJRHZxLwC7rzN3WwthVACLw1g=;
        b=cbUs7BZvU5wP3klQssJl1mW304F4sSMSIHV9d8dNWgTmc9u7aawcWP9DoX8bi+u2vu
         9xOwfUi8KFOZItTI/FLIdtAZHAXY/VVtCS/Ro7QrnrMLuP2qRvC9T4s8EhArRm4W4TuY
         hgwshl4PZesthutHYQtLrwIou8EupKl3N0+wJS73I91a9AptcIVKZrDzkBgh9jUpA9Rx
         2ODn1Z91Yn7k1F3TPPB1Y22qyELIjhYRZCLngiWnUo3SZpIqa0bcdhgafIRYTwLfgqv7
         O1dvDO8eu6sBGpGSSyCDOV8X61dtoUjXGopoxkWfl8m5q8YUmNBhMH/n1ZBRqV69gsp7
         jAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690557130; x=1691161930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9VTV3cc3uFUdaaZLXGJRHZxLwC7rzN3WwthVACLw1g=;
        b=WZ4g3rHsIlyp8fDAhFTUVk0W32lAAuId4+sXLPxCb0E6x3tKZoySnNUmGSj8Q97i79
         8p73i6Ezw/C/n8i9/76I8NBO9o8yZ1mvOvTICUKlK7bPj3sAmUaG4XGLwumOy6gquloM
         NhqoJSJovDzLkE2LlWxlFPO1DgcX9tx01SWfP2mbL51e6RJr3lGvFE7Kn9HdI5fRS1rm
         GhK1MEZq71ULAIvKzqLjgq2XYW/MqdqifRKkhAE/RIeOPinc11y0IVCtEucyM+W4rFhQ
         jOhx2NUf643fq0DAb6uawd6tOOVJUFxwQwambGKchPTipGQPsI5o2jb7kUaPCFyK9toX
         DKGQ==
X-Gm-Message-State: ABy/qLYIBxbRyREnMFme51h4p55zThgf9Y7rqUEM1aETcglkfplp01H+
	4Q5fp8tAtSE73DhFHOZO33nMr5O6xLDonI9Ysenp
X-Google-Smtp-Source: APBJJlF9k8AoCv5KjPjcbgdT2p1nC+ahxGbIPsazhnM8tgHnjdHF65q3xdEGgbvngzfwVTp+/Bv7ceLxm0HQFpIaNHg=
X-Received: by 2002:a81:9242:0:b0:583:9c78:9a84 with SMTP id
 j63-20020a819242000000b005839c789a84mr2147967ywg.43.1690557129725; Fri, 28
 Jul 2023 08:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230620131223.431281-1-omosnace@redhat.com> <87edkseqf8.fsf@mail.lhotse>
 <CAFqZXNtsCKsr0YHPCSJJQ5An=RoMhf0dufgr7P_SnAAv7CrLjw@mail.gmail.com>
 <CAEjxPJ643nmW6HZOmQGNFDj-cQGf-x3jzZcrO8BHVN9thM23Dw@mail.gmail.com>
 <CAFqZXNuM-807tmT84rZ25xwh078BxvSfav88AozH=tt=J+dCrA@mail.gmail.com> <CAJ2a_DdZHFTHiRu5+ZENAwUq1Cor-jVoE9qdhb2x5uSej-MaRA@mail.gmail.com>
In-Reply-To: <CAJ2a_DdZHFTHiRu5+ZENAwUq1Cor-jVoE9qdhb2x5uSej-MaRA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 28 Jul 2023 11:11:58 -0400
Message-ID: <CAHC9VhQVQv78Xr1bDoJcuT5s441Lvc8AanMvMh8KXG-PuPTVAQ@mail.gmail.com>
Subject: Re: Login broken with old userspace (was Re: [PATCH v2] selinux:
 introduce an initial SID for early boot processes)
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
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
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 28, 2023 at 9:24=E2=80=AFAM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> On Fri, 28 Jul 2023 at 15:14, Ondrej Mosnacek <omosnace@redhat.com> wrote=
:
> >
> > On Fri, Jul 28, 2023 at 1:52=E2=80=AFPM Stephen Smalley
> > <stephen.smalley.work@gmail.com> wrote:
> > >
> > > On Fri, Jul 28, 2023 at 7:36=E2=80=AFAM Ondrej Mosnacek <omosnace@red=
hat.com> wrote:
> > > >
> > > > On Fri, Jul 28, 2023 at 4:12=E2=80=AFAM Michael Ellerman <mpe@eller=
man.id.au> wrote:
> > > > >
> > > > > Ondrej Mosnacek <omosnace@redhat.com> writes:
> > > > > > Currently, SELinux doesn't allow distinguishing between kernel =
threads
> > > > > > and userspace processes that are started before the policy is f=
irst
> > > > > > loaded - both get the label corresponding to the kernel SID. Th=
e only
> > > > > > way a process that persists from early boot can get a meaningfu=
l label
> > > > > > is by doing a voluntary dyntransition or re-executing itself.
> > > > >
> > > > > Hi,
> > > > >
> > > > > This commit breaks login for me when booting linux-next kernels w=
ith old
> > > > > userspace, specifically Ubuntu 16.04 on ppc64le. 18.04 is OK.
> > > > >
> > > > > The symptom is that login never accepts the root password, it jus=
t
> > > > > always says "Login incorrect".
> > > > >
> > > > > Bisect points to this commit.
> > > > >
> > > > > Reverting this commit on top of next-20230726, fixes the problem
> > > > > (ie. login works again).
> > > > >
> > > > > Booting with selinux=3D0 also fixes the problem.
> > > > >
> > > > > Is this expected? The change log below suggests backward compatib=
ility
> > > > > was considered, is 16.04 just too old?
> > > >
> > > > Hi Michael,
> > > >
> > > > I can reproduce it on Fedora 38 when I boot with SELINUX=3Ddisabled=
 in
> > > > /etc/selinux/config (+ a kernel including that commit), so it likel=
y
> > > > isn't caused by the userspace being old. Can you check what you hav=
e
> > > > in /etc/selinux/config (or if it exists at all)?
> > > >
> > > > We have deprecated and removed the "runtime disable" functionality =
in
> > > > SELinux recently [1], which was used to implement "disabling" SELin=
ux
> > > > via the /etc/selinux/config file, so now the situation (selinux=3D0=
 +
> > > > SELINUX=3Ddisabled in /etc/selinux/config) leads to a state where
> > > > SELinux is enabled, but no policy is loaded (and no enforcement is
> > > > done). Such a state mostly behaves as if SElinux was truly disabled
> > > > (via kernel command line), but there are some subtle differences an=
d I
> > > > believe we don't officially support it (Paul might clarify). With
> > > > latest kernels it is recommended to either disable SELinux via the
> > > > kernel command line (or Kconfig[2]) or to boot it in Enforcing or
> > > > Permissive mode with a valid/usable policy installed.
> > > >
> > > > So I wonder if Ubuntu ships by default with the bad configuration o=
r
> > > > if it's just a result of using the custom-built linux-next kernel (=
or
> > > > some changes on your part). If Ubuntu's stock kernel is configured =
to
> > > > boot with SELinux enabled by default, they should also by default s=
hip
> > > > a usable policy and SELINUX=3Dpermissive/enforcing in
> > > > /etc/selinux/config (or configure the kernel[2] or bootloader to bo=
ot
> > > > with SELinux disabled by default). (Although if they ship a pre-[1]
> > > > kernel, they may continue to rely on the runtime disable
> > > > functionality, but it means people will have to be careful when
> > > > booting newer or custom kernels.)
> > > >
> > > > That said, I'd like to get to the bottom of why the commit causes t=
he
> > > > login to fail and fix it somehow. I presume something in PAM chokes=
 on
> > > > the fact that userspace tasks now have "init" instead of "kernel" a=
s
> > > > the pre-policy-load security context, but so far I haven't been abl=
e
> > > > to pinpoint the problem. I'll keep digging...
> > > >
> > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3Df22f9aaf6c3d92ebd5ad9e67acc03afebaaeb289
> > > > [2] via CONFIG_LSM (or CONFIG_SECURITY_SELINUX_BOOTPARAM_VALUE on o=
lder kernels)
> > >
> > > Prior to selinux userspace commit
> > > 685f4aeeadc0b60f3770404d4f149610d656e3c8 ("libselinux:
> > > is_selinux_enabled(): drop no-policy-loaded test.") libselinux was
> > > checking the result of reading /proc/self/attr/current to see if it
> > > returned the "kernel" string as a means of detecting a system with
> > > SELinux enabled but no policy loaded, and treated that as if SELinux
> > > were disabled. Hence, this does break old userspace. Not sure though
> > > why you'd see the same behavior with modern libselinux.
> >
> > Hm... now I tried booting the stock Fedora kernel (without the early
> > boot initial SID commit) and I got the same failure to login as with
> > the new kernel. So if Ubuntu 16.04 ships with pre-685f4aeeadc0
> > libselinux (quite possible), then it seems that the scenario with
> > terminal login + SELinux enabled + policy not loaded only works with
> > pre-685f4aeeadc0 libselinux and pre-5b0eea835d4e kernel, the other
> > combinations are broken. With pre-685f4aeeadc0 libselinux +
> > post-5b0eea835d4e kernel it is expected as you say (and probably
> > inevitable barring some hack on the kernel side), but it's not clear
> > why also only updating libselinux seems to break it... /sys/fs/selinux
> > is not mounted in my scenario, so there must be something else coming
> > into play.
> >
> >
> > --
> > Ondrej Mosnacek
> > Senior Software Engineer, Linux Security - SELinux kernel
> > Red Hat, Inc.
> >
>
> Completely untested:
>
> diff --git a/security/selinux/ss/services.c b/security/selinux/ss/service=
s.c
> index 2c5be06fbada..1ed275bd4551 100644
> --- a/security/selinux/ss/services.c
> +++ b/security/selinux/ss/services.c
> @@ -1322,8 +1322,19 @@ static int security_sid_to_context_core(u32
> sid, char **scontext,
>         if (!selinux_initialized()) {
>                 if (sid <=3D SECINITSID_NUM) {
>                         char *scontextp;
> -                       const char *s =3D initial_sid_to_string[sid];
> +                       const char *s;
>
> +                       /*
> +                        * Hide the context split of kernel threads and
> +                        * userspace threads from userspace before the fi=
rst
> +                        * policy is loaded.  Userspace, e.g. libselinux =
prior
> +                        * to v2.6 or systemd, depends on the context bei=
ng
> +                        * "kernel".
> +                        */
> +                       if (sid =3D=3D SECINITSID_INIT)
> +                               sid =3D SECINITSID_KERNEL;
> +
> +                       s =3D initial_sid_to_string[sid];
>                         if (!s)
>                                 return -EINVAL;
>                         *scontext_len =3D strlen(s) + 1;

I think I'd rather see something that does the following:

1. Convert all direct access of @initial_sid_to_string to calls to
security_get_initial_sid_context().  I think we can leave all the
stuff under scripts/ as-is, but I didn't think about it that hard, so
some additional thought would be required here.

2. Modify security_get_initial_sid_context() to so something similar
to what Christian proposed, e.g. translate INIT to KERNEL, but do so
only when POLICYDB_CAP_USERSPACE_INITIAL_CONTEXT is not enabled.  I
believe this should cover both the uninitialized and old policy case.

It might be easier if both were done as a single patch, as those that
want the userspace isid patch will likely want this as a fix, but if
it becomes to ugly I have no problem splitting #1 and #2 into
different patches.

What do folks think?  Am I missing something?

--=20
paul-moore.com
