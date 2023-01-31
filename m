Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBE4683340
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 18:02:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5rvp5jdnz3fC4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 04:02:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fT41x56x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fT41x56x;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5rm008Zzz3cNR
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 03:56:00 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id m13so3801607plx.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 08:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfo+8gBitn71FY78nktDeC/vcNsaSUps5A5lrIaA/U4=;
        b=fT41x56xjqZwSa+FhlctaZBPs7yUR9pnhWnr0/bn+WylBlXd1+6b5s05Ldpo3Bgrx1
         tBmeI+Ml4YXyT+gJIN0UdYi4icdvLdlK5PK0kXUGzFBl1b760nuzJDEQfkFQIRazzoib
         YCbchVqAPHUAiKHD+0e83mDGcRJC+033IaOSw14uIhLj7SUtUCh8z8udEm8wHg/Yg3+C
         jdoeAVJi0QxBoo//WmzvlSetzn/rkFHo9SXmCBaBf9KOv8LTXqSCBeDpMBHh0s4L+xR7
         ocvCdm8epQE0JTJST+iE6Thxw3DoWoIYBUPN26xSbnCE7SoFgv5cPjKXAUUBXF9R3JVn
         HgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfo+8gBitn71FY78nktDeC/vcNsaSUps5A5lrIaA/U4=;
        b=Asmz5UjLB+MLyZMkGlQXrAQxwvE42b+Crz/MWmq+cdmRpZDSljHfZOfpthUd40KRUw
         Spo5Qh+dbaoxCBdKVp7rGKKLsq3xKcycFmjcnunXyL5YZs4mbCr7ITkICwqQn6FVgqtc
         RF7+afai3TUE5IgFv8POd8uusboIZR9AUGiZKkLCFGO5uUk8/cgwK4IrWrz3tDw3r11i
         tyucp5d0CoVxKL4XV5DVFsudD+wdy6G6LHuLcWUrMp+LY16AutwFsAjKKRitNI9s2YF3
         Sk6DUskr0z2w1ZtNQqpHVtVmZXz2d/zokkigK1qF8pwhuer3fjeVsdfZ8jydFiCe+VEg
         Ntyw==
X-Gm-Message-State: AO0yUKWGGdcwt/dClmxamGTleB55sAPnjta6mTjho0zVgbgr9jV4Ig0V
	sCRml2JWDmm3NfBIXAM/rmO9Aqdo0O4=
X-Google-Smtp-Source: AK7set8D2eDqpTKj0N0jESavkW9W0W88ysQK6Nd9XrEN2gFyWXcSAPdcv84EyRMuvl8NmE01flbqrQ==
X-Received: by 2002:a17:90a:728c:b0:22c:8ba9:4ce8 with SMTP id e12-20020a17090a728c00b0022c8ba94ce8mr11078676pjg.15.1675184159123;
        Tue, 31 Jan 2023 08:55:59 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([203.194.37.234])
        by smtp.gmail.com with ESMTPSA id bk7-20020a17090b080700b00223f495dc28sm9029371pjb.14.2023.01.31.08.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 08:55:58 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 7/8] powerpc: copy_thread don't set _TIF_RESTOREALL
Date: Wed,  1 Feb 2023 02:55:33 +1000
Message-Id: <20230131165534.601490-8-npiggin@gmail.com>
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

In the kernel user thread path, don't set _TIF_RESTOREALL because the
thread is required to call kernel_execve() before it returns, which will
set _TIF_RESTOREALL if necessary via start_thread().

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt_64.S | 5 +++++
 arch/powerpc/kernel/process.c      | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 90370b89905b..f53012254fca 100644
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
index 53215cdb19dd..e67597fd998f 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1746,7 +1746,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	extern void start_kernel_thread(void);
 	void (*f)(void);
 	unsigned long sp = (unsigned long)task_stack_page(p) + THREAD_SIZE;
-	struct thread_info *ti = task_thread_info(p);
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	int i;
 #endif
@@ -1786,7 +1785,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 #ifdef CONFIG_PPC64
 			childregs->softe = IRQS_ENABLED;
 #endif
-			ti->flags |= _TIF_RESTOREALL;
 			f = ret_from_kernel_user_thread;
 		} else {
 			struct pt_regs *regs = current_pt_regs();
-- 
2.37.2

