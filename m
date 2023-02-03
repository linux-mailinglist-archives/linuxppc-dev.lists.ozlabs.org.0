Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 707B568A372
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 21:16:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7n3w357yz3f8g
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 07:16:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XNrPSl5X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XNrPSl5X;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7n2y03t8z3f6B
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 07:15:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4EC89B82BA4;
	Fri,  3 Feb 2023 20:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB01AC433D2;
	Fri,  3 Feb 2023 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675455332;
	bh=3wRIsEkcYgnxR1oUaUKFTnjvlPLYKjDerxB/b+desAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNrPSl5X5PzDmjlWqVQxEf/PMr/4ad/lJjFiZ6RNo5iwLeo+5hLoltqMLjhtHFFw6
	 qQQlqqvcLDoIoDCaBqkP6r9mhyYAH3LHCraBq0fiARVl8x5oRUEL3YpoAOoAR04XF4
	 hpCOTi2f+OgVUr3mHrZIl5vInJdziv28q6CYJdz/AdSq+jlUlFLQ0O0WWwUFWHYugQ
	 erEHNa7QPVdrTZHJSa72QYsUV/SvJYa3dOE7lY45VVXMOoSvKudhFEzc8SFH0oz/0x
	 anhhPBjyETEGVTuu/MXVpxJbSSBJs8F/BYYaEwtoUtLewLzX7phfFxmnaSYa5M9FOC
	 JgDZ9BCDXyt+A==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 35877405BE; Fri,  3 Feb 2023 17:15:29 -0300 (-03)
Date: Fri, 3 Feb 2023 17:15:29 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH v5 15/15] perf jevents: Run metric_test.py at compile-time
Message-ID: <Y91rYT5eBOFUHsJK@kernel.org>
References: <20230126233645.200509-1-irogers@google.com>
 <20230126233645.200509-16-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126233645.200509-16-irogers@google.com>
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

Em Thu, Jan 26, 2023 at 03:36:45PM -0800, Ian Rogers escreveu:
> Add a target that generates a log file for running metric_test.py and
> make this a dependency on generating pmu-events.c. The log output is
> displayed if the test fails like (the test was modified to make it
> fail):
> 
> ```
>   TEST    /tmp/perf/pmu-events/metric_test.log
> F......
> ======================================================================
> FAIL: test_Brackets (__main__.TestMetricExpressions)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>   File "tools/perf/pmu-events/metric_test.py", line 33, in test_Brackets
>     self.assertEqual((a * b + c).ToPerfJson(), 'a * b + d')
> AssertionError: 'a * b + c' != 'a * b + d'
> - a * b + c
> ?         ^
> + a * b + d

Added this:

diff --git a/tools/perf/.gitignore b/tools/perf/.gitignore
index 05806ecfc33c12a1..f533e76fb48002b7 100644
--- a/tools/perf/.gitignore
+++ b/tools/perf/.gitignore
@@ -38,6 +38,7 @@ arch/*/include/generated/
 trace/beauty/generated/
 pmu-events/pmu-events.c
 pmu-events/jevents
+pmu-events/metric_test.log
 feature/
 libapi/
 libbpf/
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index b7d9c42062300d04..bac9272682b759e9 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -1103,6 +1103,7 @@ clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(
 		$(OUTPUT)util/intel-pt-decoder/inat-tables.c \
 		$(OUTPUT)tests/llvm-src-{base,kbuild,prologue,relocation}.c \
 		$(OUTPUT)pmu-events/pmu-events.c \
+		$(OUTPUT)pmu-events/metric_test.log \
 		$(OUTPUT)$(fadvise_advice_array) \
 		$(OUTPUT)$(fsconfig_arrays) \
 		$(OUTPUT)$(fsmount_arrays) \
