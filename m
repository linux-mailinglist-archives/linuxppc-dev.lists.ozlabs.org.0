Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4253B6715CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 09:03:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxdZ515Pmz3fJg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 19:03:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KfdJtVwV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KfdJtVwV;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxdVD44zmz3chJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 19:00:36 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso1365825pjf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 00:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqIE8OQntd0W4a4N2kg2lnLwGGF3XcgL5F+Chwm9T4Q=;
        b=KfdJtVwV3zcqhh5famP1bouR06n0PTfilksZbm1hFiESF1H43nvbTHW7Mb75MaGACp
         zxfqqjGqGn88kJjs1uiSW/iHLDh4mIVynPbPCrU6IgmQSUDMRtetaS50F04kKSoGNz9g
         WONXHWze2mU/V3dtxmyHdPzr4FeUSFZg7tJTmveXFrYiPNYRsjHJbd3hg7AjrtA34J5h
         Io7y9+STzomQq1Rz0BArK9zI6oqFyEPUifvhz+IyNLNv5/K9JJDuVyedlkHTRoqirdGz
         Tca1XzhJjeMflbybvMkbUbVUj9LNEmaXTfCe9fq/YPFk+TQN1MRX0mvIM+RvTMI7GgXY
         1JAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqIE8OQntd0W4a4N2kg2lnLwGGF3XcgL5F+Chwm9T4Q=;
        b=YLz5c1z4NXN8TJxe4OLt6qoHo6chihCbs8Q0ghNwMqAIg3ihmktHP+6DwCILBROUUb
         SQCKZzk1F21wtyWoBYV8tf3xZi7AXCE9ss5h5bcw7vCbB60t0GRsq1d2sxJb3ZD7RlRO
         je4D4EUch5U3yzw9ymVLXX5NrlWsEi6kEzcPF3zyHrSAdjUDeUCeM2iNMhsq+SqhFXzU
         07PgZUrQLkIXS7NCenEggTXM1OVLw3FsBkpjaJ/VRUdECwbaGIEaE5CgQecLUTPyJgj4
         RMH/cBgPK4UIVV9DzNHeGZazaZLRwxJ6HP1lEY6ZPsIru/ycvrq1OqfY7CsB4yKBLgy2
         ZzZg==
X-Gm-Message-State: AFqh2kqc5buwME3yLTLZdtWWjh5Iwh4XpbUpP6XyBgKlp24JwXvSjdxh
	X04DlUDEoxFjodrba3ofPvU=
X-Google-Smtp-Source: AMrXdXsdbUkyarSYAzgpmXfctJIjd4K16TFeyd7Cq4zYvGF3a+5S7WArti19aUKfPU+yLC30TT4/9Q==
X-Received: by 2002:a17:90a:4606:b0:226:620b:6ae5 with SMTP id w6-20020a17090a460600b00226620b6ae5mr5974187pjg.22.1674028834284;
        Wed, 18 Jan 2023 00:00:34 -0800 (PST)
Received: from bobo.ibm.com (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090a16c200b002272616d3e1sm738462pje.40.2023.01.18.00.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:00:33 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6 3/5] lazy tlb: shoot lazies, non-refcounting lazy tlb mm reference handling scheme
Date: Wed, 18 Jan 2023 18:00:09 +1000
Message-Id: <20230118080011.2258375-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230118080011.2258375-1-npiggin@gmail.com>
References: <20230118080011.2258375-1-npiggin@gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Nicholas Piggin <npiggin@gmail.com>, linux-mm <linux-mm@kvack.org>, Andy Lutomirski <luto@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On big systems, the mm refcount can become highly contented when doing
a lot of context switching with threaded applications (particularly
switching between the idle thread and an application thread).

Abandoning lazy tlb slows switching down quite a bit in the important
user->idle->user cases, so instead implement a non-refcounted scheme
that causes __mmdrop() to IPI all CPUs in the mm_cpumask and shoot down
any remaining lazy ones.

Shootdown IPIs cost could be an issue, but they have not been observed
to be a serious problem with this scheme, because short-lived processes
tend not to migrate CPUs much, therefore they don't get much chance to
leave lazy tlb mm references on remote CPUs. There are a lot of options
to reduce them if necessary.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/Kconfig  | 15 ++++++++++++
 kernel/fork.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index b07d36f08fea..f7da34e4bc62 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -481,6 +481,21 @@ config ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 # already).
 config MMU_LAZY_TLB_REFCOUNT
 	def_bool y
+	depends on !MMU_LAZY_TLB_SHOOTDOWN
+
+# This option allows MMU_LAZY_TLB_REFCOUNT=n. It ensures no CPUs are using an
+# mm as a lazy tlb beyond its last reference count, by shooting down these
+# users before the mm is deallocated. __mmdrop() first IPIs all CPUs that may
+# be using the mm as a lazy tlb, so that they may switch themselves to using
+# init_mm for their active mm. mm_cpumask(mm) is used to determine which CPUs
+# may be using mm as a lazy tlb mm.
+#
+# To implement this, an arch *must*:
+# - At the time of the final mmdrop of the mm, ensure mm_cpumask(mm) contains
+#   at least all possible CPUs in which the mm is lazy.
+# - It must meet the requirements for MMU_LAZY_TLB_REFCOUNT=n (see above).
+config MMU_LAZY_TLB_SHOOTDOWN
+	bool
 
 config ARCH_HAVE_NMI_SAFE_CMPXCHG
 	bool
diff --git a/kernel/fork.c b/kernel/fork.c
index 9f7fe3541897..263660e78c2a 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -780,6 +780,67 @@ static void check_mm(struct mm_struct *mm)
 #define allocate_mm()	(kmem_cache_alloc(mm_cachep, GFP_KERNEL))
 #define free_mm(mm)	(kmem_cache_free(mm_cachep, (mm)))
 
+static void do_check_lazy_tlb(void *arg)
+{
+	struct mm_struct *mm = arg;
+
+	WARN_ON_ONCE(current->active_mm == mm);
+}
+
+static void do_shoot_lazy_tlb(void *arg)
+{
+	struct mm_struct *mm = arg;
+
+	if (current->active_mm == mm) {
+		WARN_ON_ONCE(current->mm);
+		current->active_mm = &init_mm;
+		switch_mm(mm, &init_mm, current);
+	}
+}
+
+static void cleanup_lazy_tlbs(struct mm_struct *mm)
+{
+	if (!IS_ENABLED(CONFIG_MMU_LAZY_TLB_SHOOTDOWN)) {
+		/*
+		 * In this case, lazy tlb mms are refounted and would not reach
+		 * __mmdrop until all CPUs have switched away and mmdrop()ed.
+		 */
+		return;
+	}
+
+	/*
+	 * Lazy TLB shootdown does not refcount "lazy tlb mm" usage, rather it
+	 * requires lazy mm users to switch to another mm when the refcount
+	 * drops to zero, before the mm is freed. This requires IPIs here to
+	 * switch kernel threads to init_mm.
+	 *
+	 * archs that use IPIs to flush TLBs can piggy-back that lazy tlb mm
+	 * switch with the final userspace teardown TLB flush which leaves the
+	 * mm lazy on this CPU but no others, reducing the need for additional
+	 * IPIs here. There are cases where a final IPI is still required here,
+	 * such as the final mmdrop being performed on a different CPU than the
+	 * one exiting, or kernel threads using the mm when userspace exits.
+	 *
+	 * IPI overheads have not found to be expensive, but they could be
+	 * reduced in a number of possible ways, for example (roughly
+	 * increasing order of complexity):
+	 * - The last lazy reference created by exit_mm() could instead switch
+	 *   to init_mm, however it's probable this will run on the same CPU
+	 *   immediately afterwards, so this may not reduce IPIs much.
+	 * - A batch of mms requiring IPIs could be gathered and freed at once.
+	 * - CPUs store active_mm where it can be remotely checked without a
+	 *   lock, to filter out false-positives in the cpumask.
+	 * - After mm_users or mm_count reaches zero, switching away from the
+	 *   mm could clear mm_cpumask to reduce some IPIs, perhaps together
+	 *   with some batching or delaying of the final IPIs.
+	 * - A delayed freeing and RCU-like quiescing sequence based on mm
+	 *   switching to avoid IPIs completely.
+	 */
+	on_each_cpu_mask(mm_cpumask(mm), do_shoot_lazy_tlb, (void *)mm, 1);
+	if (IS_ENABLED(CONFIG_DEBUG_VM))
+		on_each_cpu(do_check_lazy_tlb, (void *)mm, 1);
+}
+
 /*
  * Called when the last reference to the mm
  * is dropped: either by a lazy thread or by
@@ -791,6 +852,10 @@ void __mmdrop(struct mm_struct *mm)
 
 	BUG_ON(mm == &init_mm);
 	WARN_ON_ONCE(mm == current->mm);
+
+	/* Ensure no CPUs are using this as their lazy tlb mm */
+	cleanup_lazy_tlbs(mm);
+
 	WARN_ON_ONCE(mm == current->active_mm);
 	mm_free_pgd(mm);
 	destroy_context(mm);
-- 
2.37.2

