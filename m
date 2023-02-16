Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D584F698C46
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:46:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHP7l4jm8z3g2Q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:46:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=a3wN6yhQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3yrztywykdceprobk8dlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=a3wN6yhQ;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNXW1gfRz3f3f
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:19:07 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-507aac99fdfso8563067b3.11
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nAnyYB3Nw50vBlFaI5emapvq5zyyV08CcfGYNR6eiBY=;
        b=a3wN6yhQzn6ykzBbjResLcztZyUFHxuHfZtRwk9INETFTCK3R+0qznDveEPm+o/T6G
         wJ3wEiieeEUcjgJFPl0Q1WJhoSjHld23FZEQoY2Aq8Bhu2X6QB+bcNMvcqIxTt4gpYGo
         62C0Ezu+RzKHJNHqe8a2WWwzq3BWBtjKwlH9vropbhb+eXqNxVp6cua3PyUJuPb2PSda
         pEBwm4EDV55dFWt5TRT7+9jNt1+V85COwPZnyzclXtLSHEwvb2nMc9rLXuPiU2TfsCi1
         1h3mje1L/1Q/DM34hGjfe9SSEWf4rBhdCLw8Ngy6TcviKT73/jmv3Lf0iRWhfdK1hSLg
         WjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nAnyYB3Nw50vBlFaI5emapvq5zyyV08CcfGYNR6eiBY=;
        b=F7OHO+M3C/OnatxbD2A3T8cQgMKkvy2T40nJTZrRSwAehrfjwtdle7AYGOCD8Qsf0q
         YYFSktErB7VqPyRdcSdlw5tCadzMpAAuRMELRoPnqFvosVVi80zv4isgZEic5b9ywJKQ
         AiwtKr/mAsETMUVzu42BA3dD0YqCqdsmDMiY7fz6DT6WvEnU6Hfui02IJQZTLea8nvU5
         Bl7UCRG5B9kAxwpIfGuTVfvFY49ySMzdJgQom05hcNlkSClJwJsWD97R67v5oxJYTagR
         PkvN4ZygIsoAd10j8CzsAJvOf/d+bH646ezdJm7SPyuoGEDz7BkK8qiz16zwZRL2QGM8
         RxoA==
X-Gm-Message-State: AO0yUKUJ5mqlmca+Si/r5U9QKqguncqHRD03NGsyCkrdtIIlu2ptamMy
	/TZnyKk116eQwb86szKlyf/bLmn5/14=
X-Google-Smtp-Source: AK7set9XJXC8LdbYcGXxryYVlcRlcBZQcF1FMhZd/N4oCcpN8tIB1OMR+nLJJI9Pn7NEIXJu3Q5fjvT0dR0=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a05:6902:18cc:b0:8a3:d147:280b with SMTP id
 ck12-20020a05690218cc00b008a3d147280bmr5ybb.3.1676524746144; Wed, 15 Feb 2023
 21:19:06 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:45 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-31-surenb@google.com>
Subject: [PATCH v3 30/35] mm: introduce per-VMA lock statistics
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
  hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a new CONFIG_PER_VMA_LOCK_STATS config option to dump extra
statistics about handling page fault under VMA lock.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/vm_event_item.h | 6 ++++++
 include/linux/vmstat.h        | 6 ++++++
 mm/Kconfig.debug              | 6 ++++++
 mm/memory.c                   | 2 ++
 mm/vmstat.c                   | 6 ++++++
 5 files changed, 26 insertions(+)

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
index c3547a373c9c..4965a7333a3f 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -279,3 +279,9 @@ config DEBUG_KMEMLEAK_AUTO_SCAN
 
 	  If unsure, say Y.
 
+config PER_VMA_LOCK_STATS
+	bool "Statistics for per-vma locks"
+	depends on PER_VMA_LOCK
+	default y
+	help
+	  Statistics for per-vma locks.
diff --git a/mm/memory.c b/mm/memory.c
index 751aebc1b29f..94194a45ffa7 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5272,6 +5272,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	/* Check if the VMA got isolated after we found it */
 	if (vma->detached) {
 		vma_end_read(vma);
+		count_vm_vma_lock_event(VMA_LOCK_MISS);
 		/* The area was replaced with another one */
 		goto retry;
 	}
@@ -5280,6 +5281,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	return vma;
 inval:
 	rcu_read_unlock();
+	count_vm_vma_lock_event(VMA_LOCK_ABORT);
 	return NULL;
 }
 #endif /* CONFIG_PER_VMA_LOCK */
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
2.39.1

