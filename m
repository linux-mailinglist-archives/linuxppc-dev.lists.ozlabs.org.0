Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B825A4C5E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 14:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGVfX1jZcz3f4V
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 22:50:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aoWdQSkd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2a00:1450:4864:20::549; helo=mail-ed1-x549.google.com; envelope-from=3hrumywukdemjq0jwlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aoWdQSkd;
	dkim-atps=neutral
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGVbZ1l8Wz3blw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 22:48:09 +1000 (AEST)
Received: by mail-ed1-x549.google.com with SMTP id x21-20020a05640226d500b0044856301c62so2360023edd.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 05:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=Xnrbr4NWXpH3ILMfaL+Hqy6Mh/173nAe6Rh4Ql+SwwA=;
        b=aoWdQSkdpteyXmYAo1c6eiVE2udp1iPCkTbGD3cqc5tyTEc5w9TDE5eQ2pH/aC5ONx
         wvITjNHuqGva9IIaS4Jy/kRGfM87daq+ZT24dKaI5knatHyVNPce7SKxJrvTIxK+jpRV
         T+oUK6JwmqGiqfWOw+qZfCjfKSncTUyCL/rTKrD/R/uwr1cZQDo2BiYCLIVtBSK8KpsZ
         CLE54Tvl9hptOey0GrB4CQxeXWFE0oHlZwm2u/7tiypSnfTXu/PJqf5/FBc4ceMvlGJj
         bS8z75PhngVBIBAZf6h+e4wkxi/WQq7RrV8yo3ue7h3N/zwN5y8SZVpJk5+wDM79X8yf
         2pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=Xnrbr4NWXpH3ILMfaL+Hqy6Mh/173nAe6Rh4Ql+SwwA=;
        b=1aFay4kVgMolKVON+yBD1wikasUdhs9w0diVTKr8BooN4DJBvL9iWniEY6QH/4VmiI
         DbwPq3gpHvFW5zZiTKr1gfH/7915xzHoReExJuv82LmlTgmqPr87ccx+84bfUEtPfG0j
         dV7a/22smL3UWIKr3zFVI5kQRv3s1hMj3U5ni+M1oHYTHmLPAzrCIB9boHO8JEBspy/V
         m5PdlJntbL7QmPstSOKZn21p1iPHZfn5zrrUKdNUDXLuYvrADtba7kYKF8TDRuijdYmV
         mg+lvBsuqaT3bh2RHQ1yuqrfVcfH31LSy9lOW7SxMgyWYybY023v+sVTGIzZ9TSbLqja
         ghGA==
X-Gm-Message-State: ACgBeo0AgdCcbzBE4RddB/EKEZC9cF5U8pHW4bwZnAHmTuh64uMHTwFb
	dOnCe1bTsSo+1p2W42bo+av1r+yWvw==
X-Google-Smtp-Source: AA6agR42dMVaiS+cJuLOtzyugHi3iaDb9VrUvxxRA/60qGgLveidvAmI7LaoSF8LrpwtVNgvbP26lurGuA==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:196d:4fc7:fa9c:62e3])
 (user=elver job=sendgmr) by 2002:aa7:c946:0:b0:43d:3038:1381 with SMTP id
 h6-20020aa7c946000000b0043d30381381mr16380942edt.354.1661777286713; Mon, 29
 Aug 2022 05:48:06 -0700 (PDT)
Date: Mon, 29 Aug 2022 14:47:08 +0200
In-Reply-To: <20220829124719.675715-1-elver@google.com>
Mime-Version: 1.0
References: <20220829124719.675715-1-elver@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829124719.675715-4-elver@google.com>
Subject: [PATCH v4 03/14] perf/hw_breakpoint: Clean up headers
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
Acked-by: Ian Rogers <irogers@google.com>
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
2.37.2.672.g94769d06f0-goog

