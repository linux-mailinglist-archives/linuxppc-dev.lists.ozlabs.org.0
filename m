Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A407967D9F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 00:49:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2y913wPFz3fHw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 10:49:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gZCa5Oqi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=38g7tywckdienwtljwxlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gZCa5Oqi;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2xwh3vLKz3fJS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 10:38:28 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id u186-20020a2560c3000000b007c8e2cf3668so3597234ybb.14
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 15:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wSC7IGbFplNjrd7OktgTvuZJ+ddPP0r726YUt977o3g=;
        b=gZCa5OqiYz7NyA6wxR3fCZCky6kk8dd2ivPt2CaREtn9Z9XF7e58Rav+cA+K9bCEQN
         6o/MuJmb4H9idBb7vfMk6bOdgVuHCE0F1qZipjYthhqjcv0pQUDz7YLAwSnEwbtHbdUa
         Wgxo77095ctlPwQfJX+yHJM0Uan+lqnh/xUw7edMCiC9weIc2kyt+nqBL14pgSN2L2vb
         SR6CTArsAMMpLftaHCc2QfE0zG4i+0XSSZyQT1M9E5/QyPP+wKGZh3F8G7xJ3tmQPakA
         Bn6o3nUY8Q2zmRZGMjElSQ0vZRi9PIeDYDzIB/xxyyVnQhkZaUw/lcuFrgqIk2uBkGz2
         r/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSC7IGbFplNjrd7OktgTvuZJ+ddPP0r726YUt977o3g=;
        b=ylmbsXlo1w6iJFOl07klaJZkaCnYV/RF+1lIK+fOv3cfTzKbkpMp2MesxdfGMRwoNn
         E8N59zcmAMVRNXDSmpcyAzcl7ambWS7bnXw2alP2iV22ZVnS7ktNIYJHw5TkH1Yo3JC7
         6AFGTnB6YfxDVI4agF9ia5NA8PCMh68r/fOO90iwIoE09g2DQbgDcODgvMW5bxR8Kl+Z
         7MgdPZ4cZAr1lOOpIRp/oicOddVPLnFTZxN4+KGenPhmHABAl1fdC/3Pgn8yQhGpPat7
         gSo2f3UFdDEtEVZEqHfQIbZ+LTs9WhTYILx8TtC12oWVPt4bIrwa9WPPQS5QBq/n5j3e
         bJMA==
X-Gm-Message-State: AO0yUKXeQYGVAc6bF4su3rggWO6TwnzSSw2mjbdMsX4d1e5E2Y2ykAA+
	a7xLI5JBZpOjNOA6oazAQx/uTs7wMLqn
X-Google-Smtp-Source: AK7set+OUpwXf8Bx1zrRtgOMDopCjgg4Qbg1GA9ZQB3lT9ReFsdmmO2a+c65JJvtRAYo78u7CvJ3tHwlJO8s
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:b9b8:6de0:39b3:4cf7])
 (user=irogers job=sendgmr) by 2002:a81:b246:0:b0:506:55d9:3a78 with SMTP id
 q67-20020a81b246000000b0050655d93a78mr1019749ywh.339.1674776306506; Thu, 26
 Jan 2023 15:38:26 -0800 (PST)
Date: Thu, 26 Jan 2023 15:36:42 -0800
In-Reply-To: <20230126233645.200509-1-irogers@google.com>
Message-Id: <20230126233645.200509-13-irogers@google.com>
Mime-Version: 1.0
References: <20230126233645.200509-1-irogers@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v5 12/15] perf pmu-events: Fix testing with JEVENTS_ARCH=all
From: Ian Rogers <irogers@google.com>
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
Cc: Ian Rogers <irogers@google.com>, Perry Taylor <perry.taylor@intel.com>, Caleb Biggers <caleb.biggers@intel.com>, Stephane Eranian <eranian@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The #slots literal will return NAN when not on ARM64 which causes a
perf test failure when not on an ARM64 for a JEVENTS_ARCH=all build:
..
 10.4: Parsing of PMU event table metrics with fake PMUs             : FAILED!
..
Add an is_test boolean so that the failure can be avoided when running
as a test.

Fixes: acef233b7ca7 ("perf pmu: Add #slots literal support for arm64")
---
 tools/perf/tests/pmu-events.c | 1 +
 tools/perf/util/expr.h        | 1 +
 tools/perf/util/expr.l        | 8 +++++---
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/pmu-events.c b/tools/perf/tests/pmu-events.c
index 962c3c0d53ba..accf44b3d968 100644
--- a/tools/perf/tests/pmu-events.c
+++ b/tools/perf/tests/pmu-events.c
@@ -950,6 +950,7 @@ static int metric_parse_fake(const char *metric_name, const char *str)
 		pr_debug("expr__ctx_new failed");
 		return TEST_FAIL;
 	}
+	ctx->sctx.is_test = true;
 	if (expr__find_ids(str, NULL, ctx) < 0) {
 		pr_err("expr__find_ids failed\n");
 		return -1;
diff --git a/tools/perf/util/expr.h b/tools/perf/util/expr.h
index 029271540fb0..eaa44b24c555 100644
--- a/tools/perf/util/expr.h
+++ b/tools/perf/util/expr.h
@@ -9,6 +9,7 @@ struct expr_scanner_ctx {
 	char *user_requested_cpu_list;
 	int runtime;
 	bool system_wide;
+	bool is_test;
 };
 
 struct expr_parse_ctx {
diff --git a/tools/perf/util/expr.l b/tools/perf/util/expr.l
index 0168a9637330..72ff4f3d6d4b 100644
--- a/tools/perf/util/expr.l
+++ b/tools/perf/util/expr.l
@@ -84,9 +84,11 @@ static int literal(yyscan_t scanner, const struct expr_scanner_ctx *sctx)
 	YYSTYPE *yylval = expr_get_lval(scanner);
 
 	yylval->num = expr__get_literal(expr_get_text(scanner), sctx);
-	if (isnan(yylval->num))
-		return EXPR_ERROR;
-
+	if (isnan(yylval->num)) {
+		if (!sctx->is_test)
+			return EXPR_ERROR;
+		yylval->num = 1;
+	}
 	return LITERAL;
 }
 %}
-- 
2.39.1.456.gfc5497dd1b-goog

