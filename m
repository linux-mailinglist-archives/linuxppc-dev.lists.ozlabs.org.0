Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9454829CFD8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 12:57:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLnBk5MvzzDqST
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 22:57:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=0kpd=ed=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLn8x5gTSzDqQ8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 22:56:17 +1100 (AEDT)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A727C246DE;
 Wed, 28 Oct 2020 11:56:14 +0000 (UTC)
Received: from rostedt by gandalf.local.home with local (Exim 4.94)
 (envelope-from <rostedt@goodmis.org>)
 id 1kXk3p-005ZIX-8X; Wed, 28 Oct 2020 07:56:13 -0400
Message-ID: <20201028115613.140212174@goodmis.org>
User-Agent: quilt/0.66
Date: Wed, 28 Oct 2020 07:52:49 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] kprobes/ftrace: Add recursion protection to the ftrace
 callback
References: <20201028115244.995788961@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-s390@vger.kernel.org,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-parisc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

If a ftrace callback does not supply its own recursion protection and
does not set the RECURSION_SAFE flag in its ftrace_ops, then ftrace will
make a helper trampoline to do so before calling the callback instead of
just calling the callback directly.

The default for ftrace_ops is going to assume recursion protection unless
otherwise specified.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Guo Ren <guoren@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: linux-csky@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 arch/csky/kernel/probes/ftrace.c     | 12 ++++++++++--
 arch/parisc/kernel/ftrace.c          | 13 +++++++++++--
 arch/powerpc/kernel/kprobes-ftrace.c | 11 ++++++++++-
 arch/s390/kernel/ftrace.c            | 13 +++++++++++--
 arch/x86/kernel/kprobes/ftrace.c     | 12 ++++++++++--
 5 files changed, 52 insertions(+), 9 deletions(-)

diff --git a/arch/csky/kernel/probes/ftrace.c b/arch/csky/kernel/probes/ftrace.c
index 5264763d05be..5eb2604fdf71 100644
--- a/arch/csky/kernel/probes/ftrace.c
+++ b/arch/csky/kernel/probes/ftrace.c
@@ -13,16 +13,21 @@ int arch_check_ftrace_location(struct kprobe *p)
 void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 			   struct ftrace_ops *ops, struct pt_regs *regs)
 {
+	int bit;
 	bool lr_saver = false;
 	struct kprobe *p;
 	struct kprobe_ctlblk *kcb;
 
-	/* Preempt is disabled by ftrace */
+	bit = ftrace_test_recursion_trylock();
+	if (bit < 0)
+		return;
+
+	preempt_disable_notrace();
 	p = get_kprobe((kprobe_opcode_t *)ip);
 	if (!p) {
 		p = get_kprobe((kprobe_opcode_t *)(ip - MCOUNT_INSN_SIZE));
 		if (unlikely(!p) || kprobe_disabled(p))
-			return;
+			goto out;
 		lr_saver = true;
 	}
 
@@ -56,6 +61,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 		 */
 		__this_cpu_write(current_kprobe, NULL);
 	}
+out:
+	preempt_enable_notrace();
+	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(kprobe_ftrace_handler);
 
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 4bab21c71055..5f7742b225a5 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -208,13 +208,19 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 {
 	struct kprobe_ctlblk *kcb;
 	struct kprobe *p = get_kprobe((kprobe_opcode_t *)ip);
+	int bit;
 
-	if (unlikely(!p) || kprobe_disabled(p))
+	bit = ftrace_test_recursion_trylock();
+	if (bit < 0)
 		return;
 
+	preempt_disable_notrace();
+	if (unlikely(!p) || kprobe_disabled(p))
+		goto out;
+
 	if (kprobe_running()) {
 		kprobes_inc_nmissed_count(p);
-		return;
+		goto out;
 	}
 
 	__this_cpu_write(current_kprobe, p);
@@ -235,6 +241,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 		}
 	}
 	__this_cpu_write(current_kprobe, NULL);
+out:
+	preempt_enable_notrace();
+	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(kprobe_ftrace_handler);
 
diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
index 972cb28174b2..5df8d50c65ae 100644
--- a/arch/powerpc/kernel/kprobes-ftrace.c
+++ b/arch/powerpc/kernel/kprobes-ftrace.c
@@ -18,10 +18,16 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
 {
 	struct kprobe *p;
 	struct kprobe_ctlblk *kcb;
+	int bit;
 
+	bit = ftrace_test_recursion_trylock();
+	if (bit < 0)
+		return;
+
+	preempt_disable_notrace();
 	p = get_kprobe((kprobe_opcode_t *)nip);
 	if (unlikely(!p) || kprobe_disabled(p))
-		return;
+		goto out;
 
 	kcb = get_kprobe_ctlblk();
 	if (kprobe_running()) {
@@ -52,6 +58,9 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
 		 */
 		__this_cpu_write(current_kprobe, NULL);
 	}
+out:
+	preempt_enable_notrace();
+	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(kprobe_ftrace_handler);
 
diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
index b388e87a08bf..88466d7fb6b2 100644
--- a/arch/s390/kernel/ftrace.c
+++ b/arch/s390/kernel/ftrace.c
@@ -202,13 +202,19 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 {
 	struct kprobe_ctlblk *kcb;
 	struct kprobe *p = get_kprobe((kprobe_opcode_t *)ip);
+	int bit;
 
-	if (unlikely(!p) || kprobe_disabled(p))
+	bit = ftrace_test_recursion_trylock();
+	if (bit < 0)
 		return;
 
+	preempt_disable_notrace();
+	if (unlikely(!p) || kprobe_disabled(p))
+		goto out;
+
 	if (kprobe_running()) {
 		kprobes_inc_nmissed_count(p);
-		return;
+		goto out;
 	}
 
 	__this_cpu_write(current_kprobe, p);
@@ -228,6 +234,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 		}
 	}
 	__this_cpu_write(current_kprobe, NULL);
+out:
+	preempt_enable_notrace();
+	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(kprobe_ftrace_handler);
 
diff --git a/arch/x86/kernel/kprobes/ftrace.c b/arch/x86/kernel/kprobes/ftrace.c
index 681a4b36e9bb..a40a6cdfcca3 100644
--- a/arch/x86/kernel/kprobes/ftrace.c
+++ b/arch/x86/kernel/kprobes/ftrace.c
@@ -18,11 +18,16 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 {
 	struct kprobe *p;
 	struct kprobe_ctlblk *kcb;
+	int bit;
 
-	/* Preempt is disabled by ftrace */
+	bit = ftrace_test_recursion_trylock();
+	if (bit < 0)
+		return;
+
+	preempt_disable_notrace();
 	p = get_kprobe((kprobe_opcode_t *)ip);
 	if (unlikely(!p) || kprobe_disabled(p))
-		return;
+		goto out;
 
 	kcb = get_kprobe_ctlblk();
 	if (kprobe_running()) {
@@ -52,6 +57,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 		 */
 		__this_cpu_write(current_kprobe, NULL);
 	}
+out:
+	preempt_enable_notrace();
+	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(kprobe_ftrace_handler);
 
-- 
2.28.0


