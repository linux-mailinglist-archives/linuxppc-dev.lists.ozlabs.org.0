Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2574C5A56D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:13:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGl7d09Nbz3f9P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:13:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=R4f3AmhY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=38y4nywykdkqwyvirfksskpi.gsqpmrybttg-hizpmwxw.sdpefw.svk@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=R4f3AmhY;
	dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk5K2qTyz3blf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:26:13 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id y9-20020a17090322c900b00174c881abaeso2531556plg.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=bUksEMWzQ2sQtj6CAseSDP7Wnd3Y9YWuXlHuoAiHS/w=;
        b=R4f3AmhYQvfrJmCukv/e3Nij13PuVUa8k8O646df0PoObwBnO/xDcemk6+SqKXvVGr
         hJkm2649shhdYcclI4xYPbiKHXEe7XEvjq6ebwkp6YZFsZtQX3MH5xTV757BPS7Zeyib
         IALyiqYSG4f0kCJDHQ3+fMXa5F0OzkQKlh2EgahzIDAp6HMSPtfd8qN17COdyNthUkyK
         vH/w1n6XgnYHxRHIzAjyfQH31twkRddq+jpJViGP9dMWFd2ba2cwGPVTVH8mdAvdjCY4
         84OD9xZ4r8HlzIfM65gveSjGxaILhsxn9vJXDz/VODVoOMzJt9RI4cwlcbKnFfX3PjSN
         BY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=bUksEMWzQ2sQtj6CAseSDP7Wnd3Y9YWuXlHuoAiHS/w=;
        b=MxyG1LPPPVnUno7UZqjzUGUw/H4WONtaDHDv7uY8eAbfp2JVLyZshmLYNIRDwp5Psc
         kG272KCnQmxlPaebH4mhqoa/LS7qK07fKcUYZMo8Z5zuYgftjpnMSYPfDOueSwCeypQ8
         sr255jBHLWH/7rNNOYa5TH+XG5EBAjE/aRLArtzzZLe3EO5FV0NFJoEGQYr1k56nV8rE
         o3zeJRPYB3OZ4HmFZkY4ljMcl+ZORKalkwt2xYU/TL2RP26UfyvL+769JtHe3XWT5ueN
         ijTa4mEDt2aioGxHPRwTcecsMjQCESwLQwCY4t9cZVSlRRUT7n6kP26yN+lL+RDHtVHP
         6cXQ==
X-Gm-Message-State: ACgBeo3X54UF2XvAZ4lkccI1zCn9bYY6H2/iq4B2+ZGGIYPGDEqWlE8Q
	kKUCHZxWF80jOE3m9/A2AnUvhi2WS2c=
X-Google-Smtp-Source: AA6agR4CSgZfYughTw1oP2TGtJ/Gx4qpWPKVumSGbjZh4UG9V5skHPeijnTVviS5CargVPsvloUs2cN/SRk=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a17:90b:2c11:b0:1fd:e56c:79de with SMTP id
 rv17-20020a17090b2c1100b001fde56c79demr4481996pjb.201.1661808371494; Mon, 29
 Aug 2022 14:26:11 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:23 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-21-surenb@google.com>
Subject: [RFC PATCH 20/28] mm: introduce per-VMA lock statistics
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Aug 2022 08:01:45 +1000
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, riel@surriel.com, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, mgorman@techsingularity.net
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
2.37.2.672.g94769d06f0-goog

