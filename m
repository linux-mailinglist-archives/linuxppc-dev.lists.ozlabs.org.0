Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3758689BFF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 15:37:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7dXh5v5Yz3fCK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 01:37:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G/VQIdSD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G/VQIdSD;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7dWp3VqXz2ynB
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 01:36:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 56A86B829BD;
	Fri,  3 Feb 2023 14:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7245C433EF;
	Fri,  3 Feb 2023 14:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675434993;
	bh=28utDxiV3Rp5JUpEe2sC6Dt8bzeVHrv1nst7Z5amXrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G/VQIdSD73xW8QY8ihx6OdRO2O4L+7xe6S5V7LFKkPxC5QMnyGa/aLQKyZQH0h3bi
	 MwXvNHi/b+5oIX0kPZRlqKQPLeIzCnXFdBE2WnJpvgCZVJO1p1F8AQuptvZFr0mQ/j
	 /pUmyNxxajhvQkINPwuPjAu/iDajZyxFQtuFzfbSbKns7rQ013mQFNY03Pj1wMWSeM
	 gc/RVbiV24j87vku/8r7nYcdhVEIATMi8DQ0hhcjmnO/HaPOPDRiaVYz1dVvszajJY
	 UU++TKmpzJaRJdUmUb22vBMWPFw2obXsKuU5Xn1W6vaxkDiUlt/4q5E3Mwuw/DawkC
	 yRsrJ9Iwz2g5g==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id BCBC4405BE; Fri,  3 Feb 2023 11:36:30 -0300 (-03)
Date: Fri, 3 Feb 2023 11:36:30 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH v1] perf pmu: Fix aarch64 build
Message-ID: <Y90b7shHtOCQL3ma@kernel.org>
References: <20230203014014.75720-1-irogers@google.com>
 <CAP-5=fX0ohsCUspm7NowDy2bmSr2cJfp=iaStK4EAdVy7zBHGA@mail.gmail.com>
 <Y90XgtX9uv26UAQa@kernel.org>
 <Y90bsM4DGL+WV8m0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y90bsM4DGL+WV8m0@kernel.org>
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

Em Fri, Feb 03, 2023 at 11:35:29AM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Fri, Feb 03, 2023 at 11:17:38AM -0300, Arnaldo Carvalho de Melo escreveu:
> > Em Thu, Feb 02, 2023 at 05:41:22PM -0800, Ian Rogers escreveu:
> > > On Thu, Feb 2, 2023 at 5:40 PM Ian Rogers <irogers@google.com> wrote:
> > > >
> > > > ARM64 overrides a weak function but a previous change had broken the
> > > > build.
> > > >
> > > > Fixes: 8cefeb8bd336 ("perf pmu-events: Introduce pmu_metrics_table")
> > > 
> > > As 8cefeb8bd336 ("perf pmu-events: Introduce pmu_metrics_table") is
> > > only on tmp.perf/core then it may be best to just squash this fix into
> > > that.
> > 
> > Yeah, that was my intention, I'll fold it there to keep bisection,
> > thanks for fixing it so fast, I'll double check on my rk3399 board and
> > on again on the cross-build container.
> 
> Nope, that is not what I reported yesterday, trying to build it on the
> rk3399 board:

Sorry, pulled the trigger too soon, this is _before_ applying your fix,
I should't multitask too much :-\

I'll double check now, 

- Arnaldo
