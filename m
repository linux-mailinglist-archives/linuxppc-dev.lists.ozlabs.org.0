Return-Path: <linuxppc-dev+bounces-9267-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBD9AD473B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 02:11:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH5fN2dRQz309v;
	Wed, 11 Jun 2025 10:10:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749600652;
	cv=none; b=D7QPaiS2D126KN10qHPr53Le2sjZ9h+nU5dkLH9ZlDOKGGGP4F9mc+oPersOcL0qh01W35brPQ8eWtMb3af5Jryofh4eWGcNfo1H02e1d8Kg4BIj3cvWO3GXjaCLMtWF8UyfpMDy6THSsNeziayiEGmksKmKM+I6DIX770bHQqeh32X9BrlEgh5ebbrsvPlPxIHFLex1LpV1OT3wCvbfLLg4jPNxfN7Zsd2vr28fQ8/+MQwH1e6TH0N3Mi/PuXXXMJoN+9JUeGo0s66asXb6rzlPowb/gcIaKhCdeq7i7uuK126UOuU4DNt8Cs3GA8UWh5eap2683V8noqrKKxjFBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749600652; c=relaxed/relaxed;
	bh=T9v9a40eFZn9R1EW7cZiJp8oFw/IePLxWs4fhJywAPc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Iio3a+GJ/I8LfqzgOPYO7B/jiZpzOL3CFbSKYQERgQMpeXhXf0Qeqt8Rn/6zrDIUItZnPYZ1VnAZmnNDhwrwY0Z759O0B1TSnCKIBuyMjjiPcQFb13FX6Asl4KX3mltqRWDIWMgATe6OZKzFhdZ3aancseEkKA4edwWd7PowfLmpHAZvN5K2cP8JVqPZq4PJCfjLq5xuR355oJlJiXIzXAJq3OOGcE8VmNT5Ov/0fp8BwctSbym25MSPym9q7UAzyktqond3LEvapcfUlY+TXHCL1TdotpUlK9wOWt9cW9ndrOQidwsfj2Gu8/PhjjmIsPHq9JObRSq3smiACgHB4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KuJMq/N6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3hsliaaykdiu1njwslpxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KuJMq/N6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3hsliaaykdiu1njwslpxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bH5fL0Lc4z2xlL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 10:10:49 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b26e6b84a31so3556400a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 17:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600647; x=1750205447; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=T9v9a40eFZn9R1EW7cZiJp8oFw/IePLxWs4fhJywAPc=;
        b=KuJMq/N6Ef08TeqCmw4oG3PE3UCftg3Mt1Jgof1hqIHUpKqPF9alzb8XkdDxK4f6Oy
         4Gz9cKcNiwDxRA4Jy1VFLrlOo79BuZqDvclQ/2c0vJ6W1FeYb89goY5pV0ZI+8j5S+3r
         crYZIIe3v0OzBz/8WzViNkx7KTiDLRUqUIvzLsG6x+x4cSkEBec7C484zyvgAHdJUoNr
         /m4zJOUpLeeo0lnXEUJYWj0rwcK+76C0YkMSHefx/PKuqUGaNfVXgkT1RZrzU8kDwdOQ
         IWi9HuUXqDByiUHllZ6+SzOp0cMsvFQzwPb+5RuOMnXeqcqoJI1A3depQz69n5bz+dXW
         FBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600647; x=1750205447;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9v9a40eFZn9R1EW7cZiJp8oFw/IePLxWs4fhJywAPc=;
        b=t3narcbjNDf4qD7Q6byWlCYWPHiMcreBLANEQrEVTyZpfx/Zk7ZdB0UHAB6S0AubZ+
         dTVTWdN3+RyZoe9xgfufbK/NQ1E5jpbBmO+7TJIdwLnBWUyBhLGvBBbs7jqR0mDauYIV
         N5EyFjtlJ+kXeDqXjRMEn9neERy1GzUOzSkC1BYgDeTQNFsfmfl+ULbuPReDerAUihd5
         umtAcfX50CK4soF5Kos7/ii6xHWD5mIFzYGfDeY12PAPLm/PDMWqWwNOQig6LwQ02lSO
         D1MeMPDzdxBTlqrtgesvdIjiY/GfQFEBnPPsW3dSDLqCT7ZAA0a26MjHy6AjSI4G5EQa
         4uSw==
X-Forwarded-Encrypted: i=1; AJvYcCXMZ6SQ08EE6iF9r11Xc0Kneo7Nkfv+WMdy9sgtLLe7GL8TeBR8wiBS9chgNfCoBBK+zm2pSj0DGHecIxY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxxo5QyE+KpooOu6shP6Fdk4iEYMqWo2N9yEFlMkE8gvmAmhqPv
	JEwU3suQPOseA/Fbp00Kp0NcF6kQfNVOeF/+Hyu4mJkWGhpfskM5cuTndBpImrHxoBbZfwmXk8i
	tzCRzqA==
X-Google-Smtp-Source: AGHT+IEV2ehh3DZ0P6laELJQUxxjOzAbGJYmk59KPIK2LrFdETO4qOTGt38spkCAI0j7nNaUnHVLjxXIt54=
X-Received: from pjbpl16.prod.google.com ([2002:a17:90b:2690:b0:311:e9bb:f8d4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3a86:b0:311:df4b:4b7a
 with SMTP id 98e67ed59e1d1-313af23ff12mr1868472a91.29.1749600646996; Tue, 10
 Jun 2025 17:10:46 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 17:10:35 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
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
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-2-seanjc@google.com>
Subject: [PATCH 1/8] KVM: arm64: Move arm_{psci,hypercalls}.h to an internal
 KVM path
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Anish Ghulati <aghulati@google.com>

Move arm_hypercalls.h and arm_psci.h into arch/arm64/kvm now that KVM
no longer supports 32-bit ARM, i.e. now that there's no reason to make
the hypercall and PSCI APIs "public".

Signed-off-by: Anish Ghulati <aghulati@google.com>
[sean: squash into one patch, write changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c                         | 5 +++--
 {include => arch/arm64}/kvm/arm_hypercalls.h | 0
 {include => arch/arm64}/kvm/arm_psci.h       | 0
 arch/arm64/kvm/guest.c                       | 2 +-
 arch/arm64/kvm/handle_exit.c                 | 2 +-
 arch/arm64/kvm/hyp/Makefile                  | 6 +++---
 arch/arm64/kvm/hyp/include/hyp/switch.h      | 4 ++--
 arch/arm64/kvm/hyp/nvhe/switch.c             | 4 ++--
 arch/arm64/kvm/hyp/vhe/switch.c              | 4 ++--
 arch/arm64/kvm/hypercalls.c                  | 4 ++--
 arch/arm64/kvm/psci.c                        | 4 ++--
 arch/arm64/kvm/pvtime.c                      | 2 +-
 arch/arm64/kvm/trng.c                        | 2 +-
 13 files changed, 20 insertions(+), 19 deletions(-)
 rename {include => arch/arm64}/kvm/arm_hypercalls.h (100%)
 rename {include => arch/arm64}/kvm/arm_psci.h (100%)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index de2b4e9c9f9f..017c95c7bd03 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -42,9 +42,10 @@
 #include <asm/kvm_ptrauth.h>
 #include <asm/sections.h>
 
-#include <kvm/arm_hypercalls.h>
 #include <kvm/arm_pmu.h>
-#include <kvm/arm_psci.h>
+
+#include "arm_hypercalls.h"
+#include "arm_psci.h"
 
 #include "sys_regs.h"
 
diff --git a/include/kvm/arm_hypercalls.h b/arch/arm64/kvm/arm_hypercalls.h
similarity index 100%
rename from include/kvm/arm_hypercalls.h
rename to arch/arm64/kvm/arm_hypercalls.h
diff --git a/include/kvm/arm_psci.h b/arch/arm64/kvm/arm_psci.h
similarity index 100%
rename from include/kvm/arm_psci.h
rename to arch/arm64/kvm/arm_psci.h
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 2196979a24a3..699a2f975350 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -18,7 +18,6 @@
 #include <linux/string.h>
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
-#include <kvm/arm_hypercalls.h>
 #include <asm/cputype.h>
 #include <linux/uaccess.h>
 #include <asm/fpsimd.h>
@@ -27,6 +26,7 @@
 #include <asm/kvm_nested.h>
 #include <asm/sigcontext.h>
 
+#include "arm_hypercalls.h"
 #include "trace.h"
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 453266c96481..32a7b7c22924 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -22,7 +22,7 @@
 #include <asm/stacktrace/nvhe.h>
 #include <asm/traps.h>
 
-#include <kvm/arm_hypercalls.h>
+#include "arm_hypercalls.h"
 
 #define CREATE_TRACE_POINTS
 #include "trace_handle_exit.h"
diff --git a/arch/arm64/kvm/hyp/Makefile b/arch/arm64/kvm/hyp/Makefile
index d61e44642f98..b1a4884446c6 100644
--- a/arch/arm64/kvm/hyp/Makefile
+++ b/arch/arm64/kvm/hyp/Makefile
@@ -3,8 +3,8 @@
 # Makefile for Kernel-based Virtual Machine module, HYP part
 #
 
-incdir := $(src)/include
-subdir-asflags-y := -I$(incdir)
-subdir-ccflags-y := -I$(incdir)
+hyp_includes := -I$(src)/include -I$(srctree)/arch/arm64/kvm
+subdir-asflags-y := $(hyp_includes)
+subdir-ccflags-y := $(hyp_includes)
 
 obj-$(CONFIG_KVM) += vhe/ nvhe/ pgtable.o
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index bb9f2eecfb67..340a57e0ed7c 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -16,8 +16,6 @@
 #include <linux/jump_label.h>
 #include <uapi/linux/psci.h>
 
-#include <kvm/arm_psci.h>
-
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
 #include <asm/extable.h>
@@ -32,6 +30,8 @@
 #include <asm/processor.h>
 #include <asm/traps.h>
 
+#include "arm_psci.h"
+
 struct kvm_exception_table_entry {
 	int insn, fixup;
 };
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 73affe1333a4..e0610cf683ab 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -13,8 +13,6 @@
 #include <linux/jump_label.h>
 #include <uapi/linux/psci.h>
 
-#include <kvm/arm_psci.h>
-
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
 #include <asm/kprobes.h>
@@ -28,6 +26,8 @@
 
 #include <nvhe/mem_protect.h>
 
+#include "arm_psci.h"
+
 /* Non-VHE specific context */
 DEFINE_PER_CPU(struct kvm_host_data, kvm_host_data);
 DEFINE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index c9b330dc2066..96be652caf3a 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -13,8 +13,6 @@
 #include <linux/percpu.h>
 #include <uapi/linux/psci.h>
 
-#include <kvm/arm_psci.h>
-
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
 #include <asm/kprobes.h>
@@ -28,6 +26,8 @@
 #include <asm/thread_info.h>
 #include <asm/vectors.h>
 
+#include "arm_psci.h"
+
 /* VHE specific context */
 DEFINE_PER_CPU(struct kvm_host_data, kvm_host_data);
 DEFINE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);
diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
index 569941eeb3fe..002f4c593e90 100644
--- a/arch/arm64/kvm/hypercalls.c
+++ b/arch/arm64/kvm/hypercalls.c
@@ -6,8 +6,8 @@
 
 #include <asm/kvm_emulate.h>
 
-#include <kvm/arm_hypercalls.h>
-#include <kvm/arm_psci.h>
+#include "arm_hypercalls.h"
+#include "arm_psci.h"
 
 #define KVM_ARM_SMCCC_STD_FEATURES				\
 	GENMASK(KVM_REG_ARM_STD_BMAP_BIT_COUNT - 1, 0)
diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
index 3b5dbe9a0a0e..0566b5907497 100644
--- a/arch/arm64/kvm/psci.c
+++ b/arch/arm64/kvm/psci.c
@@ -13,8 +13,8 @@
 #include <asm/cputype.h>
 #include <asm/kvm_emulate.h>
 
-#include <kvm/arm_psci.h>
-#include <kvm/arm_hypercalls.h>
+#include "arm_hypercalls.h"
+#include "arm_psci.h"
 
 /*
  * This is an implementation of the Power State Coordination Interface
diff --git a/arch/arm64/kvm/pvtime.c b/arch/arm64/kvm/pvtime.c
index 4ceabaa4c30b..b07d250d223c 100644
--- a/arch/arm64/kvm/pvtime.c
+++ b/arch/arm64/kvm/pvtime.c
@@ -8,7 +8,7 @@
 #include <asm/kvm_mmu.h>
 #include <asm/pvclock-abi.h>
 
-#include <kvm/arm_hypercalls.h>
+#include "arm_hypercalls.h"
 
 void kvm_update_stolen_time(struct kvm_vcpu *vcpu)
 {
diff --git a/arch/arm64/kvm/trng.c b/arch/arm64/kvm/trng.c
index 99bdd7103c9c..b5dc0f09797a 100644
--- a/arch/arm64/kvm/trng.c
+++ b/arch/arm64/kvm/trng.c
@@ -6,7 +6,7 @@
 
 #include <asm/kvm_emulate.h>
 
-#include <kvm/arm_hypercalls.h>
+#include "arm_hypercalls.h"
 
 #define ARM_SMCCC_TRNG_VERSION_1_0	0x10000UL
 
-- 
2.50.0.rc0.642.g800a2b2222-goog


