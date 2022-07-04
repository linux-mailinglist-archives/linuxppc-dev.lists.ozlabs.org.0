Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38974565971
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 17:09:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc8NS11G1z3f7C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 01:09:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=o4x3EbC/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=34qhdygukda4sz9s5u22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=o4x3EbC/;
	dkim-atps=neutral
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc8Jj2X58z3btW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 01:06:13 +1000 (AEST)
Received: by mail-wm1-x349.google.com with SMTP id az35-20020a05600c602300b003a1867d09b5so3258646wmb.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jul 2022 08:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=mWoq8j7y43ZVuqvviGPucxALD5XppzdZ4sJTYXDQo5I=;
        b=o4x3EbC/WAMFSmZyAzqqhwT+64uLX2fQw1Za1JHbjGeLpl9EgocgpuxhCPwG5hBzx1
         2QRLsPA/B2Xwl2elPFL5fiKctWvCDba3AYkvDgIvHHXQ4Dv89PBxneEJN5lCr7u2PJyg
         D3HCwrGwVa93+LaNNU0WxUbUfgEBQzxaWSKWj3qVtM2RVP0LD8CnC/B2GiHRK03A36UP
         gFjrt0HcwWZrBpqDMtWotwxwsiY/j9M0ytl6MoTuuuzma087NAbWH5QjOSfKtA2kaLPs
         TNz5C+HGwJxtOmizKAxCxdLI8LUymzEvIqkYP7AMYke92ZW7S6jNGjd27Hml4yQiN5GV
         sAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=mWoq8j7y43ZVuqvviGPucxALD5XppzdZ4sJTYXDQo5I=;
        b=3dp3pOWJTlWhSOO7gEj/rkR5QtjyV59Q+JIhqV8NEV2Kznkj0+A2f6Q/9zou1dmef/
         6aLEM3fQijNOLj9aTaAYqyEaUYDdJoKvMBKY2xyCYsU0Fb9ertFp9Pz3G6O6wZOcTpER
         YPhcNM3WtttOyKpPu3LMa6cv+RdLbUIcprg16JEysC11X2tJIyHaw/4a+kzJLDBg0M3M
         YxU/DdxaoGmfIPEHh//LeR4CGcSWHIHOaiIJ9VzTE7QfOc8eJg8dWA8Z3usskCZNWyAP
         yAcnqOs57RYyOd3tP2zXinZwodI1SAZALlNwGGRBtrGlSGPwkXeUSiKuY47QvC7+E9c2
         uV1Q==
X-Gm-Message-State: AJIora+VrI3ztn/FXtBsis3Pe8kXV1Du8dQX4zTPdOzvMw7mLVHoxn59
	AXqC0dxOTs9xr+QtLGeuQf0YOGyp5w==
X-Google-Smtp-Source: AGRyM1tcdZ9jN6MWKmmKZRKv/z//DHI4PTni9uMfGZdA/k4tObVoHQhXgYZke3bw6qoxPycrNOI32MK5SA==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:6edf:e1bc:9a92:4ad0])
 (user=elver job=sendgmr) by 2002:a5d:47aa:0:b0:21b:ad9a:d48c with SMTP id
 10-20020a5d47aa000000b0021bad9ad48cmr29662846wrb.610.1656947169805; Mon, 04
 Jul 2022 08:06:09 -0700 (PDT)
Date: Mon,  4 Jul 2022 17:05:05 +0200
In-Reply-To: <20220704150514.48816-1-elver@google.com>
Message-Id: <20220704150514.48816-6-elver@google.com>
Mime-Version: 1.0
References: <20220704150514.48816-1-elver@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v3 05/14] perf/hw_breakpoint: Mark data __ro_after_init
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mark read-only data after initialization as __ro_after_init.

While we are here, turn 'constraints_initialized' into a bool.

Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
---
 kernel/events/hw_breakpoint.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index 6d09edc80d19..7df46b276452 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -46,7 +46,7 @@ struct bp_cpuinfo {
 };
 
 static DEFINE_PER_CPU(struct bp_cpuinfo, bp_cpuinfo[TYPE_MAX]);
-static int nr_slots[TYPE_MAX];
+static int nr_slots[TYPE_MAX] __ro_after_init;
 
 static struct bp_cpuinfo *get_bp_info(int cpu, enum bp_type_idx type)
 {
@@ -62,7 +62,7 @@ static const struct rhashtable_params task_bps_ht_params = {
 	.automatic_shrinking = true,
 };
 
-static int constraints_initialized;
+static bool constraints_initialized __ro_after_init;
 
 /* Gather the number of total pinned and un-pinned bp in a cpuset */
 struct bp_busy_slots {
@@ -739,7 +739,7 @@ int __init init_hw_breakpoint(void)
 	if (ret)
 		goto err;
 
-	constraints_initialized = 1;
+	constraints_initialized = true;
 
 	perf_pmu_register(&perf_breakpoint, "breakpoint", PERF_TYPE_BREAKPOINT);
 
-- 
2.37.0.rc0.161.g10f37bed90-goog

