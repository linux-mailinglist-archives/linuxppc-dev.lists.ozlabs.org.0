Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDA6689BF3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 15:36:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7dWW4q0qz3fBT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 01:36:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oA+IlZSU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oA+IlZSU;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7dVZ5rBNz2xdw
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 01:35:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA0F061F48;
	Fri,  3 Feb 2023 14:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A10C433EF;
	Fri,  3 Feb 2023 14:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675434932;
	bh=591cCBZ+PsEVXsKpjn0NOJi6MWraP0qqr2cYXmxSpYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oA+IlZSUQ7ppuaUpOeX6yVRxJgsyonYX3RIlBZvC+MfnI2SvZlx1eCvmp9jCio614
	 YDRIHOtwbhxGJX1Eztr3rfn8/1BwT5F5DoYSNRFbGGTAgokcqrmQ2vCieA6QeVaMw1
	 81vSyt7YwUtEVPA9rv5ldkS6GnSsbHAU49WJE4Yh0r9LUN5jU5SdLITjc2XpF10YJU
	 3i78nR0H4oHA1uE7CNT/wTE6MVNSIM9tEaJ+xq+TrPnRUhDw1um+pz/a2fqaus2N0r
	 ArvI+Hu//fVzBIN6yrBWOfM5nVsxKUxFhVof59fPfacLmr9HLQemIfKtrsNsxWFmQ8
	 2YPAJKViqtDKg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 09108405BE; Fri,  3 Feb 2023 11:35:29 -0300 (-03)
Date: Fri, 3 Feb 2023 11:35:28 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH v1] perf pmu: Fix aarch64 build
Message-ID: <Y90bsM4DGL+WV8m0@kernel.org>
References: <20230203014014.75720-1-irogers@google.com>
 <CAP-5=fX0ohsCUspm7NowDy2bmSr2cJfp=iaStK4EAdVy7zBHGA@mail.gmail.com>
 <Y90XgtX9uv26UAQa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y90XgtX9uv26UAQa@kernel.org>
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

Em Fri, Feb 03, 2023 at 11:17:38AM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Thu, Feb 02, 2023 at 05:41:22PM -0800, Ian Rogers escreveu:
> > On Thu, Feb 2, 2023 at 5:40 PM Ian Rogers <irogers@google.com> wrote:
> > >
> > > ARM64 overrides a weak function but a previous change had broken the
> > > build.
> > >
> > > Fixes: 8cefeb8bd336 ("perf pmu-events: Introduce pmu_metrics_table")
> > 
> > As 8cefeb8bd336 ("perf pmu-events: Introduce pmu_metrics_table") is
> > only on tmp.perf/core then it may be best to just squash this fix into
> > that.
> 
> Yeah, that was my intention, I'll fold it there to keep bisection,
> thanks for fixing it so fast, I'll double check on my rk3399 board and
> on again on the cross-build container.

Nope, that is not what I reported yesterday, trying to build it on the
rk3399 board:

acme@roc-rk3399-pc:~/git/perf$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.1 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.1 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
acme@roc-rk3399-pc:~/git/perf$

 CC      /tmp/build/perf/arch/arm64/util/pmu.o
  CC      /tmp/build/perf/bench/epoll-wait.o
arch/arm64/util/pmu.c: In function ‘pmu__find_core_pmu’:
arch/arm64/util/pmu.c:27:33: error: declaration of ‘pmu_metrics_table__find’ shadows a global declaration [-Werror=shadow]
   27 | const struct pmu_metrics_table *pmu_metrics_table__find(void)
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
In file included from arch/arm64/util/pmu.c:5:
arch/arm64/util/../../../util/pmu.h:234:33: note: shadowed declaration is here
  234 | const struct pmu_metrics_table *pmu_metrics_table__find(void);
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
arch/arm64/util/pmu.c: In function ‘pmu_metrics_table__find’:
arch/arm64/util/pmu.c:29:26: error: declaration of ‘pmu’ shadows a previous local [-Werror=shadow]
   29 |         struct perf_pmu *pmu = pmu__find_core_pmu();
      |                          ^~~
arch/arm64/util/pmu.c:11:26: note: shadowed declaration is here
   11 |         struct perf_pmu *pmu = NULL;
      |                          ^~~
arch/arm64/util/pmu.c: In function ‘pmu__find_core_pmu’:
arch/arm64/util/pmu.c:27:1: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
   27 | const struct pmu_metrics_table *pmu_metrics_table__find(void)
      | ^~~~~
arch/arm64/util/pmu.c:37:32: error: declaration of ‘pmu_events_table__find’ shadows a global declaration [-Werror=shadow]
   37 | const struct pmu_events_table *pmu_events_table__find(void)
      |                                ^~~~~~~~~~~~~~~~~~~~~~
In file included from arch/arm64/util/pmu.c:5:
arch/arm64/util/../../../util/pmu.h:233:32: note: shadowed declaration is here
  233 | const struct pmu_events_table *pmu_events_table__find(void);
      |                                ^~~~~~~~~~~~~~~~~~~~~~
arch/arm64/util/pmu.c: In function ‘pmu_events_table__find’:
arch/arm64/util/pmu.c:39:26: error: declaration of ‘pmu’ shadows a previous local [-Werror=shadow]
   39 |         struct perf_pmu *pmu = pmu__find_core_pmu();
      |                          ^~~
arch/arm64/util/pmu.c:11:26: note: shadowed declaration is here
   11 |         struct perf_pmu *pmu = NULL;
      |                          ^~~
arch/arm64/util/pmu.c: In function ‘pmu__find_core_pmu’:
arch/arm64/util/pmu.c:47:8: error: declaration of ‘perf_pmu__cpu_slots_per_cycle’ shadows a global declaration [-Werror=shadow]
   47 | double perf_pmu__cpu_slots_per_cycle(void)
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from arch/arm64/util/pmu.c:5:
arch/arm64/util/../../../util/pmu.h:255:8: note: shadowed declaration is here
  255 | double perf_pmu__cpu_slots_per_cycle(void);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/arm64/util/pmu.c: In function ‘perf_pmu__cpu_slots_per_cycle’:
arch/arm64/util/pmu.c:51:26: error: declaration of ‘pmu’ shadows a previous local [-Werror=shadow]
   51 |         struct perf_pmu *pmu = pmu__find_core_pmu();
      |                          ^~~
arch/arm64/util/pmu.c:11:26: note: shadowed declaration is here
   11 |         struct perf_pmu *pmu = NULL;
      |                          ^~~
arch/arm64/util/pmu.c: In function ‘pmu__find_core_pmu’:
arch/arm64/util/pmu.c:64:1: error: expected declaration or statement at end of input
   64 | }
      | ^
At top level:
arch/arm64/util/pmu.c:47:8: error: ‘perf_pmu__cpu_slots_per_cycle’ defined but not used [-Werror=unused-function]
   47 | double perf_pmu__cpu_slots_per_cycle(void)
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/arm64/util/pmu.c:37:32: error: ‘pmu_events_table__find’ defined but not used [-Werror=unused-function]
   37 | const struct pmu_events_table *pmu_events_table__find(void)
      |                                ^~~~~~~~~~~~~~~~~~~~~~
arch/arm64/util/pmu.c:27:33: error: ‘pmu_metrics_table__find’ defined but not used [-Werror=unused-function]
   27 | const struct pmu_metrics_table *pmu_metrics_table__find(void)
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[6]: *** [/home/acme/git/perf/tools/build/Makefile.build:98: /tmp/build/perf/arch/arm64/util/pmu.o] Error 1
make[5]: *** [/home/acme/git/perf/tools/build/Makefile.build:140: util] Error 2
make[4]: *** [/home/acme/git/perf/tools/build/Makefile.build:140: arm64] Error 2
make[3]: *** [/home/acme/git/perf/tools/build/Makefile.build:140: arch] Error 2
make[3]: *** Waiting for unfinished jobs....

