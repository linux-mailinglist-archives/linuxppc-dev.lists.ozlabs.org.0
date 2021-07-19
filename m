Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDF93CEF76
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 00:56:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTHKH4ZY4z3brl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 08:56:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rWzzC+Q3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.236.54; helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=anson.jacob@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rWzzC+Q3; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTCDn6KnCz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 05:52:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjGvGga5l1ovuEk3fImcgn/7+9xRO22KaaGl9CfFjwYmBOvnhOkjCjs8e6lfM9qpE1WZh9YPb0XuNnJIVOLt3pSdB8cSAI4oX7yVjnxqGKlqnWaVeiS4BByZ254AkdTsu8+7PFjycaeUbp3elt31mvDxFwncY1CHbekes/JXfNkGhrS7rFaKoZ+s2S9217fCrD3rVYKITR/DnY7LioHig6MERVHWGD2ObZliJnJJmot/X97AcTMOUO8kK2JFHAIaqimcUcUGLiJN58QOdRcAkXTEQSNCP+ppALfZ1JtWL/iVP8bmkUpivJrdUJcnZ2TgklWpwVnhDi8Ba9i/UTB/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEkxXUq3Z69RAeClJjF4jp3Nmwh0brf4fKd+pUSFyh0=;
 b=fwVMD3jlMGdMQiX/zYiE4L0Oc+WPzoPDCEuiAqoDqTmte5iB+8fQ8ZQ386dJfg+++Zo4J6fzl+vkTBPDNN8LKIMfZDv2G9dELRgQiDJ4r8p1hGlF3IkhX016WgIlmJCstcbQNCgpSaNwMJwy0U32/dJSHJT7Tk2U+ry6pJTLTTNztoOBz79lAeG1I3I7QHjB3rylWnsKrUS5DWHR2LBq4BT1mR/NruxPsudKKGL8Vws6IS6iy1H8aEZ8ltIH2rchV/6wDUetm7RI1J9/SXq252XnZ1C7OYcprawqoSRrZ+W0tKliynMT4L8rehyDs+Q2wa0KwFOZMw8l6VmDV+7oSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ellerman.id.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEkxXUq3Z69RAeClJjF4jp3Nmwh0brf4fKd+pUSFyh0=;
 b=rWzzC+Q3IQs0QwOdtyCrij6pNTdt619QEVGhMpvX4EqcRNTQ8KJDSWabEIasNZpQE/XKOmLtpj7F1tggW/oDQW6pkJlbBUWgpJPJY2s+M3C6zR0X1DRA7IvNlHw5CqHbAGK8mfR5SY3wd8ImSL2ws8+0oPrVeRPyEBzpiWPsiV8=
Received: from DM5PR19CA0002.namprd19.prod.outlook.com (2603:10b6:3:151::12)
 by BN8PR12MB2962.namprd12.prod.outlook.com (2603:10b6:408:47::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 19:52:20 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:151:cafe::79) by DM5PR19CA0002.outlook.office365.com
 (2603:10b6:3:151::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Mon, 19 Jul 2021 19:52:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; ellerman.id.au; dkim=none (message not signed)
 header.d=none;ellerman.id.au; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 19:52:19 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Jul
 2021 14:52:17 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Jul
 2021 12:52:17 -0700
Received: from Bumblebee.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 19 Jul 2021 14:52:15 -0500
From: Anson Jacob <Anson.Jacob@amd.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <christophe.leroy@csgroup.eu>, <linuxppc-dev@lists.ozlabs.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [RFC 1/2] ppc/fpu: Add generic FPU api similar to x86
Date: Mon, 19 Jul 2021 15:52:10 -0400
Message-ID: <20210719195211.520428-2-Anson.Jacob@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719195211.520428-1-Anson.Jacob@amd.com>
References: <20210719195211.520428-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3982905-7300-4d22-548e-08d94aeeb7d0
X-MS-TrafficTypeDiagnostic: BN8PR12MB2962:
X-Microsoft-Antispam-PRVS: <BN8PR12MB2962E8CDD1874F869E5FDE4AEBE19@BN8PR12MB2962.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jI7Hh9p0IemVEk3bvgdLGeVbmgV3mSRqkRNXy88oeyafLpTb7W2hB9raD+kg7zN87T7PAqouXz/uQjAKBYlmZJ1/92OWBJ1u1qYAqujH4rG5VU+LwCDeb83VXMx7eG/1YSg03rYBx29PqaZnU/tQq8gAdWYgoNP0lMUm1awT9kRIgL9V9ABO5ROnhLs6ohdRJPsc7Wthb5uVU2Rtnej5B5Vk42KOyGLq0LSGzcjF2YbmjdY6IQxt6pbVft31xfcUoSMrFyUJjYVaPCqh2YTKZK1sefumLmV3yHNH6K0D+CALWVuxw/Tj4GzV6m7UraJc6Ln0iz4+ac+lJClLPZYB3TmJs7Qx+KU63HeSpgL9bL6USa9o2JMJsj10OD/SLJHFWDqL87DUyEALQHn8uXVJ76VIBaFXOJFjpKv9FALgwB4QYit5Ci2fpThtcL2Nxq3JyxPYLXJd/Xh3CrViIKCujWiSBVeqkBs2NUn5GNWUrTvALcolYgk5AiV10aGZvsPfEqsLCGZpB0qkTJF91gNnM0gcVgPwufSNQgEbz4DmXTdvK+rH/FB5OXcprHBmD42YA8UlEp+RJU3nxaueiP9x3uJzo99ATbYvVNgA2gntr6FMeeo8Avca70Mvajr78DgZ7pEbkFvs/6Ld65tFJznszcyPEIQwS4BFl971lYgr2tv6GCeWdfWK+JzZ/9usHi14/oQMcCGHeyGu7qNPx1WsmcFuqQDUULyjOiIhpyJ4O0szRVCmor7PjFfJEUsOJb9Q11+YLGkPDG4tJfm3cncVoQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966006)(36840700001)(186003)(5660300002)(426003)(83380400001)(8676002)(8936002)(356005)(70586007)(47076005)(336012)(7696005)(26005)(36756003)(82310400003)(86362001)(70206006)(316002)(54906003)(81166007)(4326008)(110136005)(36860700001)(1076003)(2616005)(2906002)(478600001)(82740400003)(6666004)(41533002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 19:52:19.5101 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3982905-7300-4d22-548e-08d94aeeb7d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2962
X-Mailman-Approved-At: Tue, 20 Jul 2021 08:55:35 +1000
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
Cc: Sunpeng.Li@amd.com, Harry.Wentland@amd.com, qingqing.zhuo@amd.com,
 Rodrigo.Siqueira@amd.com, roman.li@amd.com, Anson.Jacob@amd.com,
 Aurabindo.Pillai@amd.com, Bhawanpreet.Lakha@amd.com, bindu.r@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

- Add kernel_fpu_begin & kernel_fpu_end API as x86
- Add logic similar to x86 to ensure fpu
  begin/end call correctness
- Add kernel_fpu_enabled to know if FPU is enabled

Signed-off-by: Anson Jacob <Anson.Jacob@amd.com>
---
 arch/powerpc/include/asm/switch_to.h |  29 ++----
 arch/powerpc/kernel/process.c        | 130 +++++++++++++++++++++++++++
 2 files changed, 137 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/switch_to.h b/arch/powerpc/include/asm/switch_to.h
index 9d1fbd8be1c7..aded7aa661c0 100644
--- a/arch/powerpc/include/asm/switch_to.h
+++ b/arch/powerpc/include/asm/switch_to.h
@@ -41,10 +41,7 @@ extern void enable_kernel_fp(void);
 extern void flush_fp_to_thread(struct task_struct *);
 extern void giveup_fpu(struct task_struct *);
 extern void save_fpu(struct task_struct *);
-static inline void disable_kernel_fp(void)
-{
-	msr_check_and_clear(MSR_FP);
-}
+extern void disable_kernel_fp(void);
 #else
 static inline void save_fpu(struct task_struct *t) { }
 static inline void flush_fp_to_thread(struct task_struct *t) { }
@@ -55,10 +52,7 @@ extern void enable_kernel_altivec(void);
 extern void flush_altivec_to_thread(struct task_struct *);
 extern void giveup_altivec(struct task_struct *);
 extern void save_altivec(struct task_struct *);
-static inline void disable_kernel_altivec(void)
-{
-	msr_check_and_clear(MSR_VEC);
-}
+extern void disable_kernel_altivec(void);
 #else
 static inline void save_altivec(struct task_struct *t) { }
 static inline void __giveup_altivec(struct task_struct *t) { }
@@ -67,20 +61,7 @@ static inline void __giveup_altivec(struct task_struct *t) { }
 #ifdef CONFIG_VSX
 extern void enable_kernel_vsx(void);
 extern void flush_vsx_to_thread(struct task_struct *);
-static inline void disable_kernel_vsx(void)
-{
-	msr_check_and_clear(MSR_FP|MSR_VEC|MSR_VSX);
-}
-#else
-static inline void enable_kernel_vsx(void)
-{
-	BUILD_BUG();
-}
-
-static inline void disable_kernel_vsx(void)
-{
-	BUILD_BUG();
-}
+extern void disable_kernel_vsx(void);
 #endif
 
 #ifdef CONFIG_SPE
@@ -114,4 +95,8 @@ static inline void clear_task_ebb(struct task_struct *t)
 
 extern int set_thread_tidr(struct task_struct *t);
 
+bool kernel_fpu_enabled(void);
+void kernel_fpu_begin(void);
+void kernel_fpu_end(void);
+
 #endif /* _ASM_POWERPC_SWITCH_TO_H */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 185beb290580..2ced8c6a3fab 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -75,6 +75,17 @@
 #define TM_DEBUG(x...) do { } while(0)
 #endif
 
+/*
+ * Track whether the kernel is using the FPU state
+ * currently.
+ *
+ * This flag is used:
+ *
+ *   - kernel_fpu_begin()/end() correctness
+ *   - kernel_fpu_enabled info
+ */
+static DEFINE_PER_CPU(bool, in_kernel_fpu);
+
 extern unsigned long _get_SP(void);
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
@@ -212,6 +223,9 @@ void enable_kernel_fp(void)
 	unsigned long cpumsr;
 
 	WARN_ON(preemptible());
+	WARN_ON_ONCE(this_cpu_read(in_kernel_fpu));
+
+	this_cpu_write(in_kernel_fpu, true);
 
 	cpumsr = msr_check_and_set(MSR_FP);
 
@@ -231,6 +245,15 @@ void enable_kernel_fp(void)
 	}
 }
 EXPORT_SYMBOL(enable_kernel_fp);
+
+void disable_kernel_fp(void)
+{
+	WARN_ON_ONCE(!this_cpu_read(in_kernel_fpu));
+
+	this_cpu_write(in_kernel_fpu, false);
+	msr_check_and_clear(MSR_FP);
+}
+EXPORT_SYMBOL(disable_kernel_fp);
 #else
 static inline void __giveup_fpu(struct task_struct *tsk) { }
 #endif /* CONFIG_PPC_FPU */
@@ -263,6 +286,9 @@ void enable_kernel_altivec(void)
 	unsigned long cpumsr;
 
 	WARN_ON(preemptible());
+	WARN_ON_ONCE(this_cpu_read(in_kernel_fpu));
+
+	this_cpu_write(in_kernel_fpu, true);
 
 	cpumsr = msr_check_and_set(MSR_VEC);
 
@@ -283,6 +309,14 @@ void enable_kernel_altivec(void)
 }
 EXPORT_SYMBOL(enable_kernel_altivec);
 
+void disable_kernel_altivec(void)
+{
+	WARN_ON_ONCE(!this_cpu_read(in_kernel_fpu));
+
+	this_cpu_write(in_kernel_fpu, false);
+	msr_check_and_clear(MSR_VEC);
+}
+EXPORT_SYMBOL(disable_kernel_altivec);
 /*
  * Make sure the VMX/Altivec register state in the
  * the thread_struct is up to date for task tsk.
@@ -333,6 +367,9 @@ void enable_kernel_vsx(void)
 	unsigned long cpumsr;
 
 	WARN_ON(preemptible());
+	WARN_ON_ONCE(this_cpu_read(in_kernel_fpu));
+
+	this_cpu_write(in_kernel_fpu, true);
 
 	cpumsr = msr_check_and_set(MSR_FP|MSR_VEC|MSR_VSX);
 
@@ -354,6 +391,15 @@ void enable_kernel_vsx(void)
 }
 EXPORT_SYMBOL(enable_kernel_vsx);
 
+void disable_kernel_vsx(void)
+{
+	WARN_ON_ONCE(!this_cpu_read(in_kernel_fpu));
+
+	this_cpu_write(in_kernel_fpu, false);
+	msr_check_and_clear(MSR_FP|MSR_VEC|MSR_VSX);
+}
+EXPORT_SYMBOL(disable_kernel_vsx);
+
 void flush_vsx_to_thread(struct task_struct *tsk)
 {
 	if (tsk->thread.regs) {
@@ -406,6 +452,90 @@ void flush_spe_to_thread(struct task_struct *tsk)
 }
 #endif /* CONFIG_SPE */
 
+static bool fpu_support(void)
+{
+	if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
+		return true;
+	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
+		return true;
+	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
+		return true;
+	}
+
+	return false;
+}
+
+bool kernel_fpu_enabled(void)
+{
+	return this_cpu_read(in_kernel_fpu);
+}
+EXPORT_SYMBOL(kernel_fpu_enabled);
+
+void kernel_fpu_begin(void)
+{
+	if (!fpu_support()) {
+		WARN_ON_ONCE(1);
+		return;
+	}
+
+	preempt_disable();
+
+#ifdef CONFIG_VSX
+	if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
+		enable_kernel_vsx();
+		return;
+	}
+#endif
+
+#ifdef CONFIG_ALTIVEC
+	if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
+		enable_kernel_altivec();
+		return;
+	}
+#endif
+
+#ifdef CONFIG_PPC_FPU
+	if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
+		enable_kernel_fp();
+		return;
+	}
+#endif
+}
+EXPORT_SYMBOL_GPL(kernel_fpu_begin);
+
+void kernel_fpu_end(void)
+{
+	if (!fpu_support()) {
+		WARN_ON_ONCE(1);
+		return;
+	}
+
+#ifdef CONFIG_VSX
+	if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
+		disable_kernel_vsx();
+		goto done;
+	}
+#endif
+
+#ifdef CONFIG_ALTIVEC
+	if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
+		disable_kernel_altivec();
+		goto done;
+	}
+#endif
+
+#ifdef CONFIG_PPC_FPU
+	if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
+		disable_kernel_fp();
+		goto done;
+	}
+#endif
+
+done:
+	preempt_enable();
+}
+EXPORT_SYMBOL_GPL(kernel_fpu_end);
+
 static unsigned long msr_all_available;
 
 static int __init init_msr_all_available(void)
-- 
2.25.1

