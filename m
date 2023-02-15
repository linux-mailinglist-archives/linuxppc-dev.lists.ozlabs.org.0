Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 710DE697273
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 01:07:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGdgs2cTJz3chB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 11:07:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=m6M+yhQ+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=m6M+yhQ+;
	dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGdft5Pxpz3c1K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 11:07:01 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id y1so17470504wru.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 16:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q7dA0r51t3W0VjAaGdomblMdzwKvRvyd6Mp513WnfTQ=;
        b=m6M+yhQ+RhuTXnSZZmdzgqj38yLI1yJ/J8lkjPzLSOJ9yVZuAjuNabwuFuRfNbFuiU
         MqRxyZVmQzLg9PmWD7i2nDoGWNBfH34ufYaQ3TWYi6Wzv6DDbXwUHLZ5599nBE3ihVGM
         4VtHgBMfnjSlE0xZrTsbzuLx7McB7FzYYsrqVnA83sAjS74ZgPAQu3FMuMaUvcczAvB3
         Ix8znm1RKePcPEzgu19NL8swrfVjfpRKhH6g5drVGfHAvMk2l5LwAXpZy3u5Z/bpjGeV
         4eG9iGuJAMZ7ezTvO0Shw8xL+XHgdr4GQ2bXSyWN7M2/zdVjwHDHvQAAnzo/4Ag9iaWQ
         2KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7dA0r51t3W0VjAaGdomblMdzwKvRvyd6Mp513WnfTQ=;
        b=PBkm9HDtfDqDp2B6gtzO2ECqA/Skmn/5M7I2l1RjP9LS39d4oMvzMm53Ulf1Qp0Mgf
         iwhesK+kwqjFg58+o7aX3DOp0NqZBPz0wFAnTLoAQrifIVYljk1UWuxEEw4kgGc/ypDI
         LvDQR6WRHCbAti9tZrr6B3F5zl2ssRQ+zSdCrAs02VH1ONLELnGCDfdNVid+2Yx2Ef1x
         noM3xa7mTBFUjepGqruGW6jo290OQvODrS6HsaDC56wCAlxUzf4LyzDfZf9bMwdd3rKr
         WOYedsG1iuJ54iShxMwXXUInRCfQUcF9AApEjS5wGbrAcRZwOfz9bh75CMFkdryQMkHb
         NVZw==
X-Gm-Message-State: AO0yUKXBPA8GpsQfg+9RNgmuYxSFqM2Xg8M4a9gD0hMo1590G16d6tRp
	9BHg2wcA+a13FWTHmbvkOvpZmvXph9UDtjAKHQ4OyQ==
X-Google-Smtp-Source: AK7set803HZbzeXaa6CXTvbRQ6wWO9571c6fo7NHFXNUBRBjIPb/2Wg+Rjg82SIUSz+iiwRqLlNSkBua90P1EcPy9iY=
X-Received: by 2002:a5d:6b8b:0:b0:2c5:4d9c:d208 with SMTP id
 n11-20020a5d6b8b000000b002c54d9cd208mr163835wrx.735.1676419617996; Tue, 14
 Feb 2023 16:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20230202164413.56743-1-kjain@linux.ibm.com> <3BB099AB-5FB4-40FF-A281-C06A42FBEBC7@linux.vnet.ibm.com>
 <157932b6-be9b-dc92-be91-ba070ebddc75@linux.ibm.com>
In-Reply-To: <157932b6-be9b-dc92-be91-ba070ebddc75@linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 14 Feb 2023 16:06:45 -0800
Message-ID: <CAP-5=fX+My97QeH-fMTRp0tZZ6=Ke7+b057G33Dok=p27cs+eA@mail.gmail.com>
Subject: Re: [PATCH] tools/perf/tests: Add system wide check for perf bench
 workload in all metric test
To: kajoljain <kjain@linux.ibm.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 7, 2023 at 7:45 PM kajoljain <kjain@linux.ibm.com> wrote:
>
>
>
> On 2/6/23 10:10, Athira Rajeev wrote:
> >
> >
> >> On 02-Feb-2023, at 10:14 PM, Kajol Jain <kjain@linux.ibm.com> wrote:
> >>
> >> Testcase stat_all_metrics.sh fails in powerpc:
> >>
> >> 92: perf all metrics test : FAILED!
> >>
> >> Logs with verbose:
> >>
> >> [command]# ./perf test 92 -vv
> >> 92: perf all metrics test                                           :
> >> --- start ---
> >> test child forked, pid 13262
> >> Testing BRU_STALL_CPI
> >> Testing COMPLETION_STALL_CPI
> >> ----
> >> Testing TOTAL_LOCAL_NODE_PUMPS_P23
> >> Metric 'TOTAL_LOCAL_NODE_PUMPS_P23' not printed in:
> >> Error:
> >> Invalid event (hv_24x7/PM_PB_LNS_PUMP23,chip=3/) in per-thread mode, enable system wide with '-a'.
> >> Testing TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01
> >> Metric 'TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01' not printed in:
> >> Error:
> >> Invalid event (hv_24x7/PM_PB_RTY_LNS_PUMP01,chip=3/) in per-thread mode, enable system wide with '-a'.
> >> ----
> >>
> >> Based on above logs, we could see some of the hv-24x7 metric events fails,
> >> and logs suggest to run the metric event with -a option.
> >> This change happened after the commit a4b8cfcabb1d ("perf stat: Delay metric
> >> parsing"), which delayed the metric parsing phase and now before metric parsing
> >> phase perf tool identifies, whether target is system-wide or not. With this
> >> change, perf_event_open will fails with workload monitoring for uncore events
> >> as expected.
> >>
> >> The perf all metric test case fails as some of the hv-24x7 metric events
> >> may need bigger workload to get the data. And the added perf bench
> >> workload in 'perf all metric test case' will not run for hv-24x7 without
> >> -a option.
> >>
> >> Fix this issue by adding system wide check for perf bench workload.
> >>
> >> Result with the patch changes in powerpc:
> >>
> >> 92: perf all metrics test : Ok
> >>
> >> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> >
> > Looks good to me
> >
> > Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>
> Hi Arnaldo,
>    Let me know if patch looks fine to you.
>
> Thanks,
> Kajol Jain

I ran into a similar issue but worked around it with:

```
--- a/tools/perf/tests/shell/stat_all_metrics.sh
+++ b/tools/perf/tests/shell/stat_all_metrics.sh
@@ -11,7 +11,7 @@ for m in $(perf list --raw-dump metrics); do
    continue
  fi
  # Failed so try system wide.
-  result=$(perf stat -M "$m" -a true 2>&1)
+  result=$(perf stat -M "$m" -a sleep 0.01 2>&1)
  if [[ "$result" =~ "${m:0:50}" ]]
  then
    continue
```

Running the synthesize benchmark is potentially slow, wdyt of the change above?

Thanks,
Ian


> >
> >> ---
> >> tools/perf/tests/shell/stat_all_metrics.sh | 7 +++++++
> >> 1 file changed, 7 insertions(+)
> >>
> >> diff --git a/tools/perf/tests/shell/stat_all_metrics.sh b/tools/perf/tests/shell/stat_all_metrics.sh
> >> index 6e79349e42be..d49832a316d9 100755
> >> --- a/tools/perf/tests/shell/stat_all_metrics.sh
> >> +++ b/tools/perf/tests/shell/stat_all_metrics.sh
> >> @@ -23,6 +23,13 @@ for m in $(perf list --raw-dump metrics); do
> >>   then
> >>     continue
> >>   fi
> >> +  # Failed again, possibly the event is uncore pmu event which will need
> >> +  # system wide monitoring with workload, so retry with -a option
> >> +  result=$(perf stat -M "$m" -a perf bench internals synthesize 2>&1)
> >> +  if [[ "$result" =~ "${m:0:50}" ]]
> >> +  then
> >> +    continue
> >> +  fi
> >>   echo "Metric '$m' not printed in:"
> >>   echo "$result"
> >>   if [[ "$err" != "1" ]]
> >> --
> >> 2.39.0
> >>
> >
