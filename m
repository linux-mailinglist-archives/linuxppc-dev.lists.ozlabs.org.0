Return-Path: <linuxppc-dev+bounces-1406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6448297A21C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2024 14:23:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6kbH2w9dz2y7J;
	Mon, 16 Sep 2024 22:23:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726489403;
	cv=none; b=UU6mP6l2bGCvLrUyLLwcKkfHynMLbOtCNuO3l1SNsAB90nuWgK4gaHb+1Kj+XqXkRWhxDz8Fhj4X3S5RZqu8xuBiPCB2Vmxq4qxLmfkWicFtLMs9SqQCFS1u1bgDYjCw01LHLeRIuk1l+/C9vhzwU01uveEsMvVcR+K1F+eu32J4aKmmHPmuw0L2pUUWlRDVGjCNN5DrTscl36u4mHwG+vNJ+a7ceGhCig23kx9cFeQJ43V092ULiXtI1jtFt+M2nCRbJ6LxqjMe/S7rw7URMiG5zEEoQNI2IxDrjjpLLG+j7CwNb7o6HTXzOjAW8xjaeqeohW4a52uj5/Gxr6nTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726489403; c=relaxed/relaxed;
	bh=4XP7JYTPswuC1MNC97EWdOwUS12t/7UGSoTDEE9+Gmw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CrfUyTK3ophuiH7nY6LNcFeAxBrYOBtxuobc1Q7pbi42MwLoMsYYa1ck4OOmlufkx7DKzeGWlmRLDfKzRR8ydiUkEM31yXNGBHSzdzi4fqYQPlo+NFT8G0QbFPLEXp3YwvdKzICANrjZCO0/vSHiOLtGydUJGn+kqFt0iOP8/+vcsHM3h7srKW6Y0DkUiuIRvpi3OWxu+Wd3vzEhiKvTJFGBNy9NOuJR8RSKR4JlAxonWNtzO44U43cujXdbsrzsr5/rduGq4QYDXwCgpso2UngWhBVcBy8q+8A4KKT8HLoQiUOxRLi3p1vCXWNohfGN5z31O0rc1I9szQYyaoEstQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=redhat.com; spf=pass (client-ip=209.85.128.43; helo=mail-wm1-f43.google.com; envelope-from=constantine.shulyupin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.43; helo=mail-wm1-f43.google.com; envelope-from=constantine.shulyupin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6kbG6RbSz2xkr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 22:23:22 +1000 (AEST)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb58d810eso33802095e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 05:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726489399; x=1727094199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XP7JYTPswuC1MNC97EWdOwUS12t/7UGSoTDEE9+Gmw=;
        b=GhVIWNi1xxYeDJxgJo5gPVEiDVOqFtTUJ56D3dXzm/uALXf9dJb3gD5UrsTQRtqNhy
         1+Ef59Onxmq2oHbBjBOSypdL/O+K83xkQyQXatHn2xY3+tXRJhNRRDC7Rhu77USUSAT5
         9rVsyTnsBp+neQZAJLFRhN0BARfPhMA6aLqpXFIMcWb2dE4yfga3bYPpVMTW8QY4nklP
         mY5W5fRXwvY6I7pVAXpICfW2nQ+5PmPIoA66aIueVum7uOhYQ5dYu1wPomljJIktItvz
         7SMJOwTc+X3yfeaPS23W/t3QmeD91AVH+zBATeyMfDZQRbYO1x5sQ8BE18hN81yMa0oG
         yKcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKoH4X5hYLIebH60JJ0BaymYbvsQPumL+KBm/ATMIuDFNdvQa9VlXQWdfpIGzo7iI8pMbZvd7//e0dqQs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwwUamgqUY+2Mjd/TNPxlvgqDNXDY5Pcp7aPn6enWbaQUmWiSEF
	POhgQqwzIrOa9goIfpJXqHUPx3hUw2TOl5sdJ/CynjR0mWwtMYGA
X-Google-Smtp-Source: AGHT+IFNI4iYpjMKYAcaWjWoU/iNfgpzX74OJKJcuWhd59WCiBCwFyoNGw6iT8rIvbAFpRO0GYaD9w==
X-Received: by 2002:a5d:4d51:0:b0:374:d2a3:d213 with SMTP id ffacd0b85a97d-378c27b4d25mr8711614f8f.18.1726489399460;
        Mon, 16 Sep 2024 05:23:19 -0700 (PDT)
Received: from costa-tp.. ([2a00:a041:e281:f300:ddd7:8878:b93d:7c0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7800243sm7117272f8f.86.2024.09.16.05.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 05:23:18 -0700 (PDT)
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
Subject: [RFC PATCH v3 1/3] sched/isolation: Add infrastructure for dynamic CPU isolation
Date: Mon, 16 Sep 2024 15:20:42 +0300
Message-ID: <20240916122044.3056787-2-costa.shul@redhat.com>
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

Introduce infrastructure function housekeeping_update() to change
housekeeping_cpumask during runtime and adjust configurations of depended
subsystems.

Configuration adjustments of subsystems follow in subsequent patches.

Parent patch:
sched/isolation: Exclude dynamically isolated CPUs from housekeeping masks
https://lore.kernel.org/lkml/20240821142312.236970-1-longman@redhat.com/

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>

---
Changes in v2:
- remove unnecessary `err` variable
- add for_each_clear_bit... to clear isolated CPUs
- Address Gleixner's comments:
- use WRITE_ONCE to change housekeeping.flags
- use `struct cpumask *update` in signature of housekeeping_update

v1:
- https://lore.kernel.org/lkml/20240516190437.3545310-2-costa.shul@redhat.com/
---
 kernel/sched/isolation.c | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 3018ba81eb65d..3f24921b929a0 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -124,6 +124,36 @@ static void __init housekeeping_setup_type(enum hk_type type,
 		     housekeeping_staging);
 }
 
+/*
+ * housekeeping_update - change housekeeping.cpumasks[type] and propagate the
+ * change.
+ */
+static int housekeeping_update(enum hk_type type, const struct cpumask *update)
+{
+	struct {
+		struct cpumask changed;
+		struct cpumask enable;
+		struct cpumask disable;
+	} *masks;
+
+	masks = kmalloc(sizeof(*masks), GFP_KERNEL);
+	if (!masks)
+		return -ENOMEM;
+
+	lockdep_assert_cpus_held();
+	cpumask_xor(&masks->changed, housekeeping_cpumask(type), update);
+	cpumask_and(&masks->enable, &masks->changed, update);
+	cpumask_andnot(&masks->disable, &masks->changed, update);
+	cpumask_copy(housekeeping.cpumasks[type], update);
+	WRITE_ONCE(housekeeping.flags, housekeeping.flags | BIT(type));
+	if (!static_branch_unlikely(&housekeeping_overridden))
+		static_key_enable_cpuslocked(&housekeeping_overridden.key);
+
+	kfree(masks);
+
+	return 0;
+}
+
 static int __init housekeeping_setup(char *str, unsigned long flags)
 {
 	cpumask_var_t non_housekeeping_mask, housekeeping_staging;
@@ -327,8 +357,11 @@ int housekeeping_exlude_isolcpus(const struct cpumask *isolcpus, unsigned long f
 		/*
 		 * Reset housekeeping to bootup default
 		 */
+
+		for_each_clear_bit(type, &boot_hk_flags, HK_TYPE_MAX)
+			housekeeping_update(type, cpu_possible_mask);
 		for_each_set_bit(type, &boot_hk_flags, HK_TYPE_MAX)
-			cpumask_copy(housekeeping.cpumasks[type], boot_hk_cpumask);
+			housekeeping_update(type, boot_hk_cpumask);
 
 		WRITE_ONCE(housekeeping.flags, boot_hk_flags);
 		if (!boot_hk_flags && static_key_enabled(&housekeeping_overridden))
@@ -355,9 +388,8 @@ int housekeeping_exlude_isolcpus(const struct cpumask *isolcpus, unsigned long f
 		cpumask_andnot(tmp_mask, src_mask, isolcpus);
 		if (!cpumask_intersects(tmp_mask, cpu_online_mask))
 			return -EINVAL;	/* Invalid isolated CPUs */
-		cpumask_copy(housekeeping.cpumasks[type], tmp_mask);
+		housekeeping_update(type, tmp_mask);
 	}
-	WRITE_ONCE(housekeeping.flags, boot_hk_flags | flags);
 	excluded = true;
 	if (!static_key_enabled(&housekeeping_overridden))
 		static_key_enable_cpuslocked(&housekeeping_overridden.key);
-- 
2.45.0


