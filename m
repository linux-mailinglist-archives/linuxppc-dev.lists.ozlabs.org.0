Return-Path: <linuxppc-dev+bounces-12025-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA9DB528DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 08:35:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMnqW3JFXz2yx7;
	Thu, 11 Sep 2025 16:35:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757572519;
	cv=none; b=ayQkmrRLffnNjV5GLEIXnaXVrfPUPnaU7gE3+Mvyt0RQALPD0F0sDzm1MuUYEHH8kbIyPoGAQJk7msXouqkSLRD034xRmfdpSR64V7G+9SQxh1zrbMF08yzJw9E7bbMFvesGqX/WJl2uGBtBUDbaPvrDAUiLY4YceQL8xnRpcxJPkGgzMDYRqKZ3Reag4K452d7RSH5/DRLllmAjsADT9Pn7Jo6cMObvQIQ+xf/b/8g2h+2szkOkVFYyXccHAd2JnZqzs/Sy3mSGG+/uJaTTDt/7QfI9Yan7X+fnSQfKT/Lu9kAb/z2+JSeT0XlZoYvEA4fKSmbLj5EP8uxk2IP3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757572519; c=relaxed/relaxed;
	bh=E4k0tlet2kMrmLN5WuJAE4ZIpTFmj8o1oOF7VR+5ZEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QXDEm8+evob4Ih3bXciz6DlyU3IKx0BSY1tTzAm+KqdlBBKKieSXOfDzTm+9jHUQKdzpjnjLMluQcUD4wODIPruSlu8BDZXIV3YS4wwZblCW6z9xQqKGfP/f1wrFqYIJOA5QFHHbKehVTlVGoAgJPtdeF/tP2uu2FRxp3+Hh9s/oL8uccw/P1FdbDY4SSAjvITLQeA+7h9uy1nC6+9N+m9xtwhkCqYrtDHgIqwjpDndvLiK483wjONUXjVnsEYhtxK4x2WoVD5mElJS1e/seRQNvw2Ycbv84tJkQRt+icSXYcFntcUWB8s3JYF6Dc9ue0EsbySDGYLZy/IGqf03Fag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMnqV3FWWz2ykc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 16:35:18 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DFD6922BF9;
	Thu, 11 Sep 2025 06:35:15 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C15CC1372E;
	Thu, 11 Sep 2025 06:35:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PJLTLaJtwmgeTQAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 11 Sep 2025 06:35:14 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 06/14] sched: move clock related paravirt code to kernel/sched
Date: Thu, 11 Sep 2025 08:34:25 +0200
Message-ID: <20250911063433.13783-7-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911063433.13783-1-jgross@suse.com>
References: <20250911063433.13783-1-jgross@suse.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: DFD6922BF9
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Paravirt clock related functions are available in multiple archs.

In order to share the common parts, move the common static keys
to kernel/sched/ and remove them from the arch specific files.

Make a common paravirt_steal_clock() implementation available in
kernel/sched/cputime.c, guarding it with a new config option
CONFIG_HAVE_PV_STEAL_CLOCK_GEN, which can be selectd by an arch
in case it wants to use that common variant.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/Kconfig                           |  3 +++
 arch/arm/include/asm/paravirt.h        |  4 ----
 arch/arm/kernel/paravirt.c             |  3 ---
 arch/arm64/include/asm/paravirt.h      |  4 ----
 arch/arm64/kernel/paravirt.c           |  4 +---
 arch/loongarch/include/asm/paravirt.h  |  3 ---
 arch/loongarch/kernel/paravirt.c       |  3 +--
 arch/powerpc/include/asm/paravirt.h    |  3 ---
 arch/powerpc/platforms/pseries/setup.c |  4 +---
 arch/riscv/include/asm/paravirt.h      |  4 ----
 arch/riscv/kernel/paravirt.c           |  4 +---
 arch/x86/include/asm/paravirt.h        |  4 ----
 arch/x86/kernel/cpu/vmware.c           |  1 +
 arch/x86/kernel/kvm.c                  |  1 +
 arch/x86/kernel/paravirt.c             |  3 ---
 drivers/xen/time.c                     |  1 +
 include/linux/sched/cputime.h          | 18 ++++++++++++++++++
 kernel/sched/core.c                    |  5 +++++
 kernel/sched/cputime.c                 | 13 +++++++++++++
 kernel/sched/sched.h                   |  2 +-
 20 files changed, 47 insertions(+), 40 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index d1b4ffd6e085..7921be052472 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1003,6 +1003,9 @@ config HAVE_IRQ_TIME_ACCOUNTING
 	  Archs need to ensure they use a high enough resolution clock to
 	  support irq time accounting and then call enable_sched_clock_irqtime().
 
+config HAVE_PV_STEAL_CLOCK_GEN
+	bool
+
 config HAVE_MOVE_PUD
 	bool
 	help
diff --git a/arch/arm/include/asm/paravirt.h b/arch/arm/include/asm/paravirt.h
index 95d5b0d625cd..69da4bdcf856 100644
--- a/arch/arm/include/asm/paravirt.h
+++ b/arch/arm/include/asm/paravirt.h
@@ -5,10 +5,6 @@
 #ifdef CONFIG_PARAVIRT
 #include <linux/static_call_types.h>
 
-struct static_key;
-extern struct static_key paravirt_steal_enabled;
-extern struct static_key paravirt_steal_rq_enabled;
-
 u64 dummy_steal_clock(int cpu);
 
 DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
diff --git a/arch/arm/kernel/paravirt.c b/arch/arm/kernel/paravirt.c
index 7dd9806369fb..3895a5578852 100644
--- a/arch/arm/kernel/paravirt.c
+++ b/arch/arm/kernel/paravirt.c
@@ -12,9 +12,6 @@
 #include <linux/static_call.h>
 #include <asm/paravirt.h>
 
-struct static_key paravirt_steal_enabled;
-struct static_key paravirt_steal_rq_enabled;
-
 static u64 native_steal_clock(int cpu)
 {
 	return 0;
diff --git a/arch/arm64/include/asm/paravirt.h b/arch/arm64/include/asm/paravirt.h
index 9aa193e0e8f2..c9f7590baacb 100644
--- a/arch/arm64/include/asm/paravirt.h
+++ b/arch/arm64/include/asm/paravirt.h
@@ -5,10 +5,6 @@
 #ifdef CONFIG_PARAVIRT
 #include <linux/static_call_types.h>
 
-struct static_key;
-extern struct static_key paravirt_steal_enabled;
-extern struct static_key paravirt_steal_rq_enabled;
-
 u64 dummy_steal_clock(int cpu);
 
 DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
diff --git a/arch/arm64/kernel/paravirt.c b/arch/arm64/kernel/paravirt.c
index aa718d6a9274..943b60ce12f4 100644
--- a/arch/arm64/kernel/paravirt.c
+++ b/arch/arm64/kernel/paravirt.c
@@ -19,14 +19,12 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/static_call.h>
+#include <linux/sched/cputime.h>
 
 #include <asm/paravirt.h>
 #include <asm/pvclock-abi.h>
 #include <asm/smp_plat.h>
 
-struct static_key paravirt_steal_enabled;
-struct static_key paravirt_steal_rq_enabled;
-
 static u64 native_steal_clock(int cpu)
 {
 	return 0;
diff --git a/arch/loongarch/include/asm/paravirt.h b/arch/loongarch/include/asm/paravirt.h
index 3f4323603e6a..d219ea0d98ac 100644
--- a/arch/loongarch/include/asm/paravirt.h
+++ b/arch/loongarch/include/asm/paravirt.h
@@ -5,9 +5,6 @@
 #ifdef CONFIG_PARAVIRT
 
 #include <linux/static_call_types.h>
-struct static_key;
-extern struct static_key paravirt_steal_enabled;
-extern struct static_key paravirt_steal_rq_enabled;
 
 u64 dummy_steal_clock(int cpu);
 DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
diff --git a/arch/loongarch/kernel/paravirt.c b/arch/loongarch/kernel/paravirt.c
index b1b51f920b23..8caaa94fed1a 100644
--- a/arch/loongarch/kernel/paravirt.c
+++ b/arch/loongarch/kernel/paravirt.c
@@ -6,11 +6,10 @@
 #include <linux/kvm_para.h>
 #include <linux/reboot.h>
 #include <linux/static_call.h>
+#include <linux/sched/cputime.h>
 #include <asm/paravirt.h>
 
 static int has_steal_clock;
-struct static_key paravirt_steal_enabled;
-struct static_key paravirt_steal_rq_enabled;
 static DEFINE_PER_CPU(struct kvm_steal_time, steal_time) __aligned(64);
 DEFINE_STATIC_KEY_FALSE(virt_spin_lock_key);
 
diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index b78b82d66057..92343a23ad15 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -23,9 +23,6 @@ static inline bool is_shared_processor(void)
 }
 
 #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
-extern struct static_key paravirt_steal_enabled;
-extern struct static_key paravirt_steal_rq_enabled;
-
 u64 pseries_paravirt_steal_clock(int cpu);
 
 static inline u64 paravirt_steal_clock(int cpu)
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index b10a25325238..50b26ed8432d 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -42,6 +42,7 @@
 #include <linux/memblock.h>
 #include <linux/swiotlb.h>
 #include <linux/seq_buf.h>
+#include <linux/sched/cputime.h>
 
 #include <asm/mmu.h>
 #include <asm/processor.h>
@@ -83,9 +84,6 @@ DEFINE_STATIC_KEY_FALSE(shared_processor);
 EXPORT_SYMBOL(shared_processor);
 
 #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
-struct static_key paravirt_steal_enabled;
-struct static_key paravirt_steal_rq_enabled;
-
 static bool steal_acc = true;
 static int __init parse_no_stealacc(char *arg)
 {
diff --git a/arch/riscv/include/asm/paravirt.h b/arch/riscv/include/asm/paravirt.h
index c0abde70fc2c..17e5e39c72c0 100644
--- a/arch/riscv/include/asm/paravirt.h
+++ b/arch/riscv/include/asm/paravirt.h
@@ -5,10 +5,6 @@
 #ifdef CONFIG_PARAVIRT
 #include <linux/static_call_types.h>
 
-struct static_key;
-extern struct static_key paravirt_steal_enabled;
-extern struct static_key paravirt_steal_rq_enabled;
-
 u64 dummy_steal_clock(int cpu);
 
 DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index fa6b0339a65d..d3c334f16172 100644
--- a/arch/riscv/kernel/paravirt.c
+++ b/arch/riscv/kernel/paravirt.c
@@ -16,15 +16,13 @@
 #include <linux/printk.h>
 #include <linux/static_call.h>
 #include <linux/types.h>
+#include <linux/sched/cputime.h>
 
 #include <asm/barrier.h>
 #include <asm/page.h>
 #include <asm/paravirt.h>
 #include <asm/sbi.h>
 
-struct static_key paravirt_steal_enabled;
-struct static_key paravirt_steal_rq_enabled;
-
 static u64 native_steal_clock(int cpu)
 {
 	return 0;
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 0d1e611f619c..491cb7e037bf 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -34,10 +34,6 @@ static __always_inline u64 paravirt_sched_clock(void)
 	return static_call(pv_sched_clock)();
 }
 
-struct static_key;
-extern struct static_key paravirt_steal_enabled;
-extern struct static_key paravirt_steal_rq_enabled;
-
 __visible void __native_queued_spin_unlock(struct qspinlock *lock);
 bool pv_is_native_spin_unlock(void);
 __visible bool __native_vcpu_is_preempted(long cpu);
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index cb3f900c46fc..a3e6936839b1 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -29,6 +29,7 @@
 #include <linux/efi.h>
 #include <linux/reboot.h>
 #include <linux/static_call.h>
+#include <linux/sched/cputime.h>
 #include <asm/div64.h>
 #include <asm/x86_init.h>
 #include <asm/hypervisor.h>
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 8ae750cde0c6..a23211eaaeed 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -29,6 +29,7 @@
 #include <linux/syscore_ops.h>
 #include <linux/cc_platform.h>
 #include <linux/efi.h>
+#include <linux/sched/cputime.h>
 #include <asm/timer.h>
 #include <asm/cpu.h>
 #include <asm/traps.h>
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index ab3e172dcc69..a3ba4747be1c 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -60,9 +60,6 @@ void __init native_pv_lock_init(void)
 		static_branch_enable(&virt_spin_lock_key);
 }
 
-struct static_key paravirt_steal_enabled;
-struct static_key paravirt_steal_rq_enabled;
-
 static u64 native_steal_clock(int cpu)
 {
 	return 0;
diff --git a/drivers/xen/time.c b/drivers/xen/time.c
index 5683383d2305..d360ded2ef39 100644
--- a/drivers/xen/time.c
+++ b/drivers/xen/time.c
@@ -8,6 +8,7 @@
 #include <linux/gfp.h>
 #include <linux/slab.h>
 #include <linux/static_call.h>
+#include <linux/sched/cputime.h>
 
 #include <asm/paravirt.h>
 #include <asm/xen/hypervisor.h>
diff --git a/include/linux/sched/cputime.h b/include/linux/sched/cputime.h
index 5f8fd5b24a2e..e90efaf6d26e 100644
--- a/include/linux/sched/cputime.h
+++ b/include/linux/sched/cputime.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_SCHED_CPUTIME_H
 #define _LINUX_SCHED_CPUTIME_H
 
+#include <linux/static_call_types.h>
 #include <linux/sched/signal.h>
 
 /*
@@ -180,4 +181,21 @@ static inline void prev_cputime_init(struct prev_cputime *prev)
 extern unsigned long long
 task_sched_runtime(struct task_struct *task);
 
+#ifdef CONFIG_PARAVIRT
+struct static_key;
+extern struct static_key paravirt_steal_enabled;
+extern struct static_key paravirt_steal_rq_enabled;
+
+#ifdef CONFIG_HAVE_PV_STEAL_CLOCK_GEN
+u64 dummy_steal_clock(int cpu);
+
+DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
+
+static inline u64 paravirt_steal_clock(int cpu)
+{
+	return static_call(pv_steal_clock)(cpu);
+}
+#endif
+#endif
+
 #endif /* _LINUX_SCHED_CPUTIME_H */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index be00629f0ba4..e723226e4e11 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -767,6 +767,11 @@ struct rq *task_rq_lock(struct task_struct *p, struct rq_flags *rf)
  * RQ-clock updating methods:
  */
 
+/* Use CONFIG_PARAVIRT as this will avoid more #ifdef in arch code. */
+#ifdef CONFIG_PARAVIRT
+struct static_key paravirt_steal_rq_enabled;
+#endif
+
 static void update_rq_clock_task(struct rq *rq, s64 delta)
 {
 /*
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 7097de2c8cda..ed8f71e08047 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -251,6 +251,19 @@ void __account_forceidle_time(struct task_struct *p, u64 delta)
  * ticks are not redelivered later. Due to that, this function may on
  * occasion account more time than the calling functions think elapsed.
  */
+#ifdef CONFIG_PARAVIRT
+struct static_key paravirt_steal_enabled;
+
+#ifdef CONFIG_HAVE_PV_STEAL_CLOCK_GEN
+static u64 native_steal_clock(int cpu)
+{
+	return 0;
+}
+
+DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
+#endif
+#endif
+
 static __always_inline u64 steal_account_process_time(u64 maxtime)
 {
 #ifdef CONFIG_PARAVIRT
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6442441b46d7..fdf3021bdf7d 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -82,7 +82,7 @@ struct rt_rq;
 struct sched_group;
 struct cpuidle_state;
 
-#ifdef CONFIG_PARAVIRT
+#if defined(CONFIG_PARAVIRT) && !defined(CONFIG_HAVE_PV_STEAL_CLOCK_GEN)
 # include <asm/paravirt.h>
 #endif
 
-- 
2.51.0


