Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EDA7A2C9D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 02:44:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yMZ4fPPz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnXPB0SBpz3fJr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 10:43:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yMZ4fPPz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3dpcezqykdkuxjfsohlttlqj.htrqnszcuuh-ijaqnxyx.teqfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnX7B3W0Dz3dFB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 10:31:50 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1c4159a5e03so21507805ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824309; x=1695429109; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Sk1hp6a+9RZ3IPJ6o3Xc56HeuESZXshWdRu3KxHYbOk=;
        b=yMZ4fPPzr1cL7Nhiwjcv2jvqM7k85XivFy8hfl05Xy1Ed6NKGhmnwHC5Pt8JFMDY4u
         I4EYaRBYBMJHaOELDi8P/xxkAucbWczB4JXF7IoOqed2SVRCQpBbUPo8dQKRbIOgkQPN
         KheXToWHqHuPi6QeM6rwmxHUAOmPXjz5c20/xO4FVISyajrfrsXkg7DWY7Jzh1pTa14V
         7Kvubfd2dOFAhev1WYg6tYN2E7+Ft5jQ5Dkss4pJlE+cOzuoG9JYR1rNFhGj3M7sdyR1
         ekosE8z5o+BsY/GHIsckdS9ZWV2uU8+kkMlHF5z1Gv5wivMyXgjgF/HWq43bx/f0HKfB
         qJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824309; x=1695429109;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sk1hp6a+9RZ3IPJ6o3Xc56HeuESZXshWdRu3KxHYbOk=;
        b=WZ1tYyax/gWfr3F/zeAXDcPS1cQSfVmoPyY4UFXj8BUjO/3NhgdiVIYEBYvUgQdzb3
         4MRhyIG2pdrduVo7oZ0stCyKkakRSHD/WFBnoY/z1WS8JAUjHklwSk71uQhDQMyof3Nc
         /TuOeBd5P+HIV/3dlcoWCHQUO/okRjuBx3ElUksN9hmgKXgX79ikHVhAw9ol760rh9gD
         9Nlw3vE9T7qkTZTa6kVG5tdVt4VoWsVbiTh97bYt24zrT0jQ008TxXVl7RvpssSBunK8
         fxCKGME3KhyUFzq+Xr1KXTc1mxDGvi6zxq/rhthuIXSAWOLJmAWxUudUt2ZzWmFvcxwE
         1iZA==
X-Gm-Message-State: AOJu0Yzy0lt5QUtb5xqhBS+fgQeVo7SCWUpirnH4LZ2fbYzhr5LO/Rlc
	u7lRLrw/RyegATUWBMutUbF1YKVvBB8=
X-Google-Smtp-Source: AGHT+IEU0Z6VTALFS9lpMvjwmAs1FMCn1bdYRkBSaQPqDHqpJxatiQ9z1iTR+rqsJ4lFbhN56fBBI/37KSI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f341:b0:1b9:df8f:888c with SMTP id
 q1-20020a170902f34100b001b9df8f888cmr57331ple.8.1694824308805; Fri, 15 Sep
 2023 17:31:48 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:06 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-15-seanjc@google.com>
Subject: [PATCH 14/26] KVM: arm64: Move ARM specific headers in include/kvm to
 arch directory
From: Sean Christopherson <seanjc@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Andy Lutomirski <luto@kernel.org>
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, Venkatesh Srinivas <venkateshs@chromium.org>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Thornton <andrewth@google.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move kvm/arm_{arch_timer,pmu,vgic}.h to arch/arm64/include/asm and drop
the "arm" prefix from all file names.  Now that KVM no longer supports
32-bit ARM, there is no reason to expose ARM specific headers to other
architectures beyond arm64.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../arm64/include/asm/kvm_arch_timer.h                     | 0
 arch/arm64/include/asm/kvm_host.h                          | 7 +++----
 include/kvm/arm_pmu.h => arch/arm64/include/asm/kvm_pmu.h  | 0
 .../kvm/arm_vgic.h => arch/arm64/include/asm/kvm_vgic.h    | 0
 arch/arm64/kvm/arch_timer.c                                | 5 ++---
 arch/arm64/kvm/arm.c                                       | 3 +--
 arch/arm64/kvm/pmu-emul.c                                  | 6 +++---
 arch/arm64/kvm/reset.c                                     | 3 +--
 arch/arm64/kvm/trace_arm.h                                 | 2 +-
 arch/arm64/kvm/vgic/vgic-debug.c                           | 2 +-
 arch/arm64/kvm/vgic/vgic-init.c                            | 2 +-
 arch/arm64/kvm/vgic/vgic-irqfd.c                           | 2 +-
 arch/arm64/kvm/vgic/vgic-kvm-device.c                      | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio-v2.c                         | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio-v3.c                         | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio.c                            | 4 ++--
 arch/arm64/kvm/vgic/vgic-v2.c                              | 2 +-
 arch/arm64/kvm/vgic/vgic-v3.c                              | 2 +-
 18 files changed, 21 insertions(+), 25 deletions(-)
 rename include/kvm/arm_arch_timer.h => arch/arm64/include/asm/kvm_arch_timer.h (100%)
 rename include/kvm/arm_pmu.h => arch/arm64/include/asm/kvm_pmu.h (100%)
 rename include/kvm/arm_vgic.h => arch/arm64/include/asm/kvm_vgic.h (100%)

diff --git a/include/kvm/arm_arch_timer.h b/arch/arm64/include/asm/kvm_arch_timer.h
similarity index 100%
rename from include/kvm/arm_arch_timer.h
rename to arch/arm64/include/asm/kvm_arch_timer.h
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index af06ccb7ee34..90cfbf420545 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -26,16 +26,15 @@
 #include <asm/daifflags.h>
 #include <asm/fpsimd.h>
 #include <asm/kvm.h>
+#include <asm/kvm_arch_timer.h>
 #include <asm/kvm_asm.h>
+#include <asm/kvm_pmu.h>
+#include <asm/kvm_vgic.h>
 
 #define __KVM_HAVE_ARCH_INTC_INITIALIZED
 
 #define KVM_HALT_POLL_NS_DEFAULT 500000
 
-#include <kvm/arm_vgic.h>
-#include <kvm/arm_arch_timer.h>
-#include <kvm/arm_pmu.h>
-
 #define KVM_MAX_VCPUS VGIC_V3_MAX_CPUS
 
 #define KVM_VCPU_MAX_FEATURES 7
diff --git a/include/kvm/arm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
similarity index 100%
rename from include/kvm/arm_pmu.h
rename to arch/arm64/include/asm/kvm_pmu.h
diff --git a/include/kvm/arm_vgic.h b/arch/arm64/include/asm/kvm_vgic.h
similarity index 100%
rename from include/kvm/arm_vgic.h
rename to arch/arm64/include/asm/kvm_vgic.h
diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 6dcdae4d38cb..5e40bea8f3f3 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -14,12 +14,11 @@
 
 #include <clocksource/arm_arch_timer.h>
 #include <asm/arch_timer.h>
+#include <asm/kvm_arch_timer.h>
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_nested.h>
-
-#include <kvm/arm_vgic.h>
-#include <kvm/arm_arch_timer.h>
+#include <asm/kvm_vgic.h>
 
 #include "trace.h"
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 6de1d63b981b..6480628197b4 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -39,10 +39,9 @@
 #include <asm/kvm_nested.h>
 #include <asm/kvm_pkvm.h>
 #include <asm/kvm_emulate.h>
+#include <asm/kvm_pmu.h>
 #include <asm/sections.h>
 
-#include <kvm/arm_pmu.h>
-
 #include "arm_hypercalls.h"
 #include "arm_psci.h"
 
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 6b066e04dc5d..b5d999adce56 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -11,10 +11,10 @@
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmu.h>
 #include <linux/uaccess.h>
-#include <asm/kvm_emulate.h>
-#include <kvm/arm_pmu.h>
-#include <kvm/arm_vgic.h>
 #include <asm/arm_pmuv3.h>
+#include <asm/kvm_emulate.h>
+#include <asm/kvm_pmu.h>
+#include <asm/kvm_vgic.h>
 
 #define PERF_ATTR_CFG1_COUNTER_64BIT	BIT(0)
 
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 7a65a35ee4ac..ad5e239774f1 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -17,12 +17,11 @@
 #include <linux/string.h>
 #include <linux/types.h>
 
-#include <kvm/arm_arch_timer.h>
-
 #include <asm/cpufeature.h>
 #include <asm/cputype.h>
 #include <asm/fpsimd.h>
 #include <asm/ptrace.h>
+#include <asm/kvm_arch_timer.h>
 #include <asm/kvm_arm.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_emulate.h>
diff --git a/arch/arm64/kvm/trace_arm.h b/arch/arm64/kvm/trace_arm.h
index 8ad53104934d..76ef72de6133 100644
--- a/arch/arm64/kvm/trace_arm.h
+++ b/arch/arm64/kvm/trace_arm.h
@@ -3,7 +3,7 @@
 #define _TRACE_ARM_ARM64_KVM_H
 
 #include <asm/kvm_emulate.h>
-#include <kvm/arm_arch_timer.h>
+#include <asm/kvm_arch_timer.h>
 #include <linux/tracepoint.h>
 
 #undef TRACE_SYSTEM
diff --git a/arch/arm64/kvm/vgic/vgic-debug.c b/arch/arm64/kvm/vgic/vgic-debug.c
index 07aa0437125a..2d542040008c 100644
--- a/arch/arm64/kvm/vgic/vgic-debug.c
+++ b/arch/arm64/kvm/vgic/vgic-debug.c
@@ -9,7 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/kvm_host.h>
 #include <linux/seq_file.h>
-#include <kvm/arm_vgic.h>
+#include <asm/kvm_vgic.h>
 #include <asm/kvm_mmu.h>
 #include "vgic.h"
 
diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index c8c3cb812783..9f548ffac90b 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -7,7 +7,7 @@
 #include <linux/interrupt.h>
 #include <linux/cpu.h>
 #include <linux/kvm_host.h>
-#include <kvm/arm_vgic.h>
+#include <asm/kvm_vgic.h>
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_mmu.h>
 #include "vgic.h"
diff --git a/arch/arm64/kvm/vgic/vgic-irqfd.c b/arch/arm64/kvm/vgic/vgic-irqfd.c
index 475059bacedf..c35e1a138617 100644
--- a/arch/arm64/kvm/vgic/vgic-irqfd.c
+++ b/arch/arm64/kvm/vgic/vgic-irqfd.c
@@ -6,7 +6,7 @@
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
 #include <trace/events/kvm.h>
-#include <kvm/arm_vgic.h>
+#include <asm/kvm_vgic.h>
 #include "vgic.h"
 
 /**
diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
index 212b73a715c1..2c7027d675c9 100644
--- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
+++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
@@ -6,7 +6,7 @@
  * Author: Marc Zyngier <marc.zyngier@arm.com>
  */
 #include <linux/kvm_host.h>
-#include <kvm/arm_vgic.h>
+#include <asm/kvm_vgic.h>
 #include <linux/uaccess.h>
 #include <asm/kvm_mmu.h>
 #include <asm/cputype.h>
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v2.c b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
index e070cda86e12..bba0cfeefffe 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
@@ -9,7 +9,7 @@
 #include <linux/nospec.h>
 
 #include <kvm/iodev.h>
-#include <kvm/arm_vgic.h>
+#include <asm/kvm_vgic.h>
 
 #include "vgic.h"
 #include "vgic-mmio.h"
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 188d2187eede..d54a90beef61 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -9,11 +9,11 @@
 #include <linux/kvm_host.h>
 #include <linux/interrupt.h>
 #include <kvm/iodev.h>
-#include <kvm/arm_vgic.h>
 
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_arm.h>
 #include <asm/kvm_mmu.h>
+#include <asm/kvm_vgic.h>
 
 #include "vgic.h"
 #include "vgic-mmio.h"
diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
index ff558c05e990..68a3d8062473 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio.c
@@ -10,8 +10,8 @@
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
 #include <kvm/iodev.h>
-#include <kvm/arm_arch_timer.h>
-#include <kvm/arm_vgic.h>
+#include <asm/kvm_arch_timer.h>
+#include <asm/kvm_vgic.h>
 
 #include "vgic.h"
 #include "vgic-mmio.h"
diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 7e9cdb78f7ce..7eacf1c850a5 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -6,7 +6,7 @@
 #include <linux/irqchip/arm-gic.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
-#include <kvm/arm_vgic.h>
+#include <asm/kvm_vgic.h>
 #include <asm/kvm_mmu.h>
 
 #include "vgic.h"
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 3dfc8b84e03e..e8501828072b 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -6,7 +6,7 @@
 #include <linux/kstrtox.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
-#include <kvm/arm_vgic.h>
+#include <asm/kvm_vgic.h>
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_asm.h>
-- 
2.42.0.459.ge4e396fd5e-goog

