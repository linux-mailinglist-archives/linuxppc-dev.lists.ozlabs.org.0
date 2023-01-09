Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 353516632C7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:24:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRmC0nr2z3g2V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:24:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=I5umo4kG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3j3-8ywykddwqspclzemmejc.amkjglsvnna-bctjgqrq.mxjyzq.mpe@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=I5umo4kG;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR602xddz3cdJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:55:04 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id i17-20020a25bc11000000b007b59a5b74aaso10158986ybh.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mbt4mHoq0eWZO149X3WH8AIvdwQHHBNP+0MBWdKikso=;
        b=I5umo4kG0hMiq4gs5OujcHd7Sn1GGJbiybdYQYTj0HAR3QOkD0OA35qcaeXUMRzGAJ
         dIG3EBC52wC5ibcKgTHA/19I2NomM7CaXPc78eVykHWlIF2Vt/KiNizKg3yGh0eNsGHP
         jtagKS1D/qcsRmP7Fqc869E/kUJC8aHONABQKFab5CUW1r0+y/kJjLtE/M8OXtv+HWMx
         0jlTEySwEhV749+tPTyOU0MfX8AR34H6BYDnkbNQmdajk1IIrv1WChV6C7Fwj8u25gID
         LgF2w8/r6WitNZ0Roa2WVZN3Fbrz2yHOP70XPp57APsjpBjV3GkkefNK2oUkx1yrmoLm
         XvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mbt4mHoq0eWZO149X3WH8AIvdwQHHBNP+0MBWdKikso=;
        b=4E1mLt5N14lh+tHH3mFQtVjsm4cqppF8yesh5A0LslkB76om/nys4uW52dsDZyzR+v
         0WHvDaJxmI+QuX2zVCbH4QQ6VYLiMq6TRN4zxdJuD4gx1rLt7Q9Zc7Jeq3vsd5wf6g8N
         /O84h6AHiIn+upfEtqCAbFHPknaPgj+1SRarsgD2SOPZKGKs1FQkOo//aAqg9wDwABmp
         bQfPC3NxLn7sBiZ4ePhZJqkoEvl5gqGDQDg6d0GJ6RtTsxT4blN7gTeCgPaJ3pT6SV8B
         ufQjnb6THeYnM7QxwKpmOxITePL1CFVjhoncFt+P7weDU0Z0xXknBI3wLkn93Ub4YQwE
         9TVg==
X-Gm-Message-State: AFqh2kpBNT9DVdKy4JsiJhdH/wOemvvpmSOf7gYeRAj5G+ge+TdfsNIC
	qY5dGpc6HU0swbfDsk4JZLqhjDCLepI=
X-Google-Smtp-Source: AMrXdXtYuIZxYJtCLtoqxn2YJzAdgg4PkVPb1cvNxFA+XZbpVDno2DZhvITBpFn/vgBWgY0+QZ+ehdsSMWQ=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a25:9d82:0:b0:774:df47:b5f with SMTP id
 v2-20020a259d82000000b00774df470b5fmr6154650ybp.405.1673297703709; Mon, 09
 Jan 2023 12:55:03 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:28 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-34-surenb@google.com>
Subject: [PATCH 33/41] mm: introduce per-VMA lock statistics
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingu
 larity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a new CONFIG_PER_VMA_LOCK_STATS config option to dump extra
statistics about handling page fault under VMA lock.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/vm_event_item.h | 6 ++++++
 include/linux/vmstat.h        | 6 ++++++
 mm/Kconfig.debug              | 8 ++++++++
 mm/vmstat.c                   | 6 ++++++
 4 files changed, 26 insertions(+)

diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index 7f5d1caf5890..8abfa1240040 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -149,6 +149,12 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 #ifdef CONFIG_X86
 		DIRECT_MAP_LEVEL2_SPLIT,
 		DIRECT_MAP_LEVEL3_SPLIT,
+#endif
+#ifdef CONFIG_PER_VMA_LOCK_STATS
+		VMA_LOCK_SUCCESS,
+		VMA_LOCK_ABORT,
+		VMA_LOCK_RETRY,
+		VMA_LOCK_MISS,
 #endif
 		NR_VM_EVENT_ITEMS
 };
diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
index 19cf5b6892ce..fed855bae6d8 100644
--- a/include/linux/vmstat.h
+++ b/include/linux/vmstat.h
@@ -125,6 +125,12 @@ static inline void vm_events_fold_cpu(int cpu)
 #define count_vm_tlb_events(x, y) do { (void)(y); } while (0)
 #endif
 
+#ifdef CONFIG_PER_VMA_LOCK_STATS
+#define count_vm_vma_lock_event(x) count_vm_event(x)
+#else
+#define count_vm_vma_lock_event(x) do {} while (0)
+#endif
+
 #define __count_zid_vm_events(item, zid, delta) \
 	__count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
 
diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index fca699ad1fb0..32a93b064590 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -207,3 +207,11 @@ config PTDUMP_DEBUGFS
 	  kernel.
 
 	  If in doubt, say N.
+
+
+config PER_VMA_LOCK_STATS
+	bool "Statistics for per-vma locks"
+	depends on PER_VMA_LOCK
+	default y
+	help
+	  Statistics for per-vma locks.
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 1ea6a5ce1c41..4f1089a1860e 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1399,6 +1399,12 @@ const char * const vmstat_text[] = {
 	"direct_map_level2_splits",
 	"direct_map_level3_splits",
 #endif
+#ifdef CONFIG_PER_VMA_LOCK_STATS
+	"vma_lock_success",
+	"vma_lock_abort",
+	"vma_lock_retry",
+	"vma_lock_miss",
+#endif
 #endif /* CONFIG_VM_EVENT_COUNTERS || CONFIG_MEMCG */
 };
 #endif /* CONFIG_PROC_FS || CONFIG_SYSFS || CONFIG_NUMA || CONFIG_MEMCG */
-- 
2.39.0

