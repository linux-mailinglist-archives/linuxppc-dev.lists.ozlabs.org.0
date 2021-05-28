Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C97B2393E2B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 09:48:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrxdW60bKz30FJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 17:48:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=Ioy3+gdj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Ioy3+gdj; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Frxd21zvzz2yXZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 17:48:19 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id m124so1880921pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 00:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O0+UwnOWvhSyGbBwcAEHiHt/a9TX3pdq1WbWKHN5EuQ=;
 b=Ioy3+gdjVJR/KfLWt23WSFZ2Dx+8j5GXUUC7fJJ5j3y+uqLpXt2el1n3+stYLzsP2j
 wnL4bi9Aig0GwKBHWOvLCJgUlEPauUIB145FdM0Flc2GdziP0E8kfqt/g8iwMM7c526b
 o3rd3YunoOYwtrRitD9sJgwdiNPTnvSkiTXqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O0+UwnOWvhSyGbBwcAEHiHt/a9TX3pdq1WbWKHN5EuQ=;
 b=J7W18+MM5LbiDWJtOZ4yyY3zzf4VmQNIBo2cTr3wCJY5wJaFHpQcBGmEzHkjBg6MTr
 /8Tf23urc9TFp/1dTkFIHxQBg83DmHIwbm3gX6mLM25qRjE2njuUwYrHf3SX1lma50t+
 On4yyFLi0rZezFhA0o+3FXO+FepO3te/lZaN0rc6EOdPmLpCKTjvUbFkssoj39dkbaY6
 2HjpTPkqCbPQiywzrXjx8f/iCqZH73E/ie8odGdM+q5jJr2cZEzI45OFowkHY+WawVIf
 ODmi+inlHGx/PATrWtBFcl8Ip4jcE2Xk55uPOuEzcPAZpy/37lJ9h6PQDewa+Qfc9Eua
 m32g==
X-Gm-Message-State: AOAM533g3P9F3jV2U+ng41TFzcijieeVyZ2sufvULeuUL7N5ibV9YifU
 OnLORsbd0OIPfvxlOelV6w4YlLuHJsZPRg==
X-Google-Smtp-Source: ABdhPJyTr1ocIMHMFCx0LqeziOyVL5kjtNaZ+FYK9S2iAj82/vXJrggoGr61Vw7HBJu8hKS0R2g8JA==
X-Received: by 2002:a05:6a00:24d4:b029:2da:8e01:f07f with SMTP id
 d20-20020a056a0024d4b02902da8e01f07fmr2593270pfv.44.1622188093772; 
 Fri, 28 May 2021 00:48:13 -0700 (PDT)
Received: from localhost ([101.178.215.23])
 by smtp.gmail.com with ESMTPSA id d3sm3713492pfn.141.2021.05.28.00.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 00:48:13 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc: make show_stack's stack walking KASAN-safe
Date: Fri, 28 May 2021 17:48:06 +1000
Message-Id: <20210528074806.1311297-1-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make our stack-walking code KASAN-safe by using READ_ONCE_NOCHECK -
generic code, arm64, s390 and x86 all do this for similar sorts of
reasons: when unwinding a stack, we might touch memory that KASAN has
marked as being out-of-bounds. In ppc64 KASAN development, I hit this
sometimes when checking for an exception frame - because we're checking
an arbitrary offset into the stack frame.

See commit 20955746320e ("s390/kasan: avoid false positives during stack
unwind"), commit bcaf669b4bdb ("arm64: disable kasan when accessing
frame->fp in unwind_frame"), commit 91e08ab0c851 ("x86/dumpstack:
Prevent KASAN false positive warnings") and commit 6e22c8366416
("tracing, kasan: Silence Kasan warning in check_stack of stack_tracer").

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/kernel/process.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 89e34aa273e2..430cf06f9406 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2151,8 +2151,8 @@ void show_stack(struct task_struct *tsk, unsigned long *stack,
 			break;
 
 		stack = (unsigned long *) sp;
-		newsp = stack[0];
-		ip = stack[STACK_FRAME_LR_SAVE];
+		newsp = READ_ONCE_NOCHECK(stack[0]);
+		ip = READ_ONCE_NOCHECK(stack[STACK_FRAME_LR_SAVE]);
 		if (!firstframe || ip != lr) {
 			printk("%s["REG"] ["REG"] %pS",
 				loglvl, sp, ip, (void *)ip);
@@ -2170,17 +2170,19 @@ void show_stack(struct task_struct *tsk, unsigned long *stack,
 		 * See if this is an exception frame.
 		 * We look for the "regshere" marker in the current frame.
 		 */
-		if (validate_sp(sp, tsk, STACK_FRAME_WITH_PT_REGS)
-		    && stack[STACK_FRAME_MARKER] == STACK_FRAME_REGS_MARKER) {
+		if (validate_sp(sp, tsk, STACK_FRAME_WITH_PT_REGS) &&
+		    (READ_ONCE_NOCHECK(stack[STACK_FRAME_MARKER]) ==
+		     STACK_FRAME_REGS_MARKER)) {
 			struct pt_regs *regs = (struct pt_regs *)
 				(sp + STACK_FRAME_OVERHEAD);
 
-			lr = regs->link;
+			lr = READ_ONCE_NOCHECK(regs->link);
 			printk("%s--- interrupt: %lx at %pS\n",
-			       loglvl, regs->trap, (void *)regs->nip);
+			       loglvl, READ_ONCE_NOCHECK(regs->trap),
+			       (void *)READ_ONCE_NOCHECK(regs->nip));
 			__show_regs(regs);
 			printk("%s--- interrupt: %lx\n",
-			       loglvl, regs->trap);
+			       loglvl, READ_ONCE_NOCHECK(regs->trap));
 
 			firstframe = 1;
 		}
-- 
2.27.0

