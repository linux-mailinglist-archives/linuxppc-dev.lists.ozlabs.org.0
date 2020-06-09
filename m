Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E07021F34AB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:11:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h1Wq1wFnzDqfY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:11:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bzAa2cd8; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h0JJ0ZYgzDqXX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 16:16:47 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id q16so7629128plr.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jun 2020 23:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SPEE5RsHPWskoMu8dlYKuC8rhEX7lbur90bLHAdYeu4=;
 b=bzAa2cd8jvNW7OHChzodPZnORmDPXNnQB4tj8evEPUjXnlvuhaGclihkLGJaTrOvtb
 rm2axOokIZbYp2WJCo7IXkhIRcNHC8DbPfrzM+31fv1Jr/9sTCwX9RCLsEf85DmenPwc
 693xMUHMBkMFU8qbFQN0ooZSWLsS/3Em9kEVC1t5xRCKe82La4IgnATIcBV+OFLcRaKT
 LtaU/bXgvEStIPqQL6D0VOWflEROP5hI0IXtfWQiyu3zOqS23Zcw+1N0w4VbYdhmdOWe
 dyjjJdVMWvNTYheSS4H0V+KLOLF/70jnIOnMvmHTDaKHhQAjHTC5rOMFS9TUQM3A6fKq
 vRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SPEE5RsHPWskoMu8dlYKuC8rhEX7lbur90bLHAdYeu4=;
 b=OZjNw9heYVd5pxLpI4OQ3INUxhhsMMcYIx8H6hCnLETMH5tdU+ESmZn/PhP827o+xB
 jsRs1oLFgM8ZXHzzCK16LvtQ09satguYu5kkke0YG/tDvhJ22IaLfigo5JH7fDfVH60g
 zjw/VdBn9Mq9LL1xesaP5umIJIZtmfLGUVU8Ql8H90/NgJ/t8tnIDmV1U+QIvUmkMiRj
 fd9ODimj6M3rzbUcHRxw8MOnwgRQE7r5e58Bue2wi2jBs282FGwWNh9KZf6QSrYRc7zw
 CAWcVu/M61WvLAuWugEip8lwnCxQQidBGVjGOc0zxlF3btUPTLxX1aoEXhwIEnnDl0zh
 Z6QQ==
X-Gm-Message-State: AOAM532rafGFL2oFJFPlQ6/vhD61Eu6PSzKJsGZUEzD9oA9Sl+Iwqbj3
 NzjCeaAS61HDDjCWAMGzCog=
X-Google-Smtp-Source: ABdhPJyl/qfTeRKjhEItWZIehUcZ+csau4AZZ1rcB6OXD9wBLCyGa8acD8lmnMAg22MIXiUFKPYlBw==
X-Received: by 2002:a17:90b:4911:: with SMTP id
 kr17mr3037435pjb.40.1591683405260; 
 Mon, 08 Jun 2020 23:16:45 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([61.68.71.10])
 by smtp.gmail.com with ESMTPSA id k12sm7567981pgm.11.2020.06.08.23.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 23:16:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 1/7] powerpc/security: re-name count cache flush to branch
 cache flush
Date: Tue,  9 Jun 2020 16:16:25 +1000
Message-Id: <20200609061631.844390-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200609061631.844390-1-npiggin@gmail.com>
References: <20200609061631.844390-1-npiggin@gmail.com>
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

The count cache flush mostly refers to both count cache and link stack
flushing. As a first step to untangling these a bit, re-name the bits
that apply to both.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |  4 +--
 arch/powerpc/kernel/entry_64.S            |  7 ++---
 arch/powerpc/kernel/security.c            | 36 +++++++++++------------
 3 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 7d81e86a1e5d..fa9057360e88 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -144,13 +144,13 @@ void _kvmppc_restore_tm_pr(struct kvm_vcpu *vcpu, u64 guest_msr);
 void _kvmppc_save_tm_pr(struct kvm_vcpu *vcpu, u64 guest_msr);
 
 /* Patch sites */
-extern s32 patch__call_flush_count_cache;
+extern s32 patch__call_flush_branch_caches;
 extern s32 patch__flush_count_cache_return;
 extern s32 patch__flush_link_stack_return;
 extern s32 patch__call_kvm_flush_link_stack;
 extern s32 patch__memset_nocache, patch__memcpy_nocache;
 
-extern long flush_count_cache;
+extern long flush_branch_caches;
 extern long kvm_flush_link_stack;
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 9d49338e0c85..2ba25b3b701e 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -259,8 +259,7 @@ _ASM_NOKPROBE_SYMBOL(save_nvgprs);
 
 #define FLUSH_COUNT_CACHE	\
 1:	nop;			\
-	patch_site 1b, patch__call_flush_count_cache
-
+	patch_site 1b, patch__call_flush_branch_caches
 
 #define BCCTR_FLUSH	.long 0x4c400420
 
@@ -271,8 +270,8 @@ _ASM_NOKPROBE_SYMBOL(save_nvgprs);
 .endm
 
 .balign 32
-.global flush_count_cache
-flush_count_cache:
+.global flush_branch_caches
+flush_branch_caches:
 	/* Save LR into r9 */
 	mflr	r9
 
diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index d86701ce116b..df2a3eff950b 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -21,12 +21,12 @@
 
 u64 powerpc_security_features __read_mostly = SEC_FTR_DEFAULT;
 
-enum count_cache_flush_type {
-	COUNT_CACHE_FLUSH_NONE	= 0x1,
-	COUNT_CACHE_FLUSH_SW	= 0x2,
-	COUNT_CACHE_FLUSH_HW	= 0x4,
+enum branch_cache_flush_type {
+	BRANCH_CACHE_FLUSH_NONE	= 0x1,
+	BRANCH_CACHE_FLUSH_SW	= 0x2,
+	BRANCH_CACHE_FLUSH_HW	= 0x4,
 };
-static enum count_cache_flush_type count_cache_flush_type = COUNT_CACHE_FLUSH_NONE;
+static enum branch_cache_flush_type count_cache_flush_type = BRANCH_CACHE_FLUSH_NONE;
 static bool link_stack_flush_enabled;
 
 bool barrier_nospec_enabled;
@@ -222,10 +222,10 @@ ssize_t cpu_show_spectre_v2(struct device *dev, struct device_attribute *attr, c
 		if (link_stack_flush_enabled)
 			seq_buf_printf(&s, ", Software link stack flush");
 
-	} else if (count_cache_flush_type != COUNT_CACHE_FLUSH_NONE) {
+	} else if (count_cache_flush_type != BRANCH_CACHE_FLUSH_NONE) {
 		seq_buf_printf(&s, "Mitigation: Software count cache flush");
 
-		if (count_cache_flush_type == COUNT_CACHE_FLUSH_HW)
+		if (count_cache_flush_type == BRANCH_CACHE_FLUSH_HW)
 			seq_buf_printf(&s, " (hardware accelerated)");
 
 		if (link_stack_flush_enabled)
@@ -429,18 +429,18 @@ device_initcall(stf_barrier_debugfs_init);
 
 static void no_count_cache_flush(void)
 {
-	count_cache_flush_type = COUNT_CACHE_FLUSH_NONE;
+	count_cache_flush_type = BRANCH_CACHE_FLUSH_NONE;
 	pr_info("count-cache-flush: software flush disabled.\n");
 }
 
-static void toggle_count_cache_flush(bool enable)
+static void toggle_branch_cache_flush(bool enable)
 {
 	if (!security_ftr_enabled(SEC_FTR_FLUSH_COUNT_CACHE) &&
 	    !security_ftr_enabled(SEC_FTR_FLUSH_LINK_STACK))
 		enable = false;
 
 	if (!enable) {
-		patch_instruction_site(&patch__call_flush_count_cache,
+		patch_instruction_site(&patch__call_flush_branch_caches,
 				       ppc_inst(PPC_INST_NOP));
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 		patch_instruction_site(&patch__call_kvm_flush_link_stack,
@@ -452,9 +452,9 @@ static void toggle_count_cache_flush(bool enable)
 		return;
 	}
 
-	// This enables the branch from _switch to flush_count_cache
-	patch_branch_site(&patch__call_flush_count_cache,
-			  (u64)&flush_count_cache, BRANCH_SET_LINK);
+	// This enables the branch from _switch to flush_branch_caches
+	patch_branch_site(&patch__call_flush_branch_caches,
+			  (u64)&flush_branch_caches, BRANCH_SET_LINK);
 
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	// This enables the branch from guest_exit_cont to kvm_flush_link_stack
@@ -474,13 +474,13 @@ static void toggle_count_cache_flush(bool enable)
 	}
 
 	if (!security_ftr_enabled(SEC_FTR_BCCTR_FLUSH_ASSIST)) {
-		count_cache_flush_type = COUNT_CACHE_FLUSH_SW;
+		count_cache_flush_type = BRANCH_CACHE_FLUSH_SW;
 		pr_info("count-cache-flush: full software flush sequence enabled.\n");
 		return;
 	}
 
 	patch_instruction_site(&patch__flush_count_cache_return, ppc_inst(PPC_INST_BLR));
-	count_cache_flush_type = COUNT_CACHE_FLUSH_HW;
+	count_cache_flush_type = BRANCH_CACHE_FLUSH_HW;
 	pr_info("count-cache-flush: hardware assisted flush sequence enabled\n");
 }
 
@@ -505,7 +505,7 @@ void setup_count_cache_flush(void)
 	    security_ftr_enabled(SEC_FTR_FLUSH_COUNT_CACHE))
 		security_ftr_set(SEC_FTR_FLUSH_LINK_STACK);
 
-	toggle_count_cache_flush(enable);
+	toggle_branch_cache_flush(enable);
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -520,14 +520,14 @@ static int count_cache_flush_set(void *data, u64 val)
 	else
 		return -EINVAL;
 
-	toggle_count_cache_flush(enable);
+	toggle_branch_cache_flush(enable);
 
 	return 0;
 }
 
 static int count_cache_flush_get(void *data, u64 *val)
 {
-	if (count_cache_flush_type == COUNT_CACHE_FLUSH_NONE)
+	if (count_cache_flush_type == BRANCH_CACHE_FLUSH_NONE)
 		*val = 0;
 	else
 		*val = 1;
-- 
2.23.0

