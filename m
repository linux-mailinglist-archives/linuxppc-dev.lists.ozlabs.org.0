Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5881B10990A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 07:00:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MYCl42SRzDqDl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 17:00:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bzQUHlmh"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MXNr6jQgzDqfp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 16:23:08 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id p24so8569488pfn.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XVZD/4TIX9uKxlCcdJJviukty6/xASQ2Nne5Q5s+0Gs=;
 b=bzQUHlmhuDEhFWOVBwTlEi/mxL+h1BR7GYXY1dI8bdXXHYKLz/lleuEQLTQqs31g5g
 TusI8YXaPWn2T5HVXdSMZVhMwAlpsfM54odgfeUx74X9XwmwE0ByC5aZ5w88kltzbBTO
 fn+xOTHlbRcracCLG7P6qDB6J/dO9ChwHOnwR4/Sbdkd+hXcbj8HdjkIV09ZyBBWjJ4E
 lSobZEfjRYJq0GKeeJEwrRerLcmN9r51GxNk7LHFVDjqau24ndGygd/A+xcio+he4dsr
 2uxyfEl4Byp7uygTfg4TOilDLHZpQI4dmnLLEatCLtsIGeEfCg5eIkUOp3zZCzhRH+S0
 sfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XVZD/4TIX9uKxlCcdJJviukty6/xASQ2Nne5Q5s+0Gs=;
 b=alsi8wE7HzQKjMfCzPvD1O9FaE4C19SXEqYAVq0Q7zjA24KDNKo33xg0DuSqLAWiUP
 18SFGEqqsOVD8H0sWLh9zIE8q/SPZHPpCAA5cKna8sIh633S+0j0wD5yhZPB+G2uZYtR
 p/b4kr/MTBP07/ZsMCNu6l3UxqlrQDWCqYUQ2rXB229tXXOoH9ZhwsMky9nxwWpayTXH
 jsmPkWnIQPF/ZalGkrqiUKsJ6Wy5ep9KyLHDf/8j3K+4F+fnphULaLic2cmycwSzYIVL
 fbF/DcJyMC6USDloGlyT/gPGQuoUa3XvG0Rb6Ok6O3mZ7F3B9d9fb0sMP7mcE+ob9HGh
 kpWw==
X-Gm-Message-State: APjAAAUwD7qVHbB8RXjz+a+zdXeTZIkU6O4+qH4o5e/sCreIsQ33NmDZ
 ueIXbgetSwwu7+u1GYDHFW5Vij9k
X-Google-Smtp-Source: APXvYqz+S2y2GoTmK7jh2qdXIUoEoElvpG9PXeYjLRCyneT9J9bad8uOPuJGWeAG8sjLw4rDKNj29w==
X-Received: by 2002:a65:4085:: with SMTP id t5mr37193330pgp.335.1574745785848; 
 Mon, 25 Nov 2019 21:23:05 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t27sm10657920pfq.169.2019.11.25.21.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 21:23:05 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 18/18] powerpc/fault: Use analyse_instr() to check for store
 with updates to sp
Date: Tue, 26 Nov 2019 16:21:41 +1100
Message-Id: <20191126052141.28009-19-jniethe5@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126052141.28009-1-jniethe5@gmail.com>
References: <20191126052141.28009-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A user-mode access to an address a long way below the stack pointer is
only valid if the instruction is one that would update the stack pointer
to the address accessed. This is checked by directly looking at the
instructions op-code. As a result is does not take into account prefixed
instructions. Instead of looking at the instruction our self, use
analyse_instr() determine if this a store instruction that will update
the stack pointer.

Something to note is that there currently are not any store with update
prefixed instructions. Actually there is no plan for prefixed
update-form loads and stores. So this patch is probably not needed but
it might be preferable to use analyse_instr() rather than open coding
the test anyway.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/mm/fault.c | 39 +++++++++++----------------------------
 1 file changed, 11 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index b5047f9b5dec..cb78b3ca1800 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -41,37 +41,17 @@
 #include <asm/siginfo.h>
 #include <asm/debug.h>
 #include <asm/kup.h>
+#include <asm/sstep.h>
 
 /*
  * Check whether the instruction inst is a store using
  * an update addressing form which will update r1.
  */
-static bool store_updates_sp(unsigned int inst)
+static bool store_updates_sp(struct instruction_op *op)
 {
-	/* check for 1 in the rA field */
-	if (((inst >> 16) & 0x1f) != 1)
-		return false;
-	/* check major opcode */
-	switch (inst >> 26) {
-	case OP_STWU:
-	case OP_STBU:
-	case OP_STHU:
-	case OP_STFSU:
-	case OP_STFDU:
-		return true;
-	case OP_STD:	/* std or stdu */
-		return (inst & 3) == 1;
-	case OP_31:
-		/* check minor opcode */
-		switch ((inst >> 1) & 0x3ff) {
-		case OP_31_XOP_STDUX:
-		case OP_31_XOP_STWUX:
-		case OP_31_XOP_STBUX:
-		case OP_31_XOP_STHUX:
-		case OP_31_XOP_STFSUX:
-		case OP_31_XOP_STFDUX:
+	if (GETTYPE(op->type) == STORE) {
+		if ((op->type & UPDATE) && (op->update_reg == 1))
 			return true;
-		}
 	}
 	return false;
 }
@@ -278,14 +258,17 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
 
 		if ((flags & FAULT_FLAG_WRITE) && (flags & FAULT_FLAG_USER) &&
 		    access_ok(nip, sizeof(*nip))) {
-			unsigned int inst;
+			unsigned int inst, sufx;
+			struct instruction_op op;
 			int res;
 
 			pagefault_disable();
-			res = __get_user_inatomic(inst, nip);
+			res = __get_user_instr_inatomic(inst, sufx, nip);
 			pagefault_enable();
-			if (!res)
-				return !store_updates_sp(inst);
+			if (!res) {
+				analyse_instr(&op, uregs, inst, sufx);
+				return !store_updates_sp(&op);
+			}
 			*must_retry = true;
 		}
 		return true;
-- 
2.20.1

