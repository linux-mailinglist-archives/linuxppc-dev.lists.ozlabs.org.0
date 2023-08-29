Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A06278CC9E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 21:04:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Eqez4OV+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZxgH3cHYz3c4L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 05:04:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Eqez4OV+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZxfP65vMz2yDM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 05:03:40 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4036bd4fff1so59761cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 12:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693335815; x=1693940615; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iyjv+xG6FAuUSXvFBzJTJDnPCJ6wikudc5tFgMXi6Ws=;
        b=Eqez4OV+A9lP9jBKudl7FJPK5UY7s8LW5tSBPOn82ly+8exnjiSFTlbLq/cMyAGdWk
         6fES7p/Y+AT7QXmuiLbmhm4ZAamjuIE2B1vRzYGf6BMqRWhb1YmWzEokUfVv1tvyg6ti
         hIXxNVSOV5vXIF2n+8T7B9p2oEgO5+oOIQMrJ6fChy+7+vZZm9nOK2H2NGColvx1wMpL
         Vdv0cX9tUXQErCnkmE6s0piY5iY+3+RwMsM9lqDH/HnjSKVn6HjZDPQNq1pTWzUscoPK
         NVsqMwOiyQoX1IyFuzdXCIc4pnKWLniYRtvdQgG4SXbzzN40XV86ldZ7jGJsCJw4mJLO
         lhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693335815; x=1693940615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iyjv+xG6FAuUSXvFBzJTJDnPCJ6wikudc5tFgMXi6Ws=;
        b=eTNXO2JH37F/qB0s3TBnwR8RHC1osZMtVgQyKoI3JGbcnn3KlFFVJDTFBJCFsXD18U
         JD6exFwFJK1eZemBrdZmjZa513C+QvXt0C59pqLHZZKnPDdaBPQnN7UQ4FNHa+BfFQfy
         AwqjqA+oTK2q7DD0JR3RMuiXVFg0WtTxN2ViGiorNwC/M4GHdFChoszHUVIBlIfwZUZM
         MZBn13/kgQPI6WS8BLaTFlljUOUFk5Nrs9vSvGNxqFCOOKgMES7wJ0HUnBdJ/gQUjb9Q
         T2oioCOcJAGVxTVTC5H2yzE8zBXhTtyWmbfh/s0HCe57neWu7xv0+qhqQoRVTJEiIRxE
         eKWg==
X-Gm-Message-State: AOJu0YwVe0Af7M17h29MCg6NV7+El0s+P4x8oE4bWEC3oyoKnneIK4eE
	kp82Pele5+Ks3DD7EITNRi/1y0r14n1bgXJk5pk3kA==
X-Google-Smtp-Source: AGHT+IH7E4oasKJ8MWoXSX/tKk5h3C+ddbq3aUKGPCVerr3qfoXNPlz94HgHqpifcB3kF42EmZX2rWY2IQcvBcLhZeU=
X-Received: by 2002:a05:622a:1a23:b0:3ef:5f97:258f with SMTP id
 f35-20020a05622a1a2300b003ef5f97258fmr337091qtb.16.1693335815362; Tue, 29 Aug
 2023 12:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230823075103.190565-1-kjain@linux.ibm.com> <CUZVDJPWI4GL.NVVOJTWE6U5S@naverao1-tp>
In-Reply-To: <CUZVDJPWI4GL.NVVOJTWE6U5S@naverao1-tp>
From: Ian Rogers <irogers@google.com>
Date: Tue, 29 Aug 2023 12:03:23 -0700
Message-ID: <CAP-5=fVOq2Md3SgtkBqn7q2ydCqe_=mFwF18+hR8Ex+=phJacw@mail.gmail.com>
Subject: Re: [PATCH] perf test: Skip perf bench breakpoint run if no
 breakpoints available
To: Naveen N Rao <naveen@kernel.org>
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
Cc: Disha Goel <disgoel@linux.vnet.ibm.com>, atrajeev@linux.vnet.ibm.com, Kajol Jain <kjain@linux.ibm.com>, acme@kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, naveen.n.rao@linux.vnet.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 23, 2023 at 4:00=E2=80=AFAM Naveen N Rao <naveen@kernel.org> wr=
ote:
>
> Hi Kajol,
>
> On Wed Aug 23, 2023 at 1:21 PM IST, Kajol Jain wrote:
> > Based on commit 7d54a4acd8c1 ("perf test: Skip watchpoint
> > tests if no watchpoints available"), hardware breakpoints
> > are not available for power9 platform and because of that
> > perf bench breakpoint run fails on power9 platform.
> > Add code to check for the return value of perf_event_open()
> > in breakpoint run and skip the perf bench breakpoint run,
> > if hardware breakpoints are not available.
> >
> > Result on power9 system before patch changes:
> > [command]# perf bench breakpoint thread
> > perf_event_open: No such device
> >
> > Result on power9 system after patch changes:
> > [command]# ./perf bench breakpoint thread
> > Skipping perf bench breakpoint thread: No hardware support
> >
> > Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> > Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> > ---
> >  tools/perf/bench/breakpoint.c | 24 +++++++++++++++++++++---
> >  1 file changed, 21 insertions(+), 3 deletions(-)
>
> Thanks for fixing this to not report an error. A minor nit below, but
> otherwise:
> Acked-by: Naveen N Rao <naveen@kernel.org>
>
> >
> > diff --git a/tools/perf/bench/breakpoint.c b/tools/perf/bench/breakpoin=
t.c
> > index 41385f89ffc7..dfd18f5db97d 100644
> > --- a/tools/perf/bench/breakpoint.c
> > +++ b/tools/perf/bench/breakpoint.c
> > @@ -47,6 +47,7 @@ struct breakpoint {
> >  static int breakpoint_setup(void *addr)
> >  {
> >       struct perf_event_attr attr =3D { .size =3D 0, };
> > +     int fd;
> >
> >       attr.type =3D PERF_TYPE_BREAKPOINT;
> >       attr.size =3D sizeof(attr);
> > @@ -56,7 +57,12 @@ static int breakpoint_setup(void *addr)
> >       attr.bp_addr =3D (unsigned long)addr;
> >       attr.bp_type =3D HW_BREAKPOINT_RW;
> >       attr.bp_len =3D HW_BREAKPOINT_LEN_1;
> > -     return syscall(SYS_perf_event_open, &attr, 0, -1, -1, 0);
> > +     fd =3D syscall(SYS_perf_event_open, &attr, 0, -1, -1, 0);
> > +
> > +     if (fd < 0)
> > +             fd =3D -errno;
> > +
> > +     return fd;
> >  }
> >
> >  static void *passive_thread(void *arg)
> > @@ -122,8 +128,14 @@ int bench_breakpoint_thread(int argc, const char *=
*argv)
> >
> >       for (i =3D 0; i < thread_params.nbreakpoints; i++) {
> >               breakpoints[i].fd =3D breakpoint_setup(&breakpoints[i].wa=
tched);
> > -             if (breakpoints[i].fd =3D=3D -1)
> > +
> > +             if (breakpoints[i].fd < 0) {
> > +                     if (breakpoints[i].fd =3D=3D -ENODEV) {
> > +                             printf("Skipping perf bench breakpoint th=
read: No hardware support\n");
> > +                             return 0;
>
> Should we instead do 'exit(0)' here to stop further benchmarks? Perhaps:
>   err(EXIT_SUCCESS, "Skipping perf bench breakpoint thread: No hardware s=
upport");
>
> EXIT_SUCCESS looks weird, but should help document that this is not an
> error.

In tools/perf/tests/tests.h is:

enum {
       TEST_OK   =3D  0,
       TEST_FAIL =3D -1,
       TEST_SKIP =3D -2,
};

So I think the EXIT_SUCCESS/0 should really be TEST_OK, but I think it
would clearer if these cases were TEST_SKIP.

Thanks,
Ian

> > +                     }
> >                       exit((perror("perf_event_open"), EXIT_FAILURE));
> > +             }
> >       }
> >       gettimeofday(&start, NULL);
> >       for (i =3D 0; i < thread_params.nparallel; i++) {
> > @@ -196,8 +208,14 @@ int bench_breakpoint_enable(int argc, const char *=
*argv)
> >               exit(EXIT_FAILURE);
> >       }
> >       fd =3D breakpoint_setup(&watched);
> > -     if (fd =3D=3D -1)
> > +
> > +     if (fd < 0) {
> > +             if (fd =3D=3D -ENODEV) {
> > +                     printf("Skipping perf bench breakpoint enable: No=
 hardware support\n");
> > +                     return 0;
>
> Here too.
>
> - Naveen
>
> > +             }
> >               exit((perror("perf_event_open"), EXIT_FAILURE));
> > +     }
> >       nthreads =3D enable_params.npassive + enable_params.nactive;
> >       threads =3D calloc(nthreads, sizeof(threads[0]));
> >       if (!threads)
>
