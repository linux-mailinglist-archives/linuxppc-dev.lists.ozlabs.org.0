Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E82341589C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 06:54:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GsRb3G94zDqHm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 16:54:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SZtgn04t; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gs2l2TNDzDqKV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 16:36:31 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id a6so3797213plm.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 21:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GkNEQKZT+QI/TM9ZLRkQAAAZLJ5bIAZSWEah7FtbSpY=;
 b=SZtgn04t9/32XylnDUFJFFWLHWuqjszULxw2xEcWEjAQ3a0j/2hHdNiBoCxgEOea7S
 0TRoaAowltmHvqiUGeg9CRiDExnaxfg2p9vZCslGUc5hj3kKYHnGQxqJi5h9NzvQ8tGl
 fMlBWkUhD6RIBBTURWlFH8An4po0Hn91WNzCTcubDl63clPbSjYU9n0p26YNZAPG5o9+
 v6C7JUD89rbGbhr/twexIcG1r5v/SDiSwVmHZ8vn/OHC8rwzSnvhQSGCdkdEZZbZEoiA
 30IOZ8xwV+nWmbwVbV6gVvkWotf4gYsoq58getitBsZDAOSgtwbzn6bs98f0nDFmlTBX
 Q2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GkNEQKZT+QI/TM9ZLRkQAAAZLJ5bIAZSWEah7FtbSpY=;
 b=ocyDKQbyxkENcGhlBOrKJtaJgmySHR8+VkWSJozmdBiTYKxTL/qhx473RrWcC3xdsW
 IPMxmE9HlX/zdM5XFmTIoWU7CbOxAAO4aTl7gE9eWuq3tAGz68e2ExzqSY0E6q6BYgx5
 mGrWCHAVdF/9MuZzL8u19Y6MHsLs0yKlkMoHFJ6zIJqmrMJLKJE7Tt+O7iRefVTE3g1O
 aClFy2BtP8Ynpag4kzp3bYqx6WFgx2a5KSTT0jxMwR5ejfCMbPZtnW3aNT40XFC0TALj
 mPA/gfodtok8azE30JQ7ncMsR2OOe7LmapL33/A4CqpDRgJOIjWUHmf5MI2UcZ0gvIOw
 zffQ==
X-Gm-Message-State: APjAAAXpawJgVDUCyUf+dgeHUdNEtXf+71J5eOoFwbJGhUt+Y5YJmONQ
 4nmWNedsp6f2jQ/+Z8UM1ad9lfXtyBVtRQ==
X-Google-Smtp-Source: APXvYqxdbFou/MQAB9GJu6Q3paCr0Gjm/MNRA7o6aTFVfVQQz5MwVHbrYBV/1IsGIk6EIFZB82Tesg==
X-Received: by 2002:a17:90a:8902:: with SMTP id
 u2mr1707208pjn.79.1581399388766; 
 Mon, 10 Feb 2020 21:36:28 -0800 (PST)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id a19sm1189025pju.11.2020.02.10.21.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 21:36:28 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 09/13] powerpc/xmon: Dump prefixed instructions
Date: Tue, 11 Feb 2020 16:33:51 +1100
Message-Id: <20200211053355.21574-10-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211053355.21574-1-jniethe5@gmail.com>
References: <20200211053355.21574-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, mpe@ellerman.id.a,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently when xmon is dumping instructions it reads a word at a time
and then prints that instruction (either as a hex number or by
disassembling it). For prefixed instructions it would be nice to show
its prefix and suffix as together. Use read_instr() so that if a prefix
is encountered its suffix is loaded too. Then print these in the form:
    prefix:suffix
Xmon uses the disassembly routines from GNU binutils. These currently do
not support prefixed instructions so we will not disassemble the
prefixed instructions yet.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: Rename sufx to suffix
---
 arch/powerpc/xmon/xmon.c | 50 +++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 0b085642bbe7..513901ee18b0 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2903,6 +2903,21 @@ prdump(unsigned long adrs, long ndump)
 	}
 }
 
+static bool instrs_are_equal(unsigned long insta, unsigned long suffixa,
+			     unsigned long instb, unsigned long suffixb)
+{
+	if (insta != instb)
+		return false;
+
+	if (!IS_PREFIX(insta) && !IS_PREFIX(instb))
+		return true;
+
+	if (IS_PREFIX(insta) && IS_PREFIX(instb))
+		return suffixa == suffixb;
+
+	return false;
+}
+
 typedef int (*instruction_dump_func)(unsigned long inst, unsigned long addr);
 
 static int
@@ -2911,12 +2926,11 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 {
 	int nr, dotted;
 	unsigned long first_adr;
-	unsigned int inst, last_inst = 0;
-	unsigned char val[4];
+	unsigned int inst, suffix, last_inst = 0, last_suffix = 0;
 
 	dotted = 0;
-	for (first_adr = adr; count > 0; --count, adr += 4) {
-		nr = mread(adr, val, 4);
+	for (first_adr = adr; count > 0; --count, adr += nr) {
+		nr = read_instr(adr, &inst, &suffix);
 		if (nr == 0) {
 			if (praddr) {
 				const char *x = fault_chars[fault_type];
@@ -2924,8 +2938,9 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 			}
 			break;
 		}
-		inst = GETWORD(val);
-		if (adr > first_adr && inst == last_inst) {
+		if (adr > first_adr && instrs_are_equal(inst, suffix,
+							last_inst,
+							last_suffix)) {
 			if (!dotted) {
 				printf(" ...\n");
 				dotted = 1;
@@ -2934,11 +2949,24 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 		}
 		dotted = 0;
 		last_inst = inst;
-		if (praddr)
-			printf(REG"  %.8x", adr, inst);
-		printf("\t");
-		dump_func(inst, adr);
-		printf("\n");
+		last_suffix = suffix;
+		if (IS_PREFIX(inst)) {
+			if (praddr)
+				printf(REG"  %.8x:%.8x", adr, inst, suffix);
+			printf("\t");
+			/*
+			 * Just use this until binutils ppc disassembly
+			 * prints prefixed instructions.
+			 */
+			printf("%.8x:%.8x", inst, suffix);
+			printf("\n");
+		} else {
+			if (praddr)
+				printf(REG"  %.8x", adr, inst);
+			printf("\t");
+			dump_func(inst, adr);
+			printf("\n");
+		}
 	}
 	return adr - first_adr;
 }
-- 
2.17.1

