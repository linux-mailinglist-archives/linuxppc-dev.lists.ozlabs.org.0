Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D00E567C240
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 02:20:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2NDH4ffsz3fDp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 12:19:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JqugyuYY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3ctxrywckdcefoldbopdlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JqugyuYY;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2NCL4zyFz3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 12:19:08 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-482d3bf0266so4071577b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 17:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:mime-version
         :message-id:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B+PoJwMnHudNAAvkvmagUPdA4qpiy9WFe3fcihKnUSk=;
        b=JqugyuYYpjdZ5xDa/yz0yvvoXRL2tZdfJINSRyCJLaBzyV47l2VGRdXK/N3oPd0pWH
         1uH8XQaoSc6EAouspydd93yvI5g/dki1RBMQ082UFottOvB8HCMCySy/XQjWs3tDAZiC
         v0pODtiPQZ6vwOd6Y7AzO1cGu/YTbvfWLvO3jTt2at0HRJnZN9LKM9B9Cl0+OqUfwMDM
         +Lvur64vzwLvDaBuFm9eca6Y3YDZZlLcWKsrKO4bKvMWOLM1jO16vHP0BrKCWe6sWCnf
         iW24l0t6yuudhwT2TL9dylBBWCd7DrYZxVIvjYCcaH+PgsKFplCbizgj11TWwN8SG4s8
         TNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:mime-version
         :message-id:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+PoJwMnHudNAAvkvmagUPdA4qpiy9WFe3fcihKnUSk=;
        b=SbRh/XD0xDaVz0KCU4XU05QEwlFNXVzufFryiAfc9yQ/5wj1ir6GH+dBJDUFFORtnl
         z9ioa+PQwI3Bf21i3p779YhzHN7YA7S7i/AgxbOrMq8uy/NKosKI8FoHPIlFVzV7/Ix+
         CXUkYaukxKrMyej3cmwtPXFjJhj1jlkti6nAruzZ2seVlSQF3M9uaNyXH7hZf7DEcDok
         W8QknGc11ze9KP0GnZxhglaeTzoY6E26PL73zBlUf813OYi+EPLX1GcrK4F9hhnll8qO
         T0dItT+2bcRm0HvdwweJbqNlaCjqtYtGJC17hkLK9aBsoLhKL00g2EIIndC1YuR1NDzv
         +azA==
X-Gm-Message-State: AO0yUKUN13xMgyTnBrjYfNQtCEUzeIt2XUdCZq5ertTENkz2dugADKzw
	PbZ9zgvq/9kqqFAIXxzRz76lhLXdgCpu
X-Google-Smtp-Source: AK7set8b1pF8FQhS4w3v0gzO4rVcVBu30MK52ThCIuRwmd80P3hCykoL5WCVBrPXegaD2MfG8zh7sTQA/P8L
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:568d:4d98:b468:b025])
 (user=irogers job=sendgmr) by 2002:a25:b09:0:b0:80b:cd99:36b2 with SMTP id
 9-20020a250b09000000b0080bcd9936b2mr210267ybl.35.1674695946192; Wed, 25 Jan
 2023 17:19:06 -0800 (PST)
Date: Wed, 25 Jan 2023 17:18:42 -0800
Message-Id: <20230126011854.198243-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v4 00/12] jevents/pmu-events improvements
From: Ian Rogers <irogers@google.com>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Kim Phillips <kim.phillips@amd.com>, 
	Florian Fischer <florian.fischer@muhq.space>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Xing Zhengjun <zhengjun.xing@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Kang Minchul <tegongkang@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sandipan Das <sandipan.das@amd.com>, Jing Zhang <renyu.zj@linux.alibaba.com>, 
	linuxppc-dev@lists.ozlabs.org, Kajol Jain <kjain@linux.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, Perry Taylor <perry.taylor@intel.com>, Caleb Biggers <caleb.biggers@intel.com>, Stephane Eranian <eranian@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add an optimization to jevents using the metric code, rewrite metrics
in terms of each other in order to minimize size and improve
readability. For example, on Power8
other_stall_cpi is rewritten from:
"PM_CMPLU_STALL / PM_RUN_INST_CMPL - PM_CMPLU_STALL_BRU_CRU / PM_RUN_INST_C=
MPL - PM_CMPLU_STALL_FXU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_VSU / PM_RUN_I=
NST_CMPL - PM_CMPLU_STALL_LSU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_NTCG_FLUS=
H / PM_RUN_INST_CMPL - PM_CMPLU_STALL_NO_NTF / PM_RUN_INST_CMPL"
to:
"stall_cpi - bru_cru_stall_cpi - fxu_stall_cpi - vsu_stall_cpi - lsu_stall_=
cpi - ntcg_flush_cpi - no_ntf_stall_cpi"
Which more closely matches the definition on Power9.

A limitation of the substitutions are that they depend on strict
equality and the shape of the tree. This means that for "a + b + c"
then a substitution of "a + b" will succeed while "b + c" will fail
(the LHS for "+ c" is "a + b" not just "b").

Separate out the events and metrics in the pmu-events tables saving
14.8% in the table size while making it that metrics no longer need to
iterate over all events and vice versa. These changes remove evsel's
direct metric support as the pmu_event no longer has a metric to
populate it. This is a minor issue as the code wasn't working
properly, metrics for this are rare and can still be properly ran
using '-M'.

Add an ability to just build certain models into the jevents generated
pmu-metrics.c code. This functionality is appropriate for operating
systems like ChromeOS, that aim to minimize binary size and know all
the target CPU models.

v4. Better support the implementor/model style --model argument for
    jevents.py. Add #slots test fix. On some patches add reviewed-by
    John Garry <john.g.garry@oracle.com> and Kajol
    Jain<kjain@linux.ibm.com>.
v3. Rebase an incorporate review comments from John Garry
    <john.g.garry@oracle.com>, in particular breaking apart patch 4
    into 3 patches. The no jevents breakage and then later fix is
    avoided in this series too.
v2. Rebase. Modify the code that skips rewriting a metric with the
    same name with itself, to make the name check case insensitive.

Ian Rogers (12):
  perf jevents metric: Correct Function equality
  perf jevents metric: Add ability to rewrite metrics in terms of others
  perf jevents: Rewrite metrics in the same file with each other
  perf pmu-events: Add separate metric from pmu_event
  perf pmu-events: Separate the metrics from events for no jevents
  perf pmu-events: Remove now unused event and metric variables
  perf stat: Remove evsel metric_name/expr
  perf jevents: Combine table prefix and suffix writing
  perf pmu-events: Introduce pmu_metrics_table
  perf jevents: Generate metrics and events as separate tables
  perf jevents: Add model list option
  perf pmu-events: Fix testing with JEVENTS_ARCH=3Dall

 tools/perf/arch/arm64/util/pmu.c         |  11 +-
 tools/perf/arch/powerpc/util/header.c    |   4 +-
 tools/perf/builtin-list.c                |  20 +-
 tools/perf/builtin-stat.c                |   1 -
 tools/perf/pmu-events/Build              |   3 +-
 tools/perf/pmu-events/empty-pmu-events.c | 108 ++++++-
 tools/perf/pmu-events/jevents.py         | 357 +++++++++++++++++++----
 tools/perf/pmu-events/metric.py          |  79 ++++-
 tools/perf/pmu-events/metric_test.py     |  10 +
 tools/perf/pmu-events/pmu-events.h       |  26 +-
 tools/perf/tests/expand-cgroup.c         |   4 +-
 tools/perf/tests/parse-metric.c          |   4 +-
 tools/perf/tests/pmu-events.c            |  69 ++---
 tools/perf/util/cgroup.c                 |   1 -
 tools/perf/util/evsel.c                  |   2 -
 tools/perf/util/evsel.h                  |   2 -
 tools/perf/util/expr.h                   |   1 +
 tools/perf/util/expr.l                   |   8 +-
 tools/perf/util/metricgroup.c            | 207 +++++++------
 tools/perf/util/metricgroup.h            |   4 +-
 tools/perf/util/parse-events.c           |   2 -
 tools/perf/util/pmu.c                    |  44 +--
 tools/perf/util/pmu.h                    |  10 +-
 tools/perf/util/print-events.c           |  32 +-
 tools/perf/util/print-events.h           |   3 +-
 tools/perf/util/python.c                 |   7 -
 tools/perf/util/stat-shadow.c            | 112 -------
 tools/perf/util/stat.h                   |   1 -
 28 files changed, 666 insertions(+), 466 deletions(-)

--=20
2.39.1.456.gfc5497dd1b-goog

