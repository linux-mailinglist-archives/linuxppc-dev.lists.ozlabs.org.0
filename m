Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 897FA67C245
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 02:20:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2NFH2VgTz3cgR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 12:20:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OuJQEMGc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3etxrywckdcknwtljwxlttlqj.htrqnszcuuh-ijaqnxyx.teqfgx.twl@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OuJQEMGc;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2NCT0ncdz3cgm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 12:19:16 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-4bdeb1bbeafso4026517b3.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 17:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+u1pVwNx8YIp+mc14zUC+ZcmzjCMVQKlou80yZYqsbw=;
        b=OuJQEMGcjCRTQw5UQ1ZQzjv+z2xhVN1lULZdKwin2IH1/QyPC8VIC1Gg3jqImYyW9c
         R8pR8BxKGestrduQkLk3Iht5Xu3z3ZLvfCNomo1mwvWlN+F/Q6M42RsmyMDVGr1/LXQV
         ybsazzJchbK3NRH1IEx2ErPDiktwoCEIhz3Yco3W1UWbFNzbPyIIeC7wCwUDfjTeCejA
         Nz/EUS7q/DrycNausmVoWMJqsc1yb40KBpyApgEP62+M+iZ9GHgG0aWHwDVYPVtsjZ+C
         oxQ5DBv+lx3Jmm+Zh9OS9ln1af2XHtfAE7QlBnJn39mDcV5SpdE3WdLS9z7KGUCNv47v
         Oauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+u1pVwNx8YIp+mc14zUC+ZcmzjCMVQKlou80yZYqsbw=;
        b=oYZihAjytH5WHy3x4WE3Kcy9fZRjs+euTd5dhBdnkBpqboogheLKk2tMVUKja5Qs3X
         vxfLbCcuk26aht4WAF3RuUU/0ebNCsDsCwZ0s1lO9GD1lmbCOgK7Mtc7Y0xy82XFnh9L
         O5QKcLDie7a53/DAfAICXZEYwOHHc+SO/Hw5RkhEhTiSWrozhZuJzHyDhWjaTbO089US
         iAuwm3d/PoqQze4+Z3x8mZrI+dWE64dEkyZblQ8KXMvhRj0tc4L6/C4mbgBuMhg5zE/B
         XQQFo7iIAlVmN3hmYUmn709wow66UHdZ9v5RBL7ib87mO/NK2aYkiH4Zb8OZYXekU2AA
         LrDw==
X-Gm-Message-State: AO0yUKUU/fwHCjTJq7vPH+OzWFGvyNdUSCf6kx8A1epzoWdHTJZVQj34
	RwMnB0hEuCl0IrwXxP+VUQP+MO5ptbQQ
X-Google-Smtp-Source: AK7set9Jn0idMZk3grwkylaxn390n+wWJqHqiG9FwwDRdG90HD+eREktCgKloDte62f3k3u8VVMiomHck39J
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:568d:4d98:b468:b025])
 (user=irogers job=sendgmr) by 2002:a0d:f304:0:b0:508:3e6d:8ac1 with SMTP id
 c4-20020a0df304000000b005083e6d8ac1mr127538ywf.207.1674695954541; Wed, 25 Jan
 2023 17:19:14 -0800 (PST)
Date: Wed, 25 Jan 2023 17:18:43 -0800
In-Reply-To: <20230126011854.198243-1-irogers@google.com>
Message-Id: <20230126011854.198243-2-irogers@google.com>
Mime-Version: 1.0
References: <20230126011854.198243-1-irogers@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v4 01/12] perf jevents metric: Correct Function equality
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

Reviewed-by: Kajol Jain<kjain@linux.ibm.com>
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
2.39.1.456.gfc5497dd1b-goog

