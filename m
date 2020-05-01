Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B85D1C0CC7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 05:47:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cyqm5B2MzDrKq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 13:47:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r0noUpil; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CylR3hkPzDrLk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:43:31 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id x15so1077024pfa.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zM8HZjHEVYKlUHMQMyHIySq1CGHIchwmn++FrCk25UU=;
 b=r0noUpilxTgQcY3GURSgsgHyScNgri+OeZ7ogLSEaR1SIgDZzjCwlO/ifUBV+QMdof
 yDqoj41tgPVBK9GmmZMFSFLJ6mA3qqpky/oEioRxa51cDrIkxHwVX72ZdciFi0TSX4oO
 mUbpUTtqoN7mXNvEIp7Cgrt8SAsV8FdCZZfoa42lt6gNd1kmU22K/jasRZlSg1vdGq06
 mj6e9AiK6W8oz1V7JinZVfQxDp0xWZDlWqfYdZ1Ul2k81uBapRnzuCtJtyzY3HG+P2wZ
 0yBV4JkfZt/mG8McMv0mrxGo11cRxH518xzSCs81ZquEuRKKXwyUN4W2dc1cL0epDbBz
 bKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zM8HZjHEVYKlUHMQMyHIySq1CGHIchwmn++FrCk25UU=;
 b=OErH5JqN5S2SHhFpS9KbVliUlK0ujQo2Or5Ztz1Nr9YXF7wXy0nTsM86gpsPoew0kP
 8x22FHtUrgrVEsmtqpnhaUYq8XORe6N7bWW+Vp+FcnLVA8Ih+oQcJQVvJ9SnQ7BxXNLX
 rjrHC/YOi5ybgqyFvlGCU5Uw0cBMuDCG4H/nvZFMzrBD4W/3ZZjVL/CIp4Nq5JVfUYV2
 r98vlsV0N/VZcYjH6zR/Z6lMaepTlhHvcW2A7jLVfNjRsfnRwWef5uY4vJM1klWdelrm
 LVxJSx4EgKF3yyXP1AGuYXecpJjESk2MZp9vT1GzvGOidR923h2bo87ND39I0PM8WUlN
 TMlg==
X-Gm-Message-State: AGi0PubyYHV9muPlYNAh7iS6FG+zD/TbTlgygWZMKCuKNRb98triWU8k
 sT4TvWTlmOE4ef/vn1Sa5FAV+t9lYvfa3g==
X-Google-Smtp-Source: APiQypKEKn9DUyUOSs21olRm4hJrO4OHGegmpTv0n8v80TFTlhHnvkLPwxBYFhp6N8aLynEDvPKimw==
X-Received: by 2002:a63:ec4a:: with SMTP id r10mr2238020pgj.227.1588304608990; 
 Thu, 30 Apr 2020 20:43:28 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:43:28 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 01/28] powerpc/xmon: Remove store_inst() for
 patch_instruction()
Date: Fri,  1 May 2020 13:41:53 +1000
Message-Id: <20200501034220.8982-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For modifying instructions in xmon, patch_instruction() can serve the
same role that store_inst() is performing with the advantage of not
being specific to xmon. In some places patch_instruction() is already
being using followed by store_inst(). In these cases just remove the
store_inst(). Otherwise replace store_inst() with patch_instruction().

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: Read into a local variable
---
 arch/powerpc/xmon/xmon.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 7af840c0fc93..f91ae2c9adbe 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -326,11 +326,6 @@ static inline void sync(void)
 	asm volatile("sync; isync");
 }
 
-static inline void store_inst(void *p)
-{
-	asm volatile ("dcbst 0,%0; sync; icbi 0,%0; isync" : : "r" (p));
-}
-
 static inline void cflush(void *p)
 {
 	asm volatile ("dcbf 0,%0; icbi 0,%0" : : "r" (p));
@@ -882,8 +877,7 @@ static struct bpt *new_breakpoint(unsigned long a)
 	for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
 		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
 			bp->address = a;
-			bp->instr[1] = bpinstr;
-			store_inst(&bp->instr[1]);
+			patch_instruction(&bp->instr[1], bpinstr);
 			return bp;
 		}
 	}
@@ -895,25 +889,26 @@ static struct bpt *new_breakpoint(unsigned long a)
 static void insert_bpts(void)
 {
 	int i;
+	unsigned int instr;
 	struct bpt *bp;
 
 	bp = bpts;
 	for (i = 0; i < NBPTS; ++i, ++bp) {
 		if ((bp->enabled & (BP_TRAP|BP_CIABR)) == 0)
 			continue;
-		if (mread(bp->address, &bp->instr[0], 4) != 4) {
+		if (mread(bp->address, &instr, 4) != 4) {
 			printf("Couldn't read instruction at %lx, "
 			       "disabling breakpoint there\n", bp->address);
 			bp->enabled = 0;
 			continue;
 		}
-		if (IS_MTMSRD(bp->instr[0]) || IS_RFID(bp->instr[0])) {
+		if (IS_MTMSRD(instr) || IS_RFID(instr)) {
 			printf("Breakpoint at %lx is on an mtmsrd or rfid "
 			       "instruction, disabling it\n", bp->address);
 			bp->enabled = 0;
 			continue;
 		}
-		store_inst(&bp->instr[0]);
+		patch_instruction(bp->instr, instr);
 		if (bp->enabled & BP_CIABR)
 			continue;
 		if (patch_instruction((unsigned int *)bp->address,
@@ -923,7 +918,6 @@ static void insert_bpts(void)
 			bp->enabled &= ~BP_TRAP;
 			continue;
 		}
-		store_inst((void *)bp->address);
 	}
 }
 
@@ -958,8 +952,6 @@ static void remove_bpts(void)
 			(unsigned int *)bp->address, bp->instr[0]) != 0)
 			printf("Couldn't remove breakpoint at %lx\n",
 			       bp->address);
-		else
-			store_inst((void *)bp->address);
 	}
 }
 
-- 
2.17.1

