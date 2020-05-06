Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6291C666C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 05:45:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H2Yg0CGjzDqgb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 13:45:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Rph7K9RP; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2Tv1KJxzDqZq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:42:26 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id j21so491922pgb.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zM8HZjHEVYKlUHMQMyHIySq1CGHIchwmn++FrCk25UU=;
 b=Rph7K9RPeAHmu+9XfaVtRSID1oi2nJKKBiuDHdKnPqSgDbX8VrWoNgdUckv8qlnOYk
 HKggkdteFOkgn2+BVar6Ih39pgAX2DSNecY95Jm4v0Hp6YzUB1jIW8zRRgbW/mDGROdx
 CEmcCfcwPFyYuTbl7MZtOAi6TwPlGY5spekY3smZi/3z0g/iGiN8AR4MpUStwLU4Zasg
 vqoUQ7e51s4rKTf537n3mF/zxmNF14gSssj0ZOla0hsQu+e7pBaVF9zIDItpc72sV9KH
 O+Iaib7+D8r4nglLwj0IBUPtTBfWMMZTyMjrd2L5s6a3htKHf3TKtvkZzWLaqveMHq3q
 Bwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zM8HZjHEVYKlUHMQMyHIySq1CGHIchwmn++FrCk25UU=;
 b=tF4HLxEoOoQVczQkuGzb/vvWpl3efP8BvefJCMYY2rGDQdl8Ok2e3YDt4odv7Z71LL
 +oFjl6hWUz7AzKsCZXaoHNjiwQL1fi8AvJ9PgABfVypVbh4TlpjFhntQ9NmQDR6ATGn+
 FrMszrTKH6U5lBgNjhS0oiuNDLtnQpRVwP0nB78zZPOwaL1/S9c+k4GqNe5Q3wr2Zofs
 0u+le+sU5H3QE+8dx6f0r5oEcYOId82BIDianJRrsFfVEzMvQHcAf0VpxvEMa0Y7PGq+
 OWIt9fgx3XrdzvX9vwJCZu3I2pLfZDrYkRHngeirk6bJinhvXEv3dcoE7RA54cbzTJ9i
 yQsg==
X-Gm-Message-State: AGi0PuZS7KY+iD74ZtewcrU2wpRkhnGLsepAIsgV3ahC3+ufq/Pg4fuK
 AjIea9Nih0AsgQXKXQer9ghnNN/58Ihu2A==
X-Google-Smtp-Source: APiQypIe8pu7oa8ulBHA5qhuKgilsx1wN7mzzby14Hatop0MULBtLw4d5ctDcD7AGnqeuZB/1rfocg==
X-Received: by 2002:aa7:9484:: with SMTP id z4mr6398881pfk.144.1588736543442; 
 Tue, 05 May 2020 20:42:23 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:42:22 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 01/30] powerpc/xmon: Remove store_inst() for
 patch_instruction()
Date: Wed,  6 May 2020 13:40:21 +1000
Message-Id: <20200506034050.24806-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
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

