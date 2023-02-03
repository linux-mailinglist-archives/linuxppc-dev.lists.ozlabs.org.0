Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AE26890B1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 08:22:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7Rtq6Sgqz3fCG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 18:22:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pLnnqDRI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pLnnqDRI;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Rq52RMlz3f6l
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 18:19:13 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id r8so4423071pls.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Feb 2023 23:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUGCesZ+ECKfxuO6+UdvSldGg8VBbbvoIh7jdtjrlkU=;
        b=pLnnqDRIDYF0X+7odeq2MLz8sT29lO0h9nXJRzhqSWb2cKDmw+AjnJVXwKX4LO0+YN
         sy6TWCVWrrhdAqdi0Athmqz7hnxbv9sXhy7zHgw5JMbTMALz+lrRMnA7mhKMW0UOaN3X
         QCHhXYJFOAJf6mMzTg6U9SYCB0rngQkrXqgCC9sJi9COvb9A1wQ5Pk8YAxIHPyyrhAK8
         45tFQTFNKq2y3gE/ag6BjXudpVKSfK+TUTK3G6sll8axgwNiKP1UqpP4lrWqQnLzlWn0
         p2jjdVOgV/IsArGVMlzfnf1uVgzpoRPyeV1+V87NiHGnhmhY+aWACx4xhLz/DXOY+iS+
         dKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUGCesZ+ECKfxuO6+UdvSldGg8VBbbvoIh7jdtjrlkU=;
        b=t1S1vwR+xbPr7IjUAKq3bmi8yAamVZAgV4oTEcgJ3pj9Y4+3OcF5VZquJOrIYXNiF/
         ZkMvrwKmXlAxPveTj4xLMeo1SBJYzqI9EEKQSbxTgIWh/lQnVQwdcHBzmHJ2CrR1Zjxx
         lYtiP5dROWuK9sA6uBcIr0I76ukFn2EcwaTcEK8DYN3SOtG9W2O7L4IBJ3y2sDgIMJBA
         8auxxJqVCQrJLEwdLZ0ED9PRc6w+VnioMl0Wgz8eLFfGXywOwcIQy9M9LgbxEeL9kKB8
         ldDYmMtPr+9z9HgXbZQlq/quglBLNoqX5KtV6WKQExbfqSAQM+fcukgm5wFBtTuqEMkh
         lj9w==
X-Gm-Message-State: AO0yUKXo05z/Ev1yT422VI2shW88mLFIkqyyS8lAHC0IyJeHtfzYQFVh
	2JJ/gQDjbWYS8c98J1QQZ0c=
X-Google-Smtp-Source: AK7set9Pa1+UA0tNLvIosl6qOQXe2T4uQwVT+pZWT/dLmS0GvpN8PpOxJcaipNBn1b+VrjOFZQErtw==
X-Received: by 2002:a05:6a21:78a9:b0:be:a944:b07f with SMTP id bf41-20020a056a2178a900b000bea944b07fmr12686834pzc.61.1675408751037;
        Thu, 02 Feb 2023 23:19:11 -0800 (PST)
Received: from bobo.ibm.com (193-116-117-77.tpgi.com.au. [193.116.117.77])
        by smtp.gmail.com with ESMTPSA id f20-20020a637554000000b004df4ba1ebfesm877558pgn.66.2023.02.02.23.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 23:19:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 3/5] lazy tlb: allow lazy tlb mm refcounting to be configurable
Date: Fri,  3 Feb 2023 17:18:35 +1000
Message-Id: <20230203071837.1136453-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203071837.1136453-1-npiggin@gmail.com>
References: <20230203071837.1136453-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Rik van Riel <riel@redhat.com>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Nadav Amit <nadav.amit@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add CONFIG_MMU_TLB_REFCOUNT which enables refcounting of the lazy tlb mm
when it is context switched. This can be disabled by architectures that
don't require this refcounting if they clean up lazy tlb mms when the
last refcount is dropped. Currently this is always enabled, so the patch
introduces no functional change.

Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 Documentation/mm/active_mm.rst |  6 ++++++
 arch/Kconfig                   | 17 +++++++++++++++++
 include/linux/sched/mm.h       | 18 +++++++++++++++---
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/Documentation/mm/active_mm.rst b/Documentation/mm/active_mm.rst
index 6f8269c284ed..0114d80d406a 100644
--- a/Documentation/mm/active_mm.rst
+++ b/Documentation/mm/active_mm.rst
@@ -4,6 +4,12 @@
 Active MM
 =========
 
+Note, the mm_count refcount may no longer include the "lazy" users
+(running tasks with ->active_mm == mm && ->mm == NULL) on kernels
+with CONFIG_MMU_LAZY_TLB_REFCOUNT=n. Taking and releasing these lazy
+references must be done with mmgrab_lazy_tlb() and mmdrop_lazy_tlb()
+helpers, which abstract this config option.
+
 ::
 
  List:       linux-kernel
diff --git a/arch/Kconfig b/arch/Kconfig
index 12e3ddabac9d..11e8915c0652 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -465,6 +465,23 @@ config ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	  irqs disabled over activate_mm. Architectures that do IPI based TLB
 	  shootdowns should enable this.
 
+# Use normal mm refcounting for MMU_LAZY_TLB kernel thread references.
+# MMU_LAZY_TLB_REFCOUNT=n can improve the scalability of context switching
+# to/from kernel threads when the same mm is running on a lot of CPUs (a large
+# multi-threaded application), by reducing contention on the mm refcount.
+#
+# This can be disabled if the architecture ensures no CPUs are using an mm as a
+# "lazy tlb" beyond its final refcount (i.e., by the time __mmdrop frees the mm
+# or its kernel page tables). This could be arranged by arch_exit_mmap(), or
+# final exit(2) TLB flush, for example.
+#
+# To implement this, an arch *must*:
+# Ensure the _lazy_tlb variants of mmgrab/mmdrop are used when manipulating
+# the lazy tlb reference of a kthread's ->active_mm (non-arch code has been
+# converted already).
+config MMU_LAZY_TLB_REFCOUNT
+	def_bool y
+
 config ARCH_HAVE_NMI_SAFE_CMPXCHG
 	bool
 
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 5376caf6fcf3..689dbe812563 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -82,17 +82,29 @@ static inline void mmdrop_sched(struct mm_struct *mm)
 /* Helpers for lazy TLB mm refcounting */
 static inline void mmgrab_lazy_tlb(struct mm_struct *mm)
 {
-	mmgrab(mm);
+	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT))
+		mmgrab(mm);
 }
 
 static inline void mmdrop_lazy_tlb(struct mm_struct *mm)
 {
-	mmdrop(mm);
+	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT)) {
+		mmdrop(mm);
+	} else {
+		/*
+		 * mmdrop_lazy_tlb must provide a full memory barrier, see the
+		 * membarrier comment finish_task_switch which relies on this.
+		 */
+		smp_mb();
+	}
 }
 
 static inline void mmdrop_lazy_tlb_sched(struct mm_struct *mm)
 {
-	mmdrop_sched(mm);
+	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT))
+		mmdrop_sched(mm);
+	else
+		smp_mb(); /* see mmdrop_lazy_tlb() above */
 }
 
 /**
-- 
2.37.2

