Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 719995A9E6E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:48:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJT6G12hgz3fsr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:48:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=H4jFJ8Dt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3je0qywykdmo8a7u3rw44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=H4jFJ8Dt;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSrj58wkz2ywm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:36:16 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-33ef3e5faeeso228812757b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=r+vF5Lo2i1OjVhetiEIJ/9q6C9lfd71c3zrmx7NgTrs=;
        b=H4jFJ8Dt7ZH5cKrXQpN0z8PEygipTnxhDURDwP2r/L6ST1buj0wC6b62XAFXTWTuHE
         TRectVq93AO6tGT7OX1/aI7LFkcRGjFnJwRUud+1aazBY2txe7GqBy/qCAKx7DzAzI1F
         08tbsOZGFue1vB/xCd7zDPTLBCjfhCGGnp6kgmw7nw7+o4krMVIGwx+wiyWeS1/K9dS3
         MY2rAdmwbAo0HfcpKpUrJZgpdcga0Ob80OnRbMBFu5K9+oe2e9P/nHO4ZkzgpYkHj1ef
         kx644FtyUEEJInyDO+nYaup+HokzUzXjSdh7on7VQkqKFKRY8gzUfUlLXLq38fi2PNgi
         LbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=r+vF5Lo2i1OjVhetiEIJ/9q6C9lfd71c3zrmx7NgTrs=;
        b=K/y2tEelqNw2R2TaylD9APHXgWrx0ccbWYH0MPRDq+fOWtt9DcyuVK07eybQTABcdO
         UCYiwHz61JRt4WbU2JE8A4asuJ1a0xU3ch1YqAO0j2h4j/Hsbg53WDkV0FhnWTPvzed3
         UuWyTX63tLgjflYS9W9jv9Hhw8zcO86Y8jg5ybDRBnhwSNkDR37siwV8w5BqCVf4VlAK
         kV+a5ETJU+GmcmwzgNEFlJMefWW+E8C0vCvarSugVx+s5Um4E7lp61hRT0Oo4rm3Rd9p
         /cjWpqm/uvhNkQRR+ISpGGbA79tajTPbb0tstTHJrwiQcSxV+TEqcDj8wNKb/C1+ZgSZ
         JUWQ==
X-Gm-Message-State: ACgBeo2sUQxYRBis6Tetshm7F7jVYGOyqr+2iHSSBlk/pkqpbLO0wZg7
	173AapSCsS+LbpOXMjZy4lxWmZoBYBc=
X-Google-Smtp-Source: AA6agR4BDUj9pfWqCFb+xsqUI8F9TUy99Q1kXWNSZ/lAe4Y/IzT7ZfeAPxwUhMVzFJvC8KeIfmdI79dhOFA=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a25:8d05:0:b0:68e:c838:c24a with SMTP id
 n5-20020a258d05000000b0068ec838c24amr19294531ybl.45.1662053773853; Thu, 01
 Sep 2022 10:36:13 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:08 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-21-surenb@google.com>
Subject: [RFC PATCH RESEND 20/28] mm: introduce per-VMA lock statistics
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
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
index f3fc36cd2276..a325783ed05d 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -150,6 +150,12 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
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
index bfe38869498d..0c2611899cfc 100644
--- a/include/linux/vmstat.h
+++ b/include/linux/vmstat.h
@@ -131,6 +131,12 @@ static inline void vm_events_fold_cpu(int cpu)
 #define count_vm_vmacache_event(x) do {} while (0)
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
index ce8dded36de9..075642763a03 100644
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
+	help
+	  Statistics for per-vma locks.
+	  If in doubt, say N.
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 90af9a8572f5..3f3804c846a6 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1411,6 +1411,12 @@ const char * const vmstat_text[] = {
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
2.37.2.789.g6183377224-goog

