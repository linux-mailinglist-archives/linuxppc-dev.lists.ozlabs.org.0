Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F279F68AC98
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 22:26:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8QZQ5PGwz3f8D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 08:26:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gMgnnl4u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gMgnnl4u;
	dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8QYT2tmbz2yw0
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 08:25:49 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id d14so7368151wrr.9
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Feb 2023 13:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5QucXsCUGkAYvMM/m5+lQnUtugoTYxql3JyDPSNTCSc=;
        b=gMgnnl4uis9wwGEAHmp91wWTN6meZgAsGLuzViwo3jWh+ke27ZTYyh0hM2AFm3dmsl
         fpU/2t2R9T0+r+de/yRta7sMJaNAA+z/JUNyJp/3VGmj5nHedUDLMncJKnP7q/xSg7D3
         GmiVdUZ+I1Li+cl2Ky6bItiKKioQ6Zi9bu/ULaVFhvBTTZOdD5LmKGQ+OQ+Goec93wIG
         5npijm0lwYSo+Tf4foSxd4Y1YFt24OnkmqMk8pelStoDWhCh6h1kUecYwA1ZMPGcFm1S
         Bb6hdQcRQhh0pG2mNwUP4CFgsl8BDCnMNBuDJsTRBZHVVZZ1y5WnUqs8OyK7p0jyU4Fz
         8CEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5QucXsCUGkAYvMM/m5+lQnUtugoTYxql3JyDPSNTCSc=;
        b=7v6nWIOkG+/t23DYMSqhMiY14OpIJkKjuyFnmZeDc35cZn6RkYzGl0zVwxtrZQPX5s
         boUlh506ZbV5vzJfJQ9j2YKx98ICP5g5vaq6kd75wHikphE7SsoZ1hcB9Fk69xgfqkbA
         AvgS5XVAEYL8U6q+U7u91qPux9EwsS5/2ShiGaAldXQ9TykEdZ/Er5pmAV330kBtz83i
         86uv6AyeqU+ZkoCVfO35TI1tvb3hyW/lErt15Q2vG9dcJ8d+OArTFWcrOGlAvriZHqQ2
         mQL4rEVCQobHoyCrZ4pSGqnr3CTqYlYj4eUmWS9iUJqc9Rtcj/QTHogR3ZhD4Al4dUYe
         mZMA==
X-Gm-Message-State: AO0yUKW8qOh2LAkEtseYNg3YTymp7Rod28AAJOJt3cHQDkdIxftzBbLA
	qaMuzh/N8TSkyy9yUN/8671Eg8qPuraevCFYqdgKDw==
X-Google-Smtp-Source: AK7set9CbvgLfEJ2jn5/zRiDcIDRmDUMIjRHSnXWFoR7u6wNniF5tZuwENqZy7NCTcl7ArQhLKCbViMrWUHcVJ3zCEg=
X-Received: by 2002:a05:6000:16c4:b0:2c3:7ee6:e3ad with SMTP id
 h4-20020a05600016c400b002c37ee6e3admr632269wrf.289.1675545944934; Sat, 04 Feb
 2023 13:25:44 -0800 (PST)
MIME-Version: 1.0
References: <20230126233645.200509-1-irogers@google.com> <20230126233645.200509-16-irogers@google.com>
 <Y91rYT5eBOFUHsJK@kernel.org>
In-Reply-To: <Y91rYT5eBOFUHsJK@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sat, 4 Feb 2023 13:25:31 -0800
Message-ID: <CAP-5=fVSVURfMiDQYL8LSnhGEQ4VSA4EcMvmW6pdfLEtJa7ZNw@mail.gmail.com>
Subject: Re: [PATCH v5 15/15] perf jevents: Run metric_test.py at compile-time
To: Arnaldo Carvalho de Melo <acme@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kang Minchul <tegongkang@gmail.com>, Sandipan Das <sandipan.das@amd.com>, Peter Zijlstra <peterz@infradead.org>, Perry Taylor <perry.taylor@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>, Kim Phillips <kim.phillips@amd.com>, Will Deacon <will@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Xing Zhengjun <zhengjun.xing@linux.intel.com>, Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, Kajol Jain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>, Caleb Biggers <caleb.biggers@intel.com>, linux-arm-kernel@lists.infradead.org, Ravi Bangoria <ravi.bangoria@amd.com>, Florian Fischer <florian.fischer@muhq.space>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.y
 an@linaro.org>, linuxppc-dev@lists.ozlabs.org, Jing Zhang <renyu.zj@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 3, 2023 at 12:15 PM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Em Thu, Jan 26, 2023 at 03:36:45PM -0800, Ian Rogers escreveu:
> > Add a target that generates a log file for running metric_test.py and
> > make this a dependency on generating pmu-events.c. The log output is
> > displayed if the test fails like (the test was modified to make it
> > fail):
> >
> > ```
> >   TEST    /tmp/perf/pmu-events/metric_test.log
> > F......
> > ======================================================================
> > FAIL: test_Brackets (__main__.TestMetricExpressions)
> > ----------------------------------------------------------------------
> > Traceback (most recent call last):
> >   File "tools/perf/pmu-events/metric_test.py", line 33, in test_Brackets
> >     self.assertEqual((a * b + c).ToPerfJson(), 'a * b + d')
> > AssertionError: 'a * b + c' != 'a * b + d'
> > - a * b + c
> > ?         ^
> > + a * b + d
>
> Added this:
>
> diff --git a/tools/perf/.gitignore b/tools/perf/.gitignore
> index 05806ecfc33c12a1..f533e76fb48002b7 100644
> --- a/tools/perf/.gitignore
> +++ b/tools/perf/.gitignore
> @@ -38,6 +38,7 @@ arch/*/include/generated/
>  trace/beauty/generated/
>  pmu-events/pmu-events.c
>  pmu-events/jevents
> +pmu-events/metric_test.log
>  feature/
>  libapi/
>  libbpf/
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index b7d9c42062300d04..bac9272682b759e9 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -1103,6 +1103,7 @@ clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(
>                 $(OUTPUT)util/intel-pt-decoder/inat-tables.c \
>                 $(OUTPUT)tests/llvm-src-{base,kbuild,prologue,relocation}.c \
>                 $(OUTPUT)pmu-events/pmu-events.c \
> +               $(OUTPUT)pmu-events/metric_test.log \
>                 $(OUTPUT)$(fadvise_advice_array) \
>                 $(OUTPUT)$(fsconfig_arrays) \
>                 $(OUTPUT)$(fsmount_arrays) \

Acked, thanks!

Ian
