Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F2C69802E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 17:09:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PH31N6tbKz3cfZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 03:09:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qlFYFp4I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qlFYFp4I;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PH30Q1h4Xz3ccs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 03:08:37 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id by3so18369769wrb.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 08:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EaaYKvifs5/XPz/Up3NUWNbyTIr26a1o0EiTmg6eKpE=;
        b=qlFYFp4IIgyhBDPuwv5IRIcI39sgv54AkLvrVnd7qatTm0FEZPkHmhUP09eHDWz892
         OmQMs6oPA5QP+SBpBKqLva7P6essILiEgggFMPHabsBIHG5KRLWSAcPFg+D7VKNpHMm4
         PUFvBx8aoXGY8Fg9vqh+/H+ZI7QdmWeN0/NQa1ZIRrfb8/GAyH4Cd9ugFEYHDQIypJ3e
         cFmpHFvQ3GaXQ61ZvuKlG7T9J0xlByhgUafO9xHHMJPL1JMqsmPzkrtuxJxUui6132Lt
         ozJ1KRorb7N68npr6OQZYbxJAz8zK9XWTkdRaNjxfX1ux6PqRT/Igd3obVkWR5dBl3GK
         2svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EaaYKvifs5/XPz/Up3NUWNbyTIr26a1o0EiTmg6eKpE=;
        b=hpTmJ252XP4g26oXsYeu4T7ZL66CBFM1368TkheQq5KvB6R3q4xAIki1kwozPDFTwL
         UEtvo3uj7MMFRcbqXoP1Gn0eSG74/f0D8uV2kHFO8fllFP6JDRwT8UysCMUMft7FcJ7M
         f0n1CRqeH6092xbC2YPFY3awYGwpYRDA6Bc8vOLnkvIZyDTwdjpB4gToQh/zCWlFJ9Fc
         iB7CXOYyaWA1zbBiA/wOvIGzvnvJW0KYFRW45L9fC7RU63JUIrW/ev3USfodf3iGQ3P+
         lYzHoT47cD66xJoV3GWfPjfUzGWKrSKZNWug/7FfHvVqb0miAEErko338Tb6r5fXIQ6g
         baSA==
X-Gm-Message-State: AO0yUKXlEKWogiA9Ce2+xTRloocdL6trTW2svGgpMQklJ9RHeJwWHmwr
	jTgT+y+kqKh0oEtrgmk/gCizjjBb8IMuEx0uRCafug==
X-Google-Smtp-Source: AK7set9oZTUHZ85e+Dy7ZzDz3afu+aZYDANsm5QI+W07eXpr6GkYCCklY2OCazeDPEQGnlS3wUsniRuKLsjLGD0H5Fc=
X-Received: by 2002:a5d:4f01:0:b0:2c5:5574:3784 with SMTP id
 c1-20020a5d4f01000000b002c555743784mr59871wru.188.1676477312011; Wed, 15 Feb
 2023 08:08:32 -0800 (PST)
MIME-Version: 1.0
References: <20230215093827.124921-1-kjain@linux.ibm.com>
In-Reply-To: <20230215093827.124921-1-kjain@linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 15 Feb 2023 08:08:20 -0800
Message-ID: <CAP-5=fWZxs432h_Vohe0WXaCATiUrTugpMzbYpKMseJpuj0h-g@mail.gmail.com>
Subject: Re: [PATCH v2] tools/perf/tests: Change true workload to sleep
 workload in all metric test for system wide check
To: Kajol Jain <kjain@linux.ibm.com>
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
Cc: maddy@linux.ibm.com, rnsastry@linux.ibm.com, acme@kernel.org, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 15, 2023 at 1:38 AM Kajol Jain <kjain@linux.ibm.com> wrote:
>
> Testcase stat_all_metrics.sh fails in powerpc:
>
> 98: perf all metrics test : FAILED!
>
> Logs with verbose:
>
> [command]# ./perf test 98 -vv
>  98: perf all metrics test                                           :
>  --- start ---
> test child forked, pid 13262
> Testing BRU_STALL_CPI
> Testing COMPLETION_STALL_CPI
>  ----
> Testing TOTAL_LOCAL_NODE_PUMPS_P23
> Metric 'TOTAL_LOCAL_NODE_PUMPS_P23' not printed in:
> Error:
> Invalid event (hv_24x7/PM_PB_LNS_PUMP23,chip=3/) in per-thread mode, enable system wide with '-a'.
> Testing TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01
> Metric 'TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01' not printed in:
> Error:
> Invalid event (hv_24x7/PM_PB_RTY_LNS_PUMP01,chip=3/) in per-thread mode, enable system wide with '-a'.
>  ----
>
> Based on above logs, we could see some of the hv-24x7 metric events fails,
> and logs suggest to run the metric event with -a option.
> This change happened after the commit a4b8cfcabb1d ("perf stat: Delay metric
> parsing"), which delayed the metric parsing phase and now before metric parsing
> phase perf tool identifies, whether target is system-wide or not. With this
> change, perf_event_open will fails with workload monitoring for uncore events
> as expected.
>
> The perf all metric test case fails as some of the hv-24x7 metric events
> may need bigger workload with system wide monitoring to get the data.
> Fix this issue by changing current system wide check from true workload to
> sleep 0.01 workload.
>
> Result with the patch changes in powerpc:
>
> 98: perf all metrics test : Ok
>
> Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Tested-by: Disha Goel <disgoel@linux.ibm.com>
> Suggested-by: Ian Rogers <irogers@google.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

Tested-by: Ian Rogers <irogers@google.com>

The mention of a4b8cfcabb1d  can be moved to a Fixes tag so that this
is backported.

Thanks,
Ian

> ---
> Changelog:
>
> v1->v2:
> - Addressed review comments from Ian, by changing true workload
>   to sleep workload in "perf all metric test". Rather then adding
>   new system wide check with perf bench workload.
> - Added Reviewed-by, Tested-by and Suggested-by tags.
>
>  tools/perf/tests/shell/stat_all_metrics.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/tests/shell/stat_all_metrics.sh b/tools/perf/tests/shell/stat_all_metrics.sh
> index 6e79349e42be..22e9cb294b40 100755
> --- a/tools/perf/tests/shell/stat_all_metrics.sh
> +++ b/tools/perf/tests/shell/stat_all_metrics.sh
> @@ -11,7 +11,7 @@ for m in $(perf list --raw-dump metrics); do
>      continue
>    fi
>    # Failed so try system wide.
> -  result=$(perf stat -M "$m" -a true 2>&1)
> +  result=$(perf stat -M "$m" -a sleep 0.01 2>&1)
>    if [[ "$result" =~ "${m:0:50}" ]]
>    then
>      continue
> --
> 2.39.1
>
