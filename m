Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C9F3D07E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 06:49:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GV3575GL5z3bgP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 14:48:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rAdBfNPb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.220.54; helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=anson.jacob@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rAdBfNPb; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GV34c321nz2ykR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 14:48:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cpo41hlHo32ibL7N8yMLVYed3jb2eBw3HQEYwfGy6Gmfpmzrq25xNOzleHNG3EsSPkAgrxcgZBqQnnS0ATGwSHyUOc03L3G2xfi8P6m8bBGxxjH32Es9lPHJo6bpTyv73hLHIqVfLOy2SHXkbITOFwNuSiMqcO7UvoUC1BCTqklG5D4pXE66LSdfvuAb2ndflacJnnDAiW+tC4Z74JIvEuGV7W+ePgDi2+3RAFwZ4upG2W+nYMhaeve5fy5uZMa0TZyLEviluBmx9CW4Ks7XGqRsYEKjRXx2xxxyi28jrV0LaglcTkqiEWARez+7U7rPW8DQQd0XeBfHxVyi2jY3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDYMuEOkRMCbS0Kwi63GoYxbQcOhBQD9nwNHuwmDO/w=;
 b=jMusaOQtxIX1+OXpG/emS6sKWL8QECIdRWU+q0/GJX84+cWtyb9svLgZs2NBLGEovYf3I1N4ATqkQiknSJeu1g36rHbAdv5Ka42OgVGC8MRG7QaeoGHFgiaf58hLT7E6cLHfQcgWAhgtTm7VvzEWy9gh1PL8kjeq4/UBTCzWDM5hTGs624X99XNk3ictYc2DO2nOV44nhcUhxy+eqVN4JDn/5Cchq0pQqWjDaX+7/K41tAKxmiQw7jv7d+kiw6+PXknbtYhc05xeMSMmxbLyYdeg/8p7pvm6BTzMgKCe8Mue5qGlqB0fxMKYwQdIAHA7YiUhFuNv8g9Aeur9yO4NvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ellerman.id.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDYMuEOkRMCbS0Kwi63GoYxbQcOhBQD9nwNHuwmDO/w=;
 b=rAdBfNPbOJ49CoBJN+QJS2WLc8KEMyga+VQOiEUCcw8EivxD9DN1vsh1no/MfDNs4YeGP0wySanGCbRMZ07Y6bbA4D3+raiNmbofa/BjK5im7hy3imKHqHbXyuSJQSeYuLeMCQL6sb9C+N2D3i3axuG7B0tEjLRn8Ym1Nrk9BRY=
Received: from BN0PR04CA0184.namprd04.prod.outlook.com (2603:10b6:408:e9::9)
 by DM6PR12MB3468.namprd12.prod.outlook.com (2603:10b6:5:38::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 04:48:12 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::3a) by BN0PR04CA0184.outlook.office365.com
 (2603:10b6:408:e9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Wed, 21 Jul 2021 04:48:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; ellerman.id.au; dkim=none (message not signed)
 header.d=none;ellerman.id.au; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 04:48:11 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 23:48:11 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 21:48:11 -0700
Received: from Bumblebee.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 20 Jul 2021 23:48:04 -0500
From: Anson Jacob <Anson.Jacob@amd.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <christophe.leroy@csgroup.eu>, <linuxppc-dev@lists.ozlabs.org>,
 <amd-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC v2 1/2] ppc/fpu: Add generic FPU api similar to x86
Date: Wed, 21 Jul 2021 00:48:00 -0400
Message-ID: <20210721044801.840501-2-Anson.Jacob@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721044801.840501-1-Anson.Jacob@amd.com>
References: <20210721044801.840501-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56535b63-d5bf-4eef-b872-08d94c02be72
X-MS-TrafficTypeDiagnostic: DM6PR12MB3468:
X-Microsoft-Antispam-PRVS: <DM6PR12MB346827EB6D5E44C88D1A48B3EBE39@DM6PR12MB3468.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: td441VnmDmItqMmY/qA8P09rwopfdco44lcLGRKy00dfv8WvEnLGpR4/qRp7WZ1ENuhP9JWL4c8aCvVc0ce8fFWag8f7wAYpSTd+yRyzLu7axSOiF2tfRlGA1C8agdJT77gcHKaFbOxj8WvhW6VpTZVkhmo9DT3ZKPnNx0rGWMrQ/Fqknjk8Azt16nZYkkpZ0sp8IYZuIqKT/ifL5tnhuHgFuL15AoMsIwKdz0r1mVsEamVsXwdnunajFpT/NyPOkgys8dFL+iC+og19BgDhqNfHIdCiNkJccHbNY+sZy06qhWBbdwOIYKuqjoGG2LG/1lHSTK0Ra7qnuH9MdweUo9IT4/uzdGKCZl5EiNdrtsb/u04Cn1p5kFLvlSDOLeb2d+wIusWtvJcxleogoVivba0R/cbNxzNpdT61eTqGUj8h6b33+goPAGcQBzukn2C98076EM708WeqSQNpzWs1uQhCzaKOX2nyyNdJlUTGbdn2R2S3xMLybXey7I9OOz1SRz8o5jbnefWPJ3RjgDs5BIoax9Heajzb6v0Vsbk59/u1MYN2T463Fb9oAg9tYbQTKTlPwNHq5K6fW97RVXF7Ooy2OuEJ+d/DfptD2Kfj33ckOgEi79RNGIEDmpTbfUFeJ1eyW2bHYMiARjLw/2bNPRWoeJ9uXcVUbzkGJ+KiF6aj6GWHdmWR6g5S0cIVsiqTR0rPeC1oQCBtzWJQM3Np1bg8mQg5F4S1CSCJdbPrWPaP+/bZqUl30kCiYwt0yX7wHoebWC7+KyHAhiFk9L4Bzg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966006)(36840700001)(1076003)(8676002)(186003)(81166007)(2906002)(86362001)(5660300002)(7696005)(478600001)(36860700001)(82310400003)(4326008)(26005)(83380400001)(47076005)(336012)(8936002)(6666004)(54906003)(36756003)(82740400003)(2616005)(356005)(426003)(316002)(110136005)(70586007)(70206006)(41533002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 04:48:11.7951 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56535b63-d5bf-4eef-b872-08d94c02be72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3468
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
Cc: Sunpeng.Li@amd.com, Harry Wentland <harry.wentland@amd.com>,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 Christoph Hellwig <hch@infradead.org>, Anson.Jacob@amd.com,
 Aurabindo.Pillai@amd.com, Bhawanpreet.Lakha@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, bindu.r@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

- Add kernel_fpu_begin & kernel_fpu_end API as x86
- Add logic similar to x86 to ensure fpu
  begin/end call correctness
- Add kernel_fpu_enabled to know if FPU is enabled

v2:
- Added asm/fpu/api.h powerpc variant with kernel_fpu_begin/end()
  and kernel_fpu_enabled() declarations
- Updated kernel_fpu_enabled as EXPORT_SYMBOL_GPL

Signed-off-by: Anson Jacob <Anson.Jacob@amd.com>
CC: Christoph Hellwig <hch@infradead.org>
CC: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
CC: Harry Wentland <harry.wentland@amd.com>
CC: Christian König <christian.koenig@amd.com>
---
 arch/powerpc/include/asm/fpu/api.h   |  18 ++++
 arch/powerpc/include/asm/switch_to.h |  25 +-----
 arch/powerpc/kernel/process.c        | 130 +++++++++++++++++++++++++++
 3 files changed, 151 insertions(+), 22 deletions(-)
 create mode 100644 arch/powerpc/include/asm/fpu/api.h

diff --git a/arch/powerpc/include/asm/fpu/api.h b/arch/powerpc/include/asm/fpu/api.h
new file mode 100644
index 000000000000..57308cdc65c9
--- /dev/null
+++ b/arch/powerpc/include/asm/fpu/api.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_POWERPC_FPU_API_H
+#define _ASM_POWERPC_FPU_API_H
+
+/*
+ * Use kernel_fpu_begin/end() if you intend to use FPU in kernel context. It
+ * disables preemption so be careful if you intend to use it for long periods
+ * of time.
+ * TODO: If you intend to use the FPU in irq/softirq you need to check first with
+ * irq_fpu_usable() if it is possible.
+ */
+
+extern bool kernel_fpu_enabled(void);
+extern void kernel_fpu_begin(void);
+extern void kernel_fpu_end(void);
+
+#endif /* _ASM_POWERPC_FPU_API_H */
diff --git a/arch/powerpc/include/asm/switch_to.h b/arch/powerpc/include/asm/switch_to.h
index 9d1fbd8be1c7..a9a919279f48 100644
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
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 185beb290580..969096c0123c 100644
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
+EXPORT_SYMBOL_GPL(kernel_fpu_enabled);
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

