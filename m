Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDC7503214
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 02:42:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KgDts4mg0z3br1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 10:42:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e3t0LJ31;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=namhyung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=e3t0LJ31; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KgDrs5FKbz301s
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 10:41:01 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id n8so8245576plh.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 17:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8cYq+2F/bEonU/DO+vgP5ahGjGGTEVFinNWKQ+3P1dA=;
 b=e3t0LJ31dAW3tgBgLwggCET7d3nYF4ZzincvzXr3nWxyy+4KLgHG7ii18LvvBdrW3h
 7Nv9+WpNMYiq27uI2efgeWtX/mNDml9C6ydY4XrIYZIRxQKwLn3RJjKFHnbJ3Q0xu9Lr
 /i+2ykLemDcaG1DUJMCnqEflD141djoRj+dEk0JXnfcWLvPEVRkLxjDARi850BB7qZ4u
 wU4BqWCf7XAuksnTJPWW7hzYOaBPVd1pDStLHpadiiVzmaEW2On4cIEoWH7ML4MneeNw
 XnzIAynLdhza93C9Pm9LsOusWj8jFiYYDNLIk2xT7xQuDt+UlN8OKltDM62qN3KJ2kzn
 /aWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8cYq+2F/bEonU/DO+vgP5ahGjGGTEVFinNWKQ+3P1dA=;
 b=rRlhA9WYQqBM5f/hCZ3nVn8AzD/bkv66Ock6ousgHPoUObnA4lmxCTak7z0RGlgyxV
 sI4iN2Cx8H1tIdYSyZX5tQXBmExuYtkGdRFPMLzYijO+ZUyPaPs1RpZa/y6j+C9cUJMi
 0uT0MbVTT8zLU3nA/OOFf8cuS28dzFW0kf3FIOwKECP9Z0616itIvGI5edBzOSAqGXXO
 X0EZmx3Usv5g4pKqoAH43SI0zwVcISYK5V9Y65YraQJaFVnaH7qi8W2w+WrydTU3n1Qc
 5o5vjo1GO94bePCMtBkBcVp3BPlH7oDUxZZBX0vSzCyK1exc83M47ISuzHn1FTeYgC7p
 LrCA==
X-Gm-Message-State: AOAM532BItAPBoSdDB6JIJtKecWg7tk5eh651qP8Xc0WdGOalWHOCbxH
 SMEZ2//VhmtFFZEZHTUna4I=
X-Google-Smtp-Source: ABdhPJzxX5yhHHrTm7NAJCXbKqHI5E6hvIAvMJcX5k+3LzscvqDrkPHyuj0MwnZd8nFQZVC6TYtuVw==
X-Received: by 2002:a17:90a:4405:b0:1cd:5fe6:dd99 with SMTP id
 s5-20020a17090a440500b001cd5fe6dd99mr1491754pjg.210.1650069659895; 
 Fri, 15 Apr 2022 17:40:59 -0700 (PDT)
Received: from balhae.roam.corp.google.com
 ([2607:fb90:461:36d2:dba1:7530:2cda:19b1])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056a00130900b004f73df40914sm3913537pfu.82.2022.04.15.17.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 17:40:59 -0700 (PDT)
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Ian Rogers <irogers@google.com>, Michael Petlan <mpetlan@redhat.com>
Subject: [PATCH 2/3] perf symbol: Update symbols__fixup_end()
Date: Fri, 15 Apr 2022 17:40:47 -0700
Message-Id: <20220416004048.1514900-3-namhyung@kernel.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220416004048.1514900-1-namhyung@kernel.org>
References: <20220416004048.1514900-1-namhyung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-s390@vger.kernel.org,
 Song Liu <songliubraving@fb.com>, linuxppc-dev@lists.ozlabs.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, Heiko Carstens <hca@linux.ibm.com>,
 John Garry <john.garry@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@linaro.org>,
 Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now arch-specific functions all do the same thing.  When it fixes the
symbol address it needs to check the boundary between the kernel image
and modules.  For the last symbol in the previous region, it cannot
know the exact size as it's discarded already.  Thus it just uses a
small page size (4096) and rounds it up like the last symbol.

Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/perf/util/symbol.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 1b85cc1422a9..623094e866fd 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -217,8 +217,8 @@ void symbols__fixup_duplicate(struct rb_root_cached *symbols)
 	}
 }
 
-void symbols__fixup_end(struct rb_root_cached *symbols,
-			bool is_kallsyms __maybe_unused)
+/* Update zero-sized symbols using the address of the next symbol */
+void symbols__fixup_end(struct rb_root_cached *symbols, bool is_kallsyms)
 {
 	struct rb_node *nd, *prevnd = rb_first_cached(symbols);
 	struct symbol *curr, *prev;
@@ -232,8 +232,29 @@ void symbols__fixup_end(struct rb_root_cached *symbols,
 		prev = curr;
 		curr = rb_entry(nd, struct symbol, rb_node);
 
-		if (prev->end == prev->start || prev->end != curr->start)
-			arch__symbols__fixup_end(prev, curr);
+		/*
+		 * On some architecture kernel text segment start is located at
+		 * some low memory address, while modules are located at high
+		 * memory addresses (or vice versa).  The gap between end of
+		 * kernel text segment and beginning of first module's text
+		 * segment is very big.  Therefore do not fill this gap and do
+		 * not assign it to the kernel dso map (kallsyms).
+		 *
+		 * In kallsyms, it determines module symbols using '[' character
+		 * like in:
+		 *   ffffffffc1937000 T hdmi_driver_init  [snd_hda_codec_hdmi]
+		 */
+		if (prev->end == prev->start) {
+			/* Last kernel/module symbol mapped to end of page */
+			if (is_kallsyms && (!strchr(prev->name, '[') !=
+					    !strchr(curr->name, '[')))
+				prev->end = roundup(prev->end + 4096, 4096);
+			else
+				prev->end = curr->start;
+
+			pr_debug4("%s sym:%s end:%#" PRIx64 "\n",
+				  __func__, prev->name, prev->end);
+		}
 	}
 
 	/* Last entry */
-- 
2.36.0.rc0.470.gd361397f0d-goog

