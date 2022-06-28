Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD4055C003
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 12:00:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXKpw6Zczz3dpL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 20:00:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RQpMHh1m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2a00:1450:4864:20::549; helo=mail-ed1-x549.google.com; envelope-from=359c6ygukdjay5fyb08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RQpMHh1m;
	dkim-atps=neutral
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXKn66xzGz3bm7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 19:59:06 +1000 (AEST)
Received: by mail-ed1-x549.google.com with SMTP id h4-20020a056402280400b00435abcf8f2dso9197868ede.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 02:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=+Sjjp8jJ7/w0ICOZmYCWvjg7GfEBySyn/+1KfIaOHFY=;
        b=RQpMHh1moTKaRIBjxXnduRTRj1+XOs4vQaRansot4504YpMW6JzxCakSHA0ZB4Cbth
         8fE7QYR5gdwuuaesCuj6XqcfWzoDjKmsmgaVQUd9ciCsaFlXLjQc6VaTmcJ3HkDwTkCz
         lOzuMdxSDRGinWsvPnlsnskh/2yJjhaHqEUVX8Gz1KwncT77mu6T69CeJ3IHvSJcRCvX
         nH9J/YmoHWMI0HlmqnbB1Mr1kCY3tLb/zQaeGzLuHfAt6JljFU2hCl0oBIAG6AyvE7rU
         WE53JOuwEcSvVKQkeW0RqqwgqUTloh7LaQJOmf46hlOvJ76Ol3QtEYr4vWDHFDTWSw58
         K/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=+Sjjp8jJ7/w0ICOZmYCWvjg7GfEBySyn/+1KfIaOHFY=;
        b=i+wapdxnWQIsyDMus4cmCHODe2Ze9/RPHc7M3UMTojvW7nBnLxucTBo/d5U2c2qlRO
         3TdhRYA9u1FGMyXy6YUVom6PQRbM7FTX9SC+7HTAdzdILmz90HUdMYxOTjf1clg9aeu1
         7Km5H9trn1jQ8Pz3j0ATnAjjAbn/j9Rrd5QMcvnO20ib284Syq3EeOzTLBiuejOwrrIF
         SC2zsuxUyi6u4ULUrCmoGNQZtx0F2wouQK7OitF4aiQf0RPl4lekkMxtXsH/X2uNMrzg
         918XQn4b3WmypHcyfufyi5XuEKwUtFRjxGcTd1S3XUhnVrgr4ORwlJKrYTd/N1hhGfde
         ptgg==
X-Gm-Message-State: AJIora9VXUm43f97LD0zJG0zO7O4/USn/jSxWNt/EMFeoQjF1rh9vFOd
	D86EKIjW2u4R3+P44ABPQV9SNq3wVQ==
X-Google-Smtp-Source: AGRyM1sFuMxPEYN4PW/X/08GhQyD29MIQ2ajj7eQl0T18mWtYdHFG3Mm0EGUOshAqjgz3PRkgvonVGYROw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:3496:744e:315a:b41b])
 (user=elver job=sendgmr) by 2002:a05:6402:1386:b0:431:6911:a151 with SMTP id
 b6-20020a056402138600b004316911a151mr22335610edv.105.1656410343984; Tue, 28
 Jun 2022 02:59:03 -0700 (PDT)
Date: Tue, 28 Jun 2022 11:58:22 +0200
In-Reply-To: <20220628095833.2579903-1-elver@google.com>
Message-Id: <20220628095833.2579903-3-elver@google.com>
Mime-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2 02/13] perf/hw_breakpoint: Clean up headers
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

Clean up headers:

 - Remove unused <linux/kallsyms.h>

 - Remove unused <linux/kprobes.h>

 - Remove unused <linux/module.h>

 - Remove unused <linux/smp.h>

 - Add <linux/export.h> for EXPORT_SYMBOL_GPL().

 - Add <linux/mutex.h> for mutex.

 - Sort alphabetically.

 - Move <linux/hw_breakpoint.h> to top to test it compiles on its own.

Signed-off-by: Marco Elver <elver@google.com>
Acked-by: Dmitry Vyukov <dvyukov@google.com>
---
v2:
* Move to start of series.
---
 kernel/events/hw_breakpoint.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index f32320ac02fd..1b013968b395 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -17,23 +17,22 @@
  * This file contains the arch-independent routines.
  */
 
+#include <linux/hw_breakpoint.h>
+
+#include <linux/bug.h>
+#include <linux/cpu.h>
+#include <linux/export.h>
+#include <linux/init.h>
 #include <linux/irqflags.h>
-#include <linux/kallsyms.h>
-#include <linux/notifier.h>
-#include <linux/kprobes.h>
 #include <linux/kdebug.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
 #include <linux/percpu.h>
 #include <linux/sched.h>
-#include <linux/init.h>
 #include <linux/slab.h>
-#include <linux/list.h>
-#include <linux/cpu.h>
-#include <linux/smp.h>
-#include <linux/bug.h>
 
-#include <linux/hw_breakpoint.h>
 /*
  * Constraints data
  */
-- 
2.37.0.rc0.161.g10f37bed90-goog

