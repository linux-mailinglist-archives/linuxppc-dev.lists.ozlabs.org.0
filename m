Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF0B5A4C75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 14:52:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGVhm0n97z3c3L
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 22:52:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Oei65SiB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2a00:1450:4864:20::549; helo=mail-ed1-x549.google.com; envelope-from=3kbumywukde4u1bu7w44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Oei65SiB;
	dkim-atps=neutral
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGVbm4s1Pz3c4x
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 22:48:20 +1000 (AEST)
Received: by mail-ed1-x549.google.com with SMTP id c14-20020a05640227ce00b0043e5df12e2cso5420467ede.15
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 05:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=T2C4sxYRs2lEzCnHUaLRTNKBKI12YQqfPe+dPUrodjM=;
        b=Oei65SiBeyseuj2GkCMZu6UkQDXfMukCs8q/ts7docSju1x50Wnuyo56PNgsA6HyKh
         QIN3iALVpE4KtqSJCJw7xhEOCvdF6Nj4aaQRdldUGReSHeSUPlQtPNrfZMshM9WmIh7D
         F66kQer8IfUfc0aZZBJKqF2p8mQNUtHZduPcpyzmcjmfTP8IAtSfvKheWIe8pbsuF80V
         n6JT0dTHHJGAeqPEaae41JTQVmfHG3xrkJcxGeiFu5iSEmPx+AxR8pfqXZMWkWBblTqj
         qwkITtO1N1SMp71IBMV7uOhDi/g7bC6iP/ZkN9sylaZYO6ap321AAv0sJxlYpg70So+Z
         I9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=T2C4sxYRs2lEzCnHUaLRTNKBKI12YQqfPe+dPUrodjM=;
        b=cO//VuWk8WgfUu8zfmLzpuVDVUV7P7E+8k57C1ctf2BU5fNvZ1Udg3SzeivBPzqN6J
         6LraC3WA0jE6CQP+el6jyz6XP68Q46QWRpN2l/CpFVcW2eiIdnklDNpNF2nKKZXc5bgv
         87De/TpRD5JiBWGOuwTrAMIIrD4QDWVjQFlDyuvZg5zmwqD4CkX8LUsJe8vk94jq7Bis
         3FjWmkjRHn0U57OY7jdDhnOisOLiSFHxG5Y+w665H4Qe1v+akCEKWzdlcN8Xn9AkcLMc
         PxdfkqgnJ7Bv9vUJ1Tk4sKG2lxnoIaMDZlzT+mt8eGN+7QOi1EjN20pKetN8ZGhA8AeX
         T8FA==
X-Gm-Message-State: ACgBeo0OujgyDdIhJ5p0HYzsX0zyucfjkt9PBICD1nW68nX27WstF/Ja
	yR8KvLORNqo9iOw7PSBX/oAchVuPmw==
X-Google-Smtp-Source: AA6agR7pPBxBn4gZSDR06aP3DtZ7Ndp+4q6FXFUDOBECLllaiRHkqTE+4IlfvAW4YcpDEfo5TzfTEk2i4g==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:196d:4fc7:fa9c:62e3])
 (user=elver job=sendgmr) by 2002:a17:907:3f97:b0:741:84b4:8356 with SMTP id
 hr23-20020a1709073f9700b0074184b48356mr3916826ejc.148.1661777297695; Mon, 29
 Aug 2022 05:48:17 -0700 (PDT)
Date: Mon, 29 Aug 2022 14:47:12 +0200
In-Reply-To: <20220829124719.675715-1-elver@google.com>
Mime-Version: 1.0
References: <20220829124719.675715-1-elver@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829124719.675715-8-elver@google.com>
Subject: [PATCH v4 07/14] perf/hw_breakpoint: Make hw_breakpoint_weight() inlinable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, linux-sh@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Dmitry Vyukov <dvyukov@google.com>
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
Acked-by: Ian Rogers <irogers@google.com>
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
2.37.2.672.g94769d06f0-goog

