Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0EB786560
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 04:30:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dIZlZFi+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWRs81ZYgz3c5H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 12:30:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dIZlZFi+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWRrH61XXz2yWD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 12:30:06 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-68a410316a2so2974915b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 19:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692844201; x=1693449001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJwrGCdChlY0C/dK5bpgf0LNuuHaWM9CyX2jaifdjkQ=;
        b=dIZlZFi+0C8OXo/tvDM8xN0jWqsWzIqVYXm3R6KcEWrtS8qXR4mDtn3JiEyeBzsJZy
         2ecEh13YW6Qg3CqauLIhEisbNYg1eUujo2i+9zfnrS31rQWbRRHoR/0VbZ8wuhgArTwY
         mPvBS4/Cr+098GVTFr40NkuKA1gzb47ObEJ3+fwMtqLXRIzaRMIueef7P7rAGRW1TprC
         EmtTJaVOXLRIQThnfKxIGADuA3MhJhJ43qA9ZbwCGp4JokSdXu4GNIxUU6e1RPfNhT2m
         H/YzCS+BL7aUm3Ss90dZIYSw2N9cqZcRec49MjTdKOT0E3I4LDpufByVzlM8WNE3Ir5W
         5rtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692844201; x=1693449001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJwrGCdChlY0C/dK5bpgf0LNuuHaWM9CyX2jaifdjkQ=;
        b=dc6f4hd4hf5IFQr2j0kOt8ALofSRkj0Spq/KmuYfe4Ft8KHe6WlcQ2tQ9bw89hB3L5
         IdnisdXMIBzrBYGM6wtjgDfNvy1KxNtJHMKQmWke+Ta/+l2+SQOkEK51tPX+2N0/yNgl
         zdVchIXpORBQr3CV9/0xq+zGrPtGd9Szg05Gjf61shrd7d6Ds7XK5UxOuPWdkSNzj6K5
         4y5GiiW9L9NVeT6ZPEIqmYgYsP5nhLGwpCMZ3b/cVdDBVAvZ9z81LZVrUBX/bKTTgW/D
         I1Xw/kiKTLL1W0C/6yAukAJBfupsHuu1lW0t7ARHo6kOuij69Mb06tPedytT4r3dVx+Q
         mfbg==
X-Gm-Message-State: AOJu0YyilAwUA9DHCSI3synKdFV3xtgjHGuz32IjWVakpP/h1UXkvczQ
	s5kjZsHISGpctbBuA6YVk2Fa6So3SmQeBNXSvk4=
X-Google-Smtp-Source: AGHT+IFYVKAUMDGtiJjAbfnyLW8QA5tWrGQuRRrj+4nZz4K4wjPD5UW8eP8IWQXI4wVbJxpiqG9OkvpSP927vbaK50g=
X-Received: by 2002:a05:6a00:98f:b0:68b:da4b:4620 with SMTP id
 u15-20020a056a00098f00b0068bda4b4620mr4368790pfg.31.1692844200814; Wed, 23
 Aug 2023 19:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <1683039962-15751-1-git-send-email-zhouzhouyi@gmail.com> <795ab1ed-de92-4f31-9483-b1800b597405@paulmck-laptop>
In-Reply-To: <795ab1ed-de92-4f31-9483-b1800b597405@paulmck-laptop>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Thu, 24 Aug 2023 10:29:49 +0800
Message-ID: <CAABZP2zfSmeLO=DRTKP7wPg2zFc4a2AOx31oWTK-xLubqYvS0g@mail.gmail.com>
Subject: Re: [PATCH RFC] rcu: torture: shorten the time between
 forward-progress tests
To: paulmck@kernel.org
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
Cc: rcu@vger.kernel.org, lance@osuosl.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 24, 2023 at 5:15=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Tue, May 02, 2023 at 11:06:02PM +0800, zhouzhouyi@gmail.com wrote:
> > From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> >
> > Currently, default time between rcu torture forward-progress tests is 6=
0HZ,
> > Under this configuration, false positive caused by __stack_chk_fail [1]=
 is
> > difficult to reproduce (needs average 5*420 seconds for SRCU-P),
> > which means one has to invoke [2] 5 times in average to make [1] appear=
.
> >
> > With time between rcu torture forward-progress tests be 1 HZ, above
> > phenomenon will be reproduced within 3 minutes, which means we can
> > reproduce [1] everytime we invoke [2].
> >
> > Although [1] is a false positive, this change will make possible future
> > true bugs easier to be discovered.
> >
> > [1] Link: https://lore.kernel.org/lkml/CAABZP2yS5=3DZUwEZQ7iHkV0wDm_HgO=
8K-TeAhyJrZhavzKDa44Q@mail.gmail.com/T/
> > [2] tools/testing/selftests/rcutorture/bin/torture.sh
> >
> > Tested in PPC VM of Opensource Lab of Oregon State Univerisity.
> >
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
>
> Please accept my apologies for being ridiculously slow to reply!
Never mind. I have made a lot of self improvement during the study of
RCU and RCU torture and your book ;-)
>
> In recent -rcu, module parameters such as this one that simply set a
> value can be overridden on the command line.  So you could get the effect
> (again, in recent kernels) in your testing by adding:
>
>         --bootargs "rcutorture.fwd_progress_holdoff=3D1"
>
> The reason that I am reluctant to accept this patch is that we sometimes
> have trouble with this forward-progress testing exhausting memory, and
> making in happen could therefore cause trouble with generic rcutorture
> testing.
Agree, false positives can disrupt our judgement in many cases.

Thanx Zhouyi
>
> Or am I missing the point of this change?
>
>                                                         Thanx, Paul
>
> > ---
> >  tools/testing/selftests/rcutorture/configs/rcu/SRCU-N.boot  | 1 +
> >  tools/testing/selftests/rcutorture/configs/rcu/SRCU-P.boot  | 1 +
> >  tools/testing/selftests/rcutorture/configs/rcu/TRACE02.boot | 1 +
> >  tools/testing/selftests/rcutorture/configs/rcu/TREE02.boot  | 1 +
> >  tools/testing/selftests/rcutorture/configs/rcu/TREE10.boot  | 1 +
> >  5 files changed, 5 insertions(+)
> >
> > diff --git a/tools/testing/selftests/rcutorture/configs/rcu/SRCU-N.boot=
 b/tools/testing/selftests/rcutorture/configs/rcu/SRCU-N.boot
> > index ce0694fd9b92..982582bff041 100644
> > --- a/tools/testing/selftests/rcutorture/configs/rcu/SRCU-N.boot
> > +++ b/tools/testing/selftests/rcutorture/configs/rcu/SRCU-N.boot
> > @@ -1,2 +1,3 @@
> >  rcutorture.torture_type=3Dsrcu
> >  rcutorture.fwd_progress=3D3
> > +rcutorture.fwd_progress_holdoff=3D1
> > diff --git a/tools/testing/selftests/rcutorture/configs/rcu/SRCU-P.boot=
 b/tools/testing/selftests/rcutorture/configs/rcu/SRCU-P.boot
> > index 2db39f298d18..18f5d7361d8a 100644
> > --- a/tools/testing/selftests/rcutorture/configs/rcu/SRCU-P.boot
> > +++ b/tools/testing/selftests/rcutorture/configs/rcu/SRCU-P.boot
> > @@ -1,4 +1,5 @@
> >  rcutorture.torture_type=3Dsrcud
> >  rcupdate.rcu_self_test=3D1
> >  rcutorture.fwd_progress=3D3
> > +rcutorture.fwd_progress_holdoff=3D1
> >  srcutree.big_cpu_lim=3D5
> > diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TRACE02.boo=
t b/tools/testing/selftests/rcutorture/configs/rcu/TRACE02.boot
> > index c70b5db6c2ae..b86bc7df7603 100644
> > --- a/tools/testing/selftests/rcutorture/configs/rcu/TRACE02.boot
> > +++ b/tools/testing/selftests/rcutorture/configs/rcu/TRACE02.boot
> > @@ -1,2 +1,3 @@
> >  rcutorture.torture_type=3Dtasks-tracing
> >  rcutorture.fwd_progress=3D2
> > +rcutorture.fwd_progress_holdoff=3D1
> > diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TREE02.boot=
 b/tools/testing/selftests/rcutorture/configs/rcu/TREE02.boot
> > index dd914fa8f690..933302f885df 100644
> > --- a/tools/testing/selftests/rcutorture/configs/rcu/TREE02.boot
> > +++ b/tools/testing/selftests/rcutorture/configs/rcu/TREE02.boot
> > @@ -1 +1,2 @@
> >  rcutorture.fwd_progress=3D2
> > +rcutorture.fwd_progress_holdoff=3D1
> > diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TREE10.boot=
 b/tools/testing/selftests/rcutorture/configs/rcu/TREE10.boot
> > index dd914fa8f690..933302f885df 100644
> > --- a/tools/testing/selftests/rcutorture/configs/rcu/TREE10.boot
> > +++ b/tools/testing/selftests/rcutorture/configs/rcu/TREE10.boot
> > @@ -1 +1,2 @@
> >  rcutorture.fwd_progress=3D2
> > +rcutorture.fwd_progress_holdoff=3D1
> > --
> > 2.34.1
> >
