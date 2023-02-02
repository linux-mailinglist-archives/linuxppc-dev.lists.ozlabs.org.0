Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6599687701
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 09:08:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6ryK56zjz3f3Q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 19:08:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sLUudWI8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sLUudWI8;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6rxL64RQz3cCP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 19:07:34 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3127vrc2030763;
	Thu, 2 Feb 2023 08:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kHKUuSYm3LymHhPCVgFFgfXxLfapU3xg+Ifkfu8XDK8=;
 b=sLUudWI8Tf+aEK0KWmW6KhNl6Fck+49UIavJwP/VvGe2K1pUIiKIz+su38gLtaN+jBLi
 jMTdRFSkOLjk4s4PQtf3CuVtBO1odrrPRgaNJ7g0PbQhqpcyA+xNIPyFiCSMkCnecz0M
 NLvvOBNTElnfKgZPden3UhKm761H8f7HTiarNpeVMR+CTLv3ThWTafc9or1DPN93X78j
 mKW9hj0TT2aRjt7WbSb6pUJ3dXuLaFVks1bId8QaRq6fl8dnQ3ZEVTg82UgNOc/01flq
 Lx2CqYSFruWphGiE//+a675BgoVe3vSAcqqnZfcvLjlaHEdp3BU5LhM03fU4pypCkGL9 AA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ng98fr6wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 08:07:06 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31280nfx003066;
	Thu, 2 Feb 2023 08:07:05 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ng98fr6vn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 08:07:05 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31200lw5027465;
	Thu, 2 Feb 2023 08:07:03 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3ncvttwvsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 08:07:03 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 312870M944761368
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Feb 2023 08:07:00 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B7C5420040;
	Thu,  2 Feb 2023 08:07:00 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1ABE2004B;
	Thu,  2 Feb 2023 08:06:53 +0000 (GMT)
Received: from [9.43.0.232] (unknown [9.43.0.232])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Feb 2023 08:06:53 +0000 (GMT)
Message-ID: <8d72c776-cb5f-adfe-ba5c-9f258d8720fe@linux.ibm.com>
Date: Thu, 2 Feb 2023 13:36:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 00/15] jevents/pmu-events improvements
Content-Language: en-US
To: Ian Rogers <irogers@google.com>, John Garry <john.g.garry@oracle.com>,
        Will Deacon <will@kernel.org>, James Clark <james.clark@arm.com>,
        Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kan Liang <kan.liang@linux.intel.com>,
        Kim Phillips <kim.phillips@amd.com>,
        Florian Fischer <florian.fischer@muhq.space>,
        Ravi Bangoria <ravi.bangoria@amd.com>,
        Xing Zhengjun <zhengjun.xing@linux.intel.com>,
        Rob Herring
 <robh@kernel.org>, Kang Minchul <tegongkang@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sandipan Das <sandipan.das@amd.com>,
        Jing Zhang <renyu.zj@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org
References: <20230126233645.200509-1-irogers@google.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20230126233645.200509-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WehzE3LcxbUa5cRYGgq377huCWqAsiNf
X-Proofpoint-GUID: x7-IN_h9wAfUmeFLrekZ37zv9MgerZzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_15,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020076
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
Cc: Perry Taylor <perry.taylor@intel.com>, Caleb Biggers <caleb.biggers@intel.com>, Stephane Eranian <eranian@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patchset looks goot to me

Reviewed-By: Kajol Jain<kjain@linux.ibm.com>

On 1/27/23 05:06, Ian Rogers wrote:
> Add an optimization to jevents using the metric code, rewrite metrics
> in terms of each other in order to minimize size and improve
> readability. For example, on Power8
> other_stall_cpi is rewritten from:
> "PM_CMPLU_STALL / PM_RUN_INST_CMPL - PM_CMPLU_STALL_BRU_CRU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_FXU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_VSU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_LSU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_NTCG_FLUSH / PM_RUN_INST_CMPL - PM_CMPLU_STALL_NO_NTF / PM_RUN_INST_CMPL"
> to:
> "stall_cpi - bru_cru_stall_cpi - fxu_stall_cpi - vsu_stall_cpi - lsu_stall_cpi - ntcg_flush_cpi - no_ntf_stall_cpi"
> Which more closely matches the definition on Power9.
> 
> A limitation of the substitutions are that they depend on strict
> equality and the shape of the tree. This means that for "a + b + c"
> then a substitution of "a + b" will succeed while "b + c" will fail
> (the LHS for "+ c" is "a + b" not just "b").
> 
> Separate out the events and metrics in the pmu-events tables saving
> 14.8% in the table size while making it that metrics no longer need to
> iterate over all events and vice versa. These changes remove evsel's
> direct metric support as the pmu_event no longer has a metric to
> populate it. This is a minor issue as the code wasn't working
> properly, metrics for this are rare and can still be properly ran
> using '-M'.
> 
> Add an ability to just build certain models into the jevents generated
> pmu-metrics.c code. This functionality is appropriate for operating
> systems like ChromeOS, that aim to minimize binary size and know all
> the target CPU models.
> 
> v5. s/list/List/ in a type annotation to fix Python 3.6 as reported by
>     John Garry <john.g.garry@oracle.com>. Fix a bug in metric_test.py
>     where a bad character was imported. To avoid similar regressions,
>     run metric_test.py before generating pmu-events.c.
> v4. Better support the implementor/model style --model argument for
>     jevents.py. Add #slots test fix. On some patches add reviewed-by
>     John Garry <john.g.garry@oracle.com> and Kajol
>     Jain<kjain@linux.ibm.com>.
> v3. Rebase an incorporate review comments from John Garry
>     <john.g.garry@oracle.com>, in particular breaking apart patch 4
>     into 3 patches. The no jevents breakage and then later fix is
>     avoided in this series too.
> v2. Rebase. Modify the code that skips rewriting a metric with the
>     same name with itself, to make the name check case insensitive.
> 
> Ian Rogers (15):
>   perf jevents metric: Correct Function equality
>   perf jevents metric: Add ability to rewrite metrics in terms of others
>   perf jevents: Rewrite metrics in the same file with each other
>   perf pmu-events: Add separate metric from pmu_event
>   perf pmu-events: Separate the metrics from events for no jevents
>   perf pmu-events: Remove now unused event and metric variables
>   perf stat: Remove evsel metric_name/expr
>   perf jevents: Combine table prefix and suffix writing
>   perf pmu-events: Introduce pmu_metrics_table
>   perf jevents: Generate metrics and events as separate tables
>   perf jevents: Add model list option
>   perf pmu-events: Fix testing with JEVENTS_ARCH=all
>   perf jevents: Correct bad character encoding
>   tools build: Add test echo-cmd
>   perf jevents: Run metric_test.py at compile-time
> 
>  tools/build/Makefile.build               |   1 +
>  tools/perf/arch/arm64/util/pmu.c         |  11 +-
>  tools/perf/arch/powerpc/util/header.c    |   4 +-
>  tools/perf/builtin-list.c                |  20 +-
>  tools/perf/builtin-stat.c                |   1 -
>  tools/perf/pmu-events/Build              |  16 +-
>  tools/perf/pmu-events/empty-pmu-events.c | 108 ++++++-
>  tools/perf/pmu-events/jevents.py         | 357 +++++++++++++++++++----
>  tools/perf/pmu-events/metric.py          |  79 ++++-
>  tools/perf/pmu-events/metric_test.py     |  15 +-
>  tools/perf/pmu-events/pmu-events.h       |  26 +-
>  tools/perf/tests/expand-cgroup.c         |   4 +-
>  tools/perf/tests/parse-metric.c          |   4 +-
>  tools/perf/tests/pmu-events.c            |  69 ++---
>  tools/perf/util/cgroup.c                 |   1 -
>  tools/perf/util/evsel.c                  |   2 -
>  tools/perf/util/evsel.h                  |   2 -
>  tools/perf/util/expr.h                   |   1 +
>  tools/perf/util/expr.l                   |   8 +-
>  tools/perf/util/metricgroup.c            | 207 +++++++------
>  tools/perf/util/metricgroup.h            |   4 +-
>  tools/perf/util/parse-events.c           |   2 -
>  tools/perf/util/pmu.c                    |  44 +--
>  tools/perf/util/pmu.h                    |  10 +-
>  tools/perf/util/print-events.c           |  32 +-
>  tools/perf/util/print-events.h           |   3 +-
>  tools/perf/util/python.c                 |   7 -
>  tools/perf/util/stat-shadow.c            | 112 -------
>  tools/perf/util/stat.h                   |   1 -
>  29 files changed, 681 insertions(+), 470 deletions(-)
>  mode change 100644 => 100755 tools/perf/pmu-events/metric_test.py
> 
