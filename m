Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CD21BB40F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:41:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B5W76WbhzDqnk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:41:23 +1000 (AEST)
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
 header.s=20161025 header.b=odGYrD3/; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4cy2lf1zDqGb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 12:01:22 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id z6so7711209plk.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 19:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vmSosdgQYrRsF5d8And7HedZaKiW7VRE1qjr/TTEqPs=;
 b=odGYrD3/X2H1CawlTapTI37IkIAbXMhDzw5bgvUm0tyjqX4L5UcDA6ZAD0nPQsTJfF
 A1vckqbUIUqRk008Qo+yOX8MsSLagpxSY0mOtHRY4MftiF/Y6eIwCoa22bYe9cIfDrFS
 W1p2j2doCFZY7xnhFVYceAtiPfihA1YWGioiwedueOn4TBZXPluQXCNX6npLB4LrJcKo
 G/WUTqgUDjhydY61KC87jNBF3pHX+1vwJYYnSw4aI7MEGys7fUGDtFVZIIgvhFEBfLKw
 6GlLu4FvNYv0DkxIHU+00oxxTHsar8ZFrZ09dvNph700kidfaui8LeJGXJoE8ERyCZmt
 oJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vmSosdgQYrRsF5d8And7HedZaKiW7VRE1qjr/TTEqPs=;
 b=sOEkvme5rjH9fSoA2J0TPMI9rIwy9Xs730TZyBRubBcWiwS+RjokMaLARwTl1Yd2FH
 dCj/nDP7BEi0ZLCTA9j/FUVjZ/rpP7uOg8X8kbuX0TDbWoinHj9Hf+IxFQxyVfkUhEry
 q0GLx1CYiajO6hgQJx+3JcLfT94bLWfDsk+yU3iph2aYb6X6ZWbH/gJ36Nt7kSmw58kK
 sa/H9iOS5pPCNBB+pVuTW12dbNNeTci9GzDA80r+IF7+9Kdz2nY1yuwHEuBuxqiiostp
 FauxPuUtxp0TwwkrYGzb8QdGUNjp2F8Y42tqtRE9d5RN0e10FQcliPTh3P4CnEOqndlL
 Dw6Q==
X-Gm-Message-State: AGi0Puacxuo+aHjmvUn002CUXuRctkVCWCjmp4hAiTtVfndc2lY/deJV
 RFC+EXp4UF0ra2okkxv+uQ871plT/1Y=
X-Google-Smtp-Source: APiQypK1VGwOxg104af63fMe+pw7ZAkRpSArmYfebjCyCd7/C9YyrQVoxO5/SBAXL45idviDzOj24w==
X-Received: by 2002:a17:902:8b82:: with SMTP id
 ay2mr27090312plb.285.1588039279683; 
 Mon, 27 Apr 2020 19:01:19 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.19.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 19:01:19 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 20/28] powerpc: Make test_translate_branch() independent of
 instruction length
Date: Tue, 28 Apr 2020 11:58:06 +1000
Message-Id: <20200428015814.15380-21-jniethe5@gmail.com>
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

test_translate_branch() uses two pointers to instructions within a
buffer, p and q, to test patch_branch(). The pointer arithmetic done on
them assumes a size of 4. This will not work if the instruction length
changes. Instead do the arithmetic relative to the void * to the buffer.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
---
 arch/powerpc/lib/code-patching.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 85ad61aa0304..53b0d5cbc86a 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -570,7 +570,7 @@ static void __init test_branch_bform(void)
 static void __init test_translate_branch(void)
 {
 	unsigned long addr;
-	struct ppc_inst *p, *q;
+	void *p, *q;
 	struct ppc_inst instr;
 	void *buf;
 
@@ -584,7 +584,7 @@ static void __init test_translate_branch(void)
 	addr = (unsigned long)p;
 	patch_branch(p, addr, 0);
 	check(instr_is_branch_to_addr(p, addr));
-	q = p + 1;
+	q = p + 4;
 	translate_branch(&instr, q, p);
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(q, addr));
@@ -640,7 +640,7 @@ static void __init test_translate_branch(void)
 	create_cond_branch(&instr, p, addr, 0);
 	patch_instruction(p, instr);
 	check(instr_is_branch_to_addr(p, addr));
-	q = p + 1;
+	q = buf + 4;
 	translate_branch(&instr, q, p);
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(q, addr));
-- 
2.17.1

