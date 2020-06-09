Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC69B1F34D7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:30:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h1wv1D4fzDqLM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:30:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uas8z2Wt; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h1Pb0nl8zDqby
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 17:06:26 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id n23so9871153pgb.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jun 2020 00:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SPEE5RsHPWskoMu8dlYKuC8rhEX7lbur90bLHAdYeu4=;
 b=uas8z2WtvY8pQUCBht8EH5C6a8IKvtDZXxBFfNKBVr74NlDUUcu6dHMYwbRsnzMncC
 uWrUxucuHnOEh5c+aN8OEj9shm/GpqN5g76dIOFgFyG4JDzaY9ykQOlj4e2Asku+zPUZ
 CbW3fxADVCmOyKcDrKZyfXqKlo4plVKV4zeOO0MbeVFbARmKUvJY3SLDthZDNd3VmGsi
 ep3eK29+LZTe1SSDx/wn0fEbCItIRjOSoJIXYB33cllOH50R21xJ3o0R+mIl9hHBTwxt
 0S8WB6nfv0MHxoinmSlxqzH3RyJh/NOXdhUqRUGqgUxEuRyE5FxEvoFHU8hjX+gfpMux
 wJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SPEE5RsHPWskoMu8dlYKuC8rhEX7lbur90bLHAdYeu4=;
 b=dSA63h8P61E7CphypKcMD4pr5y4tifj1DhgAAkrqTd0J96YKYgQu7+SW2+20nR4Ahm
 y+qlCzv2QKyQapgHnup89aZt1HbtfDzCaRHwNFnyM6+NmF6XX466vrQXVCljgB2eYhS8
 80AogQZNSdizEpQ8ilwqAwpEqDKv5KeL7AS2BgQBEboe1Saqnx05MwSNfGu3UsbCBAue
 OBW2lyFKItzrYXyXMXOaPaqojjSBNMpRMHArDPGKBfb2gquW1rZzs+eKdNxy0TZSLpm8
 9r8/6RkYoPb7r2KMyKsXDAnaTWiJKZpOeKFuYVlXgoJ4GxkpNR5evekTQ7fBNVInddjo
 HCFg==
X-Gm-Message-State: AOAM531QuaJ5EjXaxmWChEzfHjKyD5TnQvlGOnWu0Ab00TjhiEM+Pn4N
 LRu+UZEmY+z5KEDeaJbDglcsAmXo6bk=
X-Google-Smtp-Source: ABdhPJxDfbsTLg9xEVZCmgxLQx8XJzUGIs/jsujd9BwNlfLEN6cSGG4Ek1MjbijUhSNYot0NnevTkg==
X-Received: by 2002:a63:4c0b:: with SMTP id z11mr23902092pga.348.1591686383735; 
 Tue, 09 Jun 2020 00:06:23 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([61.68.71.10])
 by smtp.gmail.com with ESMTPSA id 9sm1545615pju.1.2020.06.09.00.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 00:06:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/7] powerpc/security: re-name count cache flush to branch
 cache flush
Date: Tue,  9 Jun 2020 17:06:04 +1000
Message-Id: <20200609070610.846703-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200609070610.846703-1-npiggin@gmail.com>
References: <20200609070610.846703-1-npiggin@gmail.com>
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

