Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B68846AEA24
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 18:31:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWMtJ4Bj8z3chw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 04:31:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=J5/DGcE5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=J5/DGcE5;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWMsN0R8Xz3bh5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 04:30:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 06669614DF;
	Tue,  7 Mar 2023 17:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9C4C433EF;
	Tue,  7 Mar 2023 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678210211;
	bh=KRX+EIj7U/159DChIw1KaO1QnLiFMDOVdoHwlHI0Jxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J5/DGcE5hMJTQcytYFlBoOaLRGbtkUvLvSbyHb4nCVvuIrsA3Zd0kmTHR50lhfpNQ
	 1lKGYN8NNRxwF3VL3Ygmu2xqaNLpahbuCXgZosmVJ41kXGbTFor3QYnfmbvrWC5zV2
	 gTJqDPzPZlYKFFH+tSqz5h6VlIInaxqWEgD/vqIo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.2 0469/1001] perf jevents: Correct bad character encoding
Date: Tue,  7 Mar 2023 17:54:01 +0100
Message-Id: <20230307170041.744690788@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307170022.094103862@linuxfoundation.org>
References: <20230307170022.094103862@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Kang Minchul <tegongkang@gmail.com>, Ian Rogers <irogers@google.com>, Sandipan Das <sandipan.das@amd.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Perry Taylor <perry.taylor@intel.com>, Stephane Eranian <eranian@google.com>, patches@lists.linux.dev, James Clark <james.clark@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kim Phillips <kim.phillips@amd.com>, Will Deacon <will@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Sasha Levin <sashal@kernel.org>, Rob Herring <robh@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Xing Zhengjun <zhengjun.xing@linux.intel.com>, Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Caleb Biggers <caleb.biggers@intel.com>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ravi Bangoria <ravi.bangoria@amd.com>, Florian Fis
 cher <florian.fischer@muhq.space>, Adrian Hunter <adrian.hunter@intel.com>, Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.yan@linaro.org>, linuxppc-dev@lists.ozlabs.org, Jing Zhang <renyu.zj@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ian Rogers <irogers@google.com>

[ Upstream commit d2e3dc829e389d686194d06f0a64adda4158faae ]

A character encoding issue added a "3D" character that breaks the
metrics test.

Fixes: 40769665b63d8c84 ("perf jevents: Parse metrics during conversion")
Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
Signed-off-by: Ian Rogers <irogers@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Caleb Biggers <caleb.biggers@intel.com>
Cc: Florian Fischer <florian.fischer@muhq.space>
Cc: Ian Rogers <irogers@google.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: James Clark <james.clark@arm.com>
Cc: Jing Zhang <renyu.zj@linux.alibaba.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: John Garry <john.g.garry@oracle.com>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Kang Minchul <tegongkang@gmail.com>
Cc: Kim Phillips <kim.phillips@amd.com>
Cc: Leo Yan <leo.yan@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Perry Taylor <perry.taylor@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Sandipan Das <sandipan.das@amd.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: Will Deacon <will@kernel.org>
Cc: Xing Zhengjun <zhengjun.xing@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Link: https://lore.kernel.org/r/20230126233645.200509-14-irogers@google.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/pmu-events/metric_test.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/pmu-events/metric_test.py b/tools/perf/pmu-events/metric_test.py
index 15315d0f716ca..6980f452df0ad 100644
--- a/tools/perf/pmu-events/metric_test.py
+++ b/tools/perf/pmu-events/metric_test.py
@@ -87,8 +87,8 @@ class TestMetricExpressions(unittest.TestCase):
     after = r'min((a + b if c > 1 else c + d), e + f)'
     self.assertEqual(ParsePerfJson(before).ToPerfJson(), after)
 
-    before =3D r'a if b else c if d else e'
-    after =3D r'(a if b else (c if d else e))'
+    before = r'a if b else c if d else e'
+    after = r'(a if b else (c if d else e))'
     self.assertEqual(ParsePerfJson(before).ToPerfJson(), after)
 
   def test_ToPython(self):
-- 
2.39.2



