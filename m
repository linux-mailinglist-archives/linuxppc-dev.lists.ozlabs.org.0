Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7667D1AF4E9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 22:23:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494PYF0FL8zDrnD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 06:23:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=arista.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256
 header.s=googlenew header.b=Ouqu5zYB; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494PTn4q0LzDqLy
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 06:20:29 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id d17so7134198wrg.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 13:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p0q5MXd4DQ3tM30NHxuzJ2PGrrL0Sa5uoKgnrntXUaw=;
 b=Ouqu5zYB+27KVL5F6AoCVi/+NUwxXy7UhXkXQYwBeTaTxMwoHWdENC6erhaOS+bk23
 6wxn5BBTQkjtYoonkDO6ZZrU8YsIluxo8v++1zONTLgxzvyh8IBGPJ7XKNdapg6rqFTV
 PVZ597rFnzQK0F8G0/jKyMTUJz2enlO1j0f28vGbYilHpr0yyuM237CvVF+U4VbnDdoK
 JRbjWiu5CDBLaXKJfw0v8ifKAUTvxU2S7VlDMBAUrsmHh+z77eRiwYaHUXJMCS0vedOj
 UnqqOb8ULa+Zpgd9LnB1nbxELrj5r8dUZ07Gbj1YrCoblGQbWogPIt2fvH6CGYDvMJZL
 5IGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p0q5MXd4DQ3tM30NHxuzJ2PGrrL0Sa5uoKgnrntXUaw=;
 b=onw0VRdBXlut1NwB18Gef2WzsGKD1+wyrRHb5315rAp0vaovFvYZuRWxWlcTGbC+HB
 wtu/c8tA9s+oGGyRvzVcgap6ZhAr19hR0dhmJVn2ezqbLjyH8hTdtOd1OsYvMQlBp2vG
 e42Ogu3ky8ZnU8HPM1fTTzwrece5Vxnd+dylMRwzKceHY/QjF1I9dTCD1soKlCKpzafk
 lloUbgZgyHHbN+E7ybsO+/BizZuGpOCwGEHWpSQPg4wtoY2LBLLLVTpodQz56EbvzT2S
 vb7leCP8UjLM8oa451/q4HnCjpvk3+YweRoAliE1bLaTymNxUQO4C4nOAP7tG6NFTie3
 D9GQ==
X-Gm-Message-State: AGi0PuaYMHAdE/40KC/wPs4BqTldb8L8fFspKIcsxgr5p5V4Y1bT/2ip
 o0wsqrC4LH2+RpCwmwL3hW8Vzw==
X-Google-Smtp-Source: APiQypIRxMjv5yeY1kroqWRiyqnegsmb6+5PVnvsKHq2n3zLfiuqrFzKY8QalLSgeeBOCQKbbRWhvw==
X-Received: by 2002:adf:b344:: with SMTP id k4mr10080176wrd.76.1587241225661; 
 Sat, 18 Apr 2020 13:20:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id
 m1sm31735255wro.64.2020.04.18.13.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 13:20:25 -0700 (PDT)
From: Dmitry Safonov <dima@arista.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCHv3 26/50] powerpc: Add show_stack_loglvl()
Date: Sat, 18 Apr 2020 21:19:20 +0100
Message-Id: <20200418201944.482088-27-dima@arista.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200418201944.482088-1-dima@arista.com>
References: <20200418201944.482088-1-dima@arista.com>
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
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/powerpc/kernel/process.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 9c21288f8645..6ad438d59796 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2068,7 +2068,8 @@ unsigned long get_wchan(struct task_struct *p)
 
 static int kstack_depth_to_print = CONFIG_PRINT_STACK_DEPTH;
 
-void show_stack(struct task_struct *tsk, unsigned long *stack)
+void show_stack_loglvl(struct task_struct *tsk, unsigned long *stack,
+		       const char *loglvl)
 {
 	unsigned long sp, ip, lr, newsp;
 	int count = 0;
@@ -2093,7 +2094,7 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
 	}
 
 	lr = 0;
-	printk("Call Trace:\n");
+	printk("%sCall Trace:\n", loglvl);
 	do {
 		if (!validate_sp(sp, tsk, STACK_FRAME_OVERHEAD))
 			break;
@@ -2102,7 +2103,8 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
 		newsp = stack[0];
 		ip = stack[STACK_FRAME_LR_SAVE];
 		if (!firstframe || ip != lr) {
-			printk("["REG"] ["REG"] %pS", sp, ip, (void *)ip);
+			printk("%s["REG"] ["REG"] %pS",
+				loglvl, sp, ip, (void *)ip);
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 			ret_addr = ftrace_graph_ret_addr(current,
 						&ftrace_idx, ip, stack);
@@ -2124,8 +2126,9 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
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
 
@@ -2135,6 +2138,11 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
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
2.26.0

