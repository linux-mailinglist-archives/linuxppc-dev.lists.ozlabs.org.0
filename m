Return-Path: <linuxppc-dev+bounces-1407-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5ED97A21F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2024 14:23:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6kbm19jYz2yT0;
	Mon, 16 Sep 2024 22:23:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726489428;
	cv=none; b=K1U+8EokKnb592UwwZ9CjsFdJSsMjvSz099Pz4Ti5T3jsRfXuofWIMXz6+jlVzn6xw46DEUfcNWhLJtn5+TUDtBqrA4BOoPAkAx/WqO67VkVN/gy1tuttyKqVreZJwXsymusZJ4412WJY4cbV4w9adYKYS54wPXwdv/ETnvZcH2KzW7TmAV4TbcUWkCbBPIgQ5yiboS7+XGorfpLW4utDQg4Uw5UD7cTEzvoqnpMg1CtIgk1XSvb5L5u7ExBFcYgZUulm6WORaqu2LRR+36nd10e5i1LQKru4vALO2qOyqSVSqq+9iYSWC2DLsPczHUZlRZFOBL1BXVxHeauiODxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726489428; c=relaxed/relaxed;
	bh=dDfojy5CrgHlgs0fxt38qSv2a++PUan1QC4a76dOnDc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6y/TaBHxglSpM3HlBQFK8zIhtdB6mFwh7avZ2NMRNp0XDnlNqEcyqZJMLV7CgvgDWIsRwk9mTzOCHKprTXyMqJoyXAOpoVvuyml+SEkzQnJz7V/fy4b7G0hewjhvzVzLBJJy1F2lny4IAIrq9h5FebQElCTXm6QPl0QMjCdDyYE1aITPPYK5RlcVq3IhxFG+3BVmBEXCKtmjE7WR4uw8XMdhrhtxCXFasuTxBqsDhVmVWivRAKG9yzG/R6h4btYrZBg2ojImFObw7mCOcM9Nzd/+fQzdEtLDirusyEiVvPiQ60BPw4SS7fClS84oj3VflNGA1Lk/BWaxuyMgVDFnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=redhat.com; spf=pass (client-ip=209.85.221.49; helo=mail-wr1-f49.google.com; envelope-from=constantine.shulyupin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.49; helo=mail-wr1-f49.google.com; envelope-from=constantine.shulyupin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6kbl3sRFz2yS0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 22:23:47 +1000 (AEST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-374c180d123so1810325f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 05:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726489425; x=1727094225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDfojy5CrgHlgs0fxt38qSv2a++PUan1QC4a76dOnDc=;
        b=ISGLFWJEj4QmFuy1cB7RV8lGfYutNSly2JNjs187I6fRflkmrSNEow6ZLJ8s9MVf8E
         /7qTW3SCEAgIAhIfoIf04T6DWlty0dJwqrjVuCFuPzgiRsKojV85o7LeItDXaWtH7fKL
         HQbzs8X1HCuV9atmUlma0qSVoEtRJ6fSmwvUymPOlD8JJQKdzN19K4VF/Jm2/BRxA5sY
         pfLJS6PAbz/IAaRcwqcvqZ0mjznGaZRZVLzrcIRv78nQgFGvb1i7DHPlX/yEOmQoGq1M
         O9zhVT0xkj9lTCjoKl4KYlgeQqW3XPoM51XCIOfjFUoa80BO7bkqRO8sdR9Zdb3uD2WN
         PIWg==
X-Forwarded-Encrypted: i=1; AJvYcCUrhH7WB2wQO9gvKxSpfidogFzhTHACqiPjCahu/NQiQyphuJYE8sN9zEe87y5subhgcVdh1ITyklI5jAw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx/F9ErgClG7zUgzanc7VnYxXsFjHcylIBofXSf/g9mzHRl/TNr
	iik+oymXzGiFOjaK7rK/xnayrh8Aw0/JBXa+zkw9vfb2R7TCaMtf
X-Google-Smtp-Source: AGHT+IFx/jTnwae8GjD9s+HXc1nBltwBGmeNBzQI1ep4kLkettAY/xLPtxREJvJrF8iUt004m0leaQ==
X-Received: by 2002:a5d:4a52:0:b0:374:bde6:d375 with SMTP id ffacd0b85a97d-378d61f0d54mr5541099f8f.29.1726489424339;
        Mon, 16 Sep 2024 05:23:44 -0700 (PDT)
Received: from costa-tp.. ([2a00:a041:e281:f300:ddd7:8878:b93d:7c0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7800243sm7117272f8f.86.2024.09.16.05.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 05:23:43 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: longman@redhat.com,
	ming.lei@redhat.com,
	pauld@redhat.com,
	juri.lelli@redhat.com,
	vschneid@redhat.com,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Zefan Li <lizefan.x@bytedance.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [RFC PATCH v3 2/3] genirq/cpuhotplug: Adjust managed irqs according to change of housekeeping CPU
Date: Mon, 16 Sep 2024 15:20:43 +0300
Message-ID: <20240916122044.3056787-3-costa.shul@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240916122044.3056787-1-costa.shul@redhat.com>
References: <20240916122044.3056787-1-costa.shul@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Interrupts disturb real-time tasks on affined cpus.
To ensure CPU isolation for real-time tasks, interrupt handling must
be adjusted accordingly.
Non-managed interrupts can be configured from userspace,
while managed interrupts require adjustments in kernelspace.

Adjust status of managed interrupts according change
of housekeeping CPUs to support dynamic CPU isolation.

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>

---

The following code is a proof of concept to validate
and review the correctness of the approach to solving the problem.

C++ comments denote temporary comments.

v2:
- refactor irq_affinity_adjust():
- add more comments
- add managed_irq_isolate() derived from migrate_one_irq(),
  irq_needs_fixup() and irq_fixup_move_pending()
- use irq_set_affinity() instead of irq_set_affinity_locked
- Addressed Gleixner's comments:
- use `struct cpumask *` instead of `cpumask_var_t` in function signature
- remove locking in irq_affinity_adjust()

v1:
- https://lore.kernel.org/lkml/20240516190437.3545310-5-costa.shul@redhat.com/
---
 include/linux/irq.h      |  2 +
 kernel/cgroup/cpuset.c   |  1 +
 kernel/irq/cpuhotplug.c  | 95 ++++++++++++++++++++++++++++++++++++++++
 kernel/sched/isolation.c | 10 ++++-
 4 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index fa711f80957b6..4eb2e765dbd95 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -619,6 +619,8 @@ extern int irq_affinity_online_cpu(unsigned int cpu);
 # define irq_affinity_online_cpu	NULL
 #endif
 
+int managed_irq_affinity_adjust(struct cpumask *enable_mask);
+
 #if defined(CONFIG_SMP) && defined(CONFIG_GENERIC_PENDING_IRQ)
 void __irq_move_irq(struct irq_data *data);
 static inline void irq_move_irq(struct irq_data *data)
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index bf60bdc973dd6..73b06b2cd91e3 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -90,6 +90,7 @@ static struct list_head remote_children;
 #define HOUSEKEEPING_FLAGS	(BIT(HK_TYPE_TIMER)  | BIT(HK_TYPE_RCU)  |\
 				 BIT(HK_TYPE_SCHED)  | BIT(HK_TYPE_MISC) |\
 				 BIT(HK_TYPE_DOMAIN) | BIT(HK_TYPE_WQ)   |\
+				 BIT(HK_TYPE_MANAGED_IRQ) |\
 				 BIT(HK_TYPE_KTHREAD))
 
 /*
diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
index ec2cdcd20bee7..adbe1f3e5bd22 100644
--- a/kernel/irq/cpuhotplug.c
+++ b/kernel/irq/cpuhotplug.c
@@ -252,3 +252,98 @@ int irq_affinity_online_cpu(unsigned int cpu)
 
 	return 0;
 }
+
+/*
+ * managed_irq_isolate() - Deactivate managed interrupts if necessary
+ */
+// derived from migrate_one_irq, irq_needs_fixup, irq_fixup_move_pending
+static int managed_irq_isolate(struct irq_desc *desc)
+{
+	struct irq_data *d = irq_desc_get_irq_data(desc);
+	struct irq_chip *chip = irq_data_get_irq_chip(d);
+	const struct cpumask *a;
+	bool maskchip;
+	int err;
+
+	/*
+	 * Deactivate if:
+	 * - Interrupt is managed
+	 * - Interrupt is not per cpu
+	 * - Interrupt is started
+	 * - Effective affinity mask includes isolated CPUs
+	 */
+	if (!irqd_affinity_is_managed(d) || irqd_is_per_cpu(d) || !irqd_is_started(d)
+	    || cpumask_subset(irq_data_get_effective_affinity_mask(d),
+			      housekeeping_cpumask(HK_TYPE_MANAGED_IRQ)))
+		return 0;
+	// TBD: it is required?
+	/*
+	 * Complete an eventually pending irq move cleanup. If this
+	 * interrupt was moved in hard irq context, then the vectors need
+	 * to be cleaned up. It can't wait until this interrupt actually
+	 * happens and this CPU was involved.
+	 */
+	irq_force_complete_move(desc);
+
+	if (irqd_is_setaffinity_pending(d)) {
+		irqd_clr_move_pending(d);
+		if (cpumask_intersects(desc->pending_mask,
+		    housekeeping_cpumask(HK_TYPE_MANAGED_IRQ)))
+			a = irq_desc_get_pending_mask(desc);
+	} else {
+		a = irq_data_get_affinity_mask(d);
+	}
+
+	maskchip = chip->irq_mask && !irq_can_move_pcntxt(d) && !irqd_irq_masked(d);
+	if (maskchip)
+		chip->irq_mask(d);
+
+	if (!cpumask_intersects(a, housekeeping_cpumask(HK_TYPE_MANAGED_IRQ))) {
+		/*
+		 * Shut managed interrupt down and leave the affinity untouched.
+		 * The effective affinity is reset to the first online CPU.
+		 */
+		irqd_set_managed_shutdown(d);
+		irq_shutdown_and_deactivate(desc);
+		return 0;
+	}
+
+	/*
+	 * Do not set the force argument of irq_do_set_affinity() as this
+	 * disables the masking of offline CPUs from the supplied affinity
+	 * mask and therefore might keep/reassign the irq to the outgoing
+	 * CPU.
+	 */
+	err = irq_do_set_affinity(d, a, false);
+	if (err)
+		pr_warn_ratelimited("IRQ%u: set affinity failed(%d).\n",
+				    d->irq, err);
+
+	if (maskchip)
+		chip->irq_unmask(d);
+
+	return err;
+}
+
+/** managed_irq_affinity_adjust() - Deactivate of restore managed interrupts
+ * according to change of housekeeping cpumask.
+ *
+ * @enable_mask:	CPUs for which interrupts should be restored
+ */
+int managed_irq_affinity_adjust(struct cpumask *enable_mask)
+{
+	unsigned int irq;
+
+	for_each_active_irq(irq) {
+		struct irq_desc *desc = irq_to_desc(irq);
+		unsigned int cpu;
+
+		for_each_cpu(cpu, enable_mask)
+			irq_restore_affinity_of_irq(desc, cpu);
+		raw_spin_lock(&desc->lock);
+		managed_irq_isolate(desc);
+		raw_spin_unlock(&desc->lock);
+	}
+
+	return 0;
+}
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 3f24921b929a0..cd72300ec8b99 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -130,6 +130,8 @@ static void __init housekeeping_setup_type(enum hk_type type,
  */
 static int housekeeping_update(enum hk_type type, const struct cpumask *update)
 {
+	int err = 0;
+
 	struct {
 		struct cpumask changed;
 		struct cpumask enable;
@@ -149,9 +151,15 @@ static int housekeeping_update(enum hk_type type, const struct cpumask *update)
 	if (!static_branch_unlikely(&housekeeping_overridden))
 		static_key_enable_cpuslocked(&housekeeping_overridden.key);
 
+	switch (type) {
+	case HK_TYPE_MANAGED_IRQ:
+		err = managed_irq_affinity_adjust(&masks->enable);
+		break;
+	default:
+	}
 	kfree(masks);
 
-	return 0;
+	return err;
 }
 
 static int __init housekeeping_setup(char *str, unsigned long flags)
-- 
2.45.0


