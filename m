Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAA556598B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 17:12:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc8Rx5WgCz3fPK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 01:12:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ph8b8+BR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2a00:1450:4864:20::649; helo=mail-ej1-x649.google.com; envelope-from=37whdygukdbw6dn6j8gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ph8b8+BR;
	dkim-atps=neutral
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc8Jy5chZz3byv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 01:06:26 +1000 (AEST)
Received: by mail-ej1-x649.google.com with SMTP id l2-20020a170906078200b006fed42bfeacso2141491ejc.16
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jul 2022 08:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=yKHd4+xECY7NKN85fGWY0KF6Qb94v9CyhlLOvS2S1lk=;
        b=Ph8b8+BRp8UF3q45WaVGDpzOGcKX1K7SLbLqBqrclyh0nxPSG/KuoHKe/VDxiTer8b
         IAi6O8suVd0rgt8XGC+GNaJU9hpUIaIuxsrPq4Ejzd12Sdz0m1067DxPyqs30B1zylVm
         dxRzGzK+3MBE0hpfoZCp4zDUAoyD6Cvs2Qttkwp4sLzEhVmC/Xoy66reRveUzPOZldla
         raHJWM4L2eR0mSPU8+xiOwXka2jQoK1EKz9G9ufnUNccA9gRdrgor5rE483oWbIB1+WE
         PcECJ6azBnTzgr4PZadkahxGdwjtpRSR1zK+pD/HQv9uiFgVEPVu0fgeg3AR4VP9ftti
         zlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=yKHd4+xECY7NKN85fGWY0KF6Qb94v9CyhlLOvS2S1lk=;
        b=I/A5hO2P9XhCbqQFSsaLQIxT9yTqkZUROEpnHpuBCEXcFkl3HSKx5Q4vqq/t9PJcBR
         Q0ahZ3gc2+IwSXiwWL9i5iqUo9akAAzu04mxfq/IrRIy5MsFCudIc0ANU+qJe0RPf0h4
         d+E+VX4yNpWo7unMEcPfNbywgwstx7gT+qKDOpYE51YM0eKpaEJ+hm7q323gPvjQb/HR
         iWOltKy4vnTXqFVlhwTCxQPXuWayTyuWWkPMS91+50jfh+VkA5hctvC0HRQiIRvUXDA7
         ciUbreIfHGCzxA9k5aBP1VLDdUd5PwpeV6srfJpTq7l4Ud1TJE6zVNNajn3jVdXlWl0O
         GTnA==
X-Gm-Message-State: AJIora86sprJ5Yxl+zSAD+fzoaYuH6yqYY5B/FfQXFI2HDVWj3KHtf/J
	uTpR3ByvGtzPvG60fVilfp8/cd1HtA==
X-Google-Smtp-Source: AGRyM1v1bp4fmM3Ia8wxOfKnNbYa+SkAtF2yk0BBky/nBRaoOYmthev0cidUeNONuJ9a0TQ32GuetMcAbg==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:6edf:e1bc:9a92:4ad0])
 (user=elver job=sendgmr) by 2002:a17:907:6ea7:b0:726:41de:78ac with SMTP id
 sh39-20020a1709076ea700b0072641de78acmr30061092ejc.452.1656947183301; Mon, 04
 Jul 2022 08:06:23 -0700 (PDT)
Date: Mon,  4 Jul 2022 17:05:10 +0200
In-Reply-To: <20220704150514.48816-1-elver@google.com>
Message-Id: <20220704150514.48816-11-elver@google.com>
Mime-Version: 1.0
References: <20220704150514.48816-1-elver@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v3 10/14] locking/percpu-rwsem: Add percpu_is_write_locked()
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement simple accessors to probe percpu-rwsem's locked state:
percpu_is_write_locked(), percpu_is_read_locked().

Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
---
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
index 5fe4c5495ba3..213d114fb025 100644
--- a/kernel/locking/percpu-rwsem.c
+++ b/kernel/locking/percpu-rwsem.c
@@ -192,6 +192,12 @@ EXPORT_SYMBOL_GPL(__percpu_down_read);
 	__sum;								\
 })
 
+bool percpu_is_read_locked(struct percpu_rw_semaphore *sem)
+{
+	return per_cpu_sum(*sem->read_count) != 0;
+}
+EXPORT_SYMBOL_GPL(percpu_is_read_locked);
+
 /*
  * Return true if the modular sum of the sem->read_count per-CPU variable is
  * zero.  If this sum is zero, then it is stable due to the fact that if any
-- 
2.37.0.rc0.161.g10f37bed90-goog

