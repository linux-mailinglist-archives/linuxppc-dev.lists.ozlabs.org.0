Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 398FA6C8E3E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 13:36:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkJV60GXzz3fZ3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 23:36:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hDJNrBr1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hDJNrBr1;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkJL66wNYz3fSX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 23:29:34 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id ix20so4192414plb.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 05:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679747372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upXccQ0m7RyNQSSayQoOkHrCXCXeyS8pm3WAGvKhfnM=;
        b=hDJNrBr1zvZWRNYwwc4KMWknOi6i3e/Y/n67pXSu1dJ0fexioffY/e65uvp7vCkf1P
         WDmZSIGN0cfVb2uEDDLuvrSOOx/kC2i3Qr14jNv/A2beTKWKkBUWr9fVOTKq6x6baLCq
         8EXah7KD6wU52VDl4qqzTL9VXGEdMD/5VOvShnMIYd/ajtz6Y/CG+FjeeiZJuto8Z6EZ
         wWrK5AUU0SXS5SPfC2gOzuBQ9Hm42SS8N6+uu5cfly/eA5b6QxgD4AeOBkLGKLGKqf+x
         da5JhJthQOfZkGanbkZiNq0X8sB44HrO/dntVwtd9Z9uI3UYbQtKZ2SJ2gaR8w1sYoUO
         TlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679747372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upXccQ0m7RyNQSSayQoOkHrCXCXeyS8pm3WAGvKhfnM=;
        b=RvYYCCOEGVP+P7NJxfNs0MkuwNuP3sj10sP8AfKT5yssRF/Z5+2zTA14UpPfDs7QXL
         iAj3GCZXW/bxFrPE3XNXmpZBVEcE5tM12IhsXFC4o67/N8f1sIhrDxzvFnojaD01Y5QL
         qSf85ZZdz4b57nRLR/zofsvS578Adud1CZDbRiFaFKyHoQUOFMxrDrA9BgUd0SpGZg+m
         4Be2p0idEtt5oD3EEu3Z7MJhlmnQrRfircqrY/pUg941rrl+6zeov3pfxthAvJjuaQJu
         7htSU21ow9cekjGWQrMRpA3I5qOnpwZ/xFDsaKsWnnFNh+Wg1ZBrkqYnnZlU1Kl9MBCH
         unvw==
X-Gm-Message-State: AAQBX9fN3kZm4A2JgpS1zNeE3uZb5Bc+u21wdyywSIkWxzTEFgCufmLJ
	bEdNYSemdDPZSu6iMSeal2DTf6EWUWE=
X-Google-Smtp-Source: AKy350aVBb/kOpJtr24Pn/BbPwHFqAqhRZpzZAWYruosjGzLlyv2xib+WgC3bPJdV2t1rkIOHwyktw==
X-Received: by 2002:a17:90b:3eca:b0:237:5a3c:e86c with SMTP id rm10-20020a17090b3eca00b002375a3ce86cmr6681865pjb.24.1679747372408;
        Sat, 25 Mar 2023 05:29:32 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.191])
        by smtp.gmail.com with ESMTPSA id a13-20020a63d20d000000b0050376cedb3asm14923643pgg.24.2023.03.25.05.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 05:29:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 7/8] powerpc: copy_thread don't set _TIF_RESTOREALL
Date: Sat, 25 Mar 2023 22:29:03 +1000
Message-Id: <20230325122904.2375060-8-npiggin@gmail.com>
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

In the kernel user thread path, don't set _TIF_RESTOREALL because
the thread is required to call kernel_execve() before it returns,
which will set _TIF_RESTOREALL if necessary via start_thread().

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt_64.S | 5 +++++
 arch/powerpc/kernel/process.c      | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index a44c8aab63ec..2a059214c1a9 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -748,6 +748,11 @@ _GLOBAL(ret_from_kernel_user_thread)
 #endif
 	bctrl
 	li	r3,0
+	/*
+	 * It does not matter whether this returns via the scv or sc path
+	 * because it returns as execve() and therefore has no calling ABI
+	 * (i.e., it sets registers according to the exec()ed entry point).
+	 */
 	b	.Lsyscall_exit
 
 _GLOBAL(start_kernel_thread)
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 307639948691..4140b25f489f 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1745,7 +1745,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	extern void start_kernel_thread(void);
 	void (*f)(void);
 	unsigned long sp = (unsigned long)task_stack_page(p) + THREAD_SIZE;
-	struct thread_info *ti = task_thread_info(p);
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	int i;
 #endif
@@ -1784,7 +1783,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 #ifdef CONFIG_PPC64
 			childregs->softe = IRQS_ENABLED;
 #endif
-			ti->flags |= _TIF_RESTOREALL;
 			f = ret_from_kernel_user_thread;
 		} else {
 			struct pt_regs *regs = current_pt_regs();
-- 
2.37.2

