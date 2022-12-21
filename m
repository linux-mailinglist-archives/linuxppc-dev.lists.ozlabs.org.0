Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0776538BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 23:36:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcpFb4qX4z3cdD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 09:36:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hWrFQqbU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3_imjywckdmepyvnlyznvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hWrFQqbU;
	dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NcpCg6xtnz3bYB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Dec 2022 09:34:39 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id k2-20020a17090a514200b002198214abdcso3971pjm.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Dec 2022 14:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SSNQl52T6aONyRJU3JLzaiDjv/uDuW/eBBmo/7p1gyM=;
        b=hWrFQqbUjVIgEbk5/HxS/gkX6UYWMxIViM61QrBDErGTC0CBNoIoSRAGz4VBIy+Jr7
         JswhbaKF216kLto8y6J0fNHcsV3xpaxqEJUkJbD+LHzyL6/kkMwmt8zPho3uLPm5a1tU
         7T0VUBlzwmSB8KANwYWZ61vZ432nW1Ri7IIk/cr49jkIDjO4Oxy7NlMPIhaxhInVLxGy
         ltZAVnrt/pg51qXbCr0/25IVChcILeO1bWJ/6ep813uuo6FrGRblDVK16UPmaEFBryDQ
         ofPEuG9v8tmkKCKD09he2BxVBvloOkyTcDODFbe2QSWp7KFy4BP1B8TDzbO7Dja+3Obs
         xBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SSNQl52T6aONyRJU3JLzaiDjv/uDuW/eBBmo/7p1gyM=;
        b=5GuJUKG82olg/zAknvyCG8qWkw54V8CUEUWkh+1vX8Mqa70okc84k2P9NauwQqRRTv
         VYam6DyJwLK9Yj0O1uC/xgFVJXe83JDNmG5w+pPwHopQQh2EbGPpdBKn4/C6GqXFxSB3
         CL9bmDP+9m3pUw/yiDjKw0SsGdhoN0LpDCcZdqfxgQWk1tLJK6sIXbeqWDpmFTd+a2f1
         jTsXKa+lBgGYFDcXqq/SyUsMXilZZ9IjRsEpCz54cZbonrc56Gg+WnEjayvaQADJDhbN
         1urrA1vNFAMmSjIkijPraj9xnG99IuUE+kVzeXbKGQBdFEDXvmU0YnTv9ZDyGVbD+JV2
         1mHQ==
X-Gm-Message-State: AFqh2krEY5+WWC4C2mhv3vCy08zBrWJJ6H+9HotWKVIZlu3xBrY5dLIO
	nuo28C+uz8a1puMQTpWVxuBjZ3F50sJy
X-Google-Smtp-Source: AMrXdXv2jCTZRqgvHNw/zlM6+eqhzbGTGQXu+45bytWBX9fVfz/bcWmBaNU4rA3CFSzsBRM24pb0+K70sXOG
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:62bd:f120:1fd8:1d21])
 (user=irogers job=sendgmr) by 2002:aa7:8ecc:0:b0:57c:ec11:dc0a with SMTP id
 b12-20020aa78ecc000000b0057cec11dc0amr247300pfr.40.1671662076792; Wed, 21 Dec
 2022 14:34:36 -0800 (PST)
Date: Wed, 21 Dec 2022 14:34:12 -0800
In-Reply-To: <20221221223420.2157113-1-irogers@google.com>
Message-Id: <20221221223420.2157113-2-irogers@google.com>
Mime-Version: 1.0
References: <20221221223420.2157113-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Subject: [PATCH v2 1/9] perf jevents metric: Correct Function equality
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

rhs may not be defined, say for source_count, so add a guard.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/metric.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/perf/pmu-events/metric.py b/tools/perf/pmu-events/metric.py
index 4797ed4fd817..2f2fd220e843 100644
--- a/tools/perf/pmu-events/metric.py
+++ b/tools/perf/pmu-events/metric.py
@@ -261,8 +261,10 @@ class Function(Expression):
 
   def Equals(self, other: Expression) -> bool:
     if isinstance(other, Function):
-      return self.fn == other.fn and self.lhs.Equals(
-          other.lhs) and self.rhs.Equals(other.rhs)
+      result = self.fn == other.fn and self.lhs.Equals(other.lhs)
+      if self.rhs:
+        result = result and self.rhs.Equals(other.rhs)
+      return result
     return False
 
 
-- 
2.39.0.314.g84b9a713c41-goog

