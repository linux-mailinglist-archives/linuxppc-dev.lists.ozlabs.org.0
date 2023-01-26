Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D6D67D9F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 00:50:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2yB248jBz3ff7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 10:50:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pN++yaxh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3-q7tywckdigu30sq34s00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pN++yaxh;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2xwq2nGFz3fKk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 10:38:35 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-482d3bf0266so37446667b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 15:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xTYdmI9og0perxBFMnwOyD8JALYBo9fFqhvIGnAB7iw=;
        b=pN++yaxhHw5hsqtHgPMZeHJr1T+f83UqE4aoFtt5+LAeg4UHQo6kEIwVfN/W5KzpWd
         NAKHo1zdw7heZJbx1WfqGp1S+SxrOx8iQQEmdAlVDg2VTtwzUZXBX9I4nN6s/ySTc+jr
         3ZaRTEU2LdtjdBqC28mfYKA3RWWRWiipp0ubURRbSnB2td+dOXW6A6Z1YmXTTTs7lrMt
         kSSpO1HdzzSc0Io1imdV8ICez2HaQFT3vzJjPfo5xcK7Rc2m+quLXQ9DiPdQKhFDh9i9
         7D6enP4ZWLDUdi03ANNOdVpbRaEKQA7hGat0dQrO/F54JVVNV8CR5DwopbFxCgwL+Ylt
         8iEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xTYdmI9og0perxBFMnwOyD8JALYBo9fFqhvIGnAB7iw=;
        b=bNhfcEyoY5SgO4paOVnv5J7rCYRjHi86+kQDSk/Ku/wR878W+xAZ2JrZNfyJuhWeBm
         qrxet8nXZs4qMcMBLxBcrPVFzT/umEKLyit5E2tbRBLPQsgLE6SNYig1YobgfLwqb638
         aYh5areecAJ3QBsRhl+gQRui5NxPkZm7aycrncXxchR3qqwdFQCPWjd1dRkjGB5vjr1u
         twB3EQbgAJ8OP8JcGdCo8OHtRgMYWBYDRMtTYV1A5f6uVMrILJQyqXDmXSpWecNqXNpz
         BoKlCTXKPXX0dCOvOtSXcH/xFvFuHB5vT3Xyos+W+iWTxw/AGw6pd9koJS2vQ5gDwNOi
         kM4A==
X-Gm-Message-State: AO0yUKUdmH7w9W3ofgxQ6OGV724KORbciL1BEJeou1WRce5pOcO5gD9w
	TJU3wz9l0GOC4svygi79ZEDEIX/atp0L
X-Google-Smtp-Source: AK7set8ogChtzu8dxXsUiUpTxkmy4XJKX0fEnPVUFfp8yLVVlaZbFvMbbtXJs9Lil32EN+jbOQsVkSj+abRi
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:b9b8:6de0:39b3:4cf7])
 (user=irogers job=sendgmr) by 2002:a25:ce90:0:b0:80b:6168:a831 with SMTP id
 x138-20020a25ce90000000b0080b6168a831mr1670207ybe.408.1674776313147; Thu, 26
 Jan 2023 15:38:33 -0800 (PST)
Date: Thu, 26 Jan 2023 15:36:43 -0800
In-Reply-To: <20230126233645.200509-1-irogers@google.com>
Message-Id: <20230126233645.200509-14-irogers@google.com>
Mime-Version: 1.0
References: <20230126233645.200509-1-irogers@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v5 13/15] perf jevents: Correct bad character encoding
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

A character encoding issue added a "3D" character that breaks the
metrics test.

Fixes: 40769665b63d ("perf jevents: Parse metrics during conversion")
---
 tools/perf/pmu-events/metric_test.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/pmu-events/metric_test.py b/tools/perf/pmu-events/metric_test.py
index ced5998bd827..e4c792428277 100644
--- a/tools/perf/pmu-events/metric_test.py
+++ b/tools/perf/pmu-events/metric_test.py
@@ -89,8 +89,8 @@ class TestMetricExpressions(unittest.TestCase):
     after = r'min((a + b if c > 1 else c + d), e + f)'
     self.assertEqual(ParsePerfJson(before).ToPerfJson(), after)
 
-    before =3D r'a if b else c if d else e'
-    after =3D r'(a if b else (c if d else e))'
+    before = r'a if b else c if d else e'
+    after = r'(a if b else (c if d else e))'
     self.assertEqual(ParsePerfJson(before).ToPerfJson(), after)
 
   def test_ToPython(self):
-- 
2.39.1.456.gfc5497dd1b-goog

