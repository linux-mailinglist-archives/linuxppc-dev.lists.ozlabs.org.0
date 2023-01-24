Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6700678F64
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 05:40:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1DmZ55ktz3cGm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 15:40:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=PlUI6p7K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=PlUI6p7K;
	dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1Dld3ZZhz30RT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 15:39:40 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id e3so12664826wru.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 20:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCkgdS42HP9c2SlfJExCfBuH/es3AKQRVeoRRRAWHnw=;
        b=PlUI6p7KbO2AgCPYmEeoptVM+1IuSBOswLdzJUzBaBFrHim4RuXFGCm/xLHdJ2fcMc
         P2Bq0TcCcl0iUb9/nymrNbxF67nzTVn4tjHqccGcVK2y1LMug9Mvs+3e7hn96VlaxeOD
         yAvqd1RNNeRDMxwEk4TvUh1IjrSkjbKrt4qSTsXvVRB6MzCEQuHDCvqOwBu0v3uQ2qeL
         Z8K3XH8gtYpCe739oaBoNP70SqYs89meaiApqdY8CiUvThk3JV8/2K0unIkv2V8DU8WN
         wW3nosBjoI1rUdi9HcxSFRHPT+5vfTUIc0dkiuigP30Fh+0cVVuK0AiGiBeNpcGRMQlm
         Sbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCkgdS42HP9c2SlfJExCfBuH/es3AKQRVeoRRRAWHnw=;
        b=SjrAfmDSHTTlWWRXWCs/YUPeM5Rd+Ck2tLC5L06c21qRLHGCtTg6ghTLcLOlAIeR3H
         2TyV+7Jk4AGGt3ogbBVnAwyXZpaK7DWOe/5wV9+WcNEYlCCNH3WCMbEDH8oHPI3BPPxh
         XDY3XWc/OORLiY00LjMQ8X6dKTDBlMBnes3V4K/ygUQBlAC5YtBU08isLPY6EMqknze5
         d2ePUFYHeQ31BhRSfgfKef6ThQHyrnn+SwIiRmxZ23SMaF/s+NtIlSUfqBp+C9DVjHVN
         CJe0sH9Td14WUweDMPJt4UyQlsV8wGWCDG3yCbz1i3qKnGa/8ShP5EnkcmnSppq29BUf
         sOtA==
X-Gm-Message-State: AFqh2kqRxCccpmGFdlmw6l/TxDVC4f58+7mF12DekWmMWy5yj6dt4/EU
	TKkASTokfpj9TvgidMbGu9INg3e43iFO+JHT6J1mAW+mEbhkixQo
X-Google-Smtp-Source: AMrXdXvvNI+8kYgruKfNlPrBXOA6/eBLbSF9KuU61um84Bu6EJWHwn1vuTJwOHfcuO7LqVL3by5Eba9N/vN1PPap56g=
X-Received: by 2002:adf:f241:0:b0:2bc:7ed4:cd50 with SMTP id
 b1-20020adff241000000b002bc7ed4cd50mr1140447wrp.40.1674535175024; Mon, 23 Jan
 2023 20:39:35 -0800 (PST)
MIME-Version: 1.0
References: <20221221223420.2157113-1-irogers@google.com> <20221221223420.2157113-5-irogers@google.com>
 <a61e0df9-00d2-72d8-e99f-a10c47f170e6@oracle.com>
In-Reply-To: <a61e0df9-00d2-72d8-e99f-a10c47f170e6@oracle.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 23 Jan 2023 20:39:22 -0800
Message-ID: <CAP-5=fUaQYW7cTbN1p541b2tGnQ0L=jnUMQqoHtV7wiLsi3BUA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] perf pmu-events: Separate metric out of pmu_event
To: John Garry <john.g.garry@oracle.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kang Minchul <tegongkang@gmail.com>, Sandipan Das <sandipan.das@amd.com>, Peter Zijlstra <peterz@infradead.org>, Perry Taylor <perry.taylor@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>, Kim Phillips <kim.phillips@amd.com>, Will Deacon <will@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Xing Zhengjun <zhengjun.xing@linux.intel.com>, Mike Leach <mike.leach@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Caleb Biggers <caleb.biggers@intel.com>, linux-arm-kernel@lists.infradead.org, Ravi Bangoria <ravi.bangoria@amd.com>, Florian Fischer <florian.fischer@muhq.space>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Leo Yan 
 <leo.yan@linaro.org>, linuxppc-dev@lists.ozlabs.org, Jing Zhang <renyu.zj@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 23, 2023 at 7:16 AM John Garry <john.g.garry@oracle.com> wrote:
>
> On 21/12/2022 22:34, Ian Rogers wrote:
> > Previously both events and metrics were encoded in struct
> > pmu_event. Create a new pmu_metric that has the metric related
> > variables and remove these from pmu_event. Add iterators for
> > pmu_metric and use in places that metrics are desired rather than
> > events.
> >
> > Note, this change removes the setting of evsel's metric_name/expr as
> > these fields are no longer part of struct pmu_event. The metric
> > remains but is no longer implicitly requested when the event is. This
> > impacts a few Intel uncore events, however, as the ScaleUnit is shared
> > by the event and the metric this utility is questionable. Also the
> > MetricNames look broken (contain spaces) in some cases and when trying
> > to use the functionality with '-e' the metrics fail but regular
> > metrics with '-M' work. For example, on SkylakeX '-M' works:
> >
>
> I like this change. It's quite large for a single patch. Just some
> sparse comments below.
>
> BTW, it there a better name for metric struct variable than "pm"? To me
> and many other people, pm is power management.

Agreed. There a few things like that in the code, I dislike the
overload on "core". I've left it as pm as pmu_event became pe, so it
is consistent for pmu_metric to become pm. We can do a global rename
as a follow up.

> > ```
> > $ perf stat -M LLC_MISSES.PCIE_WRITE -a sleep 1
> >
> >   Performance counter stats for 'system wide':
> >
> >                   0      UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 #  578=
96.0 Bytes  LLC_MISSES.PCIE_WRITE  (49.84%)
> >               7,174      UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1       =
                                 (49.85%)
> >                   0      UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3       =
                                 (50.16%)
> >                  63      UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0       =
                                 (50.15%)
> >
> >         1.004576381 seconds time elapsed
> > ```
> >
> > whilst the event '-e' version is broken even with --group/-g (fwiw, we =
should also remove -g [1]):
> >
> > ```
> > $ perf stat -g -e LLC_MISSES.PCIE_WRITE -g -a sleep 1
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> > Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metr=
ic expression for LLC_MISSES.PCIE_WRITE
> >
> >   Performance counter stats for 'system wide':
> >
> >              27,316 Bytes LLC_MISSES.PCIE_WRITE
> >
> >         1.004505469 seconds time elapsed
> > ```
> >
> > The code also carries warnings where the user is supposed to select
> > events for metrics [2] but given the lack of use of such a feature,
> > let's clean the code and just remove.
> >
> > With NO_JEVENTS=3D1 the empty-pmu-events.c is used and the separation t=
o
> > use metrics causes "Parse and process metrics" and "Event expansion
> > for cgroups" to fail as they fail to find necessary metrics. This is
> > fixed in a later change.
> >
> > [1] https://urldefense.com/v3/__https://lore.kernel.org/lkml/2022070719=
5610.303254-1-irogers@google.com/__;!!ACWV5N9M2RV99hQ!MTNgf7sIIl2VCxBzo-biS=
eul-ZQkuU73pT6gBbsb6y0AqsVlgGCcmuigDyevtrgmpHDN1QkEJwbJYvREu3Q$
> > [2] https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/ke=
rnel/git/torvalds/linux.git/tree/tools/perf/util/stat-shadow.c?id=3D01b8957=
b738f42f96a130079bc951b3cc78c5b8a*n425__;Iw!!ACWV5N9M2RV99hQ!MTNgf7sIIl2VCx=
Bzo-biSeul-ZQkuU73pT6gBbsb6y0AqsVlgGCcmuigDyevtrgmpHDN1QkEJwbJ8H0tppQ$
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >   tools/perf/arch/powerpc/util/header.c    |   4 +-
> >   tools/perf/builtin-list.c                |  20 +--
> >   tools/perf/pmu-events/empty-pmu-events.c |  73 ++++++++--
> >   tools/perf/pmu-events/jevents.py         |  82 +++++++++++-
> >   tools/perf/pmu-events/pmu-events.h       |  20 ++-
> >   tools/perf/tests/pmu-events.c            |  62 +++------
> >   tools/perf/util/metricgroup.c            | 161 +++++++++++-----------=
-
> >   tools/perf/util/metricgroup.h            |   2 +-
> >   tools/perf/util/parse-events.c           |   2 -
> >   tools/perf/util/pmu.c                    |  35 +----
> >   tools/perf/util/pmu.h                    |   9 --
> >   tools/perf/util/print-events.c           |  32 ++---
> >   tools/perf/util/print-events.h           |   3 +-
> >   13 files changed, 266 insertions(+), 239 deletions(-)
> >
> > diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/po=
werpc/util/header.c
> > index e8fe36b10d20..78eef77d8a8d 100644
> > --- a/tools/perf/arch/powerpc/util/header.c
> > +++ b/tools/perf/arch/powerpc/util/header.c
> > @@ -40,11 +40,11 @@ get_cpuid_str(struct perf_pmu *pmu __maybe_unused)
> >       return bufp;
> >   }
> >
> > -int arch_get_runtimeparam(const struct pmu_event *pe)
> > +int arch_get_runtimeparam(const struct pmu_metric *pm)
> >   {
> >       int count;
> >       char path[PATH_MAX] =3D "/devices/hv_24x7/interface/";
> >
> > -     atoi(pe->aggr_mode) =3D=3D PerChip ? strcat(path, "sockets") : st=
rcat(path, "coresperchip");
> > +     atoi(pm->aggr_mode) =3D=3D PerChip ? strcat(path, "sockets") : st=
rcat(path, "coresperchip");
> >       return sysfs__read_int(path, &count) < 0 ? 1 : count;
> >   }
> > diff --git a/tools/perf/builtin-list.c b/tools/perf/builtin-list.c
> > index 137d73edb541..791f513ae5b4 100644
> > --- a/tools/perf/builtin-list.c
> > +++ b/tools/perf/builtin-list.c
> > @@ -99,8 +99,7 @@ static void default_print_event(void *ps, const char =
*pmu_name, const char *topi
> >                               const char *scale_unit __maybe_unused,
> >                               bool deprecated, const char *event_type_d=
esc,
> >                               const char *desc, const char *long_desc,
> > -                             const char *encoding_desc,
> > -                             const char *metric_name, const char *metr=
ic_expr)
> > +                             const char *encoding_desc)
> >   {
> >       struct print_state *print_state =3D ps;
> >       int pos;
> > @@ -159,10 +158,6 @@ static void default_print_event(void *ps, const ch=
ar *pmu_name, const char *topi
> >       if (print_state->detailed && encoding_desc) {
> >               printf("%*s", 8, "");
> >               wordwrap(encoding_desc, 8, pager_get_columns(), 0);
> > -             if (metric_name)
> > -                     printf(" MetricName: %s", metric_name);
> > -             if (metric_expr)
> > -                     printf(" MetricExpr: %s", metric_expr);
> >               putchar('\n');
> >       }
> >   }
> > @@ -308,8 +303,7 @@ static void json_print_event(void *ps, const char *=
pmu_name, const char *topic,
> >                            const char *scale_unit,
> >                            bool deprecated, const char *event_type_desc=
,
> >                            const char *desc, const char *long_desc,
> > -                          const char *encoding_desc,
> > -                          const char *metric_name, const char *metric_=
expr)
> > +                          const char *encoding_desc)
> >   {
> >       struct json_print_state *print_state =3D ps;
> >       bool need_sep =3D false;
> > @@ -366,16 +360,6 @@ static void json_print_event(void *ps, const char =
*pmu_name, const char *topic,
> >                                 encoding_desc);
> >               need_sep =3D true;
> >       }
> > -     if (metric_name) {
> > -             fix_escape_printf(&buf, "%s\t\"MetricName\": \"%S\"", nee=
d_sep ? ",\n" : "",
> > -                               metric_name);
> > -             need_sep =3D true;
> > -     }
> > -     if (metric_expr) {
> > -             fix_escape_printf(&buf, "%s\t\"MetricExpr\": \"%S\"", nee=
d_sep ? ",\n" : "",
> > -                               metric_expr);
> > -             need_sep =3D true;
> > -     }
> >       printf("%s}", need_sep ? "\n" : "");
> >       strbuf_release(&buf);
> >   }
> > diff --git a/tools/perf/pmu-events/empty-pmu-events.c b/tools/perf/pmu-=
events/empty-pmu-events.c
> > index 480e8f0d30c8..5572a4d1eddb 100644
> > --- a/tools/perf/pmu-events/empty-pmu-events.c
> > +++ b/tools/perf/pmu-events/empty-pmu-events.c
> > @@ -11,7 +11,7 @@
> >   #include <string.h>
> >   #include <stddef.h>
> >
> > -static const struct pmu_event pme_test_soc_cpu[] =3D {
> > +static const struct pmu_event pmu_events__test_soc_cpu[] =3D {
> >       {
> >               .name =3D "l3_cache_rd",
> >               .event =3D "event=3D0x40",
> > @@ -105,6 +105,14 @@ static const struct pmu_event pme_test_soc_cpu[] =
=3D {
> >               .desc =3D "L2 BTB Correction",
> >               .topic =3D "branch",
> >       },
> > +     {
> > +             .name =3D 0,
> > +             .event =3D 0,
> > +             .desc =3D 0,
> > +     },
> > +};
> > +
> > +static const struct pmu_metric pmu_metrics__test_soc_cpu[] =3D {
> >       {
> >               .metric_expr    =3D "1 / IPC",
> >               .metric_name    =3D "CPI",
> > @@ -170,9 +178,8 @@ static const struct pmu_event pme_test_soc_cpu[] =
=3D {
> >               .metric_name    =3D "L1D_Cache_Fill_BW",
> >       },
> >       {
> > -             .name =3D 0,
> > -             .event =3D 0,
> > -             .desc =3D 0,
> > +             .metric_expr =3D 0,
> > +             .metric_name =3D 0,
> >       },
> >   };
> >
> > @@ -181,6 +188,11 @@ struct pmu_events_table {
> >       const struct pmu_event *entries;
> >   };
> >
> > +/* Struct used to make the PMU metric table implementation opaque to c=
allers. */
> > +struct pmu_metrics_table {
> > +     const struct pmu_metric *entries;
> > +};
> > +
> >   /*
> >    * Map a CPU to its table of PMU events. The CPU is identified by the
> >    * cpuid field, which is an arch-specific identifier for the CPU.
> > @@ -192,7 +204,8 @@ struct pmu_events_table {
> >   struct pmu_events_map {
> >       const char *arch;
> >       const char *cpuid;
> > -     const struct pmu_events_table table;
> > +     const struct pmu_events_table event_table;
> > +     const struct pmu_metrics_table metric_table;
> >   };
> >
> >   /*
> > @@ -203,12 +216,14 @@ static const struct pmu_events_map pmu_events_map=
[] =3D {
> >       {
> >               .arch =3D "testarch",
> >               .cpuid =3D "testcpu",
> > -             .table =3D { pme_test_soc_cpu },
> > +             .event_table =3D { pmu_events__test_soc_cpu },
> > +             .metric_table =3D { pmu_metrics__test_soc_cpu },
> >       },
> >       {
> >               .arch =3D 0,
> >               .cpuid =3D 0,
> > -             .table =3D { 0 },
> > +             .event_table =3D { 0 },
> > +             .metric_table =3D { 0 },
> >       },
> >   };
> >
> > @@ -254,9 +269,7 @@ static const struct pmu_sys_events pmu_sys_event_ta=
bles[] =3D {
> >   int pmu_events_table_for_each_event(const struct pmu_events_table *ta=
ble, pmu_event_iter_fn fn,
> >                                   void *data)
> >   {
> > -     for (const struct pmu_event *pe =3D &table->entries[0];
> > -          pe->name || pe->metric_group || pe->metric_name;
> > -          pe++) {
> > +     for (const struct pmu_event *pe =3D &table->entries[0]; pe->name;=
 pe++) {
> >               int ret =3D fn(pe, table, data);
> >
> >               if (ret)
> > @@ -265,6 +278,21 @@ int pmu_events_table_for_each_event(const struct p=
mu_events_table *table, pmu_ev
> >       return 0;
> >   }
> >
> > +int pmu_events_table_for_each_metric(const struct pmu_events_table *et=
able, pmu_metric_iter_fn fn,
> > +                                  void *data)
> > +{
> > +     struct pmu_metrics_table *table =3D (struct pmu_metrics_table *)e=
table;
>
> This is odd. Would the change be too big if we combined patches to avoid
> casting like this? I assume that this is going away later...

Yep. Done this way to minimize the patch sizes.

> > +
> > +     for (const struct pmu_metric *pm =3D &table->entries[0]; pm->metr=
ic_group || pm->metric_name;
>
> Is it valid to only have metric_group or metric_name set?

Agreed. I think using the expr is the best solution, albeit temporary
in the patch series. Fwiw, it was done this way as the logic was moved
from pmu_events_table_for_each_event.

> > +          pm++) {
> > +             int ret =3D fn(pm, etable, data);
> > +
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +     return 0;
> > +}
> > +
> >   const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *=
pmu)
> >   {
> >       const struct pmu_events_table *table =3D NULL;
> > @@ -285,7 +313,7 @@ const struct pmu_events_table *perf_pmu__find_table=
(struct perf_pmu *pmu)
> >                       break;
> >
> >               if (!strcmp_cpuid_str(map->cpuid, cpuid)) {
> > -                     table =3D &map->table;
> > +                     table =3D &map->event_table;
> >                       break;
> >               }
> >       }
> > @@ -299,7 +327,7 @@ const struct pmu_events_table *find_core_events_tab=
le(const char *arch, const ch
> >            tables->arch;
> >            tables++) {
> >               if (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tabl=
es->cpuid, cpuid))
> > -                     return &tables->table;
> > +                     return &tables->event_table;
> >       }
> >       return NULL;
> >   }
> > @@ -309,7 +337,21 @@ int pmu_for_each_core_event(pmu_event_iter_fn fn, =
void *data)
> >       for (const struct pmu_events_map *tables =3D &pmu_events_map[0];
> >            tables->arch;
> >            tables++) {
> > -             int ret =3D pmu_events_table_for_each_event(&tables->tabl=
e, fn, data);
> > +             int ret =3D pmu_events_table_for_each_event(&tables->even=
t_table, fn, data);
> > +
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +     return 0;
> > +}
> > +
> > +int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data)
> > +{
> > +     for (const struct pmu_events_map *tables =3D &pmu_events_map[0];
> > +          tables->arch;
> > +          tables++) {
>
> again, you can combine here

Right, done this way to reduce patch size. Later patch splits the tables.

> > +             int ret =3D pmu_events_table_for_each_metric(
> > +                     (const struct pmu_events_table *)&tables->metric_=
table, fn, data);
> >
> >               if (ret)
> >                       return ret;
> > @@ -340,3 +382,8 @@ int pmu_for_each_sys_event(pmu_event_iter_fn fn, vo=
id *data)
> >       }
> >       return 0;
> >   }
> > +
> > +int pmu_for_each_sys_metric(pmu_metric_iter_fn fn __maybe_unused, void=
 *data __maybe_unused)
> > +{
> > +     return 0;
> > +}
> > diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/j=
events.py
> > index 229402565425..ee3d4cdf01be 100755
> > --- a/tools/perf/pmu-events/jevents.py
> > +++ b/tools/perf/pmu-events/jevents.py
> > @@ -37,6 +37,11 @@ _json_event_attributes =3D [
> >       'metric_constraint', 'metric_expr', 'long_desc'
> >   ]
> >
> > +# Attributes that are in pmu_metric rather than pmu_event.
> > +_json_metric_attributes =3D [
> > +    'metric_name', 'metric_group', 'metric_constraint', 'metric_expr',=
 'desc',
> > +    'long_desc', 'unit', 'compat', 'aggr_mode'
> > +]
> >
> >   def removesuffix(s: str, suffix: str) -> str:
> >     """Remove the suffix from a string
> > @@ -562,12 +567,15 @@ static const struct pmu_sys_events pmu_sys_event_=
tables[] =3D {
> >   \t},
> >   };
> >
> > -static void decompress(int offset, struct pmu_event *pe)
> > +static void decompress_event(int offset, struct pmu_event *pe)
> >   {
> >   \tconst char *p =3D &big_c_string[offset];
> >   """)
> >     for attr in _json_event_attributes:
> > -    _args.output_file.write(f"""
> > +    if attr in _json_metric_attributes and 'metric_' in attr:
> > +      _args.output_file.write(f'\n\t/* Skip {attr} */\n')
> > +    else:
> > +      _args.output_file.write(f"""
> >   \tpe->{attr} =3D (*p =3D=3D '\\0' ? NULL : p);
> >   """)
> >       if attr =3D=3D _json_event_attributes[-1]:
> > @@ -575,6 +583,22 @@ static void decompress(int offset, struct pmu_even=
t *pe)
> >       _args.output_file.write('\twhile (*p++);')
> >     _args.output_file.write("""}
> >
> > +static void decompress_metric(int offset, struct pmu_metric *pm)
> > +{
> > +\tconst char *p =3D &big_c_string[offset];
> > +""")
> > +  for attr in _json_event_attributes:
> > +    if attr in _json_metric_attributes:
> > +      _args.output_file.write(f"""
> > +\tpm->{attr} =3D (*p =3D=3D '\\0' ? NULL : p);
> > +""")
> > +    else:
> > +      _args.output_file.write(f'\n\t/* Skip {attr} */\n')
> > +    if attr =3D=3D _json_event_attributes[-1]:
> > +      continue
> > +    _args.output_file.write('\twhile (*p++);')
> > +  _args.output_file.write("""}
> > +
> >   int pmu_events_table_for_each_event(const struct pmu_events_table *ta=
ble,
> >                                       pmu_event_iter_fn fn,
> >                                       void *data)
> > @@ -583,10 +607,30 @@ int pmu_events_table_for_each_event(const struct =
pmu_events_table *table,
> >                   struct pmu_event pe;
> >                   int ret;
> >
> > -                decompress(table->entries[i].offset, &pe);
> > -                ret =3D fn(&pe, table, data);
> > -                if (ret)
> > -                        return ret;
> > +                decompress_event(table->entries[i].offset, &pe);
> > +                if (pe.name) {
> > +                        ret =3D fn(&pe, table, data);
> > +                        if (ret)
> > +                                return ret;
> > +                }
> > +        }
> > +        return 0;
> > +}
> > +
> > +int pmu_events_table_for_each_metric(const struct pmu_events_table *ta=
ble,
> > +                                     pmu_metric_iter_fn fn,
> > +                                     void *data)
> > +{
> > +        for (size_t i =3D 0; i < table->length; i++) {
> > +                struct pmu_metric pm;
> > +                int ret;
> > +
> > +                decompress_metric(table->entries[i].offset, &pm);
> > +                if (pm.metric_name) {
> > +                        ret =3D fn(&pm, table, data);
> > +                        if (ret)
> > +                                return ret;
> > +                }
> >           }
> >           return 0;
> >   }
> > @@ -642,6 +686,19 @@ int pmu_for_each_core_event(pmu_event_iter_fn fn, =
void *data)
> >           return 0;
> >   }
> >
> > +int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data)
> > +{
> > +        for (const struct pmu_events_map *tables =3D &pmu_events_map[0=
];
> > +             tables->arch;
> > +             tables++) {
> > +                int ret =3D pmu_events_table_for_each_metric(&tables->=
table, fn, data);
> > +
> > +                if (ret)
> > +                        return ret;
> > +        }
> > +        return 0;
> > +}
> > +
> >   const struct pmu_events_table *find_sys_events_table(const char *name=
)
> >   {
> >           for (const struct pmu_sys_events *tables =3D &pmu_sys_event_t=
ables[0];
> > @@ -665,6 +722,19 @@ int pmu_for_each_sys_event(pmu_event_iter_fn fn, v=
oid *data)
> >           }
> >           return 0;
> >   }
> > +
> > +int pmu_for_each_sys_metric(pmu_metric_iter_fn fn, void *data)
> > +{
> > +        for (const struct pmu_sys_events *tables =3D &pmu_sys_event_ta=
bles[0];
> > +             tables->name;
> > +             tables++) {
> > +                int ret =3D pmu_events_table_for_each_metric(&tables->=
table, fn, data);
> > +
> > +                if (ret)
> > +                        return ret;
> > +        }
> > +        return 0;
> > +}
> >   """)
> >
> >
> > diff --git a/tools/perf/pmu-events/pmu-events.h b/tools/perf/pmu-events=
/pmu-events.h
> > index fe343c4d8016..e137f3857c03 100644
> > --- a/tools/perf/pmu-events/pmu-events.h
> > +++ b/tools/perf/pmu-events/pmu-events.h
> > @@ -23,11 +23,19 @@ struct pmu_event {
> >       const char *unit;
> >       const char *perpkg;
> >       const char *aggr_mode;
> > -     const char *metric_expr;
> > +     const char *deprecated;
> > +};
> > +
> > +struct pmu_metric {
>
> In terms of formatting patches, it could have been better to first
> introdue struct pmu_metric being same as struct pmu_event, and make the
> changes of /s/struct pmu_event pe;/struct pmu_event pm;/, and then
> secondly the meaningful change to get rid of the inappropiate members in
> struct pmu_metric and struct pmu_event. It's just harder to review it
> all together.

Ok, I'll switch it this way in v3. Having done v3 I've now made this 3
changes following this suggestion, I've also folded in the empty pmu
metrics fixes. Fwiw, I'd done the non empty case and then tried to
retro fit. I think we should probably change the empty-pmu-events.c
and have a way to generate from jevents.py, then check in the
generated file to avoid the python dependency.

> >       const char *metric_name;
> >       const char *metric_group;
> > -     const char *deprecated;
> > +     const char *metric_expr;
>
> I would prefer the shorter name "expr" (as opposed to "metric_expr") as
> we know it's a metric struct already. But that does not seem to be
> coding style, so ...

Agreed. Let's do it as a later cleanup.

> > +     const char *unit;
> > +     const char *compat;
> > +     const char *aggr_mode;
> >       const char *metric_constraint;
> > +     const char *desc;
> > +     const char *long_desc;
> >   };
> >
> >   struct pmu_events_table;
> > @@ -36,14 +44,22 @@ typedef int (*pmu_event_iter_fn)(const struct pmu_e=
vent *pe,
> >                                const struct pmu_events_table *table,
> >                                void *data);
> >
> > +typedef int (*pmu_metric_iter_fn)(const struct pmu_metric *pm,
> > +                               const struct pmu_events_table *table,
> > +                               void *data);
> > +
> >   int pmu_events_table_for_each_event(const struct pmu_events_table *ta=
ble, pmu_event_iter_fn fn,
> >                                   void *data);
> > +int pmu_events_table_for_each_metric(const struct pmu_events_table *ta=
ble, pmu_metric_iter_fn fn,
> > +                                  void *data);
> >
> >   const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *=
pmu);
> >   const struct pmu_events_table *find_core_events_table(const char *arc=
h, const char *cpuid);
> >   int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data);
> > +int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data);
> >
> >   const struct pmu_events_table *find_sys_events_table(const char *name=
);
> >   int pmu_for_each_sys_event(pmu_event_iter_fn fn, void *data);
> > +int pmu_for_each_sys_metric(pmu_metric_iter_fn fn, void *data);
> >
> >   #endif
> > diff --git a/tools/perf/tests/pmu-events.c b/tools/perf/tests/pmu-event=
s.c
> > index a9f2330f6257..c2b3ada57cbc 100644
> > --- a/tools/perf/tests/pmu-events.c
> > +++ b/tools/perf/tests/pmu-events.c
> > @@ -337,36 +337,12 @@ static int compare_pmu_events(const struct pmu_ev=
ent *e1, const struct pmu_event
> >               return -1;
> >       }
> >
> > -     if (!is_same(e1->metric_expr, e2->metric_expr)) {
> > -             pr_debug2("testing event e1 %s: mismatched metric_expr, %=
s vs %s\n",
> > -                       e1->name, e1->metric_expr, e2->metric_expr);
> > -             return -1;
>
> is there something new to replace this (I didn't check)?

The variables no longer exist and in the original test they weren't
ever defined.

> > -     }
> > -
> > -     if (!is_same(e1->metric_name, e2->metric_name)) {
> > -             pr_debug2("testing event e1 %s: mismatched metric_name, %=
s vs %s\n",
> > -                       e1->name,     e1->metric_name, e2->metric_name)=
;
> > -             return -1;
> > -     }
> > -
> > -     if (!is_same(e1->metric_group, e2->metric_group)) {
> > -             pr_debug2("testing event e1 %s: mismatched metric_group, =
%s vs %s\n",
> > -                       e1->name, e1->metric_group, e2->metric_group);
> > -             return -1;
> > -     }
> > -
> >       if (!is_same(e1->deprecated, e2->deprecated)) {
> >               pr_debug2("testing event e1 %s: mismatched deprecated, %s=
 vs %s\n",
> >                         e1->name, e1->deprecated, e2->deprecated);
> >               return -1;
> >       }
> >
> > -     if (!is_same(e1->metric_constraint, e2->metric_constraint)) {
> > -             pr_debug2("testing event e1 %s: mismatched metric_constan=
t, %s vs %s\n",
> > -                       e1->name, e1->metric_constraint, e2->metric_con=
straint);
> > -             return -1;
> > -     }
> > -
> >       return 0;
> >   }
> >
> > @@ -432,9 +408,6 @@ static int test__pmu_event_table_core_callback(cons=
t struct pmu_event *pe,
> >       struct perf_pmu_test_event const **test_event_table;
> >       bool found =3D false;
> >
> > -     if (!pe->name)
> > -             return 0;
> > -
> >       if (pe->pmu)
> >               test_event_table =3D &uncore_events[0];
> >       else
> > @@ -840,7 +813,7 @@ struct metric {
> >       struct metric_ref metric_ref;
> >   };
> >
> > -static int test__parsing_callback(const struct pmu_event *pe, const st=
ruct pmu_events_table *table,
> > +static int test__parsing_callback(const struct pmu_metric *pm, const s=
truct pmu_events_table *table,
> >                                 void *data)
> >   {
> >       int *failures =3D data;
> > @@ -854,10 +827,10 @@ static int test__parsing_callback(const struct pm=
u_event *pe, const struct pmu_e
> >       };
> >       int err =3D 0;
> >
> > -     if (!pe->metric_expr)
> > +     if (!pm->metric_expr)
> >               return 0;
> >
> > -     pr_debug("Found metric '%s'\n", pe->metric_name);
> > +     pr_debug("Found metric '%s'\n", pm->metric_name);
> >       (*failures)++;
> >
> >       /*
> > @@ -877,14 +850,14 @@ static int test__parsing_callback(const struct pm=
u_event *pe, const struct pmu_e
> >       perf_evlist__set_maps(&evlist->core, cpus, NULL);
> >       runtime_stat__init(&st);
> >
> > -     err =3D metricgroup__parse_groups_test(evlist, table, pe->metric_=
name,
> > +     err =3D metricgroup__parse_groups_test(evlist, table, pm->metric_=
name,
> >                                            false, false,
> >                                            &metric_events);
> >       if (err) {
> > -             if (!strcmp(pe->metric_name, "M1") || !strcmp(pe->metric_=
name, "M2") ||
> > -                 !strcmp(pe->metric_name, "M3")) {
> > +             if (!strcmp(pm->metric_name, "M1") || !strcmp(pm->metric_=
name, "M2") ||
> > +                 !strcmp(pm->metric_name, "M3")) {
> >                       (*failures)--;
> > -                     pr_debug("Expected broken metric %s skipping\n", =
pe->metric_name);
> > +                     pr_debug("Expected broken metric %s skipping\n", =
pm->metric_name);
> >                       err =3D 0;
> >               }
> >               goto out_err;
> > @@ -912,7 +885,7 @@ static int test__parsing_callback(const struct pmu_=
event *pe, const struct pmu_e
> >                       struct metric_expr *mexp;
> >
> >                       list_for_each_entry (mexp, &me->head, nd) {
> > -                             if (strcmp(mexp->metric_name, pe->metric_=
name))
> > +                             if (strcmp(mexp->metric_name, pm->metric_=
name))
> >                                       continue;
> >                               pr_debug("Result %f\n", test_generic_metr=
ic(mexp, 0, &st));
> >                               err =3D 0;
> > @@ -921,11 +894,11 @@ static int test__parsing_callback(const struct pm=
u_event *pe, const struct pmu_e
> >                       }
> >               }
> >       }
> > -     pr_debug("Didn't find parsed metric %s", pe->metric_name);
> > +     pr_debug("Didn't find parsed metric %s", pm->metric_name);
> >       err =3D 1;
> >   out_err:
> >       if (err)
> > -             pr_debug("Broken metric %s\n", pe->metric_name);
> > +             pr_debug("Broken metric %s\n", pm->metric_name);
> >
> >       /* ... cleanup. */
> >       metricgroup__rblist_exit(&metric_events);
> > @@ -941,8 +914,8 @@ static int test__parsing(struct test_suite *test __=
maybe_unused,
> >   {
> >       int failures =3D 0;
> >
> > -     pmu_for_each_core_event(test__parsing_callback, &failures);
> > -     pmu_for_each_sys_event(test__parsing_callback, &failures);
> > +     pmu_for_each_core_metric(test__parsing_callback, &failures);
> > +     pmu_for_each_sys_metric(test__parsing_callback, &failures);
> >
> >       return failures =3D=3D 0 ? TEST_OK : TEST_FAIL;
> >   }
> > @@ -1021,14 +994,11 @@ static int metric_parse_fake(const char *metric_=
name, const char *str)
> >       return ret;
> >   }
> >
> > -static int test__parsing_fake_callback(const struct pmu_event *pe,
> > +static int test__parsing_fake_callback(const struct pmu_metric *pm,
> >                                      const struct pmu_events_table *tab=
le __maybe_unused,
> >                                      void *data __maybe_unused)
> >   {
> > -     if (!pe->metric_expr)
> > -             return 0;
> > -
> > -     return metric_parse_fake(pe->metric_name, pe->metric_expr);
> > +     return metric_parse_fake(pm->metric_name, pm->metric_expr);
> >   }
> >
> >   /*
> > @@ -1047,11 +1017,11 @@ static int test__parsing_fake(struct test_suite=
 *test __maybe_unused,
> >                       return err;
> >       }
> >
> > -     err =3D pmu_for_each_core_event(test__parsing_fake_callback, NULL=
);
> > +     err =3D pmu_for_each_core_metric(test__parsing_fake_callback, NUL=
L);
> >       if (err)
> >               return err;
> >
> > -     return pmu_for_each_sys_event(test__parsing_fake_callback, NULL);
> > +     return pmu_for_each_sys_metric(test__parsing_fake_callback, NULL)=
;
> >   }
> >
> >   static struct test_case pmu_events_tests[] =3D {
> > diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgrou=
p.c
> > index b9c273ed080a..47fd02af66f1 100644
> > --- a/tools/perf/util/metricgroup.c
> > +++ b/tools/perf/util/metricgroup.c
> > @@ -167,14 +167,14 @@ static void metricgroup___watchdog_constraint_hin=
t(const char *name, bool foot)
> >                  "    echo 1 > /proc/sys/kernel/nmi_watchdog\n");
> >   }
> >
> > -static bool metricgroup__has_constraint(const struct pmu_event *pe)
> > +static bool metricgroup__has_constraint(const struct pmu_metric *pm)
> >   {
> > -     if (!pe->metric_constraint)
> > +     if (!pm->metric_constraint)
> >               return false;
> >
> > -     if (!strcmp(pe->metric_constraint, "NO_NMI_WATCHDOG") &&
> > +     if (!strcmp(pm->metric_constraint, "NO_NMI_WATCHDOG") &&
> >           sysctl__nmi_watchdog_enabled()) {
> > -             metricgroup___watchdog_constraint_hint(pe->metric_name, f=
alse);
> > +             metricgroup___watchdog_constraint_hint(pm->metric_name, f=
alse);
> >               return true;
> >       }
> >
> > @@ -193,7 +193,7 @@ static void metric__free(struct metric *m)
> >       free(m);
> >   }
> >
> > -static struct metric *metric__new(const struct pmu_event *pe,
> > +static struct metric *metric__new(const struct pmu_metric *pm,
> >                                 const char *modifier,
> >                                 bool metric_no_group,
> >                                 int runtime,
> > @@ -210,15 +210,15 @@ static struct metric *metric__new(const struct pm=
u_event *pe,
> >       if (!m->pctx)
> >               goto out_err;
> >
> > -     m->metric_name =3D pe->metric_name;
> > +     m->metric_name =3D pm->metric_name;
> >       m->modifier =3D NULL;
> >       if (modifier) {
> >               m->modifier =3D strdup(modifier);
> >               if (!m->modifier)
> >                       goto out_err;
> >       }
> > -     m->metric_expr =3D pe->metric_expr;
> > -     m->metric_unit =3D pe->unit;
> > +     m->metric_expr =3D pm->metric_expr;
> > +     m->metric_unit =3D pm->unit;
> >       m->pctx->sctx.user_requested_cpu_list =3D NULL;
> >       if (user_requested_cpu_list) {
> >               m->pctx->sctx.user_requested_cpu_list =3D strdup(user_req=
uested_cpu_list);
> > @@ -227,7 +227,7 @@ static struct metric *metric__new(const struct pmu_=
event *pe,
> >       }
> >       m->pctx->sctx.runtime =3D runtime;
> >       m->pctx->sctx.system_wide =3D system_wide;
> > -     m->has_constraint =3D metric_no_group || metricgroup__has_constra=
int(pe);
> > +     m->has_constraint =3D metric_no_group || metricgroup__has_constra=
int(pm);
> >       m->metric_refs =3D NULL;
> >       m->evlist =3D NULL;
> >
> > @@ -348,10 +348,10 @@ static bool match_metric(const char *n, const cha=
r *list)
> >       return false;
> >   }
> >
> > -static bool match_pe_metric(const struct pmu_event *pe, const char *me=
tric)
> > +static bool match_pm_metric(const struct pmu_metric *pm, const char *m=
etric)
> >   {
> > -     return match_metric(pe->metric_group, metric) ||
> > -            match_metric(pe->metric_name, metric);
> > +     return match_metric(pm->metric_group, metric) ||
> > +            match_metric(pm->metric_name, metric);
> >   }
> >
> >   /** struct mep - RB-tree node for building printing information. */
> > @@ -420,13 +420,13 @@ static struct mep *mep_lookup(struct rblist *grou=
ps, const char *metric_group,
> >       return NULL;
> >   }
> >
> > -static int metricgroup__add_to_mep_groups(const struct pmu_event *pe,
> > +static int metricgroup__add_to_mep_groups(const struct pmu_metric *pm,
> >                                       struct rblist *groups)
> >   {
> >       const char *g;
> >       char *omg, *mg;
> >
> > -     mg =3D strdup(pe->metric_group ?: "No_group");
> > +     mg =3D strdup(pm->metric_group ?: "No_group");
> >       if (!mg)
> >               return -ENOMEM;
> >       omg =3D mg;
> > @@ -435,15 +435,15 @@ static int metricgroup__add_to_mep_groups(const s=
truct pmu_event *pe,
> >
> >               g =3D skip_spaces(g);
> >               if (strlen(g))
> > -                     me =3D mep_lookup(groups, g, pe->metric_name);
> > +                     me =3D mep_lookup(groups, g, pm->metric_name);
> >               else
> > -                     me =3D mep_lookup(groups, "No_group", pe->metric_=
name);
> > +                     me =3D mep_lookup(groups, "No_group", pm->metric_=
name);
> >
> >               if (me) {
> > -                     me->metric_desc =3D pe->desc;
> > -                     me->metric_long_desc =3D pe->long_desc;
> > -                     me->metric_expr =3D pe->metric_expr;
> > -                     me->metric_unit =3D pe->unit;
> > +                     me->metric_desc =3D pm->desc;
> > +                     me->metric_long_desc =3D pm->long_desc;
> > +                     me->metric_expr =3D pm->metric_expr;
>
> could struct pmu_metric be a sub-struct in struct mep?

struct mep is only used for 'perf list' and has a subset of the
information in struct pmu_metric. The metric_group is also mutated. I
like the idea of merging them and having a single assignment here, but
it would add some overhead for limited gain.

> > +                     me->metric_unit =3D pm->unit;
> >               }
> >       }
> >       free(omg);
> > @@ -452,40 +452,37 @@ static int metricgroup__add_to_mep_groups(const s=
truct pmu_event *pe,
> >   }
> >
> >   struct metricgroup_iter_data {
> > -     pmu_event_iter_fn fn;
> > +     pmu_metric_iter_fn fn;
> >       void *data;
> >   };
> >
> > -static int metricgroup__sys_event_iter(const struct pmu_event *pe,
> > +static int metricgroup__sys_event_iter(const struct pmu_metric *pm,
> >                                      const struct pmu_events_table *tab=
le,
> >                                      void *data)
> >   {
> >       struct metricgroup_iter_data *d =3D data;
> >       struct perf_pmu *pmu =3D NULL;
> >
> > -     if (!pe->metric_expr || !pe->compat)
> > +     if (!pm->metric_expr || !pm->compat)
> >               return 0;
> >
> >       while ((pmu =3D perf_pmu__scan(pmu))) {
> >
> > -             if (!pmu->id || strcmp(pmu->id, pe->compat))
> > +             if (!pmu->id || strcmp(pmu->id, pm->compat))
> >                       continue;
> >
> > -             return d->fn(pe, table, d->data);
> > +             return d->fn(pm, table, d->data);
> >       }
> >       return 0;
> >   }
> >
> > -static int metricgroup__add_to_mep_groups_callback(const struct pmu_ev=
ent *pe,
> > +static int metricgroup__add_to_mep_groups_callback(const struct pmu_me=
tric *pm,
> >                                               const struct pmu_events_t=
able *table __maybe_unused,
> >                                               void *vdata)
> >   {
> >       struct rblist *groups =3D vdata;
> >
> > -     if (!pe->metric_name)
> > -             return 0;
> > -
> > -     return metricgroup__add_to_mep_groups(pe, groups);
> > +     return metricgroup__add_to_mep_groups(pm, groups);
> >   }
> >
> >   void metricgroup__print(const struct print_callbacks *print_cb, void =
*print_state)
> > @@ -500,16 +497,16 @@ void metricgroup__print(const struct print_callba=
cks *print_cb, void *print_stat
> >       groups.node_delete =3D mep_delete;
> >       table =3D pmu_events_table__find();
> >       if (table) {
> > -             pmu_events_table_for_each_event(table,
> > -                                             metricgroup__add_to_mep_g=
roups_callback,
> > -                                             &groups);
> > +             pmu_events_table_for_each_metric(table,
> > +                                              metricgroup__add_to_mep_=
groups_callback,
> > +                                              &groups);
> >       }
> >       {
> >               struct metricgroup_iter_data data =3D {
> >                       .fn =3D metricgroup__add_to_mep_groups_callback,
> >                       .data =3D &groups,
> >               };
> > -             pmu_for_each_sys_event(metricgroup__sys_event_iter, &data=
);
> > +             pmu_for_each_sys_metric(metricgroup__sys_event_iter, &dat=
a);
> >       }
> >
> >       for (node =3D rb_first_cached(&groups.entries); node; node =3D ne=
xt) {
> > @@ -743,7 +740,7 @@ static int metricgroup__build_event_string(struct s=
trbuf *events,
> >   #undef RETURN_IF_NON_ZERO
> >   }
> >
> > -int __weak arch_get_runtimeparam(const struct pmu_event *pe __maybe_un=
used)
> > +int __weak arch_get_runtimeparam(const struct pmu_metric *pm __maybe_u=
nused)
> >   {
> >       return 1;
> >   }
> > @@ -773,10 +770,10 @@ struct metricgroup_add_iter_data {
> >
> >   static bool metricgroup__find_metric(const char *metric,
> >                                    const struct pmu_events_table *table=
,
> > -                                  struct pmu_event *pe);
> > +                                  struct pmu_metric *pm);
> >
> >   static int add_metric(struct list_head *metric_list,
> > -                   const struct pmu_event *pe,
> > +                   const struct pmu_metric *pm,
> >                     const char *modifier,
> >                     bool metric_no_group,
> >                     const char *user_requested_cpu_list,
> > @@ -816,10 +813,10 @@ static int resolve_metric(struct list_head *metri=
c_list,
> >       size_t bkt;
> >       struct to_resolve {
> >               /* The metric to resolve. */
> > -             struct pmu_event pe;
> > +             struct pmu_metric pm;
> >               /*
> >                * The key in the IDs map, this may differ from in case,
> > -              * etc. from pe->metric_name.
> > +              * etc. from pm->metric_name.
> >                */
> >               const char *key;
> >       } *pending =3D NULL;
> > @@ -830,15 +827,15 @@ static int resolve_metric(struct list_head *metri=
c_list,
> >        * the pending array.
> >        */
> >       hashmap__for_each_entry(root_metric->pctx->ids, cur, bkt) {
> > -             struct pmu_event pe;
> > +             struct pmu_metric pm;
> >
> > -             if (metricgroup__find_metric(cur->pkey, table, &pe)) {
> > +             if (metricgroup__find_metric(cur->pkey, table, &pm)) {
> >                       pending =3D realloc(pending,
> >                                       (pending_cnt + 1) * sizeof(struct=
 to_resolve));
> >                       if (!pending)
> >                               return -ENOMEM;
> >
> > -                     memcpy(&pending[pending_cnt].pe, &pe, sizeof(pe))=
;
> > +                     memcpy(&pending[pending_cnt].pm, &pm, sizeof(pm))=
;
> >                       pending[pending_cnt].key =3D cur->pkey;
> >                       pending_cnt++;
> >               }
> > @@ -853,7 +850,7 @@ static int resolve_metric(struct list_head *metric_=
list,
> >        * context.
> >        */
> >       for (i =3D 0; i < pending_cnt; i++) {
> > -             ret =3D add_metric(metric_list, &pending[i].pe, modifier,=
 metric_no_group,
> > +             ret =3D add_metric(metric_list, &pending[i].pm, modifier,=
 metric_no_group,
> >                                user_requested_cpu_list, system_wide, ro=
ot_metric, visited,
> >                                table);
> >               if (ret)
> > @@ -867,7 +864,7 @@ static int resolve_metric(struct list_head *metric_=
list,
> >   /**
> >    * __add_metric - Add a metric to metric_list.
> >    * @metric_list: The list the metric is added to.
> > - * @pe: The pmu_event containing the metric to be added.
> > + * @pm: The pmu_metric containing the metric to be added.
> >    * @modifier: if non-null event modifiers like "u".
> >    * @metric_no_group: Should events written to events be grouped "{}" =
or
> >    *                   global. Grouping is the default but due to multi=
plexing the
> > @@ -884,7 +881,7 @@ static int resolve_metric(struct list_head *metric_=
list,
> >    *       architecture perf is running upon.
> >    */
> >   static int __add_metric(struct list_head *metric_list,
> > -                     const struct pmu_event *pe,
> > +                     const struct pmu_metric *pm,
> >                       const char *modifier,
> >                       bool metric_no_group,
> >                       int runtime,
> > @@ -898,13 +895,13 @@ static int __add_metric(struct list_head *metric_=
list,
> >       int ret;
> >       bool is_root =3D !root_metric;
> >       struct visited_metric visited_node =3D {
> > -             .name =3D pe->metric_name,
> > +             .name =3D pm->metric_name,
> >               .parent =3D visited,
> >       };
> >
> >       for (vm =3D visited; vm; vm =3D vm->parent) {
> > -             if (!strcmp(pe->metric_name, vm->name)) {
> > -                     pr_err("failed: recursion detected for %s\n", pe-=
>metric_name);
> > +             if (!strcmp(pm->metric_name, vm->name)) {
> > +                     pr_err("failed: recursion detected for %s\n", pm-=
>metric_name);
> >                       return -1;
> >               }
> >       }
> > @@ -914,7 +911,7 @@ static int __add_metric(struct list_head *metric_li=
st,
> >                * This metric is the root of a tree and may reference ot=
her
> >                * metrics that are added recursively.
> >                */
> > -             root_metric =3D metric__new(pe, modifier, metric_no_group=
, runtime,
> > +             root_metric =3D metric__new(pm, modifier, metric_no_group=
, runtime,
> >                                         user_requested_cpu_list, system=
_wide);
> >               if (!root_metric)
> >                       return -ENOMEM;
> > @@ -929,7 +926,7 @@ static int __add_metric(struct list_head *metric_li=
st,
> >                */
> >               if (root_metric->metric_refs) {
> >                       for (; root_metric->metric_refs[cnt].metric_name;=
 cnt++) {
> > -                             if (!strcmp(pe->metric_name,
> > +                             if (!strcmp(pm->metric_name,
> >                                           root_metric->metric_refs[cnt]=
.metric_name))
> >                                       return 0;
> >                       }
> > @@ -947,8 +944,8 @@ static int __add_metric(struct list_head *metric_li=
st,
> >                * need to change them, so there's no need to create
> >                * our own copy.
> >                */
> > -             root_metric->metric_refs[cnt].metric_name =3D pe->metric_=
name;
> > -             root_metric->metric_refs[cnt].metric_expr =3D pe->metric_=
expr;
> > +             root_metric->metric_refs[cnt].metric_name =3D pm->metric_=
name;
> > +             root_metric->metric_refs[cnt].metric_expr =3D pm->metric_=
expr;
> >
> >               /* Null terminate array. */
> >               root_metric->metric_refs[cnt+1].metric_name =3D NULL;
> > @@ -959,7 +956,7 @@ static int __add_metric(struct list_head *metric_li=
st,
> >        * For both the parent and referenced metrics, we parse
> >        * all the metric's IDs and add it to the root context.
> >        */
> > -     if (expr__find_ids(pe->metric_expr, NULL, root_metric->pctx) < 0)=
 {
> > +     if (expr__find_ids(pm->metric_expr, NULL, root_metric->pctx) < 0)=
 {
> >               /* Broken metric. */
> >               ret =3D -EINVAL;
> >       } else {
> > @@ -981,37 +978,37 @@ static int __add_metric(struct list_head *metric_=
list,
> >
> >   struct metricgroup__find_metric_data {
> >       const char *metric;
> > -     struct pmu_event *pe;
> > +     struct pmu_metric *pm;
> >   };
> >
> > -static int metricgroup__find_metric_callback(const struct pmu_event *p=
e,
> > +static int metricgroup__find_metric_callback(const struct pmu_metric *=
pm,
> >                                            const struct pmu_events_tabl=
e *table  __maybe_unused,
> >                                            void *vdata)
> >   {
> >       struct metricgroup__find_metric_data *data =3D vdata;
> >
> > -     if (!match_metric(pe->metric_name, data->metric))
> > +     if (!match_metric(pm->metric_name, data->metric))
> >               return 0;
> >
> > -     memcpy(data->pe, pe, sizeof(*pe));
> > +     memcpy(data->pm, pm, sizeof(*pm));
> >       return 1;
> >   }
> >
> >   static bool metricgroup__find_metric(const char *metric,
> >                                    const struct pmu_events_table *table=
,
> > -                                  struct pmu_event *pe)
> > +                                  struct pmu_metric *pm)
> >   {
> >       struct metricgroup__find_metric_data data =3D {
> >               .metric =3D metric,
> > -             .pe =3D pe,
> > +             .pm =3D pm,
> >       };
> >
> > -     return pmu_events_table_for_each_event(table, metricgroup__find_m=
etric_callback, &data)
> > +     return pmu_events_table_for_each_metric(table, metricgroup__find_=
metric_callback, &data)
> >               ? true : false;
>
> comment on pre-existing code: since it returns bool, I don't think the
> ternary operator is required at all. There are many instances of this.

There'd be an implicit int -> bool conversion, which is why this
exists. Perhaps changing the return type to int as the int pattern is
ubiquitous.

Thanks,
Ian


> >   }
> >
> >   static int add_metric(struct list_head *metric_list,
> > -                   const struct pmu_event *pe,
> > +                   const struct pmu_metric *pm,
> >                     const char *modifier,
> >                     bool metric_no_group,
> >                     const char *user_requested_cpu_list,
> > @@ -1022,16 +1019,16 @@ static int add_metric(struct list_head *metric_=
list,
> >   {
> >       int ret =3D 0;
> >
> > -     pr_debug("metric expr %s for %s\n", pe->metric_expr, pe->metric_n=
ame);
> > +     pr_debug("metric expr %s for %s\n", pm->metric_expr, pm->metric_n=
ame);
> >
> > -     if (!strstr(pe->metric_expr, "?")) {
> > -             ret =3D __add_metric(metric_list, pe, modifier, metric_no=
_group, 0,
> > +     if (!strstr(pm->metric_expr, "?")) {
> > +             ret =3D __add_metric(metric_list, pm, modifier, metric_no=
_group, 0,
> >                                  user_requested_cpu_list, system_wide, =
root_metric,
> >                                  visited, table);
> >       } else {
> >               int j, count;
> >
> > -             count =3D arch_get_runtimeparam(pe);
> > +             count =3D arch_get_runtimeparam(pm);
> >
> >               /* This loop is added to create multiple
> >                * events depend on count value and add
> > @@ -1039,7 +1036,7 @@ static int add_metric(struct list_head *metric_li=
st,
> >                */
> >
> >               for (j =3D 0; j < count && !ret; j++)
> > -                     ret =3D __add_metric(metric_list, pe, modifier, m=
etric_no_group, j,
> > +                     ret =3D __add_metric(metric_list, pm, modifier, m=
etric_no_group, j,
> >                                          user_requested_cpu_list, syste=
m_wide,
> >                                          root_metric, visited, table);
> >       }
> > @@ -1047,17 +1044,17 @@ static int add_metric(struct list_head *metric_=
list,
> >       return ret;
> >   }
> >
> > -static int metricgroup__add_metric_sys_event_iter(const struct pmu_eve=
nt *pe,
> > +static int metricgroup__add_metric_sys_event_iter(const struct pmu_met=
ric *pm,
> >                                               const struct pmu_events_t=
able *table __maybe_unused,
> >                                               void *data)
> >   {
> >       struct metricgroup_add_iter_data *d =3D data;
> >       int ret;
> >
> > -     if (!match_pe_metric(pe, d->metric_name))
> > +     if (!match_pm_metric(pm, d->metric_name))
> >               return 0;
> >
> > -     ret =3D add_metric(d->metric_list, pe, d->modifier, d->metric_no_=
group,
> > +     ret =3D add_metric(d->metric_list, pm, d->modifier, d->metric_no_=
group,
> >                        d->user_requested_cpu_list, d->system_wide,
> >                        d->root_metric, d->visited, d->table);
> >       if (ret)
> > @@ -1107,19 +1104,19 @@ struct metricgroup__add_metric_data {
> >       bool has_match;
> >   };
> >
> > -static int metricgroup__add_metric_callback(const struct pmu_event *pe=
,
> > +static int metricgroup__add_metric_callback(const struct pmu_metric *p=
m,
> >                                           const struct pmu_events_table=
 *table,
> >                                           void *vdata)
> >   {
> >       struct metricgroup__add_metric_data *data =3D vdata;
> >       int ret =3D 0;
> >
> > -     if (pe->metric_expr &&
> > -             (match_metric(pe->metric_group, data->metric_name) ||
> > -              match_metric(pe->metric_name, data->metric_name))) {
> > +     if (pm->metric_expr &&
> > +             (match_metric(pm->metric_group, data->metric_name) ||
> > +              match_metric(pm->metric_name, data->metric_name))) {
> >
> >               data->has_match =3D true;
> > -             ret =3D add_metric(data->list, pe, data->modifier, data->=
metric_no_group,
> > +             ret =3D add_metric(data->list, pm, data->modifier, data->=
metric_no_group,
> >                                data->user_requested_cpu_list, data->sys=
tem_wide,
> >                                /*root_metric=3D*/NULL, /*visited_metric=
s=3D*/NULL, table);
> >       }
> > @@ -1166,8 +1163,8 @@ static int metricgroup__add_metric(const char *me=
tric_name, const char *modifier
> >                * Iterate over all metrics seeing if metric matches eith=
er the
> >                * name or group. When it does add the metric to the list=
.
> >                */
> > -             ret =3D pmu_events_table_for_each_event(table, metricgrou=
p__add_metric_callback,
> > -                                                   &data);
> > +             ret =3D pmu_events_table_for_each_metric(table, metricgro=
up__add_metric_callback,
> > +                                                    &data);
> >               if (ret)
> >                       goto out;
> >
> > @@ -1189,7 +1186,7 @@ static int metricgroup__add_metric(const char *me=
tric_name, const char *modifier
> >                       },
> >               };
> >
> > -             pmu_for_each_sys_event(metricgroup__sys_event_iter, &data=
);
> > +             pmu_for_each_sys_metric(metricgroup__sys_event_iter, &dat=
a);
> >       }
> >       /* End of pmu events. */
> >       if (!has_match)
> > @@ -1603,16 +1600,16 @@ int metricgroup__parse_groups_test(struct evlis=
t *evlist,
> >                           &perf_pmu__fake, metric_events, table);
> >   }
> >
> > -static int metricgroup__has_metric_callback(const struct pmu_event *pe=
,
> > +static int metricgroup__has_metric_callback(const struct pmu_metric *p=
m,
> >                                           const struct pmu_events_table=
 *table __maybe_unused,
> >                                           void *vdata)
> >   {
> >       const char *metric =3D vdata;
> >
> > -     if (!pe->metric_expr)
> > +     if (!pm->metric_expr)
> >               return 0;
> >
> > -     if (match_metric(pe->metric_name, metric))
> > +     if (match_metric(pm->metric_name, metric))
> >               return 1;
> >
> >       return 0;
> > @@ -1625,8 +1622,8 @@ bool metricgroup__has_metric(const char *metric)
> >       if (!table)
> >               return false;
> >
> > -     return pmu_events_table_for_each_event(table, metricgroup__has_me=
tric_callback,
> > -                                            (void *)metric) ? true : f=
alse;
> > +     return pmu_events_table_for_each_metric(table, metricgroup__has_m=
etric_callback,
> > +                                             (void *)metric) ? true : =
false;
> >   }
> >
> >   int metricgroup__copy_metric_events(struct evlist *evlist, struct cgr=
oup *cgrp,
> > diff --git a/tools/perf/util/metricgroup.h b/tools/perf/util/metricgrou=
p.h
> > index 0013cf582173..b1f186d0f514 100644
> > --- a/tools/perf/util/metricgroup.h
> > +++ b/tools/perf/util/metricgroup.h
> > @@ -81,7 +81,7 @@ int metricgroup__parse_groups_test(struct evlist *evl=
ist,
> >
> >   void metricgroup__print(const struct print_callbacks *print_cb, void =
*print_state);
> >   bool metricgroup__has_metric(const char *metric);
> > -int arch_get_runtimeparam(const struct pmu_event *pe __maybe_unused);
> > +int arch_get_runtimeparam(const struct pmu_metric *pm);
> >   void metricgroup__rblist_exit(struct rblist *metric_events);
> >
> >   int metricgroup__copy_metric_events(struct evlist *evlist, struct cgr=
oup *cgrp,
> > diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-eve=
nts.c
> > index 21cce83462b3..0336ff27c15f 100644
> > --- a/tools/perf/util/parse-events.c
> > +++ b/tools/perf/util/parse-events.c
> > @@ -1570,8 +1570,6 @@ int parse_events_add_pmu(struct parse_events_stat=
e *parse_state,
> >       evsel->scale =3D info.scale;
> >       evsel->per_pkg =3D info.per_pkg;
> >       evsel->snapshot =3D info.snapshot;
> > -     evsel->metric_expr =3D info.metric_expr;
> > -     evsel->metric_name =3D info.metric_name;
> >       return 0;
> >   }
> >
> > diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
> > index 2bdeb89352e7..d627f99b5a63 100644
> > --- a/tools/perf/util/pmu.c
> > +++ b/tools/perf/util/pmu.c
> > @@ -283,10 +283,6 @@ static void perf_pmu_update_alias(struct perf_pmu_=
alias *old,
> >       perf_pmu_assign_str(old->name, "long_desc", &old->long_desc,
> >                           &newalias->long_desc);
> >       perf_pmu_assign_str(old->name, "topic", &old->topic, &newalias->t=
opic);
> > -     perf_pmu_assign_str(old->name, "metric_expr", &old->metric_expr,
> > -                         &newalias->metric_expr);
> > -     perf_pmu_assign_str(old->name, "metric_name", &old->metric_name,
> > -                         &newalias->metric_name);
> >       perf_pmu_assign_str(old->name, "value", &old->str, &newalias->str=
);
> >       old->scale =3D newalias->scale;
> >       old->per_pkg =3D newalias->per_pkg;
> > @@ -302,8 +298,6 @@ void perf_pmu_free_alias(struct perf_pmu_alias *new=
alias)
> >       zfree(&newalias->long_desc);
> >       zfree(&newalias->topic);
> >       zfree(&newalias->str);
> > -     zfree(&newalias->metric_expr);
> > -     zfree(&newalias->metric_name);
> >       zfree(&newalias->pmu_name);
> >       parse_events_terms__purge(&newalias->terms);
> >       free(newalias);
> > @@ -340,16 +334,13 @@ static int __perf_pmu__new_alias(struct list_head=
 *list, char *dir, char *name,
> >       int num;
> >       char newval[256];
> >       char *long_desc =3D NULL, *topic =3D NULL, *unit =3D NULL, *perpk=
g =3D NULL,
> > -          *metric_expr =3D NULL, *metric_name =3D NULL, *deprecated =
=3D NULL,
> > -          *pmu_name =3D NULL;
> > +          *deprecated =3D NULL, *pmu_name =3D NULL;
> >
> >       if (pe) {
> >               long_desc =3D (char *)pe->long_desc;
> >               topic =3D (char *)pe->topic;
> >               unit =3D (char *)pe->unit;
> >               perpkg =3D (char *)pe->perpkg;
> > -             metric_expr =3D (char *)pe->metric_expr;
> > -             metric_name =3D (char *)pe->metric_name;
> >               deprecated =3D (char *)pe->deprecated;
> >               pmu_name =3D (char *)pe->pmu;
> >       }
> > @@ -404,8 +395,6 @@ static int __perf_pmu__new_alias(struct list_head *=
list, char *dir, char *name,
> >               perf_pmu__parse_snapshot(alias, dir, name);
> >       }
> >
> > -     alias->metric_expr =3D metric_expr ? strdup(metric_expr) : NULL;
> > -     alias->metric_name =3D metric_name ? strdup(metric_name): NULL;
> >       alias->desc =3D desc ? strdup(desc) : NULL;
> >       alias->long_desc =3D long_desc ? strdup(long_desc) :
> >                               desc ? strdup(desc) : NULL;
> > @@ -822,9 +811,6 @@ static int pmu_add_cpu_aliases_map_callback(const s=
truct pmu_event *pe,
> >       struct pmu_add_cpu_aliases_map_data *data =3D vdata;
> >       const char *pname =3D pe->pmu ? pe->pmu : data->cpu_name;
> >
> > -     if (!pe->name)
> > -             return 0;
> > -
> >       if (data->pmu->is_uncore && pmu_uncore_alias_match(pname, data->n=
ame))
> >               goto new_alias;
> >
> > @@ -879,12 +865,6 @@ static int pmu_add_sys_aliases_iter_fn(const struc=
t pmu_event *pe,
> >       struct pmu_sys_event_iter_data *idata =3D data;
> >       struct perf_pmu *pmu =3D idata->pmu;
> >
> > -     if (!pe->name) {
> > -             if (pe->metric_group || pe->metric_name)
> > -                     return 0;
> > -             return -EINVAL;
> > -     }
> > -
> >       if (!pe->compat || !pe->pmu)
> >               return 0;
> >
> > @@ -1469,8 +1449,6 @@ int perf_pmu__check_alias(struct perf_pmu *pmu, s=
truct list_head *head_terms,
> >       info->unit     =3D NULL;
> >       info->scale    =3D 0.0;
> >       info->snapshot =3D false;
> > -     info->metric_expr =3D NULL;
> > -     info->metric_name =3D NULL;
> >
> >       list_for_each_entry_safe(term, h, head_terms, list) {
> >               alias =3D pmu_find_alias(pmu, term);
> > @@ -1486,8 +1464,6 @@ int perf_pmu__check_alias(struct perf_pmu *pmu, s=
truct list_head *head_terms,
> >
> >               if (alias->per_pkg)
> >                       info->per_pkg =3D true;
> > -             info->metric_expr =3D alias->metric_expr;
> > -             info->metric_name =3D alias->metric_name;
> >
> >               list_del_init(&term->list);
> >               parse_events_term__delete(term);
> > @@ -1703,8 +1679,7 @@ void print_pmu_events(const struct print_callback=
s *print_cb, void *print_state)
> >       for (j =3D 0; j < len; j++) {
> >               const char *name, *alias =3D NULL, *scale_unit =3D NULL,
> >                       *desc =3D NULL, *long_desc =3D NULL,
> > -                     *encoding_desc =3D NULL, *topic =3D NULL,
> > -                     *metric_name =3D NULL, *metric_expr =3D NULL;
> > +                     *encoding_desc =3D NULL, *topic =3D NULL;
> >               bool deprecated =3D false;
> >               size_t buf_used;
> >
> > @@ -1742,8 +1717,6 @@ void print_pmu_events(const struct print_callback=
s *print_cb, void *print_state)
> >                       buf_used +=3D snprintf(buf + buf_used, sizeof(buf=
) - buf_used,
> >                                       "%s/%s/", aliases[j].pmu->name,
> >                                       aliases[j].event->str) + 1;
> > -                     metric_name =3D aliases[j].event->metric_name;
> > -                     metric_expr =3D aliases[j].event->metric_expr;
> >                       deprecated =3D aliases[j].event->deprecated;
> >               }
> >               print_cb->print_event(print_state,
> > @@ -1756,9 +1729,7 @@ void print_pmu_events(const struct print_callback=
s *print_cb, void *print_state)
> >                               "Kernel PMU event",
> >                               desc,
> >                               long_desc,
> > -                             encoding_desc,
> > -                             metric_name,
> > -                             metric_expr);
> > +                             encoding_desc);
> >       }
> >       if (printed && pager_in_use())
> >               printf("\n");
> > diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
> > index 69ca0004f94f..4d8d64209b4b 100644
> > --- a/tools/perf/util/pmu.h
> > +++ b/tools/perf/util/pmu.h
> > @@ -133,8 +133,6 @@ extern struct perf_pmu perf_pmu__fake;
> >
> >   struct perf_pmu_info {
> >       const char *unit;
> > -     const char *metric_expr;
> > -     const char *metric_name;
> >       double scale;
> >       bool per_pkg;
> >       bool snapshot;
> > @@ -188,13 +186,6 @@ struct perf_pmu_alias {
> >        * default.
> >        */
> >       bool deprecated;
> > -     /**
> > -      * @metric_expr: A metric expression associated with an event. Do=
ing
> > -      * this makes little sense due to scale and unit applying to both=
.
> > -      */
> > -     char *metric_expr;
> > -     /** @metric_name: A name for the metric. unit applying to both. *=
/
> > -     char *metric_name;
> >       /** @pmu_name: The name copied from struct perf_pmu. */
> >       char *pmu_name;
> >   };
> > diff --git a/tools/perf/util/print-events.c b/tools/perf/util/print-eve=
nts.c
> > index 2646ae18d9f9..62e9ea7dcf40 100644
> > --- a/tools/perf/util/print-events.c
> > +++ b/tools/perf/util/print-events.c
> > @@ -101,9 +101,7 @@ void print_tracepoint_events(const struct print_cal=
lbacks *print_cb, void *print
> >                                       "Tracepoint event",
> >                                       /*desc=3D*/NULL,
> >                                       /*long_desc=3D*/NULL,
> > -                                     /*encoding_desc=3D*/NULL,
> > -                                     /*metric_name=3D*/NULL,
> > -                                     /*metric_expr=3D*/NULL);
> > +                                     /*encoding_desc=3D*/NULL);
> >               }
> >               free(dir_path);
> >               free(evt_namelist);
> > @@ -195,9 +193,7 @@ void print_sdt_events(const struct print_callbacks =
*print_cb, void *print_state)
> >                               "SDT event",
> >                               /*desc=3D*/NULL,
> >                               /*long_desc=3D*/NULL,
> > -                             /*encoding_desc=3D*/NULL,
> > -                             /*metric_name=3D*/NULL,
> > -                             /*metric_expr=3D*/NULL);
> > +                             /*encoding_desc=3D*/NULL);
> >
> >               free(evt_name);
> >       }
> > @@ -255,9 +251,7 @@ int print_hwcache_events(const struct print_callbac=
ks *print_cb, void *print_sta
> >                               event_type_descriptors[PERF_TYPE_HW_CACHE=
],
> >                               /*desc=3D*/NULL,
> >                               /*long_desc=3D*/NULL,
> > -                             /*encoding_desc=3D*/NULL,
> > -                             /*metric_name=3D*/NULL,
> > -                             /*metric_expr=3D*/NULL);
> > +                             /*encoding_desc=3D*/NULL);
> >       }
> >       strlist__delete(evt_name_list);
> >       return 0;
> > @@ -277,9 +271,7 @@ void print_tool_events(const struct print_callbacks=
 *print_cb, void *print_state
> >                               "Tool event",
> >                               /*desc=3D*/NULL,
> >                               /*long_desc=3D*/NULL,
> > -                             /*encoding_desc=3D*/NULL,
> > -                             /*metric_name=3D*/NULL,
> > -                             /*metric_expr=3D*/NULL);
> > +                             /*encoding_desc=3D*/NULL);
> >       }
> >   }
> >
> > @@ -331,9 +323,7 @@ void print_symbol_events(const struct print_callbac=
ks *print_cb, void *print_sta
> >                               event_type_descriptors[type],
> >                               /*desc=3D*/NULL,
> >                               /*long_desc=3D*/NULL,
> > -                             /*encoding_desc=3D*/NULL,
> > -                             /*metric_name=3D*/NULL,
> > -                             /*metric_expr=3D*/NULL);
> > +                             /*encoding_desc=3D*/NULL);
> >       }
> >       strlist__delete(evt_name_list);
> >   }
> > @@ -364,9 +354,7 @@ void print_events(const struct print_callbacks *pri=
nt_cb, void *print_state)
> >                       event_type_descriptors[PERF_TYPE_RAW],
> >                       /*desc=3D*/NULL,
> >                       /*long_desc=3D*/NULL,
> > -                     /*encoding_desc=3D*/NULL,
> > -                     /*metric_name=3D*/NULL,
> > -                     /*metric_expr=3D*/NULL);
> > +                     /*encoding_desc=3D*/NULL);
> >
> >       print_cb->print_event(print_state,
> >                       /*topic=3D*/NULL,
> > @@ -378,9 +366,7 @@ void print_events(const struct print_callbacks *pri=
nt_cb, void *print_state)
> >                       event_type_descriptors[PERF_TYPE_RAW],
> >                       "(see 'man perf-list' on how to encode it)",
> >                       /*long_desc=3D*/NULL,
> > -                     /*encoding_desc=3D*/NULL,
> > -                     /*metric_name=3D*/NULL,
> > -                     /*metric_expr=3D*/NULL);
> > +                     /*encoding_desc=3D*/NULL);
> >
> >       print_cb->print_event(print_state,
> >                       /*topic=3D*/NULL,
> > @@ -392,9 +378,7 @@ void print_events(const struct print_callbacks *pri=
nt_cb, void *print_state)
> >                       event_type_descriptors[PERF_TYPE_BREAKPOINT],
> >                       /*desc=3D*/NULL,
> >                       /*long_desc=3D*/NULL,
> > -                     /*encoding_desc=3D*/NULL,
> > -                     /*metric_name=3D*/NULL,
> > -                     /*metric_expr=3D*/NULL);
> > +                     /*encoding_desc=3D*/NULL);
> >
> >       print_tracepoint_events(print_cb, print_state);
> >
> > diff --git a/tools/perf/util/print-events.h b/tools/perf/util/print-eve=
nts.h
> > index c237e53c4487..716dcf4b4859 100644
> > --- a/tools/perf/util/print-events.h
> > +++ b/tools/perf/util/print-events.h
> > @@ -16,8 +16,7 @@ struct print_callbacks {
> >                       const char *scale_unit,
> >                       bool deprecated, const char *event_type_desc,
> >                       const char *desc, const char *long_desc,
> > -                     const char *encoding_desc,
> > -                     const char *metric_name, const char *metric_expr)=
;
> > +                     const char *encoding_desc);
> >       void (*print_metric)(void *print_state,
> >                       const char *group,
> >                       const char *name,
>
