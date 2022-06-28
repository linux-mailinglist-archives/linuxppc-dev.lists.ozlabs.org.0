Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5717555C00D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 12:04:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXKvg109yz3fVT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 20:04:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=d/0QyIe6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3-9c6ygukdkqipzivksskpi.gsqpmrybttg-hizpmwxw.sdpefw.svk@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=d/0QyIe6;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXKnV1cbfz3cGf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 19:59:25 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-31814f7654dso99439657b3.15
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 02:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=OJ712p3S1OHPRYNkQ5hzwMPKCksP3C27n0j33eqLkMg=;
        b=d/0QyIe6c6w8YnTv4B7+92tlMrSeIOkNzc8AsQwybZxLipkSsctnUSpQhnXJk3gpQW
         pG7oJE8EMfatuBSTTfzESX61MQT+ZGgqgv/2IQAPK+0Tesd7jB3FKf3aKT9DFS9E5zAE
         nYgEOoHejQURnHC4IjuJqgzxg6cLijpuZQEhOtxvCpWbo1Tam7nN+46hKsWbur8cjeA1
         ZhZT2aa0B7od+m5ukRJTx4SR3zTMzoYTkekeqUfVZ3QziyHy9JQ+YZxu6HoTlk3qqf1H
         eoUemFii0CtNlmMaOzeYoX+faIcxpGae5tdadgrjfMJQ39bU5ebMj5wLE68UG9Dnnuvx
         52cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=OJ712p3S1OHPRYNkQ5hzwMPKCksP3C27n0j33eqLkMg=;
        b=YXDys/LmXePjVQtjzcE0xAcpSerBdoj49/3WYKqep2tZR+Hw+5m3ZZN+z5fKBPEOjR
         0wltG9Yotyc2UukafgUtMkBLgDquNQ9aZ2xgQeMN1mxYy0MCdX6/fAzWKvcEPdgqd+Sl
         +RY+mM2S6Erfj02QCuQ/KU+Oi/F1i349AtC354kt9zt4UpFzutUeOybkC4az0nn0lPal
         cDE0vQm98u+hrWKcWY2XbQMZMn2migpL2IdUmY5PyFyNlUx+KEM5k6V1ZkDFnThm4XqI
         BSxc1ydMxejWw7ZPJaNPHMx66Ra8OKQPLpGtrnVEston/Pq57fLv5fwZ91M+vGyppeyc
         B4sQ==
X-Gm-Message-State: AJIora/oE6RvrT/WE/d2gliZdbFSHOsfVzjhm4yCOAV5tWGop9dDga8e
	bYv81T2cnO51ATUcd4bmi4A2GYmpnQ==
X-Google-Smtp-Source: AGRyM1taDiYbLihOjjyRXPicCa4AHPJVlW3QJBjDYYiQqAt3+ZFsXssWabp4YL8IpafvyHDmt/JVzkEIEQ==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:3496:744e:315a:b41b])
 (user=elver job=sendgmr) by 2002:a25:1985:0:b0:66d:2027:1c7b with SMTP id
 127-20020a251985000000b0066d20271c7bmr3929985ybz.161.1656410363110; Tue, 28
 Jun 2022 02:59:23 -0700 (PDT)
Date: Tue, 28 Jun 2022 11:58:29 +0200
In-Reply-To: <20220628095833.2579903-1-elver@google.com>
Message-Id: <20220628095833.2579903-10-elver@google.com>
Mime-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2 09/13] locking/percpu-rwsem: Add percpu_is_write_locked()
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

