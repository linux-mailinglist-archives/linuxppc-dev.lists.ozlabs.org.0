Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCA2F0D26
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 04:41:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477C4P6HV2zF5Q6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 14:41:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=arista.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.b="Nf5JGZ/v"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477BKy6DmnzDqs1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 14:07:50 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id l3so16113385pgr.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2019 19:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A42sQfdtZGvvJpni2Nb7vaaL0m1YMvpAbCmvF65Mdzo=;
 b=Nf5JGZ/vip8cpITlSsoBa9786IxBla7auOYhFREcClO6iKKT0OjXzSwHV59fzD+2Q6
 IwhkOWOPi1FNiR7brBxHFfA5Gt5QzN/Ya6VO9thrccpKgCTEhXAkgo3DZYsuMpQZcGzs
 G8YqmUbK2DK5MP6l8MQnlNMehEezmP6Ik/aZ7fNZLZfFztlw1377d8iPpShLfE/YZWiT
 FH0GzxhdW/A87Vvoou9rZogo+0Qf+2Bc3CFe8gVTYDG9YUnHsq29MTelAUchDsuxGsqs
 H+kFsPZl+HrcubwVXzmT7oN/6EIH/+hj+0O/VTARA3tsUpOhKjdZrGmM+5chI2gxr7QX
 ee6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A42sQfdtZGvvJpni2Nb7vaaL0m1YMvpAbCmvF65Mdzo=;
 b=bOutvi+LPmRBtoIcO9fIvejVa16+zzZQPUpOiO97ByD/aGpDbJXfpB8qmO5JNVcX6O
 u4rR2Q2ZmZ9T1ZWkwtYZqZg5jB/6k3wCOTyUOh7ZBH0UgY4gJ1+/inFCqUANG3zEpfZM
 /qRZyR+ZhIBzHAhnVbGq+vm28RaVogLgoGSmF0Pl+E/bYi9tnwrAQQSCAa+9dHQbE9Ut
 jq61/vxD8ztPg2b93r8DJTjVphHXSHhVLe+aLW5WDKkBo2E66hAE/DMhhnN8lS8iuSD7
 yOqEve2gdKG0MueWUZc7f81NFB7eCjAnAWejyIgeFiVgArmOMSNbVxwYy6RAF7F32hkJ
 6yeg==
X-Gm-Message-State: APjAAAXaX2Eoxa9AIOzLHvDKnI3JA2Dq8xMiipB+swvFMiNeRlF4Naq0
 iPPNNIZ78P+DdkkThE0Kv2JXfg==
X-Google-Smtp-Source: APXvYqyYY7aG4uJ1aEuuexdWlbBTCRur/Byf7xyppq3DhY1cc29CyH3Dmh0y0d0cvxhW2psMqzHzrQ==
X-Received: by 2002:a65:49c7:: with SMTP id t7mr161066pgs.431.1573009668489;
 Tue, 05 Nov 2019 19:07:48 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id k24sm19570487pgl.6.2019.11.05.19.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 19:07:47 -0800 (PST)
From: Dmitry Safonov <dima@arista.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 26/50] powerpc: Add show_stack_loglvl()
Date: Wed,  6 Nov 2019 03:05:17 +0000
Message-Id: <20191106030542.868541-27-dima@arista.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106030542.868541-1-dima@arista.com>
References: <20191106030542.868541-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Nov 2019 14:35:14 +1100
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
Cc: Petr Mladek <pmladek@suse.com>, Dmitry Safonov <dima@arista.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Jiri Slaby <jslaby@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, the log-level of show_stack() depends on a platform
realization. It creates situations where the headers are printed with
lower log level or higher than the stacktrace (depending on
a platform or user).

Furthermore, it forces the logic decision from user to an architecture
side. In result, some users as sysrq/kdb/etc are doing tricks with
temporary rising console_loglevel while printing their messages.
And in result it not only may print unwanted messages from other CPUs,
but also omit printing at all in the unlucky case where the printk()
was deferred.

Introducing log-level parameter and KERN_UNSUPPRESSED [1] seems
an easier approach than introducing more printk buffers.
Also, it will consolidate printings with headers.

Introduce show_stack_loglvl(), that eventually will substitute
show_stack().

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
[1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/powerpc/kernel/process.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 639ceae7da9d..34b46680a196 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2028,7 +2028,8 @@ unsigned long get_wchan(struct task_struct *p)
 
 static int kstack_depth_to_print = CONFIG_PRINT_STACK_DEPTH;
 
-void show_stack(struct task_struct *tsk, unsigned long *stack)
+void show_stack_loglvl(struct task_struct *tsk, unsigned long *stack,
+		       const char *loglvl)
 {
 	unsigned long sp, ip, lr, newsp;
 	int count = 0;
@@ -2053,7 +2054,7 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
 	}
 
 	lr = 0;
-	printk("Call Trace:\n");
+	printk("%sCall Trace:\n", loglvl);
 	do {
 		if (!validate_sp(sp, tsk, STACK_FRAME_OVERHEAD))
 			break;
@@ -2062,7 +2063,8 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
 		newsp = stack[0];
 		ip = stack[STACK_FRAME_LR_SAVE];
 		if (!firstframe || ip != lr) {
-			printk("["REG"] ["REG"] %pS", sp, ip, (void *)ip);
+			printk("%s["REG"] ["REG"] %pS",
+				loglvl, sp, ip, (void *)ip);
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 			ret_addr = ftrace_graph_ret_addr(current,
 						&ftrace_idx, ip, stack);
@@ -2084,8 +2086,9 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
 			struct pt_regs *regs = (struct pt_regs *)
 				(sp + STACK_FRAME_OVERHEAD);
 			lr = regs->link;
-			printk("--- interrupt: %lx at %pS\n    LR = %pS\n",
-			       regs->trap, (void *)regs->nip, (void *)lr);
+			printk("%s--- interrupt: %lx at %pS\n    LR = %pS\n",
+			       loglvl, regs->trap,
+			       (void *)regs->nip, (void *)lr);
 			firstframe = 1;
 		}
 
@@ -2095,6 +2098,11 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
 	put_task_stack(tsk);
 }
 
+void show_stack(struct task_struct *tsk, unsigned long *stack)
+{
+	show_stack_loglvl(tsk, stack, KERN_DEFAULT);
+}
+
 #ifdef CONFIG_PPC64
 /* Called with hard IRQs off */
 void notrace __ppc64_runlatch_on(void)
-- 
2.23.0

