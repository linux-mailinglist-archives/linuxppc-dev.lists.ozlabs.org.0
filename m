Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 324296F78F1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 00:20:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QC7Y80fBnz3fQD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 08:20:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AtjVbUDu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AtjVbUDu;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QC7R76F68z3c5D
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 08:14:59 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64115e652eeso15801444b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 May 2023 15:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683238499; x=1685830499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOpu4K0AbTK/Q+LJp4KPhDC1e5615vKmnF8Avzjqp1E=;
        b=AtjVbUDuDhuC3T5VTZajscYw/VEjMbUiZ2X5khp5ctkS+27M1j/InYQ5Dwvm/plnmd
         krdbBv8nVdEof2X0yL/YrwWPzFZVjFX99rqofGl1oH4jqhbFnFmnoLtQFzOtxTTSUQ8z
         KlY7Tr7uge6pyOt+bCScYMrb0Elk2S6F8xzAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683238499; x=1685830499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOpu4K0AbTK/Q+LJp4KPhDC1e5615vKmnF8Avzjqp1E=;
        b=O0sykamNBmP65a7tk8cUVK5kEr2IhJ47Mm2ZuLgDaflZYG6RD400wPnG1M0x94VvLr
         TfWn6A3pf5paykYFyBvKJrbVgcjNpaqj2wPh+rMf0IWLjQNlp89BieFOr5e9Ld+sLH1t
         0c5AAQFv7CHx4+YSzBDDfnk3xAPZVvuy64oKLCHf6os0VM7FAQU8S/R3qQ3dk9Fq5bLN
         BcrYbnJVMMmbCRv8+vMOBxfe7/f0lBuv8oXkE7AD8VgVWcOcqmccafWBBfjuF7JFdWDy
         v8nxpZqDjc4adyBmoxrR7eY/k7y8LVa/68rgKXaIoKlcJj+9LhQ32EtYHx8qRoof099N
         Zr9g==
X-Gm-Message-State: AC+VfDyLHnx/lV9cKUKP2cRFSQo3Z95Ah7kC+NDkOqY3q0uVBWl0fw3j
	kGvS6u9V65O8j8Js8Dakjqor2A==
X-Google-Smtp-Source: ACHHUZ6/nKe5trCUHnOhrXovtrUyQ0CQn+r16BvPpklIKc+6VPGovlM2nNhX9qvrY/8nVCSqNXN/Lw==
X-Received: by 2002:a05:6a00:8086:b0:634:c34f:e214 with SMTP id eh6-20020a056a00808600b00634c34fe214mr3971422pfb.10.1683238499411;
        Thu, 04 May 2023 15:14:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
        by smtp.gmail.com with ESMTPSA id g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 15:14:58 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 05/17] watchdog/hardlockup: Rename touch_nmi_watchdog() to touch_hardlockup_watchdog()
Date: Thu,  4 May 2023 15:13:37 -0700
Message-ID: <20230504151100.v4.5.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230504221349.1535669-1-dianders@chromium.org>
References: <20230504221349.1535669-1-dianders@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, Douglas Anderson <dianders@chromium.org>, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for the buddy hardlockup detector, rename
touch_nmi_watchdog() to touch_hardlockup_watchdog() to make it clear
that it will touch whatever hardlockup detector is configured. We'll
add a #define for the old name (touch_nmi_watchdog) so that we don't
have to touch every piece of code referring to the old name.

Ideally this change would also rename the arch_touch_nmi_watchdog(),
but that is harder since arch_touch_nmi_watchdog() is exported with
EXPORT_SYMBOL() and thus is ABI. Add a comment next to the call to
hopefully alleviate some of the confusion here.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("Rename touch_nmi_watchdog() to ...") new for v4.

 include/linux/nmi.h | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 454fe99c4874..35d09d70f394 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -125,18 +125,35 @@ void watchdog_nmi_disable(unsigned int cpu);
 void lockup_detector_reconfigure(void);
 
 /**
- * touch_nmi_watchdog - restart NMI watchdog timeout.
+ * touch_hardlockup_watchdog - manually pet the hardlockup watchdog.
  *
- * If the architecture supports the NMI watchdog, touch_nmi_watchdog()
- * may be used to reset the timeout - for code which intentionally
- * disables interrupts for a long time. This call is stateless.
+ * If we support detecting hardlockups, touch_hardlockup_watchdog() may be
+ * used to pet the watchdog (reset the timeout) - for code which
+ * intentionally disables interrupts for a long time. This call is stateless.
  */
-static inline void touch_nmi_watchdog(void)
+static inline void touch_hardlockup_watchdog(void)
 {
+	/*
+	 * Pass on to the hardlockup detector selected via CONFIG_. Note that
+	 * the hardlockup detector may not be arch-specific nor using NMIs,
+	 * but arch_touch_nmi_watchdog() is exported with EXPORT_SYMBOL() and
+	 * is thus ABI.
+	 */
 	arch_touch_nmi_watchdog();
+
+	/*
+	 * Touching the hardlock detector implcitily pets the
+	 * softlockup detector too
+	 */
 	touch_softlockup_watchdog();
 }
 
+/*
+ * It's encouraged for code to refer to the new name, but allow the old
+ * name as well.
+ */
+#define touch_nmi_watchdog	touch_hardlockup_watchdog
+
 /*
  * Create trigger_all_cpu_backtrace() out of the arch-provided
  * base function. Return whether such support was available,
-- 
2.40.1.521.gf1e218fcd8-goog

