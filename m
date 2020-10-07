Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B9B285A16
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 10:08:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5n5N0NmTzDqHl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 19:08:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Kc2bkXWW; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5n3L0J7GzDqNk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 19:06:18 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id m15so602543pls.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Oct 2020 01:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BpSVmG+PgLmyH3ihTydOfBbDYhmIh0f6tB/8P+uStYw=;
 b=Kc2bkXWW91cAJ5Lm+ifr6oSPWPB2hJfQOvjFM+nk7c67BgbcEk9e9d31YBz878hX7/
 LQ1Pg2Cdq3YrBZa3VKFvpeELhnykRmElba6V9PbmYO2WX3SkumJctJ45BOzj18GK1sJI
 FJoKV6zBprhxX5mMZZN7IpGFyYomR9Gz0HL2k13c7CACAPPlRjkemXysIZvvITD87orf
 9sDahSUmsk7vxc556Ov31syXN3fxYRKRKdkObEa74jn3mDkoMBrb/8p/cDGYs2mPVta8
 dzay0NzXr/S30qEncfVZNdw/PZLaF3mdmKS4cNR6YQNuMvjE4/R3I/AeuabzWPc/KqNR
 2GYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BpSVmG+PgLmyH3ihTydOfBbDYhmIh0f6tB/8P+uStYw=;
 b=c1fi5uJTao474qX6EqFtOSKfn/L6hlT8cU0d8bp0Zgq1NM6Eze9AfxN3qZ2DrYMajn
 4p86gLPVwbZ96QrYt8c0YH1+P+sGwgVwEXzPFTgtfNZCrv2fkTrUI2AUHVrIv4H6FIrs
 Vn3MbdUqL8ocdjS59O0V6/ynWHopfChO2ryJWYFjz7cHKYFSTUMmEgxfUQRo4fHlL6mw
 nXMHuHqMDU5Nol0satebVPsfttZqOe8eSyZH7SvAfDyRtfnfhMtVdfHp6VV4C0zwISsf
 kzMOD0nulXS3b/Hub4okxZRADTp9eNn1RblKlvMP11Nysv7D8j4HpuSPnFZ03Y/HL4K+
 oQbA==
X-Gm-Message-State: AOAM532Up1zmn8HbE2wD7ir1FsmdgtIF5iiMr3LCajjbzP6KN6Mxr187
 86X6y27KtQcn+pXoyOYK0HrSOFR+IcM=
X-Google-Smtp-Source: ABdhPJxu+EzwIRzyxEO+HipdUJnSvutHQqVi1ZQjjiQl6Tci2COLNvR9CrlB2e2Xi/lYmfUoab/XWg==
X-Received: by 2002:a17:90a:cf8b:: with SMTP id
 i11mr1895918pju.181.1602057974357; 
 Wed, 07 Oct 2020 01:06:14 -0700 (PDT)
Received: from bobo.ibm.com ([1.129.234.40])
 by smtp.gmail.com with ESMTPSA id v21sm1454370pjy.43.2020.10.07.01.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 01:06:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/security: Fix link stack flush instruction
Date: Wed,  7 Oct 2020 18:06:05 +1000
Message-Id: <20201007080605.64423-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The inline execution path for the hardware assisted branch flush
instruction failed to set CTR to the correct value before bcctr,
causing a crash when the feature is enabled.

Fixes: 4d24e21cc694 ("powerpc/security: Allow for processors that flush the link stack using the special bcctr")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |  4 ++-
 arch/powerpc/kernel/entry_64.S            |  8 ++++--
 arch/powerpc/kernel/security.c            | 34 ++++++++++++++++-------
 3 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index de14b1a34d56..9652756b0694 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -144,7 +144,9 @@ void _kvmppc_restore_tm_pr(struct kvm_vcpu *vcpu, u64 guest_msr);
 void _kvmppc_save_tm_pr(struct kvm_vcpu *vcpu, u64 guest_msr);
 
 /* Patch sites */
-extern s32 patch__call_flush_branch_caches;
+extern s32 patch__call_flush_branch_caches1;
+extern s32 patch__call_flush_branch_caches2;
+extern s32 patch__call_flush_branch_caches3;
 extern s32 patch__flush_count_cache_return;
 extern s32 patch__flush_link_stack_return;
 extern s32 patch__call_kvm_flush_link_stack;
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 733e40eba4eb..2f3846192ec7 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -430,7 +430,11 @@ _ASM_NOKPROBE_SYMBOL(save_nvgprs);
 
 #define FLUSH_COUNT_CACHE	\
 1:	nop;			\
-	patch_site 1b, patch__call_flush_branch_caches
+	patch_site 1b, patch__call_flush_branch_caches1; \
+1:	nop;			\
+	patch_site 1b, patch__call_flush_branch_caches2; \
+1:	nop;			\
+	patch_site 1b, patch__call_flush_branch_caches3
 
 .macro nops number
 	.rept \number
@@ -512,7 +516,7 @@ _GLOBAL(_switch)
 
 	kuap_check_amr r9, r10
 
-	FLUSH_COUNT_CACHE
+	FLUSH_COUNT_CACHE	/* Clobbers r9, ctr */
 
 	/*
 	 * On SMP kernels, care must be taken because a task may be
diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index c9876aab3142..e4e1a94ccf6a 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -430,30 +430,44 @@ device_initcall(stf_barrier_debugfs_init);
 
 static void update_branch_cache_flush(void)
 {
+	u32 *site;
+
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	site = &patch__call_kvm_flush_link_stack;
 	// This controls the branch from guest_exit_cont to kvm_flush_link_stack
 	if (link_stack_flush_type == BRANCH_CACHE_FLUSH_NONE) {
-		patch_instruction_site(&patch__call_kvm_flush_link_stack,
-				       ppc_inst(PPC_INST_NOP));
+		patch_instruction_site(site, ppc_inst(PPC_INST_NOP));
 	} else {
 		// Could use HW flush, but that could also flush count cache
-		patch_branch_site(&patch__call_kvm_flush_link_stack,
-				  (u64)&kvm_flush_link_stack, BRANCH_SET_LINK);
+		patch_branch_site(site, (u64)&kvm_flush_link_stack, BRANCH_SET_LINK);
 	}
 #endif
 
+	// Patch out the bcctr first, then nop the rest
+	site = &patch__call_flush_branch_caches3;
+	patch_instruction_site(site, ppc_inst(PPC_INST_NOP));
+	site = &patch__call_flush_branch_caches2;
+	patch_instruction_site(site, ppc_inst(PPC_INST_NOP));
+	site = &patch__call_flush_branch_caches1;
+	patch_instruction_site(site, ppc_inst(PPC_INST_NOP));
+
 	// This controls the branch from _switch to flush_branch_caches
 	if (count_cache_flush_type == BRANCH_CACHE_FLUSH_NONE &&
 	    link_stack_flush_type == BRANCH_CACHE_FLUSH_NONE) {
-		patch_instruction_site(&patch__call_flush_branch_caches,
-				       ppc_inst(PPC_INST_NOP));
+		// Nothing to be done
+
 	} else if (count_cache_flush_type == BRANCH_CACHE_FLUSH_HW &&
 		   link_stack_flush_type == BRANCH_CACHE_FLUSH_HW) {
-		patch_instruction_site(&patch__call_flush_branch_caches,
-				       ppc_inst(PPC_INST_BCCTR_FLUSH));
+		// Patch in the bcctr last
+		site = &patch__call_flush_branch_caches1;
+		patch_instruction_site(site, ppc_inst(0x39207fff)); // li r9,0x7fff
+		site = &patch__call_flush_branch_caches2;
+		patch_instruction_site(site, ppc_inst(0x7d2903a6)); // mtctr r9
+		site = &patch__call_flush_branch_caches3;
+		patch_instruction_site(site, ppc_inst(PPC_INST_BCCTR_FLUSH));
+
 	} else {
-		patch_branch_site(&patch__call_flush_branch_caches,
-				  (u64)&flush_branch_caches, BRANCH_SET_LINK);
+		patch_branch_site(site, (u64)&flush_branch_caches, BRANCH_SET_LINK);
 
 		// If we just need to flush the link stack, early return
 		if (count_cache_flush_type == BRANCH_CACHE_FLUSH_NONE) {
-- 
2.23.0

