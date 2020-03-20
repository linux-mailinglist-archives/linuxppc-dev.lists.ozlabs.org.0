Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A81D18C6C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 06:21:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kBwN2vVNzDrcH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:21:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JUI+wUVQ; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kBrt19N6zDrQg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 16:18:54 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id j20so1976049pjz.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xoZA3SXUairwdsevsTvI8dJewt4/e6ZJ6Wp3eA/jccU=;
 b=JUI+wUVQXZcAmTchZiJnq5mbKgq/B0whvR9QAxvDWXMYvEkYSEtjF8clJc8UI0k9VY
 tG3T2bozzdc2Owzl/ElFKDDu9kgXr1BeJGhGm+TJ0O0Qo6hxU3ON+0rTXCwrd4LWwFDt
 4hB6u/TwR3MsmiOXwJr5vbMRBSBggFyURovzYC8dERz71UgDTPueznvlLpSr39Ev5sbA
 fTaMS7vrhjAU0XAIROl5BNmxhXVV3ihRnARdhZ3AbSJCvA5T60SPmN9A3kY8JTwGEJMy
 RpCrwdoqtsiEsHf5/ySwfpd0bmc52tDiLsdv/tlB6l1ti9DHzdy2xqIvfHq+trhdSb++
 KuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xoZA3SXUairwdsevsTvI8dJewt4/e6ZJ6Wp3eA/jccU=;
 b=Yd2Z7OOHPYNbal1wo63C4kJYTMg2FBMeu8Mr1tUftft6Qs2Ow9degR3tA0jqVz0R3K
 SubNcU4iRs56qSdyU/8Ij6GBxn4uKpivb5bdh74oYaco0LsueKnHQO7DyFK8rfkdnXN9
 h9Rr1x7LCgFciU+oe09EFn4aXDtJqSvOivg9U3T1cdOWg6tf1d5FbxM3xNRXVE9e2ce5
 hTleQsqAVPCmkvqkVEUsrBc3aJl8HY2upYkf783IZNCfWw4TvCZEW4wH5GOZJOhGvBYA
 poBgsCP5Rv5kY4lqn5ROPiTup1n/3oTRY5HL6cVJav4Z2jopSa7FAZQzpBlhl4pgWM7I
 erVA==
X-Gm-Message-State: ANhLgQ1TeCQ/BfDBC206CVa2VyMLs9+ZzCiSKJ/Y6cZBqHPCo4uAo3Zh
 ACNGBBN1aNOZ9oi42+X+UKTAErBvE9g=
X-Google-Smtp-Source: ADFU+vuwILnKBsWDmB6QmsPLxfaLYSNmPGEfJrBFNEEZzaKbA6BKoiNRVk1MwHSRQzK+iA2Z9mBXjQ==
X-Received: by 2002:a17:90b:19ca:: with SMTP id
 nm10mr7486569pjb.157.1584681531556; 
 Thu, 19 Mar 2020 22:18:51 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id c207sm3988716pfb.47.2020.03.19.22.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 22:18:51 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 01/16] powerpc/xmon: Remove store_inst() for
 patch_instruction()
Date: Fri, 20 Mar 2020 16:17:54 +1100
Message-Id: <20200320051809.24332-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200320051809.24332-1-jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
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
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For modifying instructions in xmon, patch_instruction() can serve the
same role that store_inst() is performing with the advantage of not
being specific to xmon. In some places patch_instruction() is already
being using followed by store_inst(). In these cases just remove the
store_inst(). Otherwise replace store_inst() with patch_instruction().

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: Read into a local variable
---
 arch/powerpc/xmon/xmon.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index e8c84d265602..02e3bd62cab4 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -325,11 +325,6 @@ static inline void sync(void)
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
@@ -881,8 +876,7 @@ static struct bpt *new_breakpoint(unsigned long a)
 	for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
 		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
 			bp->address = a;
-			bp->instr[1] = bpinstr;
-			store_inst(&bp->instr[1]);
+			patch_instruction(&bp->instr[1], bpinstr);
 			return bp;
 		}
 	}
@@ -894,25 +888,26 @@ static struct bpt *new_breakpoint(unsigned long a)
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
@@ -922,7 +917,6 @@ static void insert_bpts(void)
 			bp->enabled &= ~BP_TRAP;
 			continue;
 		}
-		store_inst((void *)bp->address);
 	}
 }
 
@@ -957,8 +951,6 @@ static void remove_bpts(void)
 			(unsigned int *)bp->address, bp->instr[0]) != 0)
 			printf("Couldn't remove breakpoint at %lx\n",
 			       bp->address);
-		else
-			store_inst((void *)bp->address);
 	}
 }
 
-- 
2.17.1

