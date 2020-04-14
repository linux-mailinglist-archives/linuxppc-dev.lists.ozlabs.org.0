Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BBC1A7936
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 13:15:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491jZS6bJHzDqWX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 21:15:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IyIzmXDD; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491jXN5B1LzDqRJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 21:13:22 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id g2so4540848plo.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 04:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JN1UqE6+YpRxsawyrbRFyMn4vRzqFqThSa1A+kyrG+o=;
 b=IyIzmXDDnIi8UmpT6LSqcb6LiMSqzFsL/KxsBAsf0ptE9J9EFJKXnl49SjFGxriGVX
 tjLvXFkdCX0wnI7fe5Gq7UdrG1C19jQDTSqZ6OTlwdxzEkJNPn++LwZKx2Q1vdqdj6d/
 Zy10RKLKk1fKZav9BFvB04dn9AbEROTxP5B5tnNTKZiiIHNZeSFww80O2/Hgy2p4xmFP
 ipb6JDktNwZmlIvdmsW3HUC8gCb2NDSjyKlqB1EvEq9oTPyrwSgKd0g6HrbXC4v8wSD9
 DlUXJmBp8qrCL6ekQqtbG6x6StQTqfPh8shx1qjl4fFLyQp3hUu1uCOMSkmAEA+cneLz
 UbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JN1UqE6+YpRxsawyrbRFyMn4vRzqFqThSa1A+kyrG+o=;
 b=dxgYtBO/8eDd/RHV92zde3omvEtr0PisXr/lbP66z7FVUc/8OM35GTEMQCGDMJ/C40
 OgSQgslg9TDMMuxD5B+dsxVNZ25WE4F+lvH959s2nGryK+TH/i51FdjYPfeb77GNnQLx
 9NKnOVbZD1hOBmQoThLUOTYDdbBLYsRGGVYyXDSr3N6TsJZCzMhwIamrfp1FiYa3VuL/
 zM43euPz+8hO8KBEx3MCpapq2LpJBT8A6n8r09fZ8y8qBFxZO/mEmK1la0muo5dW8SFl
 u3WfRwkih2vW2+Zgbg48DXcU5fuBRbfljgLJvpooB1CKuzK1+TVJ21Gfz91kdAulJPRB
 jYBA==
X-Gm-Message-State: AGi0PuZmY1MxvoQnxGGgpwZIgJ42Jo+5/0l5TzPdIIjLpgf9veMeZOzO
 Oi7bBPHRA9KtxQRzxNu6Rfg=
X-Google-Smtp-Source: APiQypJTyy97hXUH7vlb5EFbV8+CT0KEr49ENndCyCV/dlGiTpAT+FRcLAr9xHW/+45J/ZQYta41kg==
X-Received: by 2002:a17:90a:d596:: with SMTP id
 v22mr26475077pju.169.1586862800008; 
 Tue, 14 Apr 2020 04:13:20 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.18.28.220])
 by smtp.gmail.com with ESMTPSA id u44sm10311030pgn.81.2020.04.14.04.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 04:13:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Fix mtmsr(d) L=1 variant that loses interrupts
Date: Tue, 14 Apr 2020 21:11:31 +1000
Message-Id: <20200414111131.465560-1-npiggin@gmail.com>
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
Cc: qemu-stable@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>, qemu-ppc@nongnu.org,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If mtmsr L=1 sets MSR[EE] while there is a maskable exception pending,
it does not cause an interrupt. This causes the test case to hang:

https://lists.gnu.org/archive/html/qemu-ppc/2019-10/msg00826.html

More recently, Linux reduced the occurance of operations (e.g., rfi)
which stop translation and allow pending interrupts to be processed.
This started causing hangs in Linux boot in long-running kernel tests,
running with '-d int' shows the decrementer stops firing despite DEC
wrapping and MSR[EE]=1.

https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-April/208301.html

The cause is the broken mtmsr L=1 behaviour, which is contrary to the
architecture. From Power ISA v3.0B, p.977, Move To Machine State Register,
Programming Note states:

    If MSR[EE]=0 and an External, Decrementer, or Performance Monitor
    exception is pending, executing an mtmsrd instruction that sets
    MSR[EE] to 1 will cause the interrupt to occur before the next
    instruction is executed, if no higher priority exception exists

Fix this by handling L=1 exactly the same way as L=0, modulo the MSR
bits altered.

The confusion arises from L=0 being "context synchronizing" whereas L=1
is "execution synchronizing", which is a weaker semantic. However this
is not a relaxation of the requirement that these exceptions cause
interrupts when MSR[EE]=1 (e.g., when mtmsr executes to completion as
TCG is doing here), rather it specifies how a pipelined processor can
have multiple instructions in flight where one may influence how another
behaves.

Cc: qemu-stable@nongnu.org
Reported-by: Anton Blanchard <anton@ozlabs.org>
Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Thanks very much to Nathan for reporting and testing it, I added his
Tested-by tag despite a more polished patch, as the the basics are 
still the same (and still fixes his test case here).

This bug possibly goes back to early v2.04 / mtmsrd L=1 support around
2007, and the code has been changed several times since then so may
require some backporting.

32-bit / mtmsr untested at the moment, I don't have an environment
handy.

 target/ppc/translate.c | 46 +++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b207fb5386..9959259dba 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4361,30 +4361,34 @@ static void gen_mtmsrd(DisasContext *ctx)
     CHK_SV;
 
 #if !defined(CONFIG_USER_ONLY)
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
     if (ctx->opcode & 0x00010000) {
-        /* Special form that does not need any synchronisation */
+        /* L=1 form only updates EE and RI */
         TCGv t0 = tcg_temp_new();
+        TCGv t1 = tcg_temp_new();
         tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)],
                         (1 << MSR_RI) | (1 << MSR_EE));
-        tcg_gen_andi_tl(cpu_msr, cpu_msr,
+        tcg_gen_andi_tl(t1, cpu_msr,
                         ~(target_ulong)((1 << MSR_RI) | (1 << MSR_EE)));
-        tcg_gen_or_tl(cpu_msr, cpu_msr, t0);
+        tcg_gen_or_tl(t1, t1, t0);
+
+        gen_helper_store_msr(cpu_env, t1);
         tcg_temp_free(t0);
+        tcg_temp_free(t1);
+
     } else {
         /*
          * XXX: we need to update nip before the store if we enter
          *      power saving mode, we will exit the loop directly from
          *      ppc_store_msr
          */
-        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-            gen_io_start();
-        }
         gen_update_nip(ctx, ctx->base.pc_next);
         gen_helper_store_msr(cpu_env, cpu_gpr[rS(ctx->opcode)]);
-        /* Must stop the translation as machine state (may have) changed */
-        /* Note that mtmsr is not always defined as context-synchronizing */
-        gen_stop_exception(ctx);
     }
+    /* Must stop the translation as machine state (may have) changed */
+    gen_stop_exception(ctx);
 #endif /* !defined(CONFIG_USER_ONLY) */
 }
 #endif /* defined(TARGET_PPC64) */
@@ -4394,15 +4398,23 @@ static void gen_mtmsr(DisasContext *ctx)
     CHK_SV;
 
 #if !defined(CONFIG_USER_ONLY)
-   if (ctx->opcode & 0x00010000) {
-        /* Special form that does not need any synchronisation */
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    if (ctx->opcode & 0x00010000) {
+        /* L=1 form only updates EE and RI */
         TCGv t0 = tcg_temp_new();
+        TCGv t1 = tcg_temp_new();
         tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)],
                         (1 << MSR_RI) | (1 << MSR_EE));
-        tcg_gen_andi_tl(cpu_msr, cpu_msr,
+        tcg_gen_andi_tl(t1, cpu_msr,
                         ~(target_ulong)((1 << MSR_RI) | (1 << MSR_EE)));
-        tcg_gen_or_tl(cpu_msr, cpu_msr, t0);
+        tcg_gen_or_tl(t1, t1, t0);
+
+        gen_helper_store_msr(cpu_env, t1);
         tcg_temp_free(t0);
+        tcg_temp_free(t1);
+
     } else {
         TCGv msr = tcg_temp_new();
 
@@ -4411,9 +4423,6 @@ static void gen_mtmsr(DisasContext *ctx)
          *      power saving mode, we will exit the loop directly from
          *      ppc_store_msr
          */
-        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-            gen_io_start();
-        }
         gen_update_nip(ctx, ctx->base.pc_next);
 #if defined(TARGET_PPC64)
         tcg_gen_deposit_tl(msr, cpu_msr, cpu_gpr[rS(ctx->opcode)], 0, 32);
@@ -4422,10 +4431,9 @@ static void gen_mtmsr(DisasContext *ctx)
 #endif
         gen_helper_store_msr(cpu_env, msr);
         tcg_temp_free(msr);
-        /* Must stop the translation as machine state (may have) changed */
-        /* Note that mtmsr is not always defined as context-synchronizing */
-        gen_stop_exception(ctx);
     }
+    /* Must stop the translation as machine state (may have) changed */
+    gen_stop_exception(ctx);
 #endif
 }
 
-- 
2.23.0

