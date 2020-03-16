Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3FE186F65
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 16:55:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h18y3HjQzDqVB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 02:55:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=arista.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256
 header.s=googlenew header.b=gRc57iMd; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gzX72PtQzDq9T
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 01:41:43 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id d9so8094987plo.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 07:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PrRWtisVKQ94pKXrJwec31ZQ/jHPz3Z7raovDWXjHAI=;
 b=gRc57iMdgMfQShHD5ogrtuY1nwAZiA949gwYJ3axoh4dkSv5gQuvh1Vv/0wkrP1Bme
 CHleOLeXuNDpbOZaOPOE+TOQkGJHpYHIxxvsmo7tS87qVo4U8qfnumGodT0CL/IeN1Gp
 Z5roUN/+9ZxdgtFsggMNELdPbbDhA/5webr93q0sXNzLV/IOqZneRxgGQoEb9MCGvpEM
 OHKdsObFtZ4ZFJ6uEbpyk/d/zxC+eGZYYV0Vc3HE6ci3qaDAGw7mHqVwz22y4k6eBSp+
 nFJfgRb0vGYnJVXfawhhzzgA5Mblhi4TwcAHN6C+joc8MenudRLzTL+zt4wmj1m70cMX
 uB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PrRWtisVKQ94pKXrJwec31ZQ/jHPz3Z7raovDWXjHAI=;
 b=TzkwB5e+gfvad1913BYSWajswZg+pOSVZpG8DTRuWSkjVo4PL26+33tETsDceyVcnc
 h8S1bzNMF0UWkfNx9NqObEQsMY4QxbH8rbw2eA/f7uEFckHGMeMRzVw/kr3JLnRQ4QDX
 Ryk7q1yHh8mwXHY6jL/TddAHOmHxIX2hVwIrXc5dqTRO9zQG6FYbmLg0P3jGiDM0wDmy
 EmXeMkTgaoKZjB/X9tOLrqRckzmKihTSC3Z8FZe3q01m8WMmVL1xwXv+VLsdY4FrO2TE
 Bj14cJsieSFPnnY3wbgQGPBG5/PcrWww3yUy+cXrDOHzAmZdVGikLhAFGuh8fayTdvvi
 Ivyg==
X-Gm-Message-State: ANhLgQ1DpIXm4VBYZBNqrxUCYU9K0Lzo1mUo7EVzkD928sQmP6iScfOU
 RU71Wkq/NzS/W96/UlO7h86lYw==
X-Google-Smtp-Source: ADFU+vtZv0iBny86J6iQVSKWaOkHToZN9+OkfUszdLpOg/nq4shB1QMB8Ns0F3xU5tT/5q1A/EU8/A==
X-Received: by 2002:a17:902:724c:: with SMTP id
 c12mr3075274pll.60.1584369699128; 
 Mon, 16 Mar 2020 07:41:39 -0700 (PDT)
Received: from Mindolluin.aristanetworks.com
 ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id i2sm81524pjs.21.2020.03.16.07.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 07:41:38 -0700 (PDT)
From: Dmitry Safonov <dima@arista.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCHv2 26/50] powerpc: Add show_stack_loglvl()
Date: Mon, 16 Mar 2020 14:38:52 +0000
Message-Id: <20200316143916.195608-27-dima@arista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316143916.195608-1-dima@arista.com>
References: <20200316143916.195608-1-dima@arista.com>
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
index fad50db9dcf2..c1ab7f613da4 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2034,7 +2034,8 @@ unsigned long get_wchan(struct task_struct *p)
 
 static int kstack_depth_to_print = CONFIG_PRINT_STACK_DEPTH;
 
-void show_stack(struct task_struct *tsk, unsigned long *stack)
+void show_stack_loglvl(struct task_struct *tsk, unsigned long *stack,
+		       const char *loglvl)
 {
 	unsigned long sp, ip, lr, newsp;
 	int count = 0;
@@ -2059,7 +2060,7 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
 	}
 
 	lr = 0;
-	printk("Call Trace:\n");
+	printk("%sCall Trace:\n", loglvl);
 	do {
 		if (!validate_sp(sp, tsk, STACK_FRAME_OVERHEAD))
 			break;
@@ -2068,7 +2069,8 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
 		newsp = stack[0];
 		ip = stack[STACK_FRAME_LR_SAVE];
 		if (!firstframe || ip != lr) {
-			printk("["REG"] ["REG"] %pS", sp, ip, (void *)ip);
+			printk("%s["REG"] ["REG"] %pS",
+				loglvl, sp, ip, (void *)ip);
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 			ret_addr = ftrace_graph_ret_addr(current,
 						&ftrace_idx, ip, stack);
@@ -2090,8 +2092,9 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
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
 
@@ -2101,6 +2104,11 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
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
2.25.1

