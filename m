Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88223678F83
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 05:49:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1DzF2Y40z3c9S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 15:49:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gNSuTHWq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gNSuTHWq;
	dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1DyK0JbPz3bvZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 15:48:55 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id k16so10527365wms.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 20:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iKJPQXY28kZK7sCwwfHqZtW+iaz8ixGeBHkUMwf8lzA=;
        b=gNSuTHWqTDUcrxe9zsCC4yYEY2rZQXORvk3fw4qmmWxw2l42+EC9yw7KqKe2quFZEe
         bY+YmE2RUJhFudy4dhFNjFSA11WsPlVloeZNf5AEAzakkkfzjbrQIiD5AYMJuds2+p3y
         WlDGYlqR9N7caF9bVNhsWX55495kUPcpe5woqbTK2NxQvHU5lMXghhxBNMpDJNs5+4Yj
         60S83jF7r+k6aZfANn3ILWpN94enZPVhtBn4yiGBKE2/KV1d11Sna9KB2n6cUyW1r/Dz
         SbOMhIeNFfbDBSqQdCsWUDSQTFzgOUiKBjNA+3LVRTtiGvu/oqWpgZeytFOcb4JJoCn7
         6G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKJPQXY28kZK7sCwwfHqZtW+iaz8ixGeBHkUMwf8lzA=;
        b=GShGHaJ//TA3XewBtaGz/3uc7AcUqZln5djyKlhCD0rYNJv3lP2eLAqg6jThnPuWVO
         Op/QEuxQ2gNsJ47DRTJTMiqEB3KHmuHJ7KXjwviYwtMjWZ2R8ntEetXBwuEWWQ6ip2q+
         45CsZrMzGKO5u5tra00Hh7NTGdQPKsSpkkOZc7gRoRHXnVGVx/NJVayCD6V6OwjTTAMU
         fhPw65dUxY0ZEXoELndjjodY1t7fQdOj0KN/QScktdlbam6jb1NZQvnhMenqZknrMeig
         dgZ+AD59X+7fj0Ca3qn1sZxrEL30zs1xd+86gfJDSs1OMH3hw1evqCcAU66VXVbhdGd+
         Yf2w==
X-Gm-Message-State: AFqh2kowUBvmQ2ezR/5F0jXOHx2fc2iA0qIp74rnrGv5f8HpwQadpm/d
	qop+G9ijTq0UQvFXw+ha/AyrLQU6Git76NwtZDPDqg==
X-Google-Smtp-Source: AMrXdXuMYuRnnaqnV0ZJVjXo29rptcdLEFYk5BJ3Dt8c+V+fJ/G1tmHSGfz0tW2p5tESpKI2eKbU3HfNsfo07+c+W9o=
X-Received: by 2002:a05:600c:2247:b0:3da:27dd:9585 with SMTP id
 a7-20020a05600c224700b003da27dd9585mr1110848wmm.182.1674535731455; Mon, 23
 Jan 2023 20:48:51 -0800 (PST)
MIME-Version: 1.0
References: <20221221223420.2157113-1-irogers@google.com> <20221221223420.2157113-8-irogers@google.com>
 <dd5070a7-254d-4763-439f-a5bfa8240fe1@oracle.com>
In-Reply-To: <dd5070a7-254d-4763-439f-a5bfa8240fe1@oracle.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 23 Jan 2023 20:48:39 -0800
Message-ID: <CAP-5=fV0GBtx_0qHPemO_AsLyf_3XAxcC9Q2eG-=rMpuTsMmzg@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] perf pmu-events: Introduce pmu_metrics_table
To: John Garry <john.g.garry@oracle.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Jan 23, 2023 at 7:36 AM John Garry <john.g.garry@oracle.com> wrote:
>
> On 21/12/2022 22:34, Ian Rogers wrote:
> > Add a metrics table that is just a cast from pmu_events_table. This
> > changes the APIs so that event and metric usage of the underlying
> > table is different. Later changes will separate the tables.
> >
> > This introduction fixes a NO_JEVENTS=1 regression on:
> >   68: Parse and process metrics                                       : Ok
> >   70: Event expansion for cgroups                                     : Ok
> > caused by the necessary test metrics not being found.
> >
>
> I have just checked some of this code so far...
>
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >   tools/perf/arch/arm64/util/pmu.c         | 23 ++++++++++-
> >   tools/perf/pmu-events/empty-pmu-events.c | 52 ++++++++++++++++++++----
> >   tools/perf/pmu-events/jevents.py         | 24 ++++++++---
> >   tools/perf/pmu-events/pmu-events.h       | 10 +++--
> >   tools/perf/tests/expand-cgroup.c         |  4 +-
> >   tools/perf/tests/parse-metric.c          |  4 +-
> >   tools/perf/tests/pmu-events.c            |  5 ++-
> >   tools/perf/util/metricgroup.c            | 50 +++++++++++------------
> >   tools/perf/util/metricgroup.h            |  2 +-
> >   tools/perf/util/pmu.c                    |  9 +++-
> >   tools/perf/util/pmu.h                    |  1 +
> >   11 files changed, 133 insertions(+), 51 deletions(-)
> >
> > diff --git a/tools/perf/arch/arm64/util/pmu.c b/tools/perf/arch/arm64/util/pmu.c
> > index 477e513972a4..f8ae479a06db 100644
> > --- a/tools/perf/arch/arm64/util/pmu.c
> > +++ b/tools/perf/arch/arm64/util/pmu.c
> > @@ -19,7 +19,28 @@ const struct pmu_events_table *pmu_events_table__find(void)
> >               if (pmu->cpus->nr != cpu__max_cpu().cpu)
> >                       return NULL;
> >
> > -             return perf_pmu__find_table(pmu);
> > +             return perf_pmu__find_events_table(pmu);
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +const struct pmu_metrics_table *pmu_metrics_table__find(void)
> > +{
> > +     struct perf_pmu *pmu = NULL;
> > +
> > +     while ((pmu = perf_pmu__scan(pmu))) {
> > +             if (!is_pmu_core(pmu->name))
> > +                     continue;
> > +
> > +             /*
> > +              * The cpumap should cover all CPUs. Otherwise, some CPUs may
> > +              * not support some events or have different event IDs.
> > +              */
> > +             if (pmu->cpus->nr != cpu__max_cpu().cpu)
> > +                     return NULL;
> > +
> > +             return perf_pmu__find_metrics_table(pmu);
>
> I think that this code will be conflicting with the recent arm64 metric
> support. And now it seems even more scope for factoring out code.

v3 will rebase and fix.

> >       }
> >
> >       return NULL;
> > diff --git a/tools/perf/pmu-events/empty-pmu-events.c b/tools/perf/pmu-events/empty-pmu-events.c
> > index 5572a4d1eddb..d50f60a571dd 100644
> > --- a/tools/perf/pmu-events/empty-pmu-events.c
> > +++ b/tools/perf/pmu-events/empty-pmu-events.c
> > @@ -278,14 +278,12 @@ int pmu_events_table_for_each_event(const struct pmu_events_table *table, pmu_ev
> >       return 0;
> >   }
> >
> > -int pmu_events_table_for_each_metric(const struct pmu_events_table *etable, pmu_metric_iter_fn fn,
> > -                                  void *data)
> > +int pmu_metrics_table_for_each_metric(const struct pmu_metrics_table *table, pmu_metric_iter_fn fn,
> > +                                   void *data)
> >   {
> > -     struct pmu_metrics_table *table = (struct pmu_metrics_table *)etable;
> > -
> >       for (const struct pmu_metric *pm = &table->entries[0]
>
> nit on coding style: do we normally declare local variables like this?
> It condenses the code but makes a bit less readable, IMHO

The main reason to do it is to reduce the scope of pm to just be the
loop body. There's some discussion relating to this to do with the
move to C11:
https://lwn.net/Articles/885941/

> > ; pm->metric_group || pm->metric_name;
> >            pm++) {
> > -             int ret = fn(pm, etable, data);
> > +             int ret = fn(pm, table, data);
> >
> >               if (ret)
> >                       return ret;
> > @@ -293,7 +291,7 @@ int pmu_events_table_for_each_metric(const struct pmu_events_table *etable, pmu_
> >       return 0;
> >   }
> >
> > -const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu)
> > +const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
> >   {
> >       const struct pmu_events_table *table = NULL;
> >       char *cpuid = perf_pmu__getcpuid(pmu);
> > @@ -321,6 +319,34 @@ const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu)
> >       return table;
> >   }
> >
> > +const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu)
> > +{
> > +     const struct pmu_metrics_table *table = NULL;
> > +     char *cpuid = perf_pmu__getcpuid(pmu);
> > +     int i;
> > +
> > +     /* on some platforms which uses cpus map, cpuid can be NULL for
> > +      * PMUs other than CORE PMUs.
> > +      */
> > +     if (!cpuid)
> > +             return NULL;
> > +
> > +     i = 0;
> > +     for (;;) {
> > +             const struct pmu_events_map *map = &pmu_events_map[i++];
>
> To me, this is all strange code. Again this is a comment on the current
> code: Consider pmu_for_each_sys_event() as an example, we have a while
> loop for each member of pmu_sys_event_tables[]. But pmu_sys_event_tables
> is hardcoded for a single member, so why loop? It seems the same for all
> these "for each" helper in the "empty" events c file.

Agreed. I think we should generate the empty case and then event if
there is just 1 iteration, we know that the code is that way because
of the auto-generation.

> > +
> > +             if (!map->cpuid)
> > +                     break;
> > +
> > +             if (!strcmp_cpuid_str(map->cpuid, cpuid)) {
> > +                     table = &map->metric_table;
> > +                     break;
> > +             }
> > +     }
> > +     free(cpuid);
> > +     return table;
> > +}
> > +
> >   const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid)
> >   {
> >       for (const struct pmu_events_map *tables = &pmu_events_map[0];
> > @@ -332,6 +358,17 @@ const struct pmu_events_table *find_core_events_table(const char *arch, const ch
> >       return NULL;
> >   }
> >
> > +const struct pmu_metrics_table *find_core_metrics_table(const char *arch, const char *cpuid)
> > +{
> > +     for (const struct pmu_events_map *tables = &pmu_events_map[0];
> > +          tables->arch;
> > +          tables++) {
>
> combine with previous line?

Done.

> > +             if (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tables->cpuid, cpuid))
> > +                     return &tables->metric_table;
> > +     }
> > +     return NULL;
> > +}
> > +
> >   int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data)
> >   {
> >       for (const struct pmu_events_map *tables = &pmu_events_map[0];
> > @@ -350,8 +387,7 @@ int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data)
> >       for (const struct pmu_events_map *tables = &pmu_events_map[0];
> >            tables->arch;
> >            tables++) {
> > -             int ret = pmu_events_table_for_each_metric(
> > -                     (const struct pmu_events_table *)&tables->metric_table, fn, data);
> > +             int ret = pmu_metrics_table_for_each_metric(&tables->metric_table, fn, data);
> >
> >               if (ret)
> >                       return ret;
> > diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
> > index 7b9714b25d0a..be2cf8a8779c 100755
> > --- a/tools/perf/pmu-events/jevents.py
> > +++ b/tools/perf/pmu-events/jevents.py
> > @@ -609,17 +609,19 @@ int pmu_events_table_for_each_event(const struct pmu_events_table *table,
> >           return 0;
> >   }
> >
> > -int pmu_events_table_for_each_metric(const struct pmu_events_table *table,
> > +int pmu_metrics_table_for_each_metric(const struct pmu_metrics_table *mtable,
> >                                        pmu_metric_iter_fn fn,
> >                                        void *data)
> >   {
> > +        struct pmu_events_table *table = (struct pmu_events_table *)mtable;
>
> As I may have hinted before, can we avoid casts like this, even if
> transient?

It was a trade-off with patch size. Will try to improve in v3.

Thanks,
Ian

> > +
> >           for (size_t i = 0; i < table->length; i++) {
> >                   struct pmu_metric pm;
> >                   int ret;
> >
> >                   decompress_metric(table->entries[i].offset, &pm);
> >                   if (pm.metric_name) {
> > -                        ret = fn(&pm, table, data);
> > +                        ret = fn(&pm, mtable, data);
> >                           if (ret)
> >                                   return ret;
> >                   }
>
>
>
