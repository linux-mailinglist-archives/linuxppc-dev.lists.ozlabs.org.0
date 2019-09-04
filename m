Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85559A833F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 14:55:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NkLx35S9zDq5k
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 22:55:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eeM2uMlQ"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nj3d1XkXzDqnR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 21:57:01 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id r12so934307pfh.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2019 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LgmLY0QuG8iOauedHf/9F7NJQAgIrZdeAnpSH+vsTBY=;
 b=eeM2uMlQAaEI/uaGgBfqh40Y/eE9IlNnl8LiCEkiFyRLEg2eMbOcXeiJXky8uJTqtR
 k1RP9zUhBKExOiIk5+TMJCm5y3cLpzC3nKyVgpwg8SV7ZW5Cr4MU+qrD6qgWkA6M3MBY
 gjkulqI73tvYzMDSceV5bLwocprIggR/U5mw5L4yrG6HHZ5rlykjNEaI4xhH3mcQ8kha
 pEIiFZOSbzDUWQo9q194OWA/iTPKhTlCMdW1hoTFgIk4XNL2RCKxVmbJgJ82WRIFCCvF
 ATm7JZbIF7xX4hHq4yNningCGZjqrqhLTPT404E5SD2uaA2Zsq8SJr0FtLsW0f8QO90G
 3zaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LgmLY0QuG8iOauedHf/9F7NJQAgIrZdeAnpSH+vsTBY=;
 b=lGU3xfespr4jeWFRN+n1gSNiWLhlUOKjgGLNlaRbgkPX+NrVhjE9+VJmKc/G0jzRgl
 jmqujl94+NE9ex7503m1MaaxelPjHivnk70v/eumhka5bbtbHxoA/rJ9zlEeRGpnwgx/
 hFXNXiW75KkM+S3qFLxGkPvgm4NImB4v8tkEwBIVcZX1Zb6YWxFRzUXKCXLqs1ib5OKa
 LsTXec1deR2EJXX8ilLyJSVLmcM83pT0p5A/sICsiNYrCxJsJnbY38Vn951wMxdzToGj
 kuToc8suU3UkWGcRVlVsBjAeoiHX+mmQwqoJoQ2AzcVZipTqiN9r8VanBzPUN77u8wdU
 vkqA==
X-Gm-Message-State: APjAAAX5qq6slN+KWAQRcCeHzmI42OovgEGB6g7DsME7TynWO99Fv2JF
 AIRsWfp2DQMTohCqrMIf45chcuY0
X-Google-Smtp-Source: APXvYqzdT1bIHapviHw+Ki1BbJrXUkYMBI3aZf4JG3c40QDyxZDLwUfkHFcpQkRKqhn0qtSTnvL2aw==
X-Received: by 2002:a62:3644:: with SMTP id d65mr46152007pfa.128.1567598217056; 
 Wed, 04 Sep 2019 04:56:57 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id g18sm19554789pgm.9.2019.09.04.04.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 04:56:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 20/20] powerpc/64s/exception: only test KVM in SRR
 interrupts when PR KVM is supported
Date: Wed,  4 Sep 2019 21:55:35 +1000
Message-Id: <20190904115535.18559-21-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904115535.18559-1-npiggin@gmail.com>
References: <20190904115535.18559-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Apart from SRESET, MCE, and syscall (hcall variant), the SRR type
interrupts are not escalated to hypervisor mode, so delivered to the OS.

When running PR KVM, the OS is the hypervisor, and the guest runs with
MSR[PR]=1, so these interrupts must test if a guest was running when
interrupted. These tests are required at the real-mode entry points
because the PR KVM host runs with LPCR[AIL]=0.

In HV KVM and nested HV KVM, the guest always receives these interrupts,
so there is no need for the host to make this test. So remove the tests
if PR KVM is not configured.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 65 ++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 5171ed0e5f68..a711adf1e499 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -214,9 +214,36 @@ do_define_int n
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 /*
- * If hv is possible, interrupts come into to the hv version
- * of the kvmppc_interrupt code, which then jumps to the PR handler,
- * kvmppc_interrupt_pr, if the guest is a PR guest.
+ * All interrupts which set HSRR registers, as well as SRESET and MCE and
+ * syscall when invoked with "sc 1" switch to MSR[HV]=1 (HVMODE) to be taken,
+ * so they all generally need to test whether they were taken in guest context.
+ *
+ * Note: SRESET and MCE may also be sent to the guest by the hypervisor, and be
+ * taken with MSR[HV]=0.
+ *
+ * Interrupts which set SRR registers (with the above exceptions) do not
+ * elevate to MSR[HV]=1 mode, though most can be taken when running with
+ * MSR[HV]=1  (e.g., bare metal kernel and userspace). So these interrupts do
+ * not need to test whether a guest is running because they get delivered to
+ * the guest directly, including nested HV KVM guests.
+ *
+ * The exception is PR KVM, where the guest runs with MSR[PR]=1 and the host
+ * runs with MSR[HV]=0, so the host takes all interrupts on behalf of the
+ * guest. PR KVM runs with LPCR[AIL]=0 which causes interrupts to always be
+ * delivered to the real-mode entry point, therefore such interrupts only test
+ * KVM in their real mode handlers, and only when PR KVM is possible.
+ *
+ * Interrupts that are taken in MSR[HV]=0 and escalate to MSR[HV]=1 are always
+ * delivered in real-mode when the MMU is in hash mode because the MMU
+ * registers are not set appropriately to translate host addresses. In nested
+ * radix mode these can be delivered in virt-mode as the host translations are
+ * used implicitly (see: effective LPID, effective PID).
+ */
+
+/*
+ * If an interrupt is taken while a guest is running, it is immediately routed
+ * to KVM to handle. If both HV and PR KVM arepossible, KVM interrupts go first
+ * to kvmppc_interrupt_hv, which handles the PR guest case.
  */
 #define kvmppc_interrupt kvmppc_interrupt_hv
 #else
@@ -1250,8 +1277,10 @@ INT_DEFINE_BEGIN(data_access)
 	IVEC=0x300
 	IDAR=1
 	IDSISR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_SKIP=1
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(data_access)
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
@@ -1298,8 +1327,10 @@ INT_DEFINE_BEGIN(data_access_slb)
 	IAREA=PACA_EXSLB
 	IRECONCILE=0
 	IDAR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_SKIP=1
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(data_access_slb)
 
 EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
@@ -1349,7 +1380,9 @@ INT_DEFINE_BEGIN(instruction_access)
 	IISIDE=1
 	IDAR=1
 	IDSISR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(instruction_access)
 
 EXC_REAL_BEGIN(instruction_access, 0x400, 0x80)
@@ -1388,7 +1421,9 @@ INT_DEFINE_BEGIN(instruction_access_slb)
 	IRECONCILE=0
 	IISIDE=1
 	IDAR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(instruction_access_slb)
 
 EXC_REAL_BEGIN(instruction_access_slb, 0x480, 0x80)
@@ -1480,7 +1515,9 @@ INT_DEFINE_BEGIN(alignment)
 	IVEC=0x600
 	IDAR=1
 	IDSISR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(alignment)
 
 EXC_REAL_BEGIN(alignment, 0x600, 0x100)
@@ -1510,7 +1547,9 @@ EXC_COMMON_BEGIN(alignment_common)
  */
 INT_DEFINE_BEGIN(program_check)
 	IVEC=0x700
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(program_check)
 
 EXC_REAL_BEGIN(program_check, 0x700, 0x100)
@@ -1573,7 +1612,9 @@ EXC_COMMON_BEGIN(program_check_common)
 INT_DEFINE_BEGIN(fp_unavailable)
 	IVEC=0x800
 	IRECONCILE=0
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(fp_unavailable)
 
 EXC_REAL_BEGIN(fp_unavailable, 0x800, 0x100)
@@ -1635,7 +1676,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 INT_DEFINE_BEGIN(decrementer)
 	IVEC=0x900
 	IMASK=IRQS_DISABLED
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(decrementer)
 
 EXC_REAL_BEGIN(decrementer, 0x900, 0x80)
@@ -1720,7 +1763,9 @@ EXC_COMMON_BEGIN(hdecrementer_common)
 INT_DEFINE_BEGIN(doorbell_super)
 	IVEC=0xa00
 	IMASK=IRQS_DISABLED
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(doorbell_super)
 
 EXC_REAL_BEGIN(doorbell_super, 0xa00, 0x100)
@@ -1911,7 +1956,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
  */
 INT_DEFINE_BEGIN(single_step)
 	IVEC=0xd00
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(single_step)
 
 EXC_REAL_BEGIN(single_step, 0xd00, 0x100)
@@ -2200,7 +2247,9 @@ EXC_VIRT_NONE(0x4ee0, 0x20)
 INT_DEFINE_BEGIN(performance_monitor)
 	IVEC=0xf00
 	IMASK=IRQS_PMI_DISABLED
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(performance_monitor)
 
 EXC_REAL_BEGIN(performance_monitor, 0xf00, 0x20)
@@ -2229,7 +2278,9 @@ EXC_COMMON_BEGIN(performance_monitor_common)
 INT_DEFINE_BEGIN(altivec_unavailable)
 	IVEC=0xf20
 	IRECONCILE=0
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(altivec_unavailable)
 
 EXC_REAL_BEGIN(altivec_unavailable, 0xf20, 0x20)
@@ -2283,7 +2334,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 INT_DEFINE_BEGIN(vsx_unavailable)
 	IVEC=0xf40
 	IRECONCILE=0
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(vsx_unavailable)
 
 EXC_REAL_BEGIN(vsx_unavailable, 0xf40, 0x20)
@@ -2336,7 +2389,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
  */
 INT_DEFINE_BEGIN(facility_unavailable)
 	IVEC=0xf60
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(facility_unavailable)
 
 EXC_REAL_BEGIN(facility_unavailable, 0xf60, 0x20)
@@ -2426,8 +2481,10 @@ EXC_VIRT_NONE(0x5200, 0x100)
 
 INT_DEFINE_BEGIN(instruction_breakpoint)
 	IVEC=0x1300
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_SKIP=1
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(instruction_breakpoint)
 
 EXC_REAL_BEGIN(instruction_breakpoint, 0x1300, 0x100)
@@ -2598,7 +2655,9 @@ EXC_VIRT_NONE(0x5600, 0x100)
 
 INT_DEFINE_BEGIN(altivec_assist)
 	IVEC=0x1700
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(altivec_assist)
 
 EXC_REAL_BEGIN(altivec_assist, 0x1700, 0x100)
-- 
2.22.0

