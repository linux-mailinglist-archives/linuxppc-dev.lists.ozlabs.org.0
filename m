Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB42688CAD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 02:42:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7JLY3Dqhz3f7l
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 12:42:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JGGtJ43m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JGGtJ43m;
	dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7JKd6xZ0z3bhW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 12:41:41 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id m14so3350953wrg.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Feb 2023 17:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rothOJAx61IhY6WBzLgJ0pLvV1L69tGtBH8EM756NO8=;
        b=JGGtJ43mQQSjD5iDplV0TKr5vkx/VXre07uHn16ZwJoqK0iPdnRFzazXeDBOc7drVf
         iA0hyjJJhKMHtfH3J1Dlkupz5f3mvNhyF4tWWBBqrdkFifGWfW9vpiP1LYtm1tANuk5x
         CDkTWs5aoqcOApygErzXmNuu4KVA8GufFtqBRQC7GQDvOiJnodRDgjgOpWpiY69JlNvB
         hDUGM9TfhF2P6C/nUPpC3ICMfxp6eOUe40TgBJKFqZfK5ZUtLJYNCc+2Ua8JNjpE5nZD
         DOTe6XGkYm+xIa2VVRfMFDypR9RQhzOvDmr5R+sFK2m6siyVBbM+pn0sDza4ltIdKkYe
         /KRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rothOJAx61IhY6WBzLgJ0pLvV1L69tGtBH8EM756NO8=;
        b=uV/shu6XI7hh/JbtawpEcMkR7hJHcFRekqnm0CsxIIBVoMTtwRAoplofDZb1Tzs+5U
         gPToBNkp6gb+ck6V5lhGJtkn2lk8IccKGCQoro7cO5NRzsBgPHJolzri2V1YiWvhAs0C
         HYhIeQdw0L5lmknUgtPS+JVWLdvbLPNEGCbJqv9k115KUC02TpLieFOlr4fU/qhHTG58
         p4Zn84LS4JeSXfRLUUDY1ru0RxUUbNn15cZZq4ljOcchfRnwce6QO9RsmTDWt/DuMtmW
         0qW9fDychkwUxCav3HBxFY7rZCeW9hWy2v/xfpziEUzWo/wfuZtDXgLpgArlOC80cuXQ
         I3mQ==
X-Gm-Message-State: AO0yUKVs7cUyzdtktPI+1b5gpp3apR0vzZBWssB0PtU5fDaF9WO97Ist
	Gw+uCcvtaq7+Wds8FOGcuhw3aZNZyo4Q4HlVRgpYzg==
X-Google-Smtp-Source: AK7set9KcFxcgBgOvFlB4117j0vmSRXNYNO65A30gArABQfkcUEfrN38aSMQU2A/k5B0ndvaCL9HCt0EhVPjdSUZ6Oc=
X-Received: by 2002:adf:e351:0:b0:2bf:eba5:b652 with SMTP id
 n17-20020adfe351000000b002bfeba5b652mr196573wrj.19.1675388494864; Thu, 02 Feb
 2023 17:41:34 -0800 (PST)
MIME-Version: 1.0
References: <20230203014014.75720-1-irogers@google.com>
In-Reply-To: <20230203014014.75720-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 2 Feb 2023 17:41:22 -0800
Message-ID: <CAP-5=fX0ohsCUspm7NowDy2bmSr2cJfp=iaStK4EAdVy7zBHGA@mail.gmail.com>
Subject: Re: [PATCH v1] perf pmu: Fix aarch64 build
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

On Thu, Feb 2, 2023 at 5:40 PM Ian Rogers <irogers@google.com> wrote:
>
> ARM64 overrides a weak function but a previous change had broken the
> build.
>
> Fixes: 8cefeb8bd336 ("perf pmu-events: Introduce pmu_metrics_table")

As 8cefeb8bd336 ("perf pmu-events: Introduce pmu_metrics_table") is
only on tmp.perf/core then it may be best to just squash this fix into
that.

Thanks,
Ian

> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/arch/arm64/util/pmu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/perf/arch/arm64/util/pmu.c b/tools/perf/arch/arm64/util/pmu.c
> index 2779840d8896..fa143acb4c8d 100644
> --- a/tools/perf/arch/arm64/util/pmu.c
> +++ b/tools/perf/arch/arm64/util/pmu.c
> @@ -22,6 +22,8 @@ static struct perf_pmu *pmu__find_core_pmu(void)
>                         return NULL;
>
>                 return pmu;
> +       }
> +       return NULL;
>  }
>
>  const struct pmu_metrics_table *pmu_metrics_table__find(void)
> --
> 2.39.1.519.gcb327c4b5f-goog
>
