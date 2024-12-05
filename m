Return-Path: <linuxppc-dev+bounces-3810-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1969E4C39
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 03:23:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3dTy26Vkz2xst;
	Thu,  5 Dec 2024 13:23:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733365398;
	cv=none; b=TVhXw07ClxExRrhs2/W5otM5Vcil42oyEbyZbuSJik0W8zoACe1UeeImqtqXhf9RpIUS68cfShx+H5SbW2DQnx3Q3ycXvYHbgD11XCK2eMUFfS8sALhG2w1KETf17unGFcXfEI0TbePC/4oytEygllgtA/U908dQTorsIm++Q5zoQo9YSbvjo/Ved0NGymz/MVmQKU4yfFxfZhQ1RgbTRFWI9p1s4ZfQsdK5KKr2Gd1USG6io7CacBIEIALpztbaAYY+FwIJ92kC/o/UAL/jM0dA6YnO570Hpc/mFsCQ9Tu3/R/zCCbXiVW28Lu1ayWBpotngssY/Vv2VYkhgsW+Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733365398; c=relaxed/relaxed;
	bh=Jcq8s/qJvxHm0kGrnwNvGixVnYCeqYmFdkAzf/e/ncg=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Content-Type; b=Q0fwQalkTa87Ljo0tBcT1GIKvfRmtMJf1MgQFuA9Od86/1gyvefN0upth4UgtVYQPy3AsQzhygQKQv+dHS2R9BQP5CCBjx5osj/Fn8WLPhvrPe1ctTaWZ5tZt3At6raZ153SD+V9YyKr+3m5GOW3MiB/s0kJYFwfulW3STbfyH7iE/YPUFdBwmSWtNZDiuuuQlHh6DoSU9DyszEDAbhejiWK+ZAZOIdlMGOMsrfse9l0q1ZR9S3P/eALtU9FtyIVCECXmhtLABjqptG7ywKjv0NrPk4lJO/mu3WN9ui5r5v50CmvMZaRyAh2O8hCjEjEYP7Zbgs2010/CJU7+UyCcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pzQn8TfK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3jg5rzwckddevebtreftbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--irogers.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pzQn8TfK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3jg5rzwckddevebtreftbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--irogers.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3dTw5Bkrz2xps
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 13:23:15 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6ef7c87c1a5so16156227b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Dec 2024 18:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733365391; x=1733970191; darn=lists.ozlabs.org;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jcq8s/qJvxHm0kGrnwNvGixVnYCeqYmFdkAzf/e/ncg=;
        b=pzQn8TfKOvFsPxqMSyZVm1Lmf7AWY/ZK9pScTR5kV0UAYX0FRR5d/320el4DiKPOrB
         gmiR88SQIKuJthYyKAyjb/E6ERVT/gjlFc4HJe3yziGB+KlFuxUgB/ZjdNmvjQxdT0Y6
         3LU7ZlVG0cW9dqtpUTqrl08a+ly8a/MPaIrLV8ZkEgK2pNypq7kFtcEE57b8utIO1WzS
         FXb4YeE7OyAQqU4enJw7Y9m2PRq8vPu5V0l3rl2xQmJ86cPBaYJzS1ZNpjC3z69QRiHj
         WFeBzkbAL5FWf2ncKB2NYfo2xi8QoMHWjojCBDw6mpEuoexQtA9smAR08pk6xk23sUPg
         on6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733365391; x=1733970191;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jcq8s/qJvxHm0kGrnwNvGixVnYCeqYmFdkAzf/e/ncg=;
        b=Kk9LDqgRsce0Esmd67rsEQyNJqGOb94Plwss0sgMLMfpR8Km5hj0yVseNGJfixgWHj
         WoLNs30fyB7i1HPXiLlynRbXXpxeIjkXp2NGNFiduwwXpxfvfmpIXWkdGAOxDmxcrmU9
         OgWrrn8YM3jR7VzPJHwJDawn79O8s0lMDuSe7gGcWnVQmzGspN8j5Ze6S30MLNELxIi8
         rskecwiXdclzXMUShVLC2WaK7VETXH9piAoN3LM01Vwk//uTLcYIriukJVNMl6WwFCW7
         w6U3AIMHBGMdoj1MPFGL0pspfL+sz3fsgISVlvAUIbRgfgy7tGVC+VcTS2ISr9M6WGas
         ES8g==
X-Forwarded-Encrypted: i=1; AJvYcCXzOx1Dcre3CXWdqotqw4vrxcdE9ZkeEbUM0kV1DFm42p9+Mjifd1Uy0lSuiy+91/LkiYqcC7Gq0/KWlqg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzfMz7KEGO1lAn1KrVr9oM2Y9ioQpVsE40qUBjEuXZNrsyh3E+w
	iyzAlsoMSzCewW6b2R4wgGMjVKVytDEH/RyJXDGNENHYBgwGbjtneIY2Yoh9FkIvbKtWlY1pqmh
	SJ8o5Rw==
X-Google-Smtp-Source: AGHT+IEiDc6wp/vOXpk+5qGCYbvmQ6wGcBzRlLrmQKrhyAXvCyjL7Lbc+BIS2p/Piw0LSEa9N89HM31ntAR1
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8733:728b:3b2b:932])
 (user=irogers job=sendgmr) by 2002:a25:aa6c:0:b0:e38:81f0:8c23 with SMTP id
 3f1490d57ef6-e39f2459342mr2847276.6.1733365390932; Wed, 04 Dec 2024 18:23:10
 -0800 (PST)
Date: Wed,  4 Dec 2024 18:23:05 -0800
Message-Id: <20241205022305.158202-1-irogers@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Subject: [PATCH v1] perf test expr: Fix system_tsc_freq for only x86
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com, maddy@linux.ibm.com, 
	atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, 
	hbathini@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The refactoring of tool PMU events to have a PMU then adding the expr
literals to the tool PMU made it so that the literal system_tsc_freq
was only supported on x86. Update the test expectations to match -
namely the parsing is x86 specific and only yields a non-zero value on
Intel.

Fixes: 609aa2667f67 ("perf tool_pmu: Switch to standard pmu functions and json descriptions")
Reported-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Closes: https://lore.kernel.org/linux-perf-users/20241022140156.98854-1-atrajeev@linux.vnet.ibm.com/
Co-developed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/expr.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
index 41ff1affdfcd..726cf8d4da28 100644
--- a/tools/perf/tests/expr.c
+++ b/tools/perf/tests/expr.c
@@ -75,14 +75,12 @@ static int test__expr(struct test_suite *t __maybe_unused, int subtest __maybe_u
 	double val, num_cpus_online, num_cpus, num_cores, num_dies, num_packages;
 	int ret;
 	struct expr_parse_ctx *ctx;
-	bool is_intel = false;
 	char strcmp_cpuid_buf[256];
 	struct perf_cpu cpu = {-1};
 	char *cpuid = get_cpuid_allow_env_override(cpu);
 	char *escaped_cpuid1, *escaped_cpuid2;
 
 	TEST_ASSERT_VAL("get_cpuid", cpuid);
-	is_intel = strstr(cpuid, "Intel") != NULL;
 
 	TEST_ASSERT_EQUAL("ids_union", test_ids_union(), 0);
 
@@ -245,12 +243,19 @@ static int test__expr(struct test_suite *t __maybe_unused, int subtest __maybe_u
 	if (num_dies) // Some platforms do not have CPU die support, for example s390
 		TEST_ASSERT_VAL("#num_dies >= #num_packages", num_dies >= num_packages);
 
-	TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, "#system_tsc_freq") == 0);
-	if (is_intel)
-		TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
-	else
-		TEST_ASSERT_VAL("#system_tsc_freq == 0", fpclassify(val) == FP_ZERO);
 
+	if (expr__parse(&val, ctx, "#system_tsc_freq") == 0) {
+		bool is_intel = strstr(cpuid, "Intel") != NULL;
+
+		if (is_intel)
+			TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
+		else
+			TEST_ASSERT_VAL("#system_tsc_freq == 0", fpclassify(val) == FP_ZERO);
+	} else {
+#if defined(__i386__) || defined(__x86_64__)
+		TEST_ASSERT_VAL("#system_tsc_freq unsupported", 0);
+#endif
+	}
 	/*
 	 * Source count returns the number of events aggregating in a leader
 	 * event including the leader. Check parsing yields an id.
-- 
2.47.0.338.g60cca15819-goog


