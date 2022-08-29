Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 833745A4C83
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 14:54:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGVkq2Rr8z3bd4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 22:54:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=DUROuHk1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2a00:1450:4864:20::649; helo=mail-ej1-x649.google.com; envelope-from=3mbumywukdfy29j2f4cc492.0ca96bildd0-12j96ghg.cn9yzg.cf4@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=DUROuHk1;
	dkim-atps=neutral
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGVbw5WHnz3c7s
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 22:48:28 +1000 (AEST)
Received: by mail-ej1-x649.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fso2156406ejb.14
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 05:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=o7nFvD+bAzzd8hTxdy6J5SFI8QAvwQGuiGUQWboy0hk=;
        b=DUROuHk1Z9qzwl+b2DTEg2S7HJMexhpmqANb/PJZ7O33R9XhSPct7AwehP14PQc/2o
         wK/bi8a2CwUsCNYLZ60BVrbEBT9p31oxiK+AfnIEOciyJytERkocF14TQxcpALfKW3+m
         b2Ub+eMgVCVEVNppFz86zBqIyKvR0lUxlYrSs0Pqqu53c88/O9WnN5AbglZY4E2lNY3X
         UurK/UKzohtpKpt81PvQ4NXYcynS9qosWESRGDtGbt4p3CdpxU/ZwTvmCC71hiCrb5Iz
         oBnMf/JVbgAxkVDKJuMfwanruY91nDmZy+mUGQ78tN/tN+0RJuWqqSZWWdmcn4+YhWS4
         IZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=o7nFvD+bAzzd8hTxdy6J5SFI8QAvwQGuiGUQWboy0hk=;
        b=zVETu/z3azNI3FfuEWkWI0CmP9fDPQmSHV3mjo/d8G768uP0lCrxMbp5FnQDARkfa7
         n5Cf7NTK0Kegyv2ge/QmDR2FCTAReE2jhvxePaw876GJ2SR83im6eJQB/fp6EOrc2yJs
         rEKu/xgKJdoEfKMSd21mtUFpCZ4ruQzPPhd0ndTP1gS8QIWLvVXILyQx1TJ2S6waVICo
         WvZGM2W7rmCymmGxzIy8HRONylKr9rygL1Sz9sBaLc9HO7ipZ9FtHZoiuV/GLHY7Ey18
         rDjjhXJ9RNgjv8Jy62trXjjP+zdsTK5rTKBp+sRsagNO+GG4o9pnuEt+fcA2VZAPd+CU
         AlvA==
X-Gm-Message-State: ACgBeo1qnChGDAS42J3YH5dedDj/Ix9jqh/wAXjdEy1k0oqxsbQJuDQc
	uwrQK8xYk9skp4jl2jErFDv6e9E3yw==
X-Google-Smtp-Source: AA6agR5wokwGhbG/dPuolBfo3Bpkl9cRXVj3x5ekleyIMoAvz+i6ptf2ezpCAANeuPi0p5VgMRtvOQZZzA==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:196d:4fc7:fa9c:62e3])
 (user=elver job=sendgmr) by 2002:a17:907:75c6:b0:741:75a0:b82b with SMTP id
 jl6-20020a17090775c600b0074175a0b82bmr4672915ejc.465.1661777305817; Mon, 29
 Aug 2022 05:48:25 -0700 (PDT)
Date: Mon, 29 Aug 2022 14:47:15 +0200
In-Reply-To: <20220829124719.675715-1-elver@google.com>
Mime-Version: 1.0
References: <20220829124719.675715-1-elver@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829124719.675715-11-elver@google.com>
Subject: [PATCH v4 10/14] locking/percpu-rwsem: Add percpu_is_write_locked()
 and percpu_is_read_locked()
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

Implement simple accessors to probe percpu-rwsem's locked state:
percpu_is_write_locked(), percpu_is_read_locked().

Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Acked-by: Ian Rogers <irogers@google.com>
---
v4:
* Due to spurious read_count increments in __percpu_down_read_trylock()
  if sem->block != 0, check that !sem->block (reported by Peter).

v2:
* New patch.
---
 include/linux/percpu-rwsem.h  | 6 ++++++
 kernel/locking/percpu-rwsem.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/percpu-rwsem.h b/include/linux/percpu-rwsem.h
index 5fda40f97fe9..36b942b67b7d 100644
--- a/include/linux/percpu-rwsem.h
+++ b/include/linux/percpu-rwsem.h
@@ -121,9 +121,15 @@ static inline void percpu_up_read(struct percpu_rw_semaphore *sem)
 	preempt_enable();
 }
 
+extern bool percpu_is_read_locked(struct percpu_rw_semaphore *);
 extern void percpu_down_write(struct percpu_rw_semaphore *);
 extern void percpu_up_write(struct percpu_rw_semaphore *);
 
+static inline bool percpu_is_write_locked(struct percpu_rw_semaphore *sem)
+{
+	return atomic_read(&sem->block);
+}
+
 extern int __percpu_init_rwsem(struct percpu_rw_semaphore *,
 				const char *, struct lock_class_key *);
 
diff --git a/kernel/locking/percpu-rwsem.c b/kernel/locking/percpu-rwsem.c
index 5fe4c5495ba3..185bd1c906b0 100644
--- a/kernel/locking/percpu-rwsem.c
+++ b/kernel/locking/percpu-rwsem.c
@@ -192,6 +192,12 @@ EXPORT_SYMBOL_GPL(__percpu_down_read);
 	__sum;								\
 })
 
+bool percpu_is_read_locked(struct percpu_rw_semaphore *sem)
+{
+	return per_cpu_sum(*sem->read_count) != 0 && !atomic_read(&sem->block);
+}
+EXPORT_SYMBOL_GPL(percpu_is_read_locked);
+
 /*
  * Return true if the modular sum of the sem->read_count per-CPU variable is
  * zero.  If this sum is zero, then it is stable due to the fact that if any
-- 
2.37.2.672.g94769d06f0-goog

