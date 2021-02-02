Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 154BC30B5A3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 04:07:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV8qY2ScqzDr3h
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 14:07:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Fmz09ZyK; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV8lS4bxgzDqLM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 14:03:30 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id c132so13961128pga.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Feb 2021 19:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jchf+V+wUR9krsH1j6IE7Mp1qdFdwpiUKUddfVjwQwo=;
 b=Fmz09ZyK9kfjrlm1eOk0Rp1kjQT6NtKHLf0Os/BQLym0dui6AiHd4TTORFtSTkOK/6
 0yPT1k3L6iVAAGS8P3scTE9yhMaz3DH66ZRMMdPVFEJAPOM955Aq5e8ls96wtGN178oG
 ecfKp5hVgxfbH3TYHhoxNBAARGA1XCVABszYndeRvIBi36vf6CIU+0Yr6Rv4UZQ3uYI2
 hVugInozCGGgiVRNuGURGBE0u2mP3lciYosULYLTtLYwXNrhE15s5RObu7TxPNY7KqOY
 /QPjR8uGmagYRU9GkXIsjgSpCsqAD5VaMriB9ZlYQ3xlT0OSj1flGK9TbTvixgIizIkd
 dCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jchf+V+wUR9krsH1j6IE7Mp1qdFdwpiUKUddfVjwQwo=;
 b=nZlHm6Tl91l4uT1mpgNsENg8tleE9pm6DntdOR0rammD8WEJEZZDrEKeMopJxn02N4
 /AztF0WVKI9K3jW4UBULStRyMQxT3bweZqYUW/lYWItDy3sm2pAGwu3TrHGTMspvKxmF
 ALgNThihpWIUE9W1nMAoRXkwNlxXN3N4WexqV8Jgms3SN3nehx1SvrH5wKbGcYW+NI3G
 XmjAD4lUSWRQPS2FOk0A0xtwMqLxlsQfymFUpqxIa2uWPVX3SBsRkILQ30J5TuYe0/Xr
 GVnfJimPgfm9EVWFU3a+Kh3aIEfsfWTXcgQHvrHOCYWQlzCkaoRqfm5O3dRjG2DxQIIR
 HLzw==
X-Gm-Message-State: AOAM532w/KpzHODnTOTAaWOQGvH2cFojeaEgdiEC4qB00nUQHtE3vShf
 vFWySrr/3z/hKPLuljGf2IQ=
X-Google-Smtp-Source: ABdhPJw1dQQ4xj+zKmodF8HC0ElKEGjZF1nQ36BGBwnDrakwHl/JpaH8q54hmylxFif1eOmOIFfMTw==
X-Received: by 2002:a62:61c2:0:b029:1b9:19f5:dcfc with SMTP id
 v185-20020a6261c20000b02901b919f5dcfcmr18851963pfb.27.1612235007950; 
 Mon, 01 Feb 2021 19:03:27 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id a24sm20877337pff.18.2021.02.01.19.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 19:03:27 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 1/9] KVM: PPC: Book3S 64: move KVM interrupt entry to a
 common entry point
Date: Tue,  2 Feb 2021 13:03:05 +1000
Message-Id: <20210202030313.3509446-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210202030313.3509446-1-npiggin@gmail.com>
References: <20210202030313.3509446-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than bifurcate the call depending on whether or not HV is
possible, and have the HV entry test for PR, just make a single
common point which does the demultiplexing. This makes it simpler
to add another type of exit handler.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S    |  8 +-----
 arch/powerpc/kvm/Makefile               |  3 +++
 arch/powerpc/kvm/book3s_64_entry.S      | 34 +++++++++++++++++++++++++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 11 ++------
 4 files changed, 40 insertions(+), 16 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_64_entry.S

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e02ad6fefa46..65659ea3cec4 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -212,7 +212,6 @@ do_define_int n
 .endm
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 /*
  * All interrupts which set HSRR registers, as well as SRESET and MCE and
  * syscall when invoked with "sc 1" switch to MSR[HV]=1 (HVMODE) to be taken,
@@ -242,13 +241,8 @@ do_define_int n
 
 /*
  * If an interrupt is taken while a guest is running, it is immediately routed
- * to KVM to handle. If both HV and PR KVM arepossible, KVM interrupts go first
- * to kvmppc_interrupt_hv, which handles the PR guest case.
+ * to KVM to handle.
  */
-#define kvmppc_interrupt kvmppc_interrupt_hv
-#else
-#define kvmppc_interrupt kvmppc_interrupt_pr
-#endif
 
 .macro KVMTEST name
 	lbz	r10,HSTATE_IN_GUEST(r13)
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 2bfeaa13befb..cdd119028f64 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -59,6 +59,9 @@ kvm-pr-y := \
 kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
 	tm.o
 
+kvm-book3s_64-builtin-objs-y += \
+	book3s_64_entry.o
+
 ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
 	book3s_rmhandlers.o
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
new file mode 100644
index 000000000000..22e34b95f478
--- /dev/null
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -0,0 +1,34 @@
+#include <asm/cache.h>
+#include <asm/ppc_asm.h>
+#include <asm/kvm_asm.h>
+#include <asm/reg.h>
+#include <asm/asm-offsets.h>
+#include <asm/kvm_book3s_asm.h>
+
+/*
+ * We come here from the first-level interrupt handlers.
+ */
+.global	kvmppc_interrupt
+.balign IFETCH_ALIGN_BYTES
+kvmppc_interrupt:
+	/*
+	 * Register contents:
+	 * R12		= (guest CR << 32) | interrupt vector
+	 * R13		= PACA
+	 * guest R12 saved in shadow VCPU SCRATCH0
+	 * guest R13 saved in SPRN_SCRATCH0
+	 */
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	std	r9, HSTATE_SCRATCH2(r13)
+	lbz	r9, HSTATE_IN_GUEST(r13)
+	cmpwi	r9, KVM_GUEST_MODE_HOST_HV
+	beq	kvmppc_bad_host_intr
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
+	cmpwi	r9, KVM_GUEST_MODE_GUEST
+	ld	r9, HSTATE_SCRATCH2(r13)
+	beq	kvmppc_interrupt_pr
+#endif
+	b	kvmppc_interrupt_hv
+#else
+	b	kvmppc_interrupt_pr
+#endif
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 8cf1f69f442e..b9c4acd747f7 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1255,16 +1255,8 @@ kvmppc_interrupt_hv:
 	 * R13		= PACA
 	 * guest R12 saved in shadow VCPU SCRATCH0
 	 * guest R13 saved in SPRN_SCRATCH0
+	 * guest R9 saved in HSTATE_SCRATCH2
 	 */
-	std	r9, HSTATE_SCRATCH2(r13)
-	lbz	r9, HSTATE_IN_GUEST(r13)
-	cmpwi	r9, KVM_GUEST_MODE_HOST_HV
-	beq	kvmppc_bad_host_intr
-#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
-	cmpwi	r9, KVM_GUEST_MODE_GUEST
-	ld	r9, HSTATE_SCRATCH2(r13)
-	beq	kvmppc_interrupt_pr
-#endif
 	/* We're now back in the host but in guest MMU context */
 	li	r9, KVM_GUEST_MODE_HOST_HV
 	stb	r9, HSTATE_IN_GUEST(r13)
@@ -3253,6 +3245,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_P9_TM_HV_ASSIST)
  * cfar is saved in HSTATE_CFAR(r13)
  * ppr is saved in HSTATE_PPR(r13)
  */
+.global kvmppc_bad_host_intr
 kvmppc_bad_host_intr:
 	/*
 	 * Switch to the emergency stack, but start half-way down in
-- 
2.23.0

