Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 685011BB3B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:03:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B4g81bQbzDqkD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:03:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uVgsiCFZ; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4ZS2SW0zDqRr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 11:59:12 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id t7so1795756plr.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 18:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aqCfEw3lZA7+z5VKRFd4WnnjWYgZw+dld89p9XVgr4Y=;
 b=uVgsiCFZI5ZDtkY/y0PjfrgawRJXZQW/jyPpm4F/QXc7Z4x3t36qCaLnyQ+UmP/XTL
 SlPE29VpJdSl3yVs8Hi6CXkgezHYLah+AgLo/dVrN1UOvym67ms2JyC2uUl/wx7UEw/q
 edgk59BYltlKDNP0+Gg0PD60ydOKKOfigFHnFTLogsj+o+YP97VRwinWFvpUpnfuPq+p
 PRq+86HyZlrwXfcZH3LIgYTAPaSGYJT9iGeR+FI6euacdESEdLmTleKBytaBX18e86Rk
 15TjPRzuFAP6ctU5ybW7edtAS4oFqgRl7B+oo4/va+tNomN6uvKLVtrWLWuKaFp1s9Os
 0CZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aqCfEw3lZA7+z5VKRFd4WnnjWYgZw+dld89p9XVgr4Y=;
 b=AJ/pXSDi+sIEgav7sJtvmmspSl2IJgtw6aKglXyFQahgNONY7xAvqKJEWHOZeXPVao
 xxrCdL480ekRSN+1rvadahe5ZABvLTYPEd4Gb0zrKDXh5vWip5PBuDCc/57qolsjpgzC
 OrKvvJMnNYs+ucqiZy1U6+3K1ffw/oAj5ocAU+RZUcTohIIL2P1hDOEPHt+zum1RT1Fk
 DM9zU1yzFGZm+2sIAe1pdln6jPKtOjnBifpC4/KwqjE4sq5Bw6qQOacHIbn9dwPGvk5u
 FrkyG8OncUrj7etAvSr6rS8dgx56hj/s/wX5b4oRkqSokGbfqLlnQnFE86aufUvFAYIE
 92lQ==
X-Gm-Message-State: AGi0Pua4FydwFFHTV3r+j6HvyifnOGXQOSZ4PCqomEB/lXLI0mLp0snf
 oCPU+FXuWWBOuzyQuq9fZwcCT4gWER4=
X-Google-Smtp-Source: APiQypLPCthZ9W2sWdsUJVPoUXxVBNMCnq83FuEVebjcOVXeUsM4F4dxgH729AVly3DC4UPP/4oR3g==
X-Received: by 2002:a17:902:8b82:: with SMTP id
 ay2mr27081797plb.285.1588039147889; 
 Mon, 27 Apr 2020 18:59:07 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.18.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 18:59:07 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 01/28] powerpc/xmon: Remove store_inst() for
 patch_instruction()
Date: Tue, 28 Apr 2020 11:57:47 +1000
Message-Id: <20200428015814.15380-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428015814.15380-1-jniethe5@gmail.com>
References: <20200428015814.15380-1-jniethe5@gmail.com>
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

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
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

