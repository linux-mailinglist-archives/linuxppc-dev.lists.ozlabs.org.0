Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9D86348CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 21:58:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGxRl33zvz3dvB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 07:58:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=X7rHdLp7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=X7rHdLp7;
	dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGxQq4s0Lz3bjW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 07:57:22 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id i64-20020a1c3b43000000b003d016c21100so6648039wma.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 12:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKuICPYKZ9k0XZnBRysJX6NiMCJfmExtlbNu8FtJP1I=;
        b=X7rHdLp79aV6wbOZPObE1MOz+0+MDECt6wlNvu+uY1NNoOlYVIqCJL5DvgsG8KQFdF
         BIc1lKsonKr3A7YnLdZc2/QOOwjpbmzw7wpOvmlvG7wSbyaVbQjwHFHX1f/TbjrIS2X5
         QPoF0PPuoXqDFuT2Aux8kGN0Zx7KMwcki8kzjob8WgN5o9wBPpNLwobv39BSnE+p/kS9
         9Z5VeoOsorHu+4AN+vLBSaAQ9CSqo6WnFNaRJEUCSpMvtLWsYpmZvf+Q1SqAkcnr2Srj
         3zM1T3fntRpoKo1z2GfCznG4kXdpyU4mDcIW5Xl0Z138dL1mgrEAnqqzJbnan15gVwlR
         b8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKuICPYKZ9k0XZnBRysJX6NiMCJfmExtlbNu8FtJP1I=;
        b=PtBjDe2YMTfH6l57wnEDvFvUqlPv4YxHdw/pjPGp3PwaAz5iAlTQg5giYgpBdfC4At
         ujtPcZhYXmY2U/+hU2k8eZcbLLNtmXWfTb/zYlvRD24ekzFtoIylbRZv/1DhionMLViU
         gTo2GbGaoNbjsvdaTzhQUTl0Exp3OG/dJ2T6RS1AUtGDpWsysjmaVoWDAw3R0I8uK3N2
         5yZsIu8mD1LO/YkeVi/D2AR5JBHvptZSdlVCGeqBlAOcke1Sbie/+/sW/OwkSmP+3XHN
         UHYMONksmicA/TaTXansviSPVOvtyj/bp7kRR8K1QiUzLpuUecJSeCY3Ui3hUhecA+q2
         B2Fw==
X-Gm-Message-State: ANoB5pli2Wrn7Hs623WnG7FN6wny+u0nQCXXbJVG2gpX9n5CVDI8jsRW
	mBDoyufUXOY8VjEBAtVWIz5OnhwVSJaWjZfsc3Cdkw==
X-Google-Smtp-Source: AA0mqf4F3pkKVLj9jQvWXUefdlx4PRRlHhEv8mRnnvN19zNb002yc4JGoH2K+TPdkcxmELriKHapH/fusiuvCszRuw0=
X-Received: by 2002:a05:600c:4920:b0:3cf:8b23:549c with SMTP id
 f32-20020a05600c492000b003cf8b23549cmr10830757wmp.174.1669150637535; Tue, 22
 Nov 2022 12:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20221121102747.208289-1-naveen.n.rao@linux.vnet.ibm.com> <a9f0f8f1-96cd-f6a8-9dda-d4744b938f97@csgroup.eu>
In-Reply-To: <a9f0f8f1-96cd-f6a8-9dda-d4744b938f97@csgroup.eu>
From: Ian Rogers <irogers@google.com>
Date: Tue, 22 Nov 2022 12:57:05 -0800
Message-ID: <CAP-5=fXJf+1V5RF-m3e+AhK0Qg-yaJ1_2HL0CTOvp1xkK-1fDg@mail.gmail.com>
Subject: Re: [PATCH] perf test: Skip watchpoint tests if no watchpoints available
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Ravi Bangoria <ravi.bangoria@amd.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 22, 2022 at 11:19 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 21/11/2022 =C3=A0 11:27, Naveen N. Rao a =C3=A9crit :
> > On IBM Power9, perf watchpoint tests fail since no hardware breakpoints
> > are available. Detect this by checking the error returned by
> > perf_event_open() and skip the tests in that case.
> >
> > Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> > Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> > ---
> >   tools/perf/tests/wp.c | 12 +++++++-----
> >   1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/tools/perf/tests/wp.c b/tools/perf/tests/wp.c
> > index 56455da30341b4..cc8719609b19ea 100644
> > --- a/tools/perf/tests/wp.c
> > +++ b/tools/perf/tests/wp.c
> > @@ -59,8 +59,10 @@ static int __event(int wp_type, void *wp_addr, unsig=
ned long wp_len)
> >       get__perf_event_attr(&attr, wp_type, wp_addr, wp_len);
> >       fd =3D sys_perf_event_open(&attr, 0, -1, -1,
> >                                perf_event_open_cloexec_flag());
> > -     if (fd < 0)
> > +     if (fd < 0) {
> > +             fd =3D -errno;
> >               pr_debug("failed opening event %x\n", attr.bp_type);
> > +     }
>
> Do you really need that ?
>
> Can't you directly check errno in the caller ?

errno is very easily clobbered and not clearly set on success - ie,
it'd be better not to do that.

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> >
> >       return fd;
> >   }
> > @@ -77,7 +79,7 @@ static int test__wp_ro(struct test_suite *test __mayb=
e_unused,
> >
> >       fd =3D __event(HW_BREAKPOINT_R, (void *)&data1, sizeof(data1));
> >       if (fd < 0)
> > -             return -1;
> > +             return fd =3D=3D -ENODEV ? TEST_SKIP : -1;
> >
> >       tmp =3D data1;
> >       WP_TEST_ASSERT_VAL(fd, "RO watchpoint", 1);
> > @@ -101,7 +103,7 @@ static int test__wp_wo(struct test_suite *test __ma=
ybe_unused,
> >
> >       fd =3D __event(HW_BREAKPOINT_W, (void *)&data1, sizeof(data1));
> >       if (fd < 0)
> > -             return -1;
> > +             return fd =3D=3D -ENODEV ? TEST_SKIP : -1;
> >
> >       tmp =3D data1;
> >       WP_TEST_ASSERT_VAL(fd, "WO watchpoint", 0);
> > @@ -126,7 +128,7 @@ static int test__wp_rw(struct test_suite *test __ma=
ybe_unused,
> >       fd =3D __event(HW_BREAKPOINT_R | HW_BREAKPOINT_W, (void *)&data1,
> >                    sizeof(data1));
> >       if (fd < 0)
> > -             return -1;
> > +             return fd =3D=3D -ENODEV ? TEST_SKIP : -1;
> >
> >       tmp =3D data1;
> >       WP_TEST_ASSERT_VAL(fd, "RW watchpoint", 1);
> > @@ -150,7 +152,7 @@ static int test__wp_modify(struct test_suite *test =
__maybe_unused, int subtest _
> >
> >       fd =3D __event(HW_BREAKPOINT_W, (void *)&data1, sizeof(data1));
> >       if (fd < 0)
> > -             return -1;
> > +             return fd =3D=3D -ENODEV ? TEST_SKIP : -1;
> >
> >       data1 =3D tmp;
> >       WP_TEST_ASSERT_VAL(fd, "Modify watchpoint", 1);
> >
> > base-commit: 63a3bf5e8d9e79ce456c8f73d4395a5a51d841b1
