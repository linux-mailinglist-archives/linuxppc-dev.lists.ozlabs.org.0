Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B5A565982
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 17:10:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc8Pr70Jcz3dQN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 01:10:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QbMgulhI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2a00:1450:4864:20::54a; helo=mail-ed1-x54a.google.com; envelope-from=35whdygukdbqy5fyb08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QbMgulhI;
	dkim-atps=neutral
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc8Jp2Y5nz3bxH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 01:06:18 +1000 (AEST)
Received: by mail-ed1-x54a.google.com with SMTP id r12-20020a05640251cc00b00435afb01d7fso7349714edd.18
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jul 2022 08:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=1aXAa75QFld8JbpbPPEthMJig82bhovg/Ry5+b6na1M=;
        b=QbMgulhIjFHZOKr5YUDv8X5y5GYgyld0Dc3IFnyu3IQSon/TLP4ioIa3f89U8smZwo
         U+WA93et7dQm/OMnt016E80SrrPFeQBKr7TT8q/bG/+pIobmaX9cV85MGeJbgfwiPq1b
         Ava89xEesjG1OvK8d5HhEqp6Dk3T9DeQmZyzZkzFWENmRt6DEyJf1XZ/EdlOu86I7EvX
         atAyCVgS3XzUh3vzK3iLPDIDyYfir4UE8EUj4i/7Gr8GaAqkFojlXvkAl6EOkbu8sGt2
         N+bA+TrhJ8zM0Ge7Q8+mtkxw4fiHMoiDRKfXJ/9ftoItH4d7yqJ4645bBLJu9qa0u2ti
         D/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=1aXAa75QFld8JbpbPPEthMJig82bhovg/Ry5+b6na1M=;
        b=Wxl39SFUICm++e9XV0qMoRLgfp7B5XJECRUVLJtXV12hb7NbJb+cdl7YfAu2WZqZLg
         ISCPIfaHbm2GF8XrP8pQNSxSkgUMtKSaphT0mMQHujb7q5WprDf8P1dpSj9MTJa4qEBN
         QA4WtB9/G6OvBh5fD7cEv9CsO3mCTeJP5+gFgNjiig/m5dPrTbMsB2clAXB3VBlU374C
         kosJdOpeMquKZ3GTE5XVuqex216EZxDZNn/PAICGDiFmWE/UQX4vyA/4ecia0O+MulWi
         Zbige1WdEXcURflVkzuuSl38HYE0X/rRgha3VMHAJc+F6dWQ5BI9UYbBSP4atRzF1yl2
         tndA==
X-Gm-Message-State: AJIora/NElbDIogpXFI7Lz9z2O2OihtdIr+nqDmlh+gt7T67lL0h5ItR
	/IcQonigp9cOs9zL7uT3n59Zk6UDIg==
X-Google-Smtp-Source: AGRyM1tnS2+/lSiOrADgLXm9+tmDXyuUPdB8J41yHrIo69EYrjqFBse/Y2ng0gs6mRRVIL7V2CbZUYdG9w==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:6edf:e1bc:9a92:4ad0])
 (user=elver job=sendgmr) by 2002:a17:906:74d6:b0:722:e521:7343 with SMTP id
 z22-20020a17090674d600b00722e5217343mr28873376ejl.432.1656947175193; Mon, 04
 Jul 2022 08:06:15 -0700 (PDT)
Date: Mon,  4 Jul 2022 17:05:07 +0200
In-Reply-To: <20220704150514.48816-1-elver@google.com>
Message-Id: <20220704150514.48816-8-elver@google.com>
Mime-Version: 1.0
References: <20220704150514.48816-1-elver@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v3 07/14] perf/hw_breakpoint: Make hw_breakpoint_weight() inlinable
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
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
---
 include/linux/hw_breakpoint.h | 1 -
 kernel/events/hw_breakpoint.c | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint.h
index a3fb846705eb..f319bd26b030 100644
--- a/include/linux/hw_breakpoint.h
+++ b/include/linux/hw_breakpoint.h
@@ -80,7 +80,6 @@ extern int dbg_reserve_bp_slot(struct perf_event *bp);
 extern int dbg_release_bp_slot(struct perf_event *bp);
 extern int reserve_bp_slot(struct perf_event *bp);
 extern void release_bp_slot(struct perf_event *bp);
-int hw_breakpoint_weight(struct perf_event *bp);
 int arch_reserve_bp_slot(struct perf_event *bp);
 void arch_release_bp_slot(struct perf_event *bp);
 void arch_unregister_hw_breakpoint(struct perf_event *bp);
diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index 9fb66d358d81..9c9bf17666a5 100644
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

