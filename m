Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98821988B4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 02:50:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DQtB3mnhzDqQC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 10:50:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="K/+8an3E"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DQrX1gshzDqQC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 10:48:43 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 196so2624292pfz.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 17:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VF35pZMiKtYQZbYnmJRMlMuI5qC6taP+wJXvgpek63k=;
 b=K/+8an3E5B3QgX9cBRYCupb4OxGoJ+ZrfxJqbxYpu3N+DfdldKw9lHhvNxm/k2qFC0
 XysB+SEc/6BITarlqL3NXngkLW9K651qLQ6MR85466RmzmXFHH5FV2jauX0KyG/0LI5Z
 Ug8CBNkNmbNDekHRoOACUP6KhiGTpki9TbtqoLqNdOmaqLecdIH1DPBmJd/tLH1tIsGY
 xfyrHPbGgaN0DgHtNwjyzSuAsQKDsphC0+VzZUFXBQfxY7Jm6zCZ8I2OsM5JzV191w2Z
 nDNeG7IthHeJNbI0c8T+Xu0PgggI5IF+fPXGY5T1dHbwXO+AoVAhEgQHDuP/QJIbMAEN
 cMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VF35pZMiKtYQZbYnmJRMlMuI5qC6taP+wJXvgpek63k=;
 b=hwy2PzUixmCvJijuSZXZBBqG9gjMLyDb4IArnm9SfnFfRPfyb4rRxZwYTMn/slkvq2
 xfTPaU7FjPTH6lWrYwCciGtAaM8ZjP3Joffk8SNqE2Wz1TklshTo9dtZHoqYd2tT5zh8
 E0L7O5QkbYGG2FVvFTDCItz9JSCzxI085PDPGQh1dwxD68upIIBSxwdoVYCAf5u2VoEr
 +iTE341gvVufX6DGcKrg+QasPF+7jQqMxdNKEWBhusZhZ6pyYKhnmgZFaE1qyHbF41Ci
 cKbZzOTe7mZ6Av9pzHG0mCvzVo7gI7xF8paXRXOxoG8eKxbETaNgnOS+NnVTkfS3F0Ri
 H/Zg==
X-Gm-Message-State: APjAAAVm2kiNTlJh6fX9SZIMCS3bzc481WWbcqieQTt8csbiqy/n7Ytj
 8ZGi5AkDrDLTeSKYkH3xglFyMaEE
X-Google-Smtp-Source: APXvYqzy6Es3+72v//OUO167C0rQE31HvVKXKfRbAaKvhoD+0ktETV8yHVy7SrFGpC8IOU8b0jMDXA==
X-Received: by 2002:a63:f926:: with SMTP id h38mr31261078pgi.80.1566434919363; 
 Wed, 21 Aug 2019 17:48:39 -0700 (PDT)
Received: from bobo.local0.net (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id u1sm21489370pgi.28.2019.08.21.17.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 17:48:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s/exception: most SRR type interrupts need only
 test KVM for PR-KVM
Date: Thu, 22 Aug 2019 10:48:28 +1000
Message-Id: <20190822004828.28104-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
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
Cc: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Apart from SRESET, MCE, and syscall (hcall variant), SRR (EXC_STD) type
interrupts are not escalated to hypervisor mode, so delivered to the OS.

When running PR-KVM, the OS is the hypervisor, and the guest runs with
MSR[PR]=1, so these interrupts must test if a guest was running when
interrupted. These tests are done at the real-mode entry points only
because PR-KVM runs with LPCR[AIL]=0, so no virt-mode interrupt entry.

In HV KVM and nested HV KVM, the guest always receives these interrupts,
so there is no need for the host to make this test.

Therefore, remove these tests if PR KVM is not configured.

Improve the KVM interrupt comments, which explains this change and other
KVm interrupt delivery issues.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

 arch/powerpc/kernel/exceptions-64s.S | 76 ++++++++++++++++++++++------
 1 file changed, 61 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 2963b46f9580..b4d39330789d 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -215,23 +215,37 @@ do_define_int n
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 /*
- * All interrupts which set HSRR registers (EXC_HV) as well as SRESET and
- * MCE and syscall when invoked with "sc 1" switch to the hypervisor to
- * be taken, so all generally need to test whether they were taken in guest
+ * All interrupts which set HSRR registers (EXC_HV) as well as SRESET and MCE
+ * and syscall when invoked with "sc 1" switch to MSR[HV]=1 (HVMODE) to be
+ * taken, so they all generally need to test whether they were taken in guest
  * context.
  *
- * SRESET and MCE may also be sent to the guest by the hypervisor.
- *
- * Interrupts which set SRR registers except SRESET and MCE and sc 1 are not
- * elevated to the hypervisor, though many can be taken when running in
- * hypervisor mode (e.g., bare metal kernel and userspace). These generally
- * need to test whether taken in guest context for PR KVM guests. PR KVM
- * does not enable AIL interrupts, so always takes them in real mode, which
- * is why these generally only need test the real-mode case.
- *
- * If hv is possible, interrupts come into to the hv version
- * of the kvmppc_interrupt code, which then jumps to the PR handler,
- * kvmppc_interrupt_pr, if the guest is a PR guest.
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
@@ -1277,8 +1291,10 @@ INT_DEFINE_BEGIN(data_access)
 	IAREA=PACA_EXGEN
 	IDAR=1
 	IDSISR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_SKIP=1
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(data_access)
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
@@ -1326,8 +1342,10 @@ INT_DEFINE_BEGIN(data_access_slb)
 	IAREA=PACA_EXSLB
 	IRECONCILE=0
 	IDAR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_SKIP=1
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(data_access_slb)
 
 EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
@@ -1379,7 +1397,9 @@ INT_DEFINE_BEGIN(instruction_access)
 	IISIDE=1
 	IDAR=1
 	IDSISR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(instruction_access)
 
 EXC_REAL_BEGIN(instruction_access, 0x400, 0x80)
@@ -1419,7 +1439,9 @@ INT_DEFINE_BEGIN(instruction_access_slb)
 	IRECONCILE=0
 	IISIDE=1
 	IDAR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(instruction_access_slb)
 
 EXC_REAL_BEGIN(instruction_access_slb, 0x480, 0x80)
@@ -1514,7 +1536,9 @@ INT_DEFINE_BEGIN(alignment)
 	IAREA=PACA_EXGEN
 	IDAR=1
 	IDSISR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(alignment)
 
 EXC_REAL_BEGIN(alignment, 0x600, 0x100)
@@ -1546,7 +1570,9 @@ INT_DEFINE_BEGIN(program_check)
 	IVEC=0x700
 	IHSRR=EXC_STD
 	IAREA=PACA_EXGEN
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(program_check)
 
 EXC_REAL_BEGIN(program_check, 0x700, 0x100)
@@ -1611,7 +1637,9 @@ INT_DEFINE_BEGIN(fp_unavailable)
 	IHSRR=EXC_STD
 	IAREA=PACA_EXGEN
 	IRECONCILE=0
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(fp_unavailable)
 
 EXC_REAL_BEGIN(fp_unavailable, 0x800, 0x100)
@@ -1674,7 +1702,9 @@ INT_DEFINE_BEGIN(decrementer)
 	IHSRR=EXC_STD
 	IAREA=PACA_EXGEN
 	IMASK=IRQS_DISABLED
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(decrementer)
 
 EXC_REAL_BEGIN(decrementer, 0x900, 0x80)
@@ -1762,7 +1792,9 @@ INT_DEFINE_BEGIN(doorbell_super)
 	IHSRR=EXC_STD
 	IAREA=PACA_EXGEN
 	IMASK=IRQS_DISABLED
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(doorbell_super)
 
 EXC_REAL_BEGIN(doorbell_super, 0xa00, 0x100)
@@ -1960,7 +1992,9 @@ INT_DEFINE_BEGIN(single_step)
 	IVEC=0xd00
 	IHSRR=EXC_STD
 	IAREA=PACA_EXGEN
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(single_step)
 
 EXC_REAL_BEGIN(single_step, 0xd00, 0x100)
@@ -2260,7 +2294,9 @@ INT_DEFINE_BEGIN(performance_monitor)
 	IHSRR=EXC_STD
 	IAREA=PACA_EXGEN
 	IMASK=IRQS_PMI_DISABLED
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(performance_monitor)
 
 EXC_REAL_BEGIN(performance_monitor, 0xf00, 0x20)
@@ -2291,7 +2327,9 @@ INT_DEFINE_BEGIN(altivec_unavailable)
 	IHSRR=EXC_STD
 	IAREA=PACA_EXGEN
 	IRECONCILE=0
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(altivec_unavailable)
 
 EXC_REAL_BEGIN(altivec_unavailable, 0xf20, 0x20)
@@ -2347,7 +2385,9 @@ INT_DEFINE_BEGIN(vsx_unavailable)
 	IHSRR=EXC_STD
 	IAREA=PACA_EXGEN
 	IRECONCILE=0
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(vsx_unavailable)
 
 EXC_REAL_BEGIN(vsx_unavailable, 0xf40, 0x20)
@@ -2402,7 +2442,9 @@ INT_DEFINE_BEGIN(facility_unavailable)
 	IVEC=0xf60
 	IHSRR=EXC_STD
 	IAREA=PACA_EXGEN
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(facility_unavailable)
 
 EXC_REAL_BEGIN(facility_unavailable, 0xf60, 0x20)
@@ -2496,8 +2538,10 @@ INT_DEFINE_BEGIN(instruction_breakpoint)
 	IVEC=0x1300
 	IHSRR=EXC_STD
 	IAREA=PACA_EXGEN
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_SKIP=1
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(instruction_breakpoint)
 
 EXC_REAL_BEGIN(instruction_breakpoint, 0x1300, 0x100)
@@ -2672,7 +2716,9 @@ INT_DEFINE_BEGIN(altivec_assist)
 	IVEC=0x1700
 	IHSRR=EXC_STD
 	IAREA=PACA_EXGEN
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(altivec_assist)
 
 EXC_REAL_BEGIN(altivec_assist, 0x1700, 0x100)
-- 
2.22.0

