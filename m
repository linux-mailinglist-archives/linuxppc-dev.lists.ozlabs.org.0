Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D1D68331F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 17:58:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5rpm2ygtz3f4h
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 03:58:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fQFsAYQ6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fQFsAYQ6;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5rlp34clz3bWq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 03:55:50 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id cl23-20020a17090af69700b0022c745bfdc3so8458918pjb.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 08:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZXfROAVz8xuTg2PgxztYXr2k4U6VEdE9JD5/iSQhKQ=;
        b=fQFsAYQ6WbCcuynv/0w+99NyElmB1Y4R5Sgit+eqyQKanAaGyW7ApZ4IQlvcUCMqUV
         w+7YxsiS/DU4u4LNBVNHk3gfsSQwZGIB8mHdTAIav8lM9AyHKruwaipNj7BWQgWw0weH
         s8J09qFpkq9e6ewdN94CPGGYN3z6Aoc5wDxbUQRLR/9BFfdZWW0qBRmAxYSpM0sUUGQ0
         lCVnwip9kXgbZ1sa7th9HPDNme6++LC/7JgeE3j68fVHjJTbFmh3CR4CVN57zykdxQhQ
         opDHZPE+5gxAtc5zWxW4/xQSopBM86qDyoWZ1zsMiqI+hwSEg0Nqo0OhkOX6iOrtnJBB
         cIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZXfROAVz8xuTg2PgxztYXr2k4U6VEdE9JD5/iSQhKQ=;
        b=UrzYBmunD01sgFqeUPUExR6A+HWuOaL6SHy7ZGfPs/QREHVeBBEPbYH7vubkjCTFvt
         X8qQkAG7K613ixk1nOrM21bAIJUWFWNo0qGcahWLPKSRZ/NOS5BhDwZzp6cZ72hcdeUT
         kNMNhhd9UXSoHv+226esqK3M1bBmGCPweWdwhhLZwApOpzHJuizi0RcKaK5Z6fKMSNUd
         CiVGwJvzhybR8QDn2CUVHcRSf+PQKz4jaLdeZ/6aXl855JN6zjDAQRAuFhG7uNySUvqX
         H3KYwtUVizJ9p04eOOLya8RUtOeH/KGAWqb+cQzicF1oTLfkSMcAye0SFe7TRQ3XBoer
         eTmA==
X-Gm-Message-State: AO0yUKWzYMfTocAqaglS3iPASzNrb9cJA9wA1NRt3cEJuB4pOXyoE1+n
	1W932RkmSTDn7I/Wjo8bL0QWGv8WfPE=
X-Google-Smtp-Source: AK7set81J+puH6pH6RbMwx8H1qdKcJjl35RCmwAQYjHOwZ/BkIADOujQMDhOzVG6NPV76hLG+EL4AA==
X-Received: by 2002:a17:90b:4c91:b0:22a:33f:fb3d with SMTP id my17-20020a17090b4c9100b0022a033ffb3dmr14359678pjb.48.1675184147696;
        Tue, 31 Jan 2023 08:55:47 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([203.194.37.234])
        by smtp.gmail.com with ESMTPSA id bk7-20020a17090b080700b00223f495dc28sm9029371pjb.14.2023.01.31.08.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 08:55:47 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/8] powerpc: copy_thread make ret_from_fork register setup consistent
Date: Wed,  1 Feb 2023 02:55:28 +1000
Message-Id: <20230131165534.601490-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230131165534.601490-1-npiggin@gmail.com>
References: <20230131165534.601490-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ret_from_fork code for 64e and 32-bit set r3 for
syscall_exit_prepare the same way that 64s does, so there should be no
need to special-case them in copy_thread.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_32.S | 2 +-
 arch/powerpc/kernel/process.c  | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 5604c9a1ac22..755408c63be8 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -183,7 +183,7 @@ syscall_exit_finish:
 ret_from_fork:
 	REST_NVGPRS(r1)
 	bl	schedule_tail
-	li	r3,0
+	li	r3,0	/* fork() return value */
 	b	ret_from_syscall
 
 	.globl	ret_from_kernel_thread
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index ba10505f62c1..dc66ca668b44 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1785,9 +1785,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 			childregs->gpr[1] = usp;
 		((unsigned long *)sp)[0] = childregs->gpr[1];
 		p->thread.regs = childregs;
-		/* 64s sets this in ret_from_fork */
-		if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
-			childregs->gpr[3] = 0;  /* Result from fork() */
 		if (clone_flags & CLONE_SETTLS) {
 			if (!is_32bit_task())
 				childregs->gpr[13] = tls;
-- 
2.37.2

