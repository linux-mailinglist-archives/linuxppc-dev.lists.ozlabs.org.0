Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A0C689B65
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 15:18:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7d6v71nYz3f90
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 01:18:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZVWZzcng;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZVWZzcng;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7d604m9sz3ch9
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 01:17:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4F3BE61F49;
	Fri,  3 Feb 2023 14:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C73C4339B;
	Fri,  3 Feb 2023 14:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675433861;
	bh=dQBAdVTSaFMdrkvi5jooHf8C4M5IX9U6/h+idH3Nbps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVWZzcnghKdg0dcklR0v569t1WKulSoyQWtEqY/qXe081bk8UBFN2dqBqSTlzqjm1
	 R6qznfa0ME2eSHQUhD5H1yPVy757rEMBPtndsxKyBf9hIhWvHjH14996mD+az34rFZ
	 PwKUl4/3l4Wugvno+SBkVx/OLVOEfDIRCRhMyDfK6edS2gk1TinIaXQOKu9SS6O7SL
	 T7111Hholhsg05kf+SQDgcrK89ZVTZKnTQtRie5O9qG4Ik5M3fjJhTweQpw5awZTsa
	 +14SN9B0nOyC+ghju15RUbDzISVBXGuzMa8BqrTETscXSGVEaKu5yur1oiGJDPxkUc
	 2+snMF9UrV4NA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id A7345405BE; Fri,  3 Feb 2023 11:17:38 -0300 (-03)
Date: Fri, 3 Feb 2023 11:17:38 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH v1] perf pmu: Fix aarch64 build
Message-ID: <Y90XgtX9uv26UAQa@kernel.org>
References: <20230203014014.75720-1-irogers@google.com>
 <CAP-5=fX0ohsCUspm7NowDy2bmSr2cJfp=iaStK4EAdVy7zBHGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP-5=fX0ohsCUspm7NowDy2bmSr2cJfp=iaStK4EAdVy7zBHGA@mail.gmail.com>
X-Url: http://acmel.wordpress.com
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

Em Thu, Feb 02, 2023 at 05:41:22PM -0800, Ian Rogers escreveu:
> On Thu, Feb 2, 2023 at 5:40 PM Ian Rogers <irogers@google.com> wrote:
> >
> > ARM64 overrides a weak function but a previous change had broken the
> > build.
> >
> > Fixes: 8cefeb8bd336 ("perf pmu-events: Introduce pmu_metrics_table")
> 
> As 8cefeb8bd336 ("perf pmu-events: Introduce pmu_metrics_table") is
> only on tmp.perf/core then it may be best to just squash this fix into
> that.

Yeah, that was my intention, I'll fold it there to keep bisection,
thanks for fixing it so fast, I'll double check on my rk3399 board and
on again on the cross-build container.

- Arnaldo

> 
> Thanks,
> Ian
> 
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/arch/arm64/util/pmu.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/tools/perf/arch/arm64/util/pmu.c b/tools/perf/arch/arm64/util/pmu.c
> > index 2779840d8896..fa143acb4c8d 100644
> > --- a/tools/perf/arch/arm64/util/pmu.c
> > +++ b/tools/perf/arch/arm64/util/pmu.c
> > @@ -22,6 +22,8 @@ static struct perf_pmu *pmu__find_core_pmu(void)
> >                         return NULL;
> >
> >                 return pmu;
> > +       }
> > +       return NULL;
> >  }
> >
> >  const struct pmu_metrics_table *pmu_metrics_table__find(void)
> > --
> > 2.39.1.519.gcb327c4b5f-goog
> >

-- 

- Arnaldo
