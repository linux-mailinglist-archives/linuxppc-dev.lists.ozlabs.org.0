Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 392A067D9B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 00:38:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2xx60VB3z3fDP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 10:38:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=b7HSkW9B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3oq7tywckddaudasqdesaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=b7HSkW9B;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2xv817TXz3fGG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 10:37:07 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id t13-20020a056902018d00b0074747131938so3594963ybh.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 15:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ExyRpkcDLmvPbAA8QgL36/HbLE4lSe5Woy02Q1CnQZ0=;
        b=b7HSkW9BPwilG22qgpz9e/XOczfoW9yCKXfLOvRsQ9wBfqrGhxw2TaKrwXSt1PVsdd
         M84LPosr6r3kuqQWcN/LiSEFmX+TevYFm1LpD7/Li9Wl50Vsaf3LCddQumROgGmGUQQo
         epcbUYKS1qYwHxdY3eYWhKb5WXtHQlyT4DGWMlEDAMRxU6fx9f/ndV3g1nvwZ0EbCP4u
         7PWHk+CStL2Y52640ZelIpaMIrqnKYJMMCSRgY4Yf4cjgJ/FlSpmQMgJ2ek0reIkgHqU
         qVc2P92NXw7JlhdQKxeHJhHhZGm/8MMORkIPhEqswrvqLVXc9MnbKxUzglvGNAe127by
         LbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ExyRpkcDLmvPbAA8QgL36/HbLE4lSe5Woy02Q1CnQZ0=;
        b=0VQ+fUMYJr5vHTB+shHJdGzI1wFCPeic/KY8OR9N/4yLUq2KvaYYALnn9lMlUmj/6a
         NN5cTeSaUMKy8Qv+DaP0HmTlhofEoSfsdxZhVnwc0XcDeqSvFHXiPHnkM1OfcC74CZp8
         LwhRZrGQHauCHZCFZ0R50SwSpHn/OKin9rqmkOJxS0hxTm1l5wB//iKH5Ih/Yc3/mOnO
         V12xaqyoHkEJBXLMIbz04bei8ssfNsiwj7zt064Qgue5IjO7SRPbAi/ta9pHmZMtogxr
         JhiTXNQMfBZzKxZtbC+uVOUpF05YUh/L3zmbdKZeDv5HBSVuXlNWtlK2SVOJNQHg0+B0
         WNmg==
X-Gm-Message-State: AFqh2kpJA8tTfzfOparNZr9KzyNRrzIpnBRBK/RV+1PoaLUcryGNT4a/
	zDCDB6u6HHVCSBITl2UPVrdPHOO9IE0z
X-Google-Smtp-Source: AMrXdXuVZJSXhsLBJF4s+rqkvT9ejKCkIXS7lhPHPbiIAmWd7TUMwVa2Yo0mIGWQgyijPi/6uHMwa59GCZY/
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:b9b8:6de0:39b3:4cf7])
 (user=irogers job=sendgmr) by 2002:a81:ed4:0:b0:4dd:c62f:d65a with SMTP id
 203-20020a810ed4000000b004ddc62fd65amr3419482ywo.427.1674776225629; Thu, 26
 Jan 2023 15:37:05 -0800 (PST)
Date: Thu, 26 Jan 2023 15:36:31 -0800
In-Reply-To: <20230126233645.200509-1-irogers@google.com>
Message-Id: <20230126233645.200509-2-irogers@google.com>
Mime-Version: 1.0
References: <20230126233645.200509-1-irogers@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v5 01/15] perf jevents metric: Correct Function equality
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

