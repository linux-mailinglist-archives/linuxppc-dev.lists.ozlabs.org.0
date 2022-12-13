Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4769464AEF5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 06:03:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWRG50cw5z3c5x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 16:03:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=K7HwGifK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3kgeyywckdlsjsphfsthpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=K7HwGifK;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWRDF5NTfz3bgF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 16:01:33 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id i4-20020a17090332c400b0018f82951826so4458282plr.20
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 21:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuMMy9JhlpVg2nn8+xv0lc+LSPhmKVJUX8QvXqiK4NY=;
        b=K7HwGifKageycgoYMSuL41vFu6ZhGRCcITu74LY4LmX1sc3fl9DJan6HW5X6P//2l1
         lPsMsUSdkbzMOy98nKuXLhVpvkhkz0ngM1GDc+ZgChWBDyukLgh6FZlAVvh7awbKYiE+
         9HO5w2Ds4ekRxhkntFo+py07FVGrwLFO4zdeOF3RB/10oD1X8YaJiKOI2vwKYsyAwO/c
         k/5F8MDpuD2y3hHkC6qiT1hrauEipZws87UgdKj/abWMoUcLVSmd3KBqef7OD7j0ihfK
         6/V8KoxuzLRCjvzza/1yXEJh/vePWiW+Wwk1PJcBF3rzb8giDyJK8tJ+MjNqPLYBSwfl
         Q76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuMMy9JhlpVg2nn8+xv0lc+LSPhmKVJUX8QvXqiK4NY=;
        b=plsRbb1/2QEz8YRurAZoWngH2MMWKJ78snfzI7BSylUUINjcmQWlTbs6p8EArwtz7O
         eRVaaGCUraDnanCFm7dpgsI2Rd+jZHy48X8vW5SD+VJPTKZcYlwTo3Kz58uHh5hnP8hE
         zwXMgKJnSr70SjmQoF5rledVY0fNIu1aDXZr9DOepkMBSLFCwrI3kcGfTPNFVzY67MSH
         2IY9oCKzbjFSZ2FoY+JK4yTQj+a0q694jqvV5MBXFrd0qSby/nUlqUfwB4KOTkwW1Ynw
         vjWJi3deMZgMs+XmHyPb1WcOuJVh1qcoGgfGVzzHwJlEkgcixZgJoQfJbWk4K/9mRhh3
         vZ1w==
X-Gm-Message-State: ANoB5pnjwUa4mRkD3y387eJKEDEGQJpDFgPjAPgNS3YCBg88iPauBdw3
	4Q3EjzCOdq52oTnFiEcymduUHXaBqC77
X-Google-Smtp-Source: AA0mqf5hvvOzFevKbErNXEY+8TZG9ovyRZebB0AcYGaD6tNlLcRATfVWQ68dqrG52wztuEyPBmImvlRNdUIZ
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:6b9f:864c:28da:e99b])
 (user=irogers job=sendgmr) by 2002:aa7:8b4d:0:b0:56c:411f:b699 with SMTP id
 i13-20020aa78b4d000000b0056c411fb699mr77952723pfd.48.1670907690534; Mon, 12
 Dec 2022 21:01:30 -0800 (PST)
Date: Mon, 12 Dec 2022 21:00:35 -0800
In-Reply-To: <20221213050043.1199380-1-irogers@google.com>
Message-Id: <20221213050043.1199380-2-irogers@google.com>
Mime-Version: 1.0
References: <20221213050043.1199380-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Subject: [PATCH v1 1/9] perf jevents metric: Correct Function equality
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
index cc451a265751..1fa3478b9ab0 100644
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
2.39.0.rc1.256.g54fd8350bd-goog

