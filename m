Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FD067EF35
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 21:06:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3T9n3Ldkz3ftN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 07:06:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=q2M2drMz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=q2M2drMz;
	dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3JpK5ZGRz3fK5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 00:49:12 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso676277wms.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 05:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zoz2PQgrtb+OysccxNzHVaJmvkqki0yLQikOO7BNmw4=;
        b=q2M2drMzlcZQkq/v+8uIO/hM5Uh6/uo4ymrX1mIkT1vKRTFQ+GP28MwJrmm5DmOUa7
         1Tzc2yhjVVuslssvEU3ggpipvvVVqiCaohkkbFDs8rQRSXNQHYdu7cR+dk72h9pDce1x
         CAazXuU8b8GxRvktFu9VcxZZzapnSgCQsycOYMRoL0gpEd3jknxAzlpcmJePsXnVlavf
         DkjfWm/r0MKOlK16uyVHYZdpD3NVkUI0/coR/WoOru1RWALePMG3hCE3Os721PPT7a4L
         uW1grhG8i7XhxcJuQhF585vKL0pIgj/4EyFWMtIbTy45aICHUQL1AqOlJ8t4w1bWXT3L
         5eIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoz2PQgrtb+OysccxNzHVaJmvkqki0yLQikOO7BNmw4=;
        b=qUiEhyGpqlU4nDVE6LjW6awm4z7lG8VyTn1Ez66RLs2srDbkuXeo9QHKeoLnFEJ/mt
         Y8SF4/P46Y1DBOBBfmi7/B8/TXr0/uX9LO9uT0HOny4QLH0Wk/VsRhwYhIzB3hJBXN92
         35LcFQBMXEn2CDo8ef92dB5U2pM3KHcV7IRrZad7AtAj8CLBx+gBKLmlRizNubhdaALu
         x+Ot250fRBG+QaExEL35Xf+Ps9KxyIK58FnEC1zKWj8PubEj6p82DIIk70kCmjyM035C
         EeNL77cL1PVCtu21t66SEvGRMw2i4zME2yqOpp7ZCvugLARnL0XBrlmPi4/KHiVFgzhM
         ahGw==
X-Gm-Message-State: AO0yUKUN1nvfSBge9W7wwmPrAM0v4nAntY9Gk0UzK4CE2tbtYW9i18Zy
	0mOWec0DNGti2EpZuLsz6khotd+yGn/SLD+Zw5yTJQ==
X-Google-Smtp-Source: AK7set/OLRlDkPQvGZxQiFQx7sIAxoq6CwQEyUAL8NY5JMX+xmJwqMfc0USpko3DcCRbnjh5Y9hcUomUV7fjOXb2JIE=
X-Received: by 2002:a05:600c:354f:b0:3dc:40b4:2d1f with SMTP id
 i15-20020a05600c354f00b003dc40b42d1fmr38363wmq.174.1674827343524; Fri, 27 Jan
 2023 05:49:03 -0800 (PST)
MIME-Version: 1.0
References: <20230126233645.200509-1-irogers@google.com> <56f1ed31-886d-358d-cfcc-0ab9fe7a76d8@oracle.com>
In-Reply-To: <56f1ed31-886d-358d-cfcc-0ab9fe7a76d8@oracle.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 27 Jan 2023 05:48:53 -0800
Message-ID: <CAP-5=fWc1UcjZT-8YcqHaiSEUGJCMNd4Syx3-MVhnk5PGUDPMQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] jevents/pmu-events improvements
To: John Garry <john.g.garry@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000df5ad005f33f20e9"
X-Mailman-Approved-At: Sat, 28 Jan 2023 07:04:45 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kang Minchul <tegongkang@gmail.com>, Sandipan Das <sandipan.das@amd.com>, Peter Zijlstra <peterz@infradead.org>, Perry Taylor <perry.taylor@intel.com>, Stephane Eranian <eranian@google.com>, LKML <linux-kernel@vger.kernel.org>, James Clark <james.clark@arm.com>, Kim Phillips <kim.phillips@amd.com>, Will Deacon <will@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Xing Zhengjun <zhengjun.xing@linux.intel.com>, Mike Leach <mike.leach@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Caleb Biggers <caleb.biggers@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Ravi Bangoria <ravi.bangoria@amd.com>, Florian Fischer <florian.fischer@muhq.space>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users <linux-perf-users@vger.kernel.org>, 
 Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.yan@linaro.org>, linuxppc-dev@lists.ozlabs.org, Jing Zhang <renyu.zj@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000df5ad005f33f20e9
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 27, 2023, 5:20 AM John Garry <john.g.garry@oracle.com> wrote:

> On 26/01/2023 23:36, Ian Rogers wrote:
>
> Hi Ian,
>
> At a glance, none of this series has your Signed-off-by tag..
>
> Thanks,
> John
>


Thanks John, will fix. Is there anything else?

Ian

> Add an optimization to jevents using the metric code, rewrite metrics
> > in terms of each other in order to minimize size and improve
> > readability. For example, on Power8
> > other_stall_cpi is rewritten from:
> > "PM_CMPLU_STALL / PM_RUN_INST_CMPL - PM_CMPLU_STALL_BRU_CRU /
> PM_RUN_INST_CMPL - PM_CMPLU_STALL_FXU / PM_RUN_INST_CMPL -
> PM_CMPLU_STALL_VSU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_LSU /
> PM_RUN_INST_CMPL - PM_CMPLU_STALL_NTCG_FLUSH / PM_RUN_INST_CMPL -
> PM_CMPLU_STALL_NO_NTF / PM_RUN_INST_CMPL"
> > to:
> > "stall_cpi - bru_cru_stall_cpi - fxu_stall_cpi - vsu_stall_cpi -
> lsu_stall_cpi - ntcg_flush_cpi - no_ntf_stall_cpi"
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
>

--000000000000df5ad005f33f20e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Fri, Jan 27, 2023, 5:20 AM John Garry &lt;<a href=3D"mailto=
:john.g.garry@oracle.com">john.g.garry@oracle.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">On 26/01/2023 23:36, Ian Rogers wrote:<br>
<br>
Hi Ian,<br>
<br>
At a glance, none of this series has your Signed-off-by tag..<br>
<br>
Thanks,<br>
John<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Thanks John, will fix. Is there anything el=
se?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Ian</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
&gt; Add an optimization to jevents using the metric code, rewrite metrics<=
br>
&gt; in terms of each other in order to minimize size and improve<br>
&gt; readability. For example, on Power8<br>
&gt; other_stall_cpi is rewritten from:<br>
&gt; &quot;PM_CMPLU_STALL / PM_RUN_INST_CMPL - PM_CMPLU_STALL_BRU_CRU / PM_=
RUN_INST_CMPL - PM_CMPLU_STALL_FXU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_VSU =
/ PM_RUN_INST_CMPL - PM_CMPLU_STALL_LSU / PM_RUN_INST_CMPL - PM_CMPLU_STALL=
_NTCG_FLUSH / PM_RUN_INST_CMPL - PM_CMPLU_STALL_NO_NTF / PM_RUN_INST_CMPL&q=
uot;<br>
&gt; to:<br>
&gt; &quot;stall_cpi - bru_cru_stall_cpi - fxu_stall_cpi - vsu_stall_cpi - =
lsu_stall_cpi - ntcg_flush_cpi - no_ntf_stall_cpi&quot;<br>
&gt; Which more closely matches the definition on Power9.<br>
&gt; <br>
&gt; A limitation of the substitutions are that they depend on strict<br>
&gt; equality and the shape of the tree. This means that for &quot;a + b + =
c&quot;<br>
&gt; then a substitution of &quot;a + b&quot; will succeed while &quot;b + =
c&quot; will fail<br>
&gt; (the LHS for &quot;+ c&quot; is &quot;a + b&quot; not just &quot;b&quo=
t;).<br>
&gt; <br>
&gt; Separate out the events and metrics in the pmu-events tables saving<br=
>
&gt; 14.8% in the table size while making it that metrics no longer need to=
<br>
&gt; iterate over all events and vice versa. These changes remove evsel&#39=
;s<br>
&gt; direct metric support as the pmu_event no longer has a metric to<br>
&gt; populate it. This is a minor issue as the code wasn&#39;t working<br>
&gt; properly, metrics for this are rare and can still be properly ran<br>
&gt; using &#39;-M&#39;.<br>
&gt; <br>
&gt; Add an ability to just build certain models into the jevents generated=
<br>
&gt; pmu-metrics.c code. This functionality is appropriate for operating<br=
>
&gt; systems like ChromeOS, that aim to minimize binary size and know all<b=
r>
&gt; the target CPU models.<br>
<br>
</blockquote></div></div></div>

--000000000000df5ad005f33f20e9--
