Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00771689FCC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 17:57:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7hfH6M45z3f8D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 03:57:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WfZv1S4z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WfZv1S4z;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7hdJ4KV6z3f56
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 03:56:36 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D5C8A61F94;
	Fri,  3 Feb 2023 16:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92F2C4339C;
	Fri,  3 Feb 2023 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675443392;
	bh=h7/viEQOihIqILr+s/nTh73JPYHxsBqSaGRcETP5tcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WfZv1S4za0O8S3xKBAkzhmkDpjjZ5oMqlrzwy1eL1z0Jm58kGxDHxDlxOhtb1hnXR
	 hCTWoVCsZtuRXqIGYrcEG/YZn1c6u+7K9wxU1h4DsqhD0Bxf7clbr94+M5BnLM4l38
	 fD8c3ajfVnCwOqWCi7qlkAP1Vwe5/cfogMlFwkdQKmmoaekXC2n+PgLCp7f2wFzhqI
	 WOmwdh0YG4lOxcEQlhhKDW45HxHbtLnetEj29k/r4ezpHUErFZMfjP57XRUXkVQjCC
	 jaNlj/nIqFmsjWXpNXckrtCZQilOvm8SYQIqqnG2tVkaEUNtLp0TLxBgqmyLbfuV0+
	 jR7bn63bl+pWQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 99CD8405BE; Fri,  3 Feb 2023 13:56:28 -0300 (-03)
Date: Fri, 3 Feb 2023 13:56:28 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH v1] perf pmu: Fix aarch64 build
Message-ID: <Y908vNzJp7cVM8gN@kernel.org>
References: <20230203014014.75720-1-irogers@google.com>
 <CAP-5=fX0ohsCUspm7NowDy2bmSr2cJfp=iaStK4EAdVy7zBHGA@mail.gmail.com>
 <Y90XgtX9uv26UAQa@kernel.org>
 <Y90bsM4DGL+WV8m0@kernel.org>
 <Y90b7shHtOCQL3ma@kernel.org>
 <Y90di+N7TODkFvMV@kernel.org>
 <Y90rtA95mWW5Othk@kernel.org>
 <Y90v+jTe6z1dSFE0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y90v+jTe6z1dSFE0@kernel.org>
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

Em Fri, Feb 03, 2023 at 01:02:02PM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Fri, Feb 03, 2023 at 12:43:48PM -0300, Arnaldo Carvalho de Melo escreveu:
> > I tried bisecting, but at this cset:
> > 
> > acme@roc-rk3399-pc:~/git/perf$ git log --oneline -1
> > d22e569cd33d (HEAD) perf pmu-events: Separate the metrics from events for no jevents
> > acme@roc-rk3399-pc:~/git/perf$
> > 
> > I'm getting this:
> > 
> >   CC      /tmp/build/perf/pmu-events/pmu-events.o
> > pmu-events/pmu-events.c:3637:32: error: no previous prototype for ‘perf_pmu__find_table’ [-Werror=missing-prototypes]
> >  3637 | const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu)
> >       |                                ^~~~~~~~~~~~~~~~~~~~
> >   CC      /tmp/build/perf/builtin-ftrace.o
> >   CC      /tmp/build/perf/builtin-help.o
> >   CC      /tmp/build/perf/builtin-buildid-list.o
> > cc1: all warnings being treated as errors
> > make[3]: *** [/home/acme/git/perf/tools/build/Makefile.build:97: /tmp/build/perf/pmu-events/pmu-events.o] Error 1
> > make[2]: *** [Makefile.perf:676: /tmp/build/perf/pmu-events/pmu-events-in.o] Error 2
> > make[2]: *** Waiting for unfinished jobs....
> >   CC      /tmp/build/perf/builtin-buildid-cache.o
> > 
> > <SNIP>
> > 
> >   CC      /tmp/build/perf/tests/attr.o
> > arch/arm64/util/pmu.c: In function ‘pmu_events_table__find’:
> > arch/arm64/util/pmu.c:35:24: error: implicit declaration of function ‘perf_pmu__find_table’; did you mean ‘perf_pmu__find_by_type’? [-Werror=implicit-function-declaration]
> >    35 |                 return perf_pmu__find_table(pmu);
> >       |                        ^~~~~~~~~~~~~~~~~~~~
> >       |                        perf_pmu__find_by_type
> > arch/arm64/util/pmu.c:35:24: error: returning ‘int’ from a function with return type ‘const struct pmu_events_table *’ makes pointer from integer without a cast [-Werror=int-conversion]
> >    35 |                 return perf_pmu__find_table(pmu);
> >       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~
> > cc1: all warnings being treated as errors
> > make[6]: *** [/home/acme/git/perf/tools/build/Makefile.build:97: /tmp/build/perf/arch/arm64/util/pmu.o] Error 1
> > make[5]: *** [/home/acme/git/perf/tools/build/Makefile.build:139: util] Error 2
> > make[4]: *** [/home/acme/git/perf/tools/build/Makefile.build:139: arm64] Error 2
> > make[3]: *** [/home/acme/git/perf/tools/build/Makefile.build:139: arch] Error 2
> > make[3]: *** Waiting for unfinished jobs....
> >   CC      /tmp/build/perf/tests/vmlinux-kallsyms.o
> > 
> > -----
> > 
> > I'm building with:
> 
> So:
> 
> acme@roc-rk3399-pc:~/git/perf$ find tools/perf/ -name "*.[ch]" | xargs grep -w perf_pmu__find_table
> tools/perf/arch/arm64/util/pmu.c:		return perf_pmu__find_table(pmu);
> tools/perf/pmu-events/pmu-events.c:const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu)
> acme@roc-rk3399-pc:~/git/perf$
> acme@roc-rk3399-pc:~/git/perf$ git log --oneline -1
> d22e569cd33d (HEAD) perf pmu-events: Separate the metrics from events for no jevents
> acme@roc-rk3399-pc:~/git/perf$
> 
> Tring to fix...

tools/perf/pmu-events/pmu-events.c was a leftover from a previous build,
strange as I build using O=, not to clutter the source dir, so perhaps
handling that is missing, I'll check.

Fixed aarch64 specific one with:

diff --git a/tools/perf/arch/arm64/util/pmu.c b/tools/perf/arch/arm64/util/pmu.c
index 801bf52e2ea6..b4eaf00ec5a8 100644
--- a/tools/perf/arch/arm64/util/pmu.c
+++ b/tools/perf/arch/arm64/util/pmu.c
@@ -32,7 +32,7 @@ const struct pmu_events_table *pmu_events_table__find(void)
 	struct perf_pmu *pmu = pmu__find_core_pmu();
 
 	if (pmu)
-		return perf_pmu__find_table(pmu);
+		return perf_pmu__find_events_table(pmu);
 
 	return NULL;
 }


---

Continuing...
