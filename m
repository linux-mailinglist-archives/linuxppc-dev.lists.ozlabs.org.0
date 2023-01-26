Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5332667C263
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 02:31:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2NTF10Hnz3fZP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 12:31:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VxQifR4e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3adxrywckdiamvskivwksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VxQifR4e;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2NF73Dtmz3fG1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 12:20:43 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id c2-20020a25a2c2000000b008016611ca77so353195ybn.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 17:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rjltbgFvPXxNxLiYStYE3VCcVG+pja2QaxGJnpw1y/o=;
        b=VxQifR4eTm/oiq+AtgXObEPg6PbS+FCbU66oTdjhqZ7NOq5U2vhhVAuJG7CJAmTAx4
         Lt50WFOtTpTs1TQKLM0aOwhl4/O9QSqsZ7GYnbdd8r+IghyCyr7DL5d6c/hl6Au4KTsM
         ErRsXqJd/YTXEyZLP90smJmcXZ2wm1RhUX1E2uhwba8PGvyRkWiCtQofEvi/IEOSjYLn
         WrQqm5BZ6+RZ99ZwhgD8m92fCZeLverYJd/5gsKFa6jFKD1Qm01QpjyXwVbdK1wdSPb8
         QXHTuTatMmpI9W2nK87lMLio5oAZirIt7fZGwV+avak9PsioHMSqNPVCTS6ndtiPIQqP
         D5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjltbgFvPXxNxLiYStYE3VCcVG+pja2QaxGJnpw1y/o=;
        b=AIzKKwmi2QQKlC2l/bLOQiTOdKyrxm2O0eoq+tDAQomU1NRxtPjy05VUeDPzlUx+fn
         hC+eHd0tdKyAuBfTHC/237MdFRcFn1JsUYoNKUoic8WTOZWZQEpi6Odf977hVGWb7tla
         nDWsOpvns4a4YzWkHQxDBx0457fDJ5p19px6XFTudOxpgqFUv7FbGP+8SSrpitDc87Lg
         vJNe53vGU+rszCddDavbh8IGglHyXYdJiQM2ukJvDti9u0xxei9h5023vfJq/PItlEn6
         niSDCBbdYKPM803okfJQYnNcq6yEeBJ3c2JQ+Gl3ofyHMjbFlzR0/EDbey6itYF8rfjv
         844A==
X-Gm-Message-State: AFqh2kqPhBD40Zw/aROnaANKMAcKo77oD27L2WlVggIYL+a4OtU/Vf5R
	CmJybVN14niYa0xHw4V05izphXQPEaVh
X-Google-Smtp-Source: AMrXdXsACLfASuysaOm2/S/UHYpvgci8aYMjvrQ5T1As6a7u+QStn1ktC49JQqivsGHwIDxUs3nwQIls/UA1
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:568d:4d98:b468:b025])
 (user=irogers job=sendgmr) by 2002:a81:ec05:0:b0:4fd:413d:204c with SMTP id
 j5-20020a81ec05000000b004fd413d204cmr2646561ywm.419.1674696041384; Wed, 25
 Jan 2023 17:20:41 -0800 (PST)
Date: Wed, 25 Jan 2023 17:18:54 -0800
In-Reply-To: <20230126011854.198243-1-irogers@google.com>
Message-Id: <20230126011854.198243-13-irogers@google.com>
Mime-Version: 1.0
References: <20230126011854.198243-1-irogers@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v4 12/12] perf pmu-events: Fix testing with JEVENTS_ARCH=all
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
Signed-off-by: Ian Rogers <irogers@google.com>
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

