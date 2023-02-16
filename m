Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3616F699BED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 19:11:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHjgM0PpXz3f50
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 05:11:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Lud5LhA8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Lud5LhA8;
	dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHjfR5qY7z3cdc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 05:10:22 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id l2so2744147wry.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 10:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u8BJ4MZYvude2UfZX0aEIl06W6KmazdVPxZc2eo82sw=;
        b=Lud5LhA8U1dXNoiIn8jCNMmTT0210E774uSxoedxEsUzgDC7JM+2mtD82zyRHl6IQk
         2Qw92Uz6TzegRzpxELyal1f179LIc07qWwreJ9vYphJLDdf9wzXbZYw+hvmjlb0tkeJN
         FhnNYO7MygtP9WAuP5teQNIWit0XHvqHLIHjf3gjHYeAxeWIAipGtb8LmpFOZ29m4Bji
         plzfiQb7DdtM5x2nhG0eJEOfr8TsaaGPS0RUKI71T/R7y8DsU6EkN2tD8b2iiprghZ+2
         tdwcRj23Xk/Za0ocnO8pexKw4+qWPY8l6TblXwYRCxzdS6lJkCvQQCiZp18uJoHw58Lf
         SBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8BJ4MZYvude2UfZX0aEIl06W6KmazdVPxZc2eo82sw=;
        b=Mr+OuHkblr59yOx+iUbcqDiGzyIQ3FfSJ74yRzUpt0IdeC6GBOTDm4ZlgwKsa0/xoU
         /m1j80aWfI6BRx6Dq7qy3W9iJ1/iq1cWPN4M/r1R5hGf6nnYpYaIHPB4JBQfiRS0Xv2X
         9o7c/G+yjrD9XT40O0yXrbYb3FBrj8HAW4gM3lVkb18q4sgIdF+4sUfw9UUJd0Yn7+tk
         Wvn90QLPbuJNMXftjYodB9ijO1bi/biSAgXbQJ6wLRFuzE8sO4ZC6AOuO1KavsVqJxbc
         qOYz1BifkaenBoFfBlkr+rHKBrprVKlbNdtOB8ZP8BoleFuCIl/fCe/7SqXxd7nz7Ve6
         /qrQ==
X-Gm-Message-State: AO0yUKUjZzsnOML/oqjdYXPhnigNBgwE2b22M4CFn/psWimRBZylSNvr
	2X+oIWO8VboWTC/bcSpGwErs0YBI6RWVcjubGS91Nw==
X-Google-Smtp-Source: AK7set8PFbTgnLUl+6xDV2jNK1je3uSP5oF36um1IU6MeHsSb+AkUme5G/OUYIQ0ITW0qySBLXOE3eEYR/fCQOy53kc=
X-Received: by 2002:a5d:6544:0:b0:2c5:4d9c:d206 with SMTP id
 z4-20020a5d6544000000b002c54d9cd206mr152633wrv.733.1676571017231; Thu, 16 Feb
 2023 10:10:17 -0800 (PST)
MIME-Version: 1.0
References: <20230216061240.18067-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230216061240.18067-1-atrajeev@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 16 Feb 2023 10:10:05 -0800
Message-ID: <CAP-5=fWBb2=g82uVTkUbENThsnZyhzU+BHWVpuM7iYWDuA_TqA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/perf: Add json metric events to present CPI stall
 cycles in powerpc
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
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
Cc: ak@linux.intel.com, rnsastry@linux.ibm.com, acme@kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, james.clark@arm.com, jolsa@kernel.org, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 15, 2023 at 10:12 PM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> Power10 Performance Monitoring Unit (PMU) provides events
> to understand stall cycles of different pipeline stages.
> These events along with completed instructions provides
> useful metrics for application tuning.
>
> Patch implements the json changes to collect counter statistics
> to present the high level CPI stall breakdown metrics. New metric
> group is named as "CPI_STALL_RATIO" and this new metric group
> presents these stall metrics:
> - DISPATCHED_CPI ( Dispatch stall cycles per insn )
> - ISSUE_STALL_CPI ( Issue stall cycles per insn )
> - EXECUTION_STALL_CPI ( Execution stall cycles per insn )
> - COMPLETION_STALL_CPI ( Completition stall cycles per insn )
>
> To avoid multipling of events, PM_RUN_INST_CMPL event has been
> modified to use PMC5(performance monitoring counter5) instead
> of PMC4. This change is needed, since completion stall event
> is using PMC4.
>
> Usage example:
>
>  ./perf stat --metric-no-group -M CPI_STALL_RATIO <workload>
>
>  Performance counter stats for 'workload':
>
>     63,056,817,982      PM_CMPL_STALL                    #     0.28 COMPLETION_STALL_CPI
>  1,743,988,038,896      PM_ISSUE_STALL                   #     7.73 ISSUE_STALL_CPI
>    225,597,495,030      PM_RUN_INST_CMPL                 #     6.18 DISPATCHED_CPI
>                                                   #    37.48 EXECUTION_STALL_CPI
>  1,393,916,546,654      PM_DISP_STALL_CYC
>  8,455,376,836,463      PM_EXEC_STALL
>
> "--metric-no-group" is used for forcing PM_RUN_INST_CMPL to be scheduled
> in all group for more accuracy.
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/pmu-events/arch/powerpc/power10/metrics.json | 8 ++++----
>  tools/perf/pmu-events/arch/powerpc/power10/others.json  | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
> index b57526fa44f2..6f53583a0c62 100644
> --- a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
> +++ b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
> @@ -15,7 +15,7 @@
>      {
>          "BriefDescription": "Average cycles per completed instruction when dispatch was stalled for any reason",
>          "MetricExpr": "PM_DISP_STALL_CYC / PM_RUN_INST_CMPL",
> -        "MetricGroup": "CPI",
> +        "MetricGroup": "CPI;CPI_STALL_RATIO",
>          "MetricName": "DISPATCHED_CPI"
>      },
>      {
> @@ -147,13 +147,13 @@
>      {
>          "BriefDescription": "Average cycles per completed instruction when the NTC instruction has been dispatched but not issued for any reason",
>          "MetricExpr": "PM_ISSUE_STALL / PM_RUN_INST_CMPL",
> -        "MetricGroup": "CPI",
> +        "MetricGroup": "CPI;CPI_STALL_RATIO",
>          "MetricName": "ISSUE_STALL_CPI"
>      },
>      {
>          "BriefDescription": "Average cycles per completed instruction when the NTC instruction is waiting to be finished in one of the execution units",
>          "MetricExpr": "PM_EXEC_STALL / PM_RUN_INST_CMPL",
> -        "MetricGroup": "CPI",
> +        "MetricGroup": "CPI;CPI_STALL_RATIO",
>          "MetricName": "EXECUTION_STALL_CPI"
>      },
>      {
> @@ -309,7 +309,7 @@
>      {
>          "BriefDescription": "Average cycles per completed instruction when the NTC instruction cannot complete because the thread was blocked",
>          "MetricExpr": "PM_CMPL_STALL / PM_RUN_INST_CMPL",
> -        "MetricGroup": "CPI",
> +        "MetricGroup": "CPI;CPI_STALL_RATIO",
>          "MetricName": "COMPLETION_STALL_CPI"
>      },
>      {
> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/others.json b/tools/perf/pmu-events/arch/powerpc/power10/others.json
> index 7d0de1a2860b..a771e4b6bec5 100644
> --- a/tools/perf/pmu-events/arch/powerpc/power10/others.json
> +++ b/tools/perf/pmu-events/arch/powerpc/power10/others.json
> @@ -265,7 +265,7 @@
>      "BriefDescription": "Load Missed L1, counted at finish time."
>    },
>    {
> -    "EventCode": "0x400FA",
> +    "EventCode": "0x500FA",
>      "EventName": "PM_RUN_INST_CMPL",
>      "BriefDescription": "Completed PowerPC instructions gated by the run latch."
>    }
> --
> 2.31.1
>
