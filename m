Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86231678F97
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 06:05:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1FK12RGMz3c8F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 16:05:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lc5SHrgV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lc5SHrgV;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1FJ54SXpz3c3m
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 16:04:20 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id y1so8225337wru.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 21:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPW/FN/QNzolyTaD5K2K+xJ5GnTOu/6mtDOEh2SuJFA=;
        b=lc5SHrgVy8b4JopKaPGVlOweG512m0141P2AhiBimVIlHgoBGoND/tgQA6eUWCk2f/
         AU+HbCibaewktvWHscd6AoH6wNgdFOV1RJBYg7o3kwFtkqmk8pIYB2eu9TYQ4I5xH7GO
         8X8jqlfnb2w3VE4ePxPBcv14UNPZhNtc7v/5prVG8MlrcqhNp3zqDfifqwKl8Ic6FN6m
         JD1L8BZEygFHMntqznR5PHW3yNllLeHC0MBjTXUTrG2pyz82FF8LrAA+ptJkTaMMeptS
         tFrGGfyzdWFw36TIDPtezk6skcLh29+OxWdCjLtI9n1yu8wpO9xMehJUjBV9vgII9qha
         Y8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPW/FN/QNzolyTaD5K2K+xJ5GnTOu/6mtDOEh2SuJFA=;
        b=sB69vFEDghyF/90UOUUkvPF/e8+cAAM3Ye/b1nt1GqhP++dnK/ToEr6MqYrPQjyNWR
         XggV1dGfjEr6rG+0nxD6AZXF4spDbORmLMsIDOa+hj2ocikPXr7LnQKXqBcStaKxvUwt
         5LWKbJFLfQDEd8hOLiM7pNmjlRFVKOenhteiP1LpkTl1CQ294e71Q+NDQ38LDglrf6v4
         AgtPWWyOj2oC9rOiFfBO8f0HpkSK5xllFycvdE0Cz9QcsiVfH9SyZ1hNIDklwwfK9IjO
         Ja7e4SW2eMmHEA2lyiqQNdp4V6rWM2qWUYz5HoLCx03UFfN0EwBJaweDvPOIWcfGNIRq
         bA/w==
X-Gm-Message-State: AFqh2kpJ5iZgWhxfBcwQ67B3p5YXE6thV6rcv/oPR9rIp7/3N+1LsUg2
	kwRRtJq2PXiCpMbS0DZ4OdfUTf/jLSJn+nsNfLci0A==
X-Google-Smtp-Source: AMrXdXvxW0m43ndtyjmoynoye2l6QBRZHFCBVgN+uN25iiw7EBLcLX594j8CM6tWmBIpxBgFbhzGCa99xuzZ5EAuMNk=
X-Received: by 2002:a05:6000:5c6:b0:242:5caa:5fbf with SMTP id
 bh6-20020a05600005c600b002425caa5fbfmr593320wrb.300.1674536656472; Mon, 23
 Jan 2023 21:04:16 -0800 (PST)
MIME-Version: 1.0
References: <20221221223420.2157113-1-irogers@google.com> <791915a9-0c2b-796a-b788-f026e071859b@oracle.com>
In-Reply-To: <791915a9-0c2b-796a-b788-f026e071859b@oracle.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 23 Jan 2023 21:04:04 -0800
Message-ID: <CAP-5=fWayi710LAUDe=o6JW57BCnu=WcwCHOrDzdW3fvOPmgPg@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] jevents/pmu-events improvements
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

On Mon, Jan 23, 2023 at 5:26 AM John Garry <john.g.garry@oracle.com> wrote:
>
> On 21/12/2022 22:34, Ian Rogers wrote:
> > Add an optimization to jevents using the metric code, rewrite metrics
> > in terms of each other in order to minimize size and improve
> > readability. For example, on Power8
> > other_stall_cpi is rewritten from:
> > "PM_CMPLU_STALL / PM_RUN_INST_CMPL - PM_CMPLU_STALL_BRU_CRU / PM_RUN_IN=
ST_CMPL - PM_CMPLU_STALL_FXU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_VSU / PM_R=
UN_INST_CMPL - PM_CMPLU_STALL_LSU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_NTCG_=
FLUSH / PM_RUN_INST_CMPL - PM_CMPLU_STALL_NO_NTF / PM_RUN_INST_CMPL"
> > to:
> > "stall_cpi - bru_cru_stall_cpi - fxu_stall_cpi - vsu_stall_cpi - lsu_st=
all_cpi - ntcg_flush_cpi - no_ntf_stall_cpi"
> > Which more closely matches the definition on Power9.
> >
> > A limitation of the substitutions are that they depend on strict
> > equality and the shape of the tree. This means that for "a + b + c"
> > then a substitution of "a + b" will succeed while "b + c" will fail
> > (the LHS for "+ c" is "a + b" not just "b").
> >
> > Separate out the events and metrics in the pmu-events tables saving
> > 14.8% in the table size while making it that metrics no longer need to
> > iterate over all events and vice versa. These changes remove evsel's
> > direct metric support as the pmu_event no longer has a metric to
> > populate it. This is a minor issue as the code wasn't working
> > properly, metrics for this are rare and can still be properly ran
> > using '-M'.
> >
> > Add an ability to just build certain models into the jevents generated
> > pmu-metrics.c code. This functionality is appropriate for operating
> > systems like ChromeOS, that aim to minimize binary size and know all
> > the target CPU models.
>
>  From a glance, this does not look like it would work for arm64. As I
> see in the code, we check the model in the arch folder for the test to
> see if built. For arm64, as it uses arch/implementator/model folder org,
> and not just arch/model (like x86)
>
> So on the assumption that it does not work for arm64 (or just any arch
> which uses arch/implementator/model folder org), it would be nice to
> have that feature also. Or maybe also support not just specifying model
> but also implementator.

Hmm.. this is tricky as x86 isn't following the implementor pattern. I
will tweak the comment for the ARM64 case where --model will select an
implementor.

> >
> > v2. Rebase. Modify the code that skips rewriting a metric with the
> >      same name with itself, to make the name check case insensitive.
> >
>
>
> Unfortunately you might need another rebase as this does not apply to
> acme perf/core (if that is what you want), now for me at:
>
> 5670ebf54bd2 (HEAD, origin/tmp.perf/core, origin/perf/core, perf/core)
> perf cs-etm: Ensure that Coresight timestamps don't go backwards

Will do, thanks!
Ian

> > Ian Rogers (9):
> >    perf jevents metric: Correct Function equality
> >    perf jevents metric: Add ability to rewrite metrics in terms of othe=
rs
> >    perf jevents: Rewrite metrics in the same file with each other
> >    perf pmu-events: Separate metric out of pmu_event
> >    perf stat: Remove evsel metric_name/expr
> >    perf jevents: Combine table prefix and suffix writing
> >    perf pmu-events: Introduce pmu_metrics_table
> >    perf jevents: Generate metrics and events as separate tables
> >    perf jevents: Add model list option
>
> Thanks,
> John
