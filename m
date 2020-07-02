Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5724421302A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 01:35:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yZGC2HJfzDr2d
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 09:35:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WXOmB+la; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yZDM6SFnzDr1Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 09:33:55 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id j12so13185371pfn.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 16:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fUYfVen9cqRB51w5KZNlqoOpdLWt3zbZ3CTAyfz1D2Y=;
 b=WXOmB+laruYWjVYY7+d7igGpbBKIDyJ1gVq9lsoG2iWrLwX86IHtdo850j0FmY3L01
 +Qt+WA+RPAidtTQlNgd0W00mM9unQmuKec9kt+ubxF3F2A3TdozBpQ2V8Ou5NlS2pGN0
 fylGwUH1rA1uBf6HQvq+uHrG3DXkrQXbdGiHk3jrRjU3YbDm5ljD0xivM7QRRgAHKxFy
 w6MmGvo/3PvP4jZQwWSiza71yHyd5AWbHgpj6WUCgEMxJhrznfGrbDPeyL8XpBPfYelR
 EC1wkbwXzg9vKdl5ng+8pAbwv3Z0EjTvmm45or44rABuYqWUZ0z0Y2S9JBlr1960+Myo
 zgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fUYfVen9cqRB51w5KZNlqoOpdLWt3zbZ3CTAyfz1D2Y=;
 b=l0BernBw5zSiELl2t6QF1xpuBfDZg7xGs7uTCBsYf64vSJ5bXMYe1Tb6+9w5xaNhpJ
 PsJW5l1P0tOtRDzHJlE5TFC81gfcgV7c0bS9xV737ErYDcC50FCqQfjxzXUBVDJ4gr+9
 /q/sOYrMJDHqBg+5sg2M4j7qqiczHLt8GtlaxEY0xUy/hAC6CXH2f2I/vfm7QecAn9gL
 NdY7IKoOqLKSxSOSONRICFF0qmOFlB1Vp2lX8LmGpUWnxYIUKwpUJHcw1k0AljmkwulQ
 h183CEI8M/REq+358VYybKop6onPk2mLVCw04NbmCHQRzoK/P/e+5akgUVzzNqhCsoVk
 N9Jg==
X-Gm-Message-State: AOAM530sSSFelPoKZa3LdlmXrKICHGlKoRrlpZjwsd/N3J1C3AFPGWa4
 NLQwHkApB6ZobRuCL+YDwr+OeDRa
X-Google-Smtp-Source: ABdhPJy4tfau/DWLzT0++LhP/i1vF09VBYyw7dOM8CHXPc2doy9jBnNjPCojEni8mmNzeEKY/qbmDw==
X-Received: by 2002:a63:29c8:: with SMTP id
 p191mr27523041pgp.333.1593732831548; 
 Thu, 02 Jul 2020 16:33:51 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id v15sm9707345pgo.15.2020.07.02.16.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 16:33:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv: machine check handler for POWER10
Date: Fri,  3 Jul 2020 09:33:43 +1000
Message-Id: <20200702233343.1128026-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/mce.h    |  1 +
 arch/powerpc/kernel/dt_cpu_ftrs.c | 10 ++++
 arch/powerpc/kernel/mce.c         |  1 +
 arch/powerpc/kernel/mce_power.c   | 84 +++++++++++++++++++++++++++++++
 4 files changed, 96 insertions(+)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 376a395daf32..30b5b03fb11d 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -86,6 +86,7 @@ enum MCE_TlbErrorType {
 enum MCE_UserErrorType {
 	MCE_USER_ERROR_INDETERMINATE = 0,
 	MCE_USER_ERROR_TLBIE = 1,
+	MCE_USER_ERROR_SCV = 2,
 };
 
 enum MCE_RaErrorType {
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 3a409517c031..12cec6919a1a 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -67,6 +67,7 @@ struct dt_cpu_feature {
 
 extern long __machine_check_early_realmode_p8(struct pt_regs *regs);
 extern long __machine_check_early_realmode_p9(struct pt_regs *regs);
+extern long __machine_check_early_realmode_p10(struct pt_regs *regs);
 
 static int hv_mode;
 
@@ -450,6 +451,14 @@ static int __init feat_enable_pmu_power9(struct dt_cpu_feature *f)
 	return 1;
 }
 
+static int __init feat_enable_mce_power10(struct dt_cpu_feature *f)
+{
+	cur_cpu_spec->platform = "power10";
+	cur_cpu_spec->machine_check_early = __machine_check_early_realmode_p10;
+
+	return 1;
+}
+
 static int __init feat_enable_tm(struct dt_cpu_feature *f)
 {
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
@@ -638,6 +647,7 @@ static struct dt_cpu_feature_match __initdata
 	{"group-start-register", feat_enable, 0},
 	{"pc-relative-addressing", feat_enable, 0},
 	{"machine-check-power9", feat_enable_mce_power9, 0},
+	{"machine-check-power10", feat_enable_mce_power10, 0},
 	{"performance-monitor-power9", feat_enable_pmu_power9, 0},
 	{"event-based-branch-v3", feat_enable, 0},
 	{"random-number-generator", feat_enable, 0},
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index fd90c0eda229..4f96f3c24797 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -370,6 +370,7 @@ void machine_check_print_event_info(struct machine_check_event *evt,
 	static const char *mc_user_types[] = {
 		"Indeterminate",
 		"tlbie(l) invalid",
+		"scv invalid",
 	};
 	static const char *mc_ra_types[] = {
 		"Indeterminate",
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index c3b522bff9b4..b7e173754a2e 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -243,6 +243,45 @@ static const struct mce_ierror_table mce_p9_ierror_table[] = {
   MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
 { 0, 0, 0, 0, 0, 0, 0 } };
 
+static const struct mce_ierror_table mce_p10_ierror_table[] = {
+{ 0x00000000081c0000, 0x0000000000040000, true,
+  MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_IFETCH, MCE_ECLASS_HARDWARE,
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
+{ 0x00000000081c0000, 0x0000000000080000, true,
+  MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_PARITY, MCE_ECLASS_HARD_INDETERMINATE,
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
+{ 0x00000000081c0000, 0x00000000000c0000, true,
+  MCE_ERROR_TYPE_SLB, MCE_SLB_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
+  MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
+{ 0x00000000081c0000, 0x0000000000100000, true,
+  MCE_ERROR_TYPE_ERAT, MCE_ERAT_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
+  MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
+{ 0x00000000081c0000, 0x0000000000140000, true,
+  MCE_ERROR_TYPE_TLB, MCE_TLB_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
+  MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
+{ 0x00000000081c0000, 0x0000000000180000, true,
+  MCE_ERROR_TYPE_UE,  MCE_UE_ERROR_PAGE_TABLE_WALK_IFETCH, MCE_ECLASS_HARDWARE,
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
+{ 0x00000000081c0000, 0x00000000001c0000, true,
+  MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_IFETCH_FOREIGN, MCE_ECLASS_SOFTWARE,
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
+{ 0x00000000081c0000, 0x0000000008080000, true,
+  MCE_ERROR_TYPE_USER,MCE_USER_ERROR_SCV, MCE_ECLASS_SOFTWARE,
+  MCE_INITIATOR_CPU,  MCE_SEV_WARNING, true },
+{ 0x00000000081c0000, 0x00000000080c0000, true,
+  MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_IFETCH, MCE_ECLASS_SOFTWARE,
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
+{ 0x00000000081c0000, 0x0000000008100000, true,
+  MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_PAGE_TABLE_WALK_IFETCH, MCE_ECLASS_SOFTWARE,
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
+{ 0x00000000081c0000, 0x0000000008140000, false,
+  MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_STORE, MCE_ECLASS_HARDWARE,
+  MCE_INITIATOR_CPU,  MCE_SEV_FATAL, false }, /* ASYNC is fatal */
+{ 0x00000000081c0000, 0x00000000081c0000, true, MCE_ECLASS_HARDWARE,
+  MCE_ERROR_TYPE_RA,  MCE_RA_ERROR_PAGE_TABLE_WALK_IFETCH_FOREIGN,
+  MCE_INITIATOR_CPU,  MCE_SEV_SEVERE, true },
+{ 0, 0, 0, 0, 0, 0, 0 } };
+
 struct mce_derror_table {
 	unsigned long dsisr_value;
 	bool dar_valid; /* dar is a valid indicator of faulting address */
@@ -361,6 +400,46 @@ static const struct mce_derror_table mce_p9_derror_table[] = {
   MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
 { 0, false, 0, 0, 0, 0, 0 } };
 
+static const struct mce_derror_table mce_p10_derror_table[] = {
+{ 0x00008000, false,
+  MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_LOAD_STORE, MCE_ECLASS_HARDWARE,
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
+{ 0x00004000, true,
+  MCE_ERROR_TYPE_UE,   MCE_UE_ERROR_PAGE_TABLE_WALK_LOAD_STORE,
+  MCE_ECLASS_HARDWARE,
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
+{ 0x00000800, true,
+  MCE_ERROR_TYPE_ERAT, MCE_ERAT_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
+  MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
+{ 0x00000400, true,
+  MCE_ERROR_TYPE_TLB,  MCE_TLB_ERROR_MULTIHIT, MCE_ECLASS_SOFT_INDETERMINATE,
+  MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
+{ 0x00000200, false,
+  MCE_ERROR_TYPE_USER, MCE_USER_ERROR_TLBIE, MCE_ECLASS_SOFTWARE,
+  MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
+{ 0x00000080, true,
+  MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_MULTIHIT,	/* Before PARITY */
+  MCE_ECLASS_SOFT_INDETERMINATE,
+  MCE_INITIATOR_CPU,   MCE_SEV_WARNING, true },
+{ 0x00000100, true,
+  MCE_ERROR_TYPE_SLB,  MCE_SLB_ERROR_PARITY, MCE_ECLASS_HARD_INDETERMINATE,
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
+{ 0x00000040, true,
+  MCE_ERROR_TYPE_RA,   MCE_RA_ERROR_LOAD, MCE_ECLASS_HARDWARE,
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
+{ 0x00000020, false,
+  MCE_ERROR_TYPE_RA,   MCE_RA_ERROR_PAGE_TABLE_WALK_LOAD_STORE,
+  MCE_ECLASS_HARDWARE,
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
+{ 0x00000010, false,
+  MCE_ERROR_TYPE_RA,   MCE_RA_ERROR_PAGE_TABLE_WALK_LOAD_STORE_FOREIGN,
+  MCE_ECLASS_HARDWARE,
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
+{ 0x00000008, false,
+  MCE_ERROR_TYPE_RA,   MCE_RA_ERROR_LOAD_STORE_FOREIGN, MCE_ECLASS_HARDWARE,
+  MCE_INITIATOR_CPU,   MCE_SEV_SEVERE, true },
+{ 0, false, 0, 0, 0, 0, 0 } };
+
 static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 					uint64_t *phys_addr)
 {
@@ -657,3 +736,8 @@ long __machine_check_early_realmode_p9(struct pt_regs *regs)
 
 	return mce_handle_error(regs, mce_p9_derror_table, mce_p9_ierror_table);
 }
+
+long __machine_check_early_realmode_p10(struct pt_regs *regs)
+{
+	return mce_handle_error(regs, mce_p10_derror_table, mce_p10_ierror_table);
+}
-- 
2.23.0

