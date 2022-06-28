Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF52E55C008
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 12:03:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXKsc4j0Jz3fDy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 20:03:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QDaFAZbF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=389c6ygukdjwahranckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QDaFAZbF;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXKnL2tMyz3cgJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 19:59:17 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id z188-20020a2565c5000000b0066c086258ddso9458172ybb.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 02:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Ar0tQaDtQRVxSK1L64O5LGBBBeYgKP9H/0S8vYb7eY0=;
        b=QDaFAZbFppsXaGKVqzfkonMpccyr1cbOroDVbmeHjzV5Y5PKhzNM4NZ4HtvM2w6F5X
         qS3uJLF/cnyo+Y9dbZmY4O4l/xiGaBWPD8yy9soRQ0MVn8obJY7/4CupDFChWXOS0d4M
         g9Z7akfK1xChH19AZzJG+bP+GG6rojDxrnmRwxICTwa939HvKZYiSQWXLQK58qOGEFJ6
         07lg8mVua/7rqrL/A4yl+GSFL7zEk/c1UsOEDsSQgQ5QaXVHZByNl65yUJvgGyM8f5uI
         D49G3Zf6ZhA+eiMN2aMH510qgfvOXQCX3lEL9qzEBWpg1nt8B7Xc+oXqvgghD5d51qlK
         3LPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Ar0tQaDtQRVxSK1L64O5LGBBBeYgKP9H/0S8vYb7eY0=;
        b=GPyorHjwNlMumbevtFFP4mqEFGGbz/2LPE6SJFnoufVXa7tEHB4dOtIllpXPuS/JmU
         mrc4CJg5PA+s/g65slVHiXK55JD0gXpeXXpDzmasrcUgzSof2pu4ju9CxoryRnxTAJ+V
         ELSRzrlZKdPJbSolr7cdYX5whKo8xAxUd0SjmPuNGZW8+eMkkcCHwKz2Yn/1A5UIvqdv
         7dngHa4a4u44qf74juOz23Wac/Mptinb8T9dfh2ZTuZMHwYH0IUy1xSkDao5FYIDmq9D
         ZmYBhW7/5SDGg7KOKtUl2yfyD35pCOZNvoqm0FOnQCNbQhXiBsSi0hp1hEh6v03RivQL
         sg4g==
X-Gm-Message-State: AJIora/t1tLuh4jsBFINQQNWIsfsc8TtGCGDfOSEg2Wz+0kgh9vdBg7Z
	dfIOq5eNjadxACryLPRR3al6OLBdOg==
X-Google-Smtp-Source: AGRyM1tI+zmY9bXD9lPsRaWsu6mvsAtKuZuIuC7/08NiJKMQvXlU/prcjNa4TCejWigh16YxBHUIR7IxOg==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:3496:744e:315a:b41b])
 (user=elver job=sendgmr) by 2002:a81:6603:0:b0:317:8d2f:e255 with SMTP id
 a3-20020a816603000000b003178d2fe255mr20169767ywc.166.1656410355202; Tue, 28
 Jun 2022 02:59:15 -0700 (PDT)
Date: Tue, 28 Jun 2022 11:58:26 +0200
In-Reply-To: <20220628095833.2579903-1-elver@google.com>
Message-Id: <20220628095833.2579903-7-elver@google.com>
Mime-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2 06/13] perf/hw_breakpoint: Make hw_breakpoint_weight() inlinable
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

Due to being a __weak function, hw_breakpoint_weight() will cause the
compiler to always emit a call to it. This generates unnecessarily bad
code (register spills etc.) for no good reason; in fact it appears in
profiles of `perf bench -r 100 breakpoint thread -b 4 -p 128 -t 512`:

    ...
    0.70%  [kernel]       [k] hw_breakpoint_weight
    ...

While a small percentage, no architecture defines its own
hw_breakpoint_weight() nor are there users outside hw_breakpoint.c,
which makes the fact it is currently __weak a poor choice.

Change hw_breakpoint_weight()'s definition to follow a similar protocol
to hw_breakpoint_slots(), such that if <asm/hw_breakpoint.h> defines
hw_breakpoint_weight(), we'll use it instead.

The result is that it is inlined and no longer shows up in profiles.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/hw_breakpoint.h | 1 -
 kernel/events/hw_breakpoint.c | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint.h
index 78dd7035d1e5..9fa3547acd87 100644
--- a/include/linux/hw_breakpoint.h
+++ b/include/linux/hw_breakpoint.h
@@ -79,7 +79,6 @@ extern int dbg_reserve_bp_slot(struct perf_event *bp);
 extern int dbg_release_bp_slot(struct perf_event *bp);
 extern int reserve_bp_slot(struct perf_event *bp);
 extern void release_bp_slot(struct perf_event *bp);
-int hw_breakpoint_weight(struct perf_event *bp);
 int arch_reserve_bp_slot(struct perf_event *bp);
 void arch_release_bp_slot(struct perf_event *bp);
 void arch_unregister_hw_breakpoint(struct perf_event *bp);
diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index a089302ddf59..a124786e3ade 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -124,10 +124,12 @@ static __init int init_breakpoint_slots(void)
 }
 #endif
 
-__weak int hw_breakpoint_weight(struct perf_event *bp)
+#ifndef hw_breakpoint_weight
+static inline int hw_breakpoint_weight(struct perf_event *bp)
 {
 	return 1;
 }
+#endif
 
 static inline enum bp_type_idx find_slot_idx(u64 bp_type)
 {
-- 
2.37.0.rc0.161.g10f37bed90-goog

