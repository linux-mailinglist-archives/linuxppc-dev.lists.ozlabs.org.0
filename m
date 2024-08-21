Return-Path: <linuxppc-dev+bounces-286-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A146D959B31
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 14:04:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WplPf4HrFz2ygB;
	Wed, 21 Aug 2024 22:04:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P2WHV8eX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpkXn4dzKz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 21:25:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C5A060F5A
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 11:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14D9C4AF13
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 11:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724239542;
	bh=Kvnq32RuIPSuDttZFxycxxFwGZsj2tN0L7uucROnTsU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P2WHV8eXl40ui6SvNMnSJ8zOyqgVlR3PFHvEFOdA9bX27iABpk6Jbuo6Iv/WnWVrR
	 7FIbSap6O0WGxgTBZ9eMmw1MkrepM5YKiis+IVzbVUrIH5m4N/SnlOF9JAPg9o8DI2
	 bHtrpyiINgyw8aKmFVsWKoBc7G+zPbOtR43jy/fxIePORpTW976lsGl11dlAmVK16I
	 qRWF8QdJ13sNnAHDOcQyQ3LjMaorodzsdD9u4+fRujqqn7V0OHH2uSieYoTS8tqAFv
	 KSTkZujNwPrdJyCUDuTB01XTvaGY3wsqL6ndIOnbXKYkKhcK7cvOgNRsBfAX25SRU3
	 h08RNlza0caKw==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-26fde6117cfso3803859fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 04:25:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXF/1ORsj0xXQunlXt2STQ9sDpYcHsSOYou5qfHkHqH9LlDRbYL8m42bNAVKbbaW99LSRq0kC9rW/un7zU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyLFHNNzhdifBY/x2VDfQAwW0nA2BsTUcfxdkErzl2Q+qZJFy+o
	sP4fyOCa9oPUzVn4+h94UnPEPWrM2YGbZUPJsJpNXRh0Idjer0f+FhstPfdWp7N6rT/PQoVxIy/
	WudSBHTneilPM+bGKPK40HTCHUuU=
X-Google-Smtp-Source: AGHT+IFVdFpMCmhvEZl2SiUCUpvAzShvYrajztdIQqWdUOBjADmD3QfBXRYsCx5Wxvqm+EPkiAE/26vAZQZCFMBa/rU=
X-Received: by 2002:a05:6871:5824:b0:254:a811:6c75 with SMTP id
 586e51a60fabf-2737eeb0c79mr2009436fac.7.1724239542021; Wed, 21 Aug 2024
 04:25:42 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20150508073418.28491.4150.stgit@preeti.in.ibm.com>
 <3161640.llJtBoKCBr@vostro.rjw.lan> <8965830.CMQzZzsqm0@vostro.rjw.lan>
 <4652506.tkuQIhnkdH@vostro.rjw.lan> <20240821095105.xuf2a5xe3yxqqewj@lcpd911>
In-Reply-To: <20240821095105.xuf2a5xe3yxqqewj@lcpd911>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 21 Aug 2024 13:25:31 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0goEQC3xF11wOm7q3TA51WfaM_g1zBV+nKpVYyvH5fmag@mail.gmail.com>
Message-ID: <CAJZ5v0goEQC3xF11wOm7q3TA51WfaM_g1zBV+nKpVYyvH5fmag@mail.gmail.com>
Subject: Re: [PATCH 3/3] cpuidle: Select a different state on
 tick_broadcast_enter() failures
To: Dhruva Gole <d-gole@ti.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Preeti U Murthy <preeti@linux.vnet.ibm.com>, peterz@infradead.org, 
	rlippert@google.com, daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, 
	linus.walleij@linaro.org, rafael.j.wysocki@intel.com, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, sudeep.holla@arm.com, 
	tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, khilman@ti.com, 
	Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 1:15=E2=80=AFPM Dhruva Gole <d-gole@ti.com> wrote:
>
> Hi,
>
> On May 10, 2015 at 01:19:52 +0200, Rafael J. Wysocki wrote:
> > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > If tick_broadcast_enter() fails in cpuidle_enter_state(),
> > try to find another idle state to enter instead of invoking
> > default_idle_call() immediately and returning -EBUSY which
> > should increase the chances of saving some energy in those
> > cases.
> >
> > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
>
> Found this during code review, hence dug up this old thread again,
>
> >  drivers/cpuidle/cpuidle.c |   20 +++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> >
> > Index: linux-pm/drivers/cpuidle/cpuidle.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- linux-pm.orig/drivers/cpuidle/cpuidle.c
> > +++ linux-pm/drivers/cpuidle/cpuidle.c
> > @@ -73,7 +73,10 @@ int cpuidle_play_dead(void)
> >  }
> >
> >  static int find_deepest_state(struct cpuidle_driver *drv,
> > -                           struct cpuidle_device *dev, bool freeze)
> > +                           struct cpuidle_device *dev,
> > +                           unsigned int max_latency,
> > +                           unsigned int forbidden_flags,
> > +                           bool freeze)
> >  {
> >       unsigned int latency_req =3D 0;
> >       int i, ret =3D freeze ? -1 : CPUIDLE_DRIVER_STATE_START - 1;
> > @@ -83,6 +86,8 @@ static int find_deepest_state(struct cpu
> >               struct cpuidle_state_usage *su =3D &dev->states_usage[i];
> >
> >               if (s->disabled || su->disable || s->exit_latency <=3D la=
tency_req
> > +                 || s->exit_latency > max_latency
> > +                 || (s->flags & forbidden_flags)
> >                   || (freeze && !s->enter_freeze))
> >                       continue;
> >
> > @@ -100,7 +105,7 @@ static int find_deepest_state(struct cpu
> >  int cpuidle_find_deepest_state(struct cpuidle_driver *drv,
> >                              struct cpuidle_device *dev)
> >  {
> > -     return find_deepest_state(drv, dev, false);
> > +     return find_deepest_state(drv, dev, UINT_MAX, 0, false);
> >  }
> >
> >  static void enter_freeze_proper(struct cpuidle_driver *drv,
> > @@ -139,7 +144,7 @@ int cpuidle_enter_freeze(struct cpuidle_
> >        * that interrupts won't be enabled when it exits and allows the =
tick to
> >        * be frozen safely.
> >        */
> > -     index =3D find_deepest_state(drv, dev, true);
> > +     index =3D find_deepest_state(drv, dev, UINT_MAX, 0, true);
> >       if (index >=3D 0)
> >               enter_freeze_proper(drv, dev, index);
> >
> > @@ -168,8 +173,13 @@ int cpuidle_enter_state(struct cpuidle_d
> >        * CPU as a broadcast timer, this call may fail if it is not avai=
lable.
> >        */
> >       if (broadcast && tick_broadcast_enter()) {
> > -             default_idle_call();
> > -             return -EBUSY;
> > +             index =3D find_deepest_state(drv, dev, target_state->exit=
_latency,
> > +                                        CPUIDLE_FLAG_TIMER_STOP, false=
);
> > +             if (index < 0) {
>
> Would this condition ever meet?
> If you see, the ret inside find_deepest_state is always starting with a 0=
 and
> then nobody is ever really making it negative again. So the func either
> returns a 0 or some positive value right?
>
> Since nobody has probably raised an issue about this in 9 years, is this
> basically dead code inside the if?

Yes, it is dead code now.

> Let me know what needs to be done here, I'd be happy to patch this up.

Please feel free to send a patch removing the redundant check.

> > +                     default_idle_call();
> > +                     return -EBUSY;
> > +             }
> > +             target_state =3D &drv->states[index];
> >       }
> >
> >       /* Take note of the planned idle state. */
> >
>
> --

