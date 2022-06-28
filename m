Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A8055C005
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 12:01:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXKrD3bqRz3dt1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 20:01:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hlkFl0FC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2a00:1450:4864:20::44a; helo=mail-wr1-x44a.google.com; envelope-from=37dc6ygukdjy4bl4h6ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hlkFl0FC;
	dkim-atps=neutral
Received: from mail-wr1-x44a.google.com (mail-wr1-x44a.google.com [IPv6:2a00:1450:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXKnD6Dfzz3cLy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 19:59:12 +1000 (AEST)
Received: by mail-wr1-x44a.google.com with SMTP id r15-20020adff10f000000b0021bcc217e15so976719wro.19
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 02:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=y3vu5QzrDjJQpXkXaz04N0mmbkIf31DuJdXr7A4d0cQ=;
        b=hlkFl0FCdKnwNSsiVqNE6ojnVcC41EA9ADb/MqxQgZ3EEjpsAS4LfktfOEmNvDPSqZ
         dmZmNXOzU2+LIZqyTaIxsel1lUyb55hWHXt+2renOHmO5qRZpKboceuta65c3TzCFQRF
         gg8arSOmwM0ZRg/YNEuCoz5CW6zOQWqHLih5nBqYprm7RMvlXFDADlerTNC/Itre6IZ+
         QYUjtbRdmIwlqVE5SAafUw2uWeUzizcgWWykwJCTqbjw64KNdurRIlwIMQLwVcH6qCCk
         /i7Syrf4oeLqxTPIJvKcbG0q+XbjNGtSbpoZrm4DT1tuFxr1A6JnO4kEKM7C3F7Qgk8c
         vvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=y3vu5QzrDjJQpXkXaz04N0mmbkIf31DuJdXr7A4d0cQ=;
        b=VpH159yzoyJpklKFwmpI6I6XlibzXHl4Ks3gMFFlPvJlvKjKTy62u4U/WOm/ATYSnz
         QA4kYe+YYDxb3SShQC/ej6ABlrRst3VwNCAR2oPDyZS1w4w8IFuM/oDV3bmD22x0mnfN
         /qRjPqMstpLHk9W6pQk1Fs59pe49zP2n3FLJ7CtTStfapg/9FNNIZ8WFzqZvsupmD/ta
         cnQwNvGJho1F4xAxZbDK3fEo0OuGyc1XcoRYmIrbThaNYvnOt2P/0f6ef4qK0Wc4de0J
         7tZQYS/VvzMfMxGjtRwFrtR608w5TJXcRhwV7/pA2bJ8Fu76WJrpRmq3RbLeL+HgC3np
         QE9g==
X-Gm-Message-State: AJIora/dN5aYde88u/oZe00XFtsYeWyQqL8W+/UdP9ySoQOmV+kF+joR
	tzTwFtdwB1zPtyPqSR9f5sL9oRjbPw==
X-Google-Smtp-Source: AGRyM1sLXTcWzlDsYcztP6jIu7/NWN9CWyyELGCAm2BsUsBrvTjQx5jRDWtXYnCL+4E+uAB2Gm9w1LqV1A==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:3496:744e:315a:b41b])
 (user=elver job=sendgmr) by 2002:a5d:4c8a:0:b0:21b:9f3a:c002 with SMTP id
 z10-20020a5d4c8a000000b0021b9f3ac002mr16723653wrs.182.1656410349259; Tue, 28
 Jun 2022 02:59:09 -0700 (PDT)
Date: Tue, 28 Jun 2022 11:58:24 +0200
In-Reply-To: <20220628095833.2579903-1-elver@google.com>
Message-Id: <20220628095833.2579903-5-elver@google.com>
Mime-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2 04/13] perf/hw_breakpoint: Mark data __ro_after_init
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
index add1b9c59631..270be965f829 100644
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
@@ -710,7 +710,7 @@ int __init init_hw_breakpoint(void)
 	if (ret)
 		goto err;
 
-	constraints_initialized = 1;
+	constraints_initialized = true;
 
 	perf_pmu_register(&perf_breakpoint, "breakpoint", PERF_TYPE_BREAKPOINT);
 
-- 
2.37.0.rc0.161.g10f37bed90-goog

