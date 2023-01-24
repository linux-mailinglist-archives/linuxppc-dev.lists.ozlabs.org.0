Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF59867910B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 07:35:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1HJz5j30z3cdf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 17:35:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Hq3ZVOfW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3w3vpywckdb4clia8lmaiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Hq3ZVOfW;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1HH94lRHz3c9Q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 17:33:41 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id a14-20020a5b0ace000000b007bf99065fcbso15309345ybr.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 22:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hrci0aclnx4SG+PNpXqw0jPdCljnIUPBJgDYHtxS7o0=;
        b=Hq3ZVOfWgQqRxIWOB+4FxzvfjRtmy1GopQXMkZsA+8+YeJ4Kyn9Q2gtCQyXTsDrqSA
         GDlfFRdm9ok8WRhvj7gZXRmLB2QS21ITqQCXHZd+DRlzxXHEF3oIupQ+Zi31Hx7hTcgP
         s+cEiozK6W2l20afcqO/w9AFEFT+t0fM3XuR2PURu1RpwCbUqe/hzjWRkN3cpxH6pHq4
         45/mp5qA9LnQrQNZGSH6joiDY2pmW/0U/qIiqM7m5CU4W/pzWRQx5KHHzxxYS9pAnvsH
         ugUG1ti08N9rx/um64P55QJ5chI/hwwrRDeIA6hZVKYy+7uM0D2WKbeJxU5NXP7jaN0u
         RwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hrci0aclnx4SG+PNpXqw0jPdCljnIUPBJgDYHtxS7o0=;
        b=I8WucUF2fSAZJXSiYJyLX5D/eS2QigyPcWOt8+dGsfHTDm4N9hOXGsGFzqxQW7UWRN
         7xDVguYPEtcDNEMTTD1EeWDZ/Wskr7myEBZRMAUqz2UylLDUc02kqIz0Ecb0hW6XaMyp
         xKxBgOwgKdJWDpw0Y89kq/Nn2oQz5Cr7jDWY0l4/SiWFSM79y81gofHyHQ1ESaaEapQH
         9fZhgpM7IYpQU7y9pDY83/TvlKX6Lui1aXMUxAxNZ3vzh0taMMLI6xwX0NmML3+hqu9O
         GKhkMPYUtMVTLahpaFtAYY8MO7uJLDrVVkkITucV7a4CPduzwa+9hkjBv7ElO28HL9mI
         mCnA==
X-Gm-Message-State: AFqh2kpP6i/05VsvWsdKi35dd3pxPhSFDlpgSlWB6nkx0H4OqQhr1vuH
	qwoDoXs0+bvlg88ZZqSw9AESiPspAm0P
X-Google-Smtp-Source: AMrXdXu/x9zI4gILr9Z+vr39HcNqbhqNUx4RCSSwOXbXohCgJM662wC7GgX3/GUniaakconhQSEM2n5yKhzP
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:460d:1b4a:acb8:ae9a])
 (user=irogers job=sendgmr) by 2002:a0d:fe03:0:b0:470:533:cb89 with SMTP id
 o3-20020a0dfe03000000b004700533cb89mr3590620ywf.81.1674542019513; Mon, 23 Jan
 2023 22:33:39 -0800 (PST)
Date: Mon, 23 Jan 2023 22:33:10 -0800
In-Reply-To: <20230124063320.668917-1-irogers@google.com>
Message-Id: <20230124063320.668917-2-irogers@google.com>
Mime-Version: 1.0
References: <20230124063320.668917-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Subject: [PATCH v3 01/11] perf jevents metric: Correct Function equality
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
2.39.0.246.g2a6d74b583-goog

