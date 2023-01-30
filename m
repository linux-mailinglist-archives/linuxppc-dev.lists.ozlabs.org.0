Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0804681E7D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 23:56:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5Np63mSzz3cgV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 09:56:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WtxfNEVR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WtxfNEVR;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5NmN6Sc8z3cdc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 09:54:44 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id d14so12632685wrr.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 14:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cq0lWgBEjX0qF3DV/2EdHUrQ2e84arme4Y1aV0e+f9c=;
        b=WtxfNEVRWpvmZKiAogLe2HHB5eku6sHTI+QZvdEHwZRt1iO8Y2KYCz5tcvDp2zkagb
         wh+hF958L0BNsEIF0xcZrMcYb/N3GKGrHQL+anyDjtAah65JTdcFMxlRJ7VeENJpjaof
         XzjvdQDWH/qkwOFxnwQ/krU4+YETJhOqzK3odnc82mcP9EXPjj1VeVp0jsDL+HIqZBBh
         wNQ1wA53VcgRu0Dr/tN2Un9dQrYjg7zmjnVaC5zUp8jrjkrIHb1XqdMNCGCclY9GQJ+f
         Ajb8IfRFnLGGjfLlabzo8+hWYqPc+JjZ9LPMT44y4mhHjEvzJLpxOLkfgjmgrneEOAbS
         14+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cq0lWgBEjX0qF3DV/2EdHUrQ2e84arme4Y1aV0e+f9c=;
        b=y5J0Pkoi/UUM7mpjRjft2ubp8jRbN0ut/zys6i5fJMGKVg8/q4qEo4U2yt2NMCOhb9
         6U8UIHoiJkcMv0NVyBu799z2K5AWmsbIdK2+ls8VU7Ish/arl2eVi3dcPh098JSKAUpc
         yRtuV7EKGCfKHnx1kttbWunRyxDYQxnsAO4CfIopQw1cbAsGReOk2nnxNJYub32+Nw+u
         1+kV6fBXgmHPOX7A7pKUPuWmvb4EJyFDuSLdIB0WwpD1HCsDWjjwVq3M/aPM1Nui0dlA
         8/Ns8sd+KzcFZwycWOM/g/D8FwiCalwi2HfK4cqUggh14wivsoVXFdueDLHLtzGiggpr
         G5+g==
X-Gm-Message-State: AFqh2koD9yOKMCXNRZhbPKbzI7Ew9XEcYkGb629UlNig8zIRl2gcgy/d
	TPWIkxMtNSyKg7ANSuT9s9+WfpyyMGy7OsYQJDHsQw==
X-Google-Smtp-Source: AMrXdXsGMDasrzf2hGlRQ5Gyl3pCkBVqZo5KlZT5SOTC0w4hUjY2eNPbKNpS+L+cbRAP7+gSqOdwcRcWWjmg+tb1h+I=
X-Received: by 2002:a5d:6b09:0:b0:2bd:e2be:b8b with SMTP id
 v9-20020a5d6b09000000b002bde2be0b8bmr1321886wrw.22.1675119278204; Mon, 30 Jan
 2023 14:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20230126233645.200509-1-irogers@google.com> <20230126233645.200509-11-irogers@google.com>
 <8f53bb96-8213-12f1-f91c-7fb311e4c9a4@oracle.com>
In-Reply-To: <8f53bb96-8213-12f1-f91c-7fb311e4c9a4@oracle.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 30 Jan 2023 14:54:26 -0800
Message-ID: <CAP-5=fUTT1gh0xd-um7NSyg=XuayjWzF90W6Dp4=DOvwyGcmNw@mail.gmail.com>
Subject: Re: [PATCH v5 10/15] perf jevents: Generate metrics and events as
 separate tables
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

On Mon, Jan 30, 2023 at 8:07 AM John Garry <john.g.garry@oracle.com> wrote:
>
> On 26/01/2023 23:36, Ian Rogers wrote:
> > @@ -660,7 +763,29 @@ const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
> >
> >   const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu)
> >   {
> > -        return (struct pmu_metrics_table *)perf_pmu__find_events_table(pmu);
> > +        const struct pmu_metrics_table *table = NULL;
> > +        char *cpuid = perf_pmu__getcpuid(pmu);
> > +        int i;
> > +
> > +        /* on some platforms which uses cpus map, cpuid can be NULL for
> > +         * PMUs other than CORE PMUs.
> > +         */
> > +        if (!cpuid)
> > +                return NULL;
> > +
> > +        i = 0;
> > +        for (;;) {
> > +                const struct pmu_events_map *map = &pmu_events_map[i++];
> > +                if (!map->arch)
> > +                        break;
> > +
> > +                if (!strcmp_cpuid_str(map->cpuid, cpuid)) {
> > +                        table = &map->metric_table;
> > +                        break;
> > +                }
> > +        }
> > +        free(cpuid);
> > +        return table;
> >   }
>
> This is almost identical to generated perf_pmu__find_events_table(),
> except we return a pmu_metrics_table * (instead of a pmu_events_table *)
> and also return the metric table member (instead of event table). But
> the definitions are:
>
> /* Struct used to make the PMU event table implementation opaque to
> callers. */
> struct pmu_events_table {
>          const struct compact_pmu_event *entries;
>          size_t length;
> };
>
> /* Struct used to make the PMU metric table implementation opaque to
> callers. */
> struct pmu_metrics_table {
>          const struct compact_pmu_event *entries;
>          size_t length;
> };
>
> Those structs are defined to be the same thing, so I am failing to see
> the point in a) separate structure types b) why so much duplication
>
> As for b), I know that they are generated and the python code may be
> simpler this way (is it?), but still...

Agreed. The point is to separate the two tables for the typing at the
API layer, internally the representation is the same. When we decode
one we get a pmu_event and the other we get a pmu_metric, so we don't
want to allow the tables to be switched - hence two types.

Thanks,
Ian

> Thanks,
> John
