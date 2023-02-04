Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE18068AC94
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 22:25:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8QXb4Yjnz3f82
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 08:25:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ROSh4d0F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ROSh4d0F;
	dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8QWg5wCrz2yw0
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 08:24:14 +1100 (AEDT)
Received: by mail-wm1-x331.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so8315226wmb.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Feb 2023 13:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PARsC8y1fPOLUn5xm+fwUpwavqaXYaKZQCUnLUBx/AY=;
        b=ROSh4d0FpqJs8EZAFBENi9nSEZsbr7+OYgUVCkyfoz70uvDwzo3wKCvO8P3dzrhkgg
         +MrRaxu4KnvTg1c/Lc9uA5/0kcOjZd7jES4QK6IRQkvTdQwSCEIWR3Y4HsxOLGUVQ/8y
         AymaF5hX5TUlHN4eiB3z1/aUP6/RA2P7o5VFGy1NZMGOc83eYY5podlRfX1R3copJfWf
         WfeO/jWPsJp2kqEvZPbLAwORIqf7YTB7DvhRngEMxZPJwA3tDk2EFIQtb+/YOGlH0SWB
         IzApacoZLLrLAHO/e1YfAhuYWGGhtKLjM/4Orb+TLWvt3jyQNX07qnkyvdmNXeB2h3re
         vD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PARsC8y1fPOLUn5xm+fwUpwavqaXYaKZQCUnLUBx/AY=;
        b=6gVN6ewWndaXbJmZv8+N5qDDBDvH88HIAh2wQsk2Mot1uxMTfwD1iAkTpXY+cc2NIo
         eH6X2BC/yhd/OzofwXUzt/KOh7P5699WKS8aPqbFD482NqARkTem5/cv4vYqKLfncxPy
         Z4vRYGAlmJQfiO3gZB2D+OguhVhFEZ81or2i8dUQXNHxuY7tCC43oHElLTT4kBl/9uno
         02osPPKOyj/pdssZhA4qG8/PI3EI0kANfQF7Pfk5mD3Mm1TGJCdLVdUinO8PF2cRX4As
         yF4lr5UpR6hD0a3/4bvmwsp+xqKaf+j+QVXmd4KA9Z9ZIK9mIbq8TAnKDN9yZ0uIe1SO
         iz1A==
X-Gm-Message-State: AO0yUKUaJ0KQ2jtWoAheLDBHwUXuEjQwUPzw2havfUymf1m6e3YBJ+dh
	9KKeTkn2l8edXLA8zz3htuixBk0uTqir62P6dqrw0w==
X-Google-Smtp-Source: AK7set8E/kwj+RPaRP0zrGj8rKXKAErZLLzjxXZGU2xDbLWNgjsyjgtnzFH2ioXJ1Fj05s2DC8Kfc/P/mIAw/Owkaq0=
X-Received: by 2002:a05:600c:1e0a:b0:3dc:599b:795e with SMTP id
 ay10-20020a05600c1e0a00b003dc599b795emr663412wmb.203.1675545847849; Sat, 04
 Feb 2023 13:24:07 -0800 (PST)
MIME-Version: 1.0
References: <20230203014014.75720-1-irogers@google.com> <CAP-5=fX0ohsCUspm7NowDy2bmSr2cJfp=iaStK4EAdVy7zBHGA@mail.gmail.com>
 <Y90XgtX9uv26UAQa@kernel.org> <Y90bsM4DGL+WV8m0@kernel.org>
 <Y90b7shHtOCQL3ma@kernel.org> <Y90di+N7TODkFvMV@kernel.org>
 <Y90rtA95mWW5Othk@kernel.org> <Y90v+jTe6z1dSFE0@kernel.org> <Y908vNzJp7cVM8gN@kernel.org>
In-Reply-To: <Y908vNzJp7cVM8gN@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sat, 4 Feb 2023 13:23:53 -0800
Message-ID: <CAP-5=fVfNVSTqSp4qzqAHcCXqwOHXaq1eMuyf2y67vvsrwwO6g@mail.gmail.com>
Subject: Re: [PATCH v1] perf pmu: Fix aarch64 build
To: Arnaldo Carvalho de Melo <acme@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kang Minchul <tegongkang@gmail.com>, Sandipan Das <sandipan.das@amd.com>, Peter Zijlstra <peterz@infradead.org>, Perry Taylor <perry.taylor@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>, Kim Phillips <kim.phillips@amd.com>, Will Deacon <will@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Xing Zhengjun <zhengjun.xing@linux.intel.com>, Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, Kajol Jain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>, Caleb Biggers <caleb.biggers@intel.com>, linux-arm-kernel@lists.infradead.org, Ravi Bangoria <ravi.bangoria@amd.com>, Florian Fischer <florian.fischer@muhq.space>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.y
 an@linaro.org>, linuxppc-dev@lists.ozlabs.org, Jing Zhang <renyu.zj@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 3, 2023 at 8:56 AM Arnaldo Carvalho de Melo <acme@kernel.org> w=
rote:
>
> Em Fri, Feb 03, 2023 at 01:02:02PM -0300, Arnaldo Carvalho de Melo escrev=
eu:
> > Em Fri, Feb 03, 2023 at 12:43:48PM -0300, Arnaldo Carvalho de Melo escr=
eveu:
> > > I tried bisecting, but at this cset:
> > >
> > > acme@roc-rk3399-pc:~/git/perf$ git log --oneline -1
> > > d22e569cd33d (HEAD) perf pmu-events: Separate the metrics from events=
 for no jevents
> > > acme@roc-rk3399-pc:~/git/perf$
> > >
> > > I'm getting this:
> > >
> > >   CC      /tmp/build/perf/pmu-events/pmu-events.o
> > > pmu-events/pmu-events.c:3637:32: error: no previous prototype for =E2=
=80=98perf_pmu__find_table=E2=80=99 [-Werror=3Dmissing-prototypes]
> > >  3637 | const struct pmu_events_table *perf_pmu__find_table(struct pe=
rf_pmu *pmu)
> > >       |                                ^~~~~~~~~~~~~~~~~~~~
> > >   CC      /tmp/build/perf/builtin-ftrace.o
> > >   CC      /tmp/build/perf/builtin-help.o
> > >   CC      /tmp/build/perf/builtin-buildid-list.o
> > > cc1: all warnings being treated as errors
> > > make[3]: *** [/home/acme/git/perf/tools/build/Makefile.build:97: /tmp=
/build/perf/pmu-events/pmu-events.o] Error 1
> > > make[2]: *** [Makefile.perf:676: /tmp/build/perf/pmu-events/pmu-event=
s-in.o] Error 2
> > > make[2]: *** Waiting for unfinished jobs....
> > >   CC      /tmp/build/perf/builtin-buildid-cache.o
> > >
> > > <SNIP>
> > >
> > >   CC      /tmp/build/perf/tests/attr.o
> > > arch/arm64/util/pmu.c: In function =E2=80=98pmu_events_table__find=E2=
=80=99:
> > > arch/arm64/util/pmu.c:35:24: error: implicit declaration of function =
=E2=80=98perf_pmu__find_table=E2=80=99; did you mean =E2=80=98perf_pmu__fin=
d_by_type=E2=80=99? [-Werror=3Dimplicit-function-declaration]
> > >    35 |                 return perf_pmu__find_table(pmu);
> > >       |                        ^~~~~~~~~~~~~~~~~~~~
> > >       |                        perf_pmu__find_by_type
> > > arch/arm64/util/pmu.c:35:24: error: returning =E2=80=98int=E2=80=99 f=
rom a function with return type =E2=80=98const struct pmu_events_table *=E2=
=80=99 makes pointer from integer without a cast [-Werror=3Dint-conversion]
> > >    35 |                 return perf_pmu__find_table(pmu);
> > >       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > cc1: all warnings being treated as errors
> > > make[6]: *** [/home/acme/git/perf/tools/build/Makefile.build:97: /tmp=
/build/perf/arch/arm64/util/pmu.o] Error 1
> > > make[5]: *** [/home/acme/git/perf/tools/build/Makefile.build:139: uti=
l] Error 2
> > > make[4]: *** [/home/acme/git/perf/tools/build/Makefile.build:139: arm=
64] Error 2
> > > make[3]: *** [/home/acme/git/perf/tools/build/Makefile.build:139: arc=
h] Error 2
> > > make[3]: *** Waiting for unfinished jobs....
> > >   CC      /tmp/build/perf/tests/vmlinux-kallsyms.o
> > >
> > > -----
> > >
> > > I'm building with:
> >
> > So:
> >
> > acme@roc-rk3399-pc:~/git/perf$ find tools/perf/ -name "*.[ch]" | xargs =
grep -w perf_pmu__find_table
> > tools/perf/arch/arm64/util/pmu.c:             return perf_pmu__find_tab=
le(pmu);
> > tools/perf/pmu-events/pmu-events.c:const struct pmu_events_table *perf_=
pmu__find_table(struct perf_pmu *pmu)
> > acme@roc-rk3399-pc:~/git/perf$
> > acme@roc-rk3399-pc:~/git/perf$ git log --oneline -1
> > d22e569cd33d (HEAD) perf pmu-events: Separate the metrics from events f=
or no jevents
> > acme@roc-rk3399-pc:~/git/perf$
> >
> > Tring to fix...
>
> tools/perf/pmu-events/pmu-events.c was a leftover from a previous build,
> strange as I build using O=3D, not to clutter the source dir, so perhaps
> handling that is missing, I'll check.
>
> Fixed aarch64 specific one with:
>
> diff --git a/tools/perf/arch/arm64/util/pmu.c b/tools/perf/arch/arm64/uti=
l/pmu.c
> index 801bf52e2ea6..b4eaf00ec5a8 100644
> --- a/tools/perf/arch/arm64/util/pmu.c
> +++ b/tools/perf/arch/arm64/util/pmu.c
> @@ -32,7 +32,7 @@ const struct pmu_events_table *pmu_events_table__find(v=
oid)
>         struct perf_pmu *pmu =3D pmu__find_core_pmu();
>
>         if (pmu)
> -               return perf_pmu__find_table(pmu);
> +               return perf_pmu__find_events_table(pmu);
>
>         return NULL;
>  }
>
>
> ---
>
> Continuing...

Thanks! Sorry for missing this one. Ideally we'd have less code under
arch/ . The previous error messages made me think you may need to
build clean.

Ian
