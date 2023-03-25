Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B466C8E2B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 13:30:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkJLt5Y56z3fBV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 23:30:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EaefCviK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EaefCviK;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkJKs65Ytz3cfj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 23:29:21 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id c4so2887029pfl.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679747359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOAE0LfC8v9Fabm4DbALlqVBZ7oNXCb+n8WmskpuF0I=;
        b=EaefCviKs7Qh/iwp59UyZREHI/vKEHpRyaq2iox/9MeuY96gkS6kdt6iGiToNPQzaQ
         l7Pk1da+YU7RoCpBkbD3gsxTUdi82ql+PoZ+IdWMz/gBEEfbXY04HVj6jgmVD/EP6UHr
         e3CPlyBMj9XkG0rECXMvpY1jlBAEZNU4V0JfhslLw3EBy76ltMkSws7LDbOOf2GoGxMC
         8DON9HpTm5SQ6cG6v3bIjhJbeF1dh7nYVzEsE1gnuSm4bzphuqYt4lOi5yhJitNWTEc3
         mhDdCQ39Fff8yBEGV89O9RVds2RIu3fKh/43OL2pIpTX4mjXOje97OZLcYX77najcSfw
         tj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679747359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOAE0LfC8v9Fabm4DbALlqVBZ7oNXCb+n8WmskpuF0I=;
        b=Osf+eZmf8kU6ZaxCWRsfHqpxbxOVk0vPbtvG/cN0tovsqyU4Qw8SVhBjoRzsKlc4JU
         BIAFgwxx5wY5xzIa9J4CrEpJ2tiNZ1pHhEM5TqcgzhJprH9pBNz5D/f7ihrh/IteKHmR
         RPvDgx/S6r8ESYFzdt7X7Jv+I1P66jCyOY83q8bZ5wD42j4mEY6kSPZrWPfGyfytKeT3
         UGV5LzRj060rJxsFiPemVTaIUtrQRxDwRpKvXbVe7fob7mwhcIvPBzTUxFYxV0Wyk0oQ
         Fi5GrhCnAMPGpVNlz7P2f7B1aakubXS91uImumbh/CvDRT8n5wySxfirBNPYOTM2mmwk
         VFfA==
X-Gm-Message-State: AAQBX9fMrPe/tjRjrLJbXD24Fwz6Wv8K3LqeVEpZ+pfJs/Jx/Io2MX0H
	ZuGJ7MBc/H+XjF0xO0qbAM6GvvZtgag=
X-Google-Smtp-Source: AKy350YW3C+w8XiYTw4CDeTWCPqwFdZn8sgy1R9VFAIr3LR0JUdjuyqG3ImxvH+uH798QWBHPCa3UQ==
X-Received: by 2002:aa7:958f:0:b0:625:fe95:f120 with SMTP id z15-20020aa7958f000000b00625fe95f120mr6426073pfj.8.1679747359062;
        Sat, 25 Mar 2023 05:29:19 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.191])
        by smtp.gmail.com with ESMTPSA id a13-20020a63d20d000000b0050376cedb3asm14923643pgg.24.2023.03.25.05.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 05:29:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/8] powerpc: copy_thread remove unused pkey code
Date: Sat, 25 Mar 2023 22:28:57 +1000
Message-Id: <20230325122904.2375060-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230325122904.2375060-1-npiggin@gmail.com>
References: <20230325122904.2375060-1-npiggin@gmail.com>
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

The pkey registers (AMR, IAMR) do not get loaded from the switch frame
so it is pointless to save anything there. Remove the dead code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/process.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 4b29ac5ddac6..9b4431651ed5 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1813,6 +1813,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	sp -= STACK_SWITCH_FRAME_SIZE;
 	((unsigned long *)sp)[0] = sp + STACK_SWITCH_FRAME_SIZE;
 	kregs = (struct pt_regs *)(sp + STACK_SWITCH_FRAME_REGS);
+	kregs->nip = ppc_function_entry(f);
 	p->thread.ksp = sp;
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
@@ -1845,17 +1846,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 	p->thread.tidr = 0;
 #endif
-	/*
-	 * Run with the current AMR value of the kernel
-	 */
-#ifdef CONFIG_PPC_PKEY
-	if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
-		kregs->amr = AMR_KUAP_BLOCKED;
-
-	if (mmu_has_feature(MMU_FTR_BOOK3S_KUEP))
-		kregs->iamr = AMR_KUEP_BLOCKED;
-#endif
-	kregs->nip = ppc_function_entry(f);
 	return 0;
 }
 
-- 
2.37.2

