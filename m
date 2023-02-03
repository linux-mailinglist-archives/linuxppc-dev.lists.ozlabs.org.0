Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 577CF689ECB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 17:04:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7gT81kzfz3fV0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 03:04:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qPw/P3a6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qPw/P3a6;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7gQS29x0z3f8g
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 03:02:08 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 50B9361F76;
	Fri,  3 Feb 2023 16:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8BDC433D2;
	Fri,  3 Feb 2023 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675440125;
	bh=GCFuvtqbmYjdRs4Metw9uUIQYvQiuqQ4yItdPgs0Mxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPw/P3a6cfeMvTHZaKVU39Pxh8PcEbL4Rv/LrNgmRR+6Y84hyTiD56U7rM6ux/b1r
	 +v1ilEKytY5CHyhoK54x56MR4LdnGkRTJd8CdM/MttzjuiaBt3S1vaGJ2uemE/KzTO
	 /fhXP/DDd0dUm+Q2N1Jf38tkDOvavuWXytnFYV9IAcQZcOsGaIUJdO+1npm/BoaAFz
	 a4V5YGL7Z8jyJzI6VhWCZX2u/urOjWohnwnxoUch6q17XtGlJ1r9QaYWkYbWK8Vubm
	 /6GMw2N6G5SEiX6Aigze+Z9KlGiSbuAysXNjnT04Q6VIQQDfXcHR837me/UpPdQEZZ
	 ONN/cF3VLgebQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id D9BC1405BE; Fri,  3 Feb 2023 13:02:02 -0300 (-03)
Date: Fri, 3 Feb 2023 13:02:02 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH v1] perf pmu: Fix aarch64 build
Message-ID: <Y90v+jTe6z1dSFE0@kernel.org>
References: <20230203014014.75720-1-irogers@google.com>
 <CAP-5=fX0ohsCUspm7NowDy2bmSr2cJfp=iaStK4EAdVy7zBHGA@mail.gmail.com>
 <Y90XgtX9uv26UAQa@kernel.org>
 <Y90bsM4DGL+WV8m0@kernel.org>
 <Y90b7shHtOCQL3ma@kernel.org>
 <Y90di+N7TODkFvMV@kernel.org>
 <Y90rtA95mWW5Othk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y90rtA95mWW5Othk@kernel.org>
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

Em Fri, Feb 03, 2023 at 12:43:48PM -0300, Arnaldo Carvalho de Melo escreveu:
> I tried bisecting, but at this cset:
> 
> acme@roc-rk3399-pc:~/git/perf$ git log --oneline -1
> d22e569cd33d (HEAD) perf pmu-events: Separate the metrics from events for no jevents
> acme@roc-rk3399-pc:~/git/perf$
> 
> I'm getting this:
> 
>   CC      /tmp/build/perf/pmu-events/pmu-events.o
> pmu-events/pmu-events.c:3637:32: error: no previous prototype for ‘perf_pmu__find_table’ [-Werror=missing-prototypes]
>  3637 | const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu)
>       |                                ^~~~~~~~~~~~~~~~~~~~
>   CC      /tmp/build/perf/builtin-ftrace.o
>   CC      /tmp/build/perf/builtin-help.o
>   CC      /tmp/build/perf/builtin-buildid-list.o
> cc1: all warnings being treated as errors
> make[3]: *** [/home/acme/git/perf/tools/build/Makefile.build:97: /tmp/build/perf/pmu-events/pmu-events.o] Error 1
> make[2]: *** [Makefile.perf:676: /tmp/build/perf/pmu-events/pmu-events-in.o] Error 2
> make[2]: *** Waiting for unfinished jobs....
>   CC      /tmp/build/perf/builtin-buildid-cache.o
> 
> <SNIP>
> 
>   CC      /tmp/build/perf/tests/attr.o
> arch/arm64/util/pmu.c: In function ‘pmu_events_table__find’:
> arch/arm64/util/pmu.c:35:24: error: implicit declaration of function ‘perf_pmu__find_table’; did you mean ‘perf_pmu__find_by_type’? [-Werror=implicit-function-declaration]
>    35 |                 return perf_pmu__find_table(pmu);
>       |                        ^~~~~~~~~~~~~~~~~~~~
>       |                        perf_pmu__find_by_type
> arch/arm64/util/pmu.c:35:24: error: returning ‘int’ from a function with return type ‘const struct pmu_events_table *’ makes pointer from integer without a cast [-Werror=int-conversion]
>    35 |                 return perf_pmu__find_table(pmu);
>       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[6]: *** [/home/acme/git/perf/tools/build/Makefile.build:97: /tmp/build/perf/arch/arm64/util/pmu.o] Error 1
> make[5]: *** [/home/acme/git/perf/tools/build/Makefile.build:139: util] Error 2
> make[4]: *** [/home/acme/git/perf/tools/build/Makefile.build:139: arm64] Error 2
> make[3]: *** [/home/acme/git/perf/tools/build/Makefile.build:139: arch] Error 2
> make[3]: *** Waiting for unfinished jobs....
>   CC      /tmp/build/perf/tests/vmlinux-kallsyms.o
> 
> -----
> 
> I'm building with:

So:

acme@roc-rk3399-pc:~/git/perf$ find tools/perf/ -name "*.[ch]" | xargs grep -w perf_pmu__find_table
tools/perf/arch/arm64/util/pmu.c:		return perf_pmu__find_table(pmu);
tools/perf/pmu-events/pmu-events.c:const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu)
acme@roc-rk3399-pc:~/git/perf$
acme@roc-rk3399-pc:~/git/perf$ git log --oneline -1
d22e569cd33d (HEAD) perf pmu-events: Separate the metrics from events for no jevents
acme@roc-rk3399-pc:~/git/perf$

Tring to fix...
 
> 
> acme@roc-rk3399-pc:~/git/perf$ alias m
> alias m='make -k BUILD_BPF_SKEL=1 CORESIGHT=1 O=/tmp/build/perf -C tools/perf install-bin && git status && perf test python'
> acme@roc-rk3399-pc:~/git/perf$ rm -rf /tmp/build/$(basename $(pwd)) ; mkdir -p /tmp/build/$(basename $(pwd)) ; m
 
> 
> To then go back to:
> 
> > pmu-events/pmu-events.c:3616:11: error: ‘struct pmu_event’ has no member named ‘metric_expr’
> 

-- 

- Arnaldo
