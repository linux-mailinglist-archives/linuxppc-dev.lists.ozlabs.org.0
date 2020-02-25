Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D544016EE1E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:37:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rnjd1VK5zDqMf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:37:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dCl58OlQ; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmSB2vHGzDqN3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:40:56 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id ay11so91713plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y/81VYwyf9P/aXPQBgs/vxDoooMp4E+DygO6qFOvvyI=;
 b=dCl58OlQ9GkpNzcY+d3A8dKhTMG4eQ3AZ/SOsHTgGy2gMRmGbewU0f8zBSIpIv56Ed
 Zrv3hT/wRewLsGHEDcWwrAUsQpSQz/SWKXxy5jvrrQJ+SPdawIZm9q0pkoQ8HaqZ/seJ
 57zY1Lf9NGwU3Azn+9u18LTBy2kxvFqQL0SCoHAVZ+Jci9e5iC6jEFy9+1mPYksJYijP
 C/7kyzjpeJstPURp4qBRtKKzP/fpMvf7MK0DZD0ZrNmxBBHSyLaIRmO8Wr6VGpfi9gYA
 gQcmh7ZTzgSPSu9se8WdFCnTh2G8RUF7Y5xup5nxpPwrddAJxIrmw553v0pQZJHYMg2t
 VKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y/81VYwyf9P/aXPQBgs/vxDoooMp4E+DygO6qFOvvyI=;
 b=FQYPQDliXv9qtbI3DeGLixZj43HjlS7i/h3NF0q5IqY9ukSxuRBu/K63hrAZFPhETC
 v1rkGYNPGHC3pWdo35/c1HauAAycdG5gkqjT+uJ6onSNN/2taUloOjjLojMhpwgGjNWz
 FbMdViXyOEcJjs1W13s0RzIEVhFMKV2uKoyV+W6hZDMne6fOh8EzqDa5ByxLAIsmbAAl
 lIx9XceOnmJq+RWA/NFA3w9LoL5PSW9nAR7OiBDr/gUi4bdssj6I2HKkpJLbeVRhYrd4
 ZxiHTxHMTmDENW3gHTpmVx5fkK+5n/NlzwV+hmQ3h/+bwu9BmcT9gGIoRLCy71ZUQv8X
 M+Qw==
X-Gm-Message-State: APjAAAWaRzumjxJf0OBnm+nvkRNgfeMLL0TwprlbtjmbOnS6JJli3nDU
 4pGmywfnnOA8sdABaVENusaZjOY/
X-Google-Smtp-Source: APXvYqypjWdB7P+hQgPtB5tqDKDd4XqU8zeaf3CTlmvaxJOFvbruA4RNq6WvCSorVaXanfRlQDiWvw==
X-Received: by 2002:a17:902:14d:: with SMTP id
 71mr51396560plb.162.1582652441635; 
 Tue, 25 Feb 2020 09:40:41 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:40:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 20/32] powerpc/64s/exception: only test KVM in SRR
 interrupts when PR KVM is supported
Date: Wed, 26 Feb 2020 03:35:29 +1000
Message-Id: <20200225173541.1549955-21-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
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
index e976cbf4f4aa..c23eb9c572b2 100644
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
@@ -1258,8 +1285,10 @@ INT_DEFINE_BEGIN(data_access)
 	IVEC=0x300
 	IDAR=1
 	IDSISR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_SKIP=1
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(data_access)
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
@@ -1306,8 +1335,10 @@ INT_DEFINE_BEGIN(data_access_slb)
 	IAREA=PACA_EXSLB
 	IRECONCILE=0
 	IDAR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_SKIP=1
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(data_access_slb)
 
 EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
@@ -1357,7 +1388,9 @@ INT_DEFINE_BEGIN(instruction_access)
 	IISIDE=1
 	IDAR=1
 	IDSISR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(instruction_access)
 
 EXC_REAL_BEGIN(instruction_access, 0x400, 0x80)
@@ -1396,7 +1429,9 @@ INT_DEFINE_BEGIN(instruction_access_slb)
 	IRECONCILE=0
 	IISIDE=1
 	IDAR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(instruction_access_slb)
 
 EXC_REAL_BEGIN(instruction_access_slb, 0x480, 0x80)
@@ -1488,7 +1523,9 @@ INT_DEFINE_BEGIN(alignment)
 	IVEC=0x600
 	IDAR=1
 	IDSISR=1
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(alignment)
 
 EXC_REAL_BEGIN(alignment, 0x600, 0x100)
@@ -1518,7 +1555,9 @@ EXC_COMMON_BEGIN(alignment_common)
  */
 INT_DEFINE_BEGIN(program_check)
 	IVEC=0x700
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(program_check)
 
 EXC_REAL_BEGIN(program_check, 0x700, 0x100)
@@ -1581,7 +1620,9 @@ EXC_COMMON_BEGIN(program_check_common)
 INT_DEFINE_BEGIN(fp_unavailable)
 	IVEC=0x800
 	IRECONCILE=0
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(fp_unavailable)
 
 EXC_REAL_BEGIN(fp_unavailable, 0x800, 0x100)
@@ -1643,7 +1684,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 INT_DEFINE_BEGIN(decrementer)
 	IVEC=0x900
 	IMASK=IRQS_DISABLED
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(decrementer)
 
 EXC_REAL_BEGIN(decrementer, 0x900, 0x80)
@@ -1728,7 +1771,9 @@ EXC_COMMON_BEGIN(hdecrementer_common)
 INT_DEFINE_BEGIN(doorbell_super)
 	IVEC=0xa00
 	IMASK=IRQS_DISABLED
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(doorbell_super)
 
 EXC_REAL_BEGIN(doorbell_super, 0xa00, 0x100)
@@ -1906,7 +1951,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
  */
 INT_DEFINE_BEGIN(single_step)
 	IVEC=0xd00
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(single_step)
 
 EXC_REAL_BEGIN(single_step, 0xd00, 0x100)
@@ -2195,7 +2242,9 @@ EXC_VIRT_NONE(0x4ee0, 0x20)
 INT_DEFINE_BEGIN(performance_monitor)
 	IVEC=0xf00
 	IMASK=IRQS_PMI_DISABLED
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(performance_monitor)
 
 EXC_REAL_BEGIN(performance_monitor, 0xf00, 0x20)
@@ -2224,7 +2273,9 @@ EXC_COMMON_BEGIN(performance_monitor_common)
 INT_DEFINE_BEGIN(altivec_unavailable)
 	IVEC=0xf20
 	IRECONCILE=0
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(altivec_unavailable)
 
 EXC_REAL_BEGIN(altivec_unavailable, 0xf20, 0x20)
@@ -2278,7 +2329,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 INT_DEFINE_BEGIN(vsx_unavailable)
 	IVEC=0xf40
 	IRECONCILE=0
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(vsx_unavailable)
 
 EXC_REAL_BEGIN(vsx_unavailable, 0xf40, 0x20)
@@ -2331,7 +2384,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
  */
 INT_DEFINE_BEGIN(facility_unavailable)
 	IVEC=0xf60
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(facility_unavailable)
 
 EXC_REAL_BEGIN(facility_unavailable, 0xf60, 0x20)
@@ -2421,8 +2476,10 @@ EXC_VIRT_NONE(0x5200, 0x100)
 
 INT_DEFINE_BEGIN(instruction_breakpoint)
 	IVEC=0x1300
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_SKIP=1
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(instruction_breakpoint)
 
 EXC_REAL_BEGIN(instruction_breakpoint, 0x1300, 0x100)
@@ -2593,7 +2650,9 @@ EXC_VIRT_NONE(0x5600, 0x100)
 
 INT_DEFINE_BEGIN(altivec_assist)
 	IVEC=0x1700
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
+#endif
 INT_DEFINE_END(altivec_assist)
 
 EXC_REAL_BEGIN(altivec_assist, 0x1700, 0x100)
-- 
2.23.0

