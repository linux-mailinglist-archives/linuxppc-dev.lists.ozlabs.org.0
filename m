Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E63565965
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 17:08:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc8M70NHcz3drr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 01:08:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rSsD/r2q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2a00:1450:4864:20::54a; helo=mail-ed1-x54a.google.com; envelope-from=33ahdygukdaknu4n0pxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rSsD/r2q;
	dkim-atps=neutral
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc8Jb5r0Hz3bdM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 01:06:07 +1000 (AEST)
Received: by mail-ed1-x54a.google.com with SMTP id y6-20020a056402270600b00433940d207eso3927846edd.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jul 2022 08:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=CJh9nArzdKDvJ+iA1QR7bBHoipxrgc/zo0qPPTGYcZY=;
        b=rSsD/r2qs6OJJi8z0M9FDZLGkHAZGRAv/2iygM2Npml6bURRT2zzlrkokzKUTzF53M
         0uNT+MmX43yhsm8WlEQTiFFVDQORwKM3SbgJjOQTugcMQ5zZxJ5+rO7jKh2Rk6Q0mE6D
         HG7FYoCv03lv6k4/UDJMxG21xceFZTCBMFa9ATDldsD26PL2tPFHXHIsAb9eiaaMtONM
         6jJHEGoFNKDNnQvdJBQYvuHv5nwivY7BfDz+f2lQzIGkZiq4Em9sBZ+2f68ExlDrs/jW
         DMVZ2udkpcF81KuJofszuEFyvAOuj4RsGW4UOY/geZxqVAPwZD/7NRDTPlCR5Krjorm+
         D0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=CJh9nArzdKDvJ+iA1QR7bBHoipxrgc/zo0qPPTGYcZY=;
        b=09/uLqlH32+qApGr93imNkV5qAeTsTrxGRr8DFGoD0z1ArvOHsxrara67iUDdbbh6j
         3SmtXfdNzqkNlRTn7D+lV8A4B7w8T+FY41Kc1dfXR8n3cJwkOoC/76KCQhHOb0t4Fkc+
         KqDPnigi2DhtyHLuvY4eDKIrUO0zZI22POHLIHoBrKk/OEoOqAHlmE2KoCiWaX2ujqyf
         MBESMylUqYodPBk1blJ5JMpCJsXYJrtX4e02WyjepbpitJ58cJ75UFbMVoAJFuJRsw14
         8g4KeEtSM9rhx+Zv+sI5dIz2rfvBarpWTMirusaR+N80AvoCtd/qQTopvU0TIRkx/FRR
         aVbQ==
X-Gm-Message-State: AJIora/KVysp7YDtP/AXHIZ6JkCpNI66lauXZioNureca1657xt6b3Q8
	a5UF5HuVwVZeJpUU1p6H7TsmDGn9YA==
X-Google-Smtp-Source: AGRyM1svWag9OLn9yzYcELWRbfTc1Dah/9HaaTehHww+9DZEXEHQi38e6VRE1jGA8IrZ+CcRyZuqY4n6DQ==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:6edf:e1bc:9a92:4ad0])
 (user=elver job=sendgmr) by 2002:a17:906:11d:b0:712:abf:3210 with SMTP id
 29-20020a170906011d00b007120abf3210mr28767207eje.292.1656947164230; Mon, 04
 Jul 2022 08:06:04 -0700 (PDT)
Date: Mon,  4 Jul 2022 17:05:03 +0200
In-Reply-To: <20220704150514.48816-1-elver@google.com>
Message-Id: <20220704150514.48816-4-elver@google.com>
Mime-Version: 1.0
References: <20220704150514.48816-1-elver@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v3 03/14] perf/hw_breakpoint: Clean up headers
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
index fd5cd1f9e7fc..6076c6346291 100644
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

