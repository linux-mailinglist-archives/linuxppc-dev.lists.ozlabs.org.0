Return-Path: <linuxppc-dev+bounces-12288-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC38B59BCB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 17:16:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cR58G2kwsz30FR;
	Wed, 17 Sep 2025 01:16:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758034305;
	cv=none; b=lAofwn41P9lqq69BmTTdq8KV0ewXpWzvH73T/Fc4QTZw9fz5hGtmdVmOwS0MCtNp5in/Al7i/tE5MeJSfX54VS34yxN6TcgwaE8pYuoMCbF1PRMUHkYC3LpZy2CKALjpsCRzYF6D+tw8VBEmm5LTZaX3+N2X6Kucr9/5UcddWhcDJDZHTnNcEitVgx8FKI8uxbVi/UZDHxoRZPpOjdin5855TtL5zPKmmwj3tLq4Gae+7BDc/zIE6Giv4bJPiobJCENBI8r/dKzjqj1K4jKEp+pcnQL8s9PLnztgW4qHA5r920MvHTrzF9A3kVblBaSz2Dj24GkvCUotxmJMl8ypsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758034305; c=relaxed/relaxed;
	bh=kUdV9b+MUzYSykR4K0EUwi33bkRUh9yRXeB209qpl0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P30THTfKsuSSYJUYmnOM6p07F7+r06iUWu/GpsfUxSWxOomeWxs2WGipzuECulLcsFHadofPCr8FWOadVGPsGJSrFZqbjTIrFzxPsrrIfVCSRM5og1kBcuYyFdfmmPOozeKPFZBLDze5DgNMuXHYO5zPXe2B/vQxmyob/PzRAYoNxOMOT9/kCS9VZGy70NkmSKEOSfocxa9sN6I/fd4xcBT30wcpgnyf4EcL5unqo+pE5QV6Sx8TfAKj6ZIMUbcozNFntLFEW0z/HNFDoLGDcVvzV/elKFkjJtBqF0il5ZyKOsJsZMFVixpBSzwe8B4TwUVGo21kTNyowElU0JO6Bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k3KziSGZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=wangjinchao600@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k3KziSGZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=wangjinchao600@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cR4bt4TC8z2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 00:51:37 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7728815e639so3895359b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 07:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758034293; x=1758639093; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUdV9b+MUzYSykR4K0EUwi33bkRUh9yRXeB209qpl0M=;
        b=k3KziSGZS/yHso9wlbAIY76Chc54Htwm5zvYHtNhQaAXzxVqzv+Q+roY4VIHjKtmcf
         C9NsZ+hiTgNYV4TongryZFnCBsbi2WNnJ9sQZgDBLphFnqUF8lxMIFGKZP+3g89In08Y
         1PLYHs0nQq5s/BXjvDQNCN6fLaM/U1sr0BUhMsYa5zsBGjhPqOS3F9HkYMC79sUlxDzL
         joXXV5ua7HBIlq2IDR3TXjSRQRTv1RR70o1Ei9CXc3HJCTlUWf4t+veIjFAY5P8LJAyx
         s+BT4SGS0bckWKSmvyWmcsi6dh4K37TQiet4dsT1ltgFzBZm3aZcmFZOG1NdjjyYLMsc
         5FJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034293; x=1758639093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUdV9b+MUzYSykR4K0EUwi33bkRUh9yRXeB209qpl0M=;
        b=EgJOG/x6jzVRj8+lsqaOUk1Vd7Mks73wU9/NZd2xyf0iYhn0zoew9PtOVWn36av0Og
         ULTxPslwnL76HEsI/bh3fp/zW3rV0BtTZJ2Wz30X3wbeFv9B3pNO6d2qf0GAHUow5p6i
         ddW3k7nuIVxsWKboq/LqzWCEd9mKJDz/V9PUTR9GEaNRvvXquaLLuJaoXpoaekVbO6Fv
         nqe1LtjdpXr9gSK+vKz1ftn/J8ISIKQcxzluaOIl51DtGDr0xfrYNY1T0R+T0xZPjXWK
         iqdPPsB+mUEAZzWclAd89zN0DK5rHBQufAi6DwNNovAqFZ793UdnxJtW6v7IBcoYLv4z
         p5MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJgUfEuBSmgy53aNLbdMNUjHh6foGJ/r+yzAenxgNR/et3argLJbHNaJciGB7Dl5aqCua5sQKr8xlQD38=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzhQ7gnB0Rcc7SFd3OmOyEW58gw8iuGE7HjeL1tp0QdQbkysrJ5
	QVjstH0tNaDxFmTT65bBWIoRfP9Oab5MEHXBLOljXfUP8kRQ5ykfYntM
X-Gm-Gg: ASbGnct2u3kAbzYTrzub+Tm0MBkYnS9InR9SUbABBjXWNZQSe+0XMxoq1K4E4v3r7Le
	wwpqHP/5B+w4YXLhfZxaiN/5Bt+xcUqazocwE7STS8QoSlAqvdt2ffIXjwtfOZbEjRdlw6Zf1R3
	69j7SbRbUEjq2MlvUVYygx5J/iZQdv6ycROOwUD+ImuIa94HojW7oQBeM3ZM8ge8rau6y+4vAg3
	GUGgrxm1vJuiMXf1eu93JABWXsgO3Ile+St7GlyzMCzOI7SlcgqmIcEwEwAOCIHnRFdFWrkUDqd
	9XmchYD8PudKD5pQk1BtEdvyE9ouFaPOsmeJwgo1bIcgpuzofo7eEYgyV6T55f2NQr2gWP2hr0b
	D7xcjQJrgp8knRWpSP09rhfQ06pvVXhJEhr3ju6NMbA==
X-Google-Smtp-Source: AGHT+IHnm4FCK6Te/CibvzapeGhIkDjpDqsd9Sk7/lgMPhn0W5OUMZuiBGRdKNd0yHfUApRIAYjXUQ==
X-Received: by 2002:a05:6a00:13a5:b0:772:5165:3f68 with SMTP id d2e1a72fcca58-77612194091mr20274566b3a.27.1758034293145;
        Tue, 16 Sep 2025 07:51:33 -0700 (PDT)
Received: from localhost ([194.50.154.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b18371sm16676053b3a.49.2025.09.16.07.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:51:32 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Doug Anderson <dianders@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	kees@kernel.org,
	masahiroy@kernel.org,
	aliceryhl@google.com,
	ojeda@kernel.org,
	thomas.weissschuh@linutronix.de,
	xur@google.com,
	ruanjinjie@huawei.com,
	gshan@redhat.com,
	maz@kernel.org,
	suzuki.poulose@arm.com,
	zhanjie9@hisilicon.com,
	yangyicong@hisilicon.com,
	gautam@linux.ibm.com,
	arnd@arndb.de,
	zhao.xichao@vivo.com,
	rppt@kernel.org,
	lihuafei1@huawei.com,
	coxu@redhat.com,
	jpoimboe@kernel.org,
	yaozhenguo1@gmail.com,
	luogengkun@huaweicloud.com,
	max.kellermann@ionos.com,
	tj@kernel.org,
	yury.norov@gmail.com,
	thorsten.blum@linux.dev,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-perf-users@vger.kernel.org,
	Ian Rogers <irogers@google.com>
Cc: Jinchao Wang <wangjinchao600@gmail.com>
Subject: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup detector
Date: Tue, 16 Sep 2025 22:50:10 +0800
Message-ID: <20250916145122.416128-1-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <https://lore.kernel.org/all/20250915035355.10846-1-cuiyunhui@bytedance.com/>
References: <https://lore.kernel.org/all/20250915035355.10846-1-cuiyunhui@bytedance.com/>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Currently, the hard lockup detector is selected at compile time via
Kconfig, which requires a kernel rebuild to switch implementations.
This is inflexible, especially on systems where a perf event may not
be available or may be needed for other tasks.

This commit refactors the hard lockup detector to replace a rigid
compile-time choice with a flexible build-time and boot-time solution.
The patch supports building the kernel with either detector
independently, or with both. When both are built, a new boot parameter
`hardlockup_detector="perf|buddy"` allows the selection at boot time.
This is a more robust and user-friendly design.

This patch is a follow-up to the discussion on the kernel mailing list
regarding the preference and future of the hard lockup detectors. It
implements a flexible solution that addresses the community's need to
select an appropriate detector at boot time.

The core changes are:
- The `perf` and `buddy` watchdog implementations are separated into
  distinct functions (e.g., `watchdog_perf_hardlockup_enable`).
- Global function pointers are introduced (`watchdog_hardlockup_enable_ptr`)
  to serve as a single API for the entire feature.
- A new `hardlockup_detector=` boot parameter is added to allow the
  user to select the desired detector at boot time.
- The Kconfig options are simplified by removing the complex
  `HARDLOCKUP_DETECTOR_PREFER_BUDDY` and allowing both detectors to be
  built without mutual exclusion.
- The weak stubs are updated to call the new function pointers,
  centralizing the watchdog logic.

Link: https://lore.kernel.org/all/20250915035355.10846-1-cuiyunhui@bytedance.com/
Link: https://lore.kernel.org/all/CAD=FV=WWUiCi6bZCs_gseFpDDWNkuJMoL6XCftEo6W7q6jRCkg@mail.gmail.com/

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |  7 +++
 include/linux/nmi.h                           |  6 +++
 kernel/watchdog.c                             | 46 ++++++++++++++++++-
 kernel/watchdog_buddy.c                       |  7 +--
 kernel/watchdog_perf.c                        | 10 ++--
 lib/Kconfig.debug                             | 37 +++++++--------
 6 files changed, 85 insertions(+), 28 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 5a7a83c411e9..0af214ee566c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1828,6 +1828,13 @@
 			backtraces on all cpus.
 			Format: 0 | 1
 
+	hardlockup_detector=
+			[perf, buddy] Selects the hard lockup detector to use at
+			boot time.
+			Format: <string>
+			- "perf": Use the perf-based detector.
+			- "buddy": Use the buddy-based detector.
+
 	hash_pointers=
 			[KNL,EARLY]
 			By default, when pointers are printed to the console
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index cf3c6ab408aa..9298980ce572 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -100,6 +100,9 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs);
 #endif
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
+void watchdog_perf_hardlockup_enable(unsigned int cpu);
+void watchdog_perf_hardlockup_disable(unsigned int cpu);
+extern int watchdog_perf_hardlockup_probe(void);
 extern void hardlockup_detector_perf_stop(void);
 extern void hardlockup_detector_perf_restart(void);
 extern void hardlockup_config_perf_event(const char *str);
@@ -120,6 +123,9 @@ void watchdog_hardlockup_disable(unsigned int cpu);
 void lockup_detector_reconfigure(void);
 
 #ifdef CONFIG_HARDLOCKUP_DETECTOR_BUDDY
+void watchdog_buddy_hardlockup_enable(unsigned int cpu);
+void watchdog_buddy_hardlockup_disable(unsigned int cpu);
+int watchdog_buddy_hardlockup_probe(void);
 void watchdog_buddy_check_hardlockup(int hrtimer_interrupts);
 #else
 static inline void watchdog_buddy_check_hardlockup(int hrtimer_interrupts) {}
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 80b56c002c7f..85451d24a77d 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -55,6 +55,37 @@ unsigned long *watchdog_cpumask_bits = cpumask_bits(&watchdog_cpumask);
 
 #ifdef CONFIG_HARDLOCKUP_DETECTOR
 
+#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
+/* The global function pointers */
+void (*watchdog_hardlockup_enable_ptr)(unsigned int cpu) = watchdog_perf_hardlockup_enable;
+void (*watchdog_hardlockup_disable_ptr)(unsigned int cpu) = watchdog_perf_hardlockup_disable;
+int (*watchdog_hardlockup_probe_ptr)(void) = watchdog_perf_hardlockup_probe;
+#elif defined(CONFIG_HARDLOCKUP_DETECTOR_BUDDY)
+void (*watchdog_hardlockup_enable_ptr)(unsigned int cpu) = watchdog_buddy_hardlockup_enable;
+void (*watchdog_hardlockup_disable_ptr)(unsigned int cpu) = watchdog_buddy_hardlockup_disable;
+int (*watchdog_hardlockup_probe_ptr)(void) = watchdog_buddy_hardlockup_probe;
+#endif
+
+#ifdef CONFIG_HARDLOCKUP_DETECTOR_MULTIPLE
+static char *hardlockup_detector_type = "perf"; /* Default to perf */
+static int __init set_hardlockup_detector_type(char *str)
+{
+	if (!strncmp(str, "perf", 4)) {
+		watchdog_hardlockup_enable_ptr = watchdog_perf_hardlockup_enable;
+		watchdog_hardlockup_disable_ptr = watchdog_perf_hardlockup_disable;
+		watchdog_hardlockup_probe_ptr = watchdog_perf_hardlockup_probe;
+	} else if (!strncmp(str, "buddy", 5)) {
+		watchdog_hardlockup_enable_ptr = watchdog_buddy_hardlockup_enable;
+		watchdog_hardlockup_disable_ptr = watchdog_buddy_hardlockup_disable;
+		watchdog_hardlockup_probe_ptr = watchdog_buddy_hardlockup_probe;
+	}
+	return 1;
+}
+
+__setup("hardlockup_detector=", set_hardlockup_detector_type);
+
+#endif
+
 # ifdef CONFIG_SMP
 int __read_mostly sysctl_hardlockup_all_cpu_backtrace;
 # endif /* CONFIG_SMP */
@@ -262,9 +293,17 @@ static inline void watchdog_hardlockup_kick(void) { }
  * softlockup watchdog start and stop. The detector must select the
  * SOFTLOCKUP_DETECTOR Kconfig.
  */
-void __weak watchdog_hardlockup_enable(unsigned int cpu) { }
+void __weak watchdog_hardlockup_enable(unsigned int cpu)
+{
+	if (watchdog_hardlockup_enable_ptr)
+		watchdog_hardlockup_enable_ptr(cpu);
+}
 
-void __weak watchdog_hardlockup_disable(unsigned int cpu) { }
+void __weak watchdog_hardlockup_disable(unsigned int cpu)
+{
+	if (watchdog_hardlockup_disable_ptr)
+		watchdog_hardlockup_disable_ptr(cpu);
+}
 
 /*
  * Watchdog-detector specific API.
@@ -275,6 +314,9 @@ void __weak watchdog_hardlockup_disable(unsigned int cpu) { }
  */
 int __weak __init watchdog_hardlockup_probe(void)
 {
+	if (watchdog_hardlockup_probe_ptr)
+		return watchdog_hardlockup_probe_ptr();
+
 	return -ENODEV;
 }
 
diff --git a/kernel/watchdog_buddy.c b/kernel/watchdog_buddy.c
index ee754d767c21..390d89bfcafa 100644
--- a/kernel/watchdog_buddy.c
+++ b/kernel/watchdog_buddy.c
@@ -19,15 +19,16 @@ static unsigned int watchdog_next_cpu(unsigned int cpu)
 	return next_cpu;
 }
 
-int __init watchdog_hardlockup_probe(void)
+int __init watchdog_buddy_hardlockup_probe(void)
 {
 	return 0;
 }
 
-void watchdog_hardlockup_enable(unsigned int cpu)
+void watchdog_buddy_hardlockup_enable(unsigned int cpu)
 {
 	unsigned int next_cpu;
 
+	pr_info("ddddd %s\n", __func__);
 	/*
 	 * The new CPU will be marked online before the hrtimer interrupt
 	 * gets a chance to run on it. If another CPU tests for a
@@ -58,7 +59,7 @@ void watchdog_hardlockup_enable(unsigned int cpu)
 	cpumask_set_cpu(cpu, &watchdog_cpus);
 }
 
-void watchdog_hardlockup_disable(unsigned int cpu)
+void watchdog_buddy_hardlockup_disable(unsigned int cpu)
 {
 	unsigned int next_cpu = watchdog_next_cpu(cpu);
 
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index 9c58f5b4381d..270110e58f20 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -153,10 +153,12 @@ static int hardlockup_detector_event_create(void)
  * watchdog_hardlockup_enable - Enable the local event
  * @cpu: The CPU to enable hard lockup on.
  */
-void watchdog_hardlockup_enable(unsigned int cpu)
+void watchdog_perf_hardlockup_enable(unsigned int cpu)
 {
 	WARN_ON_ONCE(cpu != smp_processor_id());
 
+	pr_info("ddddd %s\n", __func__);
+
 	if (hardlockup_detector_event_create())
 		return;
 
@@ -172,7 +174,7 @@ void watchdog_hardlockup_enable(unsigned int cpu)
  * watchdog_hardlockup_disable - Disable the local event
  * @cpu: The CPU to enable hard lockup on.
  */
-void watchdog_hardlockup_disable(unsigned int cpu)
+void watchdog_perf_hardlockup_disable(unsigned int cpu)
 {
 	struct perf_event *event = this_cpu_read(watchdog_ev);
 
@@ -257,10 +259,12 @@ bool __weak __init arch_perf_nmi_is_available(void)
 /**
  * watchdog_hardlockup_probe - Probe whether NMI event is available at all
  */
-int __init watchdog_hardlockup_probe(void)
+int __init watchdog_perf_hardlockup_probe(void)
 {
 	int ret;
 
+	pr_info("ddddd %s\n", __func__);
+
 	if (!arch_perf_nmi_is_available())
 		return -ENODEV;
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index dc0e0c6ed075..443353fad1c1 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1167,36 +1167,33 @@ config HARDLOCKUP_DETECTOR
 #
 # Note that arch-specific variants are always preferred.
 #
-config HARDLOCKUP_DETECTOR_PREFER_BUDDY
-	bool "Prefer the buddy CPU hardlockup detector"
-	depends on HARDLOCKUP_DETECTOR
-	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && HAVE_HARDLOCKUP_DETECTOR_BUDDY
-	depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
-	help
-	  Say Y here to prefer the buddy hardlockup detector over the perf one.
-
-	  With the buddy detector, each CPU uses its softlockup hrtimer
-	  to check that the next CPU is processing hrtimer interrupts by
-	  verifying that a counter is increasing.
-
-	  This hardlockup detector is useful on systems that don't have
-	  an arch-specific hardlockup detector or if resources needed
-	  for the hardlockup detector are better used for other things.
-
 config HARDLOCKUP_DETECTOR_PERF
-	bool
+	bool "Enable perf-based hard lockup detector (preferred)"
 	depends on HARDLOCKUP_DETECTOR
-	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
+	depends on HAVE_HARDLOCKUP_DETECTOR_PERF
 	depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
+	help
+	  This detector uses a perf event on the CPU to detect when a CPU
+	  has become non-maskable interrupt (NMI) stuck. This is the
+	  preferred method on modern systems as it can detect lockups on
+	  all CPUs at the same time.
 
 config HARDLOCKUP_DETECTOR_BUDDY
-	bool
+	bool "Enable buddy-based hard lockup detector"
 	depends on HARDLOCKUP_DETECTOR
 	depends on HAVE_HARDLOCKUP_DETECTOR_BUDDY
-	depends on !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_PREFER_BUDDY
 	depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
+	help
+	  This is an alternative lockup detector that uses a heartbeat
+	  mechanism between CPUs to detect when one has stopped responding.
+	  It is less precise than the perf-based detector and cannot detect
+	  all-CPU lockups, but it does not require a perf counter.
+
+config CONFIG_HARDLOCKUP_DETECTOR_MULTIPLE
+	bool
+	depends on HARDLOCKUP_DETECTOR_PERF && HARDLOCKUP_DETECTOR_BUDDY
 
 config HARDLOCKUP_DETECTOR_ARCH
 	bool
-- 
2.43.0


