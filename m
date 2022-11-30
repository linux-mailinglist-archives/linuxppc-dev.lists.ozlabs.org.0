Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC8E63E5B9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:48:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwrD4b1Zz3gM4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:48:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=IcXJTebE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=37okhywykdpmnzviexbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=IcXJTebE;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw0t6BcZz3bgc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:38 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id k7-20020a256f07000000b006cbcc030bc8so17828716ybc.18
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=myd50wMuUGvMs3BMzspVNuxVlZm+9A/TRtO2yuZ9dQQ=;
        b=IcXJTebELUyLIdOMI97K+Ly3fqiu7l5yW1yyp3dOw3TI7+xxraN8r6HKF7LyL7spb2
         WaCJV2upca8OkoUJe8R1b3sRxn/TftfXP4ZLAF1996iJW5WXu0C/hTNSfy8Y/CBtEFA2
         oB+0dp/L5HsdFYPk9Tc/skyTe1MYlFSGJf3ESgg4hPgTQE1yTsQzQ/Su50/5u4eoAr5/
         YfEFeD75IXtv4lqCz7DYJ8lNfWG96KEVovIt2dnSntXvf19L1ru9fu9U+4foOSHnLUbR
         sqiRitPaOb5AablWjgopwqW4dkIpRqSFlP61KvDodNyAFNDKJNCYFdKDtYffvCeFkd8s
         cgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myd50wMuUGvMs3BMzspVNuxVlZm+9A/TRtO2yuZ9dQQ=;
        b=B/H6SWk9pS0IwJ/nsK/Am47P9Dprhki3v9cMTwru5w7cxenK4WfTQBfXxwseYw2SKf
         M6hGUw11Vi1svNPGs1ACFsxNauQCbdnQ4qgNyHlJ+i6pcklpAk+dKmxCWx1jVMUZW5NO
         7yjEdXe1Y5R5UVwkZF7J1CDB0fz+bdNjZED7NiTkldzS1BxQRzrLRLIWwtP5ebJM1suV
         FqKThN9vMEzw9Zq4/vomF6s6IINhnJvKLegjYms7RhobLC5sssk3l/rIF0VEzrQNcd7z
         tqomPjsZKh0RPyh7VnE91J6spjOqTeOMsYEOV/1JXrQ7KbVPZvEaIur8N7qew7gbdDEa
         YS5w==
X-Gm-Message-State: ANoB5pnsn+m2N1XjmIgPC8rslDo44BpxPIB6z3qGIMI4VC9/7ofv6qNf
	PSc4m1gMtgR9lpi6xJsCRg5FcbWzb3A=
X-Google-Smtp-Source: AA0mqf78RzA5hYqDANJt0xXrjOfVdsjqUwrJvu0gpG6qEU7fPSpN0nFW2U5r7n6inKxLGawrP6Mumek1Fh4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:d57:0:b0:6f7:493c:77cb with SMTP id
 84-20020a250d57000000b006f7493c77cbmr14688082ybn.92.1669849836834; Wed, 30
 Nov 2022 15:10:36 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:18 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-35-seanjc@google.com>
Subject: [PATCH v2 34/50] KVM: x86: Unify pr_fmt to use module name for all
 KVM modules
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Define pr_fmt using KBUILD_MODNAME for all KVM x86 code so that printks
use consistent formatting across common x86, Intel, and AMD code.  In
addition to providing consistent print formatting, using KBUILD_MODNAME,
e.g. kvm_amd and kvm_intel, allows referencing SVM and VMX (and SEV and
SGX and ...) as technologies without generating weird messages, and
without causing naming conflicts with other kernel code, e.g. "SEV: ",
"tdx: ", "sgx: " etc.. are all used by the kernel for non-KVM subsystems.

Opportunistically move away from printk() for prints that need to be
modified anyways, e.g. to drop a manual "kvm: " prefix.

Opportunistically convert a few SGX WARNs that are similarly modified to
WARN_ONCE; in the very unlikely event that the WARNs fire, odds are good
that they would fire repeatedly and spam the kernel log without providing
unique information in each print.

Note, defining pr_fmt yields undesirable results for code that uses KVM's
printk wrappers, e.g. vcpu_unimpl().  But, that's a pre-existing problem
as SVM/kvm_amd already defines a pr_fmt, and thankfully use of KVM's
wrappers is relatively limited in KVM x86 code.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/cpuid.c            |  1 +
 arch/x86/kvm/debugfs.c          |  2 ++
 arch/x86/kvm/emulate.c          |  1 +
 arch/x86/kvm/hyperv.c           |  1 +
 arch/x86/kvm/i8254.c            |  4 ++--
 arch/x86/kvm/i8259.c            |  4 +++-
 arch/x86/kvm/ioapic.c           |  1 +
 arch/x86/kvm/irq.c              |  1 +
 arch/x86/kvm/irq_comm.c         |  7 +++---
 arch/x86/kvm/kvm_onhyperv.c     |  1 +
 arch/x86/kvm/lapic.c            |  8 +++----
 arch/x86/kvm/mmu/mmu.c          |  6 ++---
 arch/x86/kvm/mmu/page_track.c   |  1 +
 arch/x86/kvm/mmu/spte.c         |  4 ++--
 arch/x86/kvm/mmu/spte.h         |  4 ++--
 arch/x86/kvm/mmu/tdp_iter.c     |  1 +
 arch/x86/kvm/mmu/tdp_mmu.c      |  1 +
 arch/x86/kvm/mtrr.c             |  1 +
 arch/x86/kvm/pmu.c              |  1 +
 arch/x86/kvm/smm.c              |  1 +
 arch/x86/kvm/svm/avic.c         |  2 +-
 arch/x86/kvm/svm/nested.c       |  2 +-
 arch/x86/kvm/svm/pmu.c          |  2 ++
 arch/x86/kvm/svm/sev.c          |  1 +
 arch/x86/kvm/svm/svm.c          | 10 ++++-----
 arch/x86/kvm/svm/svm_onhyperv.c |  1 +
 arch/x86/kvm/svm/svm_onhyperv.h |  4 ++--
 arch/x86/kvm/vmx/hyperv.c       |  1 +
 arch/x86/kvm/vmx/hyperv.h       |  4 +---
 arch/x86/kvm/vmx/nested.c       |  3 ++-
 arch/x86/kvm/vmx/pmu_intel.c    |  5 +++--
 arch/x86/kvm/vmx/posted_intr.c  |  2 ++
 arch/x86/kvm/vmx/sgx.c          |  5 +++--
 arch/x86/kvm/vmx/vmcs12.c       |  1 +
 arch/x86/kvm/vmx/vmx.c          | 40 ++++++++++++++++-----------------
 arch/x86/kvm/vmx/vmx_ops.h      |  4 ++--
 arch/x86/kvm/x86.c              | 28 ++++++++++++-----------
 arch/x86/kvm/xen.c              |  1 +
 38 files changed, 97 insertions(+), 70 deletions(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 723502181a3a..82411693e604 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -8,6 +8,7 @@
  * Copyright 2011 Red Hat, Inc. and/or its affiliates.
  * Copyright IBM Corporation, 2008
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_host.h>
 #include <linux/export.h>
diff --git a/arch/x86/kvm/debugfs.c b/arch/x86/kvm/debugfs.c
index c1390357126a..ee8c4c3496ed 100644
--- a/arch/x86/kvm/debugfs.c
+++ b/arch/x86/kvm/debugfs.c
@@ -4,6 +4,8 @@
  *
  * Copyright 2016 Red Hat, Inc. and/or its affiliates.
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/kvm_host.h>
 #include <linux/debugfs.h>
 #include "lapic.h"
diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index 5cc3efa0e21c..c3443045cd93 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -17,6 +17,7 @@
  *
  * From: xen-unstable 10676:af9809f51f81a3c43f276f00c81a52ef558afda4
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_host.h>
 #include "kvm_cache_regs.h"
diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index 2c7f2a26421e..4c47892d72bb 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -17,6 +17,7 @@
  *   Ben-Ami Yassour <benami@il.ibm.com>
  *   Andrey Smetanin <asmetanin@virtuozzo.com>
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include "x86.h"
 #include "lapic.h"
diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
index e0a7a0e7a73c..cd57a517d04a 100644
--- a/arch/x86/kvm/i8254.c
+++ b/arch/x86/kvm/i8254.c
@@ -30,7 +30,7 @@
  *   Based on QEMU and Xen.
  */
 
-#define pr_fmt(fmt) "pit: " fmt
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_host.h>
 #include <linux/slab.h>
@@ -351,7 +351,7 @@ static void create_pit_timer(struct kvm_pit *pit, u32 val, int is_period)
 
 		if (ps->period < min_period) {
 			pr_info_ratelimited(
-			    "kvm: requested %lld ns "
+			    "requested %lld ns "
 			    "i8254 timer period limited to %lld ns\n",
 			    ps->period, min_period);
 			ps->period = min_period;
diff --git a/arch/x86/kvm/i8259.c b/arch/x86/kvm/i8259.c
index e1bb6218bb96..4756bcb5724f 100644
--- a/arch/x86/kvm/i8259.c
+++ b/arch/x86/kvm/i8259.c
@@ -26,6 +26,8 @@
  *   Yaozu (Eddie) Dong <Eddie.dong@intel.com>
  *   Port from Qemu.
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/bitops.h>
@@ -35,7 +37,7 @@
 #include "trace.h"
 
 #define pr_pic_unimpl(fmt, ...)	\
-	pr_err_ratelimited("kvm: pic: " fmt, ## __VA_ARGS__)
+	pr_err_ratelimited("pic: " fmt, ## __VA_ARGS__)
 
 static void pic_irq_request(struct kvm *kvm, int level);
 
diff --git a/arch/x86/kvm/ioapic.c b/arch/x86/kvm/ioapic.c
index 765943d7cfa5..042dee556125 100644
--- a/arch/x86/kvm/ioapic.c
+++ b/arch/x86/kvm/ioapic.c
@@ -26,6 +26,7 @@
  *  Yaozu (Eddie) Dong <eddie.dong@intel.com>
  *  Based on Xen 3.1 code.
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_host.h>
 #include <linux/kvm.h>
diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index d8d50558f165..f36f7cd77fb7 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -7,6 +7,7 @@
  * Authors:
  *   Yaozu (Eddie) Dong <Eddie.dong@intel.com>
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/export.h>
 #include <linux/kvm_host.h>
diff --git a/arch/x86/kvm/irq_comm.c b/arch/x86/kvm/irq_comm.c
index 0687162c4f22..d48eaeacf803 100644
--- a/arch/x86/kvm/irq_comm.c
+++ b/arch/x86/kvm/irq_comm.c
@@ -8,6 +8,7 @@
  *
  * Copyright 2010 Red Hat, Inc. and/or its affiliates.
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_host.h>
 #include <linux/slab.h>
@@ -56,7 +57,7 @@ int kvm_irq_delivery_to_apic(struct kvm *kvm, struct kvm_lapic *src,
 
 	if (irq->dest_mode == APIC_DEST_PHYSICAL &&
 	    irq->dest_id == 0xff && kvm_lowest_prio_delivery(irq)) {
-		printk(KERN_INFO "kvm: apic: phys broadcast and lowest prio\n");
+		pr_info("apic: phys broadcast and lowest prio\n");
 		irq->delivery_mode = APIC_DM_FIXED;
 	}
 
@@ -199,7 +200,7 @@ int kvm_request_irq_source_id(struct kvm *kvm)
 	irq_source_id = find_first_zero_bit(bitmap, BITS_PER_LONG);
 
 	if (irq_source_id >= BITS_PER_LONG) {
-		printk(KERN_WARNING "kvm: exhaust allocatable IRQ sources!\n");
+		pr_warn("exhausted allocatable IRQ sources!\n");
 		irq_source_id = -EFAULT;
 		goto unlock;
 	}
@@ -221,7 +222,7 @@ void kvm_free_irq_source_id(struct kvm *kvm, int irq_source_id)
 	mutex_lock(&kvm->irq_lock);
 	if (irq_source_id < 0 ||
 	    irq_source_id >= BITS_PER_LONG) {
-		printk(KERN_ERR "kvm: IRQ source ID out of range!\n");
+		pr_err("IRQ source ID out of range!\n");
 		goto unlock;
 	}
 	clear_bit(irq_source_id, &kvm->arch.irq_sources_bitmap);
diff --git a/arch/x86/kvm/kvm_onhyperv.c b/arch/x86/kvm/kvm_onhyperv.c
index ee4f696a0782..482d6639ef88 100644
--- a/arch/x86/kvm/kvm_onhyperv.c
+++ b/arch/x86/kvm/kvm_onhyperv.c
@@ -2,6 +2,7 @@
 /*
  * KVM L1 hypervisor optimizations on Hyper-V.
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_host.h>
 #include <asm/mshyperv.h>
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 1bb63746e991..9335c4b05760 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -15,6 +15,7 @@
  *
  * Based on Xen 3.1 code, Copyright (c) 2004, Intel Corporation.
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_host.h>
 #include <linux/kvm.h>
@@ -942,8 +943,7 @@ static void kvm_apic_disabled_lapic_found(struct kvm *kvm)
 {
 	if (!kvm->arch.disabled_lapic_found) {
 		kvm->arch.disabled_lapic_found = true;
-		printk(KERN_INFO
-		       "Disabled LAPIC found during irq injection\n");
+		pr_info("Disabled LAPIC found during irq injection\n");
 	}
 }
 
@@ -1561,7 +1561,7 @@ static void limit_periodic_timer_frequency(struct kvm_lapic *apic)
 
 		if (apic->lapic_timer.period < min_period) {
 			pr_info_ratelimited(
-			    "kvm: vcpu %i: requested %lld ns "
+			    "vcpu %i: requested %lld ns "
 			    "lapic timer period limited to %lld ns\n",
 			    apic->vcpu->vcpu_id,
 			    apic->lapic_timer.period, min_period);
@@ -1846,7 +1846,7 @@ static bool set_target_expiration(struct kvm_lapic *apic, u32 count_reg)
 				deadline = apic->lapic_timer.period;
 			else if (unlikely(deadline > apic->lapic_timer.period)) {
 				pr_info_ratelimited(
-				    "kvm: vcpu %i: requested lapic timer restore with "
+				    "vcpu %i: requested lapic timer restore with "
 				    "starting count register %#x=%u (%lld ns) > initial count (%lld ns). "
 				    "Using initial count to start timer.\n",
 				    apic->vcpu->vcpu_id,
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 4736d7849c60..00a8312ad31d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -14,6 +14,7 @@
  *   Yaniv Kamay  <yaniv@qumranet.com>
  *   Avi Kivity   <avi@qumranet.com>
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include "irq.h"
 #include "ioapic.h"
@@ -3432,8 +3433,7 @@ static int fast_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 		}
 
 		if (++retry_count > 4) {
-			printk_once(KERN_WARNING
-				"kvm: Fast #PF retrying more than 4 times.\n");
+			pr_warn_once("Fast #PF retrying more than 4 times.\n");
 			break;
 		}
 
@@ -6578,7 +6578,7 @@ void kvm_mmu_invalidate_mmio_sptes(struct kvm *kvm, u64 gen)
 	 * zap all shadow pages.
 	 */
 	if (unlikely(gen == 0)) {
-		kvm_debug_ratelimited("kvm: zapping shadow pages for mmio generation wraparound\n");
+		kvm_debug_ratelimited("zapping shadow pages for mmio generation wraparound\n");
 		kvm_mmu_zap_all_fast(kvm);
 	}
 }
diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index 2e09d1b6249f..0a2ac438d647 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -10,6 +10,7 @@
  * Author:
  *   Xiao Guangrong <guangrong.xiao@linux.intel.com>
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_host.h>
 #include <linux/rculist.h>
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index c0fd7e049b4e..fce6f047399f 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -7,7 +7,7 @@
  * Copyright (C) 2006 Qumranet, Inc.
  * Copyright 2020 Red Hat, Inc. and/or its affiliates.
  */
-
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_host.h>
 #include "mmu.h"
@@ -352,7 +352,7 @@ u64 mark_spte_for_access_track(u64 spte)
 
 	WARN_ONCE(spte & (SHADOW_ACC_TRACK_SAVED_BITS_MASK <<
 			  SHADOW_ACC_TRACK_SAVED_BITS_SHIFT),
-		  "kvm: Access Tracking saved bit locations are not zero\n");
+		  "Access Tracking saved bit locations are not zero\n");
 
 	spte |= (spte & SHADOW_ACC_TRACK_SAVED_BITS_MASK) <<
 		SHADOW_ACC_TRACK_SAVED_BITS_SHIFT;
diff --git a/arch/x86/kvm/mmu/spte.h b/arch/x86/kvm/mmu/spte.h
index 1f03701b943a..17f74c60c774 100644
--- a/arch/x86/kvm/mmu/spte.h
+++ b/arch/x86/kvm/mmu/spte.h
@@ -435,11 +435,11 @@ static inline void check_spte_writable_invariants(u64 spte)
 {
 	if (spte & shadow_mmu_writable_mask)
 		WARN_ONCE(!(spte & shadow_host_writable_mask),
-			  "kvm: MMU-writable SPTE is not Host-writable: %llx",
+			  KBUILD_MODNAME ": MMU-writable SPTE is not Host-writable: %llx",
 			  spte);
 	else
 		WARN_ONCE(is_writable_pte(spte),
-			  "kvm: Writable SPTE is not MMU-writable: %llx", spte);
+			  KBUILD_MODNAME ": Writable SPTE is not MMU-writable: %llx", spte);
 }
 
 static inline bool is_mmu_writable_spte(u64 spte)
diff --git a/arch/x86/kvm/mmu/tdp_iter.c b/arch/x86/kvm/mmu/tdp_iter.c
index 39b48e7d7d1a..e26e744df1d1 100644
--- a/arch/x86/kvm/mmu/tdp_iter.c
+++ b/arch/x86/kvm/mmu/tdp_iter.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include "mmu_internal.h"
 #include "tdp_iter.h"
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 771210ce5181..c0242f3fe614 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include "mmu.h"
 #include "mmu_internal.h"
diff --git a/arch/x86/kvm/mtrr.c b/arch/x86/kvm/mtrr.c
index a8502e02f479..9fac1ec03463 100644
--- a/arch/x86/kvm/mtrr.c
+++ b/arch/x86/kvm/mtrr.c
@@ -13,6 +13,7 @@
  *   Paolo Bonzini <pbonzini@redhat.com>
  *   Xiao Guangrong <guangrong.xiao@linux.intel.com>
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_host.h>
 #include <asm/mtrr.h>
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 684393c22105..ddb818ac08c4 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -9,6 +9,7 @@
  *   Gleb Natapov <gleb@redhat.com>
  *   Wei Huang    <wei@redhat.com>
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/types.h>
 #include <linux/kvm_host.h>
diff --git a/arch/x86/kvm/smm.c b/arch/x86/kvm/smm.c
index a9c1c2af8d94..cc43638d48a3 100644
--- a/arch/x86/kvm/smm.c
+++ b/arch/x86/kvm/smm.c
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_host.h>
 #include "x86.h"
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 6919dee69f18..f52f5e0dd465 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -12,7 +12,7 @@
  *   Avi Kivity   <avi@qumranet.com>
  */
 
-#define pr_fmt(fmt) "SVM: " fmt
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_types.h>
 #include <linux/hashtable.h>
diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index bc9cd7086fa9..3bfbcb607d80 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -12,7 +12,7 @@
  *   Avi Kivity   <avi@qumranet.com>
  */
 
-#define pr_fmt(fmt) "SVM: " fmt
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_types.h>
 #include <linux/kvm_host.h>
diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index 0e313fbae055..1ff068f23841 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -9,6 +9,8 @@
  *
  * Implementation is based on pmu_intel.c file
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/types.h>
 #include <linux/kvm_host.h>
 #include <linux/perf_event.h>
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 69dbf17f0d6a..339fb69f4b2d 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -6,6 +6,7 @@
  *
  * Copyright 2010 Red Hat, Inc. and/or its affiliates.
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_types.h>
 #include <linux/kvm_host.h>
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index a875cf7b2942..ab53da3fbcd1 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1,4 +1,4 @@
-#define pr_fmt(fmt) "SVM: " fmt
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_host.h>
 
@@ -2076,7 +2076,7 @@ static void svm_handle_mce(struct kvm_vcpu *vcpu)
 		 * Erratum 383 triggered. Guest state is corrupt so kill the
 		 * guest.
 		 */
-		pr_err("KVM: Guest triggered AMD Erratum 383\n");
+		pr_err("Guest triggered AMD Erratum 383\n");
 
 		kvm_make_request(KVM_REQ_TRIPLE_FAULT, vcpu);
 
@@ -4623,7 +4623,7 @@ static bool svm_can_emulate_instruction(struct kvm_vcpu *vcpu, int emul_type,
 	smap = cr4 & X86_CR4_SMAP;
 	is_user = svm_get_cpl(vcpu) == 3;
 	if (smap && (!smep || is_user)) {
-		pr_err_ratelimited("KVM: SEV Guest triggered AMD Erratum 1096\n");
+		pr_err_ratelimited("SEV Guest triggered AMD Erratum 1096\n");
 
 		/*
 		 * If the fault occurred in userspace, arbitrarily inject #GP
@@ -4972,7 +4972,7 @@ static __init int svm_hardware_setup(void)
 	}
 
 	if (nested) {
-		printk(KERN_INFO "kvm: Nested Virtualization enabled\n");
+		pr_info("Nested Virtualization enabled\n");
 		kvm_enable_efer_bits(EFER_SVME | EFER_LMSLE);
 	}
 
@@ -4990,7 +4990,7 @@ static __init int svm_hardware_setup(void)
 	/* Force VM NPT level equal to the host's paging level */
 	kvm_configure_mmu(npt_enabled, get_npt_level(),
 			  get_npt_level(), PG_LEVEL_1G);
-	pr_info("kvm: Nested Paging %sabled\n", npt_enabled ? "en" : "dis");
+	pr_info("Nested Paging %sabled\n", npt_enabled ? "en" : "dis");
 
 	/* Setup shadow_me_value and shadow_me_mask */
 	kvm_mmu_set_me_spte_mask(sme_me_mask, sme_me_mask);
diff --git a/arch/x86/kvm/svm/svm_onhyperv.c b/arch/x86/kvm/svm/svm_onhyperv.c
index 26a89d0da93e..7af8422d3382 100644
--- a/arch/x86/kvm/svm/svm_onhyperv.c
+++ b/arch/x86/kvm/svm/svm_onhyperv.c
@@ -2,6 +2,7 @@
 /*
  * KVM L1 hypervisor optimizations on Hyper-V for SVM.
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_host.h>
 
diff --git a/arch/x86/kvm/svm/svm_onhyperv.h b/arch/x86/kvm/svm/svm_onhyperv.h
index 45faf84476ce..6981c1e9a809 100644
--- a/arch/x86/kvm/svm/svm_onhyperv.h
+++ b/arch/x86/kvm/svm/svm_onhyperv.h
@@ -34,7 +34,7 @@ static inline void svm_hv_hardware_setup(void)
 {
 	if (npt_enabled &&
 	    ms_hyperv.nested_features & HV_X64_NESTED_ENLIGHTENED_TLB) {
-		pr_info("kvm: Hyper-V enlightened NPT TLB flush enabled\n");
+		pr_info(KBUILD_MODNAME ": Hyper-V enlightened NPT TLB flush enabled\n");
 		svm_x86_ops.tlb_remote_flush = hv_remote_flush_tlb;
 		svm_x86_ops.tlb_remote_flush_with_range =
 				hv_remote_flush_tlb_with_range;
@@ -43,7 +43,7 @@ static inline void svm_hv_hardware_setup(void)
 	if (ms_hyperv.nested_features & HV_X64_NESTED_DIRECT_FLUSH) {
 		int cpu;
 
-		pr_info("kvm: Hyper-V Direct TLB Flush enabled\n");
+		pr_info(KBUILD_MODNAME ": Hyper-V Direct TLB Flush enabled\n");
 		for_each_online_cpu(cpu) {
 			struct hv_vp_assist_page *vp_ap =
 				hv_get_vp_assist_page(cpu);
diff --git a/arch/x86/kvm/vmx/hyperv.c b/arch/x86/kvm/vmx/hyperv.c
index ae03d1fe0355..0d3a39059c64 100644
--- a/arch/x86/kvm/vmx/hyperv.c
+++ b/arch/x86/kvm/vmx/hyperv.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/errno.h>
 #include <linux/smp.h>
diff --git a/arch/x86/kvm/vmx/hyperv.h b/arch/x86/kvm/vmx/hyperv.h
index 571e7929d14e..6f0620a62dea 100644
--- a/arch/x86/kvm/vmx/hyperv.h
+++ b/arch/x86/kvm/vmx/hyperv.h
@@ -117,9 +117,7 @@ static __always_inline int get_evmcs_offset(unsigned long field,
 {
 	int offset = evmcs_field_offset(field, clean_field);
 
-	WARN_ONCE(offset < 0, "KVM: accessing unsupported EVMCS field %lx\n",
-		  field);
-
+	WARN_ONCE(offset < 0, "accessing unsupported EVMCS field %lx\n", field);
 	return offset;
 }
 
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index b28be793de29..fbc1dbf294c1 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/objtool.h>
 #include <linux/percpu.h>
@@ -203,7 +204,7 @@ static void nested_vmx_abort(struct kvm_vcpu *vcpu, u32 indicator)
 {
 	/* TODO: not to reset guest simply here. */
 	kvm_make_request(KVM_REQ_TRIPLE_FAULT, vcpu);
-	pr_debug_ratelimited("kvm: nested vmx abort, indicator %d\n", indicator);
+	pr_debug_ratelimited("nested vmx abort, indicator %d\n", indicator);
 }
 
 static inline bool vmx_control_verify(u32 control, u32 low, u32 high)
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index e5cec07ca8d9..efce9ad70e4e 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -8,6 +8,8 @@
  *   Avi Kivity   <avi@redhat.com>
  *   Gleb Natapov <gleb@redhat.com>
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/types.h>
 #include <linux/kvm_host.h>
 #include <linux/perf_event.h>
@@ -762,8 +764,7 @@ void vmx_passthrough_lbr_msrs(struct kvm_vcpu *vcpu)
 	return;
 
 warn:
-	pr_warn_ratelimited("kvm: vcpu-%d: fail to passthrough LBR.\n",
-		vcpu->vcpu_id);
+	pr_warn_ratelimited("vcpu-%d: fail to passthrough LBR.\n", vcpu->vcpu_id);
 }
 
 static void intel_pmu_cleanup(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 1b56c5e5c9fb..94c38bea60e7 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/kvm_host.h>
 
 #include <asm/irq_remapping.h>
diff --git a/arch/x86/kvm/vmx/sgx.c b/arch/x86/kvm/vmx/sgx.c
index 8f95c7c01433..a6ac83d4b6ad 100644
--- a/arch/x86/kvm/vmx/sgx.c
+++ b/arch/x86/kvm/vmx/sgx.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*  Copyright(c) 2021 Intel Corporation. */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <asm/sgx.h>
 
@@ -164,7 +165,7 @@ static int __handle_encls_ecreate(struct kvm_vcpu *vcpu,
 	if (!vcpu->kvm->arch.sgx_provisioning_allowed &&
 	    (attributes & SGX_ATTR_PROVISIONKEY)) {
 		if (sgx_12_1->eax & SGX_ATTR_PROVISIONKEY)
-			pr_warn_once("KVM: SGX PROVISIONKEY advertised but not allowed\n");
+			pr_warn_once("SGX PROVISIONKEY advertised but not allowed\n");
 		kvm_inject_gp(vcpu, 0);
 		return 1;
 	}
@@ -379,7 +380,7 @@ int handle_encls(struct kvm_vcpu *vcpu)
 			return handle_encls_ecreate(vcpu);
 		if (leaf == EINIT)
 			return handle_encls_einit(vcpu);
-		WARN(1, "KVM: unexpected exit on ENCLS[%u]", leaf);
+		WARN_ONCE(1, "unexpected exit on ENCLS[%u]", leaf);
 		vcpu->run->exit_reason = KVM_EXIT_UNKNOWN;
 		vcpu->run->hw.hardware_exit_reason = EXIT_REASON_ENCLS;
 		return 0;
diff --git a/arch/x86/kvm/vmx/vmcs12.c b/arch/x86/kvm/vmx/vmcs12.c
index 2251b60920f8..106a72c923ca 100644
--- a/arch/x86/kvm/vmx/vmcs12.c
+++ b/arch/x86/kvm/vmx/vmcs12.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include "vmcs12.h"
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 229a9cf485f0..e859d2b7daa4 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -12,6 +12,7 @@
  *   Avi Kivity   <avi@qumranet.com>
  *   Yaniv Kamay  <yaniv@qumranet.com>
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/highmem.h>
 #include <linux/hrtimer.h>
@@ -444,36 +445,36 @@ void vmread_error(unsigned long field, bool fault)
 	if (fault)
 		kvm_spurious_fault();
 	else
-		vmx_insn_failed("kvm: vmread failed: field=%lx\n", field);
+		vmx_insn_failed("vmread failed: field=%lx\n", field);
 }
 
 noinline void vmwrite_error(unsigned long field, unsigned long value)
 {
-	vmx_insn_failed("kvm: vmwrite failed: field=%lx val=%lx err=%u\n",
+	vmx_insn_failed("vmwrite failed: field=%lx val=%lx err=%u\n",
 			field, value, vmcs_read32(VM_INSTRUCTION_ERROR));
 }
 
 noinline void vmclear_error(struct vmcs *vmcs, u64 phys_addr)
 {
-	vmx_insn_failed("kvm: vmclear failed: %p/%llx err=%u\n",
+	vmx_insn_failed("vmclear failed: %p/%llx err=%u\n",
 			vmcs, phys_addr, vmcs_read32(VM_INSTRUCTION_ERROR));
 }
 
 noinline void vmptrld_error(struct vmcs *vmcs, u64 phys_addr)
 {
-	vmx_insn_failed("kvm: vmptrld failed: %p/%llx err=%u\n",
+	vmx_insn_failed("vmptrld failed: %p/%llx err=%u\n",
 			vmcs, phys_addr, vmcs_read32(VM_INSTRUCTION_ERROR));
 }
 
 noinline void invvpid_error(unsigned long ext, u16 vpid, gva_t gva)
 {
-	vmx_insn_failed("kvm: invvpid failed: ext=0x%lx vpid=%u gva=0x%lx\n",
+	vmx_insn_failed("invvpid failed: ext=0x%lx vpid=%u gva=0x%lx\n",
 			ext, vpid, gva);
 }
 
 noinline void invept_error(unsigned long ext, u64 eptp, gpa_t gpa)
 {
-	vmx_insn_failed("kvm: invept failed: ext=0x%lx eptp=%llx gpa=0x%llx\n",
+	vmx_insn_failed("invept failed: ext=0x%lx eptp=%llx gpa=0x%llx\n",
 			ext, eptp, gpa);
 }
 
@@ -577,7 +578,7 @@ static __init void hv_init_evmcs(void)
 		}
 
 		if (enlightened_vmcs) {
-			pr_info("KVM: vmx: using Hyper-V Enlightened VMCS\n");
+			pr_info("Using Hyper-V Enlightened VMCS\n");
 			static_branch_enable(&enable_evmcs);
 		}
 
@@ -1678,8 +1679,8 @@ static int skip_emulated_instruction(struct kvm_vcpu *vcpu)
 		if (!instr_len)
 			goto rip_updated;
 
-		WARN(exit_reason.enclave_mode,
-		     "KVM: skipping instruction after SGX enclave VM-Exit");
+		WARN_ONCE(exit_reason.enclave_mode,
+			  "skipping instruction after SGX enclave VM-Exit");
 
 		orig_rip = kvm_rip_read(vcpu);
 		rip = orig_rip + instr_len;
@@ -2988,9 +2989,8 @@ static void fix_rmode_seg(int seg, struct kvm_segment *save)
 		var.type = 0x3;
 		var.avl = 0;
 		if (save->base & 0xf)
-			printk_once(KERN_WARNING "kvm: segment base is not "
-					"paragraph aligned when entering "
-					"protected mode (seg=%d)", seg);
+			pr_warn_once("segment base is not paragraph aligned "
+				     "when entering protected mode (seg=%d)", seg);
 	}
 
 	vmcs_write16(sf->selector, var.selector);
@@ -3020,8 +3020,7 @@ static void enter_rmode(struct kvm_vcpu *vcpu)
 	 * vcpu. Warn the user that an update is overdue.
 	 */
 	if (!kvm_vmx->tss_addr)
-		printk_once(KERN_WARNING "kvm: KVM_SET_TSS_ADDR need to be "
-			     "called before entering vcpu\n");
+		pr_warn_once("KVM_SET_TSS_ADDR needs to be called before running vCPU\n");
 
 	vmx_segment_cache_clear(vmx);
 
@@ -6882,7 +6881,7 @@ static void handle_external_interrupt_irqoff(struct kvm_vcpu *vcpu)
 	gate_desc *desc = (gate_desc *)host_idt_base + vector;
 
 	if (KVM_BUG(!is_external_intr(intr_info), vcpu->kvm,
-	    "KVM: unexpected VM-Exit interrupt info: 0x%x", intr_info))
+	    "unexpected VM-Exit interrupt info: 0x%x", intr_info))
 		return;
 
 	handle_interrupt_nmi_irqoff(vcpu, gate_offset(desc));
@@ -7487,7 +7486,7 @@ static int __init vmx_check_processor_compat(void)
 
 	if (!this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
 	    !this_cpu_has(X86_FEATURE_VMX)) {
-		pr_err("kvm: VMX is disabled on CPU %d\n", smp_processor_id());
+		pr_err("VMX is disabled on CPU %d\n", smp_processor_id());
 		return -EIO;
 	}
 
@@ -7496,8 +7495,7 @@ static int __init vmx_check_processor_compat(void)
 	if (nested)
 		nested_vmx_setup_ctls_msrs(&vmcs_conf, vmx_cap.ept);
 	if (memcmp(&vmcs_config, &vmcs_conf, sizeof(struct vmcs_config)) != 0) {
-		printk(KERN_ERR "kvm: CPU %d feature inconsistency!\n",
-				smp_processor_id());
+		pr_err("CPU %d feature inconsistency!\n", smp_processor_id());
 		return -EIO;
 	}
 	return 0;
@@ -8322,7 +8320,7 @@ static __init int hardware_setup(void)
 		return -EIO;
 
 	if (cpu_has_perf_global_ctrl_bug())
-		pr_warn_once("kvm: VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL "
+		pr_warn_once("VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL "
 			     "does not work properly. Using workaround\n");
 
 	if (boot_cpu_has(X86_FEATURE_NX))
@@ -8330,7 +8328,7 @@ static __init int hardware_setup(void)
 
 	if (boot_cpu_has(X86_FEATURE_MPX)) {
 		rdmsrl(MSR_IA32_BNDCFGS, host_bndcfgs);
-		WARN_ONCE(host_bndcfgs, "KVM: BNDCFGS in host will be lost");
+		WARN_ONCE(host_bndcfgs, "BNDCFGS in host will be lost");
 	}
 
 	if (!cpu_has_vmx_mpx())
@@ -8349,7 +8347,7 @@ static __init int hardware_setup(void)
 
 	/* NX support is required for shadow paging. */
 	if (!enable_ept && !boot_cpu_has(X86_FEATURE_NX)) {
-		pr_err_ratelimited("kvm: NX (Execute Disable) not supported\n");
+		pr_err_ratelimited("NX (Execute Disable) not supported\n");
 		return -EOPNOTSUPP;
 	}
 
diff --git a/arch/x86/kvm/vmx/vmx_ops.h b/arch/x86/kvm/vmx/vmx_ops.h
index f6f23c7397dc..bc043f68d06b 100644
--- a/arch/x86/kvm/vmx/vmx_ops.h
+++ b/arch/x86/kvm/vmx/vmx_ops.h
@@ -86,8 +86,8 @@ static __always_inline unsigned long __vmcs_readl(unsigned long field)
 	return value;
 
 do_fail:
-	WARN_ONCE(1, "kvm: vmread failed: field=%lx\n", field);
-	pr_warn_ratelimited("kvm: vmread failed: field=%lx\n", field);
+	WARN_ONCE(1, KBUILD_MODNAME ": vmread failed: field=%lx\n", field);
+	pr_warn_ratelimited(KBUILD_MODNAME ": vmread failed: field=%lx\n", field);
 	return 0;
 
 do_exception:
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 566156b34314..3d5455e08191 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -15,6 +15,7 @@
  *   Amit Shah    <amit.shah@qumranet.com>
  *   Ben-Ami Yassour <benami@il.ibm.com>
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kvm_host.h>
 #include "irq.h"
@@ -2093,7 +2094,7 @@ static int kvm_emulate_monitor_mwait(struct kvm_vcpu *vcpu, const char *insn)
 	    !guest_cpuid_has(vcpu, X86_FEATURE_MWAIT))
 		return kvm_handle_invalid_op(vcpu);
 
-	pr_warn_once("kvm: %s instruction emulated as NOP!\n", insn);
+	pr_warn_once("%s instruction emulated as NOP!\n", insn);
 	return kvm_emulate_as_nop(vcpu);
 }
 int kvm_emulate_mwait(struct kvm_vcpu *vcpu)
@@ -2442,7 +2443,8 @@ static int kvm_set_tsc_khz(struct kvm_vcpu *vcpu, u32 user_tsc_khz)
 	thresh_lo = adjust_tsc_khz(tsc_khz, -tsc_tolerance_ppm);
 	thresh_hi = adjust_tsc_khz(tsc_khz, tsc_tolerance_ppm);
 	if (user_tsc_khz < thresh_lo || user_tsc_khz > thresh_hi) {
-		pr_debug("kvm: requested TSC rate %u falls outside tolerance [%u,%u]\n", user_tsc_khz, thresh_lo, thresh_hi);
+		pr_debug("requested TSC rate %u falls outside tolerance [%u,%u]\n",
+			 user_tsc_khz, thresh_lo, thresh_hi);
 		use_scaling = 1;
 	}
 	return set_tsc_khz(vcpu, user_tsc_khz, use_scaling);
@@ -7693,7 +7695,7 @@ static int emulator_cmpxchg_emulated(struct x86_emulate_ctxt *ctxt,
 	return X86EMUL_CONTINUE;
 
 emul_write:
-	printk_once(KERN_WARNING "kvm: emulating exchange as write\n");
+	pr_warn_once("emulating exchange as write\n");
 
 	return emulator_write_emulated(ctxt, addr, new, bytes, exception);
 }
@@ -8254,7 +8256,7 @@ static struct x86_emulate_ctxt *alloc_emulate_ctxt(struct kvm_vcpu *vcpu)
 
 	ctxt = kmem_cache_zalloc(x86_emulator_cache, GFP_KERNEL_ACCOUNT);
 	if (!ctxt) {
-		pr_err("kvm: failed to allocate vcpu's emulator\n");
+		pr_err("failed to allocate vcpu's emulator\n");
 		return NULL;
 	}
 
@@ -9309,17 +9311,17 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	int r, cpu;
 
 	if (kvm_x86_ops.hardware_enable) {
-		pr_err("kvm: already loaded vendor module '%s'\n", kvm_x86_ops.name);
+		pr_err("already loaded vendor module '%s'\n", kvm_x86_ops.name);
 		return -EEXIST;
 	}
 
 	if (!ops->cpu_has_kvm_support()) {
-		pr_err_ratelimited("kvm: no hardware support for '%s'\n",
+		pr_err_ratelimited("no hardware support for '%s'\n",
 				   ops->runtime_ops->name);
 		return -EOPNOTSUPP;
 	}
 	if (ops->disabled_by_bios()) {
-		pr_err_ratelimited("kvm: support for '%s' disabled by bios\n",
+		pr_err_ratelimited("support for '%s' disabled by bios\n",
 				   ops->runtime_ops->name);
 		return -EOPNOTSUPP;
 	}
@@ -9330,7 +9332,7 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	 * vCPU's FPU state as a fxregs_state struct.
 	 */
 	if (!boot_cpu_has(X86_FEATURE_FPU) || !boot_cpu_has(X86_FEATURE_FXSR)) {
-		printk(KERN_ERR "kvm: inadequate fpu\n");
+		pr_err("inadequate fpu\n");
 		return -EOPNOTSUPP;
 	}
 
@@ -9348,19 +9350,19 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	 */
 	if (rdmsrl_safe(MSR_IA32_CR_PAT, &host_pat) ||
 	    (host_pat & GENMASK(2, 0)) != 6) {
-		pr_err("kvm: host PAT[0] is not WB\n");
+		pr_err("host PAT[0] is not WB\n");
 		return -EIO;
 	}
 
 	x86_emulator_cache = kvm_alloc_emulator_cache();
 	if (!x86_emulator_cache) {
-		pr_err("kvm: failed to allocate cache for x86 emulator\n");
+		pr_err("failed to allocate cache for x86 emulator\n");
 		return -ENOMEM;
 	}
 
 	user_return_msrs = alloc_percpu(struct kvm_user_return_msrs);
 	if (!user_return_msrs) {
-		printk(KERN_ERR "kvm: failed to allocate percpu kvm_user_return_msrs\n");
+		pr_err("failed to allocate percpu kvm_user_return_msrs\n");
 		r = -ENOMEM;
 		goto out_free_x86_emulator_cache;
 	}
@@ -11634,7 +11636,7 @@ static int sync_regs(struct kvm_vcpu *vcpu)
 int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 {
 	if (kvm_check_tsc_unstable() && kvm->created_vcpus)
-		pr_warn_once("kvm: SMP vm created on host with unstable TSC; "
+		pr_warn_once("SMP vm created on host with unstable TSC; "
 			     "guest TSC will not be reliable\n");
 
 	if (!kvm->arch.max_vcpu_ids)
@@ -11711,7 +11713,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 		goto free_wbinvd_dirty_mask;
 
 	if (!fpu_alloc_guest_fpstate(&vcpu->arch.guest_fpu)) {
-		pr_err("kvm: failed to allocate vcpu's fpu\n");
+		pr_err("failed to allocate vcpu's fpu\n");
 		goto free_emulate_ctxt;
 	}
 
diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index b246decb53a9..3bf7d69373cf 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -5,6 +5,7 @@
  *
  * KVM Xen emulation
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include "x86.h"
 #include "xen.h"
-- 
2.38.1.584.g0f3c55d4c2-goog

